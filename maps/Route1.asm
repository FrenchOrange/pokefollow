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
	scene_script Route1Noop2Scene, SCENE_ROUTE1_HOOH_APPEARS
	scene_script Route1Noop3Scene, SCENE_ROUTE1_NOOP

	def_callbacks

Route1Noop1Scene:
	end

Route1Noop2Scene:
	end

Route1Noop3Scene:
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
	setflag ENGINE_PLAYER_IS_FEMALE
	loadvar VAR_MOVEMENT, PLAYER_SURF
	special UpdatePlayerSprite
	pause 15
	applymovement PLAYER, Route1ShowObjectMovement
	applymovement PLAYER, PlayerInRiverMovement1
	appear ROUTE1_GYARADOS
	applymovement PLAYER, PlayerInRiverMovement2
	turnobject ROUTE1_GYARADOS, RIGHT	
	applymovement PLAYER, PlayerInRiverMovement3
	clearflag ENGINE_PLAYER_IS_FEMALE
	loadvar VAR_MOVEMENT, PLAYER_NORMAL
	special UpdatePlayerSprite
	applymovement PLAYER, PlayerFallsOffWaterfallMovement
	applymovement PLAYER, Route1HideObjectMovement
	playsound SFX_TACKLE ; find better splash
	waitsfx
	pause 35
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	special FadeOutMusic
	pause 35
	disappear ROUTE1_GYARADOS
	warp PALLET_LAKE, 7, 12
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
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step DOWN
	step RIGHT
	step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step RIGHT
	step UP
	step RIGHT
	step RIGHT
	step UP
PlayerWalksUpMovement:
	step UP
	step_end

PlayerInRiverMovement2:
	step RIGHT
	step_end

PlayerInRiverMovement3:
	step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step RIGHT
	big_step DOWN
	step DOWN
	step RIGHT
	big_step RIGHT
	big_step RIGHT
	step RIGHT
	big_step DOWN
	step_end

PlayerFallsOffWaterfallMovement:
	jump_step DOWN
	slide_step DOWN
	slide_step DOWN
	step_end

Route1_HoOhCutscene:
	applymovement PLAYER, PlayerWalksUpMovement
	checkevent EVENT_MET_HOOH_ROUTE_1
	iftrue HurryToViridianScene
	appear ROUTE1_HO_OH
	applymovement ROUTE1_HO_OH, HoOhFlyAcrossMovement
	applymovement ROUTE1_HO_OH, HoOhFlyAcrossMovement
	pause 15
	cry HO_OH
	disappear ROUTE1_HO_OH
	pause 15
	setevent EVENT_MET_HOOH_ROUTE_1
	end

HurryToViridianScene:
	opentext
	writetext Route1PlayerWalkBackText
	waitbutton
	closetext
	end

HoOhFlyAcrossMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

Route1PlayerWalkBackText:
	text "It's too dangerous"
	line "to head back to"
	cont "PALLET TOWN."

	para "There should be a"
	line "#MON CENTER in"
	cont "VIRIDIAN CITY."

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
	coord_event 29, 28, SCENE_ROUTE1_SPEAROW_FLOCK, Route1_SpearowCutscene
	coord_event 29, 29, SCENE_ROUTE1_SPEAROW_FLOCK, Route1_SpearowCutscene
	coord_event 24, 11, SCENE_ROUTE1_HOOH_APPEARS, Route1_HoOhCutscene
	coord_event 25, 11, SCENE_ROUTE1_HOOH_APPEARS, Route1_HoOhCutscene

	def_bg_events
	bg_event 23,  3, BGEVENT_READ, Route1Sign

	def_object_events
	object_event  7, 28, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route1FruitTree, -1
	object_event 19, 14, SPRITE_SURF_GYARADOS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
	object_event 19, 30, SPRITE_SPEAROW, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
	object_event 18, 30, SPRITE_SPEAROW, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
	object_event 19, 29, SPRITE_SPEAROW, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
	object_event 18, 29, SPRITE_SPEAROW, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
	object_event 32,  7, SPRITE_HO_OH, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
