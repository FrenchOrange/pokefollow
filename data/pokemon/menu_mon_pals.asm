; code from Polished/Rangi's tutorial, palettes by Major Agnostic
MACRO menu_mon_pals
	dn PAL_MON_\1, PAL_MON_\2
ENDM

FollowingPalLookupTable::
; Entries map party_menu pals to OW pals.
	db PAL_OW_RED    ; PAL_MON_RED
	db PAL_OW_BLUE   ; PAL_MON_BLUE
	db PAL_OW_GREEN  ; PAL_MON_GREEN
	db PAL_OW_BROWN  ; PAL_MON_BROWN
	db PAL_OW_PINK   ; PAL_MON_PINK
	db PAL_OW_BLUE   ; PAL_MON_GRAY
	db PAL_OW_GREEN  ; PAL_MON_TEAL
	db PAL_OW_PINK   ; PAL_MON_PURPLE

MenuMonPals::
	table_width 1, MenuMonPals
	;             normal, shiny
	menu_mon_pals GREEN,  GREEN  ; BULBASAUR
	menu_mon_pals GREEN,  GREEN  ; IVYSAUR
	menu_mon_pals GREEN,  GREEN  ; VENUSAUR
	menu_mon_pals RED,    BROWN  ; CHARMANDER
	menu_mon_pals RED,    BROWN  ; CHARMELEON
	menu_mon_pals RED,    BLUE   ; CHARIZARD
	menu_mon_pals BLUE,   GREEN  ; SQUIRTLE
	menu_mon_pals BLUE,   GREEN  ; WARTORTLE
	menu_mon_pals BLUE,   GREEN  ; BLASTOISE
	menu_mon_pals GREEN,  BROWN  ; CATERPIE
	menu_mon_pals GREEN,  BROWN  ; METAPOD
	menu_mon_pals PINK,   GREEN  ; BUTTERFREE
	menu_mon_pals RED,    PINK   ; WEEDLE
	menu_mon_pals BROWN,  GREEN  ; KAKUNA
	menu_mon_pals RED,    BLUE   ; BEEDRILL
	menu_mon_pals BROWN,  GREEN  ; PIDGEY
	menu_mon_pals BROWN,  GREEN  ; PIDGEOTTO
	menu_mon_pals RED,    GREEN  ; PIDGEOT
	menu_mon_pals PINK,   GREEN  ; RATTATA
	menu_mon_pals BROWN,  RED    ; RATICATE
	menu_mon_pals BROWN,  GREEN  ; SPEAROW
	menu_mon_pals BROWN,  GREEN  ; FEAROW
	menu_mon_pals PINK,   GREEN  ; EKANS
	menu_mon_pals PINK,   BROWN  ; ARBOK
	menu_mon_pals RED,    PINK   ; PIKACHU
	menu_mon_pals RED,    BROWN  ; RAICHU
	menu_mon_pals BROWN,  GREEN  ; SANDSHREW
	menu_mon_pals BROWN,  RED    ; SANDSLASH
	menu_mon_pals BLUE,   PINK   ; NIDORAN_F
	menu_mon_pals BLUE,   PINK   ; NIDORINA
	menu_mon_pals BLUE,   GREEN  ; NIDOQUEEN
	menu_mon_pals PINK,   BLUE   ; NIDORAN_M
	menu_mon_pals PINK,   BLUE   ; NIDORINO
	menu_mon_pals PINK,   BLUE   ; NIDOKING
	menu_mon_pals PINK,   GREEN  ; CLEFAIRY
	menu_mon_pals PINK,   GREEN  ; CLEFABLE
	menu_mon_pals RED,    BROWN  ; VULPIX
	menu_mon_pals BROWN,  BLUE   ; NINETALES
	menu_mon_pals PINK,   GREEN  ; JIGGLYPUFF
	menu_mon_pals PINK,   GREEN  ; WIGGLYTUFF
	menu_mon_pals BLUE,   GREEN  ; ZUBAT
	menu_mon_pals BLUE,   GREEN  ; GOLBAT
	menu_mon_pals GREEN,  BROWN  ; ODDISH
	menu_mon_pals RED,    BROWN  ; GLOOM
	menu_mon_pals RED,    BROWN  ; VILEPLUME
	menu_mon_pals RED,    BROWN  ; PARAS
	menu_mon_pals RED,    BROWN  ; PARASECT
	menu_mon_pals PINK,   BLUE   ; VENONAT
	menu_mon_pals PINK,   BLUE   ; VENOMOTH
	menu_mon_pals BROWN,  BLUE   ; DIGLETT
	menu_mon_pals BROWN,  BLUE   ; DUGTRIO
	menu_mon_pals BROWN,  PINK   ; MEOWTH
	menu_mon_pals BROWN,  PINK   ; PERSIAN
	menu_mon_pals BROWN,  BLUE   ; PSYDUCK
	menu_mon_pals BLUE,   BLUE   ; GOLDUCK
	menu_mon_pals BROWN,  GREEN  ; MANKEY
	menu_mon_pals BROWN,  GREEN  ; PRIMEAPE
	menu_mon_pals RED,    GREEN  ; GROWLITHE
	menu_mon_pals RED,    GREEN  ; ARCANINE
	menu_mon_pals BLUE,   BLUE   ; POLIWAG
	menu_mon_pals BLUE,   BLUE   ; POLIWHIRL
	menu_mon_pals BLUE,   GREEN  ; POLIWRATH
	menu_mon_pals BROWN,  PINK   ; ABRA
	menu_mon_pals BROWN,  PINK   ; KADABRA
	menu_mon_pals BROWN,  PINK   ; ALAKAZAM
	menu_mon_pals BLUE,   BROWN  ; MACHOP
	menu_mon_pals BLUE,   GREEN  ; MACHOKE
	menu_mon_pals BLUE,   GREEN  ; MACHAMP
	menu_mon_pals GREEN,  BROWN  ; BELLSPROUT
	menu_mon_pals GREEN,  BROWN  ; WEEPINBELL
	menu_mon_pals GREEN,  BROWN  ; VICTREEBEL
	menu_mon_pals BLUE,   GREEN  ; TENTACOOL
	menu_mon_pals BLUE,   GREEN  ; TENTACRUEL
	menu_mon_pals BROWN,  RED    ; GEODUDE
	menu_mon_pals BROWN,  RED    ; GRAVELER
	menu_mon_pals BROWN,  RED    ; GOLEM
	menu_mon_pals RED,    BROWN  ; PONYTA
	menu_mon_pals RED,    PINK   ; RAPIDASH
	menu_mon_pals PINK,   BLUE   ; SLOWPOKE
	menu_mon_pals PINK,   BLUE   ; SLOWBRO
	menu_mon_pals BLUE,   BROWN  ; MAGNEMITE
	menu_mon_pals BLUE,   BROWN  ; MAGNETON
	menu_mon_pals BROWN,  GREEN  ; FARFETCH_D
	menu_mon_pals BROWN,  GREEN  ; DODUO
	menu_mon_pals BROWN,  GREEN  ; DODRIO
	menu_mon_pals RED,    PINK   ; SEEL
	menu_mon_pals BLUE,   BLUE   ; DEWGONG
	menu_mon_pals PINK,   BLUE   ; GRIMER
	menu_mon_pals PINK,   GREEN  ; MUK
	menu_mon_pals PINK,   BROWN  ; SHELLDER
	menu_mon_pals PINK,   BLUE   ; CLOYSTER
	menu_mon_pals PINK,   BLUE   ; GASTLY
	menu_mon_pals PINK,   BLUE   ; HAUNTER
	menu_mon_pals RED,    PINK   ; GENGAR
	menu_mon_pals BROWN,  GREEN  ; ONIX
	menu_mon_pals BROWN,  PINK   ; DROWZEE
	menu_mon_pals BROWN,  PINK   ; HYPNO
	menu_mon_pals RED,    GREEN  ; KRABBY
	menu_mon_pals RED,    GREEN  ; KINGLER
	menu_mon_pals RED,    BLUE   ; VOLTORB
	menu_mon_pals RED,    BLUE   ; ELECTRODE
	menu_mon_pals PINK,   GREEN  ; EXEGGCUTE
	menu_mon_pals GREEN,  BROWN  ; EXEGGUTOR
	menu_mon_pals BROWN,  GREEN  ; CUBONE
	menu_mon_pals BROWN,  GREEN  ; MAROWAK
	menu_mon_pals BROWN,  GREEN  ; HITMONLEE
	menu_mon_pals PINK,   GREEN  ; HITMONCHAN
	menu_mon_pals RED,    PINK   ; LICKITUNG
	menu_mon_pals PINK,   BLUE   ; KOFFING
	menu_mon_pals PINK,   BLUE   ; WEEZING
	menu_mon_pals BLUE,   BROWN  ; RHYHORN
	menu_mon_pals BLUE,   BLUE   ; RHYDON
	menu_mon_pals PINK,   GREEN  ; CHANSEY
	menu_mon_pals BLUE,   GREEN  ; TANGELA
	menu_mon_pals BROWN,  GREEN  ; KANGASKHAN
	menu_mon_pals BLUE,   BLUE   ; HORSEA
	menu_mon_pals BLUE,   BLUE   ; SEADRA
	menu_mon_pals PINK,   BROWN  ; GOLDEEN
	menu_mon_pals RED,    BROWN  ; SEAKING
	menu_mon_pals BROWN,  BLUE   ; STARYU
	menu_mon_pals PINK,   BLUE   ; STARMIE
	menu_mon_pals PINK,   GREEN  ; MR__MIME
	menu_mon_pals GREEN,  GREEN  ; SCYTHER
	menu_mon_pals RED,    PINK   ; JYNX
	menu_mon_pals BROWN,  GREEN  ; ELECTABUZZ
	menu_mon_pals RED,    PINK   ; MAGMAR
	menu_mon_pals BROWN,  BLUE   ; PINSIR
	menu_mon_pals BROWN,  GREEN  ; TAUROS
	menu_mon_pals RED,    BROWN  ; MAGIKARP
	menu_mon_pals BLUE,   RED    ; GYARADOS
	menu_mon_pals BLUE,   PINK   ; LAPRAS
	menu_mon_pals PINK,   BLUE   ; DITTO
	menu_mon_pals BROWN,  BLUE   ; EEVEE
	menu_mon_pals BLUE,   PINK   ; VAPOREON
	menu_mon_pals BROWN,  GREEN  ; JOLTEON
	menu_mon_pals RED,    BROWN  ; FLAREON
	menu_mon_pals PINK,   BLUE   ; PORYGON
	menu_mon_pals BLUE,   BROWN  ; OMANYTE
	menu_mon_pals BLUE,   BROWN  ; OMASTAR
	menu_mon_pals BROWN,  GREEN  ; KABUTO
	menu_mon_pals BROWN,  GREEN  ; KABUTOPS
	menu_mon_pals PINK,   BLUE   ; AERODACTYL
	menu_mon_pals BLUE,   BLUE   ; SNORLAX
	menu_mon_pals BLUE,   BLUE   ; ARTICUNO
	menu_mon_pals BROWN,  RED    ; ZAPDOS
	menu_mon_pals RED,    PINK   ; MOLTRES
	menu_mon_pals BLUE,   PINK   ; DRATINI
	menu_mon_pals BLUE,   PINK   ; DRAGONAIR
	menu_mon_pals RED,    GREEN  ; DRAGONITE
	menu_mon_pals PINK,   GREEN  ; MEWTWO
	menu_mon_pals PINK,   BLUE   ; MEW
	menu_mon_pals GREEN,  BROWN  ; CHIKORITA
	menu_mon_pals GREEN,  BROWN  ; BAYLEEF
	menu_mon_pals GREEN,  GREEN  ; MEGANIUM
	menu_mon_pals RED,    PINK   ; CYNDAQUIL
	menu_mon_pals RED,    PINK   ; QUILAVA
	menu_mon_pals RED,    PINK   ; TYPHLOSION
	menu_mon_pals BLUE,   GREEN  ; TOTODILE
	menu_mon_pals BLUE,   GREEN  ; CROCONAW
	menu_mon_pals BLUE,   GREEN  ; FERALIGATR
	menu_mon_pals BROWN,  PINK   ; SENTRET
	menu_mon_pals BROWN,  PINK   ; FURRET
	menu_mon_pals BROWN,  GREEN  ; HOOTHOOT
	menu_mon_pals BROWN,  GREEN  ; NOCTOWL
	menu_mon_pals RED,    BROWN  ; LEDYBA
	menu_mon_pals RED,    BROWN  ; LEDIAN
	menu_mon_pals GREEN,  PINK   ; SPINARAK
	menu_mon_pals RED,    PINK   ; ARIADOS
	menu_mon_pals PINK,   PINK   ; CROBAT
	menu_mon_pals BLUE,   BLUE   ; CHINCHOU
	menu_mon_pals BLUE,   PINK   ; LANTURN
	menu_mon_pals RED,    BROWN  ; PICHU
	menu_mon_pals PINK,   GREEN  ; CLEFFA
	menu_mon_pals PINK,   GREEN  ; IGGLYBUFF
	menu_mon_pals RED,    BLUE   ; TOGEPI
	menu_mon_pals RED,    BLUE   ; TOGETIC
	menu_mon_pals GREEN,  GREEN  ; NATU
	menu_mon_pals GREEN,  GREEN  ; XATU
	menu_mon_pals BLUE,   PINK   ; MAREEP
	menu_mon_pals PINK,   PINK   ; FLAAFFY
	menu_mon_pals BROWN,  BLUE   ; AMPHAROS
	menu_mon_pals GREEN,  BLUE   ; BELLOSSOM
	menu_mon_pals BLUE,   GREEN  ; MARILL
	menu_mon_pals BLUE,   BROWN  ; AZUMARILL
	menu_mon_pals GREEN,  PINK   ; SUDOWOODO
	menu_mon_pals GREEN,  BLUE   ; POLITOED
	menu_mon_pals PINK,   GREEN  ; HOPPIP
	menu_mon_pals GREEN,  PINK   ; SKIPLOOM
	menu_mon_pals BLUE,   PINK   ; JUMPLUFF
	menu_mon_pals PINK,   PINK   ; AIPOM
	menu_mon_pals GREEN,  BROWN  ; SUNKERN
	menu_mon_pals GREEN,  BROWN  ; SUNFLORA
	menu_mon_pals RED,    BLUE   ; YANMA
	menu_mon_pals BLUE,   PINK   ; WOOPER
	menu_mon_pals BLUE,   PINK   ; QUAGSIRE
	menu_mon_pals PINK,   GREEN  ; ESPEON
	menu_mon_pals BROWN,  BLUE   ; UMBREON
	menu_mon_pals BLUE,   PINK   ; MURKROW
	menu_mon_pals PINK,   BLUE   ; SLOWKING
	menu_mon_pals BLUE,   BROWN  ; MISDREAVUS
	menu_mon_pals BROWN,  BLUE   ; UNOWN
	menu_mon_pals BLUE,   PINK   ; WOBBUFFET
	menu_mon_pals PINK,   BLUE   ; GIRAFARIG
	menu_mon_pals BLUE,   PINK   ; PINECO
	menu_mon_pals RED,    GREEN  ; FORRETRESS
	menu_mon_pals BLUE,   PINK   ; DUNSPARCE
	menu_mon_pals PINK,   BLUE   ; GLIGAR
	menu_mon_pals BLUE,   BROWN  ; STEELIX
	menu_mon_pals PINK,   BLUE   ; SNUBBULL
	menu_mon_pals PINK,   BLUE   ; GRANBULL
	menu_mon_pals BLUE,   PINK   ; QWILFISH
	menu_mon_pals RED,    GREEN  ; SCIZOR
	menu_mon_pals RED,    BLUE   ; SHUCKLE
	menu_mon_pals BLUE,   PINK   ; HERACROSS
	menu_mon_pals BLUE,   PINK   ; SNEASEL
	menu_mon_pals BROWN,  GREEN  ; TEDDIURSA
	menu_mon_pals BROWN,  GREEN  ; URSARING
	menu_mon_pals RED,    BLUE   ; SLUGMA
	menu_mon_pals RED,    BLUE   ; MAGCARGO
	menu_mon_pals BROWN,  BLUE   ; SWINUB
	menu_mon_pals BROWN,  BROWN  ; PILOSWINE
	menu_mon_pals PINK,   BLUE   ; CORSOLA
	menu_mon_pals BLUE,   BLUE   ; REMORAID
	menu_mon_pals RED,    GREEN  ; OCTILLERY
	menu_mon_pals RED,    PINK   ; DELIBIRD
	menu_mon_pals BLUE,   BLUE   ; MANTINE
	menu_mon_pals RED,    GREEN  ; SKARMORY
	menu_mon_pals RED,    BLUE   ; HOUNDOUR
	menu_mon_pals RED,    BLUE   ; HOUNDOOM
	menu_mon_pals BLUE,   PINK   ; KINGDRA
	menu_mon_pals BLUE,   BLUE   ; PHANPY
	menu_mon_pals BLUE,   BROWN  ; DONPHAN
	menu_mon_pals PINK,   BLUE   ; PORYGON2
	menu_mon_pals BROWN,  GREEN  ; STANTLER
	menu_mon_pals BROWN,  GREEN  ; SMEARGLE
	menu_mon_pals PINK,   BLUE   ; TYROGUE
	menu_mon_pals BROWN,  BLUE   ; HITMONTOP
	menu_mon_pals PINK,   PINK   ; SMOOCHUM
	menu_mon_pals BROWN,  BROWN  ; ELEKID
	menu_mon_pals RED,    BROWN  ; MAGBY
	menu_mon_pals PINK,   BLUE   ; MILTANK
	menu_mon_pals PINK,   PINK   ; BLISSEY
	menu_mon_pals PINK,   PINK   ; RAIKOU
	menu_mon_pals RED,    BROWN  ; ENTEI
	menu_mon_pals BLUE,   BLUE   ; SUICUNE
	menu_mon_pals GREEN,  GREEN  ; LARVITAR
	menu_mon_pals BLUE,   PINK   ; PUPITAR
	menu_mon_pals GREEN,  BROWN  ; TYRANITAR
	menu_mon_pals BLUE,   PINK   ; LUGIA
	menu_mon_pals RED,    BROWN  ; HO_OH
	menu_mon_pals GREEN,  PINK   ; CELEBI
	assert_table_length NUM_POKEMON
	menu_mon_pals RED,    RED    ; unused
	menu_mon_pals GREEN,  GREEN  ; EGG
	assert_table_length EGG
