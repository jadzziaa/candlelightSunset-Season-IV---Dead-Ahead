require 'Foraging/forageSystem'

Events.onAddForageDefs.Add(function()

--New items

	local LemonGrassSeed = {
        type = "filcher.SFLemonGrassSeed",
        minCount = 2,
        maxCount = 6,
	skill = 4,
        xp = 15,
        rainChance = 10,
        categories = { "MedicinalPlants" },
        zones = { DeepForest=1, Forest=2, FarmLand=5, Farm=5, Vegitation=1 },
        months = { 3, 4, 5, 6, 7, 8, 9, 10, 11 },
        bonusMonths = { 5, 6, 7 },
        malusMonths = { 3, 4 },
        altWorldTexture = getTexture("media/textures/Foraging/worldSprites/lemongrass_worldSprite.png"),
    }

	local TeaSeed = {
        type = "filcher.TeaSeed",
        minCount = 2,
        maxCount = 6,
	skill = 4,
        xp = 15,
        rainChance = 10,
        categories = { "Vegetables" },
        zones = { DeepForest=1, Forest=2, FarmLand=5, Farm=5, Vegitation=5 },
        months = { 3, 4, 5, 6, 7, 8, 9, 10, 11 },
        bonusMonths = { 5, 6, 7 },
        malusMonths = { 3, 4 },
        altWorldTexture = getTexture("media/textures/Foraging/worldSprites/lemongrass_worldSprite.png"),
    }

	local Wheat = {
	type = "filcher.SFWheat",
	xp = 10,
        categories = { "Vegetables" },
	zones={ Forest=5, DeepForest=1, FarmLand=20, Farm=20, Vegitation=5 },
        months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
        bonusMonths = { 7, 8, 9 },
        malusMonths = { 4, 5 },
	}

forageSystem.addItemDef(LemonGrassSeed);
forageSystem.addItemDef(Wheat);

end)