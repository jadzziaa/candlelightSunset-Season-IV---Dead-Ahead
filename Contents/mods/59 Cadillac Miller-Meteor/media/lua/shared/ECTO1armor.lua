--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************
--v1.9.3

KI5 = KI5 or {};
ECTO1 = ECTO1 or {};

function ECTO1.extractCond(player)
	local vehicle = player:getVehicle()
	if 	vehicle and (
				string.find( vehicle:getScriptName(), "59ambulance" ) or
				string.find( vehicle:getScriptName(), "59meteor" ) or
				string.find( vehicle:getScriptName(), "ECTO1" )) then
		for i, partId in ipairs ({
			"Engine", "EngineDoor", "TrunkDoor", 
			"Windshield", "WindshieldRear", "WindowFrontLeft", "WindowFrontRight", "WindowRearLeft", "WindowRearRight",
			"DoorFrontLeft", "DoorFrontRight", "DoorRearLeft", "DoorRearRight",
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

function ECTO1.activeArmor(player)
    local vehicle = player:getVehicle()
    	if 	vehicle and (
				string.find( vehicle:getScriptName(), "59ambulance" ) or
				string.find( vehicle:getScriptName(), "59meteor" ) or
				string.find( vehicle:getScriptName(), "ECTO1" )) then

		-- 

			for i, tirePart in ipairs ({"TireFrontLeft", "TireFrontRight", "TireRearLeft", "TireRearRight"})
				do
					if vehicle:getPartById(tirePart) then
						local part = vehicle:getPartById(tirePart)
						local inventoryItem = part:getInventoryItem();
							if inventoryItem and inventoryItem:getFullType() == "Base.ECTO1tire1_Item" then
								local tireCond = 25;
							   	if part:getCondition() < tireCond then
						    		KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = tireCond})
										--print ("Set " .. tirePart .. " condition at: " .. tireCond)
								elseif part:getContainerContentAmount() < 20 then
									KI5:sendVehicleCommandWrapper(player, part, "setContainerContentAmount", {amount = 35})
										--print ("Set " .. tirePart .. " psi at: " .. 33)
								end
							end
					end
			end

		-- 

			local part = vehicle:getPartById("GasTank")
				if part:getCondition() < 55 then
					KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = 55})
				end

			local part = vehicle:getPartById("ECTO1Equipment")
				if part then
					if part:getCondition() < 49 then
						KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = 49})
					end
				end

			local part = vehicle:getPartById("ECTO1Roofrack")
				if part:getCondition() < 47 then
					KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = 47})
				end

		-- 

			local protection = vehicle:getPartById("ECTO1Bullbar")
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

							--print ("Set EngineDoor condition to: " .. partCond)

							local cond = protection:getCondition() - ZombRand(4)

							KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
								condition = cond
							})

							--print ("Set Bullbar condition to: " .. cond)
						end
					end
				else
					local protection = vehicle:getPartById("ECTO1Bullbar")
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

									--print ("Set Engine condition to: " .. partCond)

									local cond = protection:getCondition() - ZombRand(3)

									KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
										condition = cond
									})

									--print ("Set Bullbar condition to: " .. cond)
								end
							end
						end
				end

		-- 

			for partId, armorPartId in pairs({
				["DoorFrontLeft"] = "ECTO1DoorFrontLeftArmor",
				["DoorFrontRight"] = "ECTO1DoorFrontRightArmor",
				["DoorRearLeft"] = "ECTO1DoorRearLeftArmor",
				["DoorRearRight"] = "ECTO1DoorRearRightArmor",
				["TrunkDoor"] = "ECTO1WindshieldRearArmor",
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

						--print ("Set " .. partId .. " condition to: " .. partCond);

						local cond = protection:getCondition() - ZombRandBetween(1,7);

						KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
							condition = cond
						});

						--print ("Set " .. armorPartId .. " condition to: " .. cond);
					end
				end
			end

		-- 

			for partId, armorPartId in pairs({
				["WindowFrontLeft"] = "ECTO1DoorFrontLeftArmor",
				["WindowFrontRight"] = "ECTO1DoorFrontRightArmor",
				["WindowRearLeft"] = "ECTO1DoorRearLeftArmor",
				["WindowRearRight"] = "ECTO1DoorRearRightArmor",
				["WindshieldRear"] = "ECTO1WindshieldRearArmor",
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

						--print ("Set " .. partId .. " condition to: " .. partCond);
					end
				end
			end

		-- 

			local protection = vehicle:getPartById("ECTO1WindshieldArmor")
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

						local cond = protection:getCondition() - ZombRand(5)

						KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
							condition = cond
						})
					end
				end
			end

		end
end

Events.OnEnterVehicle.Add(ECTO1.extractCond);
Events.OnPlayerUpdate.Add(ECTO1.activeArmor);