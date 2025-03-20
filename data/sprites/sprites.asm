MACRO overworld_sprite
; pointer, length, type, palette
	dw \1
	db \2 tiles, BANK(\1), \3, \4
ENDM

OverworldSprites:
; entries correspond to SPRITE_* constants
	table_width NUM_SPRITEDATA_FIELDS, OverworldSprites
	overworld_sprite ChrisSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite ChrisBikeSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite GameboyKidSpriteGFX, 12, STANDING_SPRITE, PAL_OW_GREEN
	overworld_sprite RivalSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite OakSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite RedSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite BlueSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite BillSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite ElderSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite ChrisPJSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite KurtSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite JimmysMomSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite BlaineSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite PlayersMomSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite DaisySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite ElmSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite WillSpriteGFX, 12, STANDING_SPRITE, PAL_OW_RED
	overworld_sprite FalknerSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite WhitneySpriteGFX, 12, WALKING_SPRITE, PAL_OW_PINK
	overworld_sprite BugsySpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite MortySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite ChuckSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite JasmineSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite PryceSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite ClairSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite BrockSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite KarenSpriteGFX, 12, STANDING_SPRITE, PAL_OW_RED
	overworld_sprite BrunoSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite MistySpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite LanceSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite SurgeSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite ErikaSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite KogaSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite SabrinaSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite CooltrainerMSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite CooltrainerFSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite BugCatcherSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite TwinSpriteGFX, 12, WALKING_SPRITE, PAL_OW_PINK
	overworld_sprite YoungsterSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite LassSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite TeacherSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite BeautySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite SuperNerdSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite RockerSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite PokefanMSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite PokefanFSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite GrampsSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite GrannySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite SwimmerGuySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite SwimmerGirlSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite BigSnorlaxSpriteGFX, 12, STANDING_SPRITE, PAL_OW_BLUE
	overworld_sprite SurfingPikachuSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite RocketSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite RocketGirlSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite NurseSpriteGFX, 12, STANDING_SPRITE, PAL_OW_PINK
	overworld_sprite LinkReceptionistSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite ClerkSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite FisherSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite FishingGuruSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite ScientistSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite KimonoGirlSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite SageSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite NurseWalkingSpriteGFX, 12, WALKING_SPRITE, PAL_OW_PINK
	overworld_sprite GentlemanSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite BlackBeltSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite ReceptionistSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite OfficerSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite JamesSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite RocketSlowpokeSpriteGFX, 4, STILL_SPRITE, PAL_OW_PINK
	overworld_sprite CaptainSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite BigLaprasSpriteGFX, 12, STANDING_SPRITE, PAL_OW_BLUE
	overworld_sprite GymGuideSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite SailorSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite BikerSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite PharmacistSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite MonsterSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite ChrisSwimSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite SalesmanSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite MistyFishSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite BigOnixSpriteGFX, 12, STANDING_SPRITE, PAL_OW_BROWN
	overworld_sprite N64SpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite SudowoodoSpriteGFX, 12, STANDING_SPRITE, PAL_OW_GREEN
	overworld_sprite SurfLaprasSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite PokeBallSpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite PokedexSpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite ReportSpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite VirtualBoySpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite BikeSpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite RockSpriteGFX, 4, STILL_SPRITE, PAL_OW_ROCK
	overworld_sprite BoulderSpriteGFX, 4, STILL_SPRITE, PAL_OW_ROCK
	overworld_sprite SnesSpriteGFX, 4, STILL_SPRITE, PAL_OW_BLUE
	overworld_sprite FamicomSpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite FruitTreeSpriteGFX, 4, STILL_SPRITE, PAL_OW_TREE
	overworld_sprite GoldTrophySpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite SilverTrophySpriteGFX, 4, STILL_SPRITE, PAL_OW_BLUE
	overworld_sprite KrisSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite KrisBikeSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite SubstituteSpriteGFX, 12, STANDING_SPRITE, PAL_OW_GREEN
	overworld_sprite SuicuneSpriteGFX, 4, STILL_SPRITE, PAL_OW_BLUE
	overworld_sprite EnteiSpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite RaikouSpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite JessieSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
 	overworld_sprite ChrisRunSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
 	overworld_sprite KrisRunSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite BlankSpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite DodrioStaticSpriteGFX, 12, STANDING_SPRITE, PAL_OW_BROWN
	overworld_sprite SurfGyaradosSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	assert_table_length NUM_OVERWORLD_SPRITES - 1
