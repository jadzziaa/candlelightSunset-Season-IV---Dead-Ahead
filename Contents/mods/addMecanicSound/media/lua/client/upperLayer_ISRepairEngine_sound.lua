--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "Vehicles/TimedActions/ISRepairEngine"
-----------------------------------------------------------------------------------------------------------------------------------------------------------
local upperLayer = {}
upperLayer.ISRepairEngine = {}
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISRepairEngine.update = ISRepairEngine.update
function ISRepairEngine:update()
   upperLayer.ISRepairEngine.update(self)
   if self.ADDsound and self.ADDsound ~= 0 and not self.character:getEmitter():isPlaying(self.ADDsound) then self.ADDsound = self.character:playSound("MecaSound_add" .. (ZombRand(6)+1)) end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISRepairEngine.start = ISRepairEngine.start
function ISRepairEngine:start()
	upperLayer.ISRepairEngine.start(self)
	--self:setActionAnim("VehicleWorkOnMid")
	self.ADDsound = self.character:playSound("MecaSound_add" .. (ZombRand(6)+1))
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISRepairEngine.stop = ISRepairEngine.stop
function ISRepairEngine:stop()
    upperLayer.ISRepairEngine.stop(self)
    if self.ADDsound and self.ADDsound ~= 0 then self.character:getEmitter():stopSound(self.ADDsound) end
	self.ADDsound = self.character:playSound("MecaSound_Stop" .. (ZombRand(3)+1))
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISRepairEngine.perform = ISRepairEngine.perform
function ISRepairEngine:perform()
	upperLayer.ISRepairEngine.perform(self)
	if self.ADDsound and self.ADDsound ~= 0 then self.character:getEmitter():stopSound(self.ADDsound) end
	self.ADDsound = self.character:playSound("MecaSound_ok" .. (ZombRand(3)+1)) 
    
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
