--***********************************************************
--**                          KI5                          **
--***********************************************************

KZ1K = KZ1K or {}

function KZ1K.RunFlats(player)
    local vehicle = player:getVehicle()
	if (vehicle and string.find( vehicle:getScriptName(), "80kz1000" )) then

    	for i, tirePart in ipairs ({"ATAMotoTireFrontWheel", "ATAMotoTireRearWheel"})
				do
					if vehicle:getPartById(tirePart) then
						local part = vehicle:getPartById(tirePart)
						local tireCond = 25;
					    	if part:getCondition() < tireCond then
					    		sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = tireCond })
							elseif part:getContainerContentAmount() < 10 then
								sendClientCommand(player, "vehicle", "setContainerContentAmount", { vehicle = vehicle:getId(), part = part:getId(), amount = 33 })
							end
					end
			end
	end
end

Events.OnPlayerUpdate.Add(KZ1K.RunFlats);