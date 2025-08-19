	object_const_def
	const VIRIDIANCITY_GRAMPS1
	const VIRIDIANCITY_GRAMPS2
	const VIRIDIANCITY_FISHER
	const VIRIDIANCITY_YOUNGSTER1
	const VIRIDIANCITY_YOUNGSTER2
	const VIRIDIANCITY_LASS
	const VIRIDIANCITY_OFFICER_JENNY
	const VIRIDIANCITY_ROCKET1
	const VIRIDIANCITY_ROCKET2

ViridianCity_MapScripts:
	def_scene_scripts
	scene_script ViridianCityNoop1Scene, SCENE_VIRIDIAN_CITY_POKECENTER
	scene_script ViridianCityNoop2Scene, SCENE_VIRIDIAN_CITY_GYM_GUARD
	scene_script ViridianCityNoop3Scene, SCENE_VIRIDIAN_CITY_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, ViridianCityFlypointCallback

ViridianCityFlypointCallback:
	setflag ENGINE_FLYPOINT_VIRIDIAN
	endcallback

ViridianCityNoop1Scene:
	end

ViridianCityNoop2Scene:
	end

ViridianCityNoop3Scene:
	end

CatchingTutorialGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_MET_TEAM_ROCKET_VIRIDIAN
	iffalse .IsYourPokemonHurt
	readvar VAR_BOXSPACE
	ifequal 0, .BoxFull
	checkevent EVENT_LEARNED_TO_CATCH_POKEMON
	iftrue .LearnedAlready
	writetext CatchingTutorialIntroText
.CatchingTutorialCont
	yesorno
	iffalse .Declined
	closetext
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

.IsYourPokemonHurt:
	writetext CatchingTutorialPokemonHurtText
	waitbutton
	closetext
	end

.BoxFull:
	writetext CatchingTutorialBoxFullText
	waitbutton
	closetext
	end

.LearnedAlready:
	writetext CatchingTutorialRepeatText
	sjump .CatchingTutorialCont

.Declined:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	end

CatchingTutorialPokemonHurtText:
	text "Oh dear, your"
	line "#MON is in bad"
	cont "shape."

	para "Don't worry, lad."
	line "NURSE JOY does"
	cont "wonderful work."
	done

CatchingTutorialBoxFullText:
	text "#MON hide in"
	line "the grass. Who"

	para "knows when they'll"
	line "pop out…"
	done

CatchingTutorialIntroText:
	text "You're new to #-"
	line "MON training, uh?"

	para "How many have you"
	line "caught?"

	para "Would you like me"
	line "to show you how to"
	cont "catch #MON?"
	done

CatchingTutorialDebriefText:
	text "That's how you do"
	line "it."

	para "If you weaken them"
	line "first, #MON are"
	cont "easier to catch."
	done

CatchingTutorialDeclinedText:
	text "Oh. Fine, then."

	para "Anyway, if you"
	line "want to catch"

	para "#MON, you have"
	line "to walk a lot."
	done

CatchingTutorialRepeatText:
	text "Huh? You want me"
	line "to show you how to"
	cont "catch #MON?"
	done

ViridianCityGrampsNearGym:
	faceplayer
	opentext
	checkevent EVENT_CAN_ACCESS_VIRIDIAN_GYM
	iftrue .LeaderReturned
	writetext ViridianCityGrampsNearGymText
	waitbutton
	closetext
	end

.LeaderReturned:
	writetext ViridianCityGrampsNearGymBlueReturnedText
	waitbutton
	closetext
	end

ViridianCityDreamEaterFisher:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM42_DREAM_EATER
	iftrue .GotDreamEater
	writetext ViridianCityDreamEaterFisherText
	promptbutton
	verbosegiveitem TM_DREAM_EATER
	iffalse .NoRoomForDreamEater
	setevent EVENT_GOT_TM42_DREAM_EATER
.GotDreamEater:
	writetext ViridianCityDreamEaterFisherGotDreamEaterText
	waitbutton
.NoRoomForDreamEater:
	closetext
	end

ViridianCityYoungster1Script:
	jumptextfaceplayer ViridianCityYoungster1Text

ViridianCityYoungster2Script:
	faceplayer
	opentext
	writetext ViridianCityYoungster2YouWantToKnowAboutText
	yesorno
	iffalse .no
	writetext ViridianCityYoungster2CaterpieAndWeedleDescriptionText
	waitbutton
	closetext
	end

.no:
	writetext ViridianCityYoungster2OkThenText
	waitbutton
	closetext
	end

ViridianCityLassScript:
	jumptextfaceplayer ViridianCityLassText

ViridianCityOfficerJennyScript:
	faceplayer
	checkevent EVENT_MET_TEAM_ROCKET_VIRIDIAN
	iftrue .PostPokecenterJenny
	checkevent EVENT_TALKED_TO_VIRIDIAN_JENNY
	iftrue .TalkedToViridianJenny
	showemote EMOTE_SHOCK, VIRIDIANCITY_OFFICER_JENNY, 15
	opentext
	writetext ViridianCityOfficerJenny_FirstTime1
	waitbutton
	closetext
	showemote EMOTE_QUESTION, VIRIDIANCITY_OFFICER_JENNY, 15
	opentext
	writetext ViridianCityOfficerJenny_FirstTime2
	waitbutton
	closetext
	turnobject VIRIDIANCITY_OFFICER_JENNY, UP
	pause 15
	showemote EMOTE_SHOCK, VIRIDIANCITY_OFFICER_JENNY, 15
	faceplayer
	opentext
	writetext ViridianCityOfficerJenny_FirstTime3
	waitbutton
	closetext
	closetext
	follow VIRIDIANCITY_OFFICER_JENNY, PLAYER
	applymovement VIRIDIANCITY_OFFICER_JENNY, OfficerJennyWalkToPokecenter1
	stopfollow
	opentext
	writetext ViridianCityOfficerJenny_WeveArrivedText1
	waitbutton
	closetext
	turnobject VIRIDIANCITY_OFFICER_JENNY, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext ViridianCityOfficerJenny_WeveArrivedText2
	waitbutton
	closetext
	applymovement VIRIDIANCITY_OFFICER_JENNY, OfficerJennyWalkToPokecenter2
	pause 5
	disappear VIRIDIANCITY_OFFICER_JENNY
	appear VIRIDIANCITY_OFFICER_JENNY
	turnobject PLAYER, UP
	setevent EVENT_TALKED_TO_VIRIDIAN_JENNY
	end

.PostPokecenterJenny:
	opentext
	writetext ViridianCityOfficerJenny_PostPokecenterText
	waitbutton
	closetext
	end

.TalkedToViridianJenny
	opentext
	writetext ViridianCityOfficerJenny_TalkedToText
	waitbutton
	closetext
	follow VIRIDIANCITY_OFFICER_JENNY, PLAYER
	applymovement VIRIDIANCITY_OFFICER_JENNY, OfficerJennyWalkToPokecenter1
	stopfollow
	opentext
	writetext ViridianCityOfficerJenny_WeveArrivedText1
	waitbutton
	closetext
	turnobject VIRIDIANCITY_OFFICER_JENNY, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext ViridianCityOfficerJenny_WeveArrivedText2
	closetext
	applymovement VIRIDIANCITY_OFFICER_JENNY, OfficerJennyWalkToPokecenter2
	pause 5
	disappear VIRIDIANCITY_OFFICER_JENNY
	appear VIRIDIANCITY_OFFICER_JENNY
	turnobject PLAYER, UP
	end

ViridianCityOfficerJenny_FirstTime1:
	text "Hold it! And just"
	line "where do you think"
	cont "you're going with"

	para "that #MON,"
	line "young man?"
	done

ViridianCityOfficerJenny_FirstTime2:
	text "Oh, your #MON"
	line "is hurt?"

	para "I'm sorry, I"
	line "thought you might"
	cont "be stealing it."

	para "Let me see your"
	line "TRAINER CARD, hmm."
	done

ViridianCityOfficerJenny_FirstTime3:
	text "Everything is in"
	line "order! Now, we"
	cont "should take your"

	para "@"
	text_ram wPartyMon1Nickname
	text " to the"
	line "#MON CENTER."

	para "I'll get you there"
	line "in no time at all."
	done

ViridianCityOfficerJenny_TalkedToText:
	text "<PLAYER>!"
	line "Did you get lost"
	cont "on the way?"

	para "It's alright. Let"
	line "me take you to the"
	cont "#MON CENTER."
	done

ViridianCityOfficerJenny_WeveArrivedText1:
	text "We've arrived!"
	line "Pretty neat, don't"
	cont "you think?"
	done

ViridianCityOfficerJenny_WeveArrivedText2:
	text "The staff will"
	line "take good care of"
	cont "@"
	text_ram wPartyMon1Nickname
	text ", I just"
	cont "know it."
	done

ViridianCityOfficerJenny_PostPokecenterText:
	text "You know, you're"
	line "the fourth person"
	cont "I've seen today"
	cont "from PALLET TOWN."

	para "But things didn't"
	line "get as explosive"
	cont "with them."

	para "Stay safe and out"
	line "of trouble on your"
	cont "travel, young man!"
	done

OfficerJennyWalkToPokecenter1:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step LEFT
	turn_head UP
	step_end

OfficerJennyWalkToPokecenter2:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

ViridianCityGruntScript:
	faceplayer
	opentext
	writetext ViridianCityGruntText
	waitbutton
	closetext
	turnobject VIRIDIANCITY_ROCKET1, DOWN
	turnobject VIRIDIANCITY_ROCKET2, DOWN
	end

ViridianCitySign:
	jumptext ViridianCitySignText

ViridianGymSign:
	jumptext ViridianGymSignText

ViridianCityTrainerTips1:
	jumptext ViridianCityTrainerTips1Text

ViridianCityTrainerTips2:
	jumptext ViridianCityTrainerTips2Text

ViridianSchoolSign:
	jumptext ViridianSchoolSignText

ViridianPoliceStationSign:
	opentext
	checkevent EVENT_MET_TEAM_ROCKET_VIRIDIAN
	iftrue .NoPoster
	writetext ViridianPoliceStationText
	waitbutton
	closetext
	end
.NoPoster:
	writetext ViridianPoliceStation_NoPosterText
	waitbutton
	closetext
	end

ViridianCityPokecenterSign:
	jumpstd PokecenterSignScript

ViridianCityGrampsNearGymText:
	text "This #MON GYM"
	line "is always closed."

	para "Its LEADER is a"
	line "mysterious figure,"
	cont "who only comes by"
	cont "rarely."
	done

ViridianCityGrampsNearGymBlueReturnedText:
	text "Are you going to"
	line "battle the LEADER?"

	para "Good luck to you."
	line "You'll need it."
	done

ViridianCityDreamEaterFisherText:
	text "Yawn!"

	para "I must have dozed"
	line "off in the sun."

	para "…I had this dream"
	line "about a DROWZEE"

	para "eating my dream."
	line "Weird, huh?"

	para "Huh?"
	line "What's this?"

	para "Where did this TM"
	line "come from?"

	para "This is spooky!"
	line "Here, you can have"
	cont "this TM."
	done

ViridianCityDreamEaterFisherGotDreamEaterText:
	text "TM42 contains"
	line "DREAM EATER…"

	para "…Zzzzz…"
	done

ViridianCityYoungster1Text:
	text "Those # BALLs"
	line "at your waist…"
	cont "You're a TRAINER!"

	para "It's great that"
	line "you can carry and"
	cont "use #MON any"
	cont "time, anywhere!"
	done

ViridianCityYoungster2YouWantToKnowAboutText:
	text "You want to know"
	line "about the 2 kinds"
	cont "of caterpillar"
	cont "#MON?"
	done

ViridianCityYoungster2OkThenText:
	text "Oh, okay then!"
	done

ViridianCityYoungster2CaterpieAndWeedleDescriptionText:
	text "CATERPIE has no"
	line "poison, but"
	cont "WEEDLE does."

	para "Watch out for its"
	line "POISON STING!"
	done

ViridianCityLassText:
	text "When I go shop in"
	line "PEWTER CITY, I"
	cont "have to take the"

	para "winding trail in"
	line "VIRIDIAN FOREST."

	para "Sigh…"

	para "If my POKéMON knew"
	line "CUT, I could take"
	cont "the side path."
	done

ViridianCityGruntText:
	text "Move over kid."

	para "Nothing to see"
	line "around here."
	done

ViridianCitySignText:
	text "VIRIDIAN CITY"

	para "The Eternally"
	line "Green Paradise"
	done

ViridianGymSignText:
	text "VIRIDIAN CITY"
	line "#MON GYM"
	cont "LEADER: …"

	para "The rest of the"
	line "text is illegible…"
	done

ViridianCityTrainerTips1Text:
	text "TRAINER TIPS"

	para "Catch #MON"
	line "and expand your"
	cont "collection!"

	para "The more you have,"
	line "the easier it is"
	cont "to fight!"
	done

ViridianCityTrainerTips2Text:
	text "TRAINER TIPS"

	para "The battle moves"
	line "of #MON are"
	cont "limited by their"
	cont "POWER POINTs, PP."

	para "To replenish PP,"
	line "rest your tired"
	cont "#MON at a"
	cont "#MON CENTER!"
	done

ViridianSchoolSignText:
	text "VIRIDIAN #MON"
	line "SCHOOL"
	done

ViridianPoliceStationText:
	text "VIRIDIAN CITY"
	line "POLICE STATION"

	para "There's a wanted"
	line "poster stuck here"
	cont "as well."
	done

ViridianPoliceStation_NoPosterText:
	text "VIRIDIAN CITY"
	line "POLICE STATION"

	para "Uh?"

	para "The wanted poster"
	line "was torn off!"
	done

ViridianCityHiddenAntidote:
	hiddenitem ANTIDOTE, EVENT_VIRIDIAN_CITY_HIDDEN_ANTIDOTE

ViridianCity_PokeCenterCutscene1:
	applymovement PLAYER, ViridianCityPlayerMovesBackRight
	opentext
	writetext ViridianCityWalkBackText
	waitbutton
	closetext
	end

ViridianCity_PokeCenterCutscene2:
	applymovement PLAYER, ViridianCityPlayerMovesBackDown
	opentext
	writetext ViridianCityWalkBackText
	waitbutton
	closetext
	end

ViridianCityPlayerMovesBackRight:
	turn_head LEFT
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

ViridianCityPlayerMovesBackDown:
	turn_head UP
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

ViridianCityWalkBackText:
	text "It's too dangerous"
	line "to head this way."

	para "There should be a"
	line "#MON CENTER in"
	cont "VIRIDIAN CITY."
	done

ViridianCity_GymGuardCutscene:
	turnobject VIRIDIANCITY_ROCKET1, RIGHT
	opentext
	writetext ViridianCityGymGuardText1
	waitbutton
	closetext
	turnobject VIRIDIANCITY_ROCKET2, LEFT
	opentext
	writetext ViridianCityGymGuardText2
	waitbutton
	closetext
	applymovement PLAYER, ViridianCityPlayerMovesBackDown
	playsound SFX_TACKLE
	waitsfx
	turnobject VIRIDIANCITY_ROCKET1, DOWN
	turnobject VIRIDIANCITY_ROCKET2, DOWN
	end

ViridianCityGymGuardText1:
	text "Now what do we"
	line "have here?"

	para "Little baby boy"
	line "thinks he can take"
	cont "on the BOSS?"
	done

ViridianCityGymGuardText2:
	text "Hey, don't spill"
	line "the beans, man."

	para "Just send him back"
	line "to his mommy."
	done

ViridianCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 37,  9, VIRIDIAN_GYM, 1
	warp_event 33, 21, VIRIDIAN_NICKNAME_SPEECH_HOUSE, 1
	warp_event  9, 21, VIRIDIAN_SCHOOL, 1
	warp_event 33, 17, VIRIDIAN_MART, 2
	warp_event 19, 15, VIRIDIAN_POKECENTER_1F, 1
	warp_event 37, 21, VIRIDIAN_TV_SPEECH_HOUSE, 1
	warp_event 13, 15, VIRIDIAN_THIEF_SPEECH_HOUSE, 1

	def_coord_events
	coord_event  2, 12, SCENE_VIRIDIAN_CITY_POKECENTER, ViridianCity_PokeCenterCutscene1
	coord_event  2, 13, SCENE_VIRIDIAN_CITY_POKECENTER, ViridianCity_PokeCenterCutscene1
	coord_event  2, 14, SCENE_VIRIDIAN_CITY_POKECENTER, ViridianCity_PokeCenterCutscene1
	coord_event  2, 15, SCENE_VIRIDIAN_CITY_POKECENTER, ViridianCity_PokeCenterCutscene1
	coord_event 22,  1, SCENE_VIRIDIAN_CITY_POKECENTER, ViridianCity_PokeCenterCutscene2
	coord_event 23,  1, SCENE_VIRIDIAN_CITY_POKECENTER, ViridianCity_PokeCenterCutscene2
	coord_event 24,  1, SCENE_VIRIDIAN_CITY_POKECENTER, ViridianCity_PokeCenterCutscene2
	coord_event 37, 10, SCENE_VIRIDIAN_CITY_POKECENTER, ViridianCity_GymGuardCutscene
	coord_event 37, 10, SCENE_VIRIDIAN_CITY_GYM_GUARD, ViridianCity_GymGuardCutscene

	def_bg_events
	bg_event 17, 21, BGEVENT_READ, ViridianCitySign
	bg_event 33,  9, BGEVENT_READ, ViridianGymSign
	bg_event 25,  1, BGEVENT_READ, ViridianCityTrainerTips1
	bg_event 33, 35, BGEVENT_READ, ViridianCityTrainerTips2
	bg_event  7, 21, BGEVENT_READ, ViridianSchoolSign
	bg_event 20, 15, BGEVENT_READ, ViridianCityPokecenterSign
	bg_event 17, 27, BGEVENT_READ, ViridianPoliceStationSign
	bg_event 12,  2, BGEVENT_ITEM, ViridianCityHiddenAntidote

	def_object_events
	object_event 22,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CatchingTutorialGrampsScript, -1
	object_event 32,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, -1
	object_event  6, 34, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianCityDreamEaterFisher, -1
	object_event 29, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianCityYoungster1Script, -1
	object_event 32, 26, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianCityYoungster2Script, -1
	object_event  9,  9, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityLassScript, -1
	object_event 14, 28, SPRITE_OFFICER_JENNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityOfficerJennyScript, -1
	object_event 36, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityGruntScript, EVENT_VIRIDIAN_CITY_GYM_GUARDS
	object_event 38, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityGruntScript, EVENT_VIRIDIAN_CITY_GYM_GUARDS
