require "Farming/SFarmingSystem"
local originalGrowPlant = SFarmingSystem.growPlant;
function SFarmingSystem:growPlant(luaObject, ...)
	-- Only allow the grow funcion when the plant is not in the seeding phase (7)
	if luaObject.state == "seeded" and luaObject.nbOfGrow ~= 7 then
		return originalGrowPlant(self, luaObject, ...);
	end
end
