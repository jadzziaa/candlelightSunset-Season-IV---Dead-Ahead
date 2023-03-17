GarbageTruckTrunk = {}
GarbageTruckTrunk.Create = {}
GarbageTruckTrunk.Init = {}
GarbageTruckTrunk.Update = {}

function GarbageTruckTrunk.Create.GarbageTrunk(vehicle, part)
    local invItem = VehicleUtils.createPartInventoryItem(part);
    part:getItemContainer():setType("bin")
    part:getItemContainer():setActive(true)
    vehicle:setNeedPartsUpdate(true);
end

function GarbageTruckTrunk.Init.GarbageTrunk(vehicle, part)
    vehicle:setNeedPartsUpdate(true);
end

function GarbageTruckTrunk.Update.GarbageTrunk(vehicle, part, elapsedMinutes)
    vehicle:setNeedPartsUpdate(true);
end

function GarbageTruckTrunk.Update.Engine(vehicle, part, elapsedMinutes)
    vehicle:setNeedPartsUpdate(true);
end
