
--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "Vehicles/TimedActions/ISUninstallVehiclePart"
-----------------------------------------------------------------------------------------------------------------------------------------------------------
local upperLayer = {}
upperLayer.ISUninstallVehiclePart = {}
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISUninstallVehiclePart.update = ISUninstallVehiclePart.update
function ISUninstallVehiclePart:update()
    upperLayer.ISUninstallVehiclePart.update(self)
   if self.ADDsound and self.ADDsound ~= 0 and not self.character:getEmitter():isPlaying(self.ADDsound) then self.ADDsound = self.character:playSound("MecaSound_rem" .. (ZombRand(6)+1)) end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISUninstallVehiclePart.start = ISUninstallVehiclePart.start
function ISUninstallVehiclePart:start()
	upperLayer.ISUninstallVehiclePart.start(self)
	self.ADDsound = self.character:playSound("MecaSound_rem" .. (ZombRand(6)+1)) 
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISUninstallVehiclePart.stop = ISUninstallVehiclePart.stop
function ISUninstallVehiclePart:stop()
    upperLayer.ISUninstallVehiclePart.stop(self)
    if self.ADDsound and self.ADDsound ~= 0 then self.character:getEmitter():stopSound(self.ADDsound) end
	self.ADDsound = self.character:playSound("MecaSound_Stop" .. (ZombRand(3)+1))
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISUninstallVehiclePart.perform = ISUninstallVehiclePart.perform
function ISUninstallVehiclePart:perform()
	upperLayer.ISUninstallVehiclePart.perform(self)
	if self.ADDsound and self.ADDsound ~= 0 then self.character:getEmitter():stopSound(self.ADDsound) end
	self.ADDsound = self.character:playSound("MecaSound_ok" .. (ZombRand(3)+1)) 
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------

--upperLayer.ISUninstallVehiclePart.new = ISUninstallVehiclePart.new
--function ISUninstallVehiclePart:new(character, part, time)
--    local o = upperLayer.ISUninstallVehiclePart.new(self,character, part, time)
--
--    if not ISVehicleMechanics.cheat then o.maxTime = o.maxTime + 750; end
--    return o
--end
