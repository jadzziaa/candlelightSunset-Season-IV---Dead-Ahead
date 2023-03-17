require "P4AddictedToWeight"

local options = {
	showHumanIcon = true,
	weightChangeNotification = false,
}

if ModOptions and ModOptions.getInstance then
	local settings = ModOptions:getInstance(options, "P4AddictedToWeight", "Addicted To Weight")

	local optShowHumanIcon = settings:getData("showHumanIcon");
	optShowHumanIcon.name = "UI_P4AddictedToWeight_Options_ShowHumanIcon_Name";
	optShowHumanIcon.tooltip = "UI_P4AddictedToWeight_Options_ShowHumanIcon_Tooltip";

	local optWeightChangeNotification = settings:getData("weightChangeNotification");
	optWeightChangeNotification.name = "UI_P4AddictedToWeight_Options_WeightChangeNotification_Name";
	optWeightChangeNotification.tooltip = "UI_P4AddictedToWeight_Options_WeightChangeNotification_Tooltip";

	SetModOptions(options)

	function settings:OnApplyInGame()
		ReflectModOptions()
	end
end
