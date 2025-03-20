	object_const_def
	const JIMMYSHOUSE2F_CONSOLE
	const JIMMYSSHOUSE2F_DOLL

JimmysHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

JimmysHouseDollScript:
	jumptext JimmysHouseDollText

JimmysHouseGameConsoleScript:
	jumptext JimmysHouseGameConsoleText

JimmysHouseBookshelfScript:
	jumpstd PictureBookshelfScript

JimmysHousePCScript:
	jumptext JimmysHousePCText

JimmysHouseDollText:
	text "An old, well-loved"
	line "POKé DOLL."
	done

JimmysHouseGameConsoleText:
	text "A Nintendo 64,"
	line "brand new too!"

	para "Maybe its owner"
	line "won't mind a quick"
	cont "play session."
	done

JimmysHousePCText:
	text "The wallpaper is a"
	line "photo of a boy in"
	cont "a cap and a girl"
	cont "with blue hair."
	done

JimmysHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, JIMMYS_HOUSE_1F, 3
	warp_event  4,  9, JIMMYS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  3, BGEVENT_UP, JimmysHousePCScript
	bg_event  1,  3, BGEVENT_READ, JimmysHouseBookshelfScript

	def_object_events
	object_event  5,  3, SPRITE_N64, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JimmysHouseGameConsoleScript, -1
	object_event  6,  4, SPRITE_CLEFAIRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, JimmysHouseDollScript, -1
