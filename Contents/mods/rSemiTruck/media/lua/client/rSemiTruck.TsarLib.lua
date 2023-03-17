require "rLib.Shared"

if not rLib.mod("tsarslib") then return end
require "CommonTemplates/ISUI/ISCommonMenu"
if type(ISCommonMenu) ~= "table" then return end

local ISCM_onAttachTrailer = ISCommonMenu.onAttachTrailer
function ISCommonMenu.onAttachTrailer(player, vehicleA, vehicleB, ...)
	ISCM_onAttachTrailer(player, vehicleA, vehicleB, ...)

	if not vehicleB then
		return
	end

	rLib.Events.Run("Vehicle.AttachVehicle", player, vehicleA, vehicleB)
end

local ISCM_onDetachTrailer = ISCommonMenu.onDetachTrailer
function ISCommonMenu.onDetachTrailer(player, vehicleA, ...)
	ISCM_onDetachTrailer(player, vehicleA, ...)

	rLib.Events.Run("Vehicle.DetachVehicle", player, vehicleA, vehicleA:getVehicleTowing())
end
