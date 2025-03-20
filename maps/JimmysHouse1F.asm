	object_const_def
	const JIMMYSHOUSE1F_JIMMYS_MOM1
	const JIMMYSHOUSE1F_JIMMYS_MOM2
	const JIMMYSHOUSE1F_JIMMYS_MOM3
	const JIMMYSHOUSE1F_POKEFAN_F

JimmysHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

JimmysMomScript:
	faceplayer
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .BankOfMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .GaveMysteryEgg
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotAPokemon
	writetext HurryUpElmIsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext SoWhatWasProfElmsErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special BankOfMom
	waitbutton
	closetext
	end

JimmysNeighborVisitingScript:
	faceplayer
	opentext
	checktime MORN
	iftrue .MornScript
	checktime DAY
	iftrue .DayScript
	checktime EVE | NITE
	iftrue .NiteScript

.MornScript:
	writetext NeighborMornIntroText
	promptbutton
	sjump .Main

.DayScript:
	writetext NeighborDayIntroText
	promptbutton
	sjump .Main

.NiteScript:
	writetext NeighborNiteIntroText
	promptbutton
	sjump .Main

.Main:
	writetext NeighborText
	waitbutton
	closetext
	turnobject JIMMYSHOUSE1F_POKEFAN_F, RIGHT
	end

JimmysHouse1FTVScript:
	jumptext JimmysHouse1FTVText

JimmysHouse1FStoveScript:
	jumptext JimmysHouse1FStoveText

JimmysHouse1FSinkScript:
	jumptext JimmysHouse1FSinkText

JimmysHouse1FFridgeScript:
	jumptext JimmysHouse1FFridgeText

HurryUpElmIsWaitingText:
	text "PROF.ELM is wait-"
	line "ing for you."

	para "Hurry up, baby!"
	done

SoWhatWasProfElmsErrandText:
	text "So, what was PROF."
	line "ELM's errand?"

	para "…"

	para "That does sound"
	line "challenging."

	para "But, you should be"
	line "proud that people"
	cont "rely on you."
	done

ImBehindYouText:
	text "<PLAYER>, do it!"

	para "I'm behind you all"
	line "the way!"
	done

NeighborMornIntroText:
	text "Good morning,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

NeighborDayIntroText:
	text "Hello, <PLAY_G>!"
	line "I'm visiting!"
	done

NeighborNiteIntroText:
	text "Good evening,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

NeighborText:
	text "<PLAY_G>, have you"
	line "heard?"

	para "My daughter is"
	line "adamant about"

	para "becoming PROF."
	line "ELM's assistant."

	para "She really loves"
	line "#MON!"
	done

JimmysHouse1FStoveText:
	text "Mom's specialty!"

	para "CINNABAR VOLCANO"
	line "BURGER!"
	done

JimmysHouse1FSinkText:
	text "The sink is spot-"
	line "less. Mom likes it"
	cont "clean."
	done

JimmysHouse1FFridgeText:
	text "Let's see what's"
	line "in the fridge…"

	para "FRESH WATER and"
	line "tasty LEMONADE!"
	done

JimmysHouse1FTVText:
	text "There's a movie on"
	line "TV: Stars dot the"

	para "sky as two boys"
	line "ride on a train…"

	para "I'd better get"
	line "rolling too!"
	done

JimmysHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  9, NEW_BARK_TOWN, 2
	warp_event  6,  9, NEW_BARK_TOWN, 2
	warp_event  9,  2, JIMMYS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  0,  3, BGEVENT_READ, JimmysHouse1FStoveScript
	bg_event  1,  3, BGEVENT_READ, JimmysHouse1FSinkScript
	bg_event  2,  3, BGEVENT_READ, JimmysHouse1FFridgeScript
	bg_event  4,  3, BGEVENT_READ, JimmysHouse1FTVScript

	def_object_events
	object_event  2,  4, SPRITE_JIMMYS_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, JimmysMomScript, -1
	object_event  6,  6, SPRITE_JIMMYS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, JimmysMomScript, -1
	object_event  0,  4, SPRITE_JIMMYS_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, EVE | NITE, 0, OBJECTTYPE_SCRIPT, 0, JimmysMomScript, -1
	object_event  3,  6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, JimmysNeighborVisitingScript, -1
