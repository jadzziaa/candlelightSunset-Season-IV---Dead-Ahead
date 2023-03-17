require "Vehicles/ISUI/ISVehicleMechanics";

local vanillaMechTooltipFn = ISVehicleMechanics["doMenuTooltip"];

ISVehicleMechanics["doMenuTooltip"] = function(self, part, option, lua, name)
	vanillaMechTooltipFn(self, part, option, lua, name);
	
	if lua == "uninstall" and part:getId() == "BR89BedCover"
	then
		option.toolTip.description = option.toolTip.description .. " <LINE> " .. " <ORANGE> Remove Rear Windows, Rear Windshield and Roofrack to be able to uninstall this part."
	end

	if lua == "install" and part:getId() == "BR89Barrier"
	then
		option.toolTip.description = option.toolTip.description .. " <LINE> " .. " <ORANGE> Remove Rear Seats to be able to install this part."
	end
end