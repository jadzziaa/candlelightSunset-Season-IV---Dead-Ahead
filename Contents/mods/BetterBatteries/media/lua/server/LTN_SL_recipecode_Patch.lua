if getActivatedMods():contains("LTN_SL") then
    BetterBatteries.removeRecipes["Recipe.OnCreate.LanternBatteryRemoval"] = true
    BetterBatteries.insertTests["Recipe.OnTest.LanternBatteryInsert"] = true

    function Recipe.OnCreate.LanternBatteryRemoval(...)
        Recipe.OnCreate.BBItemBatteryRemoval(...)
    end

    function Recipe.OnTest.LanternBatteryInsert(...)
        return Recipe.OnTest.BBItemBatteryInsert(...)
    end

    local origRecipe = Recipe.OnCreate.DismantleLantern
    function Recipe.OnCreate.DismantleLantern(...)
        Recipe.OnCreate.BBDismantleItem(...)
        origRecipe(...)
    end
end