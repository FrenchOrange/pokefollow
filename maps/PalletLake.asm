	object_const_def
	const ROUTE1_MISTY_FISH
	const ROUTE1_MISTY_ROD
	const ROUTE1_MISTY
	const ROUTE1_BIKE

PalletLake_MapScripts:
	def_scene_scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Scene1 ; SCENE_FINISHED

	def_callbacks

.Scene0:
	sdefer .MeetMisty
	setscene SCENE_FINISHED
.Scene1:
	end

.MeetMisty:
	; applymovement PLAYER, PalletLakeHideObjectMovement
	; applymovement FOLLOWER, PalletLakeHideObjectMovement
	; move down
	; exclamation Misty
	; big catch text
	; disappear ROUTE1_MISTY_ROD
	; jump movement
	; turnobject ROUTE1_MISTY_FISH, DOWN
	; appear ROUTE1_MISTY
	; disappear ROUTE1_MISTY_FISH
	; Misty consternation.
	end

PalletLakeHideObjectMovement:
	hide_object
	step_end

PalletLakeShowObjectMovement:
	show_object
	step_end

PalletLake_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8, 18, SPRITE_MISTY_FISH, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MET_MISTY_PALLET_LAKE
	object_event  8, 17, SPRITE_MISTY_FISH, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MET_MISTY_PALLET_LAKE
	object_event  8, 18, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
	object_event  6, 21, SPRITE_BIKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MET_MISTY_PALLET_LAKE
