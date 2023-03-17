--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************
--b0.7.5

KI5 = KI5 or {};
ARRW = ARRW or {};

function ARRW.pvFixCheck()
	local vanillaEnter = ISEnterVehicle["start"];

	ISEnterVehicle["start"] = function(self)

		local vehicle = self.vehicle
			local vehicle = self.vehicle
			if 	vehicle and (
				string.find( vehicle:getScriptName(), "90pierceArrow" )) then

				self.character:SetVariable("KI5vehicle", "True")
			end
		
	vanillaEnter(self);
		
		local seat = self.seat
    		if not seat then return end
				if seat == 0 then
					self.character:SetVariable("BobIsDriver", "True")
				elseif seat == 2 or seat == 3 then
					self.character:SetVariable("BobIsDriver", "Backwards")
				else
					self.character:SetVariable("BobIsDriver", "False")
			end
	end
end

function ARRW.pvFixSwitch(player)
	local vehicle = player:getVehicle()
		if 	vehicle and (
			string.find( vehicle:getScriptName(), "90pierceArrow" )) then

			player:SetVariable("KI5vehicle", "True")

			local seat = vehicle:getSeat(player)
	    		if not seat then return end
					if seat == 0 then
						player:SetVariable("BobIsDriver", "True")
					elseif seat == 2 or seat == 3 then
						player:SetVariable("BobIsDriver", "Backwards")
					else
						player:SetVariable("BobIsDriver", "False")
				end

	end
end

function ARRW.pvFixClear(player)

		player:SetVariable("KI5vehicle", "False")
end

Events.OnGameStart.Add(ARRW.pvFixCheck);
--Events.OnGameStart.Add(KI5.pvFixSwitch);
Events.OnExitVehicle.Add(ARRW.pvFixClear);
Events.OnSwitchVehicleSeat.Add(ARRW.pvFixSwitch);