require "Items/WeaponModifiersManager"

WeaponModifiersManager = WeaponModifiersManager or {}
WeaponModifiersManager.rarityChances = WeaponModifiersManager.rarityChances or {}
    ----------------------------------------------------------------------------------------------
    ----------------- CHANCES MUST ADD UP TO 100 ! -----------------------------------------------
    -- ORDER MUST BE FROM MOST VALUABLE RARITY TO SHITTIEST RARITY, SO THE RARITY TWEAKER WORKS --
    ----------------------------------------------------------------------------------------------



WeaponModifiersManager.rarityChances = {
    rare = 6,
    good = 47,
    bad = 47
}

AcceptableCategories = {
    ["Axe"] = 1,
    ["Blunt"] = 1,
    ["SmallBlunt"] = 1,
    ["LongBlade"] = 1,
    ["SmallBlade"] = 1,
    ["Spear"] = 1,
}

-- TODO MORE TESTS

WeaponModifiersManager.getRandomModifier = function (_item, _modifierList, rarityTweaker)
    if _item:isRanged() then return DefaultModifier end
    local chance = ZombRand(10000)
    local itemCategory = nil
    local testItemCategory  = nil
    local itemCategories = _item:getCategories()
    for i = 0, itemCategories:size()-1 do
        testItemCategory = itemCategories:get(i)
        if AcceptableCategories[testItemCategory] then 
            itemCategory = testItemCategory
        end
    end
    if not itemCategory or not _modifierList[itemCategory] then return DefaultModifier end
    chance = chance * WeaponModifiersManager.CurrentRarityTweaker * rarityTweaker
    local rarityChances = WeaponModifiersManager.rarityChances
    local rarityChanceCumulated = 0
    
    for rarity, rarityChance in pairs(rarityChances) do
        rarityChanceCumulated = rarityChanceCumulated + rarityChance
        if chance < rarityChanceCumulated*100 then
            return _modifierList[itemCategory][rarity][ZombRand(1 , #_modifierList[itemCategory][rarity])]
        end
    end
    if _modifierList.shitty then
        return _modifierList.shitty[ZombRand(1 , #_modifierList.shitty)]
    end
    if _modifierList.bad then
        return _modifierList.bad[ZombRand(1 , #_modifierList.bad)]
    end
    return DefaultModifier
end

