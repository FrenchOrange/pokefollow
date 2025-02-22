	object_const_def
	const LAVENDERPOKEMONREFUGE_LASS
	const LAVENDERPOKEMONREFUGE_PSYDUCK
	const LAVENDERPOKEMONREFUGE_NIDORINO
	const LAVENDERPOKEMONREFUGE_PIDGEY

LavenderPokemonRefuge_MapScripts:
	def_scene_scripts

	def_callbacks

LavenderPokemonRefugeLassScript:
	jumptextfaceplayer LavenderPokemonRefugeLassText

PokemonRefugePsyduck:
	opentext
	writetext PokemonRefugePsyduckText
	cry PSYDUCK
	waitbutton
	closetext
	end

PokemonRefugeNidorino:
	opentext
	writetext PokemonRefugeNidorinoText
	cry NIDORINO
	waitbutton
	closetext
	end

PokemonRefugePidgey:
	opentext
	writetext PokemonRefugePidgeyText
	cry PIDGEY
	waitbutton
	closetext
	end

LavenderPokemonRefugeLassText:
	text "Some cold-hearted"
	line "people stop caring"
	cont "for their #MON."

	para "I'm here to take in"
	line "the poor homeless"
	cont "#MON and take"
	cont "care of them."
	done

PokemonRefugePsyduckText:
	text "PSYDUCK: Gu-guwa?"
	done

PokemonRefugeNidorinoText:
	text "NIDORINO: Gyun!"
	done

PokemonRefugePidgeyText:
	text "PIDGEY: Pijji!"
	done

LavenderPokemonRefuge_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, LAVENDER_TOWN, 2
	warp_event  4,  9, LAVENDER_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderPokemonRefugeLassScript, -1
	object_event  7,  6, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonRefugePsyduck, -1
	object_event  5,  7, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokemonRefugeNidorino, -1
	object_event  1,  5, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokemonRefugePidgey, -1
