--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "Vehicles/TimedActions/ISTakeEngineParts"
-----------------------------------------------------------------------------------------------------------------------------------------------------------
local upperLayer = {}
upperLayer.ISTakeEngineParts = {}
-----------------------------------------------------------------------------------------------------------------------------------------------------------
upperLayer.ISTakeEngineParts.new = ISTakeEngineParts.new
function ISTakeEngineParts:new(character, part, item, time)
    local o = upperLayer.ISTakeEngineParts.new(self,character, part, item, time)
    local mecaSkill = character:getPerkLevel(Perks.Mechanics)
    local skillBonus = 100*mecaSkill
    local timeMalus = 2000 - skillBonus
    if not ISVehicleMechanics.cheat then o.maxTime = o.maxTime + timeMalus end
    return o
end
