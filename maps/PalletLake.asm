	object_const_def
	const ROUTE1_MISTY

PalletLake_MapScripts:
	def_scene_scripts

	def_callbacks

PalletLake_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8, 18, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
