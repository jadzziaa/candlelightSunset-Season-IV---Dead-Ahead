-- These are the default options.
PillDuration_OPTIONS = { 
  showBorders = true,
  showBetaBlockerValue = true,
  showPainkillerValue = true,
  showAntiDepressantsValue = true,
  showSleepingTabletsValue = true,
  showAntibioticsValue = true,
}

  -- Connecting the options to the menu, so user can change and save them.
  if ModOptions and ModOptions.getInstance then
    local settings = ModOptions:getInstance(PillDuration_OPTIONS, "PillDuration", "Pill Duration");

    ModOptions:loadFile();

    local optB = settings:getData("showBorders");
    local opt1 = settings:getData("showBetaBlockerValue");
    local opt2 = settings:getData("showPainkillerValue");
    local opt3 = settings:getData("showAntiDepressantsValue");
    local opt4 = settings:getData("showSleepingTabletsValue");
    local opt5 = settings:getData("showAntibioticsValue");

    function optB:OnApplyInGame(val)
      setShowBorders(val);
    end
    function opt1:OnApplyInGame(val)
      changePBsValue(1, val);
    end
    function opt2:OnApplyInGame(val)
      changePBsValue(2, val);
    end
    function opt3:OnApplyInGame(val)
      changePBsValue(3, val);
    end
    function opt4:OnApplyInGame(val)
      changePBsValue(4, val);
    end
    function opt5:OnApplyInGame(val)
      changePBsValue(5, val);
    end
  end

return PillDuration_OPTIONS;