
local function kayse_changeWeapon(character, inventoryItem)
	local WL = character:getWeaponLevel()
	print("kayse_WL: "..WL)
	if (inventoryItem == nil or not instanceof(inventoryItem, "HandWeapon" )) then
		print("Inventory is nil or not handweapon")
	elseif (inventoryItem:isRanged())then
		print("Is ranged weapon, ignore.")
	else
		print("Weapon: "..inventoryItem:getDisplayName())
		local wcat =  tostring(inventoryItem:getCategories())
		print("WepCat: "..wcat)
		local chance = 0 --Out of 100.
		local potentialMulti = 3--If you get your chance, how many multi hits do you get?
		if (inventoryItem:getDisplayName() == "Bare Hands") then
			--BUG: This code seems to work, roll a die, and assign a setMaxHitCount to Bare Hands, but the Bare Hands "weapon" seems to ignore the stat and always allow multihit...
			print("Found Bare hands")
			if (character:HasTrait("Brawler")) then
				chance = 20
				print("Set chance to "..chance)
			end
		elseif (string.find(wcat, "Axe")) then
			--Do Axe stuff.
			print("Found an axe")
			local wepChance = {5, 7, 10, 15, 25, 27.5, 30, 35, 40, 43.5}--Axe
			if WL > 0 then chance = wepChance[WL] end
		elseif (string.find(wcat, "SmallBlunt")) then
			--Do stuff.
			potentialMulti = 2
			print("Found Short Blunt")
			local wepChance = {3.5, 5, 7, 10, 13.5, 15, 20, 20, 20, 25}--Short Blunt
			if WL > 0 then chance = wepChance[WL] end
		elseif (string.find(wcat, "Blunt")) then
			--Do stuff.
			print("Found Long Blunt")
			local wepChance = {5, 7, 10, 20, 30, 35, 40, 45, 50, 55}--Long Blunt
			if WL > 0 then chance = wepChance[WL] end
		elseif (string.find(wcat, "LongBlade")) then
			--Do stuff.
			print("Found Long Blade")
			local wepChance = {5, 7, 10, 15, 20, 23.5, 25, 30, 35, 55}--Long Blade
			if WL > 0 then chance = wepChance[WL] end
		else
			--print("WepCat: "..wcat)
			print("kayse_handWeapon: "..inventoryItem:getDisplayName())
			print("kayse_maxHitCount: "..inventoryItem:getMaxHitCount())
			local mhc = inventoryItem:getMaxHitCount()
			local new_mhc = 1
			inventoryItem:setMaxHitCount(new_mhc)
			return
		end
		if (inventoryItem:getDisplayName() == "BONK") then--Added silly BONK weapon easter egg. Feel free to remove if unwanted.
			print("Found BONK")
			chance = 100
			print("Set chance to "..chance)
			potentialMulti = 5
		end

		print("WL: "..WL.. " chance is: "..chance)

		local SL = character:getPerkLevel(Perks.Strength)
		local chanceMod = 0
		local strChance = {-20, -15, -10, -5, 0, 5, 15, 25, 33, 45}
		if SL > 0 then chanceMod = strChance[SL] else chanceMod = -25 end
		print("SL: "..SL.." canceMod is: "..chanceMod)

		if chance > 0 then
			local dice = (ZombRand(999)+1)/10--Low dice roll is better.
			print("Dice roll was "..dice.." you were looking for "..chance.." plus "..chanceMod.." or lower, for a potential multi of "..potentialMulti)
			if dice <= (chance + chanceMod) then
				inventoryItem:setMaxHitCount(potentialMulti)
				print("You have a multihit ready for "..potentialMulti.." hits.")
			else
				inventoryItem:setMaxHitCount(1)--You didn't get a multihit, sorry.
			end
		else
			inventoryItem:setMaxHitCount(1)--You got no chance to multihit, sorry.
		end
	end
end

local function kayse_OnWeaponHitXp (player, weapon, _, damage)

	local min_fn = math.min;
	local original_exp = 0.0;
	local xp = 0.0;
	if weapon:getCategories():contains("SmallBlade") then--Quick Nimble tie in to SmallBlades
		xp = min_fn(damage * 0.9, 3) * .5--Gives 50% of weapon XP to Nimble as well.
		player:getXp():AddXP(Perks.Nimble, xp);
		print("Gave Nimble "..xp.." xp.")
	end
	--print("org xp: " ..original_exp.. " - bonus exp: " ..xp.. " ratio: " ..tostring((xp + original_exp)/original_exp))
end

Events.OnPlayerAttackFinished.Add(kayse_changeWeapon)

Events.OnEquipPrimary.Add(kayse_changeWeapon)
Events.OnWeaponHitXp.Add(kayse_OnWeaponHitXp)
