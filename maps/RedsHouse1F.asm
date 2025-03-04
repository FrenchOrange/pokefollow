	object_const_def
	const REDSHOUSE1F_REDS_MOM1
	const REDSHOUSE1F_REDS_MOM2
	const REDSHOUSE1F_REDS_MOM3

RedsHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

RedsMom:
	faceplayer
	opentext
	writetext RedsMomText
	waitbutton
	closetext
	turnobject REDSHOUSE1F_REDS_MOM1, LEFT
	end

RedsMomText:
	text "MOM: Oh, <PLAYER>."

	para "You knew today was"
	line "an important day,"
	cont "and you slept in"
	cont "all the same."

	para "Hurry, maybe there"
	line "is still a #MON"
	cont "or two left!"
	done

RedsMomHeal:
	faceplayer
	opentext
	writetext RedsHouse1FMomYouShouldRestText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	playsound SFX_FULL_HEAL
	special HealParty
	pause 30
	special FadeInFromBlack
	opentext
	writetext RedsHouse1FMomLookingGreatText
	waitbutton
	closetext
	end

RedsHouse1FMomYouShouldRestText:
	text "MOM: <PLAYER>!"

	para "I hope you're not"
	line "pushing yourself"
	cont "too hard."

	para "You should take a"
	line "quick rest."
	done

RedsHouse1FMomLookingGreatText:
	text "MOM: You and your"
	line "#MON are"
	cont "looking great!"

	para "Take care now."

	para "And don't forget"
	line "to change your"
	cont "underwear!"
	done

RedsHouse1FBookshelf:
	jumpstd PictureBookshelfScript

RedsHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, PALLET_TOWN, 1
	warp_event  4,  9, PALLET_TOWN, 1
	warp_event  9,  2, REDS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_READ, RedsHouse1FBookshelf

	def_object_events
	object_event  6,  5, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsMom, EVENT_GOT_PROPER_CLOTHES
	object_event  6,  5, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, MORN | NITE, 0, OBJECTTYPE_SCRIPT, 0, RedsMomHeal, EVENT_MOM_AND_OAK_INVISIBLE
	object_event  1,  4, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, RedsMomHeal, EVENT_MOM_AND_OAK_INVISIBLE
