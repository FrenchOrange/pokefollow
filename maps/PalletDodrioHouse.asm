	object_const_def
	const PALLETDODRIOHOUSE_SALESMAN
	const PALLETDODRIOHOUSE_DODRIO

PalletDodrioHouse_MapScripts:
	def_scene_scripts

	def_callbacks

PalletDodrioHouseSalesmanScript:
	jumptextfaceplayer PalletDodrioHouseSalesmanText

PalletDodrioHouseSalesmanText:
	text "I'm no trainer, my"
	line "DODRIO is made for"
	cont "telling the time,"
	cont "not fighting."

	para "No matter what,"
	line "you should love"
	cont "your #MON all"
	cont "the same."
	done

PalletDodrioHouseAsleepScript:
	opentext
	writetext PalletDodrioHouseAsleepText
	waitbutton
	closetext
	end

PalletDodrioHouseAsleepText:
	text "DODRIO is fast"
	line "asleep."

	para "Or at least two of"
	line "its heads are."
	done

PalletDodrioHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, PALLET_TOWN, 5
	warp_event  3,  7, PALLET_TOWN, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  4, SPRITE_SALESMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalletDodrioHouseSalesmanScript, -1
	object_event  6,  2, SPRITE_DODRIO_STATIC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, PalletDodrioHouseAsleepScript, -1
