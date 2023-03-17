require "Vehicles/ISUI/ISVehicleMechanics";

local vanillaMechTooltipFn = ISVehicleMechanics["doMenuTooltip"];

ISVehicleMechanics["doMenuTooltip"] = function(self, part, option, lua, name)
	vanillaMechTooltipFn(self, part, option, lua, name);
	
	if lua == "uninstall" and part:getId() == "JP82BedCover"
	then
		option.toolTip.description = option.toolTip.description .. " <LINE> " .. " <ORANGE> Remove Bed Cover Lid and Roofrack to be able to uninstall this part."
	end
end