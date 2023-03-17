if getActivatedMods():contains("UndeadSuvivor") then
    BetterBatteries.removeRecipes["UndeadSurvivorTorchBatteryRemoval_OnCreate"] = true
    BetterBatteries.insertTests["UndeadSurvivorTorchBatteryInsert_TestIsValid "] = true
    BetterBatteries.removeTests["TorchBatteryRemoval_TestIsValid"] = true

    function UndeadSurvivorTorchBatteryRemoval_OnCreate(...)
        Recipe.OnCreate.BBItemBatteryRemoval(...)
    end

    function UndeadSurvivorTorchBatteryInsert_TestIsValid (...)
        return Recipe.OnTest.BBItemBatteryInsert(...)
    end

	function TorchBatteryRemoval_TestIsValid (...)
        return Recipe.OnTest.BBItemBatteryRemoval(...)
    end

	local origRecipe = TorchDismantle_OnCreate
    function TorchDismantle_OnCreate(...)
        Recipe.OnCreate.BBDismantleItem(...)
        origRecipe(...)
    end
end