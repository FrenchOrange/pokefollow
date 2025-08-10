	object_const_def
	const VIRIDIANTVSPEECHHOUSE_POKEFAN_M
	const VIRIDIANTVSPEECHHOUSE_BUG_CATCHER

ViridianTVSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianTVSpeechHousePokefanMScript:
	jumptextfaceplayer ViridianTVSpeechHousePokefanMText

ViridianTVSpeechHouseBugCatcherScript:
	jumptextfaceplayer ViridianTVSpeechHouseBugCatcherText

ViridianTVSpeechHousePokefanMText:
	text "You're from PALLET"
	line "TOWN, you say?"

	para "Definitely check"
	line "out our #MON"
	cont "CENTER then!"

	para "There should be"
	line "one in every town"
	cont "ahead."

	para "They don't charge"
	line "any money either!"
	done

ViridianTVSpeechHouseBugCatcherText:
	text "Did you catch the"
	line "LEAGUE battle on"
	cont "TV last night?"

	para "I got chills when"
	line "ONIX was sent out!"
	done

ViridianTVSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, VIRIDIAN_CITY, 6
	warp_event  4,  9, VIRIDIAN_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ViridianTVSpeechHousePokefanMScript, -1
	object_event  2,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianTVSpeechHouseBugCatcherScript, -1
