--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "Vehicles/TimedActions/ISRepairEngine"
-----------------------------------------------------------------------------------------------------------------------------------------------------------
local upperLayer = {}
upperLayer.ISRepairEngine = {}
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISRepairEngine.new = ISRepairEngine.new
function ISRepairEngine:new(character, part, item, time)
    local o = upperLayer.ISRepairEngine.new(self,character, part, item, time)
    local mecaSkill = character:getPerkLevel(Perks.Mechanics)
    local skillBonus = 100*mecaSkill
    local timeMalus = 2000 - skillBonus
    if not ISVehicleMechanics.cheat then o.maxTime = o.maxTime + timeMalus end
    return o
end
