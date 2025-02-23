	object_const_def
	const OAKSLAB_OAK
	const OAKSLAB_SCIENTIST1
	const OAKSLAB_SCIENTIST2
	const OAKSLAB_BLANK

OaksLab_MapScripts:
	def_scene_scripts

	def_callbacks

OaksLabNoopScene: ; unreferenced
	end

ProfOakScript:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .CheckPokedex
	checkevent EVENT_TALKED_TO_OAK_IN_KANTO
	iftrue .CheckBadges
	writetext OakWelcomeKantoText
	promptbutton
	setevent EVENT_TALKED_TO_OAK_IN_KANTO
.CheckBadges:
	readvar VAR_BADGES
	ifequal NUM_BADGES, .OpenMtSilver
	ifequal NUM_JOHTO_BADGES, .Complain
	sjump .AhGood

.CheckPokedex:
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetext OakLabGoodbyeText
	waitbutton
	closetext
	end

.OpenMtSilver:
	writetext OakOpenMtSilverText
	promptbutton
	setevent EVENT_OPENED_MT_SILVER
	sjump .CheckPokedex

.Complain:
	writetext OakNoKantoBadgesText
	promptbutton
	sjump .CheckPokedex

.AhGood:
	writetext OakYesKantoBadgesText
	promptbutton
	sjump .CheckPokedex

OaksAssistant1Script:
	jumptextfaceplayer OaksAssistant1Text

OaksAssistant2Script:
	jumptextfaceplayer OaksAssistant2Text

OaksLabWindow:
	jumptext OaksLabWindowText

OaksLabBlackboard:
	jumptext OaksLabBlackboardText

OaksLabLockedDoor:
	jumptext OaksLabDoorText

OakWelcomeKantoText:
	text "OAK: Ah, <PLAY_G>!"
	line "It's good of you"

	para "to come all this"
	line "way to KANTO."

	para "What do you think"
	line "of the trainers"

	para "out here?"
	line "Pretty tough, huh?"
	done

OakLabDexCheckText:
	text "How is your #-"
	line "DEX coming?"

	para "Let's see…"
	done

OakLabGoodbyeText:
	text "If you're in the"
	line "area, I hope you"
	cont "come visit again."
	done

OakOpenMtSilverText:
	text "OAK: Wow! That's"
	line "excellent!"

	para "You collected the"
	line "BADGES of GYMS in"
	cont "KANTO. Well done!"

	para "I was right in my"
	line "assessment of you."

	para "Tell you what,"
	line "<PLAY_G>. I'll make"

	para "arrangements so"
	line "that you can go to"
	cont "MT.SILVER."

	para "MT.SILVER is a big"
	line "mountain that is"

	para "home to many wild"
	line "#MON."

	para "It's too dangerous"
	line "for your average"

	para "trainer, so it's"
	line "off limits. But"

	para "we can make an"
	line "exception in your"
	cont "case, <PLAY_G>."

	para "Go up to INDIGO"
	line "PLATEAU. You can"

	para "reach MT.SILVER"
	line "from there."
	done

OakNoKantoBadgesText:
	text "OAK: Hmm? You're"
	line "not collecting"
	cont "KANTO GYM BADGES?"

	para "The GYM LEADERS in"
	line "KANTO are as tough"

	para "as any you battled"
	line "in JOHTO."

	para "I recommend that"
	line "you challenge"
	cont "them."
	done

OakYesKantoBadgesText:
	text "OAK: Ah, you're"
	line "collecting KANTO"
	cont "GYM BADGES."

	para "I imagine that"
	line "it's hard, but the"

	para "experience is sure"
	line "to help you."

	para "Come see me when"
	line "you get them all."

	para "I'll have a gift"
	line "for you."

	para "Keep trying hard,"
	line "<PLAY_G>!"
	done

OaksAssistant1Text:
	text "Thanks to your"
	line "work on the #-"
	cont "DEX, the PROF's"

	para "research is coming"
	line "along great."
	done

OaksAssistant2Text:
	text "Don't tell anyone,"
	line "but PROF.OAK'S"

	para "#MON TALK isn't"
	line "a live broadcast."
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

OaksLabDoorText:
	text "It's locked…"
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

	def_coord_events

	def_bg_events
	bg_event 54,  2, BGEVENT_READ, OaksLabWindow
	bg_event 51,  2, BGEVENT_READ, OaksLabWindow
	bg_event 45,  2, BGEVENT_READ, OaksLabWindow
	bg_event 42,  2, BGEVENT_READ, OaksLabWindow
	bg_event  3,  3, BGEVENT_READ, OaksLabBlackboard
	bg_event  4,  3, BGEVENT_READ, OaksLabBlackboard

	def_object_events
	object_event  7,  6, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfOakScript, -1
	object_event 44,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OaksAssistant1Script, -1
	object_event 51,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OaksAssistant2Script, -1
	object_event 30,  2, SPRITE_BLANK, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OaksLabLockedDoor, EVENT_GOT_STARTER_FROM_OAK
