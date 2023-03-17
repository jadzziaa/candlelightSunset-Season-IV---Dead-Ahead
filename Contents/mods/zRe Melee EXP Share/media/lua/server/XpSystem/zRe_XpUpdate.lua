zReExpUpdate = {};

zReExpUpdate.onWeaponHitXp = function(owner, weapon, hitObject, damage)

	local exp = 1 * damage * 0.9;
	if exp > 3 then
		exp = 3;
	end

	local SmallBluntToBlunt = SandboxVars.zReEXPS.SmallBluntToBlunt * 0.01 * exp;
	local SmallBluntToSmallBlade = SandboxVars.zReEXPS.SmallBluntToSmallBlade * 0.01 * exp;
	local SmallBluntToLongBlade = SandboxVars.zReEXPS.SmallBluntToLongBlade * 0.01 * exp;
	local SmallBluntToAxe = SandboxVars.zReEXPS.SmallBluntToAxe * 0.01 * exp;
	local SmallBluntToSpear = SandboxVars.zReEXPS.SmallBluntToSpear * 0.01 * exp;
	
	local SmallBladeToLongBlade = SandboxVars.zReEXPS.SmallBladeToLongBlade * 0.01 * exp;
	local SmallBladeToSmallBlunt = SandboxVars.zReEXPS.SmallBladeToSmallBlunt * 0.01 * exp;
	local SmallBladeToBlunt = SandboxVars.zReEXPS.SmallBladeToBlunt * 0.01 * exp;
	local SmallBladeToAxe = SandboxVars.zReEXPS.SmallBladeToAxe * 0.01 * exp;
	local SmallBladeToSpear = SandboxVars.zReEXPS.SmallBladeToSpear * 0.01 * exp;
	
	local BluntToSmallBlunt = SandboxVars.zReEXPS.BluntToSmallBlunt * 0.01 * exp;
	local BluntToLongBlade = SandboxVars.zReEXPS.BluntToLongBlade * 0.01 * exp;
	local BluntToSmallBlade = SandboxVars.zReEXPS.BluntToSmallBlade * 0.01 * exp;
	local BluntToAxe = SandboxVars.zReEXPS.BluntToAxe * 0.01 * exp;
	local BluntToSpear = SandboxVars.zReEXPS.BluntToSpear * 0.01 * exp;
	
	local LongBladeToSmallBlade = SandboxVars.zReEXPS.LongBladeToSmallBlade * 0.01 * exp;
	local LongBladeToBlunt = SandboxVars.zReEXPS.LongBladeToBlunt * 0.01 * exp;
	local LongBladeToSmallBlunt = SandboxVars.zReEXPS.LongBladeToSmallBlunt * 0.01 * exp;
	local LongBladeToAxe = SandboxVars.zReEXPS.LongBladeToAxe * 0.01 * exp;
	local LongBladeToSpear = SandboxVars.zReEXPS.LongBladeToSpear * 0.01 * exp;
	
	local AxeToBlunt = SandboxVars.zReEXPS.AxeToBlunt * 0.01 * exp;
	local AxeToSmallBlunt = SandboxVars.zReEXPS.AxeToSmallBlunt * 0.01 * exp;
	local AxeToLongBlade = SandboxVars.zReEXPS.AxeToLongBlade * 0.01 * exp;
	local AxeToSmallBlade = SandboxVars.zReEXPS.AxeToSmallBlade * 0.01 * exp;
	local AxeToSpear = SandboxVars.zReEXPS.AxeToSpear * 0.01 * exp;
	
	local SpearToBlunt = SandboxVars.zReEXPS.SpearToBlunt * 0.01 * exp;
	local SpearToSmallBlunt = SandboxVars.zReEXPS.SpearToSmallBlunt * 0.01 * exp;
	local SpearToLongBlade = SandboxVars.zReEXPS.SpearToLongBlade * 0.01 * exp;
	local SpearToSmallBlade = SandboxVars.zReEXPS.SpearToSmallBlade * 0.01 * exp;
	local SpearToAxe = SandboxVars.zReEXPS.SpearToAxe * 0.01 * exp;
	
	
	if owner:getLastHitCount() > 0 and not weapon:isRanged() then
		if weapon:getScriptItem():getCategories():contains("SmallBlunt") then
			owner:getXp():AddXP(Perks.Blunt, SmallBluntToBlunt);
			owner:getXp():AddXP(Perks.SmallBlade, SmallBluntToSmallBlade);
			owner:getXp():AddXP(Perks.LongBlade, SmallBluntToLongBlade);
			owner:getXp():AddXP(Perks.Axe, SmallBluntToAxe);
			owner:getXp():AddXP(Perks.Spear, SmallBluntToSpear);
		end
		if weapon:getScriptItem():getCategories():contains("SmallBlade") then
			owner:getXp():AddXP(Perks.SmallBlunt, SmallBladeToSmallBlunt);
			owner:getXp():AddXP(Perks.Blunt, SmallBladeToBlunt);
			owner:getXp():AddXP(Perks.LongBlade, SmallBladeToLongBlade);
			owner:getXp():AddXP(Perks.Axe, SmallBladeToAxe);
			owner:getXp():AddXP(Perks.Spear, SmallBladeToSpear);
		end
		if weapon:getScriptItem():getCategories():contains("Blunt") then
			owner:getXp():AddXP(Perks.SmallBlunt, BluntToSmallBlunt);
			owner:getXp():AddXP(Perks.SmallBlade, BluntToSmallBlade);
			owner:getXp():AddXP(Perks.LongBlade, BluntToLongBlade);
			owner:getXp():AddXP(Perks.Axe, BluntToAxe);
			owner:getXp():AddXP(Perks.Spear, BluntToSpear);
		end
		if weapon:getScriptItem():getCategories():contains("LongBlade") then
			owner:getXp():AddXP(Perks.SmallBlunt, LongBladeToSmallBlunt);
			owner:getXp():AddXP(Perks.Blunt, LongBladeToBlunt);
			owner:getXp():AddXP(Perks.SmallBlade, LongBladeToSmallBlade);
			owner:getXp():AddXP(Perks.Axe, LongBladeToAxe);
			owner:getXp():AddXP(Perks.Spear, LongBladeToSpear);
		end
		
		if weapon:getScriptItem():getCategories():contains("Axe") then
			owner:getXp():AddXP(Perks.SmallBlunt, AxeToSmallBlunt);
			owner:getXp():AddXP(Perks.Blunt, AxeToBlunt);
			owner:getXp():AddXP(Perks.SmallBlade, AxeToSmallBlade);
			owner:getXp():AddXP(Perks.LongBlade, AxeToLongBlade);
			owner:getXp():AddXP(Perks.Spear, AxeToSpear);
		end
		if weapon:getScriptItem():getCategories():contains("Spear") then
			owner:getXp():AddXP(Perks.SmallBlunt, SpearToSmallBlunt);
			owner:getXp():AddXP(Perks.Blunt, SpearToBlunt);
			owner:getXp():AddXP(Perks.SmallBlade, SpearToSmallBlade);
			owner:getXp():AddXP(Perks.LongBlade, SpearToLongBlade);
			owner:getXp():AddXP(Perks.Axe, SpearToAxe);
		end	
	end
end


Events.OnWeaponHitXp.Add(zReExpUpdate.onWeaponHitXp);