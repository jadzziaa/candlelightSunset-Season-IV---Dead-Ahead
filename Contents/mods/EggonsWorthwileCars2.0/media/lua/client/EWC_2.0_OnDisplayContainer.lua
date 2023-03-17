EggonsMU.enableEvent.OnDisplayLootContainerContents()
local DEBUG = getCore():getDebug()

local function onDisplayLootContainerContents(containerOrTrunk)
    -- print("containerOrTrunk: ", containerOrTrunk)
    -- print("container type: ", containerOrTrunk:getType())
    -- print("IS CLIENT: ", isClient())
    -- CHECK IF CONTAINER IS A TRUNK
    if not EWC_2_0.isValidCarTrunk(containerOrTrunk) then
        return
    end
    EWC_2_0.reset()
    -- local truckbedpart = vehicle:getPartById("TrailerTrunk")
    -- print("containerOrTrunk === truckbedpart", truckbedpart == containerOrTrunk)
    -- print("vehicle: ", vehicle)
    if DEBUG then
        local vehicle = containerOrTrunk:getParent()
        local carConfig = EWC_2_0.getVehicleConfig(vehicle)
        EWC_2_0.printVehicleData(EWC_2_0.createTrunkPartsObject(containerOrTrunk))
        if not carConfig then
            print("*** END: CONFIG NOT FOUND! ***")
        else
            -- print("Config fonud (not stored) type: ", carConfig.trunkType)
            print("*** CONFIG FOUND! ***")
        end
    end
    -- if not vehicle then -- not necessary, already checked by isValidCarTrunk
    --     return
    -- end
    EWC_2_0.updateVehicleTrunkIfRequiredFromContainer(containerOrTrunk)
end

Events.OnDisplayLootContainerContents.Add(onDisplayLootContainerContents)
