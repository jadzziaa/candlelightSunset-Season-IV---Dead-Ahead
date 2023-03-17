EWC_2_0 = EWC_2_0 or {}

function EWC_2_0.updateVehicleTrunk(vehicle)
    local CFG = EWC_2_0.CurrentCarCFG
    local sandboxVars = SandboxVars.eggonsWorthwileCars2
    local trunkVehiclePart = CFG.trunkVehiclePart
    local trunkInventoryItem = CFG.trunkInventoryItem
    local trunkMaxCapacity, vehicleConfig
    local changesApplied = false
    vehicleConfig = CFG.vehicleConfig or EWC_2_0.getAndStoreVehicleConfig(vehicle)

    -- APPLY EGGON'S CAPACITY BALANCE...
    if (sandboxVars.ApplyCapacityBalance and vehicleConfig and vehicleConfig.trunkType == CFG.trunkType) then
        -- print("APPLYING BALANCE")
        -- print("Has CFG.vehicleConfig: ", CFG.vehicleConfig)
        -- if vehicleConfig then
        --     EggonsMU.printFuckingNormalObject(vehicleConfig, "VEHICLE CONFIG FOUND ")
        -- end
        trunkMaxCapacity =
            vehicleConfig and vehicleConfig.trunkCapacity or EWC_2_0.getOrSetStoredMaxCapacityForTrunk() or nil
    else -- ... OR TAKE VANILLA VALUE STORED IN MOD DATA
        -- print("NOT APPLYING BALANCE")
        trunkMaxCapacity = EWC_2_0.getOrSetStoredMaxCapacityForTrunk()
    end

    if trunkMaxCapacity == nil then
        return vehicleConfig
    end
    -- CALCULATE AND APPLY MULTIPLIED MAX CAPACITY TO THE VEHICLE
    -- print("trunkMaxCapacity: ", trunkMaxCapacity)
    -- print("trunkInventoryItem:getMaxCapacity(): ", trunkInventoryItem:getMaxCapacity())
    -- print("sandboxVars.CapacityMultiplier: ", sandboxVars.CapacityMultiplier)
    trunkMaxCapacity = Math.ceil(trunkMaxCapacity * sandboxVars.CapacityMultiplier)

    if trunkInventoryItem:getMaxCapacity() ~= trunkMaxCapacity then
        trunkInventoryItem:setMaxCapacity(trunkMaxCapacity)
        changesApplied = true
    end

    -- CALCULATE CURRENT CAPACITY BASED ON DAMAGE AND CAPACITY_CHANGE_RATE
    local appliedCapacity =
        EWC_2_0.IS_getNumberByCondition(
        trunkMaxCapacity,
        trunkInventoryItem:getCondition(),
        sandboxVars.CapacityChangeRate
    )

    -- APPLY CURRENT TRUNK CAPACITY TO THE VEHICLE
    if trunkVehiclePart:getContainerCapacity() ~= appliedCapacity then
        trunkVehiclePart:setContainerCapacity(appliedCapacity)
        changesApplied = true
    end

    -- REFRESH CAPACITY VALUE DISPLAYED ON THE INVENTORY PAGE
    local lootPage = getPlayerLoot(getPlayer():getPlayerNum())
    lootPage.capacity = appliedCapacity
    if isClient() and changesApplied then
        vehicle:transmitPartItem(trunkVehiclePart)
    end
    return vehicleConfig
end

function EWC_2_0.isUpdateRequired()
    local sandboxVars = SandboxVars.eggonsWorthwileCars2
    return sandboxVars.ApplyCapacityBalance or sandboxVars.TrunkCapacityChange ~= 1 or
        SandboxVars.CapacityMultiplier ~= 1
end

local function printPartNotFoundWarning(missingPart, buildPath)
    local CFG = EWC_2_0.CurrentCarCFG
    print(
        "EWC 2.0 warning: " ..
            missingPart .. " not found although expected while building config from " .. buildPath .. "."
    )
    -- print("Trunk type: ", CFG.trunkType)
    -- print("Vehicle: ", CFG.vehicle:getVehicleType())
end

function EWC_2_0.finishConfigBuild(buildPath)
    local CFG = EWC_2_0.CurrentCarCFG
    if not CFG.trunkVehiclePart then
        printPartNotFoundWarning("CFG.trunkVehiclePart", buildPath)
        return false
    end
    CFG.trunkInventoryItem = CFG.trunkVehiclePart:getInventoryItem()
    if not CFG.trunkInventoryItem then
        printPartNotFoundWarning("CFG.trunkInventoryItem", buildPath)
        return false
    end
    -- print("trunkInventoryItem set: ", CFG.trunkInventoryItem)
    return true
end

function EWC_2_0.buildConfigFromContainer(container)
    local CFG = EWC_2_0.CurrentCarCFG
    -- print("BCFC: Container type", container:getType())
    -- print("BCFC: Container parent", container:getParent())
    -- CFG.container = container
    CFG.vehicle = container:getParent()
    CFG.trunkType = container:getType()
    CFG.trunkVehiclePart = CFG.vehicle:getPartById(CFG.trunkType)
    -- if not trunkVehiclePart then
    -- print("EWC 2.0 warning: trunkVehiclePart not found although trunkType was known")
    --     return false
    -- end
    return EWC_2_0.finishConfigBuild("container")
end
function EWC_2_0.buildConfigFromVehicle(vehicle)
    local CFG = EWC_2_0.CurrentCarCFG
    CFG.vehicle = vehicle
    -- find config
    EWC_2_0.getAndStoreVehicleConfig(vehicle)

    if CFG.vehicleConfig then
        -- DISPLAY PLAYER WARNING
        CFG.trunkType = CFG.vehicleConfig.trunkType
        CFG.trunkVehiclePart = vehicle:getPartById(CFG.trunkType)
    else
        CFG.trunkVehiclePart = EWC_2_0.getStandardTruckBedPart(vehicle)
    end
    return EWC_2_0.finishConfigBuild("vehicle")
end

function EWC_2_0.updateVehicleTrunkIfRequiredFromContainer(container)
    local CFG = EWC_2_0.CurrentCarCFG
    -- if EWC_2_0.isUpdateRequired() then
    -- print("Container passed to UVTIRFC: ", container)
    if not EWC_2_0.buildConfigFromContainer(container) then
        return nil
    end
    -- print("CFG.vehicle ", CFG.vehicle)
    return EWC_2_0.updateVehicleTrunk(CFG.vehicle)
    -- end
end

function EWC_2_0.updateVehicleTrunkIfRequiredFromHood(vehicle, sandboxVars)
    local CFG = EWC_2_0.CurrentCarCFG
    -- if EWC_2_0.isUpdateRequired() then
    if not EWC_2_0.buildConfigFromVehicle(vehicle) then
        return CFG.vehicleConfig
    end
    return EWC_2_0.updateVehicleTrunk(vehicle)
    -- end
end
