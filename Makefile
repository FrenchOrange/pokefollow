roms := \
	pokecrystal.gbc \
	pokecrystal_debug.gbc \

rom_obj := \
	audio.o \
	home.o \
	main.o \
	ram.o \
	data/text/common.o \
	data/maps/map_data.o \
	data/pokemon/dex_entries.o \
	data/pokemon/egg_moves.o \
	data/pokemon/evos_attacks.o \
	engine/movie/credits.o \
	engine/overworld/events.o \
	gfx/misc.o \
	gfx/pics.o \
	gfx/sprites.o \
	gfx/following_sprites.o \
	gfx/tilesets.o \
	lib/mobile/main.o \
	lib/mobile/mail.o

pokecrystal_obj         := $(rom_obj:.o=.o)
pokecrystal_debug_obj   := $(rom_obj:.o=_debug.o)


### Build tools

ifeq (,$(shell which sha1sum))
SHA1 := shasum
else
SHA1 := sha1sum
endif

RGBDS ?=
RGBASM  ?= $(RGBDS)rgbasm
RGBFIX  ?= $(RGBDS)rgbfix
RGBGFX  ?= $(RGBDS)rgbgfx
RGBLINK ?= $(RGBDS)rgblink


### Build targets

.SUFFIXES:
.PHONY: all crystal crystal_debug clean tidy compare tools
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:

all: crystal
crystal:         pokecrystal.gbc
crystal_debug:   pokecrystal_debug.gbc

clean: tidy
	find gfx \
	     \( -name "*.[12]bpp" \
	        -o -name "*.lz" \
	        -o -name "*.gbcpal" \
	        -o -name "*.sgb.tilemap" \) \
	     -delete
	find gfx/pokemon -mindepth 1 \
	     ! -path "gfx/pokemon/unown/*" \
	     \( -name "bitmask.asm" \
	        -o -name "frames.asm" \
	        -o -name "front.animated.tilemap" \
	        -o -name "front.dimensions" \) \
	     -delete

tidy:
	$(RM) $(roms) \
	      $(roms:.gbc=.sym) \
	      $(roms:.gbc=.map) \
	      $(pokecrystal_obj) \
	      $(pokecrystal_debug_obj) \
	      rgbdscheck.o
	$(MAKE) clean -C tools/

compare: $(roms) $(patches)
	@$(SHA1) -c roms.sha1

tools:
	$(MAKE) -C tools/


RGBASMFLAGS = -Q8 -P includes.asm -Weverything -Wnumeric-string=2 -Wtruncation=1
# Create a sym/map for debug purposes if `make` run with `DEBUG=1`
ifeq ($(DEBUG),1)
RGBASMFLAGS += -E
endif

$(pokecrystal_obj):         RGBASMFLAGS +=
$(pokecrystal_debug_obj):   RGBASMFLAGS += -D _DEBUG

rgbdscheck.o: rgbdscheck.asm
	$(RGBASM) -o $@ $<

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tidy tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
preinclude_deps := includes.asm $(shell tools/scan_includes includes.asm)
define DEP
$1: $2 $$(shell tools/scan_includes $2) $(preinclude_deps) | rgbdscheck.o
	$$(RGBASM) $$(RGBASMFLAGS) -o $$@ $$<
endef

# Dependencies for shared objects objects
$(foreach obj, $(pokecrystal_obj), $(eval $(call DEP,$(obj),$(obj:.o=.asm))))
$(foreach obj, $(pokecrystal_debug_obj), $(eval $(call DEP,$(obj),$(obj:_debug.o=.asm))))

endif


pokecrystal_opt         = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
pokecrystal_debug_opt   = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0

%.gbc: $$(%_obj) layout.link
	$(RGBLINK) -n $*.sym -m $*.map -l layout.link -o $@ $(filter %.o,$^)
	$(RGBFIX) $($*_opt) $@
	tools/stadium $@


### LZ compression rules

# Delete this line if you don't care about matching and just want optimal compression.
include gfx/lz.mk

%.lz: %
	tools/lzcomp $(LZFLAGS) -- $< $@


### Pokemon pic animation rules

gfx/pokemon/%/front.animated.2bpp: gfx/pokemon/%/front.2bpp gfx/pokemon/%/front.dimensions
	tools/pokemon_animation_graphics -o $@ $^
gfx/pokemon/%/front.animated.tilemap: gfx/pokemon/%/front.2bpp gfx/pokemon/%/front.dimensions
	tools/pokemon_animation_graphics -t $@ $^
gfx/pokemon/%/bitmask.asm: gfx/pokemon/%/front.animated.tilemap gfx/pokemon/%/front.dimensions
	tools/pokemon_animation -b $^ > $@
gfx/pokemon/%/frames.asm: gfx/pokemon/%/front.animated.tilemap gfx/pokemon/%/front.dimensions
	tools/pokemon_animation -f $^ > $@


### Pokemon and trainer sprite rules

gfx/pokemon/%/back.2bpp: rgbgfx += --columns
gfx/pokemon/%/back.2bpp: gfx/pokemon/%/back.png gfx/pokemon/%/normal.gbcpal
	$(RGBGFX) $(rgbgfx) --colors gbc:$(word 2,$^) -o $@ $<
gfx/pokemon/%/front.2bpp: gfx/pokemon/%/front.png gfx/pokemon/%/normal.gbcpal
	$(RGBGFX) $(rgbgfx) --colors gbc:$(word 2,$^) -o $@ $<
gfx/pokemon/%/normal.gbcpal: gfx/pokemon/%/front.gbcpal gfx/pokemon/%/back.gbcpal
	tools/gbcpal $(tools/gbcpal) $@ $^

gfx/trainers/%.2bpp: rgbgfx += --columns
gfx/trainers/%.2bpp: gfx/trainers/%.png gfx/trainers/%.gbcpal
	$(RGBGFX) $(rgbgfx) --colors gbc:$(word 2,$^) -o $@ $<

# Egg does not have a back sprite, so it only uses front.gbcpal
gfx/pokemon/egg/front.2bpp: gfx/pokemon/egg/front.png gfx/pokemon/egg/front.gbcpal
gfx/pokemon/egg/front.2bpp: rgbgfx += --colors gbc:$(word 2,$^)

# Unown letters share one normal.pal, so they don't already build each normal.gbcpal
$(foreach png, $(wildcard gfx/pokemon/unown_*/front.png),\
	$(eval $(png:.png=.2bpp): $(png) $(png:front.png=normal.gbcpal)))
gfx/pokemon/unown_%/front.2bpp: rgbgfx += --colors gbc:$(@:front.2bpp=normal.gbcpal)


### Misc file-specific graphics rules

gfx/pokemon/fearow/normal.gbcpal: tools/gbcpal += --reverse
gfx/pokemon/farfetch_d/normal.gbcpal: tools/gbcpal += --reverse
gfx/pokemon/scyther/normal.gbcpal: tools/gbcpal += --reverse
gfx/pokemon/jynx/normal.gbcpal: tools/gbcpal += --reverse
gfx/pokemon/porygon/normal.gbcpal: tools/gbcpal += --reverse
gfx/pokemon/porygon2/normal.gbcpal: tools/gbcpal += --reverse

gfx/trainers/swimmer_m.gbcpal: tools/gbcpal += --reverse

gfx/pokemon/egg/unused_front.2bpp: rgbgfx += -Z

gfx/new_game/shrink1.2bpp: rgbgfx += -Z
gfx/new_game/shrink2.2bpp: rgbgfx += -Z

gfx/mail/dragonite.1bpp: tools/gfx += --remove-whitespace
gfx/mail/large_note.1bpp: tools/gfx += --remove-whitespace
gfx/mail/surf_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/flower_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/litebluemail_border.1bpp: tools/gfx += --remove-whitespace

gfx/pokedex/pokedex.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/question_mark.2bpp: rgbgfx += -Z
gfx/pokedex/slowpoke.2bpp: tools/gfx += --trim-whitespace

gfx/pokegear/pokegear.2bpp: rgbgfx += -x2
gfx/pokegear/pokegear_sprites.2bpp: tools/gfx += --trim-whitespace

gfx/title/crystal.2bpp: tools/gfx += --interleave --png=$<
gfx/title/logo.2bpp: rgbgfx += -x 4

gfx/trade/ball.2bpp: tools/gfx += --remove-whitespace
gfx/trade/game_boy.2bpp: tools/gfx += --remove-duplicates --preserve=0x23,0x27
gfx/trade/game_boy_cable.2bpp: gfx/trade/game_boy.2bpp gfx/trade/link_cable.2bpp ; cat $^ > $@

gfx/slots/slots_1.2bpp: tools/gfx += --trim-whitespace
gfx/slots/slots_2.2bpp: tools/gfx += --interleave --png=$<
gfx/slots/slots_3.2bpp: tools/gfx += --interleave --png=$< --remove-duplicates --keep-whitespace --remove-xflip

gfx/card_flip/card_flip_1.2bpp: tools/gfx += --trim-whitespace
gfx/card_flip/card_flip_2.2bpp: tools/gfx += --remove-whitespace

gfx/battle_anims/angels.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/beam.2bpp: tools/gfx += --remove-xflip --remove-yflip --remove-whitespace
gfx/battle_anims/bubble.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/charge.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/egg.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/explosion.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/hit.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/horn.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/lightning.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/misc.2bpp: tools/gfx += --remove-duplicates --remove-xflip
gfx/battle_anims/noise.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/objects.2bpp: tools/gfx += --remove-whitespace --remove-xflip
gfx/battle_anims/pokeball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_anims/reflect.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/rocks.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/skyattack.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/status.2bpp: tools/gfx += --remove-whitespace

gfx/player/chris.2bpp: rgbgfx += -Z
gfx/player/chris_back.2bpp: rgbgfx += -Z

gfx/trainer_card/chris_card.2bpp: rgbgfx += -Z
gfx/trainer_card/leaders.2bpp: tools/gfx += --trim-whitespace

gfx/overworld/chris_fish.2bpp: tools/gfx += --trim-whitespace

gfx/sprites/big_onix.2bpp: tools/gfx += --remove-whitespace --remove-xflip

gfx/battle/dude.2bpp: rgbgfx += -Z

gfx/font/unused_bold_font.1bpp: tools/gfx += --trim-whitespace

gfx/sgb/sgb_border.2bpp: tools/gfx += --trim-whitespace
gfx/sgb/sgb_border.sgb.tilemap: gfx/sgb/sgb_border.bin ; tr < $< -d '\000' > $@


### Catch-all graphics rules

%.2bpp: %.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@ || $$($(RM) $@ && false))

%.1bpp: %.png
	$(RGBGFX) $(rgbgfx) -d1 -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) --depth 1 -o $@ $@ || $$($(RM) $@ && false))

%.gbcpal: %.png
	$(RGBGFX) -p $@ $<
	tools/gbcpal $(tools/gbcpal) $@ $@ || $$($(RM) $@ && false)

%.dimensions: %.png
	tools/png_dimensions $< $@
