AxeOverhaul = AxeOverhaul or {};

OnWeaponHitTree = function(owner, weapon)
	if weapon:getScriptItem():getCategories():contains("Axe") then
		owner:getXp():AddXP(Perks.Axe, 1);
	end
end

Events.OnWeaponHitTree.Add(OnWeaponHitTree);
