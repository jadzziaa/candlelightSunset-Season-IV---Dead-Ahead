require "VehicleZoneDefinition"

-- Parking Stalls --
VehicleZoneDistribution.parkingstall.vehicles["Base.AMC_bmw_classic"] = {index = -1, spawnChance = 3};
VehicleZoneDistribution.parkingstall.vehicles["Base.AMC_bmw_custom"] = {index = -1, spawnChance = 3};
VehicleZoneDistribution.parkingstall.vehicles["Base.AMC_harley"] = {index = -1, spawnChance = 3};
VehicleZoneDistribution.parkingstall.vehicles["Base.AMC_quad"] = {index = -1, spawnChance = 3};
VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerAMC"] = {index = -1, spawnChance = 2};

-- Trailer Parks --
VehicleZoneDistribution.trailerpark.vehicles["Base.AMC_quad"] = {index = -1, spawnChance = 3};
VehicleZoneDistribution.trailerpark.vehicles["Base.AMC_harley"] = {index = -1, spawnChance = 6};

-- Junk spawns --
VehicleZoneDistribution.junkyard.vehicles["Base.AMC_bmw_classic"] = {index = -1, spawnChance = 3};

-- Traffic Jams --
VehicleZoneDistribution.trafficjamn.vehicles["Base.AMC_harley"] = {index = -1, spawnChance = 3};
VehicleZoneDistribution.trafficjamn.vehicles["Base.AMC_bmw_classic"] = {index = -1, spawnChance = 3};

-- Special --
VehicleZoneDistribution.farm = VehicleZoneDistribution.farm or {}
VehicleZoneDistribution.farm.vehicles = VehicleZoneDistribution.farm.vehicles or {}

VehicleZoneDistribution.farm.vehicles["Base.AMC_harley"] = {index = -1, spawnChance = 9};
VehicleZoneDistribution.farm.vehicles["Base.AMC_quad"] = {index = -1, spawnChance = 9};

VehicleZoneDistribution.mccoy.vehicles["Base.AMC_quad"] = {index = -1, spawnChance = 3};

VehicleZoneDistribution.fossoil.vehicles["Base.AMC_quad"] = {index = -1, spawnChance = 3};

VehicleZoneDistribution.postal.vehicles["Base.AMC_bmw_classic"] = {index = -1, spawnChance = 6};
VehicleZoneDistribution.postal.vehicles["Base.AMC_quad"] = {index = -1, spawnChance = 3};

if VehicleZoneDistribution.sea then
    VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerAMCWaverunnerWithBody"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.sea.vehicles["Base.AMC_Waverunner"] = {index = -1, spawnChance = 20};
    VehicleZoneDistribution.river.vehicles["Base.AMC_Waverunner"] = {index = -1, spawnChance = 20};
    VehicleZoneDistribution.harbour.vehicles["Base.AMC_Waverunner"] = {index = -1, spawnChance = 20};
    VehicleZoneDistribution.smallboat.vehicles["Base.AMC_Waverunner"] = {index = -1, spawnChance = 20};
end
