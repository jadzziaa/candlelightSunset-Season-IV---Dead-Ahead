require "BTSE_Farming_Server";

MoreSmokes = MoreSmokes or {}; 

local sVars = SandboxVars.MoreSmokes;
sVars.HarvestAdd = sVars.HarvestAdd or 2;
sVars.GrowTimer = sVars.GrowTimer or 90;
sVars.RotTimer = sVars.RotTimer or 90;

function MoreSmokes:getHarvestCount(baseAmount, ceilNumber)
    local vegAdjustment = 0;
    if SandboxVars.PlantAbundance == 1 then -- very poor
        vegAdjustment = 4;
    elseif SandboxVars.PlantAbundance == 2 then -- poor
        vegAdjustment = 2;
    elseif SandboxVars.PlantAbundance == 4 then -- abundant
        vegAdjustment = 1;
    elseif SandboxVars.PlantAbundance == 5 then -- very abundant
        vegAdjustment = 2;
    end

    local amount = (baseAmount + sVars.HarvestAdd) + vegAdjustment;
    
    return ceilNumber
        and math.ceil(amount)
        or math.floor(amount);
end

BTSE.Farming:log("BTSE.Farming_MoreSmokes -> Adding crops.");

BTSE.Farming["debugMode"] = false;

BTSE.Farming:addNewCrop({
    name = "Tobacco",
    group = "IGUI_BTSE.Farming_Tobacco",
    seedItemType = "MoreSmokes.SeedTobacco",
    seedsPerPlot = 20,
    seedsPerVegetable = 10,
    waterOptimum = 60,
    waterMaximum = 100,
    harvestItemType = "MoreSmokes.TobaccoLeaves",
    normalHarvestMin = MoreSmokes:getHarvestCount(2),
    normalHarvestMax = MoreSmokes:getHarvestCount(3, true),
    abundantHarvestMin = MoreSmokes:getHarvestCount(3),
    abundantHarvestMax = MoreSmokes:getHarvestCount(4, true),
    growTimeHours = sVars.GrowTimer,
    rotTimeHours = sVars.RotTimer,
    growSprites = {
        "MoreSmokes_0",
        "MoreSmokes_1", "MoreSmokes_2", "MoreSmokes_3", "MoreSmokes_4", "MoreSmokes_5", "MoreSmokes_6",
        "MoreSmokes_7",
    },
    infoPanelIcon = "media/textures/vegIcon/Item_TobaccoLeaves.png",
    tooltipSprite = "MoreSmokes_5",
    drySprite = "MoreSmokes_7",
    destroyedSprite = "MoreSmokes_32",
    rottenSprite = "MoreSmokes_33",
});

BTSE.Farming:addNewCrop({
    name = "PurpleHaze",
    group = "IGUI_BTSE.Farming_Cannabis",
    seedItemType = "MoreSmokes.SeedPurpleHaze",
    seedsPerPlot = 4,
    seedsPerVegetable = 2,
    waterOptimum = 60,
    waterMaximum = 100,
    harvestItemType = "MoreSmokes.BudPurpleHaze",
    normalHarvestMin = MoreSmokes:getHarvestCount(2),
    normalHarvestMax = MoreSmokes:getHarvestCount(3, true),
    abundantHarvestMin = MoreSmokes:getHarvestCount(3),
    abundantHarvestMax = MoreSmokes:getHarvestCount(4, true),
    growTimeHours = sVars.GrowTimer,
    rotTimeHours = sVars.RotTimer,
    growSprites = {
        "MoreSmokes_8",
        "MoreSmokes_9", "MoreSmokes_10", "MoreSmokes_11", "MoreSmokes_12", "MoreSmokes_13", "MoreSmokes_14",
        "MoreSmokes_15",
    },
    infoPanelIcon = "media/textures/vegIcon/Item_BudPurpleHaze.png",
    tooltipSprite = "MoreSmokes_13",
    drySprite = "MoreSmokes_15",
    destroyedSprite = "MoreSmokes_34",
    rottenSprite = "MoreSmokes_35",
});

BTSE.Farming:addNewCrop({
    name = "NorthernLights",
    group = "IGUI_BTSE.Farming_Cannabis",
    seedItemType = "MoreSmokes.SeedNorthernLights",
    seedsPerPlot = 4,
    seedsPerVegetable = 2,
    waterOptimum = 60,
    waterMaximum = 100,
    harvestItemType = "MoreSmokes.BudNorthernLights",
    normalHarvestMin = MoreSmokes:getHarvestCount(2),
    normalHarvestMax = MoreSmokes:getHarvestCount(3, true),
    abundantHarvestMin = MoreSmokes:getHarvestCount(3),
    abundantHarvestMax = MoreSmokes:getHarvestCount(4, true),
    growTimeHours = sVars.GrowTimer,
    rotTimeHours = sVars.RotTimer,
    growSprites = {
        "MoreSmokes_16",
        "MoreSmokes_17", "MoreSmokes_18", "MoreSmokes_19", "MoreSmokes_20", "MoreSmokes_21", "MoreSmokes_22",
        "MoreSmokes_23",
    },
    infoPanelIcon = "media/textures/vegIcon/Item_BudNorthernLights.png",
    tooltipSprite = "MoreSmokes_21",
    drySprite = "MoreSmokes_23",
    destroyedSprite = "MoreSmokes_36",
    rottenSprite = "MoreSmokes_37",
});

BTSE.Farming:addNewCrop({
    name = "SourDiesel",
    group = "IGUI_BTSE.Farming_Cannabis",
    seedItemType = "MoreSmokes.SeedSourDiesel",
    seedsPerPlot = 4,
    seedsPerVegetable = 2,
    waterOptimum = 60,
    waterMaximum = 100,
    harvestItemType = "MoreSmokes.BudSourDiesel",
    normalHarvestMin = MoreSmokes:getHarvestCount(2),
    normalHarvestMax = MoreSmokes:getHarvestCount(3, true),
    abundantHarvestMin = MoreSmokes:getHarvestCount(3),
    abundantHarvestMax = MoreSmokes:getHarvestCount(4, true),
    growTimeHours = sVars.GrowTimer,
    rotTimeHours = sVars.RotTimer,
    growSprites = {
        "MoreSmokes_24",
        "MoreSmokes_25", "MoreSmokes_26", "MoreSmokes_27", "MoreSmokes_28", "MoreSmokes_29", "MoreSmokes_30",
        "MoreSmokes_31",
    },
    infoPanelIcon = "media/textures/vegIcon/Item_BudSourDiesel.png",
    tooltipSprite = "MoreSmokes_29",
    drySprite = "MoreSmokes_31",
    destroyedSprite = "MoreSmokes_38",
    rottenSprite = "MoreSmokes_39",
});