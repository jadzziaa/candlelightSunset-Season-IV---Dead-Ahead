-- this method was copied from the excellent Skateboard mod by Dislaik https://steamcommunity.com/sharedfiles/filedetails/?id=2728300240
-- require "Vehicles/ISUI/ISVehicleMenu"
-- require "Vehicles/TimedActions/ISStartVehicleEngine"

local function GarbageTruck_Enter(player)
	local vehicle = player:getVehicle()
	if not vehicle then return end
    local vehicleName = vehicle:getScriptName()
    local seat = vehicle:getSeat(player)
    if not seat then return end
	if seat == 2 and vehicleName:contains("GarbageTruck") then		
		player:SetVariable("VehicleScriptName", "GarbageTruckLeft")
		return
	end
	if seat == 3 and vehicleName:contains("GarbageTruck") then		
		player:SetVariable("VehicleScriptName", "GarbageTruckRight")
		return
	end
end

function GarbageTruck_Enter_Server(player)
	GarbageTruck_Enter(player)
end

local function GarbageTruck_Exit(player)
    sendClientCommand(player, "GarbageTruck", "PlayerExit", {})
    player:SetVariable("VehicleScriptName", "")
end

Events.OnEnterVehicle.Add(GarbageTruck_Enter)
Events.OnExitVehicle.Add(GarbageTruck_Exit)
Events.OnSwitchVehicleSeat.Add(GarbageTruck_Enter)