if VehicleZoneDistribution then

VehicleZoneDistribution.parkingstall.vehicles["Base.87cruiser"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.parkingstall.vehicles["Base.87cruiserLights"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.parkingstall.vehicles["Base.87cruiserRoofrack"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.trailerpark.vehicles["Base.87cruiser"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.trailerpark.vehicles["Base.87cruiserLights"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.trailerpark.vehicles["Base.87cruiserRoofrack"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.bad.vehicles["Base.87cruiser"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.bad.vehicles["Base.87cruiserLights"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.bad.vehicles["Base.87cruiserRoofrack"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.medium.vehicles["Base.87cruiser"] = {index = -1, spawnChance = 3};
VehicleZoneDistribution.medium.vehicles["Base.87cruiserLights"] = {index = -1, spawnChance = 3};
VehicleZoneDistribution.medium.vehicles["Base.87cruiserRoofrack"] = {index = -1, spawnChance = 2};

VehicleZoneDistribution.good.vehicles["Base.87cruiser"] = {index = -1, spawnChance = 4};
VehicleZoneDistribution.good.vehicles["Base.87cruiserLights"] = {index = -1, spawnChance = 4};
VehicleZoneDistribution.good.vehicles["Base.87cruiserRoofrack"] = {index = -1, spawnChance = 3};

VehicleZoneDistribution.junkyard.vehicles["Base.87cruiser"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.junkyard.vehicles["Base.87cruiserLights"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.junkyard.vehicles["Base.87cruiserRoofrack"] = {index = -1, spawnChance = 0};

-- Military spawn --

VehicleZoneDistribution.military = VehicleZoneDistribution.military or {}
VehicleZoneDistribution.military.vehicles = VehicleZoneDistribution.military.vehicles or {}

VehicleZoneDistribution.military.vehicles["Base.87cruiserRoofrack"] = {index = 1, spawnChance = 4};
VehicleZoneDistribution.military.vehicles["Base.87cruiserRoofrack"] = {index = 3, spawnChance = 4};
VehicleZoneDistribution.military.vehicles["Base.87cruiserRoofrack"] = {index = 5, spawnChance = 6};

end