	object_const_def
	const BLUESHOUSE_DAISY1
	const BLUESHOUSE_DAISY2

BluesHouse_MapScripts:
	def_scene_scripts

	def_callbacks

DaisyScript:
	jumptextfaceplayer DaisyHelloText

DaisyTeaScript:
	faceplayer
	opentext
	readvar VAR_HOUR
	ifequal 15, .ThreePM
	writetext DaisyHelloAfterText
	waitbutton
	closetext
	turnobject BLUESHOUSE_DAISY2, RIGHT
	end

.ThreePM:
	checkflag ENGINE_DAISYS_GROOMING
	iftrue .AlreadyGroomedMon
	writetext DaisyOfferGroomingText
	yesorno
	iffalse .Refused
	writetext DaisyWhichMonText
	waitbutton
	special DaisysGrooming
	ifequal $0, .Refused
	ifequal $1, .CantGroomEgg
	setflag ENGINE_DAISYS_GROOMING
	writetext DaisyAlrightText
	waitbutton
	closetext
	special FadeOutToWhite
	playmusic MUSIC_HEAL
	pause 60
	special FadeInFromWhite
	special RestartMapMusic
	opentext
	writetext GroomedMonLooksContentText
	special PlayCurMonCry
	promptbutton
	writetext DaisyAllDoneText
	waitbutton
	closetext
	turnobject BLUESHOUSE_DAISY2, RIGHT
	end

.AlreadyGroomedMon:
	writetext DaisyAlreadyGroomedText
	waitbutton
	closetext
	turnobject BLUESHOUSE_DAISY2, RIGHT
	end

.Refused:
	writetext DaisyRefusedText
	waitbutton
	closetext
	turnobject BLUESHOUSE_DAISY2, RIGHT
	end

.CantGroomEgg:
	writetext DaisyCantGroomEggText
	waitbutton
	closetext
	turnobject BLUESHOUSE_DAISY2, RIGHT
	end

DaisyHelloText:
	text "DAISY: Hi <PLAYER>!"
	line "Were you looking"
	cont "for my brother?"

	para "He should still be"
	line "at Grandpa's lab."
	done

DaisyHelloAfterText:
	text "Good luck on your"
	line "journey, <PLAYER>."

	para "I can't offer much,"
	line "but feel free to"
	cont "come by for tea."

	para "I usually have a"
	line "cup around 3 P.M."
	done

DaisyOfferGroomingText:
	text "DAISY: Hi! Good"
	line "timing. I'm about"
	cont "to have some tea."

	para "Would you like to"
	line "join me?"

	para "Oh, your #MON"
	line "are a bit dirty."

	para "Would you like me"
	line "to groom one?"
	done

DaisyWhichMonText:
	text "DAISY: Which one"
	line "should I groom?"
	done

DaisyAlrightText:
	text "DAISY: OK, I'll"
	line "get it looking"
	cont "nice in no time."
	done

GroomedMonLooksContentText:
	text_ram wStringBuffer3
	text " looks"
	line "content."
	done

DaisyAllDoneText:
	text "DAISY: There you"
	line "go! All done."

	para "See? Doesn't it"
	line "look nice?"

	para "It's such a cute"
	line "#MON."
	done

DaisyAlreadyGroomedText:
	text "DAISY: I always"
	line "have tea around"

	para "this time. Come"
	line "join me."
	done

DaisyRefusedText:
	text "DAISY: You don't"
	line "want to have one"

	para "groomed? OK, we'll"
	line "just have tea."
	done

DaisyCantGroomEggText:
	text "DAISY: Oh, sorry."
	line "I honestly can't"
	cont "groom an EGG."
	done

BluesHouseBookshelf:
	jumptext BluesHouseBookshelfText

BluesHouseBookshelfText:
	text "It's crammed full"
	line "of #MON books."
	done

BluesHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, PALLET_TOWN, 2
	warp_event  4,  9, PALLET_TOWN, 2
	warp_event  0,  2, BLUES_HOUSE, 4
	warp_event 19,  9, BLUES_HOUSE, 3
	warp_event 20,  9, BLUES_HOUSE, 3

	def_coord_events

	def_bg_events
	bg_event 23,  3, BGEVENT_READ, BluesHouseBookshelf

	def_object_events
	object_event  1,  6, SPRITE_DAISY, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyScript, EVENT_GOT_STARTER_FROM_OAK
	object_event  3,  5, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyTeaScript, EVENT_MOM_AND_OAK_INVISIBLE
