require "HeaterSettings"

function onLoadGridsquare(square)

    local objects = square:getObjects()
    for index = 0, objects:size()-1 do
        local object = objects:get(index)
        if instanceof(object, "IsoWorldInventoryObject") then
            local item = object:getItem()

            if (ClientHeaters[item:getID()]) then
                ClientHeaters[item:getID()]:destroy()
                ClientHeaters[item:getID()] = nil
            end

            if item:getType() == SmallHeaterObject.itemType then
                local heaters = ModData.getOrCreate("SAPPHEATER")
                if heaters[item:getID()] and heaters[item:getID()].state == "On" then
                    ClientHeaters[item:getID()] = ISHeaterHeatObject:new(square:getX(), square:getY(), square:getZ(), SmallHeaterObject.heatRadius, SmallHeaterObject.heatTemperature)
                end
            elseif item:getType() == OutdoorHeaterObject.itemType then
                local heaters = ModData.getOrCreate("SAPPHEATER")
                if heaters[item:getID()] and heaters[item:getID()].state == "On" then
                    ClientHeaters[item:getID()] = ISHeaterHeatObject:new(square:getX(), square:getY(), square:getZ(), OutdoorHeaterObject.heatRadius, OutdoorHeaterObject.heatTemperature)
                end    
            elseif item:getType() == ElectricHeaterObject.itemType then     
                local heaters = ModData.getOrCreate("SAPPHEATER")
                if heaters[item:getID()] and heaters[item:getID()].state == "On" then
                    ClientHeaters[item:getID()] = ISHeaterHeatObject:new(square:getX(), square:getY(), square:getZ(), ElectricHeaterObject.heatRadius, ElectricHeaterObject.heatTemperature)
                end       
            end
        end
    end
end

Events.LoadGridsquare.Add(onLoadGridsquare)

local function OnGameStart()

        local heaters = ModData.getOrCreate("SAPPHEATER")

        for k,v in pairs(heaters) do
            local square = getSquare(v.x, v.y, v.z)
            if square and v.state == "On" then
                if ClientHeaters[v.id] == nil then
                    ClientHeaters[v.id] = ISHeaterHeatObject:new(v.x, v.y, v.z, 15, 30)
                end
            end
        end
    end

Events.OnGameStart.Add(OnGameStart)