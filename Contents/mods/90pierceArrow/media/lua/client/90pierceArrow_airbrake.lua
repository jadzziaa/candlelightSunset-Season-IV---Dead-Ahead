--***********************************************************
--**                          KI5                          **
--***********************************************************

local braked = true

Events.OnPlayerUpdate.Add(function(player)
    local vehicle = player.getVehicle and player:getVehicle() or nil
        if (vehicle and string.find( vehicle:getScriptName(), "90pierceArrow" )) then
            if (vehicle:isEngineRunning() and vehicle:getCurrentSpeedKmHour() == 0) and not braked then
                braked = true
                --print "oshBrake"
                getSoundManager():PlayWorldSound("oshBrake", player:getCurrentSquare(), 1.0, 10.0, 1.0, true)
            end
            if (vehicle:isEngineRunning() and vehicle:getCurrentSpeedKmHour() ~= 0) and braked then
                braked = false
                --print "noBrake"
            end
    end
end )