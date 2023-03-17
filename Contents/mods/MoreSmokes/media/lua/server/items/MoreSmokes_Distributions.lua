require 'Items/ProceduralDistributions'

MoreSmokes = MoreSmokes or {};

function MoreSmokes:addDistributions(itemsAndChances, locations)
	for item, chance in pairs(itemsAndChances)
	do
		for i, location in ipairs(locations)
		do
			if ProceduralDistributions.list[location] and ProceduralDistributions.list[location].items
			then
				table.insert(ProceduralDistributions.list[location].items, item);
				table.insert(ProceduralDistributions.list[location].items, chance);
			end
		end
	end
end

local sBvars = SandboxVars.MoreSmokes;
local kitRarity = sBvars.Kits * sBvars.Loot * 0.5;
local magazinesRarity = sBvars.Magazines * sBvars.Loot * 1.0;
local magazinesHighRarity = sBvars.Magazines * sBvars.Loot * 10.0;
local seedsRarity = sBvars.Seeds * sBvars.Loot * 1.0;
local seedsRarityHigh = sBvars.Seeds * sBvars.Loot * 0.5;
local cannabisRarity = sBvars.Cannabis * sBvars.Loot * 0.05;
local tobaccoRarity = sBvars.Tobacco * sBvars.Loot * 0.1;
local ediblesRarity = sBvars.Edibles * sBvars.Loot * 0.1;
local glasswareRarity = sBvars.Glassware * sBvars.Loot * 0.01;
local glasswareBongRarity = sBvars.Glassware * sBvars.Loot * 0.001;

MoreSmokes:addDistributions({
    -- Smoke Kits
    ["MoreSmokes.SmokesKit"] = kitRarity,
}, {
    "ArtStoreOther", 
    "ClosetShelfGeneric",
    "GigamartTools",
    "KitchenRandom",
    "LivingRoomSideTable",
    "OtherGeneric",
    "PlankStashMisc",
    "PoliceEvidence",
    "RandomFiller",
    "ShelfGeneric",
    "WardrobeMan",
    "WardrobeWoman",
});

MoreSmokes:addDistributions({
    -- Recipe Magazines
    ["MoreSmokes.MoreSmokesMagazine1"] = magazinesRarity,
    ["MoreSmokes.MoreSmokesMagazine2"] = magazinesRarity,
    ["MoreSmokes.MoreSmokesMagazine3"] = magazinesRarity,
    ["MoreSmokes.MoreSmokesMagazine4"] = magazinesRarity,
}, {
    "BookstoreBooks", 
    "BookstoreMisc", 
    "CrateMagazines", 
    "CrateBooks",
    "LibraryBooks", 
    "MagazineRackMixed", 
    "PostOfficeMagazines",
});

MoreSmokes:addDistributions({
    -- Recipe Magazines
    ["MoreSmokes.BookCultivation1"] = magazinesRarity,
    ["MoreSmokes.BookCultivation2"] = magazinesRarity,
    ["MoreSmokes.BookCultivation3"] = magazinesRarity,
    ["MoreSmokes.BookCultivation4"] = magazinesRarity,
    ["MoreSmokes.BookCultivation5"] = magazinesRarity,
}, {
    "BookstoreBooks", 
    "BookstoreMisc", 
    "CrateBooks",
    "LibraryBooks", 
});

MoreSmokes:addDistributions({
    -- Seed Packets
    ["MoreSmokes.SeedPackTobacco"] = seedsRarity,
    ["MoreSmokes.SeedPackNorthernLights"] = seedsRarityHigh,
    ["MoreSmokes.SeedPackPurpleHaze"] = seedsRarityHigh,
    ["MoreSmokes.SeedPackSourDiesel"] = seedsRarityHigh,
}, {
    "CrateFarming", 
    "GardenStoreMisc", 
    "GigamartFarming", 
    "Homesteading",
    "ToolStoreFarming", 
    "MagazineRackMixed", 
    "PostOfficeMagazines",
});

MoreSmokes:addDistributions({
    -- Cannabis items
    ["MoreSmokes.RollingPapersPack"] = cannabisRarity,
    ["MoreSmokes.Grinder"] = cannabisRarity,
    ["MoreSmokes.JointsPackNorthernLights"] = cannabisRarity,
    ["MoreSmokes.JointsPackPurpleHaze"] = cannabisRarity,
    ["MoreSmokes.JointsPackSourDiesel"] = cannabisRarity,
    ["MoreSmokes.BluntsPackNorthernLights"] = cannabisRarity,
    ["MoreSmokes.BluntsPackPurpleHaze"] = cannabisRarity,
    ["MoreSmokes.BluntsPackSourDiesel"] = cannabisRarity,
}, {
    "DrugLabSupplies", 
    "DrugShackDrugs",
    "DrugShackMisc",
    "HolidayStuff",
    "MorgueChemicals",
    "OfficeDeskHome",
    "PoliceEvidence",
    "VacationStuff",
});

MoreSmokes:addDistributions({
    -- Tobacco items
    ["MoreSmokes.RollingPapersPack"] = tobaccoRarity,
    ["MoreSmokes.MSCigarettePack"] = tobaccoRarity,
    ["MoreSmokes.CigarilloPack"] = tobaccoRarity,
    ["MoreSmokes.CigarBox"] = tobaccoRarity,
    ["MoreSmokes.ChewingTobaccoCan"] = tobaccoRarity,
    ["MoreSmokes.ShishaWatermelonCan"] = tobaccoRarity,
    ["MoreSmokes.ShishaOrangeCan"] = tobaccoRarity,
    ["MoreSmokes.ShishaLemonCan"] = tobaccoRarity,
}, {
    "BarCounterMisc", 
    "BreakRoomShelves",
    "CampingLockers",
    "CrateCigarettes",
    "DrugShackMisc",
    "HolidayStuff",
    "OfficeDeskHome",
    "StoreCounterTobacco",
});

MoreSmokes:addDistributions({
    -- Edibles items
    ["MoreSmokes.CannabisButter"] = ediblesRarity,
    ["MoreSmokes.CannabisChocolateBar"] = ediblesRarity,
    ["MoreSmokes.CannabisGummies"] = ediblesRarity,
}, {
    "BakeryKitchenBaking", 
    "BakeryKitchenFridge", 
    "BakeryMisc", 
    "BandPracticeFridge", 
    "HolidayStuff",
});

MoreSmokes:addDistributions({
    -- Glassware items
    ["MoreSmokes.SmokePipe1"] = glasswareRarity,
    ["MoreSmokes.SmokePipe2"] = glasswareRarity,
    ["MoreSmokes.SmokePipe3"] = glasswareRarity,
    ["MoreSmokes.SmokePipeGlassBlue"] = glasswareRarity,
    ["MoreSmokes.SmokePipeGlassGreen"] = glasswareRarity,
    ["MoreSmokes.SmokePipeGlassYellow"] = glasswareRarity,
    ["MoreSmokes.SmokePipePink"] = glasswareRarity,
    ["MoreSmokes.Hookah1"] = glasswareRarity,
    ["MoreSmokes.Hookah2"] = glasswareRarity,
    ["MoreSmokes.Hookah3"] = glasswareRarity,
}, {
    "BarCounterMisc", 
    "BowlingAlleyLockers",
    "ClosetInstruments",
    "GigamartHousewares",
    "JanitorMisc",
    "StoreKitchenGlasses",
    "CrateRandomJunk",
});

MoreSmokes:addDistributions({
    -- Glassware items
    ["MoreSmokes.Bong1v1"] = glasswareBongRarity,
    ["MoreSmokes.Bong1v2"] = glasswareBongRarity,
    ["MoreSmokes.Bong1v3"] = glasswareBongRarity,
    ["MoreSmokes.Bong1v4"] = glasswareBongRarity,
    ["MoreSmokes.Bong2v1"] = glasswareBongRarity,
    ["MoreSmokes.Bong2v2"] = glasswareBongRarity,
    ["MoreSmokes.Bong2v3"] = glasswareBongRarity,
    ["MoreSmokes.Bong2v4"] = glasswareBongRarity,
    ["MoreSmokes.Bong3v1"] = glasswareBongRarity,
    ["MoreSmokes.Bong3v2"] = glasswareBongRarity,
    ["MoreSmokes.Bong3v3"] = glasswareBongRarity,
    ["MoreSmokes.Bong3v4"] = glasswareBongRarity,
    ["MoreSmokes.Bong4v1"] = glasswareBongRarity,
    ["MoreSmokes.Bong4v2"] = glasswareBongRarity,
    ["MoreSmokes.Bong4v3"] = glasswareBongRarity,
    ["MoreSmokes.Bong4v4"] = glasswareBongRarity,
    ["MoreSmokes.Bong5"] = glasswareBongRarity,
}, {
    "BarCounterMisc", 
    "BowlingAlleyLockers",
    "ClosetInstruments",
    "GigamartHousewares",
    "HolidayStuff",
    "JanitorMisc",
    "StoreKitchenGlasses",
    "ClosetShelfGeneric",
    "CrateRandomJunk",
});

if sBvars.RareMagazines then
    MoreSmokes:addDistributions({
        -- Recipe Magazines
        ["MoreSmokes.MoreSmokesSmokesPlusMagazine"] = magazinesHighRarity,
        ["MoreSmokes.MoreSmokesEdiblesPlusMagazine"] = magazinesHighRarity,
        ["MoreSmokes.BackwoodBluntsMagazine"] = magazinesHighRarity,
        ["MoreSmokes.IndigoFogMagazine"] = magazinesHighRarity,
        ["MoreSmokes.CannabisButterGreenDreamsMagazine"] = magazinesHighRarity,
    }, {
        "BookstoreBooks", 
        "BookstoreMisc", 
        "CrateMagazines", 
        "LibraryBooks", 
        "MagazineRackMixed", 
    });
else
    MoreSmokes:addDistributions({
        -- Recipe Magazines
        ["MoreSmokes.MoreSmokesSmokesPlusMagazine"] = magazinesHighRarity,
        ["MoreSmokes.MoreSmokesEdiblesPlusMagazine"] = magazinesHighRarity,
        ["MoreSmokes.BackwoodBluntsMagazine"] = magazinesHighRarity,
        ["MoreSmokes.IndigoFogMagazine"] = magazinesHighRarity,
        ["MoreSmokes.CannabisButterGreenDreamsMagazine"] = magazinesHighRarity,
    }, {
    });
end