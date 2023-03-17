local XpDefaultReward = 		1.5			-- Vanilla would be 1.0
local XpLowLevelMultiplier = 	2.7

local function IsGun(Item)
	return Item and Item:IsWeapon() and Item:isRanged()
end

-- Remove regular aim xp reward
Events.OnGameStart.Add(function()
	Events.OnWeaponHitXp.Remove(xpUpdate.onWeaponHitXp)

	local OldWeaponHitXP = xpUpdate.onWeaponHitXp
	xpUpdate.onWeaponHitXp = function(owner, weapon, hitObject, damage)
		if IsGun(Weapon) then return end
		OldWeaponHitXP(owner, weapon, hitObject, damage)
	end
	Events.OnWeaponHitXp.Add(xpUpdate.onWeaponHitXp)
end)

-- Custom aim reward, that rewards every shot,
-- that was aimed at an enemy, regardless of hit or miss

-- detection is a little spotty, some shots can be missed and not rewarded
-- but it should catch most
Events.OnWeaponSwing.Add(function(Character, Weapon)
	if not IsGun(Weapon) or Character:isDoShove() or not ISReloadWeaponAction.canShoot(Weapon) then
		return
	end

	local StandingTargets = ArrayList.new()
	local ProneTargets = ArrayList.new()

	SwipeStatePlayer.instance():calcValidTargets(Character, Weapon, true, ProneTargets, StandingTargets)

	if ProneTargets:size() + StandingTargets:size() == 0 then return end

	local xp = XpDefaultReward
	if Character:getPerkLevel(Perks.Aiming) < 5 then
		xp = xp * XpLowLevelMultiplier;
	end

	Character:getXp():AddXP(Perks.Aiming, xp);
end)