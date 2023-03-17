--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************

R32 = {
	parts = {
		Muffler = {
			R32Muffler = {
				Muffler0 = "R32muffler0",
				Muffler1 = "R32muffler1",
			},
			default = "trve_random",
			noPartChance = 10,
		},
		Bumper = {
			R32Bumper = {
				Bumper0 = "R32Bumper0",
				Bumper1 = "R32Bumper1",
				Bumper2 = "R32Bumper2",
				Bumper3 = "R32Bumper3",
				BumperA = "R32BumperA",
			},
			default = "trve_random",
			noPartChance = 10,
		},
		BumperRear = {
			R32BumperRear = {
				BumperRear0 = "R32BumperRear0",
				BumperRear1 = "R32BumperRear1",
				BumperRear2 = "R32BumperRear2",
				BumperRear3 = "R32BumperRear3",
				BumperRearA = "R32BumperRearA",
			},
			default = "trve_random",
			noPartChance = 10,
		},
		Sideskirts = {
			R32Sideskirts = {
				Sideskirts1 = "R32Sideskirts1",
				Sideskirts2 = "R32Sideskirts2",
				Sideskirts3 = "R32Sideskirts3",
				SideskirtsA = "R32SideskirtsA",
			},
			default = "trve_random",
			noPartChance = 35,
		},
		Spoiler = {
			R32Spoiler = {
				Spoiler0 = "R32Spoiler0",
				Spoiler1 = "R32Spoiler1",
				Spoiler2 = "R32Spoiler2",
				Spoiler3 = "R32Spoiler3",
				SpoilerA = "R32SpoilerA",
			},
			default = "trve_random",
			noPartChance = 10,
		},
		WindshieldArmor = {
			R32WindshieldArmor = {
				WindshieldArmor = "R32WindshieldArmor",
			},
		},
		RearWindshieldArmor = {
			R32RearWindshieldArmor = {
				RearWindshieldArmor = "R32WindshieldRearArmor",
			},
		},
		DoorFrontLeftArmor = {
			R32DoorFrontLeftArmor = {
				DoorFrontLeftArmor = "R32DoorArmor",
			},
		},
		DoorFrontRightArmor = {
			R32DoorFrontRightArmor = {
				DoorFrontRightArmor = "R32DoorArmor",
			},
		},
		WindowRearLeftArmor = {
			R32WindowRearLeftArmor = {
				WindowRearLeftArmor = "R32RearWindowArmor",
			},
		},
		WindowRearRightArmor = {
			R32WindowRearRightArmor = {
				WindowRearRightArmor = "R32RearWindowArmor",
			},
		},
		TireFrontLeft = {
			TireFrontLeft = {
				R32Tire0 = "R32Tire0",
				R32Tire1 = "R32Tire1",
				R32Tire2 = "R32Tire2",
				R32TireA = "R32TireA",
			},
		},
		TireFrontRight = {
			TireFrontRight = {
				R32Tire0 = "R32Tire0",
				R32Tire1 = "R32Tire1",
				R32Tire2 = "R32Tire2",
				R32TireA = "R32TireA",
			},
		},
		TireRearLeft = {
			TireRearLeft = {
				R32Tire0 = "R32Tire0",
				R32Tire1 = "R32Tire1",
				R32Tire2 = "R32Tire2",
				R32TireA = "R32TireA",
			},
		},
		TireRearRight = {
			TireRearRight = {
				R32Tire0 = "R32Tire0",
				R32Tire1 = "R32Tire1",
				R32Tire2 = "R32Tire2",
				R32TireA = "R32TireA",
			},
		},
	},
};

KI5:createVehicleConfig(R32);

--temp solution until the next round of base updates

function R32.toggleWheel(vehicle, part, state)
	if state ~= nil
	then
		local wheelIndex = part:getWheelIndex();

		vehicle:setTireRemoved(wheelIndex, state);
	end

	local item = part:getInventoryItem();

	if item
	then
		for varModelName, varItem in pairs({
			["R32Tire0"] = "R32Tire0",
			["R32Tire1"] = "R32Tire1",
			["R32Tire2"] = "R32Tire2",
			["R32TireA"] = "R32TireA",
		})
		do
			part:setModelVisible(varModelName, item:getType() == varItem);
		end
	end

	vehicle:doDamageOverlay();
end

function R32.InstallComplete.Tire(vehicle, part)
	R32.toggleWheel(vehicle, part, false);
end

function R32.UninstallComplete.Tire(vehicle, part, item)
	R32.toggleWheel(vehicle, part, true);
end

function R32.Init.Tire(vehicle, part, item)
	R32.toggleWheel(vehicle, part);

    local vName = vehicle:getScript():getName();

    if not KI5.loadedParts[vName]
    then
        KI5.loadedParts[vName] = {
            rootNS = R32,
            parts = {}
        }
    end

    if not KI5.loadedParts[vName].parts[part:getId()]
    then
        KI5.loadedParts[vName].parts[part:getId()] = true;
    end
end