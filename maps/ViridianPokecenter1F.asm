	object_const_def
	const VIRIDIANPOKECENTER1F_NURSE
	const VIRIDIANPOKECENTER1F_CHANSEY
	const VIRIDIANPOKECENTER1F_COOLTRAINER_M
	const VIRIDIANPOKECENTER1F_GENTLEMAN
	const VIRIDIANPOKECENTER1F_BUG_CATCHER

ViridianPokecenter1F_MapScripts:
	def_scene_scripts
	scene_script ViridianPokecenterNoop1Scene, SCENE_VIRIDIAN_POKECENTER_NOOP
	scene_script ViridianPokecenterNoop2Scene, SCENE_VIRIDIAN_POKECENTER_TEAM_ROCKET

	def_callbacks
	callback MAPCALLBACK_TILES, .SetUpStoneSlab

.SetUpStoneSlab:
	changeblock  4, 0, $3f ; slab
	changeblock  4, 2, $40 ; slab
	endcallback

ViridianPokecenterNoop1Scene:
	end

ViridianPokecenterNoop2Scene:
	end

ViridianPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

ViridianPokecenter1FChanseyScript:
	jumpstd PokecenterChanseyNurseScript

ViridianPokecenter1FCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_CAN_ACCESS_VIRIDIAN_GYM
	iftrue .LeaderReturned
	writetext ViridianPokecenter1FCooltrainerMText
	waitbutton
	closetext
	end

.LeaderReturned:
	writetext ViridianPokecenter1FCooltrainerMText_LeaderReturned
	waitbutton
	closetext
	end

ViridianPokecenter1FGentlemanScript:
	jumptextfaceplayer ViridianPokecenter1FGentlemanText

ViridianPokecenter1FBugCatcherScript:
	jumptextfaceplayer ViridianPokecenter1FBugCatcherText

ViridianPokecenter1FStoneSlab:
	jumptext ViridianStoneSlabText

ViridianPokecenter1FCooltrainerMText:
	text "Where in the world"
	line "is VIRIDIAN's GYM"

	para "LEADER? I wanted"
	line "to challenge him."
	done

ViridianPokecenter1FCooltrainerMText_LeaderReturned:
	text "There are no GYM"
	line "TRAINERS at the"
	cont "VIRIDIAN GYM."

	para "The LEADER claims"
	line "his policy is to"

	para "win without having"
	line "any underlings."
	done

ViridianPokecenter1FGentlemanText:
	text "You can use that"
	line "PC in the corner."

	para "The receptionist"
	line "told me. It's so"
	cont "kind of her!"
	done

ViridianPokecenter1FBugCatcherText:
	text "My dream is to be-"
	line "come a GYM LEADER."

	para "But maybe I should"
	line "buy a POTION or"
	cont "two first…"
	done

ViridianStoneSlabText:
	text "An old-looking"
	line "slab with #MON"
	cont "engravings."

	para "Hey! One of them"
	line "looks like the"
	cont "golden bird you"
	cont "saw on ROUTE 1."
	done

ViridianPokeCenterCutscene:
	applymovement PLAYER, ViridianPokecenterPlayerMovesBackDown
	applymovement FOLLOWER, ViridianPokecenterPlayerMovesBackDown
	opentext
	writetext ViridianStoneSlabText
	waitbutton
	closetext

	setevent EVENT_MET_TEAM_ROCKET_VIRIDIAN
	setscene SCENE_VIRIDIAN_POKECENTER_NOOP
	setmapscene VIRIDIAN_CITY, SCENE_VIRIDIAN_CITY_GYM_GUARD
	end

ViridianPokecenterPlayerMovesBackDown:
	turn_head DOWN
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

ViridianPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8,  9, VIRIDIAN_CITY, 5
	warp_event  1,  7, POKECENTER_2F, 1

	def_coord_events
	coord_event  8,  9, SCENE_VIRIDIAN_POKECENTER_TEAM_ROCKET, ViridianPokeCenterCutscene

	def_bg_events
	bg_event  4,  2, BGEVENT_READ, ViridianPokecenter1FStoneSlab

	def_object_events
	object_event  8,  3, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FNurseScript, -1
	object_event  9,  3, SPRITE_NURSE_CHANSEY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FChanseyScript, -1
	object_event 15,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FCooltrainerMScript, -1
	object_event 13,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FGentlemanScript, -1
	object_event  3,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FBugCatcherScript, -1
	object_event 10,  8, SPRITE_EKANS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  8, SPRITE_KOFFING, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7,  6, SPRITE_JESSIE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  9,  6, SPRITE_JAMES, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  8,  5, SPRITE_MEOWTH, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
