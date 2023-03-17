--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "Vehicles/TimedActions/ISDeflateTire"
-----------------------------------------------------------------------------------------------------------------------------------------------------------
local upperLayer = {}
upperLayer.ISDeflateTire = {}
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISDeflateTire.update = ISDeflateTire.update
function ISDeflateTire:update()
    upperLayer.ISDeflateTire.update(self)
   if self.ADDsound and self.ADDsound ~= 0 and not self.character:getEmitter():isPlaying(self.ADDsound) then self.ADDsound = self.character:playSound("DeflateTire1") end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISDeflateTire.start = ISDeflateTire.start
function ISDeflateTire:start()
	upperLayer.ISDeflateTire.start(self)
	self.ADDsound = self.character:playSound("DeflateTire1")
	self:setActionAnim("VehicleWorkOnTire")  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISDeflateTire.stop = ISDeflateTire.stop
function ISDeflateTire:stop()
    upperLayer.ISDeflateTire.stop(self)
    if self.ADDsound and self.ADDsound ~= 0 then self.character:getEmitter():stopSound(self.ADDsound) end
	self.ADDsound = self.character:playSound("uncap")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISDeflateTire.perform = ISDeflateTire.perform
function ISDeflateTire:perform()
	upperLayer.ISDeflateTire.perform(self)
	if self.ADDsound and self.ADDsound ~= 0 then self.character:getEmitter():stopSound(self.ADDsound) end
	self.ADDsound = self.character:playSound("uncap")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------


