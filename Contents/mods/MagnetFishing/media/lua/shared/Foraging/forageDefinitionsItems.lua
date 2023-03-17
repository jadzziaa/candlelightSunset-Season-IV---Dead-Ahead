MagnetFishing = MagnetFishing or {}

MagnetFishing.forageTable = {
    uncommon = {
        chance = 30,
        xp = 3,
        items = {
            SmallFishingMagnet = "Base.SmallFishingMagnet",
        },
    },
    rare = {
        chance = 15,
        xp = 5,
        items = {
            MediumFishingMagnet = "Base.MediumFishingMagnet",
        },
    },
    legendary = {
        chance = 1,
        xp = 25,
        items = {
            LargeFishingMagnet = "Base.LargeFishingMagnet",
        },
    },
};

for _, spawnTable in pairs(MagnetFishing.forageTable) do
    for itemName, itemFullName in pairs(spawnTable.items) do
        forageDefs[itemName] = {
            type = itemFullName,
            xp = spawnTable.xp,
            categories = { "Trash" },
            zones = {
                Forest      = spawnTable.chance,
                DeepForest  = spawnTable.chance,
                Vegitation  = spawnTable.chance,
                FarmLand    = spawnTable.chance,
                Farm        = spawnTable.chance,
                TrailerPark = spawnTable.chance,
                TownZone    = spawnTable.chance,
                Nav         = spawnTable.chance,
            },
            spawnFuncs = { doGenericItemSpawn },
            forceOutside = false,
            canBeAboveFloor = true,
            itemSizeModifier = 0.5,
            isItemOverrideSize = true,
        };
    end;
end;