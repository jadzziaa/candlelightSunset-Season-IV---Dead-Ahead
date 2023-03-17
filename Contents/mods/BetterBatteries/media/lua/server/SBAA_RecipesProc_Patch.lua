if getActivatedMods():contains("LTN_SL") then
    BetterBatteries.removeTests["SBAA_CanDrain"] = true
    BetterBatteries.removeRecipes["SBAA_BatteryDrain"] = true
    BetterBatteries.insertRecipes["SBAA_BatteryInsert"] = true

    function SBAA_CanDrain(...)
        return Recipe.OnTest.BBItemBatteryRemoval(...)
    end

    function SBAA_BatteryDrain(...)
        Recipe.OnCreate.BBItemBatteryRemoval(...)
    end

    function SBAA_BatteryInsert(...)
        Recipe.OnCreate.BBItemBatteryInsert(...)
    end

    --[[local origRecipe = Recipe.OnCreate.DismantleLantern
    function Recipe.OnCreate.DismantleLantern(...)
        Recipe.OnCreate.BBDismantleItem(...)
        origRecipe(...)
    end]]
end