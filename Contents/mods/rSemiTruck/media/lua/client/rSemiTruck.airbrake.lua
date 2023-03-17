--***********************************************************
--**                  Written by KI5                       **
--***********************************************************

local braked = true

Events.OnPlayerUpdate.Add(function(player)
   local vehicle = player.getVehicle and player:getVehicle() or nil
   if (vehicle and string.find( vehicle:getScriptName(), "Rotators.SemiTruck" )) then
      if (vehicle:isEngineRunning() and vehicle:getCurrentSpeedKmHour() == 0) and not braked then
         braked = true
         getSoundManager():PlayWorldSound("VehicleAirBrake", player:getCurrentSquare(), 1.0, 10.0, 1.0, true)
      end
      if (vehicle:isEngineRunning() and vehicle:getCurrentSpeedKmHour() ~= 0) and braked then
         braked = false
      end
   end
end )