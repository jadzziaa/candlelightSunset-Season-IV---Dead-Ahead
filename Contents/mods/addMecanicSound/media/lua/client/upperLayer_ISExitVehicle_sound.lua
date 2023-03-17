--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "Vehicles/TimedActions/ISExitVehicle"
-----------------------------------------------------------------------------------------------------------------------------------------------------------
local upperLayer = {}
upperLayer.ISExitVehicle = {}
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISExitVehicle.update = ISExitVehicle.update
function ISExitVehicle:update()
    upperLayer.ISExitVehicle.update(self)
   -- local vehicle = self.character:getVehicle()
    if ADDsoundMecanic_SwitchSeat and ADDsoundMecanic_SwitchSeat ~= 0 then vehicle_soundMecanic_SwitchSeat:getEmitter():stopSound(ADDsoundMecanic_SwitchSeat) ;vehicle_soundMecanic_SwitchSeat = nil ; ADDsoundMecanic_SwitchSeat = nil end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------


