EWC_2_0 = EWC_2_0 or {}
-- local CFG = EWC_2_0.CurrentCarCFG

function EWC_2_0.createTrunkPartsObject(trunk)
    local vehicle = trunk:getParent()
    local carConfig = EWC_2_0.getVehicleConfig(vehicle)
    local truckBedPart = EWC_2_0.getTruckBedPart(vehicle, carConfig and carConfig.trunkType)
    local truckBedContainer = truckBedPart and truckBedPart:getInventoryItem()
    if not truckBedContainer then
        print("EWC 2.0 debug: truckBedContainer not found (inventory item)")
    end
    local input = {
        vehicle = vehicle,
        truckBedPart = truckBedPart,
        truckBedContainer = truckBedContainer,
        trunk = trunk
    }
    return input
end

function EWC_2_0.getOrSetModData()
    local CFG = EWC_2_0.CurrentCarCFG
    local trunkInventoryItem = CFG.trunkInventoryItem
    -- EggonsMU.printFuckingNormalObject(EWC_2_0.CurrentCarCFG, "EWC_2_0.CurrentCarCFG")
    local MD = trunkInventoryItem:getModData()
    if not MD.EWC_2_0 then
        -- print("Setting new MD")
        MD.EWC_2_0 = {maxCapacity = trunkInventoryItem:getMaxCapacity()}
    elseif not MD.EWC_2_0.maxCapacity then
        MD.EWC_2_0.maxCapacity = trunkInventoryItem:getMaxCapacity()
    end
    -- print("stored max cap: ", MD.EWC_2_0.maxCapacity)
    return MD.EWC_2_0
end

function EWC_2_0.getOrSetStoredMaxCapacityForTrunk()
    local MD = EWC_2_0.getOrSetModData()
    return MD.maxCapacity
end

function EWC_2_0.getStandardTruckBedPart(vehicle)
    return vehicle:getPartById("TruckBed") or vehicle:getPartById("TruckBedOpen") or vehicle:getPartById("TrailerTrunk")
end

function EWC_2_0.getTruckBedPart(vehicle, trunkType)
    trunkType = trunkType or ""
    return vehicle:getPartById(trunkType) or EWC_2_0.getStandardTruckBedPart(vehicle)
end

function EWC_2_0.unsmashName(scriptFullName)
    if scriptFullName:find("%SmashedFront$") then
        return scriptFullName:sub(1, -13)
    elseif scriptFullName:find("%SmashedRear$") then
        return scriptFullName:sub(1, -12)
    elseif scriptFullName:find("%SmashedRight$") then
        return scriptFullName:sub(1, -13)
    elseif scriptFullName:find("%SmashedLeft$") then
        return scriptFullName:sub(1, -12)
    else
        return scriptFullName
    end
end

function EWC_2_0.getVehicleScriptConfig(vehicleScript)
    local scriptFullName = vehicleScript:getFullName()
    -- remove "SmashedRight" etc from script names to get the base car name
    local unsmashedName = EWC_2_0.unsmashName(scriptFullName)
    return EWC_2_0.JointCarsConfigs[unsmashedName]
end

function EWC_2_0.getVehicleConfig(vehicle)
    return EWC_2_0.getVehicleScriptConfig(vehicle:getScript())
end

function EWC_2_0.getAndStoreVehicleConfig(vehicle)
    EWC_2_0.CurrentCarCFG.vehicleConfig = EWC_2_0.getVehicleConfig(vehicle)
    return EWC_2_0.CurrentCarCFG.vehicleConfig
end

function EWC_2_0.getVehicleMaxTrunkCapacity(vehicle)
    -- local truckBedPart = EWC_2_0.getTruckBedPart(vehicle)
    -- local invItem = truckBedPart:getInventoryItem()
    -- if not invItem then
    --     return nil
    -- end
    local trunkInventoryItem = CFG.trunkInventoryItem
    -- print("TrunkInventoryItem PRESENT: ", trunkInventoryItem)
    -- print("Max cap = ", trunkInventoryItem:getMaxCapacity())
    return trunkInventoryItem and trunkInventoryItem:getMaxCapacity()
end

function EWC_2_0.getVehicleTrunkConfigFromTrunk(trunk)
    local vehicle = trunk:getParent()
    return EWC_2_0.getVehicleTrunkConfig(vehicle)
end
function EWC_2_0.getVehicleScriptFromTrunk(trunk)
    local vehicle = trunk:getParent()
    return ScriptManager.instance:getVehicle(vehicle:getScriptName())
end
function EWC_2_0.getVehicleTrunkConfig(vehicle)
    -- return EWC_2_0.JoinCarConfigs[vehicle.name]
end
function EWC_2_0.getGamesCurrentTrunkMaxCapacity(trunk)
    local trunksInventoryItem = trunk:getInventoryItem()
    return trunksInventoryItem:getMaxCapacity()
end

function EWC_2_0.getConfiguredTrunkMaxCapacity(trunk, vehicle)
    local SV = SandboxVars.eggonsWorthwileCars2
    local trunkCfg, maxCapacity
    if SV.ApplyCapacityBalance then -- balance expected
        trunkCfg = EWC_2_0.getVehicleTrunkConfigFromTrunk(trunk)
        if trunkCfg then
            maxCapacity = trunkCfg.trunkCapacity
        else -- car not configured
            maxCapacity = EWC_2_0.getGamesCurrentTrunkMaxCapacity(trunk)
        end
    else
        maxCapacity = EWC_2_0.getGamesCurrentTrunkMaxCapacity(trunk)
    end
    if SV.CapacityMultiplier then
    end
    return maxCapacity
end

function EWC_2_0.getRelevantTrunkPart(vehicle, modData)
    local trunksInventoryItem = trunk:getInventoryItem()
    return trunksInventoryItem:getMaxCapacity()
end

-- This is how PZ calculates capacity for trunks based on condition - don't blame me if you don't understand
function EWC_2_0.IS_getNumberByCondition(maxCapacity, condition, capacityLossMultiplier, minimum)
    minimum = minimum or 5
    local capacityLossMultiplier = capacityLossMultiplier or 1
    local conditionLost = (100 - condition)
    -- Apply quicker/slower modifier
    local modifiedConditionLost = Math.floor(conditionLost * capacityLossMultiplier + 0.5)
    local modifiedCondition = 100 - modifiedConditionLost
    modifiedCondition = modifiedCondition + ((20 * modifiedConditionLost) / 100)
    return Math.floor(Math.max(minimum, maxCapacity * (modifiedCondition / 100)))
end

function EWC_2_0.isValidCarTrunk(containerOrTrunk)
    if not containerOrTrunk then
        return false
    end
    local parent = containerOrTrunk:getParent()
    -- print("IS INSTANCE OF VEHICLE", instanceof(parent, "BaseVehicle"))
    if not parent or not instanceof(parent, "BaseVehicle") then
        return false
    end
    local containerType = containerOrTrunk:getType()
    print("Container type: ", containerType)
    local typeStart = containerType:sub(1, 4)
    print("type start: ", typeStart)
    if typeStart == "Seat" then
        -- print("Seat identified, setting value: ", SandboxVars.eggonsWorthwileCars2.ApplyCapacityMultiplierToSeats)
        if SandboxVars.eggonsWorthwileCars2.ApplyCapacityMultiplierToSeats then
            return true
        else
            return false
        end
    elseif typeStart == "Glov" then
        -- print(
        --     "GloveBox identified, setting value: ",
        --     SandboxVars.eggonsWorthwileCars2.ApplyCapacityMultiplierToGloveBoxes
        -- )
        if SandboxVars.eggonsWorthwileCars2.ApplyCapacityMultiplierToGloveBoxes then
            return true
        else
            return false
        end
    end
    return true
    -- print("PARENT", parent)
    -- print("PARENT TYPE", parent and parent:getType())

    -- return EWC_2_0.vehicleContainerTypes[containerOrTrunk:getType()]
end
