--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************

W460LWB = {
	parts = {
		Bumper = {
			W460LWBBumper = {
				Bumper1 = "W460Bumper1_Item",
				Bullbar2 = "W460Bullbar2_Item",
				Bullbar3 = "W460Bullbar3_Item",
			},
			default = "trve_random",
			noPartChance = 10,
		},
		BumperRear = {
			W460LWBBumperRear = {
				BumperRear1 = "W460BumperRear1_Item",
			},
			default = "trve_random",
			noPartChance = 20,
		},
		Roofrack = {
			W460LWBRoofrack = {
				Roofrack1 = "W460Roofrack1_Item",
			},
			default = "trve_random",
			noPartChance = 75,
		},
		Bodykit = {
			W460LWBBodykit = {
				Bodykit1 = "W460Bodykit1_Item",
			},
			default = "trve_random",
			noPartChance = 60,
		},
		Mudflaps = {
			W460LWBMudflaps = {
				Mudflaps1 = "W460Mudflaps1_Item",
			},
			default = "trve_random",
			noPartChance = 50,
		},
		DoorFrontLeftArmor = {
			W460LWBDoorFrontLeftArmor = {
				DoorFrontLeftArmor1 = "W460CarFrontDoorArmor1_Item",
			},
		},
		DoorFrontRightArmor = {
			W460LWBDoorFrontRightArmor = {
				DoorFrontRightArmor1 = "W460CarFrontDoorArmor1_Item",
			},
		},
		DoorRearLeftArmor = {
			W460LWBDoorRearLeftArmor = {
				DoorRearLeftArmor1 = "W460CarRearDoorArmor1_Item",
			},
		},
		DoorRearRightArmor = {
			W460LWBDoorRearRightArmor = {
				DoorRearRightArmor1 = "W460CarRearDoorArmor1_Item",
			},
		},
		WindshieldArmor = {
			W460LWBWindshieldArmor = {
				WindshieldArmor1 = "W460WindshieldArmor1_Item",
			},
		},
		WindshieldRearArmor = {
			W460LWBWindshieldRearArmor = {
				WindshieldRearArmor1 = "W460WindshieldRearArmor1_Item",
			},
		},
		WindowArmor = {
			W460LWBWindowArmor = {
				WindowArmor1 = "W460WindowArmor1_Item",
			},
		},
		SpareTire = {
			W460LWBSpareTire = {
				SpareTire1 = "W460NormalTire2",
				SpareTire2 = "W460WideTire2",
				SpareTire2 = "W460ModernTire2",
			},
			default = "trve_random",
			noPartChance = 33,
		},
		TireFrontLeft = {
			TireFrontLeft = {
				W460Tire1 = "W460NormalTire2",
				W460Tire2 = "W460WideTire2",
				W460Tire3 = "W460ModernTire2",
			},
		},
		TireFrontRight = {
			TireFrontRight = {
				W460Tire1 = "W460NormalTire2",
				W460Tire2 = "W460WideTire2",
				W460Tire3 = "W460ModernTire2",
			},
		},
		TireRearLeft = {
			TireRearLeft = {
				W460Tire1 = "W460NormalTire2",
				W460Tire2 = "W460WideTire2",
				W460Tire3 = "W460ModernTire2",
			},
		},
		TireRearRight = {
			TireRearRight = {
				W460Tire1 = "W460NormalTire2",
				W460Tire2 = "W460WideTire2",
				W460Tire3 = "W460ModernTire2",
			},
		},
	},
};

KI5:createVehicleConfig(W460LWB);


function W460LWB.ContainerAccess.Trunk(vehicle, part, chr)
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

function W460LWB.ContainerAccess.Roofrack(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	return true
end

function W460LWB.UninstallComplete.TrunkDoor(vehicle, part, chr)
		KI5:sendClientCommand("vehicle", "setDoorOpen", {
		vehicle = part:getVehicle():getId(),
		part = part:getId(),
		open = true
		});
end

--temp solution until the next round of base updates

function W460LWB.toggleWheel(vehicle, part, state)
	if state ~= nil
	then
		local wheelIndex = part:getWheelIndex();

		vehicle:setTireRemoved(wheelIndex, state);
	end

	local item = part:getInventoryItem();

	if item
	then
		for varModelName, varItem in pairs({
			["W460Tire3"] = "W460ModernTire2",
			["W460Tire2"] = "W460WideTire2",
			["W460Tire1"] = "W460NormalTire2",
		})
		do
			part:setModelVisible(varModelName, item:getType() == varItem);
		end
	end

	vehicle:doDamageOverlay();
end

function W460LWB.InstallComplete.Tire(vehicle, part)
	W460LWB.toggleWheel(vehicle, part, false);
end

function W460LWB.UninstallComplete.Tire(vehicle, part, item)
	W460LWB.toggleWheel(vehicle, part, true);
end

function W460LWB.Init.Tire(vehicle, part, item)
	W460LWB.toggleWheel(vehicle, part);

    local vName = vehicle:getScript():getName();

    if not KI5.loadedParts[vName]
    then
        KI5.loadedParts[vName] = {
            rootNS = W460LWB,
            parts = {}
        }
    end

    if not KI5.loadedParts[vName].parts[part:getId()]
    then
        KI5.loadedParts[vName].parts[part:getId()] = true;
    end
end