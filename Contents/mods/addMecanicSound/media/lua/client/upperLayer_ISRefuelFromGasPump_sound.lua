--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "Vehicles/TimedActions/ISRefuelFromGasPump"
-----------------------------------------------------------------------------------------------------------------------------------------------------------
local upperLayer = {}
upperLayer.ISRefuelFromGasPump = {}
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISRefuelFromGasPump.update = ISRefuelFromGasPump.update
function ISRefuelFromGasPump:update()
    upperLayer.ISRefuelFromGasPump.update(self)
    --if self.sound and self.sound ~= 0 then self.character:stopOrTriggerSound(self.sound) end
   	--if UIManager.getSpeedControls() and (UIManager.getSpeedControls():getCurrentGameSpeed() == 0) or (UIManager.getSpeedControls():getCurrentGameSpeed() > 1) then return end

    --if not self.ADDsound then self.ADDsound = self.character:getEmitter():playSound("StationFuelDepart") end
	if self.ADDsound and self.ADDsound ~= 0 and not self.character:getEmitter():isPlaying(self.ADDsound) then self.ADDsound = self.character:getEmitter():playSound("StationFuelUpdate") end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISRefuelFromGasPump.start = ISRefuelFromGasPump.start
function ISRefuelFromGasPump:start()
	upperLayer.ISRefuelFromGasPump.start(self)
 if self.sound and self.sound ~= 0 then self.character:stopOrTriggerSound(self.sound) end
 self.ADDsound = self.character:getEmitter():playSound("StationFuelDepart");
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISRefuelFromGasPump.stop = ISRefuelFromGasPump.stop
function ISRefuelFromGasPump:stop()
    upperLayer.ISRefuelFromGasPump.stop(self)
	if self.ADDsound and self.ADDsound ~= 0 and self.character:getEmitter():isPlaying(self.ADDsound) then self.character:getEmitter():stopSound(self.ADDsound) end
    self.ADDsound = self.character:getEmitter():playSound("StationFuelStop2")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISRefuelFromGasPump.perform = ISRefuelFromGasPump.perform
function ISRefuelFromGasPump:perform()
	upperLayer.ISRefuelFromGasPump.perform(self)
	if self.ADDsound and self.ADDsound ~= 0 and self.character:getEmitter():isPlaying(self.ADDsound) then self.character:getEmitter():stopSound(self.ADDsound) end
    self.ADDsound = self.character:getEmitter():playSound("StationFuelStop")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
	