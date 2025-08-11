	object_const_def
	const VIRIDIANTHIEFSPEECHHOUSE_TEACHER

ViridianThiefSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianThiefSpeechHouseTeacherScript:
	jumptextfaceplayer ViridianThiefSpeechHouseTeacherText

ViridianThiefSpeechHouseTeacherText:
	text "VIRIDIAN used to"
	line "be so peaceful."

	para "But nowadays,"
	line "OFFICER JENNY has"
	cont "to patrol the"

	para "streets to protect"
	line "us from #MON"
	cont "thieves."
	done

ViridianThiefSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, VIRIDIAN_CITY, 7
	warp_event  4,  9, VIRIDIAN_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianThiefSpeechHouseTeacherScript, -1