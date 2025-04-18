; sprite ids
; OverworldSprites indexes (see data/sprites/sprites.asm)
	const_def
	const SPRITE_NONE              ; 00
	const SPRITE_CHRIS             ; 01
	const SPRITE_CHRIS_BIKE        ; 02
	const SPRITE_GAMEBOY_KID       ; 03
	const SPRITE_RIVAL             ; 04
	const SPRITE_OAK               ; 05
	const SPRITE_RED               ; 06 (unused)
	const SPRITE_BLUE              ; 07
	const SPRITE_BILL              ; 08
	const SPRITE_ELDER             ; 09
	const SPRITE_CHRIS_PJ          ; 0a
	const SPRITE_KURT              ; 0b
	const SPRITE_JIMMYS_MOM        ; 0c
	const SPRITE_BLAINE            ; 0d
	const SPRITE_PLAYERS_MOM       ; 0e
	const SPRITE_DAISY             ; 0f
	const SPRITE_ELM               ; 10
	const SPRITE_WILL              ; 11
	const SPRITE_FALKNER           ; 12
	const SPRITE_WHITNEY           ; 13
	const SPRITE_BUGSY             ; 14
	const SPRITE_MORTY             ; 15
	const SPRITE_CHUCK             ; 16
	const SPRITE_JASMINE           ; 17
	const SPRITE_PRYCE             ; 18
	const SPRITE_CLAIR             ; 19
	const SPRITE_BROCK             ; 1a
	const SPRITE_KAREN             ; 1b
	const SPRITE_BRUNO             ; 1c
	const SPRITE_MISTY             ; 1d
	const SPRITE_LANCE             ; 1e
	const SPRITE_SURGE             ; 1f
	const SPRITE_ERIKA             ; 20
	const SPRITE_KOGA              ; 21
	const SPRITE_SABRINA           ; 22
	const SPRITE_COOLTRAINER_M     ; 23
	const SPRITE_COOLTRAINER_F     ; 24
	const SPRITE_BUG_CATCHER       ; 25
	const SPRITE_TWIN              ; 26
	const SPRITE_YOUNGSTER         ; 27
	const SPRITE_LASS              ; 28
	const SPRITE_TEACHER           ; 29
	const SPRITE_BEAUTY            ; 2a
	const SPRITE_SUPER_NERD        ; 2b
	const SPRITE_ROCKER            ; 2c
	const SPRITE_POKEFAN_M         ; 2d
	const SPRITE_POKEFAN_F         ; 2e
	const SPRITE_GRAMPS            ; 2f
	const SPRITE_GRANNY            ; 30
	const SPRITE_SWIMMER_GUY       ; 31
	const SPRITE_SWIMMER_GIRL      ; 32
	const SPRITE_BIG_SNORLAX       ; 33
	const SPRITE_SURFING_PIKACHU   ; 34
	const SPRITE_ROCKET            ; 35
	const SPRITE_ROCKET_GIRL       ; 36
	const SPRITE_NURSE             ; 37
	const SPRITE_LINK_RECEPTIONIST ; 38
	const SPRITE_CLERK             ; 39
	const SPRITE_FISHER            ; 3a
	const SPRITE_FISHING_GURU      ; 3b
	const SPRITE_SCIENTIST         ; 3c
	const SPRITE_KIMONO_GIRL       ; 3d
	const SPRITE_SAGE              ; 3e
	const SPRITE_NURSE_WALKING     ; 3f
	const SPRITE_GENTLEMAN         ; 40
	const SPRITE_BLACK_BELT        ; 41
	const SPRITE_RECEPTIONIST      ; 42
	const SPRITE_OFFICER           ; 43
	const SPRITE_JAMES             ; 44
	const SPRITE_ROCKET_SLOWPOKE   ; 45
	const SPRITE_CAPTAIN           ; 46
	const SPRITE_OFFICER_JENNY     ; 47
	const SPRITE_GYM_GUIDE         ; 48
	const SPRITE_SAILOR            ; 49
	const SPRITE_BIKER             ; 4a
	const SPRITE_PHARMACIST        ; 4b
	const SPRITE_MONSTER           ; 4c (unused)
	const SPRITE_CHRIS_SWIM        ; 4d
	const SPRITE_SALESMAN          ; 4e
	const SPRITE_MISTY_FISH        ; 4f
	const SPRITE_BIG_ONIX          ; 50 (unused)
	const SPRITE_N64               ; 51
	const SPRITE_SUDOWOODO         ; 52
	const SPRITE_SURF_LAPRAS       ; 53
	const SPRITE_POKE_BALL         ; 54
	const SPRITE_POKEDEX           ; 55
	const SPRITE_REPORT            ; 56
	const SPRITE_VIRTUAL_BOY       ; 57 (unused)
	const SPRITE_BIKE              ; 58
	const SPRITE_ROCK              ; 59
	const SPRITE_BOULDER           ; 5a
	const SPRITE_SNES              ; 5b (unused)
	const SPRITE_FAMICOM           ; 5c (unused)
	const SPRITE_FRUIT_TREE        ; 5d
	const SPRITE_GOLD_TROPHY       ; 5e
	const SPRITE_SILVER_TROPHY     ; 5f
	const SPRITE_KRIS              ; 60
	const SPRITE_KRIS_BIKE         ; 61 (unused)
	const SPRITE_SUBSTITUTE        ; 62
	const SPRITE_SUICUNE           ; 63
	const SPRITE_ENTEI             ; 64
	const SPRITE_RAIKOU            ; 65
	const SPRITE_JESSIE            ; 66
	const SPRITE_CHRIS_RUN         ; 67
 	const SPRITE_KRIS_RUN          ; 68 (unused)
 	const SPRITE_BLANK             ; 69
	const SPRITE_DODRIO_STATIC     ; 6a
	const SPRITE_SURF_GYARADOS     ; 6b
	const SPRITE_FOLLOWER          ; last
DEF NUM_OVERWORLD_SPRITES EQU const_value - 1

; SpriteMons indexes (see data/sprites/sprite_mons.asm)
	const_next $80
DEF SPRITE_POKEMON EQU const_value
	const SPRITE_BULBASAUR	; Doll
	const SPRITE_CHARMANDER	; Doll
	const SPRITE_SQUIRTLE	; Doll
	const SPRITE_CLEFAIRY	; Doll & OW
	const SPRITE_DIGLETT	; Doll & OW
	const SPRITE_GENGAR	; Doll
	const SPRITE_GEODUDE	; Doll
	const SPRITE_GRIMER	; Doll
	const SPRITE_JIGGLYPUFF	; Doll & OW
	const SPRITE_MACHOP	; Doll & OW
	const SPRITE_MAGIKARP	; Doll
	const SPRITE_ODDISH	; Doll
	const SPRITE_PIKACHU	; Doll
	const SPRITE_POLIWAG	; Doll
	const SPRITE_SHELLDER	; Doll
	const SPRITE_STARYU	; Doll
	const SPRITE_VOLTORB	; Doll
	const SPRITE_WEEDLE	; Doll
	const SPRITE_TENTACOOL	; Doll
	const SPRITE_UNOWN	; Doll
	const SPRITE_PIDGEY     ; OW onward
	const SPRITE_RATTATA
	const SPRITE_SPEAROW
	const SPRITE_SLOWPOKE
	const SPRITE_SLOWBRO
	const SPRITE_DRATINI
	const SPRITE_DRAGONITE
	const SPRITE_POLIWRATH
	const SPRITE_MEOWTH
	const SPRITE_ZUBAT
	const SPRITE_FARFETCH_D
	const SPRITE_KANGASKHAN
	const SPRITE_FEAROW
	const SPRITE_BLISSEY
	const SPRITE_ELECTRODE
	const SPRITE_RHYDON
	const SPRITE_MACHOKE
	const SPRITE_ABRA
	const SPRITE_GYARADOS
	const SPRITE_PSYDUCK
	const SPRITE_NIDORINO
	const SPRITE_PERSIAN
	const SPRITE_NIDORAN_M
	const SPRITE_NIDORAN_F
	const SPRITE_BAYLEEF
	const SPRITE_QUAGSIRE
	const SPRITE_BUTTERFREE
	const SPRITE_MILTANK
	const SPRITE_MURKROW
	const SPRITE_GROWLITHE
	const SPRITE_MOLTRES
	const SPRITE_AMPHAROS
	const SPRITE_HO_OH
	const SPRITE_LUGIA
DEF NUM_POKEMON_SPRITES EQU const_value - SPRITE_POKEMON

; special GetMonSprite values (see engine/overworld/overworld.asm)
	const_next $e0
	const SPRITE_DAY_CARE_MON_1 ; e0
	const SPRITE_DAY_CARE_MON_2 ; e1

; wVariableSprites indexes (see wram.asm)
	const_next $f0
DEF SPRITE_VARS EQU const_value
	const SPRITE_CONSOLE ; f0
	const SPRITE_DOLL_1 ; f1
	const SPRITE_DOLL_2 ; f2
	const SPRITE_BIG_DOLL ; f3
