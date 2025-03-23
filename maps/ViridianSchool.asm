	object_const_def
	const VIRIDIANSCHOOL_TEACHER
	const VIRIDIANSCHOOL_YOUNGSTER1
	const VIRIDIANSCHOOL_LASS
	const VIRIDIANSCHOOL_YOUNGSTER2
	const VIRIDIANSCHOOL_BUG_CATCHER
	const VIRIDIANSCHOOL_POKEDEX

ViridianSchool_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianSchoolTeacherScript:
	faceplayer
	opentext
	writetext ViridianSchoolTeacherText
	waitbutton
	closetext
	turnobject VIRIDIANSCHOOL_TEACHER, DOWN
	end

ViridianSchoolYoungster1Script:
	jumptextfaceplayer ViridianSchoolYoungster1Text

ViridianSchoolLassScript:
	faceplayer
	opentext
	writetext ViridianSchoolLassText
	waitbutton
	closetext
	turnobject VIRIDIANSCHOOL_LASS, UP
	end

ViridianSchoolYoungster2Script:
	jumptextfaceplayer ViridianSchoolYoungster2Text

ViridianSchoolBugCatcherScript:
	jumptextfaceplayer ViridianSchoolBugCatcherText

SchoolNotebook:
	jumptext TrainerHouseIllegibleText

SchoolBlackboard:
	opentext
	writetext SchoolBlackboardText
.Loop:
	loadmenu .BlackboardMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Poison
	ifequal 2, .Paralysis
	ifequal 3, .Sleep
	ifequal 4, .Burn
	ifequal 5, .Freeze
	closetext
	end

.Poison:
	writetext SchoolPoisonText
	waitbutton
	sjump .Loop

.Paralysis:
	writetext SchoolParalysisText
	waitbutton
	sjump .Loop

.Sleep:
	writetext SchoolSleepText
	waitbutton
	sjump .Loop

.Burn:
	writetext SchoolBurnText
	waitbutton
	sjump .Loop

.Freeze:
	writetext SchoolFreezeText
	waitbutton
	sjump .Loop

.BlackboardMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 11, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .Text
	dbw BANK(@), NULL

.Text:
	db "PSN@"
	db "PAR@"
	db "SLP@"
	db "BRN@"
	db "FRZ@"
	db "QUIT@"

SchoolBlackboardText:
	text "The blackboard"
	line "describes #MON"

	para "status changes in"
	line "battle."

	para "Read which topic?"
	done

SchoolPoisonText:
	text "If poisoned, a"
	line "#MON steadily"
	cont "loses HP."

	para "Poison lingers"
	line "after the battle,"

	para "and HP is lost as"
	line "you walk."

	para "To cure it, use an"
	line "ANTIDOTE."
	done

SchoolParalysisText:
	text "Paralysis reduces"
	line "speed and may"
	cont "prevent movement."

	para "It remains after"
	line "battle, so use"
	cont "a PARLYZ HEAL."
	done

SchoolSleepText:
	text "If asleep, your"
	line "#MON can't make"
	cont "a move."

	para "A sleeping #MON"
	line "doesn't wake up"
	cont "after battle."

	para "Wake it up with"
	line "an AWAKENING."
	done

SchoolBurnText:
	text "A burn steadily"
	line "consumes HP."

	para "It also reduces"
	line "attack power."

	para "A burn lingers"
	line "after battle."

	para "Use a BURN HEAL as"
	line "the cure."
	done

SchoolFreezeText:
	text "If your #MON is"
	line "frozen, it can't"
	cont "do a thing."

	para "It remains frozen"
	line "after battle."

	para "Thaw it out with"
	line "an ICE HEAL."
	done

ViridianSchoolTeacherText:
	text "Welcome to the"
	line "#MON SCHOOL,"
	cont "where the next"

	para "generation of"
	line "#MON trainers"
	cont "is being taught."

	para "Be sure to read"
	line "the blackboard"
	cont "carefully!"
	done

ViridianSchoolYoungster1Text:
	text "I guess you can't"
	line "become the CHAMP'"
	cont "unless you go all"
	
	para "over the place and"
	line "battle all kinds"
	cont "of people."

	para "A proper trainer"
	line "has to travel to"
	cont "all the cities and"
	cont "towns in KANTO."
	done

ViridianSchoolLassText:
	text "Whew! I'm trying"
	line "to memorize all"
	cont "my notes."
	done

ViridianSchoolYoungster2Text:
	text "VIRIDIAN is the"
	line "town closest to"
	cont "INDIGO PLATEAU."

	para "They built this"
	line "place because so"

	para "many kids dream of"
	line "becoming CHAMPION."
	done

ViridianSchoolBugCatcherText:
	text "Bleh… I don't want"
	line "to learn. I want"
	cont "#MON battles!"
	done

TrainerHouseIllegibleText:
	text "…What's this?"
	line "A student notepad?"

	para "This writing looks"
	line "like ONIX tracks…"

	para "It's completely"
	line "illegible…"
	done

ViridianSchool_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 11, VIRIDIAN_CITY, 3
	warp_event  6, 11, VIRIDIAN_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  5,  2, BGEVENT_READ, SchoolBlackboard
	bg_event  6,  2, BGEVENT_READ, SchoolBlackboard

	def_object_events
	object_event  4,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianSchoolTeacherScript, -1
	object_event  9,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianSchoolYoungster1Script, -1
	object_event  8,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianSchoolLassScript, -1
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianSchoolYoungster2Script, -1
	object_event  1, 10, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianSchoolBugCatcherScript, -1
	object_event  8,  8, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SchoolNotebook, -1
