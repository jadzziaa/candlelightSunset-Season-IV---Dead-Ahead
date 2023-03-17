--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************

PWR = {
	parts = {
		WindshieldArmor = {
			PWRWindshieldArmor = {
				PWRwinda = "49powerWagonWindshieldArmor",
			},
		},
		FrontLeftArmor = {
			PWRFrontLeftArmor = {
				PWRfla = "49powerWagonFrontDoorArmor",
			},
		},
		FrontRightArmor = {
			PWRFrontRightArmor = {
				PWRfra = "49powerWagonFrontDoorArmor",
			},
		},
		RearLeftArmor = {
			PWRRearLeftArmor = {
				PWRrla = "49powerWagonRearDoorArmor",
			},
		},
		RearRightArmor = {
			PWRRearRightArmor = {
				PWRrra = "49powerWagonRearDoorArmor",
			},
		},
		FenderFrontLeft = {
			FenderFrontLeft = {
				fenderFL = "49powerWagonFrontFender",
				fenderapocFL = "49powerWagonFrontFenderMakeshift",
			},
			default = "first",
		},
		FenderFrontRight = {
			FenderFrontRight = {
				fenderFR = "49powerWagonFrontFender",
				fenderapocFR = "49powerWagonFrontFenderMakeshift",
			},
			default = "first",
		},
		FenderRearLeft = {
			FenderRearLeft = {
				fenderRL = "49powerWagonRearFender",
				fenderapocRL = "49powerWagonRearFenderMakeshift",
			},
			default = "first",
		},
		FenderRearRight = {
			FenderRearRight = {
				fenderRR = "49powerWagonRearFender",
				fenderapocRR = "49powerWagonRearFenderMakeshift",
			},
			default = "first",
		},
		WindshieldRearArmor = {
			PWRWindshieldRearArmor = {
				PWRwindra = "49powerWagonWindshieldRearArmor",
			},
		},
		FrontBumper = {
			PWRFrontBumper = {
				FrontBumper0 = "49powerWagonBumper0",
				FrontBullbar1 = "49powerWagonBullbar1",
				FrontBullbar2 = "49powerWagonBullbar2",
			},
			default = "first",
		},
		FrontBumperPA = {
			PWRFrontBumper = {
				FrontBullbar2 = "49powerWagonBullbar2",
				FrontBumper0 = "49powerWagonBumper0",
				FrontBullbar1 = "49powerWagonBullbar1",
			},
			default = "first",
		},
		FrontBumperPD = {
			PWRFrontBumper = {
				FrontBullbar1 = "49powerWagonBullbar1",
				FrontBullbar2 = "49powerWagonBullbar2",
				FrontBumper0 = "49powerWagonBumper0",
			},
			default = "first",
		},
		Sideskirts = {
			PWRSideskirts = {
				skirts0 = "49powerWagonSideskirts0",
				skirts1 = "49powerWagonSideskirts1",
			},
			default = "first",
		},
		SideskirtsPA = {
			PWRSideskirts = {
				skirts1 = "49powerWagonSideskirts1",
				skirts0 = "49powerWagonSideskirts0",
			},
			default = "first",
		},
		FenderFrontLeftPA = {
			FenderFrontLeft = {
				fenderapocFL = "49powerWagonFrontFenderMakeshift",
				fenderFL = "49powerWagonFrontFender",
			},
			default = "first",
		},
		FenderFrontRightPA = {
			FenderFrontRight = {
				fenderapocFR = "49powerWagonFrontFenderMakeshift",
				fenderFR = "49powerWagonFrontFender",
			},
			default = "first",
		},
		FenderRearLeftPA = {
			FenderRearLeft = {
				fenderapocRL = "49powerWagonRearFenderMakeshift",
				fenderRL = "49powerWagonRearFender",
			},
			default = "first",
		},
		FenderRearRightPA = {
			FenderRearRight = {
				fenderapocRR = "49powerWagonRearFenderMakeshift",
				fenderRR = "49powerWagonRearFender",
			},
			default = "first",
		},
		SpareTire = {
			PWRSpare = {
				PWRspare0 = "49powerWagonTire",
			},
			default = "trve_random",
			noPartChance = 15,
		},
		SpareTirePA = {
			PWRSpare = {
				PWRspare1 = "49powerWagonApocalypseTire",
			},
			default = "trve_random",
			noPartChance = 15,
		},

	},
};

KI5:createVehicleConfig(PWR);

KI5:addForcedSpawn("Base.49powerWagonPA", 8283, 12242, {
    direction = IsoDirections.W, 
    chance = 85,
    sandboxVar = "AllowPowerChadSpawns",
});

KI5:addForcedSpawn("Base.49powerWagonPA", 8503, 8555, {
    direction = IsoDirections.W, 
    chance = 90,
    sandboxVar = "AllowPowerChadSpawns",
});

KI5:addForcedSpawn("Base.49powerWagonPA", 4222, 6308, {
    direction = IsoDirections.N, 
    chance = 84,
    sandboxVar = "AllowPowerChadSpawns",
});

KI5:addForcedSpawn("Base.49powerWagonPA", 14172, 5938, {
    direction = IsoDirections.N, 
    chance = 99,
    sandboxVar = "AllowPowerChadSpawns",
});

KI5:addForcedSpawn("Base.49powerWagonPA", 11581, 9923, {
    direction = IsoDirections.N, 
    chance = 95,
    sandboxVar = "AllowPowerChadSpawns",
});


function PWR.ContainerAccess.Trunk(vehicle, part, chr)
	if chr:getVehicle() == vehicle then
		local seat = vehicle:getSeat(chr)
		return seat == 4;
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