ISBuildMenu.buildBarricadeMenu = function(subMenu, context, option, player)
	-- add the barricade submenu
	barricadeOption = subMenu:addOption(getText("ContextMenu_Barricades"), worldobjects, nil);
	local subMenuBarricade = subMenu:getNew(subMenu);
	context:addSubMenu(barricadeOption, subMenuBarricade);
	
	-- add the small barricade submenu
	local smallBarricadeOption = subMenuBarricade:addOption(getText("ContextMenu_Small_Barricades"), worldobjects, nil);
	local subMenuSmallBarricade = subMenuBarricade:getNew(subMenuBarricade);
	context:addSubMenu(smallBarricadeOption, subMenuSmallBarricade);
	
	-- add the medium barricade submenu
	local mediumBarricadeOption = subMenuBarricade:addOption(getText("ContextMenu_Medium_Barricades"), worldobjects, nil);
	local subMenuMediumBarricade = subMenuBarricade:getNew(subMenuBarricade);
	context:addSubMenu(mediumBarricadeOption, subMenuMediumBarricade);

	-- add the large barricade submenu
	local largeBarricadeOption = subMenuBarricade:addOption(getText("ContextMenu_Large_Barricades"), worldobjects, nil);
	local subMenuLargeBarricade = subMenuBarricade:getNew(subMenuBarricade);
	context:addSubMenu(largeBarricadeOption, subMenuLargeBarricade);

	-- Initial Sprite loader
	local sprite = {};
	local spriteIndex = {};
	sprite.sprite = "DylansJunkstacks01_";

	spriteIndex = { 3, 8, 9, 10 }
	ISBuildMenu.SmallBarricade(subMenuSmallBarricade, sprite, spriteIndex, player)
	spriteIndex = { 11, 12, 15, 16 }
	ISBuildMenu.SmallBarricade(subMenuSmallBarricade, sprite, spriteIndex, player)
	spriteIndex = { 17, 20, 21, 22 }
	ISBuildMenu.SmallBarricade(subMenuSmallBarricade, sprite, spriteIndex, player)
	spriteIndex = { 23, 24, 31, 34 }
	ISBuildMenu.SmallBarricade(subMenuSmallBarricade, sprite, spriteIndex, player)
	spriteIndex = { 51, 52, 59, 60 }
	ISBuildMenu.SmallBarricade(subMenuSmallBarricade, sprite, spriteIndex, player)
	spriteIndex = { 61, 62, 61, 62 }
	ISBuildMenu.SmallBarricade(subMenuSmallBarricade, sprite, spriteIndex, player)
	
	spriteIndex = { 1, 4, 13, 18 }
	ISBuildMenu.MediumBarricade(subMenuMediumBarricade, sprite, spriteIndex, player)
	spriteIndex = { 19, 27, 28, 29 }
	ISBuildMenu.MediumBarricade(subMenuMediumBarricade, sprite, spriteIndex, player)
	spriteIndex = { 30, 33, 35, 36 }
	ISBuildMenu.MediumBarricade(subMenuMediumBarricade, sprite, spriteIndex, player)
	spriteIndex = { 37, 39, 40, 41 }
	ISBuildMenu.MediumBarricade(subMenuMediumBarricade, sprite, spriteIndex, player)
	spriteIndex = { 44, 45, 49, 50 }
	ISBuildMenu.MediumBarricade(subMenuMediumBarricade, sprite, spriteIndex, player)
	spriteIndex = { 53, 54, 55, 56 }
	ISBuildMenu.MediumBarricade(subMenuMediumBarricade, sprite, spriteIndex, player)
	
	spriteIndex = { 0, 2, 5, 6 }
	ISBuildMenu.LargeBarricade(subMenuLargeBarricade, sprite, spriteIndex, player)
	spriteIndex = { 7, 14, 25, 26 }
	ISBuildMenu.LargeBarricade(subMenuLargeBarricade, sprite, spriteIndex, player)
	spriteIndex = { 32, 38, 42, 43 }
	ISBuildMenu.LargeBarricade(subMenuLargeBarricade, sprite, spriteIndex, player)
	spriteIndex = { 46, 47, 48, 58 }
	ISBuildMenu.LargeBarricade(subMenuLargeBarricade, sprite, spriteIndex, player)
		
	-- 02 Sprites
	sprite = {};
	sprite.sprite = "DylansJunkstacks02_";
	spriteIndex = { 1, 12, 24, 25 }
	ISBuildMenu.SmallBarricade(subMenuSmallBarricade, sprite, spriteIndex, player)
	spriteIndex = { 28, 36, 40, 44 }
	ISBuildMenu.SmallBarricade(subMenuSmallBarricade, sprite, spriteIndex, player)
	spriteIndex = { 53, 55, 57, 62 }
	ISBuildMenu.SmallBarricade(subMenuSmallBarricade, sprite, spriteIndex, player)
	
	spriteIndex = { 3, 3, 5, 7 }
	ISBuildMenu.MediumBarricade(subMenuMediumBarricade, sprite, spriteIndex, player)
	spriteIndex = { 15, 17, 19, 20 }
	ISBuildMenu.MediumBarricade(subMenuMediumBarricade, sprite, spriteIndex, player)
	spriteIndex = { 22, 27, 29, 30 }
	ISBuildMenu.MediumBarricade(subMenuMediumBarricade, sprite, spriteIndex, player)
	spriteIndex = { 31, 32, 35, 37 }
	ISBuildMenu.MediumBarricade(subMenuMediumBarricade, sprite, spriteIndex, player)
	spriteIndex = { 38, 41, 49, 50 }
	ISBuildMenu.MediumBarricade(subMenuMediumBarricade, sprite, spriteIndex, player)
	spriteIndex = { 54, 56, 58, 60 }
	ISBuildMenu.MediumBarricade(subMenuMediumBarricade, sprite, spriteIndex, player)
	
	spriteIndex = { 2, 2, 4, 6 }
	ISBuildMenu.LargeBarricade(subMenuLargeBarricade, sprite, spriteIndex, player)
	spriteIndex = { 8, 13, 16, 18 }
	ISBuildMenu.LargeBarricade(subMenuLargeBarricade, sprite, spriteIndex, player)
	spriteIndex = { 21, 23, 26, 33 }
	ISBuildMenu.LargeBarricade(subMenuLargeBarricade, sprite, spriteIndex, player)
	spriteIndex = { 34, 39, 42, 43 }
	ISBuildMenu.LargeBarricade(subMenuLargeBarricade, sprite, spriteIndex, player)
	spriteIndex = { 45, 46, 47, 48 }
	ISBuildMenu.LargeBarricade(subMenuLargeBarricade, sprite, spriteIndex, player)
	spriteIndex = { 51, 52, 59, 61 }
	ISBuildMenu.LargeBarricade(subMenuLargeBarricade, sprite, spriteIndex, player)
	
	if smallBarricade.notAvailable then smallBarricadeOption.notAvailable = true; end
	if mediumBarricade.notAvailable then mediumBarricadeOption.notAvailable = true; end
	if largeBarricade.notAvailable then largeBarricadeOption.notAvailable = true; end
	
	if smallBarricadeOption.notAvailable and mediumBarricadeOption.notAvailable and largeBarricadeOption.notAvailable then barricadeOption.notAvailable = true; end
	
end

ISBuildMenu.SmallBarricade = function(subMenu, sprite, spriteIndex, player)
	local objName = getText("ContextMenu_Small_Barricade")
	smallBarricade = subMenu:addOption(objName, worldobjects, ISBuildMenu.onSmallBarricade, square, sprite, spriteIndex, player);
	local tooltip = ISBuildMenu.canBuild(3,3,0,0,0,2, smallBarricade, player); 	
	tooltip:setName(objName);
	tooltip.description = getText("Tooltip_craft_Barricade") .. tooltip.description;
	tooltip:setTexture(sprite.sprite .. spriteIndex[1]);
	ISBuildMenu.requireHammer(smallBarricade)
end

ISBuildMenu.MediumBarricade = function(subMenu, sprite, spriteIndex, player)
	local objName = getText("ContextMenu_Medium_Barricade")
	mediumBarricade = subMenu:addOption(objName, worldobjects, ISBuildMenu.onMediumBarricade, square, sprite, spriteIndex, player);
	local tooltip = ISBuildMenu.canBuild(6,6,0,0,0,5, mediumBarricade, player); 	
	tooltip:setName(objName);
	tooltip.description = getText("Tooltip_craft_Barricade") .. tooltip.description;
	tooltip:setTexture(sprite.sprite .. spriteIndex[1]);
	ISBuildMenu.requireHammer(mediumBarricade)
end

ISBuildMenu.LargeBarricade = function(subMenu, sprite, spriteIndex, player)
	local objName = getText("ContextMenu_Large_Barricade")
	largeBarricade = subMenu:addOption(objName, worldobjects, ISBuildMenu.onLargeBarricade, square, sprite, spriteIndex, player);
	local tooltip = ISBuildMenu.canBuild(9,9,0,0,0,8, largeBarricade, player); 	
	tooltip:setName(objName);
	tooltip.description = getText("Tooltip_craft_Barricade") .. tooltip.description;
	tooltip:setTexture(sprite.sprite .. spriteIndex[1]);
	ISBuildMenu.requireHammer(largeBarricade)
end

-- Barricade Small --
ISBuildMenu.onSmallBarricade = function(worldobjects, square, sprite, spriteIndex, player)
    local barricade = ISBarricade:new("Small Barricade");
    barricade.modData["xp:Woodwork"] = 2;
    barricade.modData["need:Base.Plank"] = "3";
    barricade.modData["need:Base.Nails"] = "3";
	barricade:setSprite(sprite.sprite .. spriteIndex[1]);
	barricade:setNorthSprite(sprite.sprite .. spriteIndex[2]);
	barricade:setEastSprite(sprite.sprite .. spriteIndex[3]);
	barricade:setSouthSprite(sprite.sprite .. spriteIndex[4]);
	barricade.maxTime = 250;
    barricade.player = player
    barricade.completionSound = "BuildWoodenStructureLarge";
    getCell():setDrag(barricade, player);
end

-- Barricade Medium --
ISBuildMenu.onMediumBarricade = function(worldobjects, square, sprite, spriteIndex, player)
    local barricade = ISBarricade:new("Medium Barricade");
    barricade.modData["xp:Woodwork"] = 4;
    barricade.modData["need:Base.Plank"] = "6";
    barricade.modData["need:Base.Nails"] = "6";
	barricade:setSprite(sprite.sprite .. spriteIndex[1]);
	barricade:setNorthSprite(sprite.sprite .. spriteIndex[2]);
	barricade:setEastSprite(sprite.sprite .. spriteIndex[3]);
	barricade:setSouthSprite(sprite.sprite .. spriteIndex[4]);
	barricade.maxTime = 250;
    barricade.player = player
    barricade.completionSound = "BuildWoodenStructureLarge";
    getCell():setDrag(barricade, player);
end

-- Barricade Large --
ISBuildMenu.onLargeBarricade = function(worldobjects, square, sprite, spriteIndex, player)
    local barricade = ISBarricade:new("Large Barricade");
    barricade.modData["xp:Woodwork"] = 6;
    barricade.modData["need:Base.Plank"] = "9";
    barricade.modData["need:Base.Nails"] = "9";
	barricade:setSprite(sprite.sprite .. spriteIndex[1]);
	barricade:setNorthSprite(sprite.sprite .. spriteIndex[2]);
	barricade:setEastSprite(sprite.sprite .. spriteIndex[3]);
	barricade:setSouthSprite(sprite.sprite .. spriteIndex[4]);
	barricade.maxTime = 250;
    barricade.player = player
    barricade.completionSound = "BuildWoodenStructureLarge";
    getCell():setDrag(barricade, player);
end