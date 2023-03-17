--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************
--v1.9.7

KI5 = KI5 or {};
R32 = R32 or {};

function R32.extractCond(player)
	local vehicle = player:getVehicle()
	if (vehicle and string.find( vehicle:getScriptName(), "92nissanGTR" )) then
		for i, partId in ipairs ({
			"Engine", "EngineDoor",
			"Windshield", "WindowFrontLeft", "WindowFrontRight", "WindowRearLeft", "WindowRearRight", "WindshieldRear",
			"DoorFrontLeft", "DoorFrontRight",
			"TrunkDoor", "R32Trunk", "R32Spare", "GasTank",
			"HeadlightLeft", "HeadlightRight", "HeadlightRearLeft", "HeadlightRearRight",
			})
		do
			KI5:savePartCondById(vehicle, partId);
		end
	end
end

function R32.flushCond(player)
	local vanillaExit = ISExitVehicle["perform"];

        ISExitVehicle["perform"] = function(self)
            local vehicle = self.vehicle
				if (vehicle and string.find( vehicle:getScriptName(), "92nissanGTR" )) then
					for i, partId in ipairs ({
						"R32Roofrack", 
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

function R32.activeArmor(player)
    local vehicle = player:getVehicle()
    	if (vehicle and string.find( vehicle:getScriptName(), "92nissanGTR" )) then

    	--

    	for i, tirePart in ipairs ({"TireFrontLeft", "TireFrontRight", "TireRearLeft", "TireRearRight"})
				do
					if vehicle:getPartById(tirePart) then
						local part = vehicle:getPartById(tirePart)
						local inventoryItem = part:getInventoryItem();
							if inventoryItem and inventoryItem:getFullType() == "Base.R32TireA" then
								local tireCond = 25;
							   	if part:getCondition() < tireCond then
						    		KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = tireCond})
										--print ("Set " .. tirePart .. " condition at: " .. tireCond)
								elseif part:getContainerContentAmount() < 10 then
									KI5:sendVehicleCommandWrapper(player, part, "setContainerContentAmount", {amount = 33})
										--print ("Set " .. tirePart .. " psi at: " .. 33)
								end
							end
					end
			end

		--

		-- for i, freezeState in ipairs ({"R32Roofrack"})
		-- 		do
		-- 			if vehicle:getPartById(freezeState) then
		-- 				local part = vehicle:getPartById(freezeState)
		-- 				local freezeCond = tonumber(part:getModData().saveCond)
		-- 			    	if freezeCond and part:getCondition() < freezeCond then
		-- 			    		KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = freezeCond})
		-- 					end
		-- 			end
		-- 	end

		--

			for partId, armorPartId in pairs({
				["Windshield"] = "R32WindshieldArmor",
				["WindshieldRear"] = "R32RearWindshieldArmor",
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

			local protection = vehicle:getPartById("R32Bumper")
			local inventoryItem = protection:getInventoryItem();
			local part = vehicle:getPartById("EngineDoor")
				if part and protection and part:getInventoryItem() and inventoryItem and part:getModData()
				then 
					if inventoryItem:getFullType() == "Base.R32BumperA" then
						local partCond = tonumber(part:getModData().saveCond)
						if protection:getCondition() > 0 and partCond
						then
							if part:getCondition() < partCond
							then
								KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
									condition = partCond
								})
								local cond = protection:getCondition() - (ZombRandBetween(0,100) <= 25 and ZombRandBetween(0,3) or 0);
								KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
									condition = cond
								})
							end
						end
					end
				else
					local protection = vehicle:getPartById("R32Bumper")
					local inventoryItem = protection:getInventoryItem();
					local part = vehicle:getPartById("Engine")
						if protection and inventoryItem and part and part:getModData()
						then
							if inventoryItem:getFullType() == "Base.R32BumperA" then
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
				["DoorFrontLeft"] = "R32DoorFrontLeftArmor",
				["DoorFrontRight"] = "R32DoorFrontRightArmor",
				["WindowRearLeft"] = "R32WindowRearLeftArmor",
				["WindowRearRight"] = "R32WindowRearRightArmor",
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
						local cond = protection:getCondition() - ZombRandBetween(1,7);
						KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
							condition = cond
						});
					end
				end
			end

		--

			for partId, armorPartId in pairs({
				["WindowFrontLeft"] = "R32DoorFrontLeftArmor",
				["WindowFrontRight"] = "R32DoorFrontRightArmor",
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
				["HeadlightLeft"] = "R32Bumper",
				["HeadlightRight"] = "R32Bumper",
				["HeadlightRearLeft"] = "R32BumperRear",
				["HeadlightRearRight"] = "R32BumperRear",
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

		-- 

			local protection = vehicle:getPartById("R32Sideskirts")
			local inventoryItem = protection:getInventoryItem();
			local part = vehicle:getPartById("GasTank")
				if part and protection and part:getInventoryItem() and inventoryItem and part:getModData()
				then 
					if inventoryItem:getFullType() == "Base.R32SideskirtsA" then
						local partCond = tonumber(part:getModData().saveCond)
						if protection:getCondition() > 0 and partCond
						then
							if part:getCondition() < partCond
							then
								KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
									condition = partCond
								})
								local cond = protection:getCondition() - ZombRandBetween(1,2);
								KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
									condition = cond
								})
							end
						end
					end
				end

		--

		local part = vehicle:getPartById("TruckBed")
				if part:getCondition() < 100 then
					KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = 100})
				end

		--
	end
end

--Events.OnGameStart.Add(R32.flushCond);
Events.OnEnterVehicle.Add(R32.extractCond);
Events.OnPlayerUpdate.Add(R32.activeArmor);