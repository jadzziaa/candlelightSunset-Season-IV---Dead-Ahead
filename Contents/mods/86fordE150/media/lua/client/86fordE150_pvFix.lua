--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************
--b0.7.5

KI5 = KI5 or {};
E150 = E150 or {};

function E150.pvFixCheck()
	local vanillaEnter = ISEnterVehicle["start"];

	ISEnterVehicle["start"] = function(self)

		local vehicle = self.vehicle
			local vehicle = self.vehicle
			if 	vehicle and (
				string.find( vehicle:getScriptName(), "86fordE150" )) then

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

function E150.pvFixSwitch(player)
	local vehicle = player:getVehicle()
		if 	vehicle and (
			string.find( vehicle:getScriptName(), "86fordE150" )) then

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

function E150.pvFixClear(player)

		player:SetVariable("KI5vehicle", "False")
end

Events.OnGameStart.Add(E150.pvFixCheck);
--Events.OnGameStart.Add(KI5.pvFixSwitch);
Events.OnExitVehicle.Add(E150.pvFixClear);
Events.OnSwitchVehicleSeat.Add(E150.pvFixSwitch);