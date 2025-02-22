	object_const_def
	const REDSHOUSE2F_CLEFAIRY
	const REDSHOUSE2F_POLIWAG
	const REDSHOUSE2F_VOLTORB
	const REDSHOUSE2F_BIG_SNORLAX

RedsHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

RedsHouse2FTVScript:
	opentext
	checkevent EVENT_WATCHED_TV_ONCE
	iffalse .TV1Script
	iftrue .RedsHouse2FTVScript2
	end

.TV1Script:
	writetext RedsHouse2FTVText1
	waitbutton
	closetext
	setevent EVENT_WATCHED_TV_ONCE
	end

.RedsHouse2FTVScript2:
	checkevent EVENT_WATCHED_TV_TWICE
	iffalse .TV2Script
	writetext RedsHouse2FTVText3
	waitbutton
	closetext
	end

.TV2Script:
	writetext RedsHouse2FTVText2
	waitbutton
	closetext
	setevent EVENT_WATCHED_TV_TWICE
	end

RedsHouse2FPCScript:
	jumptext RedsHouse2FPCText

RedsHouse2FTVText1:
	text "A live televised"
	line "POKéMON battle!"

	para "NIDORINO begins"
	line "the battle with a"
	cont "HORN ATTACK--"

	para "But GENGAR bounces"
	line "right back!"
	done

RedsHouse2FTVText2:
	text "GENGAR retaliates"
	line "with HYPNOSIS."

	para "Wait! The trainer"
	line "recalls NIDORINO."

	para "Which POKéMON will"
	line "he use now?"

	para "Ah…"

	para "Gotta get going,"
	line "no time for TV!"
	done

RedsHouse2FTVText3:
	text "Ah…"

	para "Gotta get going,"
	line "no time for TV!"
	done

RedsHouse2FPCText:
	text "It looks like it"
	line "hasn't been used"
	cont "in a long time…"
	done

DebugColor:
	opentext
	writetext NowEnteringText
	pause 45
	special ColorPicker
	closetext
	end

RedsHouse2FCoinBankScript:
	opentext
	checkevent EVENT_GOT_COINS_FROM_COIN_BANK
	iftrue .GotCoins
	writetext RedsHouse2FCoinBankText
	waitbutton
	writetext RedsHouse2FGotCoinsText
	waitbutton
	waitsfx
	playsound SFX_TRANSACTION
	closetext
	givemoney $0, 100
	setevent EVENT_GOT_COINS_FROM_COIN_BANK
	end
.GotCoins:
	writetext RedsHouse2FCoinBankText
	waitbutton
	closetext
	end

RedsHouse2FCoinBankText:
	text "It's a CLEFAIRY"
	line "coin bank."
	done

RedsHouse2FGotCoinsText:
	text "Hey, there's 100¥"
	line "inside!"
	done

RedsHouse2FSharpenerScript:
	jumptext RedsHouse2FSharpenerText

RedsHouse2FSharpenerText:
	text "It's a POLIWAG"
	line "pencil sharpener."
	done

RedsHouse2FSnorlaxDollScript:
	jumptext RedsHouse2FSnorlaxDollText

RedsHouse2FSnorlaxDollText:
	text "An old SNORLAX"
	line "beanbag chair."
	done

NowEnteringText:
	text "NOW ENTERING..."
	line "COLOR PICKER MENU."
	done

DebugSign:
	opentext
; full pokegear
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	setflag ENGINE_MAP_CARD
	setflag ENGINE_RADIO_CARD
	setflag ENGINE_EXPN_CARD
; pokedex
	setflag ENGINE_POKEDEX
; useful items
	giveitem BICYCLE
	giveitem MASTER_BALL, 99
	giveitem RARE_CANDY, 99
	giveitem MAX_REPEL, 99
	giveitem ESCAPE_ROPE, 99
	giveitem BERRY, 99
; useful moves
	giveitem HM_CUT
	giveitem HM_FLY
	giveitem HM_SURF
	giveitem HM_STRENGTH
	giveitem HM_FLASH
	giveitem HM_WHIRLPOOL
	giveitem HM_WATERFALL
	giveitem TM_ROCK_SMASH, 99
	giveitem TM_HEADBUTT, 99
; all badges
	setflag ENGINE_ZEPHYRBADGE
	setflag ENGINE_HIVEBADGE
	setflag ENGINE_PLAINBADGE
	setflag ENGINE_FOGBADGE
	setflag ENGINE_STORMBADGE
	setflag ENGINE_MINERALBADGE
	setflag ENGINE_GLACIERBADGE
	setflag ENGINE_RISINGBADGE
	setflag ENGINE_BOULDERBADGE
	setflag ENGINE_CASCADEBADGE
	setflag ENGINE_THUNDERBADGE
	setflag ENGINE_RAINBOWBADGE
	setflag ENGINE_MARSHBADGE
	setflag ENGINE_SOULBADGE
	setflag ENGINE_VOLCANOBADGE
	setflag ENGINE_EARTHBADGE
; fly anywhere
	setflag ENGINE_FLYPOINT_NEW_BARK
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	setflag ENGINE_FLYPOINT_VIOLET
	setflag ENGINE_FLYPOINT_AZALEA
	setflag ENGINE_FLYPOINT_GOLDENROD
	setflag ENGINE_FLYPOINT_ECRUTEAK
	setflag ENGINE_FLYPOINT_OLIVINE
	setflag ENGINE_FLYPOINT_CIANWOOD
	setflag ENGINE_FLYPOINT_MAHOGANY
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	setflag ENGINE_FLYPOINT_BLACKTHORN
	setflag ENGINE_FLYPOINT_SILVER_CAVE
	setflag ENGINE_FLYPOINT_INDIGO_PLATEAU
	setflag ENGINE_FLYPOINT_PALLET
	setflag ENGINE_FLYPOINT_VIRIDIAN
	setflag ENGINE_FLYPOINT_PEWTER
	setflag ENGINE_FLYPOINT_CERULEAN
	setflag ENGINE_FLYPOINT_VERMILION
	setflag ENGINE_FLYPOINT_CELADON
	setflag ENGINE_FLYPOINT_ROCK_TUNNEL
	setflag ENGINE_FLYPOINT_LAVENDER
	setflag ENGINE_FLYPOINT_FUCHSIA
	setflag ENGINE_FLYPOINT_SAFFRON
	setflag ENGINE_FLYPOINT_CINNABAR
; debug team
	givepoke FERALIGATR, 100
	givepoke PIDGEOT, 100
	givepoke LAPRAS, 100
	givepoke PIKACHU, 100
	closetext
; debug hm
	loadmem wPartyMon1Moves+0, SURF
	loadmem wPartyMon1Moves+1, ROCK_SMASH
	loadmem wPartyMon2Moves+0, FLY
	loadmem wPartyMon2Moves+1, STRENGTH
	loadmem wPartyMon2Moves+2, CUT
	loadmem wPartyMon3Moves+2, WATERFALL
	loadmem wPartyMon4Moves+0, FLASH
	loadmem wPartyMon4Moves+1, HEADBUTT
; warp some place else
;	playsound SFX_WARP_TO
;	special ClearBGPalettesBufferScreen
;	waitsfx
;	warp NEW_BARK_TOWN, 13, 06
;	warp ROUTE_23, 11, 06
	end

RedsHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, REDS_HOUSE_1F, 3
	warp_event  4,  9, REDS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  1,  3, BGEVENT_READ, RedsHouse2FTVScript
	bg_event  0,  3, BGEVENT_READ, RedsHouse2FPCScript
	bg_event  5,  2, BGEVENT_READ, DebugColor
	bg_event  2,  3, BGEVENT_READ, DebugSign

	def_object_events
	object_event  0,  9, SPRITE_CLEFAIRY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, RedsHouse2FCoinBankScript, -1
	object_event  7,  8, SPRITE_POLIWAG, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RedsHouse2FSharpenerScript, -1
	object_event  7,  3, SPRITE_VOLTORB, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  1,  6, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsHouse2FSnorlaxDollScript, -1
