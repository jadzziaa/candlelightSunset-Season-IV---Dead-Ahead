-- by albion#0123
-- seriously, thanks Albion!
if isClient() then return end

local Overrides = require 'overrides/overrides'
local VehicleOverrides = {}
VehicleOverrides.vehicleToSkin = require "overrides/vehicledefinitions"

VehicleOverrides.changeVehicleSkin = function(vehicle, skin)
    vehicle:setSkinIndex(skin)
    vehicle:updateSkin()
    vehicle:transmitSkinIndex()
end

VehicleOverrides.overrideVehicle = function(vehicle)
    local script = vehicle:getScriptName()
    local skinTable = VehicleOverrides.vehicleToSkin[script]
    if not skinTable then return end
    if skinTable.Replace then
        if not (vehicle:getSkinIndex() == skinTable.Replace) then return end -- only replace certain skins: this is lazily done right now because there is only one use for it yet
    end

    local x = vehicle:getX()
    local y = vehicle:getY()
    local zone
    if skinTable['Police'] then
        zone = Overrides.getZone(x,y,Overrides.zonesPolice)
    else
        zone = Overrides.getZone(x,y)
    end

    local newSkin = skinTable[zone]
    if not newSkin then newSkin = skinTable['Meade'] end

    if type(newSkin) == 'table' then newSkin = newSkin[ZombRand(1, #newSkin+1)] end
    newSkin = newSkin + skinTable.offset

    VehicleOverrides.changeVehicleSkin(vehicle, newSkin)
end

local old_create_engine = Vehicles.Create.Engine
function Vehicles.Create.Engine(vehicle, part)
	old_create_engine(vehicle, part)
	if SandboxVars.STR.VehicleOverrides and getWorld():getMap():contains("Muldraugh, KY") then
		VehicleOverrides.overrideVehicle(vehicle)
	end
end

return VehicleOverrides