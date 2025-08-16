	object_const_def
	const POKECENTER2F_TRADE_RECEPTIONIST
	const POKECENTER2F_BATTLE_RECEPTIONIST
	const POKECENTER2F_RULES_RECEPTIONIST

Pokecenter2F_MapScripts:
	def_scene_scripts
	scene_script Pokecenter2FNoopScene,             SCENE_POKECENTER2F_NOOP
	scene_script Pokecenter2FLeaveTradeCenterScene, SCENE_POKECENTER2F_LEAVE_TRADE_CENTER
	scene_script Pokecenter2FLeaveColosseumScene,   SCENE_POKECENTER2F_LEAVE_COLOSSEUM

	def_callbacks
	callback MAPCALLBACK_TILES, Pokecenter2FTileCallback

Pokecenter2FNoopScene:
	end

Pokecenter2FTileCallback:
	checkscene
	ifequal SCENE_POKECENTER2F_LEAVE_TRADE_CENTER, .LeaveTradeCenter
	ifequal SCENE_POKECENTER2F_LEAVE_COLOSSEUM, .LeaveColosseum
	endcallback

.LeaveTradeCenter:
	changeblock 10, 4, $3d ; open gate
	endcallback

.LeaveColosseum:
	changeblock 6, 4, $3c ; open gate
	endcallback

Pokecenter2FLeaveTradeCenterScene:
	sdefer Script_LeftCableTradeCenter
	end

Pokecenter2FLeaveColosseumScene:
	sdefer Script_LeftCableColosseum
	end

LinkReceptionistScript_Trade:
	opentext
	writetext Text_TradeReceptionistIntro
	yesorno
	iffalse .Cancel
	special SetBitsForLinkTradeRequest
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout_Receptionist
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	applymovementlasttalked PokecenterMovementData_ReceptionistOpenGate
	waitsfx
	playsound SFX_ENTER_DOOR
	changeblock 10, 4, $3d ; open gate
	reloadmappart
	pause 15
	applymovementlasttalked PokecenterMovementData_ReceptionistBackInPlace
	applymovement PLAYER, PokecenterMovementData_PlayerWalksToWarp
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext YourFriendIsNotReadyText
	closetext
	end

.LinkedToFirstGen:
	special FailedLinkToPast
	writetext Text_CantLinkToThePast
	special CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
.Cancel:
	closetext
	end

LinkReceptionistScript_Battle:
	opentext
	writetext Text_BattleReceptionistIntro
	yesorno
	iffalse .Cancel
	special SetBitsForBattleRequest
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout_Receptionist
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	applymovementlasttalked PokecenterMovementData_ReceptionistOpenGate
	waitsfx
	playsound SFX_ENTER_DOOR
	changeblock 6, 4, $3c ; open gate
	reloadmappart
	pause 15
	applymovementlasttalked PokecenterMovementData_ReceptionistBackInPlace
	applymovement PLAYER, PokecenterMovementData_PlayerWalksToWarp
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext YourFriendIsNotReadyText
	closetext
	end

.LinkedToFirstGen:
	special FailedLinkToPast
	writetext Text_CantLinkToThePast
	special CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
.Cancel:
	closetext
	end

Script_LeftCableTradeCenter:
	special WaitForOtherPlayerToExit
	scall Script_WalkOutOfLinkTradeRoom
	setscene SCENE_POKECENTER2F_NOOP
	setmapscene TRADE_CENTER, SCENE_TRADECENTER_INITIALIZE
	end

Script_LeftCableColosseum:
	special WaitForOtherPlayerToExit
	scall Script_WalkOutOfLinkBattleRoom
	setscene SCENE_POKECENTER2F_NOOP
	setmapscene COLOSSEUM, SCENE_COLOSSEUM_INITIALIZE
	end

Script_WalkOutOfLinkTradeRoom:
	applymovement PLAYER, Pokecenter2FMovementData_PlayerMovesDownToDesk
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistMovesToGate
	waitsfx
	playsound SFX_ENTER_DOOR
	refreshscreen
	changeblock 10, 4, $3b ; close gate
	reloadmappart
	pause 15
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistBackInPlace
	end

Script_WalkOutOfLinkBattleRoom:
	applymovement PLAYER, Pokecenter2FMovementData_PlayerMovesDownToDesk
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistMovesToGate
	waitsfx
	playsound SFX_ENTER_DOOR
	refreshscreen
	changeblock 6, 4, $2b ; close gate
	reloadmappart
	pause 15
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistBackInPlace
	end

PokecenterMovementData_ReceptionistOpenGate:
	slow_step LEFT
	turn_head DOWN
	step_end

PokecenterMovementData_ReceptionistBackInPlace:
	slow_step RIGHT
	turn_head LEFT
	step_end

PokecenterMovementData_PlayerWalksToWarp:
	step LEFT
	step UP
	step UP
	step UP
	step_end

Pokecenter2FMovementData_PlayerMovesDownToDesk:
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	turn_head UP
	step_end

Pokecenter2FMovementData_ReceptionistMovesToGate:
	slow_step LEFT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_ReceptionistBackInPlace:
	slow_step RIGHT
	turn_head DOWN
	step_end

RulesReceptionistScript:
	opentext
	checkevent EVENT_TALKED_TO_POKECENTER_RULES_RECEPTIONIST
	iftrue .AlreadyTalkedTo
	farwritetext Text_RulesReceptionist_Hello
	waitbutton
	farwritetext Text_RulesReceptionist_Repeat
	waitbutton
	farwritetext Text_RulesReceptionist_Enjoy
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_POKECENTER_RULES_RECEPTIONIST
	end

.AlreadyTalkedTo:
	farwritetext Text_RulesReceptionist_HelloAgain
	yesorno
	iffalse .SaidNoToReceptionist
	farwritetext Text_RulesReceptionist_ExplainAgain
	waitbutton
	farwritetext Text_RulesReceptionist_Repeat
	waitbutton
.SaidNoToReceptionist:
	farwritetext Text_RulesReceptionist_Enjoy
	waitbutton
	closetext
	end

Pokecenter2FLinkRecordSign:
	reanchormap
	special DisplayLinkRecord
	closetext
	end


Text_BattleReceptionistIntro:
	text "Welcome to CABLE"
	line "CLUB COLOSSEUM."

	para "You may battle a"
	line "friend here."

	para "Would you like to"
	line "battle?"
	done

Text_TradeReceptionistIntro:
	text "Welcome to CABLE"
	line "TRADE CENTER."

	para "You may trade your"
	line "#MON here with"
	cont "a friend."

	para "Would you like to"
	line "trade?"
	done

YourFriendIsNotReadyText:
	text "Your friend is not"
	line "ready."
	prompt

Text_MustSaveGame:
	text "Before opening the"
	line "link, you must"
	cont "save your game."
	done

Text_PleaseWait:
	text "Please wait."
	done

Text_LinkTimedOut:
	text "The link has been"
	line "closed because of"
	cont "inactivity."

	para "Please contact"
	line "your friend and"
	cont "come again."
	prompt

Text_PleaseComeAgain:
	text "Please come again."
	prompt

Text_CantLinkToThePast:
	text "You can't link to"
	line "the past here."
	prompt

Text_IncompatibleRooms:
	text "Incompatible rooms"
	line "were chosen."
	prompt

Text_PleaseComeIn:
	text "Please come in."
	done

Text_RejectNewMon:
	text "Sorry--@"
	text_ram wStringBuffer1
	text_start
	line "can't be taken."
	prompt

Text_RejectMonWithNewMove:
	text "You can't take the"
	line "@"
	text_ram wStringBuffer1
	text " with a"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

Text_RejectMonWithMail:
	text "You can't take the"
	line "@"
	text_ram wStringBuffer1
	text " that"
	cont "has MAIL with you."
	prompt

Text_RulesReceptionist_Hello:
	text "Hello!"

	para "Is this your first"
	line "time up here?"

	para "I'll show you how"
	line "the CABLE CLUB"
	cont "works."

	para "First, I need to"
	line "show you this"
	cont "floor of our"
	cont "#MON CENTER."
	done

Text_RulesReceptionist_Repeat:
	text "On the top floor,"
	line "there are two"
	cont "rooms."

	para "First, the room on"
	line "the left. It's the"
	cont "CABLE COLOSSEUM."

	para "You may link up"
	line "with TRAINERS"
	cont "around you who"

	para "also entered the"
	line "COLOSSEUM."

	para "There you may"
	line "engage in battles"
	cont "with one another."

	para "Second, the room"
	line "on the right is"
	cont "the CABLE TRADE"
	cont "CENTER."

	para "You may trade"
	line "#MON with your"
	cont "friends in this"
	cont "room."

	para "To link up, you"
	line "need to have a"
	cont "GAME LINK CABLE"
	cont "connected."
	done

Text_RulesReceptionist_Enjoy:
	text "I hope you enjoy"
	line "the CABLE CLUB."
	done

Text_RulesReceptionist_HelloAgain:
	text "Hello again!"

	para "Is there anything"
	line "you need to ask me"
	cont "about linking?"
	done

Text_RulesReceptionist_ExplainAgain:
	text "Let me explain how"
	line "the CABLE CLUB"
	cont "works."
	done

Text_BrokeStadiumRules:
	text "Excuse me!"

	para "For STADIUM rules,"
	line "please bring six"

	para "different #MON,"
	line "excluding EGGS."

	para "The six #MON"
	line "must be different."

	para "Also, they must"
	line "not be holding"
	cont "identical items."

	para "Please come back"
	line "when you're ready."
	done

Pokecenter2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  7, POKECENTER_2F, -1
	warp_event 10,  2, TRADE_CENTER, 1
	warp_event  6,  2, COLOSSEUM, 1

	def_coord_events

	def_bg_events
	bg_event 13,  4, BGEVENT_READ, Pokecenter2FLinkRecordSign

	def_object_events
	object_event 11,  3, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Trade, -1
	object_event  7,  3, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Battle, -1
	object_event  3,  3, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RulesReceptionistScript, -1
