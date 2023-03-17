if VehicleZoneDistribution then

-- Normal spawns --

VehicleZoneDistribution.trailerpark.vehicles["Base.80kz1000"] = {index = -1, spawnChance = 3};

VehicleZoneDistribution.junkyard.vehicles["Base.80kz1000"] = {index = -1, spawnChance = 3};

VehicleZoneDistribution.trafficjams.vehicles["Base.80kz1000"] = {index = -1, spawnChance = 4};

-- Parking spawn --

VehicleZoneDistribution.parkingstall.vehicles["Base.80kz1000"] = {index = -1, spawnChance = 3};

-- Police spawn --

VehicleZoneDistribution.police.vehicles["Base.80kz1000"] = {index = -1, spawnChance = 20};

-- Ranger spawn --

VehicleZoneDistribution.ranger.vehicles["Base.80kz1000"] = {index = -1, spawnChance = 10};

-- McCoy spawn

VehicleZoneDistribution.mccoy.vehicles["Base.80kz1000"] = {index = -1, spawnChance = 5};

-- Farm spawn --
VehicleZoneDistribution.farm = VehicleZoneDistribution.farm or {}
VehicleZoneDistribution.farm.vehicles = VehicleZoneDistribution.farm.vehicles or {}

VehicleZoneDistribution.farm.vehicles["Base.80kz1000"] = {index = -1, spawnChance = 7};

end