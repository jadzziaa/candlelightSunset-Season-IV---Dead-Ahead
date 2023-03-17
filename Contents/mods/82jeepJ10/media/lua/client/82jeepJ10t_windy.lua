--***********************************************************
--**                          KI5                          **
--***********************************************************

JP82 = JP82 or {};

local opened = false

function JP82.DorothyAnemometer(player)
    local vehicle = player.getVehicle and player:getVehicle() or nil
        if (vehicle and string.find( vehicle:getScriptName(), "82jeepJ10t" )) then

            local part = vehicle:getPartById("JP82Windy")
            if not opened and vehicle:isEngineRunning() and (vehicle:getCurrentSpeedKmHour() >= 25) then
                vehicle:playPartAnim(part, "Open")
                part:getDoor():setOpen(true)
                opened = true
            end
            if opened and vehicle:isEngineRunning() and (vehicle:getCurrentSpeedKmHour() < 25) then
                vehicle:playPartAnim(part, "Close")
                part:getDoor():setOpen(false)
                opened = false
            end
        end
end

Events.OnPlayerUpdate.Add(JP82.DorothyAnemometer);