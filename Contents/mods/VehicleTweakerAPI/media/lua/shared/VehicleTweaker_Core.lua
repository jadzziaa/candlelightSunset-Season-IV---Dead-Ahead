-- Soul Filcher's Vehicle Tweaker Core: an API for tweaking existing vehicles without redefining them entirely.
-- Modified from DarkSlayerEX's Item Tweaker
-- Vehicle area tweaks extension by Aiteron
--Initializes the tables needed for the code to run
if not VehicleTweaker then  VehicleTweaker = {} end
if not TweakVehicle then  TweakVehicle = {} end
if not TweakVehicleData then  TweakVehicleData = {} end
if not TweakVehicleAreaData then TweakVehicleAreaData = {} end

--Prep code to make the changes to all vehicles in the TweakVehicleData table.
function VehicleTweaker.tweakVehicles()
	local vehicle;
	for k,v in pairs(TweakVehicleData) do 
		for t,y in pairs(v) do 
			vehicle = ScriptManager.instance:getVehicle(k);		
			if vehicle ~= nil then
				local module, name = k:match"([^.]*).(.*)"
				if t:contains("skin") then
					vehicle:Load(name, "{".."skin".."{ texture ="..y..",}".."}");
				elseif t == "lightbar" then
					vehicle:Load(name, "{"..t.."{ soundSiren="..y..",}".."}");
				elseif t == "model" then
					vehicle:Load(name, "{"..t.."{ file="..y..",}".."}");
				elseif t == "part" then
					vehicle:Load(name, "{"..t.. y.."}");
				else
					vehicle:Load(name, "{"..t.."="..y..",".."}");
				end
				print(k..": "..t..", "..y);
			end
		end
	end
end

function TweakVehicle(vehicleName, vehicleProperty, propertyValue)
	if not TweakVehicleData[vehicleName] then
		TweakVehicleData[vehicleName] = {};
	end
	TweakVehicleData[vehicleName][vehicleProperty] = propertyValue;
end

function VehicleTweaker.tweakVehiclesAreas()
	local vehicle;
	for k,v in pairs(TweakVehicleAreaData) do 
		for t,y in pairs(v) do 
			vehicle = ScriptManager.instance:getVehicle(k);		
			if vehicle ~= nil then
				local module, name = k:match"([^.]*).(.*)"
				vehicle:Load(name, "{".. t .."\n{\n"..y..",".."\n}\n");
				print(k..": "..t..", "..y);
			end
		end
	end
end

function TweakVehicleArea(vehicleName, vehicleProperty, propertyValue)
	if not TweakVehicleAreaData[vehicleName] then
		TweakVehicleAreaData[vehicleName] = {};
	end
	TweakVehicleAreaData[vehicleName][vehicleProperty] = propertyValue;
end

Events.OnGameBoot.Add(VehicleTweaker.tweakVehicles)
Events.OnGameBoot.Add(VehicleTweaker.tweakVehiclesAreas)


--[[
-------------------------------------------------
--------------------IMPORTANT--------------------
-------------------------------------------------

TweakVehicleArea("Base.SportsCar", "area SeatFrontLeft", "xywh = 0.6264 -0.1429 1.4725 1.4725")

You can make compatibility patches, allowing tweaks to only be applied under the proper circumstances.
Example:


		TweakVehicleData["MyMod.MyVehicle"] = { ["mechanicType"] = "3" };
		
		if getActivatedMods():contains("PaintItBlack") then 
			TweakVehicleData["MyMod.MyVehicle"] = { ["forcedColor"] = "0.0 0.0 0.0" };
		end
		

]]
