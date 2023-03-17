local DEBUG = getCore():getDebug()
if not DEBUG then
    return
end
local currentLoudness = 30000
local currentForce = 5000

local function switchForce()
    if currentForce == 5000 then
        currentForce = 15000
    else
        currentForce = 5000
    end
    print("Switched force to: ", currentForce)
    return currentForce
end
local function switchLoudness()
    if currentLoudness == 30000 then
        currentLoudness = 20000
    else
        currentLoudness = 30000
    end
    print("Switched loudness to: ", currentLoudness)
    return currentLoudness
end

local function printVehicleData(input)
    print()
    print("* START VEHICLE DATA ***** " .. input.vehicle:getScript():getFullName() .. " ****************")
    print("C* Vehicle brand name: ", getText("IGUI_VehicleName" .. input.vehicle:getScript():getName()))
    -- print("Script container: ", input.vehicle:getScript())
    print("C* Container type: ", input.trunk:getType())
    print("C* Current capacity: ", input.trunk:getCapacity())
    print("C* Max capacity: ", input.truckBedContainer and input.truckBedContainer:getMaxCapacity())
    print("C* Truck bed part condition: ", input.truckBedPart and input.truckBedPart:getCondition() or "Not Found")
    print("ENGINE: ")
    print("E* Engine loudness (script): ", input.vehicle:getEngineLoudness())
    print("E* Engine force (script): ", input.vehicle:getScript():getEngineForce())
    print("* END VEHICLE DATA ***** " .. input.vehicle:getScript():getFullName() .. " ******************")
    -- EWC_2_0.printVars()()
end
EWC_2_0.printVehicleData = printVehicleData

local function setNoDamageCapacity(input)
    input.truckBedPart:setContainerCapacity(input.truckBedContainer:getMaxCapacity())
    printVehicleData(input)
end
local function setCapacityForHalvedDamageRate(input)
    local newCapacity =
        EWC_2_0.IS_getNumberByCondition(
        input.truckBedContainer:getMaxCapacity(),
        input.truckBedContainer:getCondition(),
        0.5
    )
    input.truckBedPart:setContainerCapacity(newCapacity)
    printVehicleData(input)
end
local function setCapacityForStandardDamageRate(input)
    local newCapacity =
        EWC_2_0.IS_getNumberByCondition(
        input.truckBedContainer:getMaxCapacity(),
        input.truckBedContainer:getCondition(),
        1
    )
    input.truckBedPart:setContainerCapacity(newCapacity)
    printVehicleData(input)
end
local function setCapacityForDoubleDamageRate(input)
    local newCapacity =
        EWC_2_0.IS_getNumberByCondition(
        input.truckBedContainer:getMaxCapacity(),
        input.truckBedContainer:getCondition(),
        2
    )
    input.truckBedPart:setContainerCapacity(newCapacity)
    printVehicleData(input)
end
local function setNewMaxCapacity(input)
    input.truckBedContainer:setMaxCapacity(input.truckBedContainer:getMaxCapacity() + 10)
    printVehicleData(input)
end

local function toggleLoudness(input)
    local vehicle = input.vehicle
    local engine = vehicle:getPartById("Engine")
    print("engine: ", engine)
    local enQ = vehicle:getEngineQuality()
    local enP = switchForce() or vehicle:getEnginePower()
    local engMult = getSandboxOptions():getOptionByName("ZombieAttractionMultiplier"):getValue()
    local enL = switchLoudness() * engMult
    -- engine:setEngineLoudness(enL)
    -- vehicle:updatePartStats()
    print("engMult ", engMult)
    print("engL ", enL)
    print("loudness FROM engine", engine:getEngineLoudness())
    local vehLoudness = vehicle:getEngineLoudness()
    print("loudness FROM vehicle", vehLoudness)
    print("Quality modifier", qualityModifier)
    print("Engine condition", engine:getCondition())
    -- engine:setEngineLoudness(switchLoudness())
    local alternativeLoudness = EWC_2_0.IS_getNumberByCondition(enL, engine:getCondition(), 1, 10)
    vehicle:setEngineFeature(enQ, (vehLoudness + 1) * 2.7, enP)
    print("loudness FROM vehicle after", vehicle:getEngineLoudness())
end
-- local function debugKI5(input)
--     EWC_2_0.reset()
--     EWC_2_0.buildConfigFromContainer(input.container)
--     local vehicle = input.vehicle
--     -- local truckBedPart = EWC_2_0.getTruckBedPart(vehicle)
--     local truckBedPart = vehicle:getPartById("W460Trunk")
--     print("truckBedPart", truckBedPart)
--     local invItem = truckBedPart:getInventoryItem()
--     print("InvItem: ", invItem)
--     local container = truckBedPart:getItemContainer()
--     print("Container: ", container)
--     print("Capacity: ", EWC_2_0.getVehicleMaxTrunkCapacity(vehicle))
--     invItem:setMaxCapacity(6)
--     truckBedPart:setContainerCapacity(9)
--     local lootPage = getPlayerLoot(getPlayer():getPlayerNum())
--     lootPage.capacity = appliedCapacity
--     print("InvItem max cap: ", invItem:getMaxCapacity())
-- end

local function addDebugOptions(player, context, items)
    local item
    if items[1].items then
        item = items[1].items[1]
    else -- if right-clicked in hotbar
        item = items[1]
    end
    if not item then
        return
    end

    local possiblyTrunk = item:getContainer()

    -- print("container: ", possiblyTrunk)

    if EWC_2_0.isValidCarTrunk(possiblyTrunk) then
        local input = EWC_2_0.createTrunkPartsObject(possiblyTrunk)
        local trunk = possiblyTrunk
        context:addOption("*** EWC 2.0: print vehicle data", input, printVehicleData)
        context:addOption("*** EWC 2.0: set no damage capacity", input, setNoDamageCapacity)
        context:addOption("*** EWC 2.0: set capacity for halved DR", input, setCapacityForHalvedDamageRate)
        context:addOption("*** EWC 2.0: set capacity for standard DR", input, setCapacityForStandardDamageRate)
        context:addOption("*** EWC 2.0: set capacity for double DR", input, setCapacityForDoubleDamageRate)
        context:addOption("*** EWC 2.0: inclrease max capacity", input, setNewMaxCapacity)
        context:addOption("*** EWC 2.0: toggle loudness", input, toggleLoudness)
    -- context:addOption("*** EWC 2.0: debug KI5", input, debugKI5)
    end
end
Events.OnFillInventoryObjectContextMenu.Add(addDebugOptions)

function EWC_2_0.printVars(moment)
    moment = moment or "In game"
    return function()
        print("EWC2 vars", moment)
        local vars = SandboxVars.eggonsWorthwileCars2
        EggonsMU.printFuckingNormalObject(vars)
    end
end
