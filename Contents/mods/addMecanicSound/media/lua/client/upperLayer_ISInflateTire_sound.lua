--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "Vehicles/TimedActions/ISInflateTire"
-----------------------------------------------------------------------------------------------------------------------------------------------------------
local upperLayer = {}
upperLayer.ISInflateTire = {}
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISInflateTire.update = ISInflateTire.update
function ISInflateTire:update()
   upperLayer.ISInflateTire.update(self)
   if self.ADDsound and self.ADDsound ~= 0 and not self.character:getEmitter():isPlaying(self.ADDsound) then self.ADDsound = self.character:playSound("AirPump1") end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISInflateTire.start = ISInflateTire.start
function ISInflateTire:start()    
	upperLayer.ISInflateTire.start(self)
	self.ADDsound = self.character:playSound("AirPump1")
	self:setActionAnim("VehicleWorkOnTire")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISInflateTire.stop = ISInflateTire.stop
function ISInflateTire:stop()
    upperLayer.ISInflateTire.stop(self)
    if self.ADDsound and self.ADDsound ~= 0 then self.character:getEmitter():stopSound(self.ADDsound) end
	self.ADDsound = self.character:playSound("uncap")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISInflateTire.perform = ISInflateTire.perform
function ISInflateTire:perform()
	upperLayer.ISInflateTire.perform(self)
	if self.ADDsound and self.ADDsound ~= 0 then self.character:getEmitter():stopSound(self.ADDsound) end
	self.ADDsound = self.character:playSound("uncap")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
