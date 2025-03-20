	object_const_def
	const PLAYERSHOUSE1F_PLAYERS_MOM1
	const PLAYERSHOUSE1F_PLAYERS_MOM2
	const PLAYERSHOUSE1F_PLAYERS_MOM3

PlayersHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

PlayersMom:
	faceplayer
	opentext
	writetext PlayersMomText
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_PLAYERS_MOM1, LEFT
	end

PlayersMomText:
	text "MOM: Oh, <PLAYER>."

	para "You knew today was"
	line "an important day,"
	cont "and you slept in"
	cont "all the same."

	para "Hurry, maybe there"
	line "is still a #MON"
	cont "or two left!"
	done

PlayersMomHeal:
	faceplayer
	opentext
	writetext PlayersHouse1FMomYouShouldRestText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	playsound SFX_FULL_HEAL
	special HealParty
	pause 30
	special FadeInFromBlack
	opentext
	writetext PlayersHouse1FMomLookingGreatText
	waitbutton
	closetext
	end

PlayersHouse1FMomYouShouldRestText:
	text "MOM: <PLAYER>!"

	para "I hope you're not"
	line "pushing yourself"
	cont "too hard."

	para "You should take a"
	line "quick rest."
	done

PlayersHouse1FMomLookingGreatText:
	text "MOM: You and your"
	line "#MON are"
	cont "looking great!"

	para "Take care now."

	para "And don't forget"
	line "to change your"
	cont "underwear!"
	done

PlayersHouse1FBookshelf:
	jumpstd PictureBookshelfScript

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, PALLET_TOWN, 1
	warp_event  4,  9, PALLET_TOWN, 1
	warp_event  9,  2, PLAYERS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_READ, PlayersHouse1FBookshelf

	def_object_events
	object_event  6,  5, SPRITE_PLAYERS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersMom, EVENT_GOT_PROPER_CLOTHES
	object_event  6,  5, SPRITE_PLAYERS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, MORN | NITE, 0, OBJECTTYPE_SCRIPT, 0, PlayersMomHeal, EVENT_MOM_AND_OAK_INVISIBLE
	object_event  1,  4, SPRITE_PLAYERS_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, PlayersMomHeal, EVENT_MOM_AND_OAK_INVISIBLE
