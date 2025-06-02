DEF PEWTERMUSEUM_ENTRANCE_FEE EQU 50

	object_const_def
	const PEWTERMUSEUM_RECEPTIONIST
	const PEWTERMUSEUM_GRAMPS
	const PEWTERMUSEUM_YOUNGSTER
	const PEWTERMUSEUM_SUPER_NERD
	const PEWTERMUSEUM_SEYMOUR

PewterMuseum_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED
	
	def_callbacks

.DummyScene0:
	end

.DummyScene1:
	end

PewterMuseumReceptionistScript:
	opentext
	faceplayer
	checkevent EVENT_PEWTER_MUSEUM_BOUGHT_TICKET
	iftrue .AlreadyPaid
	writetext PewterMuseumEntranceCoordScript1Text
	waitbutton
	closetext
	turnobject PEWTERMUSEUM_RECEPTIONIST, LEFT
	end
.AlreadyPaid
	writetext PewterMuseumEntranceEnjoyText
	waitbutton
	closetext
	turnobject PEWTERMUSEUM_RECEPTIONIST, LEFT
	end

PewterMuseumEntranceCoordScript1:
	applymovement PLAYER, PewterMuseum_MoveData2
PewterMuseumEntranceCoordScript2:
	turnobject PLAYER, RIGHT
	opentext
	special PlaceMoneyTopRight
	writetext PewterMuseumEntranceCoordScript1Text
	promptbutton
	writetext PewterMuseumEntranceCoordScript1Text1
	yesorno
	iffalse .ComeAgain
	checkmoney YOUR_MONEY, PEWTERMUSEUM_ENTRANCE_FEE
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, PEWTERMUSEUM_ENTRANCE_FEE
	pause 10
	special PlaceMoneyTopRight
	playsound SFX_TRANSACTION
	waitsfx
	writetext PewterMuseumEntranceCoordScript1Text2
	waitbutton
	closetext
	setevent EVENT_PEWTER_MUSEUM_BOUGHT_TICKET
	setscene SCENE_FINISHED
	end
.NotEnoughMoney
	writetext PewterMuseumEntranceCoordScript1Text3
	waitbutton
.ComeAgain
	writetext PewterMuseumEntranceCoordScript1Text4
	waitbutton
	closetext
	applymovement PLAYER, PewterMuseum_MoveData1
	end

PewterMuseum_MoveData1:
	step DOWN
	step_end

PewterMuseum_MoveData2:
	step RIGHT
	step_end

PewterMuseumEntranceCoordScript1Text:
	text "Hello and welcome"
	line "to PEWTER MUSEUM"
	cont "OF SCIENCE!"
	done

PewterMuseumEntranceCoordScript1Text1:
	text "It's only ¥50 for"
	line "a child's ticket."

	para "Would you like to"
	line "come in?"
	done

PewterMuseumEntranceCoordScript1Text2:
	text "Right, ¥50!"
	line "Thank you!"
	done

PewterMuseumEntranceCoordScript1Text3:
	text "Oh… It seems you"
	line "don't have enough"
	cont "money."
	done

PewterMuseumEntranceCoordScript1Text4:
	text "Come again!"
	done

PewterMuseumEntranceEnjoyText:
	text "Take plenty of"
	line "time to look!"
	done

PewterMuseumGrampsScript:
	jumptextfaceplayer PewterMuseumGrampsText

PewterMuseumYoungsterScript:
	jumptextfaceplayer PewterMuseumYoungsterText

PewterMuseumSuperNerdScript:
	jumptextfaceplayer PewterMuseumSuperNerdText

PewterMuseumSeymourScript:
	jumptextfaceplayer PewterMuseumSeymourText

PewterMuseumGrampsText:
	text "Those are some"
	line "magnificent"
	cont "artefacts!"
	done

PewterMuseumYoungsterText:
	text "What's so special"
	line "about MOON STONES"
	cont "anyway?"

	para "Do #MON like"
	line "them or something?"
	done

PewterMuseumSuperNerdText:
	text "We're proud to own"
	line "fossils of such"
	cont "rare, prehistoric"
	cont "#MON!"
	done

PewterMuseumSeymourText:
	text "SEYMOUR: Howdy!"
	done

PewterMuseumMoonStoneExhibit:
	jumptext PewterMuseumMoonStoneExhibitText

PewterMuseumMoonStoneExhibitText:
	text "Meteorites that"
	line "fell on MT.MOON."

	para "These are tought"
	line "to be MOON STONES."
	done

PewterMuseum_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 17, PEWTER_CITY, 6
	warp_event  9, 17, PEWTER_CITY, 6

	def_coord_events
	coord_event  8, 14, SCENE_DEFAULT, PewterMuseumEntranceCoordScript1
	coord_event  9, 14, SCENE_DEFAULT, PewterMuseumEntranceCoordScript2

	def_bg_events
	bg_event  8,  8, BGEVENT_READ, PewterMuseumMoonStoneExhibit

	def_object_events
	object_event 11, 14, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterMuseumReceptionistScript, -1
	object_event  5,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMuseumGrampsScript, -1
	object_event 16,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterMuseumYoungsterScript, -1
	object_event  4, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMuseumSuperNerdScript, -1
	object_event 24,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMuseumSeymourScript, -1
