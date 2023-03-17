--
-- Created by IntelliJ IDEA.
-- User: RJ
-- Date: 04/12/2017
-- Time: 10:19
-- To change this template use File | Settings | File Templates.
--

--require "ISUI/ISPanelJoypad"
require "Vehicles/ISUI/ISVehicleACUI"
----------------------------------------------------------------------------------------------------------------------------------------------
local upperLayer = {}
upperLayer.ISVehicleACUI = {}
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISVehicleACUI.changeKnob = ISVehicleACUI.changeKnob
function ISVehicleACUI:changeKnob()
   	upperLayer.ISVehicleACUI.changeKnob(self)
   	self.ADDsound = self.vehicle:playSound("HeatSelect" .. (ZombRand(4)+1))
   		
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISVehicleACUI.onClick = ISVehicleACUI.onClick
function ISVehicleACUI:onClick(button)
    upperLayer.ISVehicleACUI.onClick(self, button)

    if button.internal == "OK" then	

		local vehicle = self.character:getVehicle()
		local batteryPower = vehicle:getBatteryCharge()
		
		if not self.heater:getModData().active and vehicle:isEngineRunning() and batteryPower > 0 then	

			ADDsoundMecanic_Heater = vehicle:getEmitter():playSound("HeaterVentil")

		elseif self.heater:getModData().active and vehicle:isEngineRunning() and batteryPower > 0 then

			if ADDsoundMecanic_Heater and ADDsoundMecanic_Heater ~= 0 then vehicle:getEmitter():stopSound(ADDsoundMecanic_Heater) end								
			ADDsoundMecanic_Heater = vehicle:getEmitter():playSound("HeaterVentilStop")
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------