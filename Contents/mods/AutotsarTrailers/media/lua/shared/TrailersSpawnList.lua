if VehicleZoneDistribution then -- check if the table exists for backwards compatibility

-- Parking Stall, common parking stall with random cars, the most used one (shop parking lots, houses etc.)
VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerFirst"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerSecond"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerHome"] = {index = -1, spawnChance = 1};
-- VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerHomeExplorer"] = {index = -1, spawnChance = 1};
-- VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerHomeHartman"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerKbac"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerGenerator"] = {index = -1, spawnChance = 2};


--Trailer Parks, have a chance to spawn burnt cars, some on top of each others, it's like a pile of junk cars
VehicleZoneDistribution.trailerpark.vehicles["Base.TrailerFirst"] = {index = -1, spawnChance = 5};
VehicleZoneDistribution.trailerpark.vehicles["Base.TrailerSecond"] = {index = -1, spawnChance = 5};
-- VehicleZoneDistribution.trailerpark.vehicles["Base.TrailerHome"] = {index = -1, spawnChance = 20};
-- VehicleZoneDistribution.trailerpark.vehicles["Base.TrailerHomeExplorer"] = {index = -1, spawnChance = 10};
VehicleZoneDistribution.trailerpark.vehicles["Base.TrailerHomeHartman"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerGenerator"] = {index = -1, spawnChance = 2};

-- bad vehicles, moslty used in poor area, sometimes around pub etc.
VehicleZoneDistribution.bad.vehicles["Base.TrailerFirst"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.bad.vehicles["Base.TrailerSecond"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.bad.vehicles["Base.TrailerHome"] = {index = -1, spawnChance = 1};

-- medium vehicles, used in some of the good looking area, or in suburbs
VehicleZoneDistribution.medium.vehicles["Base.TrailerFirst"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.medium.vehicles["Base.TrailerSecond"] = {index = -1, spawnChance = 1};
-- VehicleZoneDistribution.medium.vehicles["Base.TrailerHome"] = {index = -1, spawnChance = 3};
VehicleZoneDistribution.medium.vehicles["Base.TrailerHomeExplorer"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerGenerator"] = {index = -1, spawnChance = 1};

-- good vehicles, used in good looking area, they're meant to spawn only good cars, so they're on every good looking house.
-- VehicleZoneDistribution.good.vehicles["Base.TrailerFirst"] = {index = -1, spawnChance = 5};
-- VehicleZoneDistribution.good.vehicles["Base.TrailerSecond"] = {index = -1, spawnChance = 10};
-- VehicleZoneDistribution.good.vehicles["Base.TrailerHome"] = {index = -1, spawnChance = 5};
-- VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerGenerator"] = {index = -1, spawnChance = 1};

-- junkyard, spawn damaged & burnt vehicles, less chance of finding keys but more cars.
-- also used for the random car crash.
VehicleZoneDistribution.junkyard.vehicles["Base.TrailerFirst"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.junkyard.vehicles["Base.TrailerSecond"] = {index = -1, spawnChance = 1};
-- VehicleZoneDistribution.junkyard.vehicles["Base.TrailerHome"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.junkyard.vehicles["Base.TrailerHomeExplorer"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.junkyard.vehicles["Base.TrailerHomeHartman"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.junkyard.vehicles["Base.TrailerKbac"] = {index = -1, spawnChance = 2};


-- traffic jam, mostly burnt car & damaged ones.
-- Used either for hard coded big traffic jam or smaller random ones.
VehicleZoneDistribution.trafficjamw.vehicles["Base.TrailerFirst"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamw.vehicles["Base.TrailerSecond"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamw.vehicles["Base.TrailerHome"] = {index = -1, spawnChance = 1};
-- VehicleZoneDistribution.trafficjamw.vehicles["Base.TrailerHomeExplorer"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamw.vehicles["Base.TrailerKbac"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.farm = VehicleZoneDistribution.farm or {}
VehicleZoneDistribution.farm.vehicles = VehicleZoneDistribution.farm.vehicles or {}
VehicleZoneDistribution.farm.vehicles["Base.TrailerFirst"] = {index = -1, spawnChance = 4};
VehicleZoneDistribution.farm.vehicles["Base.TrailerSecond"] = {index = -1, spawnChance = 5};
-- VehicleZoneDistribution.farm.vehicles["Base.TrailerHome"] = {index = -1, spawnChance = 10};
VehicleZoneDistribution.farm.vehicles["Base.TrailerHomeHartman"] = {index = -1, spawnChance = 4};

end