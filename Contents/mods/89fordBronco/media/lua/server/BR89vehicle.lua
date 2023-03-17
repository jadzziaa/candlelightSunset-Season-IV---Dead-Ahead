--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************

KI5.Create = {};

BR89 = {
	parts = {
		WindshieldArmor = {
			BR89WindshieldArmor = {
				BR89winda = "80sPickupWindshieldArmor",
			},
		},
		WindowFrontLeftArmor = {
			BR89WindowFrontLeftArmor = {
				BR89leftwina = "80sPickupWindowFrontArmor",
			},
		},
		WindowFrontRightArmor = {
			BR89WindowFrontRightArmor = {
				BR89rightwina = "80sPickupWindowFrontArmor",
			},
		},
		WindowRearLeftArmor = {
			BR89WindowRearLeftArmor = {
				BR89leftrearwina = "80sPickupWindowRearArmor",
			},
		},
		WindowRearRightArmor = {
			BR89WindowRearRightArmor = {
				BR89rightrearwina = "80sPickupWindowRearArmor",
			},
		},
		FrontBumper = {
			BR89FrontBumper = {
				FrontBumper = "89BroncoBumperFront",
				FrontBullbar1 = "80sPickupBullbarFront",
				FrontBullbar2 = "89BroncoBullbarFront",
			},
			default = "first",
		},
		RearBumper = {
			BR89RearBumper = {
				RearBumper = "89BroncoBumperRear",
				RearBullbar = "80sPickupBullbarRear",
			},
			default = "first",
		},
		SpareTire = {
			BR89SpareTireRear = {
				spare12468 = "80sOffroadTireA",
			},
			default = "trve_random",
			noPartChance = 70,
		},

	},
};

KI5:createVehicleConfig(BR89);


function BR89.ContainerAccess.Trunk(vehicle, part, chr)
	if chr:getVehicle() == vehicle then
		local seat = vehicle:getSeat(chr)
		return seat == 3 or seat == 2 or seat == 1 or seat == 0;
	elseif chr:getVehicle() then
		return false
	else
		if not vehicle:isInArea(part:getArea(), chr) then return false end
		local doorPart = vehicle:getPartById("TrunkDoor")
		if doorPart and doorPart:getDoor() and not doorPart:getDoor():isOpen() then
			return false
		end
		return true
	end
end

function BR89.ContainerAccess.Roofrack(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	return true
end

function KI5.Create.Blank(vehicle, part)
	part:setInventoryItem(nil)
end