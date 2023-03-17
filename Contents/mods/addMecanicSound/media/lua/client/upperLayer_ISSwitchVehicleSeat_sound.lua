--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "Vehicles/TimedActions/ISSwitchVehicleSeat"
-----------------------------------------------------------------------------------------------------------------------------------------------------------
local upperLayer = {}
upperLayer.ISSwitchVehicleSeat = {}
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISSwitchVehicleSeat.start = ISSwitchVehicleSeat.start
function ISSwitchVehicleSeat:start()
	upperLayer.ISSwitchVehicleSeat.start(self)
	vehicle_soundMecanic_SwitchSeat = nil ; 
	ADDsoundMecanic_SwitchSeat = nil ;
	vehicle_soundMecanic_SwitchSeat = self.character:getVehicle()

	if vehicle_soundMecanic_SwitchSeat and (ADDsoundMecanic_SwitchSeat == nil)  then ADDsoundMecanic_SwitchSeat = vehicle_soundMecanic_SwitchSeat:getEmitter():playSound("SwitchSeat" .. (ZombRand(4)+1)) end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
