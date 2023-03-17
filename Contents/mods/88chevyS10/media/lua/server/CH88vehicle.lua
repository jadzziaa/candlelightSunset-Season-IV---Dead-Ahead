--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************

KI5.Create = {};

CH88 = {
	parts = {
		WindshieldArmor = {
			CH88WindshieldArmor = {
				CH88winda = "80sPickupWindshieldArmor",
			},
		},
		WindowFrontLeftArmor = {
			CH88WindowFrontLeftArmor = {
				CH88leftwina = "80sPickupWindowFrontArmor",
			},
		},
		WindowFrontRightArmor = {
			CH88WindowFrontRightArmor = {
				CH88rightwina = "80sPickupWindowFrontArmor",
			},
		},

		FrontBumper = {
			CH88FrontBumper = {
				FrontBumper = "88ChevyS10BumperFront",
				FrontBullbar1 = "80sPickupBullbarFront",
				FrontBullbar2 = "88ChevyS10BullbarFront",
			},
			default = "first",
		},
		RearBumper = {
			CH88RearBumper = {
				RearBumper = "88ChevyS10BumperRear",
				RearBullbar = "80sPickupBullbarRear",
			},
			default = "first",
		},
		SpareTire = {
			CH88SpareTireRear = {
				spare1235468 = "80sOffroadTireA",
			},
			default = "trve_random",
			noPartChance = 70,
		},
	},
};

KI5:createVehicleConfig(CH88);

function CH88.ContainerAccess.Roofrack(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	return true
end

function KI5.Create.Blank(vehicle, part)
	part:setInventoryItem(nil)
end