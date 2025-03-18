	object_const_def
	const REDSHOUSE2F_CLEFAIRY
	const REDSHOUSE2F_POLIWAG
	const REDSHOUSE2F_VOLTORB
	const REDSHOUSE2F_BIG_SNORLAX
	const REDSHOUSE2F_REDS_MOM

RedsHouse2F_MapScripts:
	def_scene_scripts
	scene_script RedsHouse2FNoop1Scene, SCENE_REDSHOUSE2F_MEET_MOM
	scene_script RedsHouse2FNoop2Scene, SCENE_REDSHOUSE2F_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, RedsHouse2FInitializeRoomCallback

RedsHouse2FNoop1Scene:
	end

RedsHouse2FNoop2Scene:
	end

RedsHouse2FInitializeRoomCallback:
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInitialization
	jumpstd InitializeEventsScript
	endcallback

.SkipInitialization:
	endcallback

GetToBedScript:
	applymovement PLAYER, RedsHouse2FPlayerMovesBack
	checkevent EVENT_GOT_SCOLDED_BY_MOM
	iftrue .AlreadyScolded
	readvar VAR_XCOORD
	ifequal 3, .MomOnLeft
	ifequal 4, .MomOnRight
.GetToBedCont
	playsound SFX_EXIT_BUILDING
	appear REDSHOUSE2F_REDS_MOM
	pause 5
	opentext
	writetext MomGoToBedText
	promptbutton
	turnobject REDSHOUSE2F_REDS_MOM, LEFT
	writetext MomIts11PMText
	promptbutton
	turnobject REDSHOUSE2F_REDS_MOM, UP
	writetext MomJourneyTomorrowText
	promptbutton
	closetext
	turnobject REDSHOUSE2F_REDS_MOM, DOWN
	pause 5
	disappear REDSHOUSE2F_REDS_MOM
	playsound SFX_EXIT_BUILDING
	waitsfx
	setevent EVENT_GOT_SCOLDED_BY_MOM
	end

.MomOnLeft:
	moveobject REDSHOUSE2F_REDS_MOM, 3, 9
	sjump .GetToBedCont

.MomOnRight:
	moveobject REDSHOUSE2F_REDS_MOM, 4, 9
	sjump .GetToBedCont

.AlreadyScolded:
	opentext
	writetext MomBestNotRepeatText
	promptbutton
	closetext
	end

MomGoToBedText:
	text "MOM: <PLAYER>!"
	line "Get to bed!"
	done

MomIts11PMText:
	text "It's 11 P.M., you"
	line "should be asleep!"
	done

MomJourneyTomorrowText:
	text "You begin your"
	line "#MON journey"
	cont "tomorrow, so you"
	cont "need rest."

	para "Just head to bed"
	line "already, okay?"
	done

MomBestNotRepeatText:
	text "It's best not to"
	line "make mom repeat"
	cont "herself."
	done

RedsHouse2FPlayerMovesBack:
	turn_head DOWN
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

RedsHouse2FBedScript:
	checkscene
	iftrue .NoTimeToSleep
	applymovement PLAYER, RedsHouse2FMovementData_PlayerSpinsClockwiseEndsFacingDown
	setflag ENGINE_PLAYER_IS_FEMALE
	setval (PAL_NPC_GREEN << 4)
	special SetPlayerPalette
	special UpdatePlayerSprite
	applymovement PLAYER, RedsHouse2FMovementData_PlayerSpinsClockwiseEndsFacingDown
	pause 20

	special FadeOutMusic
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	pause 35
	applymovement PLAYER, RedsHouse2FMoveToVoid
	applymovement PLAYER, RedsHouse2FHideObjectMovement
	special FadeInFromBlack

	opentext
	writetext RedsHouse2FIChooseYouText
	promptbutton
	closetext
	pause 20

	reanchormap
	pokepic BULBASAUR
	pause 35
	closepokepic
	opentext
	writetext RedsHouse2FBulbasaurText
	promptbutton
	closetext

	reanchormap
	pokepic SQUIRTLE
	pause 35
	closepokepic
	opentext
	writetext RedsHouse2FSquirtleText
	promptbutton
	closetext

	reanchormap
	pokepic CHARMANDER
	pause 35
	closepokepic
	opentext
	writetext RedsHouse2FCharmanderText
	promptbutton
	closetext

	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	playsound SFX_STRENGTH
	waitsfx
	playsound SFX_BUMP
	waitsfx
	applymovement PLAYER, RedsHouse2FMoveBackFromVoid
	applymovement PLAYER, RedsHouse2FShowObjectMovement
	turnobject PLAYER, DOWN
	special FadeInFromBlack

	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, LEFT
	pause 5
	turnobject PLAYER, RIGHT
	pause 5
	turnobject PLAYER, DOWN
	opentext
	writetext RedsHouse2FWhatTimeText
	promptbutton
	closetext

	special RestartMapMusic
	setevent EVENT_WATCHED_TV_ONCE
	setevent EVENT_WATCHED_TV_TWICE
	setscene SCENE_REDSHOUSE2F_NOOP
	end

.NoTimeToSleep:
	jumptext RedsHouse2FNoTimeToSleepText
	end

RedsHouse2FIChooseYouText:
	text "Zzzz… … … Mmhh."
	line "I choose you…"
	done

RedsHouse2FBulbasaurText:
	text "Raising BULBASAUR."
	line "That'd be really"
	cont "simple."

	para "It's perfect for"
	line "beginners."
	done

RedsHouse2FSquirtleText:
	text "Then… … zzz."
	line "There's SQUIRTLE."

	para "Choose it or lose"
	line "it… yawn."
	done

RedsHouse2FCharmanderText:
	text "Oh, hold on."
	line "CHARMANDER."

	para "Those in the know"
	line "say that's the best"
	cont "way to go."
	done

RedsHouse2FWhatTimeText:
	text "Oh, no! What time"
	line "is it?"
	done

RedsHouse2FNoTimeToSleepText:
	text "No time to nap!"
	done

RedsHouse2FMovementData_PlayerSpinsClockwiseEndsFacingDown:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

RedsHouse2FHideObjectMovement:
	hide_object
	step_end

RedsHouse2FShowObjectMovement:
	show_object
	step_end

RedsHouse2FMoveToVoid:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RedsHouse2FMoveBackFromVoid:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

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

RedsHouse2FRadioScript:
	jumptext RedsHouse2FRadioText

RedsHouse2FRadioText:
	text "It hasn't been used"
	line "in a long time."

	para "Mom got fed up"
	line "with hearing the"
	cont "#RAP on repeat…"
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

DebugColor:
	opentext
	writetext NowEnteringText
	pause 45
	special ColorPicker
	closetext
	end

NowEnteringText:
	text "NOW ENTERING..."
	line "COLOR PICKER MENU."
	done

DebugSign:
	opentext
; useful flags
	setflag ENGINE_POKEDEX
	setevent EVENT_GOT_PROPER_CLOTHES
	setscene SCENE_REDSHOUSE2F_NOOP	
; useful items
	giveitem BICYCLE
	giveitem OLD_ROD
	giveitem GOOD_ROD
	giveitem SUPER_ROD
	giveitem MASTER_BALL, 99
	giveitem RARE_CANDY, 99
	giveitem MAX_REPEL, 99
	giveitem ESCAPE_ROPE, 99
	giveitem BERRY, 99
	giveitem EON_MAIL, 5
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
	setflag ENGINE_BOULDERBADGE
	setflag ENGINE_CASCADEBADGE
	setflag ENGINE_THUNDERBADGE
	setflag ENGINE_RAINBOWBADGE
	setflag ENGINE_MARSHBADGE
	setflag ENGINE_SOULBADGE
	setflag ENGINE_VOLCANOBADGE
	setflag ENGINE_EARTHBADGE
;	setflag ENGINE_ZEPHYRBADGE
;	setflag ENGINE_HIVEBADGE
;	setflag ENGINE_PLAINBADGE
;	setflag ENGINE_FOGBADGE
;	setflag ENGINE_STORMBADGE
;	setflag ENGINE_MINERALBADGE
;	setflag ENGINE_GLACIERBADGE
;	setflag ENGINE_RISINGBADGE
; fly anywhere
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
	setflag ENGINE_FLYPOINT_INDIGO_PLATEAU
;	setflag ENGINE_FLYPOINT_NEW_BARK
;	setflag ENGINE_FLYPOINT_CHERRYGROVE
;	setflag ENGINE_FLYPOINT_VIOLET
;	setflag ENGINE_FLYPOINT_AZALEA
;	setflag ENGINE_FLYPOINT_GOLDENROD
;	setflag ENGINE_FLYPOINT_ECRUTEAK
;	setflag ENGINE_FLYPOINT_OLIVINE
;	setflag ENGINE_FLYPOINT_CIANWOOD
;	setflag ENGINE_FLYPOINT_MAHOGANY
;	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
;	setflag ENGINE_FLYPOINT_BLACKTHORN
;	setflag ENGINE_FLYPOINT_SILVER_CAVE
; debug team
	givepoke FERALIGATR, 100
	givepoke PIDGEOT, 100
	givepoke LAPRAS, 100
	givepoke PIKACHU, 100
	givepoke UNOWN, 5
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
;	warp ROUTE_23, 11, 06
	end

RedsHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, REDS_HOUSE_1F, 3
	warp_event  4,  9, REDS_HOUSE_1F, 3

	def_coord_events
	coord_event  3,  9, SCENE_REDSHOUSE2F_MEET_MOM, GetToBedScript
	coord_event  4,  9, SCENE_REDSHOUSE2F_MEET_MOM, GetToBedScript

	def_bg_events
	bg_event  7,  4, BGEVENT_READ, RedsHouse2FBedScript
	bg_event  1,  3, BGEVENT_READ, RedsHouse2FTVScript
	bg_event  0,  3, BGEVENT_READ, RedsHouse2FRadioScript
	bg_event  5,  2, BGEVENT_READ, DebugColor
	bg_event  2,  3, BGEVENT_READ, DebugSign

	def_object_events
	object_event  0,  9, SPRITE_CLEFAIRY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, RedsHouse2FCoinBankScript, -1
	object_event  7,  8, SPRITE_POLIWAG, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RedsHouse2FSharpenerScript, -1
	object_event  1,  6, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsHouse2FSnorlaxDollScript, -1
	object_event  7,  3, SPRITE_VOLTORB, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 10, -1, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INVISIBLE_NPC
