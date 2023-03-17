--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "Vehicles/TimedActions/ISDetachTrailerFromVehicle"
-----------------------------------------------------------------------------------------------------------------------------------------------------------
local upperLayer = {}
upperLayer.ISDetachTrailerFromVehicle = {}
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISDetachTrailerFromVehicle.new = ISDetachTrailerFromVehicle.new
function ISDetachTrailerFromVehicle:new(character, vehicle, attachment)
    local o = upperLayer.ISDetachTrailerFromVehicle.new(self,character, vehicle, attachment)

    if not character:isTimedActionInstant() then o.maxTime = o.maxTime + 220; end
    return o
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
