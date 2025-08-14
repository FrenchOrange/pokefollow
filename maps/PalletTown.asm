	object_const_def
	const PALLETTOWN_BLUE
	const PALLETTOWN_CHEERLEADER1
	const PALLETTOWN_CHEERLEADER2
	const PALLETTOWN_POKEFAN_F1
	const PALLETTOWN_BUG_CATCHER1
	const PALLETTOWN_BUG_CATCHER2
	const PALLETTOWN_GYM_GUIDE
	const PALLETTOWN_OAK
	const PALLETTOWN_SALESMAN
	const PALLETTOWN_POKEFAN_F2
	const PALLETTOWN_TWIN
	const PALLETTOWN_PLAYERS_MOM
	const PALLETTOWN_LASS
	const PALLETTOWN_FISHER
	const PALLETTOWN_DODRIO

PalletTown_MapScripts:
	def_scene_scripts
	scene_script PalletTownNoop1Scene, SCENE_PALLETTOWN_HURRY_TO_LAB
	scene_script PalletTownNoop2Scene, SCENE_PALLETTOWN_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PalletTownFlypointCallback

PalletTownNoop1Scene:
	end

PalletTownNoop2Scene:
	end

PalletTownFlypointCallback:
	setflag ENGINE_FLYPOINT_PALLET
	endcallback

PalletTown_HurryToLabScene:
	checkevent EVENT_GOT_STARTER_FROM_OAK
	iftrue MomStarterScene
	applymovement PLAYER, PalletTownPlayerMovesBack
	opentext
	writetext PalletTownPlayerWalkBackText
	waitbutton
	closetext
	end

PalletTownPlayerMovesBack:
	turn_head DOWN
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

PalletTownPlayerWalkBackText:
	text "PROF.OAK waits for"
	line "me at the LAB."

	para "I should hurry."
	done

MomStarterScene:
	readvar VAR_XCOORD
	ifequal 18, .PlayerOnLeft
	ifequal 19, .PlayerOnRight
.MomStarterSceneCont
	opentext
	writetext PalletTownWeirdText
	waitbutton
	closetext

	turnobject FOLLOWER, DOWN
	showemote EMOTE_SAD, FOLLOWER, 15
	waitsfx
	followcry
	waitsfx
	special FadeOutToWhite
	special FadeInFromWhite
	special FadeOutToWhite
	special LoadMapPalettes
	special FadeInFromWhite
	playsound SFX_THUNDER
	waitsfx
	applymovement PALLETTOWN_SALESMAN, PalletTownCheerleader1ShovedAside
	applymovement PALLETTOWN_POKEFAN_F2, PalletTownCheerleader2ShovedAside
	applymovement PALLETTOWN_TWIN, PalletTownCheerleader1ShovedAside
	applymovement PALLETTOWN_PLAYERS_MOM, PalletTownCheerleader1ShovedAside
	playsound SFX_TACKLE
	waitsfx
	turnobject PALLETTOWN_SALESMAN, UP
	turnobject PALLETTOWN_TWIN, LEFT
	turnobject PALLETTOWN_POKEFAN_F2, UP
	turnobject PALLETTOWN_PLAYERS_MOM, DOWN
	pause 25
	opentext
	writetext PalletTownUndiesText
	waitbutton
	closetext

	special FadeOutMusic
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear PALLETTOWN_SALESMAN
	disappear PALLETTOWN_POKEFAN_F2
	disappear PALLETTOWN_TWIN
	disappear PALLETTOWN_PLAYERS_MOM
	clearevent EVENT_MOM_AND_OAK_INVISIBLE
	setevent EVENT_GOT_PROPER_CLOTHES
	setscene SCENE_PALLETTOWN_NOOP
	setval (PAL_NPC_RED << 4)
	special SetPlayerPalette
	clearflag ENGINE_PLAYER_IS_FEMALE
	special UpdatePlayerSprite
	pause 35
	special FadeInFromBlack
	special RestartMapMusic
	end

.PlayerOnLeft:
	applymovement FOLLOWER, PalletTownStarterLeft
	applymovement PALLETTOWN_PLAYERS_MOM, PalletTownMomMovesLeft

	opentext
	writetext PalletTownProudOfYouText
	waitbutton
	closetext
	turnobject PALLETTOWN_PLAYERS_MOM, DOWN
	opentext
	writetext PalletTownGoingToMissYouText
	waitbutton
	closetext
	turnobject PALLETTOWN_PLAYERS_MOM, UP
	opentext
	writetext PalletTownIPackedYouText
	waitbutton
	closetext
	followcry
	pause 15
	turnobject PALLETTOWN_PLAYERS_MOM, RIGHT
	pause 15
	applymovement PALLETTOWN_PLAYERS_MOM, PalletTownMomMovesRight
	opentext
	writetext PalletTownThatsYourPokemonText
	waitbutton
	closetext
	turnobject FOLLOWER, RIGHT
	pause 15
	showemote EMOTE_QUESTION, PALLETTOWN_PLAYERS_MOM, 15
	turnobject PALLETTOWN_PLAYERS_MOM, LEFT
	sjump .MomStarterSceneCont

.PlayerOnRight:
	applymovement FOLLOWER, PalletTownStarterRight

	opentext
	writetext PalletTownProudOfYouText
	waitbutton
	closetext
	turnobject PALLETTOWN_PLAYERS_MOM, DOWN
	opentext
	writetext PalletTownGoingToMissYouText
	waitbutton
	closetext
	turnobject PALLETTOWN_PLAYERS_MOM, UP
	opentext
	writetext PalletTownIPackedYouText
	waitbutton
	closetext
	followcry
	pause 15
	turnobject PALLETTOWN_PLAYERS_MOM, LEFT
	pause 15
	applymovement PALLETTOWN_PLAYERS_MOM, PalletTownMomMovesLeft
	opentext
	writetext PalletTownThatsYourPokemonText
	waitbutton
	closetext
	turnobject FOLLOWER, LEFT
	pause 15
	showemote EMOTE_QUESTION, PALLETTOWN_PLAYERS_MOM, 15
	turnobject PALLETTOWN_PLAYERS_MOM, RIGHT
	sjump .MomStarterSceneCont

PalletTownStarterLeft:
	step RIGHT
	step DOWN
	step_end

PalletTownStarterRight:
	step LEFT
	step DOWN
	step_end

PalletTownMomMovesLeft:
	step LEFT
	turn_head UP
	step_end

PalletTownMomMovesRight:
	step RIGHT
	turn_head UP
	step_end

PalletTownProudOfYouText:
	text "Oh, <PLAYER>, I'm"
	line "so proud of you."

	para "You're finally"
	line "going to fulfill"
	cont "your dream of"
	cont "#MON training."
	done

PalletTownGoingToMissYouText:
	text "But I'm going to"
	line "miss you so much."
	done

PalletTownIPackedYouText:
	text "I packed you"
	line "some clean clothes"
	cont "and a pair of"
	cont "RUNNING SHOES."

	para "…Your favorite"
	line "snacks and some"
	cont "hot chocolate in"

	para "case you want"
	line "something hot."

	para "A pair of rubber"
	line "gloves to do your"
	cont "laundry."

	para "And a new clothes-"
	line "line to hang it"
	cont "out to dry--"
	done

PalletTownThatsYourPokemonText:
	text "Hmm? That's your"
	line "POKéMON?"

	para "I thought all #"
	line "-MON stayed inside"
	cont "their # BALL?"

	para "Aww, it wants to"
	line "stay by your side"

	para "You are friends"
	line "already!"
	done

PalletTownWeirdText:
	text "But… Don't you"
	line "think it looks a"
	cont "little weird?"
	done

PalletTownUndiesText:
	text "Gah… …"

	para "Remember to change"
	line "your underwear."

	para "Every single day…"
	done

CheerleaderScript:
	readvar VAR_XCOORD
	ifequal 16, .TalkedToLeftGirl
	ifequal 17, .TalkedToRightGirl
.GetToGaryCont
	applymovement PLAYER, PalletTownPlayerKnockback
	playsound SFX_TACKLE
	waitsfx
	applymovement PALLETTOWN_BLUE, PalletTownRivalStepsDown
	turnobject PALLETTOWN_CHEERLEADER1, UP
	turnobject PALLETTOWN_CHEERLEADER2, UP
	opentext
	writetext PalletTownGaryOuchText
	promptbutton
	special NameRival
	writetext PalletTownGaryWatchItText
	promptbutton
	closetext
	showemote EMOTE_SHOCK, PALLETTOWN_BLUE, 15
	opentext
	writetext PalletTownGaryItsYouText
	promptbutton
	closetext
	turnobject PALLETTOWN_BLUE, RIGHT
	opentext
	writetext PalletTownGaryPitifulStartText
	promptbutton
	closetext
	turnobject PALLETTOWN_BLUE, DOWN
	opentext
	writetext PalletTownGaryGotAMonText
	promptbutton
	closetext

	applymovement PALLETTOWN_CHEERLEADER1, PalletTownCheerleaderHop
	pause 15
	applymovement PALLETTOWN_CHEERLEADER2, PalletTownCheerleaderHop
	pause 15
	opentext
	writetext PalletTownGaryCheerleaderText2
	promptbutton
	closetext

	applymovement PALLETTOWN_BLUE, PalletTownRivalMovesDown
	turnobject PLAYER, RIGHT
	opentext
	writetext PalletTownGaryMyFansText
	promptbutton
	closetext
	applymovement PALLETTOWN_BLUE, PalletRivalStepsRight
	opentext
	writetext PalletTownGaryHistoryText
	promptbutton
	closetext
	applymovement PALLETTOWN_BLUE, PalletRivalStepsRight
	disappear PALLETTOWN_BLUE

	pause 25
	special FadeOutMusic
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear PALLETTOWN_CHEERLEADER1
	disappear PALLETTOWN_CHEERLEADER2
	disappear PALLETTOWN_POKEFAN_F1
	disappear PALLETTOWN_BUG_CATCHER1
	disappear PALLETTOWN_BUG_CATCHER2
	disappear PALLETTOWN_GYM_GUIDE
	pause 35
	special FadeInFromBlack
	special RestartMapMusic

	appear PALLETTOWN_OAK
	applymovement PALLETTOWN_OAK, PalletTownRivalStepsDown
	turnobject PLAYER, UP	
	opentext
	writetext PalletTownOakYouShowedUpText
	promptbutton
	closetext
	applymovement PLAYER, PalletTownPlayerMovesUp
	opentext
	writetext PalletTownOakAMonText
	promptbutton
	closetext
	applymovement PALLETTOWN_OAK, PalletTownOakMovesLeft
	disappear PALLETTOWN_OAK
	pause 15
	end

.TalkedToLeftGirl:
	applymovement PALLETTOWN_CHEERLEADER1, PalletTownCheerleaderHop
	opentext
	writetext PalletTownGaryCheerleaderText
	promptbutton
	closetext
	applymovement PALLETTOWN_CHEERLEADER1, PalletTownCheerleader1ShovedAside
	playsound SFX_BUMP
	waitsfx
	opentext
	writetext PalletTownGaryCheerleaderHeyText
	promptbutton
	closetext
	turnobject PALLETTOWN_CHEERLEADER1, RIGHT
	applymovement PLAYER, PalletTownPlayerMovesToRival1
	sjump .GetToGaryCont

.TalkedToRightGirl:
	applymovement PALLETTOWN_CHEERLEADER2, PalletTownCheerleaderHop
	opentext
	writetext PalletTownGaryCheerleaderText
	promptbutton
	closetext
	applymovement PALLETTOWN_CHEERLEADER2, PalletTownCheerleader2ShovedAside
	playsound SFX_BUMP
	waitsfx
	opentext
	writetext PalletTownGaryCheerleaderHeyText
	promptbutton
	closetext
	turnobject PALLETTOWN_CHEERLEADER2, LEFT
	applymovement PLAYER, PalletTownPlayerMovesToRival2
	sjump .GetToGaryCont

PalletTownCheerleaderHop:
	jump_in_place
	jump_in_place
	step_sleep 8
	step_sleep 8
	jump_in_place
	jump_in_place
	turn_head UP
	step_end

PalletTownCheerleader1ShovedAside:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

PalletTownCheerleader2ShovedAside:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

PalletTownPlayerMovesToRival1:
	big_step UP
	big_step UP
	big_step UP
	big_step RIGHT
	big_step RIGHT
PalletTownPlayerMovesUp:
	big_step UP
	big_step UP
	step_end

PalletTownPlayerMovesToRival2:
	big_step UP
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	step_end

PalletTownRivalMovesDown:
	step RIGHT
	step DOWN
	step_end

PalletTownPlayerKnockback:
	fix_facing
	jump_step DOWN
	remove_fixed_facing
	step_end

PalletTownRivalStepsDown:
	step DOWN
	step DOWN
	step_end

PalletRivalStepsRight:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head LEFT
	step_end

PalletTownOakMovesUp:
	step UP
	step UP
	step UP
	step UP
	step LEFT
	turn_head RIGHT
	step_end

PalletTownOakMovesLeft:
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

PalletTownGaryCheerleaderText:
	text "Go! Go!"
	line "You're our man!"

	para "If you can't do it"
	line "no one can!"
	done

PalletTownGaryCheerleaderHeyText:
	text "H-hey!"
	done

PalletTownGaryOuchText:
	text "Ah! Ouch…"
	done

PalletTownGaryWatchItText:
	text "Hey, watch where"
	line "you're going!"
	done

PalletTownGaryItsYouText:
	text "Huh? Well if it"
	line "isn't <PLAYER>!"

	para "Yeah, I remember"
	line "you. Little Mr."
	cont "<PLAYER> himself!"

	para "So you got a late"
	line "start, didn't cha?"

	para "Don't stand there"
	line "looking all moppy."

	para "You say 'Yes Mr."
	line "<RIVAL>, please"
	cont "forgive me.'"

	para "To think you're"
	line "way behind right"
	cont "from the start."
	done

PalletTownGaryPitifulStartText:
	text "Ugh… My rival's off"
	line "to such a pitiful"
	cont "start."
	done

PalletTownGaryGotAMonText:
	text "'Cause guess what?"

	para "I've got a #MON"
	line "and you don't!"
	done

PalletTownGaryCheerleaderText2:
	text "Let's go, <RIVAL>!"

	para "Let's go!"
	line "Yeah, yeah!"
	done

PalletTownGaryMyFansText:
	text "Thank you, fans."
	line "Thank you for this"
	cont "great honor."

	para "I promise you that"
	line "I will become a"
	cont "#MON MASTER."

	para "PALLET TOWN will"
	line "be known all"
	cont "around the world!"
	done

PalletTownGaryHistoryText:
	text "Thank you for"
	line "coming out to see"
	cont "history in the"
	cont "making!"
	done

PalletTownOakYouShowedUpText:
	text "So you decided to"
	line "show up after all."
	done

PalletTownOakAMonText:
	text "Oh? A #MON?"

	para "You look like you"
	line "are ready for bed," 
	cont "not for POKéMON"
	cont "Training."

	para "I hope you don't"
	line "plan on training"
	cont "in your pajamas."

	para "Well, well. I'll"
	line "be waiting for you"
	cont "at the LAB."
	done

PalletTownLassScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_STARTER_FROM_OAK
	iftrue .GotStarter
	writetext PalletTownLassText
	waitbutton
	closetext
	end
.GotStarter:
	writetext PalletTownLassStarterText
	waitbutton
	closetext
	end

PalletTownFisherScript:
	jumptextfaceplayer PalletTownFisherText

PalletTownSign:
	jumptext PalletTownSignText

PlayersHouseSign:
	jumptext PlayersHouseSignText

OaksLabSign:
	jumptext OaksLabSignText

BluesHouseSign:
	jumptext BluesHouseSignText

PalletTownLassText:
	text "I'm raising #-"
	line "MON too."

	para "They serve as my"
	line "private guards"
	cont "when I'm out and"
	cont "about."

	para "But, uh. Were you"
	line "not supposed to"
	cont "get a POKéMON of"
	cont "your own today?"
	done

PalletTownLassStarterText:
	text "You got a #MON!"
	line "It even follows"
	cont "you outside its"
	cont "# BALL."

	para "Guess it wants to"
	line "stretch its legs."

	para "Can't imagine"
	line "sitting inside a"
	cont "# BALL is all"
	cont "that comfortable."
	done

PalletTownFisherText:
	text "Isn't technology"
	line "the greatest?"

	para "They have machines"
	line "that transfer"
	cont "ownership of a"

	para "#MON from one"
	line "trainer to another"
	cont "in mere seconds!"
	done

PalletTownSignText:
	text "PALLET TOWN"

	para "Shades of your"
	line "journey await!"
	done

PlayersHouseSignText:
	text "KETCHUM RESIDENCE"
	done

OaksLabSignText:
	text "OAK #MON"
	line "RESEARCH LAB"
	done

BluesHouseSignText:
	text "OAK RESIDENCE"
	done

PalletTownDodrioScript:
	opentext
	checktime MORN
	iftrue .morn
	checktime DAY | EVE
	iftrue .day_eve
.morn
	writetext PalletTownDodrioMornText
	cry DODRIO
	cry DODRIO
	waitbutton
	closetext
	end

.day_eve
	writetext PalletTownDodrioDayEveText
	cry DODRIO
	waitbutton
	closetext
	end

PalletTownDodrioMornText:
	text "DODRIO: Doo! Do!"
	done

PalletTownDodrioDayEveText:
	text "DODRIO: Doo!"
	done

PalletTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 32, 23, PLAYERS_HOUSE_1F, 1
	warp_event 42, 23, BLUES_HOUSE, 1
	warp_event 10,  5, OAKS_LAB, 1
	warp_event 12, 23, PALLET_OAK_TV_SPEECH_HOUSE, 1
	warp_event 12, 29, PALLET_DODRIO_HOUSE, 1
	warp_event 42, 29, PALLET_WORRIED_MOM_HOUSE, 1

	def_coord_events
	coord_event 18, 12, SCENE_PALLETTOWN_HURRY_TO_LAB, PalletTown_HurryToLabScene
	coord_event 19, 12, SCENE_PALLETTOWN_HURRY_TO_LAB, PalletTown_HurryToLabScene

	def_bg_events
	bg_event 33, 29, BGEVENT_READ, PalletTownSign
	bg_event 31, 25, BGEVENT_READ, PlayersHouseSign
	bg_event 21, 12, BGEVENT_READ, OaksLabSign
	bg_event 41, 25, BGEVENT_READ, BluesHouseSign

	def_object_events
	object_event 18, 10, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BLUE_CROWD
	object_event 16, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CheerleaderScript, EVENT_BLUE_CROWD
	object_event 17, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CheerleaderScript, EVENT_BLUE_CROWD
	object_event 14, 13, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BLUE_CROWD
	object_event 15, 12, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BLUE_CROWD
	object_event 20, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BLUE_CROWD
	object_event 21, 14, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_SPINRANDOM_SLOW , 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BLUE_CROWD
	object_event 18,  8, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC

	object_event 16, 13, SPRITE_SALESMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_PLAYER_CROWD
	object_event 17, 15, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_PLAYER_CROWD
	object_event 18, 15, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_PLAYER_CROWD
	object_event 19, 13, SPRITE_PLAYERS_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_PLAYER_CROWD

	object_event 30, 27, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalletTownLassScript, -1
	object_event 35, 32, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PalletTownFisherScript, -1
	object_event 11, 27, SPRITE_DODRIO_STATIC, SPRITEMOVEDATA_POKEMON, 0, 0, -1, MORN | DAY | EVE, 0, OBJECTTYPE_SCRIPT, 0, PalletTownDodrioScript, -1
