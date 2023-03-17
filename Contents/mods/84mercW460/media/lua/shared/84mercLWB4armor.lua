--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************
--v1.9.2

KI5 = KI5 or {};
LWB4 = LWB4 or {};

function LWB4.extractCond(player)
	local vehicle = player:getVehicle()
	if (vehicle and string.find( vehicle:getScriptName(), "84mercLWB4" )) then
		for i, partId in ipairs ({
			"Engine", "EngineDoor",
			"Windshield", "WindowFrontLeft", "WindowFrontRight", "WindowRearLeft", "WindowRearRight", "WindshieldRear",
			"DoorFrontLeft", "DoorFrontRight", "DoorRearLeft", "DoorRearRight",
			"HeadlightLeft", "HeadlightRight", "HeadlightRearLeft", "HeadlightRearRight",
			})
		do
			KI5:savePartCondById(vehicle, partId);
		end
	end
end

function KI5:savePartCond(part)
	if part then
		local vehicle = part:getVehicle()
		if vehicle then
			KI5:sendArmorCommandWrapper(getPlayer(), part, "setPartModData", {
				data = {
					saveCond = part:getCondition()
				}
			});
		end
	end
end

function KI5:savePartCondById(vehicle, partId)
	if vehicle and partId then
		KI5:savePartCond(vehicle:getPartById(partId))
	end
end

function KI5:sendVehicleCommandWrapper(player, part, methodName, args)
	local args = args or {}
	args.part = part:getId()
	args.vehicle = part:getVehicle():getId()
	sendClientCommand(player, "vehicle", methodName, args)
end

function KI5:sendArmorCommandWrapper(player, part, methodName, args)
	local args = args or {}
	args.part = part:getId()
	args.vehicle = part:getVehicle():getId()
	sendClientCommand(player, "KI5_armor", methodName, args)
end

function LWB4.activeArmor(player)
    local vehicle = player:getVehicle()
    	if (vehicle and string.find( vehicle:getScriptName(), "84mercLWB4" )) then

		--

			for i, tirePart in ipairs ({"TireFrontLeft", "TireFrontRight", "TireRearLeft", "TireRearRight"})
				do
					if vehicle:getPartById(tirePart) then
						local part = vehicle:getPartById(tirePart)
						local inventoryItem = part:getInventoryItem();
							if inventoryItem and inventoryItem:getFullType() == "Base.W460WideTire2" then
								local tireCond = 25;
							   	if part:getCondition() < tireCond then
						    		KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = tireCond})
								elseif part:getContainerContentAmount() < 10 then
									KI5:sendVehicleCommandWrapper(player, part, "setContainerContentAmount", {amount = 33})
								end
							end
					end
			end

		--

			local part = vehicle:getPartById("GasTank")
				if part:getCondition() < 25 then
					KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = 25})
				end

			local part = vehicle:getPartById("W460Trunk")
				if part:getCondition() < 49 then
					KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = 49})
				end

			local part = vehicle:getPartById("W460LWBRoofrack")
				if part:getCondition() < 48 then
					KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = 48})
				end

			local part = vehicle:getPartById("TrunkDoor")
				if part:getCondition() < 37 then
					KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = 37})
				end

		--

			local protection = vehicle:getPartById("W460LWBBumper")
			local part = vehicle:getPartById("EngineDoor")
				if part and protection and part:getInventoryItem() and protection:getInventoryItem() and part:getModData()
				then
					local partCond = tonumber(part:getModData().saveCond)
					if protection:getCondition() > 0 and partCond
					then
						if part:getCondition() < partCond
						then
							KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
								condition = partCond
							})
							local cond = protection:getCondition() - (ZombRandBetween(0,100) <= 35 and ZombRandBetween(0,3) or 0)
							KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
								condition = cond
							})
						end
					end
				else
					local protection = vehicle:getPartById("W460LWBBumper")
					local part = vehicle:getPartById("Engine")
						if protection and protection:getInventoryItem() and part and part:getModData()
						then
							local partCond = tonumber(part:getModData().saveCond)
							if protection:getCondition() > 0 and partCond
							then
								if part:getCondition() < partCond
								then
									KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
										condition = partCond
									})
									local cond = protection:getCondition() - (ZombRandBetween(0,100) <= 45 and ZombRandBetween(0,3) or 0)
									KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
										condition = cond
									})
								end
							end
						end
				end

		--

			for partId, armorPartId in pairs({
				["DoorFrontLeft"] = "W460LWBDoorFrontLeftArmor",
				["DoorFrontRight"] = "W460LWBDoorFrontRightArmor",
				["DoorRearLeft"] = "W460LWBDoorRearLeftArmor",
				["DoorRearRight"] = "W460LWBDoorRearRightArmor",
			}) do
				local part = vehicle:getPartById(partId);
				local protection = vehicle:getPartById(armorPartId);
				if protection and protection:getInventoryItem() and part and part:getModData()
				then
					local partCond = tonumber(part:getModData().saveCond);
					if protection:getCondition() > 0 and partCond and part:getCondition() < partCond
					then
						KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
							condition = partCond
						});
						local cond = protection:getCondition() - ZombRandBetween(0,5)
						KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
							condition = cond
						});
					end
				end
			end

		--

			for partId, armorPartId in pairs({
				["WindowFrontLeft"] = "W460LWBDoorFrontLeftArmor",
				["WindowFrontRight"] = "W460LWBDoorFrontRightArmor",
				["WindowRearLeft"] = "W460LWBDoorRearLeftArmor",
				["WindowRearRight"] = "W460LWBDoorRearRightArmor",
			}) do
				local part = vehicle:getPartById(partId);
				local protection = vehicle:getPartById(armorPartId);
				if protection and protection:getInventoryItem() and part and part:getModData()
				then
					local partCond = tonumber(part:getModData().saveCond);
					if protection:getCondition() > 0 and partCond and part:getCondition() < partCond
					then
						KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
							condition = partCond
						});
					end
				end
			end

		--

			for partId, armorPartId in pairs({
				["HeadlightLeft"] = "W460LWBBumper",
				["HeadlightRight"] = "W460LWBBumper",
			}) do
				local part = vehicle:getPartById(partId);
				local protection = vehicle:getPartById(armorPartId);
				if protection and protection:getInventoryItem() and part and part:getModData()
				then
					local partCond = tonumber(part:getModData().saveCond);
					if protection:getCondition() > 0 and partCond and part:getCondition() < partCond
					then
						KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
							condition = partCond
						});
					end
				end
			end

		--

			for partId, armorPartId in pairs({
				["HeadlightRearLeft"] = "W460LWBBumperRear",
				["HeadlightRearRight"] = "W460LWBBumperRear",
			}) do
				local part = vehicle:getPartById(partId);
				local protection = vehicle:getPartById(armorPartId);
				if protection and protection:getInventoryItem() and part and part:getModData()
				then
					local partCond = tonumber(part:getModData().saveCond);
					if protection:getCondition() > 0 and partCond and part:getCondition() < partCond
					then
						KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
							condition = partCond
						});
					end
				end
			end

		--

			local protection = vehicle:getPartById("W460LWBWindshieldArmor")
			local part = vehicle:getPartById("Windshield")
			if protection and protection:getInventoryItem() and part and part:getModData()
			then
				local partCond = tonumber(part:getModData().saveCond)
				if protection:getCondition() > 0 and partCond
				then
					if part:getCondition() < partCond
					then
						KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
							condition = partCond
						})
						local cond = protection:getCondition() - (ZombRandBetween(0,100) <= 65 and ZombRandBetween(0,3) or 0)
						KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
							condition = cond
						})
					end
				end
			end

		--

			local protection = vehicle:getPartById("W460LWBWindshieldRearArmor")
			local part = vehicle:getPartById("WindshieldRear")
			if protection and protection:getInventoryItem() and part and part:getModData()
			then
				local partCond = tonumber(part:getModData().saveCond)
				if protection:getCondition() > 0 and partCond
				then
					if part:getCondition() < partCond
					then
						KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
							condition = partCond
						})
						local cond = protection:getCondition() - (ZombRandBetween(0,100) <= 65 and ZombRandBetween(0,3) or 0)
						KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
							condition = cond
						})
					end
				end
			end
		end
end

Events.OnEnterVehicle.Add(LWB4.extractCond);
Events.OnPlayerUpdate.Add(LWB4.activeArmor);