--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************
--b0.7.5

KI5 = KI5 or {};
CH88 = CH88 or {};

function CH88.pvFixCheck()
	local vanillaEnter = ISEnterVehicle["start"];

	ISEnterVehicle["start"] = function(self)

		local vehicle = self.vehicle
			local vehicle = self.vehicle
			if 	vehicle and (
				string.find( vehicle:getScriptName(), "88chevyS10" )) then

				self.character:SetVariable("KI5vehicle", "True")
			end
		
	vanillaEnter(self);
		
		local seat = self.seat
    		if not seat then return end
				if seat == 0 then		
					self.character:SetVariable("BobIsDriver", "True")
				else		
					self.character:SetVariable("BobIsDriver", "False")
			end
	end
end

function CH88.pvFixSwitch(player)
	local vehicle = player:getVehicle()
		if 	vehicle and (
			string.find( vehicle:getScriptName(), "88chevyS10" )) then

			player:SetVariable("KI5vehicle", "True")

			local seat = vehicle:getSeat(player)
	    		if not seat then return end
					if seat == 0 then		
						player:SetVariable("BobIsDriver", "True")
					else		
						player:SetVariable("BobIsDriver", "False")
				end

	end
end

function CH88.pvFixClear(player)

		player:SetVariable("KI5vehicle", "False")
end

Events.OnGameStart.Add(CH88.pvFixCheck);
--Events.OnGameStart.Add(KI5.pvFixSwitch);
Events.OnExitVehicle.Add(CH88.pvFixClear);
Events.OnSwitchVehicleSeat.Add(CH88.pvFixSwitch);