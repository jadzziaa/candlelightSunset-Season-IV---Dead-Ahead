WeaponModifiersManager = WeaponModifiersManager or {}


WeaponModifiersManager.testMode = false

-- TODO better modifier chances for special "zones".
-- TODO Tinkering Workshop item. (craftable at level 6 Maintenance & level 3 Metalworking)
-- TODO modifiers on cooking pans, overwriting the recipe

DefaultModifier = {
        modifierName = getText("Tooltip_modifier_standard"),
        statsMultipliers = {
            damage = 1,
            speed = 1,
            ["critical chance"] = 0,
            ["minimum range"] = 1,
            ["maximum range"] = 1,
            knockback = 1,
            ["endurance cost"] = 1, 
            ["durability"] = 1,
            weight = 1, -- custom weight doesn't work
            accuracy = 1,
            ["sound radius"] = 1,
            recoil = 1,
            ["reload time"] = 1,
            ["aim time"] = 1,
            experience = 1
        },
        fontColor = {1, 1, 1},
}
WeaponModifiersManager.rarityChances = {
    ----------------------------------------------------------------------------------------------
    ----------------- CHANCES MUST ADD UP TO 100 ! -----------------------------------------------
    -- ORDER MUST BE FROM MOST VALUABLE RARITY TO SHITTIEST RARITY, SO THE RARITY TWEAKER WORKS --
    ----------------------------------------------------------------------------------------------
    legendary = 1, -- percent (%)
    insane = 2,
    epic = 4,
    great = 8,
    good = 16,
    common = 40,
    bad = 25,
    shitty = 4,
}

WeaponModifiersManager.IrrelevantWeapons = {
    ["Base.Pen"] = 1,
    ["Base.RedPen"] = 1,
    ["Base.BluePen"] = 1,
    ["Base.Pencil"] = 1,
    ["Base.Spoon"] = 1,
    ["Base.Fork"] = 1,
    ["Base.SmashedBottle"] = 1,
    ["Base.Plank"] = 1,
    ["Base.MetalBar"] = 1,
    ["Base.MetalPipe"] = 1,
    ["Base.FishingRod"] = 1,
    ["Base.FishingRodBreak"] = 1,
    ["Base.CraftedFishingRod"] = 1,
    ["Base.Pan"] = 1,
    ["Base.Saucepan"] = 1,
    ["Base.GridlePan"] = 1,

    -- explosives failsafe
    ["Base.Molotov"] = 1,
    ["Base.Aerosolbomb"] = 1,
    ["Base.AerosolbombTriggered"] = 1,
    ["Base.AerosolbombSensorV1"] = 1,
    ["Base.AerosolbombSensorV2"] = 1,
    ["Base.AerosolbombSensorV3"] = 1,
    ["Base.AerosolbombRemote"] = 1,
    ["Base.FlameTrap"] = 1,
    ["Base.FlameTrapTriggered"] = 1,
    ["Base.FlameTrapSensorV1"] = 1,
    ["Base.FlameTrapSensorV2"] = 1,
    ["Base.FlameTrapSensorV3"] = 1,
    ["Base.FlameTrapRemote"] = 1,
    ["Base.SmokeBomb"] = 1,
    ["Base.SmokeBombTriggered"] = 1,
    ["Base.SmokeBombSensorV1"] = 1,
    ["Base.SmokeBombSensorV2"] = 1,
    ["Base.SmokeBombSensorV3"] = 1,
    ["Base.SmokeBombRemote"] = 1,
    ["Base.NoiseTrap"] = 1,
    ["Base.NoiseTrapTriggered"] = 1,
    ["Base.NoiseTrapSensorV1"] = 1,
    ["Base.NoiseTrapSensorV2"] = 1,
    ["Base.NoiseTrapSensorV3"] = 1,
    ["Base.NoiseTrapRemote"] = 1,
    ["Base.Grenade"] = 1,

}

-- stats that stay changed even after quitting and reloading : damage, max range 

-- stats that need to be updated when reloading game : min range, attack speed, crit chance, knockback/knockdown, durability, endurance.

WeaponModifiersManager.CurrentModifierChance = 10
WeaponModifiersManager.CurrentRarityTweaker = 1

function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- function WeaponModifiersManager.getRandomModifierRealistic(_item, _modifierList , rarityTweaker)
--     if _item:isRanged() then return DefaultModifier end
--     local chance = ZombRand(10000)
--     local itemCategory = nil
--     local testItemCategory  = nil
--     local itemCategories = _item:getCategories()
--     for i = 0, itemCategories:size()-1 do
--         testItemCategory = itemCategories:get(i)
--         if AcceptableCategories[testItemCategory] then 
--             itemCategory = testItemCategory
--         end
--     end
--     if not itemCategory or not _modifierList[itemCategory] then return DefaultModifier end
--     chance = chance * WeaponModifiersManager.CurrentRarityTweaker * rarityTweaker
--     local rarityChances = WeaponModifiersManager.rarityChances
--     local rarityChanceCumulated = 0
    
--     for rarity, rarityChance in pairs(rarityChances) do
--         rarityChanceCumulated = rarityChanceCumulated + rarityChance
--         if chance < rarityChanceCumulated*100 then
--             return _modifierList[itemCategory][rarity][ZombRand(1 , #_modifierList[itemCategory][rarity])]
--         end
--     end
--     return DefaultModifier
-- end

function WeaponModifiersManager.getRandomModifier(_item, modifierList , rarityTweaker)
    -- if getActivatedMods():contains("WeaponModifiersRealistic") then
    --     return WeaponModifiersManager.getRandomModifierRealistic(_item, modifierList , rarityTweaker)
    -- else
        local chance = ZombRand(10000)
        chance = chance * WeaponModifiersManager.CurrentRarityTweaker * rarityTweaker
        local rarityChances = WeaponModifiersManager.rarityChances
        local rarityChanceCumulated = 0
        for rarity, rarityChance in pairs(rarityChances) do
            rarityChanceCumulated = rarityChanceCumulated + rarityChance
            if chance < rarityChanceCumulated*100 then
                if WeaponModifiersManager.testMode then print(round(chance, 2).." < "..rarityChanceCumulated.. " : Applying [ ".. rarity .." ] modifier.") end
                return modifierList[rarity][ZombRand(1 , #modifierList[rarity])]
            end
        end
        if modifierList.shitty then
            return modifierList.shitty[ZombRand(1 , #modifierList.shitty)]
        end
        if modifierList.bad then
            return modifierList.bad[ZombRand(1 , #modifierList.bad)]
        end
        return DefaultModifier
    -- end
end

function WeaponModifiersManager.customSplit(_inputstring, _separator) -- this is used to split a string into a table of sub strings
    if _separator == nil then
        _separator = "%s"
    end
    local t={}
    for str in string.gmatch(_inputstring, "([^".._separator.."]+)") do
       table.insert(t, str)
    end
    return t
end

-- debug stuff
-- function DumpModifier()
--     local player = getPlayer()
--     local item = player:getPrimaryHandItem()
--     local modData = item:getModData()
--     local modifier = modData.modifier
--     -- print("modifier = ".. modifier)
--     print("modifierName = ".. modifier.modifierName)
--     print("itemName = ".. item:getName())
--     print("scriptItemName = ".. item:getScriptItem():getDisplayName())
--     print(modifier.translationChecked)
--     print(modifier.modifierChecked)
-- end

-- function DumpCustomSplit()
--     local tableSplit = WeaponModifiersManager.customSplit(getPlayer():getPrimaryHandItem():getModData().modifier.modifierName, " ")
--     print("tableSplit")
--     for k, v in pairs(tableSplit) do
--         print("k = "..k.." , v = "..v)
--     end
-- end

function WeaponModifiersManager.applyModifierStatsToItem(item, modifier)
    if not modifier or not item then 
        return false; end
    if not modifier.statsMultipliers then return false; end
    local multipliers = modifier.statsMultipliers
    if not multipliers then return end
    -- local scriptItem = item:getScriptItem()
    if WeaponModifiersManager.testMode then print("Applying [ ".. modifier.modifierName .." ] modifier stats.") end


    if not item:getModData().scriptStats then
        -- store vanilla stats in ModData before modifying them.
        -- print("saving scriptStats")
        item:getModData().scriptStats = {
            ScriptName = item:getDisplayName() or "",
            MinDamage = item:getMinDamage() or nil,
            MaxDamage = item:getMaxDamage() or nil,
            TreeDamage = item:getTreeDamage() or nil,
            DoorDamage = item:getDoorDamage() or nil,
            PushBackMod = item:getPushBackMod() or nil,
            KnockdownMod = item:getKnockdownMod() or nil,
            MaxRange = item:getMaxRange() or nil,
            MinRange = item:getMinRange() or nil,
            BaseSpeed = item:getBaseSpeed() or nil,
            EnduranceMod = item:getEnduranceMod() or nil,
            CriticalChance = item:getCriticalChance() or nil,
            ConditionLowerChance = item:getConditionLowerChance() or nil,
            HitChance = item:getHitChance() or nil,
            SoundRadius = item:getSoundRadius() or nil,
            SoundVolume = item:getSoundVolume() or nil,
            SoundGain = item:getSoundGain() or nil,
            RecoilDelay = item:getRecoilDelay() or nil,
            AimingTime = item:getAimingTime() or nil,
            ReloadTime = item:getReloadTime() or nil,
            AimingPerkRangeModifier = item:getAimingPerkRangeModifier() or nil,
            AimingPerkCritModifier = item:getAimingPerkCritModifier() or nil,
            AimingPerkHitChanceModifier= item:getAimingPerkHitChanceModifier() or nil,
        }
        
    end


    local scriptStats = item:getModData().scriptStats or {}
    -- item:getModData().modifier = modifier
    if not modifier.translationChecked and string.match(modifier.modifierName, "IGUI_modifier_name_") then
        
        local namesTranslated = WeaponModifiersManager.customSplit(modifier.modifierName, " ")
        if namesTranslated[1] and namesTranslated[2] then
            item:getModData().modifier.modifierName = getText(namesTranslated[1]).." "..getText(namesTranslated[2])
        else
            if namesTranslated[1] then
                item:getModData().modifier.modifierName = getText(namesTranslated[1])
            end
        end
        
        if scriptStats and scriptStats.ScriptName then
            
            if scriptStats.ScriptName ~= item:getScriptItem():getDisplayName() then
                item:getModData().scriptStats.ScriptName = item:getScriptItem():getDisplayName()
            end
            item:setName(scriptStats.ScriptName.." ["..item:getModData().modifier.modifierName.."]")
        else
            if scriptStats.ScriptName ~= item:getScriptItem():getDisplayName() then
                item:getModData().scriptStats.ScriptName = item:getScriptItem():getDisplayName()
            end
            item:setName(item:getScriptItem():getDisplayName().." ["..item:getModData().modifier.modifierName.."]")
        end

        if not string.match(item:getModData().modifier.modifierName, "IGUI_modifier_name_") then
            item:getModData().modifier.translationChecked = true
        end
        
    elseif scriptStats and scriptStats.ScriptName and item:getName() ~= scriptStats.ScriptName.." ["..modifier.modifierName.."]" then
        
        if scriptStats.ScriptName ~= item:getScriptItem():getDisplayName() then
            item:getModData().scriptStats.ScriptName = item:getScriptItem():getDisplayName()
        end
        item:setName(scriptStats.ScriptName.." ["..modifier.modifierName.."]")
    else
        if scriptStats.ScriptName ~= item:getScriptItem():getDisplayName() then
            item:getModData().scriptStats.ScriptName = item:getScriptItem():getDisplayName()
        end
        item:setName(item:getScriptItem():getDisplayName().." ["..modifier.modifierName.."]")
    end


    item:setCustomName(true)
    -- on vérifie si le damage de l'item actual es différent du damage de l'item Script x le modifier.
    local dmgMult = multipliers.damage or 1

    local hitChanceOfWeaponParts = 0
    local aimingTimeOfWeaponParts = 0
    local reloadTimeOfWeaponParts = 0
    local recoilDelayOfWeaponParts = 0
    local minRangeOfWeaponParts = 0
    local maxRangeOfWeaponParts = 0
    local damageOfWeaponParts = 0
    if item:isRanged() then
        
        local weaponParts = {
            item:getCanon(),
            item:getClip(),
            item:getRecoilpad(),
            item:getScope(),
            item:getSling(),
            item:getStock(),
        }
        for k, weaponPart in pairs(weaponParts) do
            if weaponPart then
                hitChanceOfWeaponParts = hitChanceOfWeaponParts + weaponPart:getHitChance()
                aimingTimeOfWeaponParts = aimingTimeOfWeaponParts + weaponPart:getAimingTime()
                reloadTimeOfWeaponParts = reloadTimeOfWeaponParts + weaponPart:getReloadTime()
                recoilDelayOfWeaponParts = recoilDelayOfWeaponParts + weaponPart:getRecoilDelay()
                minRangeOfWeaponParts = minRangeOfWeaponParts + weaponPart:getMinRangeRanged()
                maxRangeOfWeaponParts = maxRangeOfWeaponParts + weaponPart:getMaxRange()
                damageOfWeaponParts = damageOfWeaponParts + weaponPart:getDamage()
            end
        end
    end

    -- min damage
    if round(scriptStats.MinDamage*dmgMult, 2) ~= item:getMinDamage() then
        item:setMinDamage(round(scriptStats.MinDamage*dmgMult, 2) + damageOfWeaponParts);
    end
    -- max damage
    if round(scriptStats.MaxDamage*dmgMult, 2) ~= item:getMaxDamage() then
        item:setMaxDamage(round(scriptStats.MaxDamage*dmgMult, 2) + damageOfWeaponParts);
        -- tree & door damage
        if not item:isRanged() then
            item:setTreeDamage(round(scriptStats.TreeDamage*dmgMult, 2) + damageOfWeaponParts);
            item:setDoorDamage(round(scriptStats.DoorDamage*dmgMult, 2) + damageOfWeaponParts);
        end
    end

    local knockbackMult = multipliers.knockback or 1
    -- pushback and knockdown
    if round(scriptStats.PushBackMod*knockbackMult, 2) ~= item:getPushBackMod() then
        item:setPushBackMod(round(scriptStats.PushBackMod*knockbackMult, 2));
    end
    if round(scriptStats.KnockdownMod*knockbackMult, 2) ~= item:getKnockdownMod() then
        item:setKnockdownMod(round(scriptStats.KnockdownMod*knockbackMult, 2));
    end
    
    
    local maximumMult = multipliers["maximum range"] or 1
    if round(scriptStats.MaxRange*maximumMult, 2) ~= item:getMaxRange() then
        item:setMaxRange(round(scriptStats.MaxRange*maximumMult, 2) + maxRangeOfWeaponParts);
        if item:isRanged() then
            item:setAimingPerkRangeModifier(round(scriptStats.AimingPerkRangeModifier*maximumMult, 2));
        end
    end
    
    local minimumMult = multipliers["minimum range"] or 1
    if item:isRanged() and scriptStats.MinRangeRanged then
        if round(scriptStats.MinRangeRanged*minimumMult, 2) ~= item:getMinRangeRanged() then
            item:setMinRangeRanged(round(scriptStats.MinRangeRanged*minimumMult, 2) + minRangeOfWeaponParts);
        end
        if item:getMinRangeRanged()>item:getMaxRange() then
            item:setMinRangeRanged(item:getMaxRange())
        end
    else
        if round(scriptStats.MinRange*minimumMult, 2) ~= item:getMinRange() then
            item:setMinRange(round(scriptStats.MinRange*minimumMult, 2));
        end
        if item:getMinRange()>item:getMaxRange() then
            item:setMinRange(item:getMaxRange())
        end
    end
    
    local attackspeedMult = multipliers["attack speed"] or multipliers["speed"] or 1
    -- print("scriptStats.BaseSpeed : "..scriptStats.BaseSpeed)
    -- print("attackspeedMult : "..attackspeedMult)
    -- print("item:getBaseSpeed() : "..item:getBaseSpeed())
    -- print("round(scriptStats.BaseSpeed*attackspeedMult, 2) : "..round(scriptStats.BaseSpeed*attackspeedMult, 2))
    if round(scriptStats.BaseSpeed*attackspeedMult, 2) ~= item:getBaseSpeed() then
        item:setBaseSpeed(round(scriptStats.BaseSpeed*attackspeedMult, 2));
    end
    
    -- local speedMult = multipliers["speed"] or 1
    -- if round(scriptStats.BaseSpeed*speedMult, 2) ~= item:getBaseSpeed() then
    --     item:setBaseSpeed(round(scriptStats.BaseSpeed*speedMult, 2));
    -- end
    
    local enduranceMult = multipliers["endurance cost"] or 1
    if round(scriptStats.EnduranceMod*enduranceMult, 2) ~= item:getEnduranceMod() then
        item:setEnduranceMod(round(scriptStats.EnduranceMod*enduranceMult, 2));
    end
    
    local criticalAdd = multipliers["critical chance"] or 0
    if math.floor(scriptStats.CriticalChance + criticalAdd + 0.5) ~= item:getCriticalChance() then
        if scriptStats.CriticalChance + criticalAdd > 0 then
            item:setCriticalChance(math.floor(scriptStats.CriticalChance + criticalAdd + 0.5));
        else
            item:setCriticalChance(0)
        end
    end

    
    local durabilityMult = multipliers["durability"] or 1

    if math.floor(scriptStats.ConditionLowerChance*durabilityMult+0.6) ~= item:getConditionLowerChance() then
        item:setConditionLowerChance(math.floor(scriptStats.ConditionLowerChance*durabilityMult+0.6));
    end
    -- if multipliers.weight and multipliers.weight ~= 1 then
    --     item:setActualWeight(round(item:getActualWeight()*multipliers.weight, 2))
    --     item:setWeight(round(item:getActualWeight()*multipliers.weight, 2))
    --     item:setCustomWeight(true)
    -- end

    -- ranged
    if item:isRanged() then
        
        local accuracyMult = multipliers.accuracy or 1
        if math.floor(scriptStats.HitChance*accuracyMult + 0.5) ~= item:getHitChance() then
            item:setHitChance(math.floor(scriptStats.HitChance*accuracyMult + hitChanceOfWeaponParts + 0.5));
            -- item:setAimingPerkHitChanceModifier(round(scriptStats.AimingPerkHitChanceModifier*accuracyMult, 2))
        end
        
        local soundMult = multipliers["sound radius"] or 1
        if multipliers["sound radius"] and multipliers["sound radius"] ~= 1 then
            if math.floor(scriptStats.SoundRadius*soundMult + 0.5) ~= item:getSoundRadius() then
                item:setSoundRadius(math.floor(scriptStats.SoundRadius*soundMult + 0.5));
                item:setSoundVolume(math.floor(scriptStats.SoundVolume*soundMult+0.5))
                item:setSoundGain(round(scriptStats.SoundGain*soundMult, 2))
            end
        end
        
        local recoilMult = multipliers.recoil or 1
        if math.floor(scriptStats.RecoilDelay*recoilMult + 0.5) ~= item:getRecoilDelay() then
            item:setRecoilDelay(math.floor(scriptStats.RecoilDelay*recoilMult + recoilDelayOfWeaponParts + 0.5));
        end
        
        local aimMult = multipliers["aim time"] or 1
        if math.floor(scriptStats.AimingTime*aimMult + 0.5) ~= item:getAimingTime() then
            item:setAimingTime(math.floor(scriptStats.AimingTime*aimMult + aimingTimeOfWeaponParts + 0.5));
        end

        
        local reloadMult = multipliers["reload time"] or 1
        if math.floor(scriptStats.ReloadTime*reloadMult + 0.5) ~= item:getReloadTime() then
            item:setReloadTime(math.floor(scriptStats.ReloadTime*reloadMult + reloadTimeOfWeaponParts + 0.5));
        end

    else


    end
    
    -- bags
    -- if multipliers["capacity"] and multipliers["capacity"] ~= 1 then
    --     item:setItemCapacity(math.floor(item:getItemCapacity() + multipliers["capacity"]))
    -- end
    -- if multipliers["weight reduction"] and multipliers["weight reduction"] ~= 1 then
    --     item:setWeightReduction(math.min(item:getWeightReduction() + multipliers["weight reduction"], 99))
    -- end
    item:setCustomName(true)
    return true
end



function WeaponModifiersManager.changeWeaponModifiersFromContainer(_container, _containerObj)
    if not _container  then return; end
    
    local containerItems = _container:getItems()
    if containerItems then
        for i = 0, containerItems:size()-1 do
            local item = containerItems:get(i);
            WeaponModifiersManager.checkItem(item, _containerObj, 1, 1)
        end
    end
end

function WeaponModifiersManager.checkWeaponModifiersFromAllPossibleContainers(_containerObj)
    
    -- _containerObj:transmitModData();
    if _containerObj:getContainerCount() and _containerObj:getContainerCount() > 1 then
        for containerindex = 0, _containerObj:getContainerCount() do
            WeaponModifiersManager.changeWeaponModifiersFromContainer(_containerObj:getContainerByIndex(containerindex), _containerObj);
        end
    else
        if _containerObj:getItemContainer() then
            WeaponModifiersManager.changeWeaponModifiersFromContainer(_containerObj:getItemContainer(), _containerObj)
        else
            WeaponModifiersManager.changeWeaponModifiersFromContainer(_containerObj:getContainer(), _containerObj)
        end
    end
end

function WeaponModifiersManager.checkAllInventories(_iSInventoryPage)
    
    local containerObj;
    for i, v in ipairs(_iSInventoryPage.backpacks) do
        -- iso objects
		if v.inventory:getParent() then
			containerObj = v.inventory:getParent();
			if  instanceof(containerObj, "IsoObject")
                and (containerObj:getContainer() or containerObj:getItemContainer())
                then
                WeaponModifiersManager.checkWeaponModifiersFromAllPossibleContainers(containerObj)
            end
        end
        -- Vehicle parts: gloveboxes, trunks, seats, etc.
        if v.inventory:getVehiclePart() then
            containerObj = v.inventory:getVehiclePart();
            if  instanceof(containerObj, "VehiclePart")
                and containerObj:getItemContainer()
                then
                WeaponModifiersManager.changeWeaponModifiersFromContainer(containerObj:getItemContainer(), containerObj)
            end
        end

    end
end

local function checkWeaponModifiersOnRefreshEnd(_iSInventoryPage, _state)
    
    if _state == "end" then
        WeaponModifiersManager.checkAllInventories(_iSInventoryPage);
    end
end

local function checkWeaponModifiersOnFill(roomtype, containertype, container)
    
    if container:isExplored() or container:isHasBeenLooted() then
        return;
    end
    WeaponModifiersManager.changeWeaponModifiersFromContainer(container, container:getParent())
end

function WeaponModifiersManager:getModifierChance()
    local WMSandboxSettings = SandboxVars.WeaponModifiers
    local startDay = WMSandboxSettings.StartDay or 2
    local peakDay = WMSandboxSettings.PeakDay or 60
    local originalChance = WMSandboxSettings.OriginalModifierChance or 50
    local maxChance = WMSandboxSettings.MaxModifierChance or 50
    local modifierChance;
    local worldAgeDays = math.floor(GameTime:getInstance():getWorldAgeHours()/24 + 0.5) or 1;
    if worldAgeDays < startDay then
        modifierChance = originalChance;
    elseif worldAgeDays >= peakDay then
        modifierChance = maxChance;
    else
        modifierChance = math.floor(originalChance + (maxChance-originalChance) * (worldAgeDays - startDay) / (peakDay - startDay) + 0.5)
    end
    return modifierChance
end

function WeaponModifiersManager:getRarityTweaker()
    local WMSandboxSettings = SandboxVars.WeaponModifiers
    local startDay = WMSandboxSettings.StartDay or 2
    local peakDay = WMSandboxSettings.PeakDay or 60
    local originalTweaker = WMSandboxSettings.StartRarityTweaker or 1
    local maxTweaker = WMSandboxSettings.MaxRarityTweaker or 1
    local rarityTweaker;
    local worldAgeDays = math.floor(GameTime:getInstance():getWorldAgeHours()/24 + 0.5) or 1;
    if worldAgeDays < startDay then
        rarityTweaker = originalTweaker;
    elseif worldAgeDays >= peakDay then
        rarityTweaker = maxTweaker;
    else
        rarityTweaker = math.floor(originalTweaker + (maxTweaker-originalTweaker) * (worldAgeDays - startDay) / (peakDay - startDay) + 0.5)
    end
    return rarityTweaker
end

function WeaponModifiersManager.updateModifierChance(...)
    WeaponModifiersManager.CurrentModifierChance = WeaponModifiersManager:getModifierChance()
    WeaponModifiersManager.CurrentRarityTweaker = WeaponModifiersManager:getRarityTweaker()
end

function WeaponModifiersManager.checkItem(_item, _containerObj, playerRarityTweaker, _modifierChanceTweaker)
    local modifier = nil
    if _item then
        if instanceof(_item, "InventoryContainer") then
            if _item:getInventory() then
                WeaponModifiersManager.changeWeaponModifiersFromContainer(_item:getInventory(), nil)
            end
            if _item:getItemContainer() then
                WeaponModifiersManager.changeWeaponModifiersFromContainer(_item:getItemContainer(), nil)
            end
        elseif instanceof(_item, "HandWeapon") and _item:getSwingAnim() ~= "Throw" then
            if not _item:getModData().modifierChecked then
                local WeaponModifierSandboxSettings = SandboxVars.WeaponModifiers
                if not WeaponModifierSandboxSettings.IgnoreIrrelevantWeapons or not WeaponModifiersManager.IrrelevantWeapons[_item:getScriptItem():getFullName()] then

                    local modifierChanceForThisItem = WeaponModifiersManager.CurrentModifierChance * _modifierChanceTweaker
                    if modifierChanceForThisItem ~= 0 then
                        if _containerObj and instanceof(_containerObj, "IsoDeadBody") and _containerObj:getAttachedItems():contains(_item) and WeaponModifierSandboxSettings.AttachedWeaponsChanceMultiplier ~= 0 then
                            modifierChanceForThisItem = modifierChanceForThisItem * WeaponModifierSandboxSettings.AttachedWeaponsChanceMultiplier
                        end

                        if _item:isRanged() then
                            if WeaponModifierSandboxSettings.RangedWeaponsChanceMultiplier then
                                modifierChanceForThisItem = modifierChanceForThisItem * WeaponModifierSandboxSettings.RangedWeaponsChanceMultiplier
                                if ZombRand(10000) < modifierChanceForThisItem*100 then
                                    modifier = WeaponModifiersManager.getRandomModifier(_item, Modifiers.Ranged, playerRarityTweaker)
                                end
                            end
                        else
                            if ZombRand(10000) < modifierChanceForThisItem*100 then
                                modifier = WeaponModifiersManager.getRandomModifier(_item, Modifiers.Melee, playerRarityTweaker)
                            end
                        end
                    end
                    
                end
                -- COMMENTED CODE BELOW IS FOR TESTING PURPOSES
                        -- if modifier and modifier.statsMultipliers then
                        --         modifier.statsMultipliers = {
                        --             damage = 2,
                        --             ["attack speed"] = 2,
                        --             ["critical chance"] = 2,
                        --             ["minimum range"] = 0.5,
                        --             ["maximum range"] = 2,
                        --             knockback = 2,
                        --             ["endurance cost"] = 0.5, 
                        --             ["durability"] = 2,
                        --             weight = 2, -- custom weight doesn't work
                        --             accuracy = 2,
                        --             ["sound radius"] = 2,
                        --             recoil = 2,
                        --             ["reload time"] = 2,
                        --             ["aim time"] = 2,
                        --             experience = 2
                        --         }
                        -- end
                if modifier and modifier.modifierName ~= getText("Tooltip_modifier_standard") then
                    _item:getModData().modifier = modifier
                    WeaponModifiersManager.applyModifierStatsToItem(_item, modifier)
                    -- _item:getModData().modifier = modifier
                end
                _item:getModData().modifierChecked = true
                return modifier
            else
                local modifier = _item:getModData().modifier
                if modifier and modifier.modifierName ~= getText("Tooltip_modifier_standard") then
                    WeaponModifiersManager.applyModifierStatsToItem(_item, modifier)
                end
                return nil
            end
        end
    end
end
--WeaponModifiersManager.applyModifierStatsToItem(getPlayer():getPrimaryHandItem(), getPlayer():getPrimaryHandItem():getModData().modifier)


function WeaponModifiersManager.checkSquareFloorForWeaponModifiers(_square)
    if not _square then return; end

    local worldObjects = _square:getWorldObjects()
    if worldObjects:size() == 0 then return; end
    for i = 0, worldObjects:size()-1 do
        local object = worldObjects:get(i);
        if object and instanceof(object, "IsoWorldInventoryObject") then
            -- print(getPlayer():getSquare():getWorldObjects():get(0):getItem())
            local item = object:getItem()
            if WeaponModifiersManager.testMode then print("Item detected: "..item:getName()) end
            WeaponModifiersManager.checkItem(item, nil, 1, 1)
        end
    end
end

Events.LoadGridsquare.Add(WeaponModifiersManager.checkSquareFloorForWeaponModifiers)
Events.ReuseGridsquare.Add(WeaponModifiersManager.checkSquareFloorForWeaponModifiers)
Events.OnRefreshInventoryWindowContainers.Add(checkWeaponModifiersOnRefreshEnd);
Events.OnFillContainer.Add(checkWeaponModifiersOnFill);


Events.OnGameStart.Add(WeaponModifiersManager.updateModifierChance);
Events.OnServerStarted.Add(WeaponModifiersManager.updateModifierChance);
Events.EveryDays.Add(WeaponModifiersManager.updateModifierChance);
Events.OnDusk.Add(WeaponModifiersManager.updateModifierChance);
Events.OnDawn.Add(WeaponModifiersManager.updateModifierChance);
Events.OnPostDistributionMerge.Add(WeaponModifiersManager.updateModifierChance);



return WeaponModifiersManager