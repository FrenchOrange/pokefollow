	object_const_def
	const JIMMYSNEIGHBORSHOUSE_COOLTRAINER_F
	const JIMMYSNEIGHBORSHOUSE_POKEFAN_F

JimmysNeighborsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

JimmysNeighborsDaughterScript:
	jumptextfaceplayer JimmysNeighborsDaughterText

JimmysNeighborScript:
	jumptextfaceplayer JimmysNeighborText

JimmysNeighborsHouseBookshelfScript:
	jumpstd MagazineBookshelfScript

JimmysNeighborsDaughterText:
	text "PIKACHU is an"
	line "evolved #MON."

	para "I was amazed by"
	line "PROF.ELM's find-"
	cont "ings."

	para "He's so famous for"
	line "his research on"
	cont "#MON evolution."

	para "…sigh…"

	para "I wish I could be"
	line "a researcher like"
	cont "him…"
	done

JimmysNeighborText:
	text "My daughter is"
	line "adamant about"

	para "becoming PROF."
	line "ELM's assistant."

	para "She really loves"
	line "#MON!"

	para "But then, so do I!"
	done

JimmysNeighborsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 3
	warp_event  3,  7, NEW_BARK_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, JimmysNeighborsHouseBookshelfScript
	bg_event  1,  1, BGEVENT_READ, JimmysNeighborsHouseBookshelfScript

	def_object_events
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, JimmysNeighborsDaughterScript, -1
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, JimmysNeighborScript, -1
