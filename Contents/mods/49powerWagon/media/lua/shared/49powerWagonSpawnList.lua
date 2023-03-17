if VehicleZoneDistribution then

VehicleZoneDistribution.parkingstall.vehicles["Base.49powerWagon"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.parkingstall.vehicles["Base.49powerWagonPD"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.trailerpark.vehicles["Base.49powerWagon"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.trailerpark.vehicles["Base.49powerWagonPA"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.bad.vehicles["Base.49powerWagon"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.good.vehicles["Base.49powerWagon"] = {index = -1, spawnChance = 2};

VehicleZoneDistribution.junkyard.vehicles["Base.49powerWagon"] = {index = -1, spawnChance = 3};
VehicleZoneDistribution.junkyard.vehicles["Base.49powerWagonPD"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.trafficjams.vehicles["Base.49powerWagon"] = {index = -1, spawnChance = 3};

VehicleZoneDistribution.police.vehicles["Base.49powerWagonPD"] = {index = -1, spawnChance = 20};
VehicleZoneDistribution.police.vehicles["Base.49powerWagonMP"] = {index = -1, spawnChance = 10};

VehicleZoneDistribution.ranger.vehicles["Base.49powerWagonPD"] = {index = -1, spawnChance = 5};
VehicleZoneDistribution.ranger.vehicles["Base.49powerWagonMP"] = {index = -1, spawnChance = 5};

VehicleZoneDistribution.farm = VehicleZoneDistribution.farm or {}
VehicleZoneDistribution.farm.vehicles = VehicleZoneDistribution.farm.vehicles or {}
VehicleZoneDistribution.farm.vehicles["Base.49powerWagon"] = {index = -1, spawnChance = 15};
VehicleZoneDistribution.farm.vehicles["Base.49powerWagonPD"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.farm.vehicles["Base.49powerWagonMP"] = {index = -1, spawnChance = 10};

end