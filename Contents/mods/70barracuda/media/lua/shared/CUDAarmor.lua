--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************
--v1.9.7

KI5 = KI5 or {};
CUDA = CUDA or {};

function CUDA.extractCond(player)
	local vehicle = player:getVehicle()
	if vehicle and ( string.find( vehicle:getScriptName(), "70barracuda" ) or string.find( vehicle:getScriptName(), "70cuda" )) then
		for i, partId in ipairs ({
			"Engine", "EngineDoor",
			"Windshield", "WindowFrontLeft", "WindowFrontRight", "WindowRearLeft", "WindowRearRight", "WindshieldRear",
			"DoorFrontLeft", "DoorFrontRight",
			"TrunkDoor", "CUDATrunk", "CUDASpareTire", "GasTank",
			"HeadlightLeft", "HeadlightRight", "HeadlightRearLeft", "HeadlightRearRight",
			})
		do
			KI5:savePartCondById(vehicle, partId);
		end
	end
end

function CUDA.flushCond(player)
	local vanillaExit = ISExitVehicle["perform"];

        ISExitVehicle["perform"] = function(self)
            local vehicle = self.vehicle
				if vehicle and ( string.find( vehicle:getScriptName(), "70barracuda" ) or string.find( vehicle:getScriptName(), "70cuda" )) then
					for i, partId in ipairs ({
						"CUDASpareTire", 
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

function CUDA.activeArmor(player)
    local vehicle = player:getVehicle()
    	if vehicle and ( string.find( vehicle:getScriptName(), "70barracuda" ) or string.find( vehicle:getScriptName(), "70cuda" )) then

    	--

			for partId, armorPartId in pairs({
				["Windshield"] = "CUDAWindshieldArmor",
				["WindshieldRear"] = "CUDAWindshieldRearArmor",
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

			local protection = vehicle:getPartById("CUDAFrontBumper")
			local inventoryItem = protection:getInventoryItem();
			local part = vehicle:getPartById("EngineDoor")
				if part and protection and part:getInventoryItem() and inventoryItem and part:getModData()
				then 
					if inventoryItem:getFullType() ~= "Base.CUDAFrontBumper0" then
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
					end
				else
					local protection = vehicle:getPartById("CUDAFrontBumper")
					local inventoryItem = protection:getInventoryItem();
					local part = vehicle:getPartById("Engine")
						if protection and inventoryItem and part and part:getModData()
						then
							if inventoryItem:getFullType() ~= "Base.CUDAFrontBumper0" then
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

			local protection = vehicle:getPartById("CUDARearBumper")
			local inventoryItem = protection:getInventoryItem();
			local part = vehicle:getPartById("TrunkDoor")
				if part and protection and part:getInventoryItem() and inventoryItem and part:getModData()
				then 
					if inventoryItem:getFullType() ~= "Base.CUDARearBumper0" then
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
					end
				end

		--

			for partId, armorPartId in pairs({
				["DoorFrontLeft"] = "CUDADoorLeftArmor",
				["DoorFrontRight"] = "CUDADoorRightArmor",
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
				["WindowFrontLeft"] = "CUDADoorLeftArmor",
				["WindowFrontRight"] = "CUDADoorRightArmor",
				["WindowRearLeft"] = "CUDADoorLeftArmor",
				["WindowRearRight"] = "CUDADoorRightArmor",
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
				["HeadlightLeft"] = "CUDAFrontBumper",
				["HeadlightRight"] = "CUDAFrontBumper",
				["HeadlightRearLeft"] = "CUDARearBumper",
				["HeadlightRearRight"] = "CUDARearBumper",
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

		for i, freezeState in ipairs ({"CUDASpareTire"})
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

Events.OnGameStart.Add(CUDA.flushCond);
Events.OnEnterVehicle.Add(CUDA.extractCond);
Events.OnPlayerUpdate.Add(CUDA.activeArmor);