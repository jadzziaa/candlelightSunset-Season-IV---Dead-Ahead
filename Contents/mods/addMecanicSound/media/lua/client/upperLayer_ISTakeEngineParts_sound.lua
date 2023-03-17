--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "Vehicles/TimedActions/ISTakeEngineParts"
-----------------------------------------------------------------------------------------------------------------------------------------------------------
local upperLayer = {}
upperLayer.ISTakeEngineParts = {}
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISTakeEngineParts.update = ISTakeEngineParts.update
function ISTakeEngineParts:update()
   upperLayer.ISTakeEngineParts.update(self)
   if self.ADDsound and self.ADDsound ~= 0 and not self.character:getEmitter():isPlaying(self.ADDsound) then self.ADDsound = self.character:playSound("MecaSound_rem" .. (ZombRand(6)+1)) end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISTakeEngineParts.start = ISTakeEngineParts.start
function ISTakeEngineParts:start()
	upperLayer.ISTakeEngineParts.start(self)
	self:setActionAnim("VehicleWorkOnMid")
	self.ADDsound = self.character:playSound("MecaSound_rem" .. (ZombRand(6)+1))
    
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISTakeEngineParts.stop = ISTakeEngineParts.stop
function ISTakeEngineParts:stop()
    upperLayer.ISTakeEngineParts.stop(self)
    if self.ADDsound and self.ADDsound ~= 0 then self.character:getEmitter():stopSound(self.ADDsound) end
	self.ADDsound = self.character:playSound("MecaSound_Stop" .. (ZombRand(3)+1))
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISTakeEngineParts.perform = ISTakeEngineParts.perform
function ISTakeEngineParts:perform()
	upperLayer.ISTakeEngineParts.perform(self)
	if self.ADDsound and self.ADDsound ~= 0 then self.character:getEmitter():stopSound(self.ADDsound) end
	self.ADDsound = self.character:playSound("MecaSound_ok" .. (ZombRand(3)+1))  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
