require "Items/SuburbsDistributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"

require "ABZombieLoot"
require "ABPretty"

local ROLL_RANGE = ABLoot_DIVISOR

local ABAddItem, ABrollDistributionsForEach, ABrollDistributionsForOne

-- return random number between 1 (inclusive) and <max> inclusive
-- to get a 0 based number, use ZombRand directly. Note that ZombRand does not return a number inclusive of its param
local function rand(max)
	return ZombRand(max) + 1
end

ABAddItem = function(inventory, itemDef, parentItem)
	if itemDef.recursionCount and itemDef.recursionCount > 2 then
		return nil
	end

	-- print("adding item" .. itemDef.item .. " to inventory")
	-- local item = inventory:AddItem(itemDef.item)
	local itemType = itemDef.item
	local item

	if itemType == "[LOOSE_BULLETS]" then
		-- spawn bullets for the parent type
		if parentItem ~= nil then
			-- print("ROLLING LOOSE BULLETS " .. parentItem:getAmmoType() .. " FOR " .. parentItem:getType())
			itemType = parentItem:getAmmoType()
		else
			-- if we got [LOOSE BULLETS] but no parent, we don't know what kind of bullets to spawn so exit
			return
		end
	end

	if itemType == "[GUN_MAG]" then
		if parentItem ~= nil then
			itemType = parentItem:getMagazineType()
		else
			-- dont know what kind of mag to spawn. exit
			return
		end
	end

	item = InventoryItemFactory.CreateItem(itemType)

	local isGunCase = itemDef.isGunCase or false

	if item then
		inventory:AddItem(item)
		item:setAutoAge()

		-- if items has a use delta, apply a random one
		-- if item["setUsedDelta"] ~= nil then
		if item:IsDrainable() then
			if ZombRand(100) > SandboxVars.AirbobbelzLoot.ChanceMaxDrainable then
				local minimumDrainable = SandboxVars.AirbobbelzLoot.MinimumDrainable
				local setDrainableTo = ZombRand(minimumDrainable, 101)
				item:setUsedDelta(setDrainableTo / 100)
			end
		end

		-- add ammo / magazines to guns
		if instanceof(item, "HandWeapon") then
			-- set item condition based on sandbox options
			if rand(100) > SandboxVars.AirbobbelzLoot.ChanceMaxCondition then
				local maximumCondition = item:getConditionMax()
				local minimumCondition = math.ceil(SandboxVars.AirbobbelzLoot.MinimumCondition / 100 * item:getConditionMax())
				if isGunCase then
					minimumCondition = math.max(minimumCondition, math.floor(maximumCondition / 2))
				end
				local setConditionTo = ZombRand(minimumCondition, item:getConditionMax() + 1)
				item:setCondition(setConditionTo)
				item:setHaveBeenRepaired(rand(3))
			end

			-- print("IS HAND WEAPON")
			if item:getMaxAmmo() > 0 then
				-- print("IS GUN")
				-- print(item:getMagazineType())
				-- print(item:getMaxAmmo())
				-- print(item:getType())
				-- print(item:getJamGunChance())
				-- print("=====")
				if item:getMagazineType() then
					-- sometimes weapon gets a mag already inserted
					if not isGunCase and ZombRand(100) < 30 then
						item:setContainsClip(true)
						-- sometimes that mag is loaded
						item:setCurrentAmmoCount(ZombRand(item:getMaxAmmo() + 1))
					end
					-- sometimes a round is chambered or gun is jammed
					-- if gun is in a gun case, it will be "safe" and not have anything loaded
					if not isGunCase then
						if ZombRand(100) < 30 then
							item:setRoundChambered(true)
						end
						-- sometimes weapon is jammed
						if ZombRand(100) < 30 then
							item:setJammed(true)
						end
					end
				else
					if not isGunCase then
						-- if we didn't have a mag type, it's a weapon that doesn't take a mag,
						-- like a revolver or shotgun. add random ammo.
						-- guns in gun case are "safe" and always unloaded
						item:setCurrentAmmoCount(ZombRand(item:getMaxAmmo() + 1))
					end
				end
			end
		elseif item:getMaxAmmo() > 0 then
			-- otherwise, if its a magazine, add ammo sometimes
			if isGunCase then
				-- for gun case items, either magazine has full ammo or nothing
				if ZombRand(100) < 50 then
					item:setCurrentAmmoCount(item:getMaxAmmo())
				end
			elseif ZombRand(100) < 50 then
				-- magazine has 50% chance for a random amount of ammo
				item:setCurrentAmmoCount(rand(item:getMaxAmmo()))
			end
		end

		-- if item is a container / bag
		if item["getInventory"] ~= nil then
			-- if skipDistributions is defined, container won't be auto-filled with default distributions
			if not itemDef.skipDistributions then
				local distribution = SuburbsDistributions[item:getType()]
				if distribution and distribution.items then
					local container = item:getInventory()
					for i, itype in ipairs(distribution.items) do
						if type(itype) == "string" then
							local chance = distribution.items[i + 1]
							if chance then
								local roll = rand(100)
								if roll <= (chance * (SandboxVars.AirbobbelzLoot.BagContentsMultiplier / 100)) then
									ABAddItem(
										container,
										{item = itype, isGunCase = isGunCase, recursionCount = (itemDef.recursionCount or 0) + 1},
										item
									)
								end
							end
						end
					end
				end
			end
		end

		-- if alsoRollEach is defined then we roll for each of those items to also add to the container
		if itemDef.alsoRollEach then
			ABrollDistributionsForEach(inventory, itemDef.alsoRollEach, item)
		end
		-- if alsoRollOne is defined then we roll for one of those items to add to this container
		if itemDef.alsoRollOne then
			for _, rollOneDistro in pairs(itemDef.alsoRollOne) do
				ABrollDistributionsForOne(inventory, rollOneDistro, item)
			end
		end
	else
		-- print('Invalid item: ' .. itemType)
	end
end

-- given a distribution table, roll for each item in the table and add them
-- to the provided inventory
-- parentItem is context dependent and passed in when the item being rolled is a sub-item of another,
-- using `alsoRollEach` or being rolled within a bag/container
ABrollDistributionsForEach = function(inventory, distro, parentItem)
	for x in pairs(distro) do
		local times = distro[x].times or 1
		-- if times > 1 then
		-- 	print(distro[x].item, times)
		-- end
		-- if parentItem then
		-- 	print(parentItem:getType())
		-- end
		-- if distro has a 'times' param, roll that many times
		for i = 1, times do
			local roll = rand(ROLL_RANGE)
			if roll <= distro[x].chance then
				ABAddItem(inventory, distro[x], parentItem)
			end
		end
	end
end

-- given a distribution table, roll for one random item in that table
-- and add it to the inventory if the secondary chance roll for that item also succeeds
-- parentItem is context dependent and passed in when the item being rolled is a sub-item of another,
-- using `alsoRollEach` or being rolled within a bag/container
ABrollDistributionsForOne = function(inventory, distro, parentItem)
	if #distro > 0 then
		local indexRoll = rand(#distro)
		local rolledItem = distro[indexRoll]
		local times = rolledItem.times or 1
		for i = 1, times do
			local roll = rand(ROLL_RANGE)
			if roll <= rolledItem.chance then
				ABAddItem(inventory, rolledItem, parentItem)
			end
		end
	end
end

-- function executed for each zombie death
local function ABOnZombieDead(zombie)
	local outfit = zombie:getOutfitName()
	local zombieInventory = zombie:getInventory()

	local lootTables = ABGetLootTables()

	-- iterate over the following item lists along with their multipliers
	local distros = {
		bullets = {list = lootTables.bullets},
		bulletsBoxes = {list = lootTables.bulletsBoxes},
		melee = {list = lootTables.melee},
		pistols = {list = lootTables.pistols},
		longGuns = {list = lootTables.longGuns},
		otherGuns = {list = lootTables.otherGuns},
		cannedFood = {list = lootTables.cannedFood},
		otherFood = {list = lootTables.otherFood},
		resources = {list = lootTables.resources},
		junk = {list = lootTables.junk},
		bags = {list = lootTables.bags},
		gunBags = {list = lootTables.gunBags},
		extras = {list = lootTables.extras}
	}

	if outfit and string.find(outfit, "Naked") then
		-- naked zombies don't get any items :P
		return
	end

	if outfit and lootTables.byOutfit[outfit] then
		local outfitTable = lootTables.byOutfit[outfit]

		-- if outfit distro includes any overrides for default distro tables, ie 'bullets' or 'junk', replace
		-- this distro with that of the outfit
		for distroKey, _ in pairs(distros) do
			if outfitTable[distroKey] then
				distros[distroKey].list = outfitTable[distroKey]
			end
		end

		-- append outfit distro to apply top level rollEach and rollOne as extra items every time
		distros.byOutfit = {
			list = lootTables.byOutfit[outfit]
		}
	end

	for distroName, distro in pairs(distros) do
		local list = distro.list
		if list.rollEach and #list.rollEach > 0 then
			ABrollDistributionsForEach(zombieInventory, list.rollEach)
		end
		if list.rollOne then
			for _, k in pairs(list.rollOne) do
				if #k > 0 then
					ABrollDistributionsForOne(zombieInventory, k)
				end
			end
		end
	end
end

Events.OnZombieDead.Add(ABOnZombieDead)
