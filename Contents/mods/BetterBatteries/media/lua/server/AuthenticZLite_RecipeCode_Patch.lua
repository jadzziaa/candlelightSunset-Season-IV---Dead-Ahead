if getActivatedMods():contains("Authentic Z - Current") then
    BetterBatteries.removeRecipes["AuthenticTorchBatteryRemoval_OnCreate"] = true
    BetterBatteries.insertTests["AuthenticTorchBatteryInsert_TestIsValid"] = true

    function AuthenticTorchBatteryRemoval_OnCreate(...)
        Recipe.OnCreate.BBItemBatteryRemoval(...)
    end

    function AuthenticTorchBatteryInsert_TestIsValid(...)
        return Recipe.OnTest.BBItemBatteryInsert(...)
    end
end