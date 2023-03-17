--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "Vehicles/TimedActions/ISInstallVehiclePart"
-----------------------------------------------------------------------------------------------------------------------------------------------------------
local upperLayer = {}
upperLayer.ISInstallVehiclePart = {}
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISInstallVehiclePart.update = ISInstallVehiclePart.update
function ISInstallVehiclePart:update()
    upperLayer.ISInstallVehiclePart.update(self)
    if self.ADDsound and self.ADDsound ~= 0 and not self.character:getEmitter():isPlaying(self.ADDsound) then self.ADDsound = self.character:playSound("MecaSound_add" .. (ZombRand(6)+1)) end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISInstallVehiclePart.start = ISInstallVehiclePart.start
function ISInstallVehiclePart:start()
    upperLayer.ISInstallVehiclePart.start(self)
    self.ADDsound = self.character:playSound("MecaSound_add" .. (ZombRand(6)+1))--I put it before upperlayer as you did but in doubt always put your alterations after the upper layer. putting it before can be used as a clue that there is a tricky thing going on.
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISInstallVehiclePart.stop = ISInstallVehiclePart.stop
function ISInstallVehiclePart:stop()
    upperLayer.ISInstallVehiclePart.stop(self)
    if self.ADDsound and self.ADDsound ~= 0 then self.character:getEmitter():stopSound(self.ADDsound) end
    self.ADDsound = self.character:playSound("MecaSound_Stop" .. (ZombRand(3)+1))
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISInstallVehiclePart.perform = ISInstallVehiclePart.perform
function ISInstallVehiclePart:perform()
    upperLayer.ISInstallVehiclePart.perform(self)
    if self.ADDsound and self.ADDsound ~= 0 then self.character:getEmitter():stopSound(self.ADDsound) end
    self.ADDsound = self.character:playSound("MecaSound_ok" .. (ZombRand(3)+1)) --I put it before upperlayer as you did but in doubt always put your alterations after the upper layer. putting it before can be used as a clue that there is a tricky thing going on.
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------

--upperLayer.ISInstallVehiclePart.new = ISInstallVehiclePart.new
--function ISInstallVehiclePart:new(character, part, item, time)
--    local o = upperLayer.ISInstallVehiclePart.new(self,character, part, item, time)
--
--    if not ISVehicleMechanics.cheat then o.maxTime = o.maxTime + 750; end
--    return o
--end