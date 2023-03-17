if VehicleZoneDistribution then

VehicleZoneDistribution.parkingstall.vehicles["Base.91range"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.parkingstall.vehicles["Base.91range2"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.trailerpark.vehicles["Base.91range"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.trailerpark.vehicles["Base.91range2"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.bad.vehicles["Base.91range"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.bad.vehicles["Base.91range2"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.medium.vehicles["Base.91range"] = {index = -1, spawnChance = 3};
VehicleZoneDistribution.medium.vehicles["Base.91range2"] = {index = -1, spawnChance = 4};

VehicleZoneDistribution.good.vehicles["Base.91range"] = {index = -1, spawnChance = 7};
VehicleZoneDistribution.good.vehicles["Base.91range2"] = {index = -1, spawnChance = 8};

VehicleZoneDistribution.junkyard.vehicles["Base.91range"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.junkyard.vehicles["Base.91range2"] = {index = -1, spawnChance = 1};

-- Military spawn --

VehicleZoneDistribution.military = VehicleZoneDistribution.military or {}
VehicleZoneDistribution.military.vehicles = VehicleZoneDistribution.military.vehicles or {}

VehicleZoneDistribution.military.vehicles["Base.91range"] = {index = 5, spawnChance = 4};
VehicleZoneDistribution.military.vehicles["Base.91range"] = {index = 6, spawnChance = 4};
VehicleZoneDistribution.military.vehicles["Base.91range"] = {index = 9, spawnChance = 6};

VehicleZoneDistribution.military.vehicles["Base.91range2"] = {index = 5, spawnChance = 4};
VehicleZoneDistribution.military.vehicles["Base.91range2"] = {index = 6, spawnChance = 4};
VehicleZoneDistribution.military.vehicles["Base.91range2"] = {index = 9, spawnChance = 6};

end