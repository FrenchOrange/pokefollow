	object_const_def
	const VIRIDIANNICKNAMESPEECHHOUSE_POKEFAN_M
	const VIRIDIANNICKNAMESPEECHHOUSE_LASS
	const VIRIDIANNICKNAMESPEECHHOUSE_SPEARY
	const VIRIDIANNICKNAMESPEECHHOUSE_RATTEY

ViridianNicknameSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianNicknameSpeechHousePokefanMScript:
	jumptextfaceplayer ViridianNicknameSpeechHousePokefanMText

ViridianNicknameSpeechHouseLassScript:
	jumptextfaceplayer ViridianNicknameSpeechHouseLassText

Speary:
	opentext
	writetext SpearyText
	cry SPEAROW
	waitbutton
	closetext
	end

Rattey:
	opentext
	writetext RatteyText
	cry RATTATA
	waitbutton
	closetext
	end

ViridianNicknameSpeechHousePokefanMText:
	text "Do you put a lot"
	line "of thought into"

	para "naming your"
	line "#MON?"

	para "Giving them good"
	line "nicknames adds to"

	para "the fun of trading"
	line "with others."
	done

ViridianNicknameSpeechHouseLassText:
	text "They're SPEARY--"
	line "a SPEAROW--and"
	cont "RATTEY--a RATTATA."
	done

SpearyText:
	text "SPEARY: Ch-chun!"
	done

RatteyText:
	text "RATTEY: Kikiii!"
	done

ViridianNicknameSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, VIRIDIAN_CITY, 2
	warp_event  4,  9, VIRIDIAN_CITY, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianNicknameSpeechHousePokefanMScript, -1
	object_event  7,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianNicknameSpeechHouseLassScript, -1
	object_event  7,  4, SPRITE_SPEAROW, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Speary, -1
	object_event  8,  5, SPRITE_RATTATA, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Rattey, -1
