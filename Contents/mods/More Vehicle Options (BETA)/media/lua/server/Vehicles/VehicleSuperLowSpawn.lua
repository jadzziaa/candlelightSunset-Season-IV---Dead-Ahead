require "Vehicle/VehicleZoneDefinition"

function SuperLowSpawn()
	if SandboxVars.VehicleSuperLowSpawn then
		for zone, zoneData in pairs(VehicleZoneDistribution) do
			if type(zoneData) == "table" and zoneData.vehicles then
				for vehicle, data in pairs(zoneData.vehicles) do
					data.spawnChance = 0.05;
				end
			end
		end
	end
end
--Events.OnGameStart.Add(SuperLowSpawn);
Events.OnNewGame.Add(SuperLowSpawn);
Events.OnServerStarted.Add(SuperLowSpawn);