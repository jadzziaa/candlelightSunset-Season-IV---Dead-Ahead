--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************
--v1.9.8

KI5 = KI5 or {};
PWR = PWR or {};

function PWR.extractCond(player)
	local vehicle = player:getVehicle()
	if (vehicle and string.find( vehicle:getScriptName(), "49powerWagon" )) then
		for i, partId in ipairs ({
			"Engine", "EngineDoor", "TrunkDoor",
			"Windshield", "WindowFrontLeft", "WindowFrontRight", "WindowRearLeft", "WindowRearRight", "WindshieldRear",
			"DoorFrontLeft", "DoorFrontRight", "DoorRearLeft", "DoorRearRight",
			"PWRTrunk", "PWRFrontBumper", "PWRSideskirts", "FenderFrontLeft", "FenderFrontRight", "FenderRearLeft", "FenderRearRight", "GasTank",
			"HeadlightLeft", "HeadlightRight",
			"TireFrontLeft", "TireFrontRight", "TireRearLeft", "TireRearRight"
			})
		do
			KI5:savePartCondById(vehicle, partId);
		end
	end
end

function PWR.flushCond(player)
	local vanillaExit = ISExitVehicle["perform"];

        ISExitVehicle["perform"] = function(self)
            local vehicle = self.vehicle
				if (vehicle and string.find( vehicle:getScriptName(), "49powerWagon" )) then
					for i, partId in ipairs ({
						"PWRSpare" 
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

function PWR.activeArmor(player)
    local vehicle = player:getVehicle()
    	if (vehicle and string.find( vehicle:getScriptName(), "49powerWagon" )) then

    	--

    	for i, tirePart in ipairs ({"TireFrontLeft", "TireFrontRight", "TireRearLeft", "TireRearRight"})
				do
					if vehicle:getPartById(tirePart) then
						local part = vehicle:getPartById(tirePart)
						local inventoryItem = part:getInventoryItem();
							if inventoryItem and inventoryItem:getFullType() == "Base.49powerWagonApocalypseTire" then
								local tireCond = 25;
							   	if part:getCondition() < tireCond then
						    		KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = tireCond})
								end
							end
					end
			end

    	--

			for partId, armorPartId in pairs({
				["Windshield"] = "PWRWindshieldArmor",
				["WindshieldRear"] = "PWRWindshieldRearArmor",
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
						local cond = protection:getCondition() - ZombRand(4);
						KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
							condition = cond
						});
					end
				end
			end

		-- 

			local protection = vehicle:getPartById("PWRFrontBumper")
			local inventoryItem = protection:getInventoryItem();
			local part = vehicle:getPartById("EngineDoor")
				if part and protection and part:getInventoryItem() and inventoryItem and part:getModData()
				then 
					if inventoryItem and inventoryItem:getFullType() ~= "Base.49powerWagonBumper0" then
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
				elseif inventoryItem and inventoryItem:getFullType() == "Base.49powerWagonBumper0" then
						local partCond = tonumber(part:getModData().saveCond)
						if protection:getCondition() > 0 and partCond
						then
							if part:getCondition() < partCond
							then
								KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
									condition = partCond
								})
								local cond = protection:getCondition() - ZombRandBetween(0,4);
								KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
									condition = cond
								})
							end
						end
					end
				else
					local protection = vehicle:getPartById("PWRFrontBumper")
					local inventoryItem = protection:getInventoryItem();
					local part = vehicle:getPartById("Engine")
						if protection and inventoryItem and part and part:getModData()
						then
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

		--

			for partId, armorPartId in pairs({
				["DoorFrontLeft"] = "PWRFrontLeftArmor",
				["DoorFrontRight"] = "PWRFrontRightArmor",
				["DoorRearLeft"] = "PWRRearLeftArmor",
				["DoorRearRight"] = "PWRRearRightArmor",
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
						local cond = protection:getCondition() - ZombRandBetween(1,5);
						KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
							condition = cond
						});
					end
				end
			end

		--

			for partId, armorPartId in pairs({
				["WindowFrontLeft"] = "PWRFrontLeftArmor",
				["WindowFrontRight"] = "PWRFrontRightArmor",
				["WindowRearLeft"] = "PWRRearLeftArmor",
				["WindowRearRight"] = "PWRRearRightArmor",
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
				["HeadlightLeft"] = "PWRFrontBumper",
				["HeadlightRight"] = "PWRFrontBumper",
			}) do
				local part = vehicle:getPartById(partId);
				local protection = vehicle:getPartById(armorPartId);
				local inventoryItem = protection:getInventoryItem();
				if inventoryItem and inventoryItem:getFullType() ~= "Base.49powerWagonBumper0" then
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
			end

		--

		for partId, armorPartId in pairs({
				["TireFrontLeft"] = "FenderFrontLeft",
				["TireFrontRight"] = "FenderFrontRight",
				["TireRearLeft"] = "FenderRearLeft",
				["TireRearRight"] = "FenderRearRight",
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
						local cond = protection:getCondition() - 1;
						KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
							condition = cond
						});
					end
				end
			end

		--

		for i, freezeState in ipairs ({"PWRSpare"})
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

			for i, nodisplay in ipairs ({"TruckBed", "FakeDoor", "FakeWindow"})
				do
					if vehicle:getPartById(nodisplay) then
						local part = vehicle:getPartById(nodisplay)
						local nodisplay = 100;
					    	if part:getCondition() < nodisplay then
					    		KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = nodisplay})
							end
					end
			end

		--
	end
end

Events.OnGameStart.Add(PWR.flushCond);
Events.OnEnterVehicle.Add(PWR.extractCond);
Events.OnPlayerUpdate.Add(PWR.activeArmor);