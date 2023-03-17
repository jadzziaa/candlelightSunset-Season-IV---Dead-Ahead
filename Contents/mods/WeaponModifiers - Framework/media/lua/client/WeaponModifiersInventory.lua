
WeaponModifiersManager = WeaponModifiersManager or {}

function WeaponModifiersManager.getRarityTweakerForPlayer(_player, _item)
    local weaponLevel = 0
    if _item:isRanged() then
        weaponLevel = math.floor( (_player:getPerkLevel(Perks.Aiming)*2 +_player:getPerkLevel(Perks.Reloading)) / 3 + 0.5)
    else
        local category = _item:getCategories()
        if category:contains("Axe") then
            weaponLevel = _player:getPerkLevel(Perks.Axe)
        elseif category:contains("LongBlade") then
            weaponLevel = _player:getPerkLevel(Perks.LongBlade)
        elseif category:contains("SmallBlade") then
            weaponLevel = _player:getPerkLevel(Perks.SmallBlade)
        elseif  category:contains("SmallBlunt") then
            weaponLevel = _player:getPerkLevel(Perks.SmallBlunt)
        elseif category:contains("Blunt") then
            weaponLevel = _player:getPerkLevel(Perks.Blunt)
        elseif category:contains("Spear") then
            weaponLevel = _player:getPerkLevel(Perks.Spear)
        elseif category:contains("Improvised") then
            weaponLevel = 0
        else
            weaponLevel = 0
        end
    end
    local maintenanceLevel = _player:getPerkLevel(Perks.Maintenance)
    local rarityTweaker = 1 - weaponLevel*0.005 - maintenanceLevel*0.01
    if getActivatedMods():contains("WeaponModifiersReforge") then
        if _player:HasTrait("Tinkerer") then
            rarityTweaker = rarityTweaker - 0.07
        end
        local tinkeringLevel = _player:getPerkLevel(Perks.Tinkering)
        rarityTweaker = rarityTweaker - tinkeringLevel*0.03
    end
    if _player:HasTrait("Lucky") then
        rarityTweaker = rarityTweaker - 0.03
    elseif _player:HasTrait("Unlucky") then
        rarityTweaker = rarityTweaker + 0.03
    end
    if _player:HasTrait("Clumsy") then
        rarityTweaker = rarityTweaker + 0.01
    end
    if _player:HasTrait("AllThumbs") then
        rarityTweaker = rarityTweaker + 0.01
    end
    if _player:HasTrait("Handy") then
        rarityTweaker = rarityTweaker - 0.02
    end
    if _player:HasTrait("Mechanics") or _player:HasTrait("Mechanics2") then
        rarityTweaker = rarityTweaker - 0.02
    end
    return rarityTweaker or 1
end



local function checkPlayerInventoryForWeaponModifiers()
    local player = getPlayer() or getSpecificPlayer(0)
    if player then 
        local inventory = player:getInventory()
        if not inventory  then  return; end
        local containerItems = inventory:getItems()
        local rarityTweaker = 1
        if containerItems then
            for i = 0, containerItems:size()-1 do
                local newModifier = nil
                local item = containerItems:get(i);
                if item and instanceof(item, "HandWeapon") then
                    rarityTweaker = WeaponModifiersManager.getRarityTweakerForPlayer(player, item)
                    if item:isRanged() then
                        newModifier = WeaponModifiersManager.checkItem(item, player, rarityTweaker+0.1, SandboxVars.WeaponModifiers.ChanceMultiplierForCraftedRangedWeapons)
                    else
                        newModifier = WeaponModifiersManager.checkItem(item, player, rarityTweaker+0.1, SandboxVars.WeaponModifiers.ChanceMultiplierForCraftedMeleeWeapons)
                    end
                else
                    newModifier = WeaponModifiersManager.checkItem(item, player, 1, 1)
                end
                
                if getActivatedMods():contains("WeaponModifiersReforge") then
                    if newModifier and newModifier.modifierName ~= getText("Tooltip_modifier_standard") then
                        WeaponModifiersManager.awardTinkeringXP(player, newModifier, 0.25)
                    end
                end
            end
        end
    end
end

Events.EveryOneMinute.Add(checkPlayerInventoryForWeaponModifiers)
-- Events.OnPlayerUpdate.Add(checkPlayerInventoryForWeaponModifiers)

