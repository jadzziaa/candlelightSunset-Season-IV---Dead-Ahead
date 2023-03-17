require "VehicleZoneDefinition"

-- Parking Stalls --
VehicleZoneDistribution.parkingstall.vehicles["Rotators.SemiTruck"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.parkingstall.vehicles["Rotators.SemiTruckLite"] = {index = -1, spawnChance = 1};
--VehicleZoneDistribution.parkingstall.vehicles["Rotators.SemiTrailerVan"] = {index = -1, spawnChance = 1};
--VehicleZoneDistribution.parkingstall.vehicles["Rotators.SemiTruckBox"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.bigtrailerparkinglot = VehicleZoneDistribution.bigtrailerparkinglot or {}
VehicleZoneDistribution.bigtrailerparkinglot.vehicles = VehicleZoneDistribution.bigtrailerparkinglot.vehicles or {}
VehicleZoneDistribution.bigtrailerparkinglot.vehicles["Rotators.SemiTruck"] = {index = -1, spawnChance = 10};
VehicleZoneDistribution.bigtrailerparkinglot.vehicles["Rotators.SemiTruckLite"] = {index = -1, spawnChance = 8};
VehicleZoneDistribution.bigtrailerparkinglot.vehicles["Rotators.SemiTruckBox"] = {index = -1, spawnChance = 5};
VehicleZoneDistribution.bigtrailerparkinglot.vehicles["Rotators.SemiTrailerVan"] = {index = -1, spawnChance = 70};
VehicleZoneDistribution.bigtrailerparkinglot.vehicles["Rotators.SemiTrailerCistern"] = {index = -1, spawnChance = 25};

-- Trailer Parks --
VehicleZoneDistribution.trailerpark.vehicles["Rotators.SemiTruck"] = {index = -1, spawnChance = 1};
--VehicleZoneDistribution.trailerpark.vehicles["Rotators.SemiTrailerVan"] = {index = -1, spawnChance = 2};
--VehicleZoneDistribution.trailerpark.vehicles["Rotators.SemiTrailerCistern"] = {index = -1, spawnChance = 1};

-- Junk spawns --
VehicleZoneDistribution.junkyard.vehicles["Rotators.SemiTruck"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.junkyard.vehicles["Rotators.SemiTruckBox"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.junkyard.vehicles["Rotators.SemiTruckLite"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.junkyard.vehicles["Rotators.SemiTrailerVan"] = {index = -1, spawnChance = 1};

-- Traffic Jams --
VehicleZoneDistribution.trafficjamn.vehicles["Rotators.SemiTruck"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamn.vehicles["Rotators.SemiTrailerVan"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamn.vehicles["Rotators.SemiTrailerCistern"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.trafficjamw.vehicles["Rotators.SemiTruckBox"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamw.vehicles["Rotators.SemiTrailerVan"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamw.vehicles["Rotators.SemiTrailerCistern"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.trafficjams.vehicles["Rotators.SemiTruckLite"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjams.vehicles["Rotators.SemiTrailerVan"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjams.vehicles["Rotators.SemiTrailerCistern"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.trafficjame.vehicles["Rotators.SemiTruckBox"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjame.vehicles["Rotators.SemiTrailerVan"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjame.vehicles["Rotators.SemiTrailerCistern"] = {index = -1, spawnChance = 1};

-- Special --
VehicleZoneDistribution.farm = VehicleZoneDistribution.farm or {}
VehicleZoneDistribution.farm.vehicles = VehicleZoneDistribution.farm.vehicles or {}
VehicleZoneDistribution.farm.vehicles["Rotators.SemiTruck"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.farm.vehicles["Rotators.SemiTrailerVan"] = {index = -1, spawnChance = 10};
VehicleZoneDistribution.farm.vehicles["Rotators.SemiTrailerCistern"] = {index = -1, spawnChance = 10};

VehicleZoneDistribution.mccoy.vehicles["Rotators.SemiTruck"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.mccoy.vehicles["Rotators.SemiTruckLite"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.mccoy.vehicles["Rotators.SemiTruckBox"] = {index = -1, spawnChance = 3};
VehicleZoneDistribution.mccoy.vehicles["Rotators.SemiTrailerVan"] = {index = -1, spawnChance = 8};

VehicleZoneDistribution.fossoil.vehicles["Rotators.SemiTruck"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.fossoil.vehicles["Rotators.SemiTruckLite"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.fossoil.vehicles["Rotators.SemiTruckBox"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.fossoil.vehicles["Rotators.SemiTrailerVan"] = {index = -1, spawnChance = 5};
VehicleZoneDistribution.fossoil.vehicles["Rotators.SemiTrailerCistern"] = {index = -1, spawnChance = 8};

VehicleZoneDistribution.spiffo.vehicles["Rotators.SemiTruckBox"] = {index = -1, spawnChance = 2};
--VehicleZoneDistribution.spiffo.vehicles["Rotators.SemiTrailerVan"] = {index = -1, spawnChance = 8};

VehicleZoneDistribution.massgenfac.vehicles["Rotators.SemiTruckBox"] = {index = -1, spawnChance = 4};
--VehicleZoneDistribution.massgenfac.vehicles["Rotators.SemiTrailerVan"] = {index = -1, spawnChance = 12};

VehicleZoneDistribution.postal.vehicles["Rotators.SemiTruckBox"] = {index = -1, spawnChance = 2};
--VehicleZoneDistribution.postal.vehicles["Rotators.SemiTrailerVan"] = {index = -1, spawnChance = 1};

-- Tread's Military Vehicle Zone Defs --
-- https://steamcommunity.com/sharedfiles/filedetails/?id=2739565754
VehicleZoneDistribution.military_heavy_trailers = VehicleZoneDistribution.military_heavy_trailers or {}
VehicleZoneDistribution.military_heavy_trailers.vehicles = VehicleZoneDistribution.military_heavy_trailers.vehicles or {}
VehicleZoneDistribution.military_heavy_trailers.vehicles["Rotators.SemiTrailerVan"] = {index = -1, spawnChance = 5};
VehicleZoneDistribution.military_heavy_trailers.vehicles["Rotators.SemiTrailerCistern"] = {index = -1, spawnChance = 5};



