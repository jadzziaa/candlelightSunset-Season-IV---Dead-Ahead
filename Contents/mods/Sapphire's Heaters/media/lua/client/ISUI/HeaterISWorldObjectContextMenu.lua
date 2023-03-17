-- This deals with the context menu of showing "Add Battery" to the heaters

require 'ISUI/ISWorldObjectContextMenu';

local ISWorldObjectContextMenu_fetch = ISWorldObjectContextMenu.fetch; -- Preserve Base Functionality
ISWorldObjectContextMenu.fetch = function(v, player, doSquare, ...)
    ISWorldObjectContextMenu_fetch(v, player, doSquare, ...) -- Call Base Functionality
    
    -- If Item Is ElectricHeater Add Variable with Item
    if instanceof(v, "IsoWorldInventoryObject") and v:getItem():getType() == SmallHeaterObject.itemType then
        heater = v;
    elseif instanceof(v, "IsoWorldInventoryObject") and v:getItem():getType() == OutdoorHeaterObject.itemType then
        heater = v;
    elseif instanceof(v, "IsoWorldInventoryObject") and v:getItem():getType() == ElectricHeaterObject.itemType then
        heater = v;
    end
end

local ISWorldObjectContextMenu_clearFetch = ISWorldObjectContextMenu.clearFetch; -- Preserve Base Functionality
ISWorldObjectContextMenu.clearFetch = function()
    ISWorldObjectContextMenu_clearFetch() -- Call Base Functionality
    heater = nil
end


function onHeater_Toggle(heater, player)
    if luautils.walkAdj(player, heater:getSquare()) then
		ISTimedActionQueue.add(ISHeaterToggleHeatAction:new(player, heater))
	end
end

function onHeater_Insert(heater, player, battery)
    if luautils.walkAdj(player, heater:getSquare()) then
        ISTimedActionQueue.add(ISHeaterInsertBatteryAction:new(player, heater, battery))
    end
end

local ISWorldObjectContextMenu_createMenu = ISWorldObjectContextMenu.createMenu; -- Preserve Base Functionality
function ISWorldObjectContextMenu.createMenu(player, worldobjects, x, y, test, ...)
    local context = ISWorldObjectContextMenu_createMenu(player, worldobjects, x, y, test, ...); -- Call Base Functionality

    if test == true then return true; end
    if not context then return true; end

    if heater then

        local playerObj = getSpecificPlayer(player)
        local heaterItem = heater:getItem()
        local id = heaterItem:getID()

        local Heaters = ModData.getOrCreate("SAPPHEATER")
        if Heaters[id] and Heaters[id].battery <= 0 then

            -- Add Insert Battery Context Options
            local items = playerObj:getInventory():getItems()
            local battery = nil
            local charge = 0

            for j=1,items:size() do
                local item = items:get(j-1)

                if heaterItem:getType() == SmallHeaterObject.itemType then
                    if item:getType() == "CarBattery1" then -- do a elseif statement here
                        if item:getDelta() > charge then
                            charge = item:getDelta()
                            battery = item
                        end
                    end
                elseif heaterItem:getType() == OutdoorHeaterObject.itemType then
                    if item:getType() == "CarBattery2" then -- do a elseif statement here
                        if item:getDelta() > charge then
                            charge = item:getDelta()
                            battery = item
                        end
                    end
                end
            end

            if battery ~= nil then
                context:addOption(getText("ContextMenu_Insert_Battery"), heater, onHeater_Insert, playerObj, battery)
            end

        else

            -- Add Turn On and Off Context Options
            local contextTxt = getText("ContextMenu_Turn_On")
            if Heaters[id] and Heaters[id].state == "On" then
                contextTxt = getText("ContextMenu_Turn_Off")
            end

            context:addOption(contextTxt, heater, onHeater_Toggle, playerObj)
        end


    end

    return context;
end

