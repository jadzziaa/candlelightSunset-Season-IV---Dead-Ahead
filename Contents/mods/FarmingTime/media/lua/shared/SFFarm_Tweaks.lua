local manager = ScriptManager.instance

function SFCook_Tweaks()

-- Changes to icons
manager:getItem("Base.FarmingMag1"):DoParam("Icon".." = ".."SFFarmMag1");

end

Events.OnGameBoot.Add(SFCook_Tweaks)