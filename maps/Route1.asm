	object_const_def
	const ROUTE1_FRUIT_TREE
	const ROUTE1_GYARADOS
	const ROUTE1_PIDGEY
	const ROUTE1_SPEAROW1
	const ROUTE1_SPEAROW2
	const ROUTE1_FOLLOWER
	const ROUTE1_SPEAROW3
	const ROUTE1_SPEAROW4
	const ROUTE1_SPEAROW5
	const ROUTE1_SPEAROW6
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
	pause 5
	turnobject PLAYER, DOWN
	showemote EMOTE_QUESTION, PLAYER, 15
	showemote EMOTE_SAD, FOLLOWER, 15
	pause 5
	applymovement FOLLOWER, Route1FollowerRun1
	applymovement PLAYER, Route1PlayerSpin
	playsound SFX_GRASS_RUSTLE
	waitsfx
	pause 15
	applymovement FOLLOWER, Route1FollowerRun2
	silentstowfollower
	appear ROUTE1_FOLLOWER
	pause 15
	applymovement PLAYER, PlayerWalksUpMovement
	readvar VAR_XCOORD
	ifequal 20, .PlayerOnRoute1Coord20
	ifequal 21, .PlayerOnRoute1Coord21
	ifequal 22, .PlayerOnRoute1Coord22
	ifequal 23, .PlayerOnRoute1Coord23
	ifequal 25, .PlayerOnRoute1Coord25
.SpearowSceneCont
	pause 15
	appear ROUTE1_PIDGEY
	applymovement ROUTE1_PIDGEY, PidgeyWalksRight
	pause 5
	turnobject ROUTE1_PIDGEY, LEFT
	pause 5
	turnobject ROUTE1_PIDGEY, UP
	pause 5
	turnobject ROUTE1_PIDGEY, RIGHT
	pause 15
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	showemote EMOTE_SAD, ROUTE1_FOLLOWER, 15
	applymovement ROUTE1_FOLLOWER, FollowerJumpsOffTree
	playsound SFX_JUMP_OVER_LEDGE
	waitsfx
	pause 15
	cry PIDGEY
	follow ROUTE1_FOLLOWER, PLAYER
	applymovement ROUTE1_PIDGEY, PidgeyWalksSpot1
	pause 5
	applymovement ROUTE1_FOLLOWER, FollowerWalksSpot1
	turnobject ROUTE1_PIDGEY, RIGHT
	waitsfx
	cry PIDGEY
	applymovement ROUTE1_PIDGEY, PidgeyWalksSpot2
	pause 5
	applymovement ROUTE1_FOLLOWER, FollowerWalksSpot2
	waitsfx
	cry PIDGEY
	stopfollow
	applymovement ROUTE1_PIDGEY, PidgeyWalksSpot3
	pause 5
	applymovement ROUTE1_FOLLOWER, FollowerWalksSpot3
	playsound SFX_TACKLE
	waitsfx
	pause 5
	applymovement ROUTE1_PIDGEY, PidgeyWalksAway
	disappear ROUTE1_PIDGEY
	pause 15
	appear ROUTE1_SPEAROW1
	pause 15
	waitsfx
	cry SPEAROW
	pause 5
	applymovement ROUTE1_SPEAROW1, SpearowFliesDown1
	turnobject ROUTE1_FOLLOWER, LEFT
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	loadwildmon SPEAROW, 21
	startbattle
	dontrestartmapmusic
	reloadmap
	playmusic MUSIC_KANTO_WILD_BATTLE
	applymovement ROUTE1_SPEAROW1, Spearow1Tackle
	playsound SFX_TACKLE
	waitsfx
	turnobject ROUTE1_FOLLOWER, RIGHT
	applymovement ROUTE1_SPEAROW1, Spearow1Tackle
	playsound SFX_TACKLE
	waitsfx
	turnobject ROUTE1_FOLLOWER, UP
	pause 5
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, PlayerShieldsPikachu
	disappear ROUTE1_FOLLOWER
	pause 5
	waitsfx
	cry SPEAROW
	appear ROUTE1_SPEAROW2
	applymovement ROUTE1_SPEAROW2, SpearowFliesDown2
	pause 5
	applymovement ROUTE1_SPEAROW1, Spearow1Tackle
	playsound SFX_TACKLE
	waitsfx
	turnobject PLAYER, LEFT
	applymovement ROUTE1_SPEAROW2, Spearow2Tackle
	playsound SFX_TACKLE
	waitsfx
	turnobject PLAYER, RIGHT
	applymovement ROUTE1_SPEAROW1, Spearow1Tackle
	playsound SFX_TACKLE
	waitsfx
	turnobject PLAYER, LEFT
	applymovement ROUTE1_SPEAROW2, Spearow2Tackle
	playsound SFX_TACKLE
	waitsfx
	turnobject PLAYER, RIGHT
	follow PLAYER, ROUTE1_SPEAROW1
	applymovement PLAYER, PlayerRunsThroughWoods1
	stopfollow
	applymovement PLAYER, PlayerRunsThroughWoods2
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	waitsfx
	cry SPEAROW
	waitsfx
	cry SPEAROW
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, UP
	pause 15

	changeblock 24, 14, $ab ; bridge
	silentstowfollower
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
	warp PALLET_LAKE, 8, 18
	end


.PlayerOnRoute1Coord20:
	applymovement PLAYER, PlayerInRiverMovement2
.PlayerOnRoute1Coord21:
	applymovement PLAYER, PlayerInRiverMovement2
.PlayerOnRoute1Coord22:
	applymovement PLAYER, PlayerWalksUpToTreeMovement
	applymovement PLAYER, PlayerInRiverMovement2
	sjump .SpearowSceneCont

.PlayerOnRoute1Coord25:
	applymovement PLAYER, PlayerWalksLeftTwiceMovement
.PlayerOnRoute1Coord23:
	applymovement PLAYER, PlayerWalksUpToTreeMovement
	sjump .SpearowSceneCont


Route1FollowerRun1:
	big_step UP
	big_step UP
	turn_head DOWN
	step_end

Route1FollowerRun2:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

Route1PlayerSpin:
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	step_end

PlayerWalksUpToTreeMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

PidgeyWalksRight:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

FollowerJumpsOffTree:
	jump_step LEFT
	turn_head UP
	step_end

PidgeyWalksSpot1:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

FollowerWalksSpot1:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end

PidgeyWalksSpot2:
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	turn_head DOWN
	step_end

FollowerWalksSpot2:
	step LEFT
	step LEFT
	step LEFT
PidgeyWalksAway:
	step UP
	step UP
	step UP
	step_end

PidgeyWalksSpot3:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	turn_head DOWN
	step_end

FollowerWalksSpot3:
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	fix_facing
	jump_step DOWN
	remove_fixed_facing
	step_end

SpearowFliesDown1:
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end

SpearowFliesDown2:
	step DOWN
	step RIGHT
	step DOWN
HoOhPlayerStepDown:
	step DOWN
	turn_head LEFT
	step_end 

Spearow1Tackle:
	fix_facing
	big_step RIGHT
	big_step LEFT
	remove_fixed_facing
	step_end

Spearow2Tackle:
	fix_facing
	big_step LEFT
	big_step RIGHT
	remove_fixed_facing
	step_end

PlayerShieldsPikachu:
	big_step RIGHT
	big_step RIGHT
	big_step UP
	step_end

PlayerRunsThroughWoods1:
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	step_end

PlayerRunsThroughWoods2:
	big_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP 
	step_end

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

PlayerWalksLeftTwiceMovement:
	step LEFT
	step LEFT
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

Route1_HoOhCutscene1:
	follow PLAYER, FOLLOWER
	applymovement PLAYER, HoOhPlayerStepDown	
Route1_HoOhCutscene2:
	checkevent EVENT_MET_HOOH_ROUTE_1
	iftrue HurryToViridianScene
	follow PLAYER, FOLLOWER
	applymovement PLAYER, HoOhPlayerMovesDown
	moveobject ROUTE1_SPEAROW1, 21, 35
	moveobject ROUTE1_SPEAROW2, 23, 35
	appear ROUTE1_SPEAROW1
	appear ROUTE1_SPEAROW2
	applymovement ROUTE1_SPEAROW1, PidgeyWalksAway
	applymovement ROUTE1_SPEAROW2, PidgeyWalksAway
	cry SPEAROW
	pause 5
	applymovement PLAYER, HoOhPlayerMovesUp
	appear ROUTE1_SPEAROW3
	appear ROUTE1_SPEAROW4
	applymovement ROUTE1_SPEAROW3, SpearowFliesDown
	applymovement ROUTE1_SPEAROW4, SpearowFliesDown
	cry SPEAROW
	pause 5
	turnobject PLAYER, DOWN
	appear ROUTE1_SPEAROW5
	appear ROUTE1_SPEAROW6
	applymovement ROUTE1_SPEAROW5, PidgeyWalksAway
	applymovement ROUTE1_SPEAROW6, PidgeyWalksAway
	cry SPEAROW
	pause 15
	followcry
	special FadeOutMusic
	special FadeOutToWhite
	special FadeInFromWhite
	special FadeOutToWhite
	special LoadMapPalettes
	waitsfx
	playsound SFX_THUNDER
	waitsfx
	applymovement PLAYER, HoOhPlayerRunToBridge
	applymovement PLAYER, HoOhPlayerRunToBridge
	disappear ROUTE1_SPEAROW3
	disappear ROUTE1_SPEAROW4
	disappear ROUTE1_SPEAROW5
	disappear ROUTE1_SPEAROW6
	loadvar VAR_MOVEMENT, PLAYER_NORMAL
	special UpdatePlayerSprite
	pause 30
	special FadeInFromWhite
	pause 5
	applymovement PLAYER, PlayerWalksUpMovement
	pause 5
	applymovement PLAYER, PlayerWalksUpMovement
	pause 5
	applymovement PLAYER, PlayerWalksUpMovement
	pause 5
	applymovement PLAYER, PlayerWalksUpMovement
	stopfollow
	applymovement FOLLOWER, PlayerInRiverMovement2
	applymovement FOLLOWER, PlayerWalksUpMovement
	appear ROUTE1_HO_OH
	applymovement ROUTE1_HO_OH, HoOhFlyAcrossMovement
	applymovement ROUTE1_HO_OH, HoOhFlyAcrossMovement
	pause 15
	cry HO_OH
	disappear ROUTE1_HO_OH
	pause 15
	turnobject PLAYER, RIGHT
	turnobject FOLLOWER, LEFT
	setval PIKACHU
	special PlaySlowCry
	pause 5
	stowfollower
	setevent EVENT_MET_HOOH_ROUTE_1
	end

HurryToViridianScene:
	applymovement PLAYER, PlayerWalksUpMovement
	opentext
	writetext Route1PlayerWalkBackText
	waitbutton
	closetext
	end

HoOhPlayerMovesDown:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

HoOhPlayerMovesUp:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

SpearowFliesDown:
	step DOWN
	step DOWN
	step_end

HoOhPlayerRunToBridge:
	step UP
	step UP
	step UP
	step UP 
	step_end

HoOhFlyAcrossMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route1PlayerWalkBackText:
	text "It's too dangerous"
	line "to head back to"
	cont "PALLET TOWN."

	para "There should be a"
	line "#MON CENTER in"
	cont "VIRIDIAN CITY."
	done

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
	coord_event 20, 47, SCENE_ROUTE1_SPEAROW_FLOCK, Route1_SpearowCutscene
	coord_event 21, 47, SCENE_ROUTE1_SPEAROW_FLOCK, Route1_SpearowCutscene
	coord_event 22, 47, SCENE_ROUTE1_SPEAROW_FLOCK, Route1_SpearowCutscene
	coord_event 23, 47, SCENE_ROUTE1_SPEAROW_FLOCK, Route1_SpearowCutscene
	coord_event 25, 47, SCENE_ROUTE1_SPEAROW_FLOCK, Route1_SpearowCutscene

	coord_event 29, 28, SCENE_ROUTE1_HOOH_APPEARS, Route1_HoOhCutscene1
	coord_event 29, 29, SCENE_ROUTE1_HOOH_APPEARS, Route1_HoOhCutscene2
	coord_event 24, 11, SCENE_ROUTE1_HOOH_APPEARS, Route1_HoOhCutscene2
	coord_event 25, 11, SCENE_ROUTE1_HOOH_APPEARS, Route1_HoOhCutscene2

	def_bg_events
	bg_event 23,  3, BGEVENT_READ, Route1Sign

	def_object_events
	object_event  7, 28, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route1FruitTree, -1
	object_event 19, 14, SPRITE_SURF_GYARADOS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
	object_event 18, 37, SPRITE_PIDGEY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_1_PIDGEY
	object_event 18, 29, SPRITE_SPEAROW, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
	object_event 19, 29, SPRITE_SPEAROW, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
	object_event 25, 38, SPRITE_FOLLOWER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
	object_event 26, 17, SPRITE_SPEAROW, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
	object_event 23, 17, SPRITE_SPEAROW, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
	object_event 23, 27, SPRITE_SPEAROW, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
	object_event 26, 27, SPRITE_SPEAROW, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
	object_event 30,  7, SPRITE_HO_OH, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
