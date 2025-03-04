	object_const_def
	const ROUTE1_FRUIT_TREE
	const ROUTE1_GYARADOS
	const ROUTE1_SPEAROW1
	const ROUTE1_SPEAROW2
	const ROUTE1_SPEAROW3
	const ROUTE1_SPEAROW4
	const ROUTE1_HO_OH

Route1_MapScripts:
	def_scene_scripts
	scene_script Route1Noop1Scene, SCENE_ROUTE1_SPEAROW_FLOCK
	scene_script Route1Noop2Scene, SCENE_ROUTE1_NOOP

	def_callbacks

Route1Noop1Scene:
	end

Route1Noop2Scene:
	end

Route1_SpearowCutscene:
	; early on follower runs up a tree and player has to talk to them to continue (wildoff?)
	; init: follower runs into tree?

	; pan to see waterfall
	; turn down to see Spearow closing in

	changeblock 24, 14, $ab ; bridge
	stowfollower
	applymovement FOLLOWER, Route1HideObjectMovement
	applymovement PLAYER, PlayerJumpsInRiverMovement
	applymovement PLAYER, Route1HideObjectMovement
	playsound SFX_TACKLE ; find better splash
	waitsfx
	; change to swim sprite
	pause 15
	applymovement PLAYER, Route1ShowObjectMovement
	applymovement PLAYER, PlayerInRiverMovement1
	appear ROUTE1_GYARADOS
	applymovement PLAYER, PlayerInRiverMovement2
	turnobject ROUTE1_GYARADOS, RIGHT	
	applymovement PLAYER, PlayerInRiverMovement3
	applymovement PLAYER, Route1HideObjectMovement
	playsound SFX_TACKLE ; find better splash
	waitsfx
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	special FadeOutMusic
	pause 35
	disappear ROUTE1_GYARADOS
	warp PALLET_LAKE, 8, 13
	end

Route1HideObjectMovement:
	hide_object
	step_end

Route1ShowObjectMovement:
	show_object
	step_end

PlayerJumpsInRiverMovement:
	jump_step UP
	step_end

PlayerInRiverMovement1:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

PlayerInRiverMovement2:
	step RIGHT
	step_end

PlayerInRiverMovement3:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end




Route1FruitTree:
	fruittree FRUITTREE_ROUTE_1

Route1Sign:
	jumptext Route1SignText

Route1SignText:
	text "ROUTE 1"

	para "PALLET TOWN -"
	line "VIRIDIAN CITY"
	done

Route1_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events
	coord_event  6, 18, SCENE_ROUTE1_SPEAROW_FLOCK, Route1_SpearowCutscene

	def_bg_events
	bg_event 23,  3, BGEVENT_READ, Route1Sign

	def_object_events
	object_event  7, 28, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route1FruitTree, -1
	object_event 19, 14, SPRITE_SURF_GYARADOS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
	object_event 19, 31, SPRITE_SPEAROW, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
	object_event 18, 31, SPRITE_SPEAROW, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
	object_event 19, 30, SPRITE_SPEAROW, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
	object_event 18, 30, SPRITE_SPEAROW, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
	object_event 34,  7, SPRITE_HO_OH, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
