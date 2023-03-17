
CheatCoreCM.TerraformTiles = {
	MenuCategories = {
		getText("UI_CMRB_Terrain_Natural"), 
		getText("UI_CMRB_Terrain_Roads"),
		getText("UI_CMRB_Terrain_Tiles"),
		getText("UI_CMRB_Terrain_Carpets"),
		getText("UI_CMRB_Terrain_WoodFloors")
	},
	TileTypes = {
		Water = {Category = getText("UI_CMRB_Terrain_Natural"), Name = getText("UI_CMRB_Terrain_Water"), Ranges = {5,7}, Tileset = "blends_natural_02_"},
		Dirt = {Category = getText("UI_CMRB_Terrain_Natural"), Name = getText("UI_CMRB_Terrain_Dirt"), Ranges = {69,71}, Tileset = "blends_natural_01_"},
		Grass = {Category = getText("UI_CMRB_Terrain_Natural"), Name = getText("UI_CMRB_Terrain_GrassD"), Ranges = {21,23}, Tileset = "blends_natural_01_"},
		CutGrass = {Category = getText("UI_CMRB_Terrain_Natural"), Name = getText("UI_CMRB_Terrain_GrassC"), Ranges = {54}, Tileset = "blends_natural_01_"},
		
		AsphaltRoad = {Category = getText("UI_CMRB_Terrain_Roads"), Name = getText("UI_CMRB_Terrain_Asphalt"), Ranges = {85,87}, Tileset = "blends_street_01_"},
		ConcreteRoad = {Category = getText("UI_CMRB_Terrain_Roads"), Name = getText("UI_CMRB_Terrain_Concrete"),  Ranges = {53,55}, Tileset = "blends_street_01_"},
		PavedRoad = {Category = getText("UI_CMRB_Terrain_Roads"), Name = getText("UI_CMRB_Terrain_Paved"), Ranges = {101,103}, Tileset = "blends_street_01_"},
		
		PlainCeramic = {Category = getText("UI_CMRB_Terrain_Tiles"), Name = Translator.getMoveableDisplayName("White_Smooth_Tiles"), Ranges = {17}, Tileset = "floors_interior_tilesandwood_01_"},
		PlainCeramicBordered = {Category = getText("UI_CMRB_Terrain_Tiles"), Name = Translator.getMoveableDisplayName("White_Smooth_Tiles")..getText("UI_CMRB_Terrain_Bordered"), Ranges = {16}, Tileset = "floors_interior_tilesandwood_01_"},
		PlainCement = {Category = getText("UI_CMRB_Terrain_Tiles"), Name = Translator.getMoveableDisplayName("White_Tiles"), Ranges = {11}, Tileset = "floors_interior_tilesandwood_01_"},
		PatternedCeramic = {Category = getText("UI_CMRB_Terrain_Tiles"), Name = Translator.getMoveableDisplayName("White_Diagonal_Tiles"), Ranges = {12}, Tileset = "floors_interior_tilesandwood_01_"},
		FancyMall1 = {Category = getText("UI_CMRB_Terrain_Tiles"), Name = Translator.getMoveableDisplayName("Grey_Mall_Tile"), Ranges = {22}, Tileset = "location_shop_mall_01_"},
		FancyMall2 = {Category = getText("UI_CMRB_Terrain_Tiles"), Name = Translator.getMoveableDisplayName("Mall_Tile_N"), Ranges = {20}, Tileset = "location_shop_mall_01_"},
        FancyMall3 = {Category = getText("UI_CMRB_Terrain_Tiles"), Name = Translator.getMoveableDisplayName("Mall_Tile_W"), Ranges = {21}, Tileset = "location_shop_mall_01_"},
        White_Checkered = {Category = getText("UI_CMRB_Terrain_Tiles"), Name = Translator.getMoveableDisplayName("White_Checkered_Tiles"), Ranges = {5}, Tileset = "floors_interior_tilesandwood_01_"},
		Ceramic4x4YellowWhite = {Category = getText("UI_CMRB_Terrain_Tiles"), Name = Translator.getMoveableDisplayName("Yellow_Checkered_Tiles"), Ranges = {3}, Tileset = "floors_interior_tilesandwood_01_"},
		Ceramic4x4BlackWhite = {Category = getText("UI_CMRB_Terrain_Tiles"), Name = Translator.getMoveableDisplayName("Grey_Checkered_Tiles"), Ranges = {4}, Tileset = "floors_interior_tilesandwood_01_"},
        
		Ceramic4x2BlueGrey = {Category = getText("UI_CMRB_Terrain_Tiles"), Name = Translator.getMoveableDisplayName("Purple_Tiles"), Ranges = {22}, Tileset = "floors_interior_tilesandwood_01_"},
		Ceramic4x2BlackWhite = {Category = getText("UI_CMRB_Terrain_Tiles"), Name = Translator.getMoveableDisplayName("Black_Tiles"), Ranges = {7}, Tileset = "floors_interior_tilesandwood_01_"},
		Ceramic4x2 = {Category = getText("UI_CMRB_Terrain_Tiles"), Name = Translator.getMoveableDisplayName("Green_Tiles"), Ranges = {21}, Tileset = "floors_interior_tilesandwood_01_"},
		
		BlueCarpet = {Category = getText("UI_CMRB_Terrain_Carpets"), Name = Translator.getMoveableDisplayName("Blue_Carpet"), Ranges = {0}, Tileset = "floors_interior_carpet_01_"},
        VioletCarpet = {Category = getText("UI_CMRB_Terrain_Carpets"), Name = Translator.getMoveableDisplayName("Violet_Carpet"), Ranges = {1}, Tileset = "floors_interior_carpet_01_"},
        DarkGreyCarpet = {Category = getText("UI_CMRB_Terrain_Carpets"), Name = Translator.getMoveableDisplayName("Dark_Grey_Carpet"), Ranges = {2}, Tileset = "floors_interior_carpet_01_"},
        BrownCarpet = {Category = getText("UI_CMRB_Terrain_Carpets"), Name = Translator.getMoveableDisplayName("Brown_Carpet"), Ranges = {3}, Tileset = "floors_interior_carpet_01_"},
        DarkRedCarpet = {Category = getText("UI_CMRB_Terrain_Carpets"), Name = Translator.getMoveableDisplayName("Dark_Red_Carpet"), Ranges = {4}, Tileset = "floors_interior_carpet_01_"},
        GreenCarpet = {Category = getText("UI_CMRB_Terrain_Carpets"), Name = Translator.getMoveableDisplayName("Green_Carpet"), Ranges = {5}, Tileset = "floors_interior_carpet_01_"},
        PurpleCarpet = {Category = getText("UI_CMRB_Terrain_Carpets"), Name = Translator.getMoveableDisplayName("Purple_Carpet"), Ranges = {6}, Tileset = "floors_interior_carpet_01_"},
        GreyCurly_arpet = {Category = getText("UI_CMRB_Terrain_Carpets"), Name = Translator.getMoveableDisplayName("Grey_Curly_Carpet"), Ranges = {7}, Tileset = "floors_interior_carpet_01_"},
        RedCarpet = {Category = getText("UI_CMRB_Terrain_Carpets"), Name = Translator.getMoveableDisplayName("Red_Carpet"), Ranges = {8}, Tileset = "floors_interior_carpet_01_"},
		BordeauxCarpet = {Category = getText("UI_CMRB_Terrain_Carpets"), Name = Translator.getMoveableDisplayName("Bordeaux_Carpet"), Ranges = {9}, Tileset = "floors_interior_carpet_01_"},
        YellowCarpet = {Category = getText("UI_CMRB_Terrain_Carpets"), Name = Translator.getMoveableDisplayName("Yellow_Carpet"), Ranges = {10}, Tileset = "floors_interior_carpet_01_"},
        WhiteCarpet = {Category = getText("UI_CMRB_Terrain_Carpets"), Name = Translator.getMoveableDisplayName("White_Carpet"), Ranges = {11}, Tileset = "floors_interior_carpet_01_"},
        BeigeCarpet = {Category = getText("UI_CMRB_Terrain_Carpets"), Name = Translator.getMoveableDisplayName("Beige_Carpet"), Ranges = {12}, Tileset = "floors_interior_carpet_01_"},
        BlackCarpet = {Category = getText("UI_CMRB_Terrain_Carpets"), Name = Translator.getMoveableDisplayName("Black_Carpet"), Ranges = {13}, Tileset = "floors_interior_carpet_01_"},
		GreyCarpet = {Category = getText("UI_CMRB_Terrain_Carpets"), Name = Translator.getMoveableDisplayName("Grey_Carpet"), Ranges = {14}, Tileset = "floors_interior_carpet_01_"},


		PlayerBuilt = {Category = getText("UI_CMRB_Terrain_WoodFloors"), Name = getText("UI_CMRB_Terrain_PlayerBuilt"), Ranges = {56}, Tileset = "carpentry_02_"},
        Hardwood = {Category = getText("UI_CMRB_Terrain_WoodFloors"), Name = Translator.getMoveableDisplayName("Hardwood_Floor"), Ranges = {40}, Tileset = "floors_interior_tilesandwood_01_"},
		Oakwood = {Category = getText("UI_CMRB_Terrain_WoodFloors"), Name = Translator.getMoveableDisplayName("Oakwood_Floor"), Ranges = {41}, Tileset = "floors_interior_tilesandwood_01_"},
		Birchwood = {Category = getText("UI_CMRB_Terrain_WoodFloors"), Name = Translator.getMoveableDisplayName("Birchwood_Floor"), Ranges = {42}, Tileset = "floors_interior_tilesandwood_01_"},
		Cinnamon = {Category = getText("UI_CMRB_Terrain_WoodFloors"), Name = Translator.getMoveableDisplayName("Cinnamon_West_Floor"), Ranges = {43}, Tileset = "floors_interior_tilesandwood_01_"},
		CinnamonRotated = {Category = getText("UI_CMRB_Terrain_WoodFloors"), Name = Translator.getMoveableDisplayName("Cinnamon_North_Floor"), Ranges = {44}, Tileset = "floors_interior_tilesandwood_01_"},
		CinnamonTile = {Category = getText("UI_CMRB_Terrain_WoodFloors"), Name = Translator.getMoveableDisplayName("Cinnamon_Tiles"), Ranges = {50}, Tileset = "floors_interior_tilesandwood_01_"}

	}
}