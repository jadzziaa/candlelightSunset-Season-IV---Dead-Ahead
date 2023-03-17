if VehicleZoneDistribution then

VehicleZoneDistribution.parkingstall.vehicles["Base.90niva"] = {index = -1, spawnChance = 5};

VehicleZoneDistribution.trailerpark.vehicles["Base.90niva"] = {index = -1, spawnChance = 5};

VehicleZoneDistribution.bad.vehicles["Base.90niva"] = {index = -1, spawnChance = 7};

VehicleZoneDistribution.medium.vehicles["Base.90niva"] = {index = -1, spawnChance = 6};

VehicleZoneDistribution.good.vehicles["Base.90niva"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.junkyard.vehicles["Base.90niva"] = {index = -1, spawnChance = 4};

-- Military spawn --

VehicleZoneDistribution.military = VehicleZoneDistribution.military or {}
VehicleZoneDistribution.military.vehicles = VehicleZoneDistribution.military.vehicles or {}

VehicleZoneDistribution.military.vehicles["Base.90niva"] = {index = 8, spawnChance = 5};
VehicleZoneDistribution.military.vehicles["Base.90niva"] = {index = 9, spawnChance = 5};

end