--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "Vehicles/TimedActions/ISDetachTrailerFromVehicle"
-----------------------------------------------------------------------------------------------------------------------------------------------------------
local upperLayer = {}
upperLayer.ISDetachTrailerFromVehicle = {}
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISDetachTrailerFromVehicle.update = ISDetachTrailerFromVehicle.update
function ISDetachTrailerFromVehicle:update()
    upperLayer.ISDetachTrailerFromVehicle.update(self)
    if self.ADDsound and self.ADDsound ~= 0 and not self.character:getEmitter():isPlaying(self.ADDsound) then self.ADDsound = self.character:playSound("detachTrailer") end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISDetachTrailerFromVehicle.start = ISDetachTrailerFromVehicle.start
function ISDetachTrailerFromVehicle:start()
    upperLayer.ISDetachTrailerFromVehicle.start(self)
	self.ADDsound = self.character:playSound("detachTrailer")   
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISDetachTrailerFromVehicle.stop = ISDetachTrailerFromVehicle.stop
function ISDetachTrailerFromVehicle:stop()
    upperLayer.ISDetachTrailerFromVehicle.stop(self)
    if self.ADDsound and self.ADDsound ~= 0 then self.character:getEmitter():stopSound(self.ADDsound) end
	self.ADDsound = self.character:playSound("attachTrailerStop")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISDetachTrailerFromVehicle.perform = ISDetachTrailerFromVehicle.perform
function ISDetachTrailerFromVehicle:perform()
    upperLayer.ISDetachTrailerFromVehicle.perform(self)
    if self.ADDsound and self.ADDsound ~= 0 then self.character:getEmitter():stopSound(self.ADDsound) end
    self.ADDsound = self.character:playSound("detachTrailerTRUE")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------

--upperLayer.ISDetachTrailerFromVehicle.new = ISDetachTrailerFromVehicle.new
--function ISDetachTrailerFromVehicle:new(character, vehicle, attachment)
--    local o = upperLayer.ISDetachTrailerFromVehicle.new(self,character, vehicle, attachment)
--
--    if not character:isTimedActionInstant() then o.maxTime = o.maxTime + 220; end
--    return o
--end
