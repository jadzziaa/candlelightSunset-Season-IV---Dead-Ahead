if VehicleZoneDistribution then

-- Normal spawns --

VehicleZoneDistribution.good.vehicles["Base.28ss100"] = {index = -1, spawnChance = 6};
VehicleZoneDistribution.good.vehicles["Base.28ss100hermes"] = {index = -1, spawnChance = 3};

VehicleZoneDistribution.junkyard.vehicles["Base.28ss100"] = {index = -1, spawnChance = 2};

VehicleZoneDistribution.trafficjams.vehicles["Base.28ss100"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.trafficjams.vehicles["Base.28ss100hermes"] = {index = -1, spawnChance = 2};

-- Parking spawn --

VehicleZoneDistribution.parkingstall.vehicles["Base.28ss100"] = {index = -1, spawnChance = 2};


-- McCoy spawn

VehicleZoneDistribution.mccoy.vehicles["Base.28ss100"] = {index = -1, spawnChance = 3};

-- Farm spawn --
VehicleZoneDistribution.farm = VehicleZoneDistribution.farm or {}
VehicleZoneDistribution.farm.vehicles = VehicleZoneDistribution.farm.vehicles or {}

VehicleZoneDistribution.farm.vehicles["Base.28ss100"] = {index = -1, spawnChance = 5};

end