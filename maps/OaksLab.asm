	object_const_def
	const OAKSLAB_OAK1
	const OAKSLAB_OAK2
	const OAKSLAB_OAK3
	const OAKSLAB_OAK4
	const OAKSLAB_OAK5
	const OAKSLAB_REDS_MOM
	const OAKSLAB_SCIENTIST1
	const OAKSLAB_SCIENTIST2
	const OAKSLAB_TEACHER
	const OAKSLAB_BLANK

OaksLab_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, OaksLabStarterMachineCallback

OaksLabStarterMachineCallback:
	checkevent EVENT_GOT_STARTER_FROM_OAK
	iftrue .Done
	changeblock  8, 6, $3d ; machine
.Done:
	endcallback

ProfOakCutsceneScript:
	checkevent EVENT_GOT_STARTER_FROM_OAK
	iftrue .AlreadyGotStarter
	faceplayer
	opentext
	writetext OaksLabOakThereYouAreText
	promptbutton
	closetext
	readvar VAR_FACING
	ifequal DOWN, .Position_Up
	ifequal RIGHT, .Position_Left
.ProfOakCutsceneCont:
	turnobject OAKSLAB_OAK1, DOWN
	opentext
	writetext OaksLabOakQuiteBothersomeText
	promptbutton
	closetext
	turnobject OAKSLAB_OAK1, RIGHT
	opentext
	writetext OaksLabStillOneLeftText
	promptbutton
	closetext
	changeblock 8, 6, $3e ; machine
	reloadmappart
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	pause 20
	changeblock 8, 6, $3f ; machine
	reloadmappart
	turnobject OAKSLAB_OAK1, DOWN
	opentext
	writetext OaksLabOakAProblemText
	promptbutton
	closetext

	turnobject OAKSLAB_OAK1, LEFT
	waitsfx
	playsound SFX_BALL_POOF
	waitsfx
	givepoke PIKACHU, 5, NO_ITEM, GiftPikachuName, GiftPikachuOTName
	moveobject FOLLOWER, 6, 6
	loademote EMOTE_POKE_BALL
	appearfollower
;	callasm RefreshFollowingCoords
	pause 30
	applymovement FOLLOWER, OaksLabFollowerMovement
	turnobject PLAYER, LEFT
	pause 20
	cry PIKACHU
	opentext
	writetext OaksLabOakThisisPikachuText
	promptbutton
	closetext

	turnobject OAKSLAB_OAK1, DOWN
	turnobject PLAYER, UP
	opentext
	writetext OaksLabOakTakeThese
	promptbutton
	waitsfx
	writetext OaksLabOakGetDexText
	playsound SFX_ITEM
	waitsfx
	promptbutton
	closetext
	setflag ENGINE_POKEDEX
	giveitem POKE_BALL, 6
	setevent EVENT_GOT_STARTER_FROM_OAK
	clearevent EVENT_PLAYER_CROWD
.AlreadyGotStarter:
	faceplayer
	opentext
	writetext OaksLabOakDexExplainText
	promptbutton
	closetext
	end

.Position_Up:
	applymovement PLAYER, OaksLabPlayerUpFromOak
	sjump .ProfOakCutsceneCont

.Position_Left:
	applymovement PLAYER, OaksLabPlayerLeftFromOak
	sjump .ProfOakCutsceneCont

GiftPikachuName:
	db "PIKACHU@"

GiftPikachuOTName:
	db "OAK@" 

	db 0

OaksLabPlayerUpFromOak:
	step LEFT
	step DOWN
OaksLabPlayerLeftFromOak:
	step DOWN
	step RIGHT
	turn_head UP
	step_end

OaksLabFollowerMovement:
	step DOWN
	turn_head RIGHT
	step_end

OaksLabOakThereYouAreText:
	text "OAK: Ah, <PLAYER>."
	line "There you are."
	done

OaksLabOakQuiteBothersomeText:
	text "Now this is quite"
	line "bothersome. Three"
	cont "boys came before"

	para "you and picked the"
	line "starter POKéMON I"
	cont "had on hand."

	para "The early bird"
	line "gets the worm."

	para "Or in this case,"
	line "er, the #MON."
	done

OaksLabStillOneLeftText:
	text "Well, there still"
	line "is one left, but…"
	done

OaksLabOakAProblemText:
	text "I think I should"
	line "warn you, there is"
	cont "a problem with"
	cont "this last one."
	done

OaksLabOakThisisPikachuText:
	text "This is PIKACHU."

	para "Also known as the"
	line "'Electric Mouse'"
	cont "#MON."

	para "It's usually shy,"
	line "but can sometimes"
	cont "have an electri-"
	cont "fying personality."
	done

OaksLabOakTakeThese:
	text "Now, take these."
	done

OaksLabOakGetDexText:
	text "<PLAYER> received"
	line "a #DEX and a"
	cont "few # BALLS."
	done

OaksLabOakDexExplainText:
	text "My greatest"
	line "invention, the"
	cont "#DEX!"

	para "It automatically"
	line "records data on"
	cont "#MON you've"
	cont "seen or caught."

	para "It's a hi-tech"
	line "encyclopedia!"

	para "And I'm counting on"
	line "trainers like you"
	cont "to fill it up."
	done

OaksAssistant1Script:
	jumptextfaceplayer OaksAssistant1Text

OaksAssistant2Script:
	jumptextfaceplayer OaksAssistant2Text

OaksLabTeacherScript:
	faceplayer 
	opentext
	writetext OaksLabTeacherText
	waitbutton
	closetext
	turnobject OAKSLAB_TEACHER, UP
	end

OaksLabWindow:
	jumptext OaksLabWindowText

OaksLabBlackboard:
	jumptext OaksLabBlackboardText

OaksLabBookshelf1:
	jumptext OaksLabBookshelf1Text

OaksLabBookshelf2:
	jumptext OaksLabBookshelf2Text

OaksLabBookshelf3:
	jumptext OaksLabBookshelf3Text

OaksLabLockedDoor:
	jumptext OaksLabDoorText

OaksAssistant1Text:
	text "It's thanks to"
	line "young folks like"
	cont "you that PROF.OAK's"

	para "#DEX research"
	line "is making such"
	cont "great progress."
	done

OaksAssistant2Text:
	text "Don't tell anyone,"
	line "but PROF.OAK'S"

	para "#MON TALK isn't"
	line "a live broadcast."
	done

OaksLabTeacherText:
	text "Most of the books"
	line "here must be a bit"
	cont "too dense for you."

	para "The last row of"
	line "bookshelves here"

	para "should have more"
	line "beginner-friendly"
	cont "resources."
	done

OaksLabWindowText:
	text "A large grassy"
	line "field extends"
	cont "behind the house."
	done

OaksLabBlackboardText:
	text "Various research"
	line "notes… Hmm."

	para "PROF.OAK seems to"
	line "also like writing"
	cont "haiku in his spare"
	cont "time?"
	done

OaksLabBookshelf1Text:
	text "When a wild"
	line "#MON appears,"
	cont "it's fair game."

	para "Just throw a #"
	line "BALL at it and try"
	cont "to catch it."

	para "This won't always"
	line "work, though."

	para "A healthy #MON"
	line "is way more likely"
	cont "to escape."

	para "Weaken it before"
	line "throwing a BALL!"
	done

OaksLabBookshelf2Text:
	text "The #DEX can't"
	line "get detailed data"
	cont "on a #MON by"
	cont "just seeing it."

	para "A #MON has to"
	line "be caught in a"
	cont "# BALL before"

	para "you can learn more"
	line "about them."
	done

OaksLabBookshelf3Text:
	text "To make a complete"
	line "guide on all the"
	cont "#MON in the"
	cont "world…"

	para "That was my dream."

	para "But in my old age,"
	line "this just isn't"
	cont "viable anymore."

	para "So I request of"
	line "young trainers to"
	cont "help me fill it"

	para "up by catching all"
	line "sorts of #MON."

	para "This is a great"
	line "undertaking in"
	cont "#MON history!"

	para "Hmm… …"

	para "Someone misplaced"
	line "PROF.OAK's memoir."
	done

OaksLabDoorText:
	text "It's locked…"
	done

ProfOakScript:
	faceplayer
	opentext
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetext OakLabGoodbyeText
	waitbutton
	closetext
	end

OakLabDexCheckText:
	text "OAK: Good to see"
	line "you, <PLAYER>!"

	para "How is your #-"
	line "DEX coming?"

	para "Here, let me take"
	line "a look!"
	done

OakLabGoodbyeText:
	text "If you're in the"
	line "area, I hope you"
	cont "come visit again."

	para "I want to know how"
	line "your #DEX is"
	cont "coming along."
	done

OaksLabRedsMomScript:
	faceplayer
	opentext
	writetext OaksLabRedsMomText
	waitbutton
	closetext
	turnobject OAKSLAB_REDS_MOM, LEFT
	end

OaksLabRedsMomText:
	text "MOM: Oh, <PLAYER>!"

	para "I was paying OAK"
	line "a little visit."

	para "Stay safe, and"
	line "brush your teeth!"
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27, 11, PALLET_TOWN, 3
	warp_event 28, 11, PALLET_TOWN, 3
	warp_event 33,  4, OAKS_LAB, 4
	warp_event 15,  5, OAKS_LAB, 3
	warp_event 33,  9, OAKS_LAB, 7
	warp_event 33, 10, OAKS_LAB, 8
	warp_event 40,  9, OAKS_LAB, 5
	warp_event 40, 10, OAKS_LAB, 6
	warp_event 30,  2, OAK_CORRAL, 1

	def_coord_events

	def_bg_events
	bg_event 54,  2, BGEVENT_READ, OaksLabWindow
	bg_event 51,  2, BGEVENT_READ, OaksLabWindow
	bg_event 45,  2, BGEVENT_READ, OaksLabWindow
	bg_event 42,  2, BGEVENT_READ, OaksLabWindow
	bg_event  3,  3, BGEVENT_READ, OaksLabBlackboard
	bg_event  4,  3, BGEVENT_READ, OaksLabBlackboard
	bg_event 43, 10, BGEVENT_READ, OaksLabBookshelf1
	bg_event 44, 10, BGEVENT_READ, OaksLabBookshelf2
	bg_event 45, 10, BGEVENT_READ, OaksLabBookshelf3

	def_object_events
	object_event  7,  6, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfOakCutsceneScript, EVENT_GOT_PROPER_CLOTHES
	object_event 12,  8, SPRITE_OAK, SPRITEMOVEDATA_WANDER, 1, 1, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, ProfOakScript, EVENT_MOM_AND_OAK_INVISIBLE
	object_event  7,  6, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, ProfOakScript, EVENT_MOM_AND_OAK_INVISIBLE
	object_event  4, 10, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, ProfOakScript, EVENT_MOM_AND_OAK_INVISIBLE
	object_event 24,  5, SPRITE_OAK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, EVE, 0, OBJECTTYPE_SCRIPT, 0, ProfOakScript, EVENT_MOM_AND_OAK_INVISIBLE
	object_event 27,  5, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, EVE, 0, OBJECTTYPE_SCRIPT, 0, OaksLabRedsMomScript, EVENT_MOM_AND_OAK_INVISIBLE
	object_event 44,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OaksAssistant1Script, -1
	object_event 51,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OaksAssistant2Script, -1
	object_event 42,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OaksLabTeacherScript, -1
	object_event 30,  2, SPRITE_BLANK, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OaksLabLockedDoor, EVENT_GOT_PROPER_CLOTHES
