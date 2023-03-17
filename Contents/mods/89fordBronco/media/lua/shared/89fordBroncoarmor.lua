--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************
--v1.9.8

KI5 = KI5 or {};
BR89 = BR89 or {};

function BR89.extractCond(player)
	local vehicle = player:getVehicle()
	if (vehicle and string.find( vehicle:getScriptName(), "89fordBronco" )) then
		for i, partId in ipairs ({
			"Engine", "EngineDoor", "TrunkDoor",
			"Windshield", "WindowFrontLeft", "WindowFrontRight", "WindowRearLeft", "WindowRearRight", "WindshieldRear",
			"DoorFrontLeft", "DoorFrontRight", "DoorRearLeft", "DoorRearRight",
			"BR89Trunk", "BR89SpareTireRear", "BR89SpareTireRoof", "BR89BedCover", "BR89Roofrack", "BR89Rollbar", "BR89FrontBumper", "BR89RearBumper", "GasTank",
			"HeadlightLeft", "HeadlightRight",
			})
		do
			KI5:savePartCondById(vehicle, partId);
		end
	end
end

function BR89.flushCond(player)
	local vanillaExit = ISExitVehicle["perform"];

        ISExitVehicle["perform"] = function(self)
            local vehicle = self.vehicle
				if (vehicle and string.find( vehicle:getScriptName(), "89fordBronco" )) then
					for i, partId in ipairs ({
						"BR89SpareTireRear", "BR89SpareTireRoof", "BR89BedCover", "BR89Roofrack", 
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

function BR89.activeArmor(player)
    local vehicle = player:getVehicle()
    	if (vehicle and string.find( vehicle:getScriptName(), "89fordBronco" )) then

    	--

			for partId, armorPartId in pairs({
				["Windshield"] = "BR89WindshieldArmor",
				["WindshieldRear"] = "BR89Rollbar",
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

			local protection = vehicle:getPartById("BR89FrontBumper")
			local inventoryItem = protection:getInventoryItem();
			local part = vehicle:getPartById("EngineDoor")
				if part and protection and part:getInventoryItem() and inventoryItem and part:getModData()
				then 
					if inventoryItem:getFullType() ~= "Base.89BroncoBumperFront" then
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
				elseif inventoryItem:getFullType() == "Base.89BroncoBumperFront" then
						local partCond = tonumber(part:getModData().saveCond)
						if protection:getCondition() > 0 and partCond
						then
							if part:getCondition() < partCond
							then
								KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
									condition = partCond
								})
								local cond = protection:getCondition() - ZombRandBetween(0,15);
								KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
									condition = cond
								})
							end
						end
					end
				else
					local protection = vehicle:getPartById("BR89FrontBumper")
					local inventoryItem = protection:getInventoryItem();
					local part = vehicle:getPartById("Engine")
						if protection and inventoryItem and part and part:getModData()
						then
							if inventoryItem:getFullType() ~= "Base.89BroncoBumperFront" then
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

			local protection = vehicle:getPartById("BR89RearBumper")
			local inventoryItem = protection:getInventoryItem();
			local part = vehicle:getPartById("TrunkDoor")
				if part and protection and part:getInventoryItem() and inventoryItem and part:getModData()
				then 
					if inventoryItem:getFullType() ~= "Base.89BroncoBumperRear" then
						local partCond = tonumber(part:getModData().saveCond)
						if protection:getCondition() > 0 and partCond
						then
							if part:getCondition() < partCond
							then
								KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
									condition = partCond
								})
								local cond = protection:getCondition() - (ZombRandBetween(0,100) <= 45 and ZombRandBetween(0,3) or 0);
								KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
									condition = cond
								})
							end
						end
				elseif inventoryItem:getFullType() == "Base.89BroncoBumperRear" then
						local partCond = tonumber(part:getModData().saveCond)
						if protection:getCondition() > 0 and partCond
						then
							if part:getCondition() < partCond
							then
								KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
									condition = partCond
								})
								local cond = protection:getCondition() - ZombRandBetween(0,15);
								KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
									condition = cond
								})
							end
						end
					end
				end

		--

			for partId, armorPartId in pairs({
				["DoorFrontLeft"] = "BR89WindowFrontLeftArmor",
				["DoorFrontRight"] = "BR89WindowFrontRightArmor",
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
				["WindowFrontLeft"] = "BR89WindowFrontLeftArmor",
				["WindowFrontRight"] = "BR89WindowFrontRightArmor",
				["WindowRearLeft"] = "BR89WindowRearLeftArmor",
				["WindowRearRight"] = "BR89WindowRearRightArmor",
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
				["HeadlightLeft"] = "BR89FrontBumper",
				["HeadlightRight"] = "BR89FrontBumper",
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

		for i, freezeState in ipairs ({"BR89SpareTireRear", "BR89SpareTireRoof", "BR89BedCover", "BR89Roofrack"})
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

			for i, nodisplay in ipairs ({"TruckBed", "DoorRearLeft", "DoorRearRight"})
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

Events.OnGameStart.Add(BR89.flushCond);
Events.OnEnterVehicle.Add(BR89.extractCond);
Events.OnPlayerUpdate.Add(BR89.activeArmor);