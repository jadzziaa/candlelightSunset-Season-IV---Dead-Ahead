--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************
--v1.9.3

KI5 = KI5 or {};
E150 = E150 or {};

function E150.extractCond(player)
	local vehicle = player:getVehicle()
	if (vehicle and string.find( vehicle:getScriptName(), "86fordE150" )) then
		for i, partId in ipairs ({
			"Engine", "EngineDoor",
			"Windshield", "WindowFrontLeft", "WindowFrontRight", "WindshieldRear",
			"DoorFrontLeft", "DoorFrontRight", "DoorRearRight",
			"E150SpareTire",
			})
		do
			KI5:savePartCondById(vehicle, partId);
		end
	end
end

function E150.flushCond(player)
	local vanillaExit = ISExitVehicle["perform"];

        ISExitVehicle["perform"] = function(self)
            local vehicle = self.vehicle
				if (vehicle and string.find( vehicle:getScriptName(), "86fordE150" )) then
					for i, partId in ipairs ({
						"DoorRearRight", "E150SpareTire", "E150MMSpareTire", "E150MMRoofrack",
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

function E150.activeArmor(player)
    local vehicle = player:getVehicle()
    	if (vehicle and string.find( vehicle:getScriptName(), "86fordE150" )) then

		--

			local part = vehicle:getPartById("E150Trunk")
				if part:getCondition() < 49 then
					KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = 49})
				end

				--

		for i, freezeState in ipairs ({"DoorRearRight", "E150SpareTire", "E150MMSpareTire", "E150MMRoofrack"})
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

			local protection = vehicle:getPartById("E150Bumper")
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
							local cond = protection:getCondition() - ZombRandBetween(0,9)
							KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
								condition = cond
							})
						end
					end
				else
					local protection = vehicle:getPartById("E150Bumper")
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
									local cond = protection:getCondition() - ZombRandBetween(0,9)
									KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
										condition = cond
									})
								end
							end
						end
				end

		--

			for partId, armorPartId in pairs({
				["DoorFrontLeft"] = "E150LeftDoorArmor",
				["DoorFrontRight"] = "E150RightDoorArmor",
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
						local cond = protection:getCondition() - ZombRandBetween(0,6)
						KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
							condition = cond
						});
					end
				end
			end

		--

			for partId, armorPartId in pairs({
				["WindowFrontLeft"] = "E150LeftDoorArmor",
				["WindowFrontRight"] = "E150RightDoorArmor",
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

			local protection = vehicle:getPartById("E150WindshieldArmor")
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
						local cond = protection:getCondition() - ZombRandBetween(0,4)
						KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
							condition = cond
						})
					end
				end
			end

		--

			local protection = vehicle:getPartById("E150WindshieldRearArmor")
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
						local cond = protection:getCondition() - ZombRandBetween(0,5)
						KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
							condition = cond
						})
					end
				end
			end
		end
end

Events.OnGameStart.Add(E150.flushCond);
Events.OnEnterVehicle.Add(E150.extractCond);
Events.OnPlayerUpdate.Add(E150.activeArmor);