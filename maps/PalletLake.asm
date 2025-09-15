	object_const_def
	const PALLETLAKE_MISTY_FISH
	const PALLETLAKE_ROD
	const PALLETLAKE_MISTY_SCENE
	const PALLETLAKE_MISTY_NORMAL
	const PALLETLAKE_BIKE
	const PALLETLAKE_POKE_BALL1

PalletLake_MapScripts:
	def_scene_scripts
	scene_script PalletLakeMeetMistyScene, SCENE_PALLETLAKE_MEET_MISTY
	scene_script PalletLakeMeetNoopScene, SCENE_PALLETLAKE_NOOP

	def_callbacks

PalletLakeMeetMistyScene:
	sdefer MeetMisty
	setscene SCENE_PALLETLAKE_NOOP
PalletLakeMeetNoopScene:
	end

MeetMisty:
	applymovement PLAYER, PalletLakeHideObjectMovement
	pause 30
	turnobject PALLETLAKE_ROD, LEFT
	turnobject PALLETLAKE_ROD, DOWN
	turnobject PALLETLAKE_ROD, LEFT
	turnobject PALLETLAKE_ROD, DOWN
	turnobject PALLETLAKE_ROD, LEFT
	turnobject PALLETLAKE_ROD, DOWN
	pause 30
	showemote EMOTE_SHOCK, PALLETLAKE_MISTY_FISH, 15
	opentext
	writetext PalletLakeMistyBigCatchtext
	promptbutton
	closetext
	applymovement PALLETLAKE_MISTY_FISH, PalletLakeMistyJumps

	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	playsound SFX_TACKLE ; find better splash
	waitsfx
	applymovement PLAYER, PalletLakeShowObjectMovement
	applymovement PLAYER, PalletLakePlayerMovesIntoPlace
	turnobject FOLLOWER, LEFT
	turnobject PLAYER, UP
	disappear PALLETLAKE_MISTY_FISH
	disappear PALLETLAKE_ROD
	appear PALLETLAKE_MISTY_SCENE
	special FadeInFromBlack

	opentext
	writetext PalletLakeMistyJustaKidtext
	promptbutton
	closetext
	applymovement PALLETLAKE_MISTY_SCENE, PalletLakeMistyMovesToPlayer
	turnobject PLAYER, LEFT
	opentext
	writetext PalletLakeMistyAreYouOKtext
	promptbutton
	closetext
	stopfollow
	playsound SFX_TACKLE
	applymovement PLAYER, PalletLakeMistySlapsPlayer
	opentext
	writetext PalletLakeMistyPoorLittleThingtext
	promptbutton
	closetext
	turnobject PALLETLAKE_MISTY_SCENE, DOWN
	turnobject PLAYER, UP
	opentext
	writetext PalletLakeMistyGoToViridiantext
	promptbutton
	closetext

	pause 15
	cry SPEAROW
	waitsfx
	cry SPEAROW
	waitsfx
	showemote EMOTE_QUESTION, PALLETLAKE_MISTY_SCENE, 15
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	callasm RefreshFollowingCoords
	follow PLAYER, FOLLOWER
	applymovement PLAYER, PalletLakePlayerMovesToBike
	disappear PALLETLAKE_BIKE
	loadvar VAR_MOVEMENT, PLAYER_BIKE
	special UpdatePlayerSprite
;	stowfollower

	turnobject PALLETLAKE_MISTY_SCENE, LEFT
	appear PALLETLAKE_MISTY_NORMAL
	showemote EMOTE_SHOCK, PALLETLAKE_MISTY_NORMAL, 15
	disappear PALLETLAKE_MISTY_SCENE
PalletLakeMisty:
	faceplayer
	applymovement PALLETLAKE_MISTY_NORMAL, PalletLakeMistyJumps
	applymovement PALLETLAKE_MISTY_NORMAL, PalletLakeMistyJumps
	opentext
	writetext PalletLakeMistyThatsMyBiketext
	promptbutton
	closetext
	stopfollow
	setevent EVENT_MET_MISTY_PALLET_LAKE
	clearevent EVENT_MISTY_BIKE_BORROWED
	setmapscene ROUTE_1, SCENE_ROUTE1_HOOH_APPEARS
	end

PalletLakeHideObjectMovement:
	hide_object
	step_end

PalletLakeShowObjectMovement:
	show_object
	step_end

PalletLakeMistyJumps:
	jump_in_place
	step_end

PalletLakePlayerMovesIntoPlace:
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step LEFT
	step_end

PalletLakeMistyMovesToPlayer:
	step DOWN
	step DOWN
	step RIGHT
	step_end
 
PalletLakeMistySlapsPlayer:
	turn_head UP
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

PalletLakePlayerMovesToBike:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

PalletLakeMistyBigCatchtext:
	text "Hey, I got a bite!"

	para "Oh wow, I really"
	line "think this could"
	cont "be a big one!"

	para "ugh.. Ahh!"
	done

PalletLakeMistyJustaKidtext:
	text "Nah…"
	line "It's just a kid."

	para "Oh! And a #MON!"
	done

PalletLakeMistyAreYouOKtext:
	text "Oh, are you okay?"
	line "Hmm? Not you!"
	done

PalletLakeMistyPoorLittleThingtext:
	text "Look at what you've"
	line "done to that poor"
	cont "little thing."

	para "Is it breathing?"
	done

PalletLakeMistyGoToViridiantext:
	text "Well, just don't"
	line "sit there."
	para "It needs a doctor"
	line "right away!"

	para "There's a #MON"
	line "CENTER in VIRIDIAN"
	cont "CITY, not too far"
	cont "from here."

	para "You've got to get"
	line "moving now!"
	done

PalletLakeMistyThatsMyBiketext:
	text "Hey!"

	para "What're you doing?"
	line "That's my bike!"
	done

PalletLakeRepel:
	itemball REPEL

PalletLake_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8, 18, SPRITE_MISTY_FISH, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MET_MISTY_PALLET_LAKE
	object_event  8, 17, SPRITE_MISTY_FISH, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MET_MISTY_PALLET_LAKE
	object_event  8, 18, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
	object_event  9, 20, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalletLakeMisty, EVENT_MISTY_BIKE_BORROWED
	object_event  6, 21, SPRITE_BIKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MET_MISTY_PALLET_LAKE
	object_event 19,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PalletLakeRepel, EVENT_PALLET_LAKE_REPEL
	object_event 19,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PalletLakeRepel, EVENT_PALLET_LAKE_REPEL
	object_event 19,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PalletLakeRepel, EVENT_PALLET_LAKE_REPEL
