
require "TimedActions/ISBaseTimedAction"
WeaponModifiersManager = WeaponModifiersManager or {}

ISReforgeAction = ISBaseTimedAction:derive("ISReforgeAction")



function ISReforgeAction:isValid()
	local characterInventory = self.character:getInventory()
	local tinkeringItemType = self.tinkeringItem:getType()
	local tinkerCost = SandboxVars.WeaponModifiers.TinkerCost
	if TinkerItemQuantityNecessary[tinkeringItemType] then
		tinkerCost = TinkerItemQuantityNecessary[tinkeringItemType]*tinkerCost
	end
	return characterInventory:contains(self.tinkeredItem)
		and (not self.tinkeringItem:IsDrainable() and characterInventory:getItemCount(tinkeringItemType) >= tinkerCost
		or self.tinkeringItem:IsDrainable() and self.tinkeringItem:getDrainableUsesInt() >= tinkerCost)
		and instanceof(self.tinkeredItem, "HandWeapon")
		and (self.character:isRecipeKnown("Tinker") or ( self.character:getPerkLevel(Perks.Tinkering) > 2 and self.character:getPerkLevel(Perks.Maintenance) > 2))
end

function ISReforgeAction:start()
	local characterInventory = self.character:getInventory()
	local tinkeringItemType = self.tinkeringItem:getType()
	local tinkerCost = SandboxVars.WeaponModifiers.TinkerCost
	if TinkerItemQuantityNecessary[tinkeringItemType] then
		tinkerCost = TinkerItemQuantityNecessary[tinkeringItemType]*tinkerCost
	end
	if not (characterInventory:contains(self.tinkeredItem)
		and (not self.tinkeringItem:IsDrainable() and characterInventory:getItemCount(tinkeringItemType) >= tinkerCost
		or self.tinkeringItem:IsDrainable() and self.tinkeringItem:getDrainableUsesInt() >= tinkerCost)
		and instanceof(self.tinkeredItem, "HandWeapon")
		and self.character:isRecipeKnown("Tinker") or ( self.character:getPerkLevel(Perks.Tinkering) > 2 and self.character:getPerkLevel(Perks.Maintenance) > 2)) then

		return
	end



    self:setActionAnim(CharacterActionAnims.Craft);
end



function ISReforgeAction:stop()
	ISBaseTimedAction.stop(self)
end

-- print(getPlayer():getPrimaryHandItem():getModData().modifier.modifierName)
function ISReforgeAction:perform()
    local rarityTweaker = WeaponModifiersManager.getRarityTweakerForPlayer(self.character, self.tinkeredItem)
    local newModifier;

	if self.tinkeredItem:isRanged() then
        newModifier = WeaponModifiersManager.getRandomModifier(self.tinkeredItem, Modifiers.Ranged, rarityTweaker)
    else
        newModifier = WeaponModifiersManager.getRandomModifier(self.tinkeredItem, Modifiers.Melee, rarityTweaker)
    end
	
	local xpAwarded = WeaponModifiersManager.awardTinkeringXP(self.character, newModifier, 1)
    self.tinkeredItem:getModData().modifier = newModifier
	local tinkeringItemType = self.tinkeringItem:getType()
	local tinkerCost = SandboxVars.WeaponModifiers.TinkerCost


	local chanceToNotConsumeItem = self.character:getPerkLevel(Perks.Tinkering) * 3 -- +3% chance not to consume item per Tinkering Level
	if self.character:HasTrait("Tinkerer") then
		chanceToNotConsumeItem = chanceToNotConsumeItem + 20 -- +20% chance not to consume item with the trait
	end

	if (ZombRand(1000) > chanceToNotConsumeItem*10) then
		if self.tinkeringItem:IsDrainable() then
			if TinkerItemQuantityNecessary[tinkeringItemType] then
				for i = 0, TinkerItemQuantityNecessary[tinkeringItemType]*tinkerCost-1 do
					self.tinkeringItem:Use()
				end
			else
				for i = 0, tinkerCost-1 do
					self.tinkeringItem:Use()
				end
			end
		else
			self.character:removeFromHands(self.tinkeringItem)
			if TinkerItemQuantityNecessary[tinkeringItemType] then
				for i = 0, TinkerItemQuantityNecessary[tinkeringItemType]*tinkerCost-1 do
					self.character:getInventory():RemoveOneOf(tinkeringItemType)
				end
			else
				for i = 0, tinkerCost-1 do
					self.character:getInventory():RemoveOneOf(tinkeringItemType)
				end
			end
		end
	end
    WeaponModifiersManager.applyModifierStatsToItem(self.tinkeredItem, self.tinkeredItem:getModData().modifier)
	if SandboxVars.WeaponModifiers.DynamicTinkerer then
		if not self.character:HasTrait("Tinkerer") then
			if RarityColors.epic and newModifier.fontColor == RarityColors.epic or RarityColors.insane and newModifier.fontColor == RarityColors.insane or RarityColors.legendary and newModifier.fontColor == RarityColors.legendary or RarityColors.rare and newModifier.fontColor == RarityColors.rare then
				if self.character:getModData().itemsTinkered then
					self.character:getModData().itemsTinkered = self.character:getModData().itemsTinkered + 1
				else
					self.character:getModData().itemsTinkered = 1
				end
			end

			if self.character:getPerkLevel(Perks.Tinkering) + self.character:getPerkLevel(Perks.Maintenance) >= 8 then
				if self.character:getModData().itemsTinkered >= 15 then
					self.character:getTraits():add("Tinkerer");
					self.character:getModData().itemsTinkered = nil
				end
			end
		end
	end
	
	if RarityColors.bad and newModifier.fontColor == RarityColors.bad or RarityColors.shitty and newModifier.fontColor == RarityColors.shitty then
		HaloTextHelper.addText(self.character, self.tinkeredItem:getName(), HaloTextHelper:getColorRed())
	elseif RarityColors.common and newModifier.fontColor == RarityColors.common or RarityColors.good and newModifier.fontColor == RarityColors.good then
		HaloTextHelper.addText(self.character, self.tinkeredItem:getName(), HaloTextHelper:getColorWhite())
	elseif RarityColors.rare and newModifier.fontColor == RarityColors.rare or RarityColors.legendary and newModifier.fontColor == RarityColors.legendary
		or RarityColors.insane and newModifier.fontColor == RarityColors.insane or RarityColors.epic and newModifier.fontColor == RarityColors.epic 
		or RarityColors.great and newModifier.fontColor == RarityColors.great
		then
		HaloTextHelper.addText(self.character, self.tinkeredItem:getName(), HaloTextHelper:getColorGreen())
	else
		HaloTextHelper.addText(self.character, self.tinkeredItem:getName(), HaloTextHelper:getColorWhite())
	end
	-- self.character:clearVariable("isReforging")
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function ISReforgeAction:new(character, tinkeredItem, tinkeringItem)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.tinkeredItem = tinkeredItem
	o.tinkeringItem = tinkeringItem
	o.stopOnWalk = true
	o.stopOnRun = true
	o.stopOnAim = false
	o.maxTime = math.floor(500 * WeaponModifiersManager.getRarityTweakerForPlayer(character, tinkeredItem))

	o.useProgressBar = true
	if o.character:isTimedActionInstant() then
		o.maxTime = 1;
	elseif o.character:HasTrait("Tinkerer") then
		o.maxTime = math.floor(o.maxTime/3);
	end
	return o
end