if isClient()
then
    return;
end

require "Farming/farming_vegetableconf";
require "Farming/SFarmingSystem";
require "Farming/SPlantGlobalObject";

-- farming system checks because the devs surely don't

local vanillaGrow = SFarmingSystem["growPlant"];

SFarmingSystem["growPlant"] = function(self, luaObject, nextGrowing, updateNbOfGrow)
    if not luaObject
    then
        BTSE.Farming:logError("ERROR: luaObject missing in SFarmingSystem:growPlant()");

        return;
    end

    if luaObject["state"] == "seeded" and luaObject["typeOfSeed"]
    then
        if not farming_vegetableconf["props"][luaObject["typeOfSeed"]]
        then
            BTSE.Farming:logError("WARNING: invalid seed [" .. tostring(luaObject["typeOfSeed"]) .. "] detected in SFarmingSystem:growPlant(). Growing potato instead.");

            luaObject["typeOfSeed"] = "Potatoes"; -- yes. plural.
            luaObject["nbOfGrow"] = 0;

            luaObject:saveData();

            BTSE.Farming:refreshCropSprite(luaObject);
        end
    end

    luaObject = BTSE.Farming:growCrop(luaObject, nextGrowing, updateNbOfGrow);

    vanillaGrow(self, luaObject, nextGrowing, updateNbOfGrow);
end

local vanillaHarvest = SFarmingSystem["harvest"];

SFarmingSystem["harvest"] = function(self, luaObject, player)
    if not luaObject
    then
        BTSE.Farming:logError("ERROR: no luaObject in SFarmingSystem:harvest()");

        return;
    end

    if not BTSE.Farming:harvestCrop(self, luaObject, player)
    then
        vanillaHarvest(self, luaObject, player);
    end
end

-- hooks into the global object system

local vanillaStateToIso = SPlantGlobalObject["stateToIsoObject"];

SPlantGlobalObject["stateToIsoObject"] = function(self, isoObject)
    if not self:getSquare()
    then
        BTSE.Farming:logError("WARNING: square unknown in SPlantGlobalObject:stateToIsoObject()");

        return;
    end

    vanillaStateToIso(self, isoObject);
end

local vanillaDry = SPlantGlobalObject["dryThis"];

SPlantGlobalObject["dryThis"] = function(self)
    if not self["typeOfSeed"]
    then
        BTSE.Farming:logError("ERROR: invalid seed [" .. tostring(self["typeOfSeed"]) .. "] detected in SPlantGlobalObject:dryThis()");

        return;
    end

    vanillaDry(self);

    BTSE.Farming:dryCrop(self);
end

local vanillaRot = SPlantGlobalObject["rottenThis"];

SPlantGlobalObject["rottenThis"] = function(self)
    if not self["typeOfSeed"]
    then
        BTSE.Farming:logError("ERROR: invalid seed [" .. tostring(self["typeOfSeed"]) .. "] detected in SPlantGlobalObject:rottenThis()");

        return;
    end

    vanillaRot(self);

    BTSE.Farming:rotCrop(self);
end

local vanillaDestroy = SPlantGlobalObject["destroyThis"];

SPlantGlobalObject["destroyThis"] = function(self)
    if not self["typeOfSeed"]
    then
        BTSE.Farming:logError("ERROR: invalid seed [" .. tostring(self["typeOfSeed"]) .. "] detected in SPlantGlobalObject:destroyThis()");

        return;
    end

    vanillaDestroy(self);

    BTSE.Farming:destroyCrop(self);
end

local vanillaCheck = SPlantGlobalObject["checkStat"];

SPlantGlobalObject["checkStat"] = function(self)
    if type(self["nbOfGrow"]) ~= "number"
    then
        BTSE.Farming:logError("WARNING: invalid nbOfGrow type [" .. tostring(type(self["nbOfGrow"])) .. "] detected in SPlantGlobalObject:checkStat()");

        self["nbOfGrow"] = 0;
    end

    vanillaCheck(self);
end