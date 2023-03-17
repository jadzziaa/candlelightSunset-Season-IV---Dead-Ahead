--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************
--v1.9.2

KI5 = KI5 or {};
ARRW = ARRW or {};

function ARRW.extractCond(player)
	local vehicle = player:getVehicle()
	if (vehicle and string.find( vehicle:getScriptName(), "90pierceArrow" )) then
		for i, partId in ipairs ({
			"Engine", "EngineDoor",
			"Windshield", "WindowFrontLeft", "WindowFrontRight", "WindowRearLeft", "WindowRearRight", "WindowMiddleLeft", "WindowMiddleRight", "WindshieldRear",
			"DoorFrontLeft", "DoorFrontRight", "DoorRearLeft", "DoorRearRight",
			"HeadlightLeft", "HeadlightRight", "HeadlightRearLeft", "HeadlightRearRight",
			})
		do
			KI5:savePartCondById(vehicle, partId);
		end
	end
end

function ARRW.flushCond(player)
	local vanillaExit = ISExitVehicle["perform"];

        ISExitVehicle["perform"] = function(self)
            local vehicle = self.vehicle
				if (vehicle and string.find( vehicle:getScriptName(), "90pierceArrow" )) then
					for i, partId in ipairs ({
						"ARRWLadders", "ARRWHoses",
						})
					do
						KI5:nukePartCondById(vehicle, partId);
				end
			end

            vanillaExit(self);
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

function KI5:nukePartCond(part)
	if part then
		local vehicle = part:getVehicle()
		if vehicle then
			KI5:sendArmorCommandWrapper(getPlayer(), part, "setPartModData", {
				data = {
					saveCond = false
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

function KI5:nukePartCondById(vehicle, partId)
	if vehicle and partId then
		KI5:nukePartCond(vehicle:getPartById(partId))
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

function ARRW.activeArmor(player)
    local vehicle = player:getVehicle()
    	if (vehicle and string.find( vehicle:getScriptName(), "90pierceArrow" )) then

		--

			local part = vehicle:getPartById("GasTank")
				if part:getCondition() < 25 then
					KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = 25})
				end

			local part = vehicle:getPartById("ARRWTrunk")
				if part:getCondition() < 49 then
					KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = 49})
				end

			local part = vehicle:getPartById("TrunkDoorRear")
				if part:getCondition() < 33 then
					KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = 33})
				end

		--

			local protection = vehicle:getPartById("ARRWBumperFront")
			local inventoryItem = protection:getInventoryItem();
			local part = vehicle:getPartById("EngineDoor")
				if part and protection and part:getInventoryItem() and inventoryItem and part:getModData()
				then 
					if inventoryItem:getFullType() ~= "Base.90pierceArrowBumper0" then
						local partCond = tonumber(part:getModData().saveCond)
						if protection:getCondition() > 0 and partCond
						then
							if part:getCondition() < partCond
							then
								KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
									condition = partCond
								})
								local cond = protection:getCondition() - (ZombRandBetween(0,100) <= 35 and ZombRandBetween(0,3) or 0);
								KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
									condition = cond
								})
							end
						end
				elseif inventoryItem:getFullType() == "Base.90pierceArrowBumper0" then
						local partCond = tonumber(part:getModData().saveCond)
						if protection:getCondition() > 0 and partCond
						then
							if part:getCondition() < partCond
							then
								KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
									condition = partCond
								})
								local cond = protection:getCondition() - ZombRandBetween(0,5);
								KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
									condition = cond
								})
							end
						end
					end
				else
					local protection = vehicle:getPartById("ARRWBumperFront")
					local inventoryItem = protection:getInventoryItem();
					local part = vehicle:getPartById("Engine")
						if protection and inventoryItem and part and part:getModData()
						then
							if inventoryItem:getFullType() ~= "Base.90pierceArrowBumper0" then
								local partCond = tonumber(part:getModData().saveCond)
								if protection:getCondition() > 0 and partCond
								then
									if part:getCondition() < partCond
									then
										KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
											condition = partCond
										})
										local cond = protection:getCondition() - ZombRandBetween(1,3);
										KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
											condition = cond
										})
									end
								end
							end
						end
				end

		--

			for partId, armorPartId in pairs({
				["DoorFrontLeft"] = "ARRWWindowFrontLeftArmor",
				["DoorFrontRight"] = "ARRWWindowFrontRightArmor",
				["DoorRearLeft"] = "ARRWWindowRearLeftArmor",
				["DoorRearRight"] = "ARRWWindowRearRightArmor",
				["WindowMiddleLeft"] = "ARRWWindowMiddleLeftArmor",
				["WindowMiddleRight"] = "ARRWWindowMiddleRightArmor",
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
				["WindowFrontLeft"] = "ARRWWindowFrontLeftArmor",
				["WindowFrontRight"] = "ARRWWindowFrontRightArmor",
				["WindowRearLeft"] = "ARRWWindowRearLeftArmor",
				["WindowRearRight"] = "ARRWWindowRearRightArmor",
				["WindowMiddleLeft"] = "ARRWWindowMiddleLeftArmor",
				["WindowMiddleRight"] = "ARRWWindowMiddleRightArmor",
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
				["HeadlightLeft"] = "ARRWBumperFront",
				["HeadlightRight"] = "ARRWBumperFront",
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

			local protection = vehicle:getPartById("ARRWWindshieldArmor")
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

		for i, freezeState in ipairs ({"ARRWLadders", "ARRWHoses"})
				do
					if vehicle:getPartById(freezeState) then
						local part = vehicle:getPartById(freezeState)
						local freezeCond = tonumber(part:getModData().saveCond)
					    	if freezeCond and part:getCondition() < freezeCond then
					    		KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = freezeCond})
							end
					end
			end

		--

			local protection = vehicle:getPartById("ARRWWindshieldRearArmor")
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

Events.OnEnterVehicle.Add(ARRW.extractCond);
Events.OnPlayerUpdate.Add(ARRW.activeArmor);
Events.OnGameStart.Add(ARRW.flushCond);