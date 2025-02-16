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
	checkevent EVENT_MET_REDS_MOM
	iftrue .MetAlready
	writetext RedsMomText1
	waitbutton
	closetext
	setevent EVENT_MET_REDS_MOM
	end
.MetAlready:
	writetext RedsMomText2
	waitbutton
	closetext
	end

RedsHouse1FBookshelf:
	jumpstd PictureBookshelfScript

RedsMomText1:
	text "Hi!"

	para "RED's been away"
	line "for a long time."

	para "He hasn't called"
	line "either, so I have"

	para "no idea where he"
	line "is or what he's"
	cont "been doing."

	para "They say that no"
	line "word is proof that"

	para "he's doing fine,"
	line "but I do worry"
	cont "about him."
	done

RedsMomText2:
	text "I worry about RED"
	line "getting hurt or"

	para "sick, but he's a"
	line "boy. I'm proud"

	para "that he is doing"
	line "what he wants to"

	para "do."
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
	warp_event  2,  7, PALLET_TOWN, 1
	warp_event  3,  7, PALLET_TOWN, 1
	warp_event  7,  0, REDS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  1,  1, BGEVENT_READ, RedsHouse1FBookshelf

	def_object_events
	object_event  5,  3, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsMom, -1
	object_event  5,  1, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RedsMomTestPJ, -1
	object_event  6,  1, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RedsMomTestGoBack, -1
