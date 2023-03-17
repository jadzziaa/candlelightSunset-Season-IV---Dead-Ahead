--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************
--b0.7.6

KI5 = KI5 or {};
ECTO1 = ECTO1 or {};

function ECTO1.pvFixCheck()
	local vanillaEnter = ISEnterVehicle["start"];

	ISEnterVehicle["start"] = function(self)

		local vehicle = self.vehicle
			local vehicle = self.vehicle
			if 	vehicle and (
				string.find( vehicle:getScriptName(), "59ambulance" ) or
				string.find( vehicle:getScriptName(), "59meteor" ) or
				string.find( vehicle:getScriptName(), "ECTO1" )) then

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

function ECTO1.pvFixSwitch(player)
	local vehicle = player:getVehicle()
		if 	vehicle and (
				string.find( vehicle:getScriptName(), "59ambulance" ) or
				string.find( vehicle:getScriptName(), "59meteor" ) or
				string.find( vehicle:getScriptName(), "ECTO1" )) then

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

function ECTO1.pvFixClear(player)

		player:SetVariable("KI5vehicle", "False")
end

Events.OnGameStart.Add(ECTO1.pvFixCheck);
--Events.OnGameStart.Add(KI5.pvFixSwitch);
Events.OnExitVehicle.Add(ECTO1.pvFixClear);
Events.OnSwitchVehicleSeat.Add(ECTO1.pvFixSwitch);