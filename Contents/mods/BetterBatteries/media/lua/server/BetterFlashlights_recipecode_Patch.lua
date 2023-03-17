if getActivatedMods():contains("BetterFlashlights") then
    BetterBatteries.removeRecipes["Recipe.OnCreate.BF_TorchBatteryRemoval"] = true
    BetterBatteries.insertTests["Recipe.OnTest.BF_TorchBatteryInsert"] = true
    BetterBatteries.insertRecipes["Recipe.OnCreate.BF_TorchBatteryInsert"] = true
    
    function Recipe.OnCreate.BF_TorchBatteryRemoval(...)
        Recipe.OnCreate.BBItemBatteryRemoval(...)
    end

    function Recipe.OnTest.BF_TorchBatteryInsert(...)
        return Recipe.OnTest.BBItemBatteryInsert(...)
    end

    function Recipe.OnCreate.BF_TorchBatteryInsert(...)
        Recipe.OnCreate.BBItemBatteryInsert(...)
    end

    function Recipe.OnCreate.BF_DismantleFlashlight(...)
        Recipe.OnCreate.BBDismantleItem(...)
    end
end