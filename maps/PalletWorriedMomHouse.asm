	object_const_def
	const PALLETWORRIEDMOMHOUSE_POKEFAN_F

PalletWorriedMomHouse_MapScripts:
	def_scene_scripts

	def_callbacks

PalletWorriedMomHousePokefanFScript:
	jumptextfaceplayer PalletWorriedMomHousePokefanFText

PalletWorriedMomHousePokefanFText:
	text "Sniff. My little"
	line "baby just left"
	cont "today to go on a"
	cont "#MON journey."

	para "But say, <PLAYER>,"
	line "were you not"
	cont "supposed to go"

	para "with them at"
	line "PROF. OAK's lab?"

	para "Oh, you always"
	line "were a sleepyhead,"
	cont "<PLAYER>."
	done

PalletWorriedMomHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, PALLET_TOWN, 6
	warp_event  4,  9, PALLET_TOWN, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PalletWorriedMomHousePokefanFScript, -1
