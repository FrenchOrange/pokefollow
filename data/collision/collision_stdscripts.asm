; std scripts associated with tile collisions

MACRO stdcoll
	db \1
	dw (\2StdScript - StdScripts) / 3
ENDM

TileCollisionStdScripts:
	; collision type, std script
	stdcoll COLL_BOOKSHELF,        MagazineBookshelfScript
	stdcoll COLL_PC,               PCScript
	stdcoll COLL_RADIO,            Radio1Script
	stdcoll COLL_TOWN_MAP,         TownMapScript
	stdcoll COLL_MART_SHELF,       MerchandiseShelfScript
	stdcoll COLL_MART_SHELF_GLASS, MerchandiseShelfGlassScript
	stdcoll COLL_TV,               TVScript
	stdcoll COLL_WINDOW,           WindowScript
	stdcoll COLL_INCENSE_BURNER,   IncenseBurnerScript
	stdcoll COLL_TRASHCAN,         TrashcanScript
	stdcoll COLL_COMPUTER,         ComputerScript
	stdcoll COLL_BOOKSHELF_HARD,   DifficultBookshelfScript
	stdcoll COLL_STOVE,            StoveScript
	stdcoll COLL_MART,             MartSignScript
	db -1 ; end
