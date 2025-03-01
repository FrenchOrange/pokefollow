	object_const_def
	const ROUTE1_MISTY_FISH
	const ROUTE1_MISTY
	const ROUTE1_BIKE

PalletLake_MapScripts:
	def_scene_scripts

	def_callbacks

PalletLake_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8, 18, SPRITE_MISTY_FISH, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  8, 18, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MET_MISTY_PALLET_LAKE
	object_event  6, 21, SPRITE_BIKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MET_MISTY_PALLET_LAKE
