if getActivatedMods():contains("MonmouthCounty_new") or getActivatedMods():contains("MonmouthCountyTributeLegacy") then
    print("Running MonmouthCounty patch..")
    BetterBatteries.removeRecipes["BZMTorchBatteryRemoval_OnCreate"] = true
    BetterBatteries.insertTests["BZMTorchBatteryInsert_TestIsValid"] = true

    function BZMTorchBatteryRemoval_OnCreate(...)
        Recipe.OnCreate.BBItemBatteryRemoval(...)
    end

    function BZMTorchBatteryInsert_TestIsValid(...)
        return Recipe.OnTest.BBItemBatteryInsert(...)
    end

    --[[local origRecipe = Recipe.OnCreate.DismantleLantern
    function Recipe.OnCreate.DismantleLantern(...)
        Recipe.OnCreate.BBDismantleItem(...)
        origRecipe(...)
    end]]
end