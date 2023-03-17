if VehicleZoneDistribution then

VehicleZoneDistribution.parkingstall.vehicles["Base.89def110"] = {index = -1, spawnChance = 3};
VehicleZoneDistribution.parkingstall.vehicles["Base.89def110op"] = {index = -1, spawnChance = 2};

VehicleZoneDistribution.trailerpark.vehicles["Base.89def110"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.trailerpark.vehicles["Base.89def110op"] = {index = -1, spawnChance = 2};

VehicleZoneDistribution.bad.vehicles["Base.89def110"] = {index = -1, spawnChance = 3};
VehicleZoneDistribution.bad.vehicles["Base.89def110op"] = {index = -1, spawnChance = 2};

VehicleZoneDistribution.medium.vehicles["Base.89def110"] = {index = -1, spawnChance = 7};
VehicleZoneDistribution.medium.vehicles["Base.89def110op"] = {index = -1, spawnChance = 6};

VehicleZoneDistribution.good.vehicles["Base.89def110"] = {index = -1, spawnChance = 5};
VehicleZoneDistribution.good.vehicles["Base.89def110op"] = {index = -1, spawnChance = 4};

VehicleZoneDistribution.junkyard.vehicles["Base.89def110"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.junkyard.vehicles["Base.89def110op"] = {index = -1, spawnChance = 3};

-- Military spawn --

VehicleZoneDistribution.military = VehicleZoneDistribution.military or {}
VehicleZoneDistribution.military.vehicles = VehicleZoneDistribution.military.vehicles or {}

VehicleZoneDistribution.military.vehicles["Base.89def110"] = {index = 1, spawnChance = 3};
VehicleZoneDistribution.military.vehicles["Base.89def110"] = {index = 9, spawnChance = 3};
VehicleZoneDistribution.military.vehicles["Base.89def110"] = {index = 13, spawnChance = 4};
VehicleZoneDistribution.military.vehicles["Base.89def110"] = {index = 14, spawnChance = 4};

VehicleZoneDistribution.military.vehicles["Base.89def110op"] = {index = 1, spawnChance = 3};
VehicleZoneDistribution.military.vehicles["Base.89def110op"] = {index = 9, spawnChance = 3};
VehicleZoneDistribution.military.vehicles["Base.89def110op"] = {index = 13, spawnChance = 4};
VehicleZoneDistribution.military.vehicles["Base.89def110op"] = {index = 14, spawnChance = 4};

end