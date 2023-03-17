-- Silencer.modName = "Silencer";
-- Silencer.version = "1.0";
-- Silencer.author = "Nolan";
-- Unofficial fixed version made by 00912
-- Reworked by phobos2077

require "TimedActions/ISUpgradeWeapon"
require "TimedActions/ISRemoveWeaponUpgrade"


-- for singleplayer trading 
if (ItemValueTable == nil) then
	ItemValueTable = {}
end

ItemValueTable["ImprovisedSilencers.Silencer"] = 6.00
ItemValueTable["ImprovisedSilencers.SilencerPistol"] = 6.00
ItemValueTable["ImprovisedSilencers.MetalPipeSilencer"] = 4.00
ItemValueTable["ImprovisedSilencers.TorchSilencer"] = 2.00
ItemValueTable["ImprovisedSilencers.WaterBottleSilencer"] = 1.00

local silencerParams = require "ImprovisedSilencerParams"

-- hook function for silencer handling
local silencerOnEquipPrimary = function(character, inventoryItem)
	if inventoryItem ~= nil and inventoryItem:getStringItemType() == "RangedWeapon" then 
		local scriptItem = inventoryItem:getScriptItem()
		local scriptSoundVolume = scriptItem:getSoundVolume()
		local scriptSoundRadius = scriptItem:getSoundRadius()
		local canon = inventoryItem:getCanon()
		if canon and silencerParams[canon:getFullType()] then
			local params = silencerParams[canon:getFullType()]
			inventoryItem:setSoundVolume(params.volume * scriptSoundVolume)
			inventoryItem:setSoundRadius(params.radius * scriptSoundRadius)
			inventoryItem:setSwingSound(params.sound)
			print("Silencer attached. Vol="..params.volume..", Radius="..params.radius..", sound="..params.sound)
		elseif SUFVsilencerWeaponTable[scriptItem:getFullName()] ~= nil then
			inventoryItem:setSoundVolume(scriptSoundVolume)
			inventoryItem:setSoundRadius(scriptSoundRadius)
			inventoryItem:setSwingSound(scriptItem:getSwingSound())
			print("Silencer detached. Reset to defaults.")
		end
	end
end

local getDamageToSilencer = function(handWeapon)
	-- Shotguns do 4x damage
	if handWeapon:getAmmoType() == "Base.ShotgunShells" then
		return 4
	end
	
	-- Everything above .45 is 2x damage
	local avgDamage = (handWeapon:getMinDamage() + handWeapon:getMaxDamage()) / 2
	if avgDamage > 1.25 then
		return 2
	end
	return 1
end

local breakSilencerOnSwing = function(character, handWeapon)
	if handWeapon == nil or handWeapon:getStringItemType() ~= "RangedWeapon" then return end

	local canon = handWeapon:getCanon()
	if not canon or not silencerParams[canon:getFullType()] or silencerParams[canon:getFullType()].maxDamage <= 0 then return end

	local maxDamage = silencerParams[canon:getFullType()].maxDamage
	local totalDamage = canon:getModData().damage or handWeapon:getModData().canonDamage or 0
	totalDamage = totalDamage + getDamageToSilencer(handWeapon)
	if totalDamage >= maxDamage then
		--canon:setBroken(true)
		character:playSound("BreakMetalItem")
		handWeapon:detachWeaponPart(canon)
		handWeapon:getModData().canonDamage = nil
		character:resetEquippedHandsModels()
		silencerOnEquipPrimary(character, handWeapon)
	else
		canon:getModData().damage = totalDamage
		-- have to duplicate this value to the weapon, otherwise it won't be saved while silencer is installed
		handWeapon:getModData().canonDamage = totalDamage
		
		print("Silencer damage: "..totalDamage)
	end
end

Events.OnEquipPrimary.Add(silencerOnEquipPrimary)
Events.OnGameStart.Add(function()
	local player = getPlayer()
	silencerOnEquipPrimary(player, player:getPrimaryHandItem())
end)

Events.OnWeaponSwingHitPoint.Add(breakSilencerOnSwing)


-- Hooks for when weapon parts are added/removed
local originalUpgradeFn = ISUpgradeWeapon.perform

function ISUpgradeWeapon:perform()
	local result = originalUpgradeFn(self)
	if self.part:getPartType() == "Canon" then
		local partDmg = self.part:getModData().damage
		if partDmg then
			self.weapon:getModData().canonDamage = partDmg
			print("Copied silencer damage to weapon: "..partDmg)
		end
	end
	return result
end

local originalRemoveUpgradeFn = ISRemoveWeaponUpgrade.perform

function ISRemoveWeaponUpgrade:perform()
	local result = originalRemoveUpgradeFn(self)
	if self.part:getPartType() == "Canon" and self.weapon:hasModData() then
		self.weapon:getModData().canonDamage = nil
		print("Cleared silencer damage from weapon.")
	end
	return result
end