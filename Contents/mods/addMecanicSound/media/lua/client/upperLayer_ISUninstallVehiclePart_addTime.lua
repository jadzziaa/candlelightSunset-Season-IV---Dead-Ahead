--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "Vehicles/TimedActions/ISUninstallVehiclePart"
-----------------------------------------------------------------------------------------------------------------------------------------------------------
local upperLayer = {}
upperLayer.ISUninstallVehiclePart = {}
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISUninstallVehiclePart.new = ISUninstallVehiclePart.new
function ISUninstallVehiclePart:new(character, part, time)
    local o = upperLayer.ISUninstallVehiclePart.new(self,character, part, time)
    local mecaSkill = character:getPerkLevel(Perks.Mechanics)
    local skillBonus = 100*mecaSkill
    local timeMalus = 1250 - skillBonus
    if not ISVehicleMechanics.cheat then o.maxTime = o.maxTime + timeMalus end
    return o
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
