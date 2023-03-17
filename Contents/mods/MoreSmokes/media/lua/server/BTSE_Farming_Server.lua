require "BTSE_Farming_Base";
require "Farming/farming_vegetableconf";

BTSE.Farming["customCrops"] = BTSE.Farming["customCrops"] or {};

-- BTSE.Farming:addNewCrop(config) -> add a custom crop to the roster
-- parameters:
-- name: a unique name for the seed that is used to identify the plant. this should never be changed. defaults to "YouPotato" to not override the original and remind you to name your crop.
-- seedItemType: the fully namespaced item type of the returned seed items. defaults to "farming.PotatoSeed"
-- seedsPerPlot: how many seeds per plot? defaults to 4
-- seedsPerVegetable: how many seeds does the player get PER VEGETABLE when harvesting in seed bearing state? defaults to 3
-- waterOptimum: optimum water level, defaults to 65
-- waterMaximum: maximum water level, defaults to 90
-- harvestItemType: the fully namespaced item type of the returned produce items. defaults to a "farming.Potato"
-- normalHarvestMin: minimum amount of produce per harvest. defaults to 3
-- normalHarvestMax: maximum amount of produce per harvest. defaults to 4
-- abundantHarvestMin: minimum amount of produce per harvest, abundance considered. defaults to 5
-- abundantHarvestMax: maximum amount of produce per harvest, abundance considered. defaults to 9
-- growTimeHours: time in ingame hours between growth stages. defaults to 96 (4 weeks)
-- rotTimeHours: time in ingame hours between seed bearing and rotten stage. defaults to 48
-- revertAfterHarvest: set this to a number if you want the plant to revert to a growth stage after being harvested. this ignores the seed stage, so state 4 is 3 and so on
-- growSprites: an array of 8 sprites documenting the visible progression of the plant, from seeded plot to seed bearing. missing sprites will default to potato sprites
-- infoPanelIcon: the texture path to the info panel icon or a registered texture name. defaults to "Item_TZ_Potato"
-- tooltipSprite: sprite name for the "harvestable" state. defaults to "vegetation_farming_01_46", a potato plant
-- rottenSprite: a sprite that is shown when the plant is rotten. defaults to the 8th sprite in the growSprites table, or its fallback
-- destroyedSprite: a sprite that is shown when the plant was destroyed. defaults to the rottenSprite
-- drySprite: a sprite that is shown when the plant is withering. defaults to the rottenSprite
-- growFunction: a function to process the plant growth through stages. it gets fed the same params as the SFarmingSystem:growPlant() function. i suggest you do not set this as it uses my grow function instead!

function BTSE.Farming:addNewCrop(config)
    local config = config or {};

    config["name"] = config["name"] or "YouPotato";

    config["growFunctionName"] = "btse_grow" .. tostring(config["name"]);
    config["growFunction"] = config["growFunction"] or function(luaObject, nextGrowing, updateNbOfGrow)
        luaObject = BTSE.Farming:growCustomCrop(luaObject, nextGrowing, updateNbOfGrow);

        return luaObject;
    end

    farming_vegetableconf[config["growFunctionName"]] = config["growFunction"];

    farming_vegetableconf["props"][config["name"]] = {
        texture = config["tooltipSprite"] or "vegetation_farming_01_46",
        seedsRequired = config["seedsPerPlot"] or 4,
        seedName = config["seedItemType"] or "farming.PotatoSeed",
        waterLvl = config["waterOptimum"] or 65,
        waterLvlMax = config["waterMaximum"] or 90,
        timeToGrow = config["growTimeHours"] or 96,
        vegetableName = config["harvestItemType"] or "farming.Potato",
        growCode = "farming_vegetableconf." .. config["growFunctionName"],
        seedPerVeg = config["seedsPerVegetable"] or 3,
        minVeg = config["normalHarvestMin"] or 3,
        maxVeg = config["normalHarvestMax"] or 4,
        minVegAutorized = config["abundantHarvestMin"] or 5,
        maxVegAutorized = config["abundantHarvestMax"] or 9,

        btseGroup = config["group"],
    };

    config["growSprites"] = config["growSprites"] or {};

    farming_vegetableconf["sprite"][config["name"]] = {
        config["growSprites"][1] or "vegetation_farming_01_40", --seeded
        config["growSprites"][2] or "vegetation_farming_01_41", --growth
        config["growSprites"][3] or "vegetation_farming_01_42",
        config["growSprites"][4] or "vegetation_farming_01_43",
        config["growSprites"][5] or "vegetation_farming_01_44",
        config["growSprites"][6] or "vegetation_farming_01_45",
        config["growSprites"][7] or "vegetation_farming_01_46",
        config["growSprites"][8] or "vegetation_farming_01_47", -- dead
    };

    config["rottenSprite"] = config["rottenSprite"] or farming_vegetableconf["sprite"][config["name"]][8];
    config["drySprite"] = config["rottenSprite"] or farming_vegetableconf["sprite"][config["name"]][8];
    config["destroyedSprite"] = config["rottenSprite"] or farming_vegetableconf["sprite"][config["name"]][8];

    config["rotTimeHours"] = config["rotTimeHours"] or 48;

    farming_vegetableconf["icons"][config["name"]] = config["infoPanelIcon"] or "Item_TZ_Potato";

    BTSE.Farming["customCrops"][config["name"]] = config;

    BTSE.Farming:log("Added new crop [" .. tostring(config["name"]) .. "]");

    if BTSE.Farming["debugMode"]
    then
        BTSE.Farming:logArray(config);
    end
end

function BTSE.Farming:getCropConfig(seedName, param)
    if BTSE.Farming["customCrops"][seedName]
    then
        return param
            and BTSE.Farming["customCrops"][seedName][param]
            or BTSE.Farming["customCrops"][seedName];
    end

    return false;
end

-- rest is pure server stuff

if isClient()
then
    return;
end

BTSE.Commands = BTSE.Commands or {};
BTSE.Commands.Farming = BTSE.Commands.Farming or {};

-- state changes

function BTSE.Farming:growCrop(luaObject, nextGrowing, updateNbOfGrow)
    if luaObject["state"] == "seeded"
    then
        local growFn = BTSE.Farming:getCropConfig(luaObject["typeOfSeed"], "growFunction");

        if growFn
        then
            luaObject = growFn(luaObject, nextGrowing, updateNbOfGrow);
        end
    end

    return luaObject;
end

function BTSE.Farming:rotDryDestroy(self, spriteKey, altSprite)
    local sprite = BTSE.Farming:getCropConfig(self["typeOfSeed"], spriteKey .. "Sprite")

    if sprite
    then
        sprite = sprite or altSprite;

        BTSE.Farming:log("Applying " .. tostring(spriteKey) .. "Sprite for custom crop " .. tostring(self["typeOfSeed"]) .. " -> " .. tostring(sprite));

        self:setSpriteName(sprite);
    end
end

function BTSE.Farming:dryCrop(self)
    BTSE.Farming:rotDryDestroy(self, "dry", "vegetation_farming_01_5");
end

function BTSE.Farming:rotCrop(self)
    BTSE.Farming:rotDryDestroy(self, "rotten", "vegetation_farming_01_13");
end

function BTSE.Farming:destroyCrop(self)
    BTSE.Farming:rotDryDestroy(self, "destroyed", "vegetation_farming_01_13");
end

function BTSE.Farming:harvestCrop(self, luaObject, player)
    local revertToStage = BTSE.Farming:getCropConfig(luaObject["typeOfSeed"], "revertAfterHarvest");

    if revertToStage and type(revertToStage) == "number"
    then
        BTSE.Farming:log("Reverting plant to stage: " .. tostring(revertToStage));

        local props = farming_vegetableconf.props[luaObject["typeOfSeed"]]
        local harvestCount = getVegetablesNumber(props["minVeg"], props["maxVeg"], props["minVegAutorized"], props["maxVegAutorized"], luaObject)

        if player
        then
            player:sendObjectChange('addItemOfType', {
                type = props["vegetableName"],
                count = harvestCount
            });

            if luaObject["hasSeed"]
            then
                player:sendObjectChange('addItemOfType', {
                    type = props["seedName"],
                    count = props["seedPerVeg"] * harvestCount
                });
            end
        end

        luaObject["hasVegetable"] = false;
        luaObject["hasSeed"] = false;
        luaObject["fertilizer"] = 0;
        luaObject["nbOfGrow"] = revertToStage;

        self:growPlant(luaObject, nil, true);

        luaObject:saveData();

        return luaObject;
    end

    return false;
end

function BTSE.Farming:refreshCropSprite(luaObject)
    if luaObject
    then
        if type(luaObject["nbOfGrow"]) == "table"
        then
            luaObject["nbOfGrow"] = 0;

            luaObject:saveData();
        end

        local sprite = farming_vegetableconf.getSpriteName(luaObject);

        BTSE.Farming:log("Refreshing crop sprite for " .. tostring(luaObject["typeOfSeed"]) .. " -> " .. tostring(sprite));

        luaObject:setObjectName(farming_vegetableconf.getObjectName(luaObject));
        luaObject:setSpriteName(sprite);
    else
        BTSE.Farming:logError("WARNING: missing luaObject in BTSE.Farming:refreshCropSprite()");
    end
end

-- preset growth stage functions

function BTSE.Farming:growCustomCrop(luaObject, nextGrowing, updateNbOfGrow)
    local plantConfig = farming_vegetableconf.props[luaObject["typeOfSeed"]];
	local waterLevel = farming_vegetableconf.calcWater(luaObject["waterNeeded"], luaObject["waterLvl"]);
	local diseaseLevel = farming_vegetableconf.calcDisease(luaObject["mildewLvl"]);
    local isAlive = waterLevel >= 0 and diseaseLevel >= 0;
    local growPhase = luaObject["nbOfGrow"] or 0;
    local action = "update";

	if growPhase <= 0
    then
		luaObject["nbOfGrow"] = 0;
		luaObject["waterNeeded"] = plantConfig["waterLvl"] + 5 <= 100
            and plantConfig["waterLvl"] + 5
            or 100;
        action = "grow";
    elseif growPhase ~= 0 and not isAlive
    then
        action = "wither";
	elseif growPhase <= 4 and isAlive
    then
        action = "grow";
        luaObject["waterNeeded"] = plantConfig["waterLvl"];
	elseif growPhase == 5 and isAlive
    then
        luaObject["nextGrowing"] = calcNextGrowing(nextGrowing, plantConfig["timeToGrow"] + waterLevel + diseaseLevel);
        luaObject["hasVegetable"] = true;
	elseif growPhase == 6 and isAlive
    then
        luaObject["nextGrowing"] = calcNextGrowing(nextGrowing, BTSE.Farming:getCropConfig(luaObject["typeOfSeed"], "rotTimeHours"));
        luaObject["hasVegetable"] = true;
        luaObject["hasSeed"] = true;
	elseif luaObject["state"] ~= "rotten"
    then
        action = "rot";
	end

    BTSE.Farming:log("Processing custom grow function for " .. tostring(luaObject["typeOfSeed"]) .. " -> " .. tostring(action));

    if action == "grow"
    then
        luaObject = growNext(luaObject, farming_vegetableconf.getSpriteName(luaObject), farming_vegetableconf.getObjectName(luaObject), nextGrowing, plantConfig["timeToGrow"] + waterLevel + diseaseLevel);
    elseif action == "wither"
    then
        badPlant(waterLevel, nil, diseaseLevel, luaObject, nextGrowing, updateNbOfGrow);
    elseif action == "rot"
    then
		luaObject:rottenThis();
    end

    if action == "update" or action == "grow"
    then
        BTSE.Farming:refreshCropSprite(luaObject);
    end

	return luaObject;
end

-- handlers

function BTSE.Commands.Farming.revitalizePlant(playerObj, args)
    local square = getCell():getGridSquare(args["x"], args["y"], args["z"]);
    local plant = SFarmingSystem.instance:getLuaObjectAt(args["x"], args["y"], args["z"]);

    if plant
    then
        SFarmingSystem.instance:removePlant(plant);
    end

    SFarmingSystem.instance:plow(square);

    plant = SFarmingSystem.instance:getLuaObjectAt(args["x"], args["y"], args["z"]);

    if plant and plant["state"] == "plow"
    then
        plant:seed(args["seedName"]);

        plant = SFarmingSystem.instance:getLuaObjectAt(args["x"], args["y"], args["z"]);

        if plant
        then
            plant:water(nil, plant["waterNeededMax"]
                and plant["waterNeededMax"] - plant["waterLvl"]
                or 100 - plant["waterLvl"]
            );

            plant["nbOfGrow"] = args["spriteIndex"] - 1;
            plant["nbOfGrow"] = plant["nbOfGrow"] > -1
                and plant["nbOfGrow"]
                or 0;

            plant["nextGrowing"] = SFarmingSystem.instance["hoursElapsed"] - plant["nextGrowing"];

            plant:saveData();

            if plant["state"] == "seeded"
            then
                BTSE.Farming:refreshCropSprite(plant);
            end

            BTSE.Farming:logError("WARNING: plant of type [" .. tostring(args["seedName"]) .. "] was revitalized to stage [" .. tostring(plant["nbOfGrow"]) .. "] at " .. tostring(args["x"]) .. "," .. tostring(args["y"]) .. "," .. tostring(args["z"]));
        end
    end
end

-- events

Events.OnClientCommand.Add(function(moduleName, command, playerObj, args)
	if moduleName == "btse_farming" and BTSE.Commands.Farming[command]
	then
		BTSE.Commands.Farming[command](playerObj, args);
	end
end);