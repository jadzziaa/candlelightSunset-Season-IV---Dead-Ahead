--***********************************************************
--**     KI5 did this / bikinihorst is not to blame        **
--***********************************************************
--b0.7.5

KI5 = KI5 or {};
LIN93 = LIN93 or {};

function LIN93.pvFixCheck()
	local vanillaEnter = ISEnterVehicle["start"];

	ISEnterVehicle["start"] = function(self)

		local vehicle = self.vehicle
			local vehicle = self.vehicle
			if 	vehicle and (
				string.find( vehicle:getScriptName(), "93townCar" )) then

				self.character:SetVariable("KI5vehicle", "True")
			end
		
	vanillaEnter(self);

		if 	vehicle and (
				string.find( vehicle:getScriptName(), "93townCarLimo" )) then

				local seat = self.seat
	    		if not seat then return end
					if seat == 0 then		
						self.character:SetVariable("BobIsDriver", "True")
					elseif seat == 2 then	
						self.character:SetVariable("BobIsDriver", "Nope")
					elseif seat == 3 then	
						self.character:SetVariable("BobIsDriver", "Shooter")
					else		
						self.character:SetVariable("BobIsDriver", "False")
				end

			else

				if 	vehicle and (
				string.find( vehicle:getScriptName(), "93townCarLimo" )) then

					local seat = self.seat
		    		if not seat then return end
						if seat == 0 then		
							self.character:SetVariable("BobIsDriver", "True")
						else		
							self.character:SetVariable("BobIsDriver", "False")
					end
				end

			end
		
	end
end

function LIN93.pvFixSwitch(player)
	local vehicle = player:getVehicle()
		if 	vehicle and (
			string.find( vehicle:getScriptName(), "93townCar" )) then

			player:SetVariable("KI5vehicle", "True")

			if 	vehicle and (
			string.find( vehicle:getScriptName(), "93townCarLimo" )) then

				local seat = vehicle:getSeat(player)
		    		if not seat then return end
						if seat == 0 then		
							player:SetVariable("BobIsDriver", "True")
						elseif seat == 2 then
							player:SetVariable("BobIsDriver", "Nope")
						elseif seat == 3 then
							player:SetVariable("BobIsDriver", "Shooter")
						else		
							player:SetVariable("BobIsDriver", "False")
					end

				else

					local seat = vehicle:getSeat(player)
		    		if not seat then return end
						if seat == 0 then		
							player:SetVariable("BobIsDriver", "True")
						else		
							player:SetVariable("BobIsDriver", "False")
					end

				end

	end
end

function LIN93.pvFixClear(player)

		player:SetVariable("KI5vehicle", "False")
end

Events.OnGameStart.Add(LIN93.pvFixCheck);
--Events.OnGameStart.Add(KI5.pvFixSwitch);
Events.OnExitVehicle.Add(LIN93.pvFixClear);
Events.OnSwitchVehicleSeat.Add(LIN93.pvFixSwitch);