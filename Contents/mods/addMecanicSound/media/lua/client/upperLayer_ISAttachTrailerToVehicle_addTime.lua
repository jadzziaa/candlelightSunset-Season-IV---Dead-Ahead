--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "Vehicles/TimedActions/ISAttachTrailerToVehicle"
-----------------------------------------------------------------------------------------------------------------------------------------------------------
local upperLayer = {}
upperLayer.ISAttachTrailerToVehicle = {}
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISAttachTrailerToVehicle.new = ISAttachTrailerToVehicle.new
function ISAttachTrailerToVehicle:new(character, vehicleA, vehicleB, attachmentA, attachmentB)
    local o = upperLayer.ISAttachTrailerToVehicle.new(self,character, vehicleA, vehicleB, attachmentA, attachmentB)

    if not character:isTimedActionInstant() then o.maxTime = o.maxTime + 220; end
    return o
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
