--***********************************************************
--**                          KI5                          **
--***********************************************************

R32 = R32 or {};

local fired = false

function R32.turbo(player)
    local vehicle = player.getVehicle and player:getVehicle() or nil
        if (vehicle and string.find( vehicle:getScriptName(), "92nissanGTR" )) then
            if not fired and vehicle:isEngineRunning() and (vehicle:getEngineSpeed() >= 3900) then
                getSoundManager():PlaySound("GTRturbo", false, 1)
                fired = true
            end
            if fired and vehicle:isEngineRunning() and (vehicle:getEngineSpeed() < 2900) then
                getSoundManager():PlaySound("GTRcrackling", false, 1)
                fired = false
            end
        end
end

Events.OnPlayerUpdate.Add(R32.turbo);