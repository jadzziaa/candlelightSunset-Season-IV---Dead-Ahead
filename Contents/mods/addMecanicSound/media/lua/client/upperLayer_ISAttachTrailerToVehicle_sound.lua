--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "Vehicles/TimedActions/ISAttachTrailerToVehicle"
-----------------------------------------------------------------------------------------------------------------------------------------------------------
local upperLayer = {}
upperLayer.ISAttachTrailerToVehicle = {}
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISAttachTrailerToVehicle.update = ISAttachTrailerToVehicle.update
function ISAttachTrailerToVehicle:update()
    upperLayer.ISAttachTrailerToVehicle.update(self)
    if self.ADDsound and self.ADDsound ~= 0 and not self.character:getEmitter():isPlaying(self.ADDsound) then self.ADDsound = self.character:playSound("attachTrailer") end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISAttachTrailerToVehicle.start = ISAttachTrailerToVehicle.start
function ISAttachTrailerToVehicle:start()
	upperLayer.ISAttachTrailerToVehicle.start(self)
    self.ADDsound = self.character:playSound("attachTrailer")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISAttachTrailerToVehicle.stop = ISAttachTrailerToVehicle.stop
function ISAttachTrailerToVehicle:stop()
    upperLayer.ISAttachTrailerToVehicle.stop(self)
    if self.ADDsound and self.ADDsound ~= 0 then self.character:getEmitter():stopSound(self.ADDsound) end
	self.ADDsound = self.character:playSound("attachTrailerStop")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISAttachTrailerToVehicle.perform = ISAttachTrailerToVehicle.perform
function ISAttachTrailerToVehicle:perform()
    upperLayer.ISAttachTrailerToVehicle.perform(self)
    if self.ADDsound and self.ADDsound ~= 0 then self.character:getEmitter():stopSound(self.ADDsound) end
    self.ADDsound = self.character:playSound("attachTrailerTRUE")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------

--upperLayer.ISAttachTrailerToVehicle.new = ISAttachTrailerToVehicle.new
--function ISAttachTrailerToVehicle:new(character, vehicleA, vehicleB, attachmentA, attachmentB)
--    local o = upperLayer.ISAttachTrailerToVehicle.new(self,character, vehicleA, vehicleB, attachmentA, attachmentB)
--
--    if not character:isTimedActionInstant() then o.maxTime = o.maxTime + 220; end
--    return o
--end
