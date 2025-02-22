	object_const_def
	const REDSHOUSE1F_REDS_MOM

RedsHouse1F_MapScripts:
	def_scene_scripts
	scene_script RedHouse1FNoopScene ; unusable

	def_callbacks

RedHouse1FNoopScene:
	end

RedsMom:
	faceplayer
	opentext
	checkevent EVENT_GOT_STARTER_FROM_OAK
	iftrue .GotStarterMom
	writetext RedsMomText1
	waitbutton
	closetext
	end
.GotStarterMom:
	writetext RedsMomText2
	waitbutton
	closetext
	end

RedsHouse1FBookshelf:
	jumpstd PictureBookshelfScript

RedsMomText1:
	text "Oh, <PLAYER>. You"
	line "knew today was an"
	cont "important day, and"

	para "you slept in all"
	line "the same."

	para "Hurry, maybe there"
	line "is still a #MON"
	cont "or two left!"
	done

RedsMomText2:
	text "All boys must"
	line "leave  home one"
	cont "day, that's how"
	cont "things go."

	para "I'll be rooting for"
	line "you, <PLAYER>, just"
	cont "don't go crying to"

	para "your mama if"
	line "things don't go as"
	cont "planned!"
	done

RedsMomTestPJ:
	applymovement PLAYER, RedsHouse1FMovementData_PlayerSpinsClockwiseEndsFacingDown
	setval (PAL_NPC_GREEN << 4)
	special SetPlayerPalette
	loadvar VAR_MOVEMENT, PLAYER_PAJAMA
	applymovement PLAYER, RedsHouse1FMovementData_PlayerSpinsClockwiseEndsFacingDown
	special UpdatePlayerSprite
	end

RedsMomTestGoBack:
	applymovement PLAYER, RedsHouse1FMovementData_PlayerSpinsClockwiseEndsFacingDown
	setval (PAL_NPC_RED << 4)
	special SetPlayerPalette
	loadvar VAR_MOVEMENT, PLAYER_NORMAL
	special UpdatePlayerSprite
	setevent EVENT_GOT_PROPER_CLOTHES
	end

RedsHouse1FMovementData_PlayerSpinsClockwiseEndsFacingDown:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

RedsHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  9, PALLET_TOWN, 1
	warp_event  3,  9, PALLET_TOWN, 1
	warp_event  9,  2, REDS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_READ, RedsHouse1FBookshelf

	def_object_events
	object_event  6,  5, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsMom, -1
	object_event  6,  3, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RedsMomTestPJ, -1
	object_event  7,  3, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RedsMomTestGoBack, -1
