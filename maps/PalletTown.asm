	object_const_def
	const PALLETTOWN_DODRIO
	const PALLETTOWN_TEACHER
	const PALLETTOWN_FISHER

PalletTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PalletTownFlypointCallback

PalletTownFlypointCallback:
	setflag ENGINE_FLYPOINT_PALLET
	endcallback

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

PalletTownTeacherScript:
	jumptextfaceplayer PalletTownTeacherText

PalletTownFisherScript:
	jumptextfaceplayer PalletTownFisherText

PalletTownSign:
	jumptext PalletTownSignText

RedsHouseSign:
	jumptext RedsHouseSignText

OaksLabSign:
	jumptext OaksLabSignText

BluesHouseSign:
	jumptext BluesHouseSignText

PalletTownTeacherText:
	text "I'm raising #-"
	line "MON too."

	para "They serve as my"
	line "private guards."
	done

PalletTownFisherText:
	text "Technology is"
	line "incredible!"

	para "You can now trade"
	line "#MON across"
	cont "time like e-mail."
	done

PalletTownSignText:
	text "PALLET TOWN"

	para "A Tranquil Setting"
	line "of Peace & Purity"
	done

RedsHouseSignText:
	text "<PLAYER>'S HOUSE"
	done

OaksLabSignText:
	text "OAK #MON"
	line "RESEARCH LAB"
	done

BluesHouseSignText:
	text "<RIVAL>'S HOUSE"
	done

PalletTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 28, 23, REDS_HOUSE_1F, 1
	warp_event 38, 23, BLUES_HOUSE, 1
	warp_event  6,  5, OAKS_LAB, 1
	warp_event  8, 23, PALLET_OAK_TV_SPEECH_HOUSE, 1
	warp_event  8, 29, PALLET_DODRIO_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 29, 29, BGEVENT_READ, PalletTownSign
	bg_event 27, 25, BGEVENT_READ, RedsHouseSign
	bg_event 17, 12, BGEVENT_READ, OaksLabSign
	bg_event 37, 25, BGEVENT_READ, BluesHouseSign

	def_object_events
	object_event  7, 27, SPRITE_DODRIO_STATIC, SPRITEMOVEDATA_POKEMON, 0, 0, -1, MORN | DAY | EVE, 0, OBJECTTYPE_SCRIPT, 0, PalletTownDodrioScript, -1
	object_event 26, 27, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PalletTownTeacherScript, -1
	object_event 31, 32, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PalletTownFisherScript, -1
