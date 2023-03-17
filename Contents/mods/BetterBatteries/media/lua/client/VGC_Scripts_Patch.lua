if getActivatedMods():contains("Video_Game_Consoles") then
    BetterBatteries.insertRecipes["VGC_BatteryIn"] = true

	function VGC_BatteryIn(...)
		Recipe.OnCreate.BBItemBatteryInsert(...)
	end
end