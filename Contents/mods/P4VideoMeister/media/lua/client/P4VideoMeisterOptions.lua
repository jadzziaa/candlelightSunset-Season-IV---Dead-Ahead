require "P4VideoMeister"

local options = {
	showText = true,
	showIcon = true,
	showTooltip = true,
}

if ModOptions and ModOptions.getInstance then
	local settings = ModOptions:getInstance(options, "P4VideoMeister", "Video Meister")

	local optShowText = settings:getData("showText")
	optShowText.name = "UI_P4VideoMeister_Options_ShowText_Name"
	optShowText.tooltip = "UI_P4VideoMeister_Options_ShowText_Tooltip"

	local optShowIcon = settings:getData("showIcon")
	optShowIcon.name = "UI_P4VideoMeister_Options_ShowIcon_Name"
	optShowIcon.tooltip = "UI_P4VideoMeister_Options_ShowIcon_Tooltip"

	local optShowTooltip = settings:getData("showTooltip")
	optShowTooltip.name = "UI_P4VideoMeister_Options_ShowTooltip_Name"
	optShowTooltip.tooltip = "UI_P4VideoMeister_Options_ShowTooltip_Tooltip"

	SetModOptions(options)
end
