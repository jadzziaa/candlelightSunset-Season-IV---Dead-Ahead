if VehicleZoneDistribution then

VehicleZoneDistribution.parkingstall.vehicles["Base.89def90"] = {index = -1, spawnChance = 3};
VehicleZoneDistribution.parkingstall.vehicles["Base.89def90op"] = {index = -1, spawnChance = 2};

VehicleZoneDistribution.trailerpark.vehicles["Base.89def90"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.trailerpark.vehicles["Base.89def90op"] = {index = -1, spawnChance = 2};

VehicleZoneDistribution.bad.vehicles["Base.89def90"] = {index = -1, spawnChance = 3};
VehicleZoneDistribution.bad.vehicles["Base.89def90op"] = {index = -1, spawnChance = 2};

VehicleZoneDistribution.medium.vehicles["Base.89def90"] = {index = -1, spawnChance = 6};
VehicleZoneDistribution.medium.vehicles["Base.89def90op"] = {index = -1, spawnChance = 6};

VehicleZoneDistribution.good.vehicles["Base.89def90"] = {index = -1, spawnChance = 5};
VehicleZoneDistribution.good.vehicles["Base.89def90op"] = {index = -1, spawnChance = 4};

VehicleZoneDistribution.junkyard.vehicles["Base.89def90"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.junkyard.vehicles["Base.89def90op"] = {index = -1, spawnChance = 2};

-- Military spawn --

VehicleZoneDistribution.military = VehicleZoneDistribution.military or {}
VehicleZoneDistribution.military.vehicles = VehicleZoneDistribution.military.vehicles or {}

VehicleZoneDistribution.military.vehicles["Base.89def90"] = {index = 1, spawnChance = 4};
VehicleZoneDistribution.military.vehicles["Base.89def90"] = {index = 9, spawnChance = 4};
VehicleZoneDistribution.military.vehicles["Base.89def90"] = {index = 13, spawnChance = 6};

VehicleZoneDistribution.military.vehicles["Base.89def90op"] = {index = 1, spawnChance = 4};
VehicleZoneDistribution.military.vehicles["Base.89def90op"] = {index = 9, spawnChance = 4};
VehicleZoneDistribution.military.vehicles["Base.89def90op"] = {index = 13, spawnChance = 6};

end