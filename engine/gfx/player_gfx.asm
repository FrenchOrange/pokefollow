GetPlayerIcon:
	ld de, ChrisSpriteGFX
	ld b, BANK(ChrisSpriteGFX)
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .got_gfx
	ld de, ChrisPJSpriteGFX
	ld b, BANK(ChrisPJSpriteGFX)
.got_gfx
	ret

GetCardPic:
	ld hl, ChrisCardPic
	ld de, vTiles2 tile $00
	ld bc, $23 tiles
	ld a, BANK(ChrisCardPic)
	call FarCopyBytes
	ld hl, TrainerCardGFX
	ld de, vTiles2 tile $23
	ld bc, 6 tiles
	ld a, BANK(TrainerCardGFX)
	call FarCopyBytes
	ret

ChrisCardPic:
INCBIN "gfx/trainer_card/chris_card.2bpp"

TrainerCardGFX:
INCBIN "gfx/trainer_card/trainer_card.2bpp"

ChrisPic:
INCBIN "gfx/player/chris.2bpp"
