require "P4TidyUpMeister"

local options = {
	forceReequip = false,
	useContextMenu = true,
	enableBuild = true,
	enableFirearms = true,
	enableFitness = true,
	enableEatFood = true,
	enableTakePills = true,
	enableReading = true,
	enableMedical = true,
	enableTailoring = true,
}

if ModOptions and ModOptions.getInstance then
	local settings = ModOptions:getInstance(options, "P4TidyUpMeister", "Tidy Up Meister")

	local optForceReequip = settings:getData("forceReequip")
	optForceReequip.name = "UI_P4TidyUpMeister_Options_ForceReequip_Name"
	optForceReequip.tooltip = "UI_P4TidyUpMeister_Options_ForceReequip_Tooltip"

	local optUseContextMenu = settings:getData("useContextMenu")
	optUseContextMenu.name = "UI_P4TidyUpMeister_Options_UseContextMenu_Name"
	optUseContextMenu.tooltip = "UI_P4TidyUpMeister_Options_UseContextMenu_Tooltip"

	local optEnableBuild = settings:getData("enableBuild")
	optEnableBuild.name = "UI_P4TidyUpMeister_Options_EnableBuild_Name"
	optEnableBuild.tooltip = "UI_P4TidyUpMeister_Options_EnableBuild_Tooltip"

	local optEnableFirearms = settings:getData("enableFirearms")
	optEnableFirearms.name = "UI_P4TidyUpMeister_Options_EnableFirearms_Name"
	optEnableFirearms.tooltip = "UI_P4TidyUpMeister_Options_EnableFirearms_Tooltip"

	local optEnableFitness = settings:getData("enableFitness")
	optEnableFitness.name = "UI_P4TidyUpMeister_Options_EnableFitness_Name"
	optEnableFitness.tooltip = "UI_P4TidyUpMeister_Options_EnableFitness_Tooltip"

	local optEnableEatFood = settings:getData("enableEatFood")
	optEnableEatFood.name = "UI_P4TidyUpMeister_Options_EnableEatFood_Name"
	optEnableEatFood.tooltip = "UI_P4TidyUpMeister_Options_EnableEatFood_Tooltip"

	local optEnableTakePills = settings:getData("enableTakePills")
	optEnableTakePills.name = "UI_P4TidyUpMeister_Options_EnableTakePills_Name"
	optEnableTakePills.tooltip = "UI_P4TidyUpMeister_Options_EnableTakePills_Tooltip"

	local optEnableReading = settings:getData("enableReading")
	optEnableReading.name = "UI_P4TidyUpMeister_Options_EnableReading_Name"
	optEnableReading.tooltip = "UI_P4TidyUpMeister_Options_EnableReading_Tooltip"

	local optEnableMedical = settings:getData("enableMedical")
	optEnableMedical.name = "UI_P4TidyUpMeister_Options_EnableMedical_Name"
	optEnableMedical.tooltip = "UI_P4TidyUpMeister_Options_EnableMedical_Tooltip"

	local optEnableTailoring = settings:getData("enableTailoring")
	optEnableTailoring.name = "UI_P4TidyUpMeister_Options_EnableTailoring_Name"
	optEnableTailoring.tooltip = "UI_P4TidyUpMeister_Options_EnableTailoring_Tooltip"

	SetModOptions(options)
end
