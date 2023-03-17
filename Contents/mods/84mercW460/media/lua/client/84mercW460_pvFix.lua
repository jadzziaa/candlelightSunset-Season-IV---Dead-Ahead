--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************
--b0.7.5

KI5 = KI5 or {};
W460LWB = W460LWB or {};

function W460LWB.pvFixCheck()
	local vanillaEnter = ISEnterVehicle["start"];

	ISEnterVehicle["start"] = function(self)

		local vehicle = self.vehicle
			local vehicle = self.vehicle
			if 	vehicle and (
				string.find( vehicle:getScriptName(), "84merc" )) then

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

function W460LWB.pvFixSwitch(player)
	local vehicle = player:getVehicle()
		if 	vehicle and (
			string.find( vehicle:getScriptName(), "84merc" )) then

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

function W460LWB.pvFixClear(player)

		player:SetVariable("KI5vehicle", "False")
end

Events.OnGameStart.Add(W460LWB.pvFixCheck);
--Events.OnGameStart.Add(KI5.pvFixSwitch);
Events.OnExitVehicle.Add(W460LWB.pvFixClear);
Events.OnSwitchVehicleSeat.Add(W460LWB.pvFixSwitch);