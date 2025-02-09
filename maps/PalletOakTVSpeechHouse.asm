	object_const_def
	const PALLETOAKTVSPEECHHOUSE_POKEFAN_F
	const PALLETOAKTVSPEECHHOUSE_TWIN

PalletOakTVSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

PalletOakTVSpeechHousePokefanFScript:
	jumptextfaceplayer PalletOakTVSpeechHousePokefanFText

PalletOakTVSpeechHouseTwinScript:
	jumptextfaceplayer PalletOakTVSpeechHouseTwinText

PalletOakTVSpeechHousePokefanFText:
	text "My baby's so eager"
	line "to leave the nest"
	cont "and go explore the"
	cont "region."

	para "In the mean time,"
	line "she tunes in to"
	cont "PROF. OAK's TV show"
	cont "every evening."
	done

PalletOakTVSpeechHouseTwinText:
	text "I'm so jealous,"
	line "you're old enough"
	cont "to start your"
	cont "#MON JOURNEY."

	para "I still have to"
	line "wait a few years."
	done

PalletOakTVSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, PALLET_TOWN, 4
	warp_event  3,  7, PALLET_TOWN, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalletOakTVSpeechHousePokefanFScript, -1
	object_event  2,  2, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PalletOakTVSpeechHouseTwinScript, -1
