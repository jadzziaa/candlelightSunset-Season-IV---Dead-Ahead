--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************

JP82 = {
	parts = {
		WindshieldArmor = {
			JP82WindshieldArmor = {
				JP82winda = "80sPickupWindshieldArmor",
			},
		},
		WindowFrontLeftArmor = {
			JP82WindowFrontLeftArmor = {
				JP82leftwina = "80sPickupWindowFrontArmor",
			},
		},
		WindowFrontRightArmor = {
			JP82WindowFrontRightArmor = {
				JP82rightwina = "80sPickupWindowFrontArmor",
			},
		},
		FrontBumper = {
			JP82FrontBumper = {
				FrontBumper = "82JeepJ10BumperFront",
				FrontBullbar1 = "80sPickupBullbarFront",
				FrontBullbar2 = "82JeepJ10BullbarFront",
			},
			default = "first",
		},
		FrontBumperD = {
			JP82FrontBumper = {
				FrontBullbar2 = "82JeepJ10BullbarFront",
				FrontBumper = "82JeepJ10BumperFront",
				FrontBullbar1 = "80sPickupBullbarFront",
			},
			default = "first",
		},
		RearBumper = {
			JP82RearBumper = {
				RearBumper = "82JeepJ10BumperRear",
				RearBullbar = "80sPickupBullbarRear",
			},
			default = "first",
		},
		RearBumperD = {
			JP82RearBumper = {
				RearBullbar = "80sPickupBullbarRear",
				RearBumper = "82JeepJ10BumperRear",
			},
			default = "first",
		},
		SpareTire = {
			JP82SpareTireRear = {
				spare658 = "80sOffroadTireA",
			},
			default = "trve_random",
			noPartChance = 70,
		},
	},
};

KI5:createVehicleConfig(JP82);

function JP82.ContainerAccess.Roofrack(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	return true
end