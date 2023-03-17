require "fhqExpandedVehSpawns"


if VehicleZoneDistribution then
	--set up the spawn defs, in the event that they're loaded out of order, possibly caused by debug mode--
	
	VehicleZoneDistribution.collectors = VehicleZoneDistribution.collectors or {};
	VehicleZoneDistribution.collectors.vehicles = VehicleZoneDistribution.collectors.vehicles or {};
	
	VehicleZoneDistribution.exotic = VehicleZoneDistribution.exotic or {};
	VehicleZoneDistribution.exotic.vehicles = VehicleZoneDistribution.exotic.vehicles or {};
	
	VehicleZoneDistribution.barnfind = VehicleZoneDistribution.barnfind or {};
	VehicleZoneDistribution.barnfind.vehicles = VehicleZoneDistribution.barnfind.vehicles or {};
	
	VehicleZoneDistribution.expocarshow = VehicleZoneDistribution.expocarshow or {};
	VehicleZoneDistribution.expocarshow.vehicles = VehicleZoneDistribution.expocarshow.vehicles or {};
	
	VehicleZoneDistribution.specialdealer = VehicleZoneDistribution.specialdealer or {};
	VehicleZoneDistribution.specialdealer.vehicles = VehicleZoneDistribution.specialdealer.vehicles or {};
	
	VehicleZoneDistribution.newdealer = VehicleZoneDistribution.newdealer or {};
	VehicleZoneDistribution.newdealer.vehicles = VehicleZoneDistribution.newdealer.vehicles or {};
	
	VehicleZoneDistribution.commercial = VehicleZoneDistribution.commercial or {};
	VehicleZoneDistribution.commercial.vehicles = VehicleZoneDistribution.commercial.vehicles or {};
	
	VehicleZoneDistribution.utility = VehicleZoneDistribution.utility or {};
	VehicleZoneDistribution.utility.vehicles = VehicleZoneDistribution.utility.vehicles or {};
	
	VehicleZoneDistribution.commerciallarge = VehicleZoneDistribution.commerciallarge or {};
	VehicleZoneDistribution.commerciallarge.vehicles = VehicleZoneDistribution.commerciallarge.vehicles or {};
	
	VehicleZoneDistribution.busservice = VehicleZoneDistribution.busservice or {};
	VehicleZoneDistribution.busservice.vehicles = VehicleZoneDistribution.busservice.vehicles or {};
	
	VehicleZoneDistribution.busstation = VehicleZoneDistribution.busstation or {};
	VehicleZoneDistribution.busstation.vehicles = VehicleZoneDistribution.busstation.vehicles or {};
	
	VehicleZoneDistribution.trailerhuge = VehicleZoneDistribution.trailerhuge or {};
	VehicleZoneDistribution.trailerhuge.vehicles = VehicleZoneDistribution.trailerhuge.vehicles or {};
	
	VehicleZoneDistribution.amateurmechanic = VehicleZoneDistribution.amateurmechanic or {};
	VehicleZoneDistribution.amateurmechanic.vehicles = VehicleZoneDistribution.amateurmechanic.vehicles or {};
	
	VehicleZoneDistribution.towservice = VehicleZoneDistribution.towservice or {};
	VehicleZoneDistribution.towservice.vehicles = VehicleZoneDistribution.towservice.vehicles or {};
	
	VehicleZoneDistribution.import = VehicleZoneDistribution.import or {};
	VehicleZoneDistribution.import.vehicles = VehicleZoneDistribution.import.vehicles or {};
	
	VehicleZoneDistribution.useddealer = VehicleZoneDistribution.useddealer or {};
	VehicleZoneDistribution.useddealer.vehicles = VehicleZoneDistribution.useddealer.vehicles or {};
	
	VehicleZoneDistribution.racing = VehicleZoneDistribution.racing or {};
	VehicleZoneDistribution.racing.vehicles = VehicleZoneDistribution.racing.vehicles or {};
	
	VehicleZoneDistribution.drift = VehicleZoneDistribution.drift or {};
	VehicleZoneDistribution.drift.vehicles = VehicleZoneDistribution.drift.vehicles or {};
	
	VehicleZoneDistribution.trailerutility = VehicleZoneDistribution.trailerutility or {};
	VehicleZoneDistribution.trailerutility.vehicles = VehicleZoneDistribution.trailerutility.vehicles or {};
	
	VehicleZoneDistribution.movers = VehicleZoneDistribution.movers or {};
	VehicleZoneDistribution.movers.vehicles = VehicleZoneDistribution.movers.vehicles or {};
	
	VehicleZoneDistribution.construction = VehicleZoneDistribution.construction or {};
	VehicleZoneDistribution.construction.vehicles = VehicleZoneDistribution.construction.vehicles or {};
	
	VehicleZoneDistribution.wasteservice = VehicleZoneDistribution.wasteservice or {};
	VehicleZoneDistribution.wasteservice.vehicles = VehicleZoneDistribution.wasteservice.vehicles or {};
	
	VehicleZoneDistribution.recreational = VehicleZoneDistribution.recreational or {};
	VehicleZoneDistribution.recreational.vehicles = VehicleZoneDistribution.recreational.vehicles or {};
	
	VehicleZoneDistribution.pacecar = VehicleZoneDistribution.pacecar or {};
	VehicleZoneDistribution.pacecar.vehicles = VehicleZoneDistribution.pacecar.vehicles or {};
	
	VehicleZoneDistribution.heistvehicle = VehicleZoneDistribution.heistvehicle or {};
	VehicleZoneDistribution.heistvehicle.vehicles = VehicleZoneDistribution.heistvehicle.vehicles or {};
	
	VehicleZoneDistribution.policelarge = VehicleZoneDistribution.policelarge or {};
	VehicleZoneDistribution.policelarge.vehicles = VehicleZoneDistribution.policelarge.vehicles or {};
	
	VehicleZoneDistribution.policeonly = VehicleZoneDistribution.policeonly or {};
	VehicleZoneDistribution.policeonly.vehicles = VehicleZoneDistribution.policeonly.vehicles or {};
	
	VehicleZoneDistribution.ambulanceonly = VehicleZoneDistribution.ambulanceonly or {};
	VehicleZoneDistribution.ambulanceonly.vehicles = VehicleZoneDistribution.ambulanceonly.vehicles or {};
	
	VehicleZoneDistribution.fireonly = VehicleZoneDistribution.fireonly or {};
	VehicleZoneDistribution.fireonly.vehicles = VehicleZoneDistribution.fireonly.vehicles or {};
	
	VehicleZoneDistribution.firelarge = VehicleZoneDistribution.firelarge or {};
	VehicleZoneDistribution.firelarge.vehicles = VehicleZoneDistribution.firelarge.vehicles or {};
	
	VehicleZoneDistribution.mccoyonly = VehicleZoneDistribution.mccoyonly or {};
	VehicleZoneDistribution.mccoyonly.vehicles = VehicleZoneDistribution.mccoyonly.vehicles or {};
	
	VehicleZoneDistribution.postalonly = VehicleZoneDistribution.postalonly or {};
	VehicleZoneDistribution.postalonly.vehicles = VehicleZoneDistribution.postalonly.vehicles or {};
	
	VehicleZoneDistribution.postallarge = VehicleZoneDistribution.postallarge or {};
	VehicleZoneDistribution.postallarge.vehicles = VehicleZoneDistribution.postallarge.vehicles or {};
	
	VehicleZoneDistribution.vehicletiny = VehicleZoneDistribution.vehicletiny or {};
	VehicleZoneDistribution.vehicletiny.vehicles = VehicleZoneDistribution.vehicletiny.vehicles or {};
	
	VehicleZoneDistribution.mower = VehicleZoneDistribution.mower or {};
	VehicleZoneDistribution.mower.vehicles = VehicleZoneDistribution.mower.vehicles or {};
	
	VehicleZoneDistribution.trailertiny = VehicleZoneDistribution.trailertiny or {};
	VehicleZoneDistribution.trailertiny.vehicles = VehicleZoneDistribution.trailertiny.vehicles or {};
	
	VehicleZoneDistribution.hotpursuit = VehicleZoneDistribution.hotpursuit or {};
	VehicleZoneDistribution.hotpursuit.vehicles = VehicleZoneDistribution.hotpursuit.vehicles or {};

end

if getActivatedMods():contains("KVsNearlyNew") and VehicleZoneDistribution then

	--------------------------------New spawn zones--------------------------------

	---Collectors: Rare spawn zones with a high chance for rare cars. Cars here should be exotics, and especially rare vintage cars. High end cars can also be included, but at a lower spawn rate than exotics---

	VehicleZoneDistribution.collectors.vehicles["Base.30president"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.collectors.vehicles["Base.amphicar"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.collectors.vehicles["Base.30hotrod"] = {index = -1, spawnChance = 20};

	---Barn Find: Rare spawn zone usually near barns. Prioritize classics, especially rare ones, here. Cars in this list will almost be wrecked and may be undrivable, requiring towing. High key chance ---

	VehicleZoneDistribution.barnfind.vehicles["Base.30president"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.barnfind.vehicles["Base.amphicar"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.barnfind.vehicles["Base.fiat500"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.barnfind.vehicles["Base.30hotrod"] = {index = -1, spawnChance = 20};

	---Expo Car Show: These zones will be near expo centers, or other places where there may be large car shows. Here you will find exotics, race cars, and vintage classics---

	VehicleZoneDistribution.expocarshow.vehicles["Base.30president"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.expocarshow.vehicles["Base.amphicar"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.expocarshow.vehicles["Base.30hotrod"] = {index = -1, spawnChance = 10};

	---Special Dealer: Specialty car dealer zone. This should contain exotics and imports mostly, as well as restored classics. Possibility for a race/concept car as a display car. HIgher condition and key chance ---

	VehicleZoneDistribution.specialdealer.vehicles["Base.30president"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.specialdealer.vehicles["Base.amphicar"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.specialdealer.vehicles["Base.fiat500"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.specialdealer.vehicles["Base.30hotrod"] = {index = -1, spawnChance = 10};

	---Amateur Mechanic: Amateur mechanic style house. Should contain special custom variants of vehicles, as well as a lower chance for their stock counterparts. Could also contain restored classics---

	VehicleZoneDistribution.amateurmechanic.vehicles["Base.30president"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.amateurmechanic.vehicles["Base.30hotrod"] = {index = -1, spawnChance = 15};

	---Import: Cars unavailable in the US, but available elsewhere. Near shipping areas, such as docks, railyards, and airports.---

	VehicleZoneDistribution.import.vehicles["Base.amphicar"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.import.vehicles["Base.fiat500"] = {index = -1, spawnChance = 40};

	---Used Dealer: Zone for used car dealers. Should contain older cars, but newer cars can also be included as well. Higher key chance, lower condition.---

	VehicleZoneDistribution.useddealer.vehicles["Base.fiat500"] = {index = -1, spawnChance = 5};

	---Racing: Race cars and other track-based vehicles should go here.---

	VehicleZoneDistribution.racing.vehicles["Base.30hotrod"] = {index = -1, spawnChance = 10};

	
end

if getActivatedMods():contains("FRUsedCars") and VehicleZoneDistribution then

	VehicleZoneDistribution.collectors.vehicles["Base.79datsun280z"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.collectors.vehicles["Base.77transam"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.collectors.vehicles["Base.69chargerdaytona"] = {index = -1, spawnChance = 20};

	VehicleZoneDistribution.barnfind.vehicles["Base.51chevy3100old"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.barnfind.vehicles["Base.64mustang"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.barnfind.vehicles["Base.69charger"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.barnfind.vehicles["Base.65gto"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.barnfind.vehicles["Base.69chargerdaytona"] = {index = -1, spawnChance = 20};

	VehicleZoneDistribution.expocarshow.vehicles["Base.generallee"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.expocarshow.vehicles["Base.pursuitspecial"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.expocarshow.vehicles["Base.92wranglerjurassic"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.expocarshow.vehicles["Base.93explorerjurassic"] = {index = -1, spawnChance = 10};

	VehicleZoneDistribution.specialdealer.vehicles["Base.pursuitspecial"] = {index = -1, spawnChance = 3};
	VehicleZoneDistribution.specialdealer.vehicles["Base.73falcon"] = {index = -1, spawnChance = 35};

	VehicleZoneDistribution.newdealer.vehicles["Base.90corolla"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.91celica"] = {index = -1, spawnChance = 17};
	VehicleZoneDistribution.newdealer.vehicles["Base.91wagoneer"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.92crownvic"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.92wrangler"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.93explorer"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93jeepcherokee"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.91chevys10"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.91chevys10ext"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.91crx"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.astrovan"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.90ramlb"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.90ramsb"] = {index = -1, spawnChance = 20};

	VehicleZoneDistribution.amateurmechanic.vehicles["Base.pursuitspecial"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.amateurmechanic.vehicles["Base.73falcon"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.amateurmechanic.vehicles["Base.69chargerdaytona"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.amateurmechanic.vehicles["Base.51chevy3100"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.amateurmechanic.vehicles["Base.51chevy3100old"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.amateurmechanic.vehicles["Base.64mustang"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.amateurmechanic.vehicles["Base.65gto"] = {index = -1, spawnChance = 15};

	VehicleZoneDistribution.import.vehicles["Base.73falcon"] = {index = -1, spawnChance = 35};

	VehicleZoneDistribution.useddealer.vehicles["Base.65gto"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.useddealer.vehicles["Base.77transam"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.useddealer.vehicles["Base.69charger"] = {index = -1, spawnChance = 8};
	VehicleZoneDistribution.useddealer.vehicles["Base.64mustang"] = {index = -1, spawnChance = 6};
	VehicleZoneDistribution.useddealer.vehicles["Base.79brougham"] = {index = -1, spawnChance = 12};
	VehicleZoneDistribution.useddealer.vehicles["Base.73pinto"] = {index = -1, spawnChance = 12};
	VehicleZoneDistribution.useddealer.vehicles["Base.72beetle"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.71impala"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.70chevelle"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.70elcamino"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.68wildcat"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.68wildcatconvert"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.68elcamino"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.80f350"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.83hilux"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.85vicsed"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.useddealer.vehicles["Base.85vicwag"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.useddealer.vehicles["Base.85vicwag2"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.useddealer.vehicles["Base.86econoline"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.useddealer.vehicles["Base.86yugo"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.87blazer"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.87c10lb"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.87c10sb"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.87caprice"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.useddealer.vehicles["Base.87suburban"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.90corolla"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.90ramlb"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.90ramsb"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.astrovan"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.volvo244"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.useddealer.vehicles["Base.91crx"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.92crownvic"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.71chevyc10stepside"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.useddealer.vehicles["Base.71chevyc10lb"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.useddealer.vehicles["Base.71chevyc10sb"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.useddealer.vehicles["Base.91chevys10"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.useddealer.vehicles["Base.91chevys10ext"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.useddealer.vehicles["Base.86montecarlo"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.useddealer.vehicles["Base.91wagoneer"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.86econolinerv"] = {index = -1, spawnChance = 10};

	VehicleZoneDistribution.utility.vehicles["Base.87c10lb"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.utility.vehicles["Base.87c10sb"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.utility.vehicles["Base.90ramlb"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.utility.vehicles["Base.90ramsb"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.utility.vehicles["Base.91chevys10"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.utility.vehicles["Base.91chevys10ext"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.utility.vehicles["Base.80f350"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.utility.vehicles["Base.80f350quad"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.utility.vehicles["Base.83hilux"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.utility.vehicles["Base.51chevy3100"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.utility.vehicles["Base.51chevy3100old"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.utility.vehicles["Base.70elcamino"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.utility.vehicles["Base.86econoline"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.utility.vehicles["Base.86econolineflorist"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.utility.vehicles["Base.f700propane"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.utility.vehicles["Base.moveurself"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.utility.vehicles["Base.Trailermovingmedium"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.utility.vehicles["Base.Trailermovingbig"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.utility.vehicles["Base.Trailer51chevy"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.utility.vehicles["Base.Trailerfuelmedium"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.utility.vehicles["Base.Trailerfuelsmall"] = {index = -1, spawnChance = 5};

	VehicleZoneDistribution.commercial.vehicles["Base.isuzubox"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.commercial.vehicles["Base.isuzuboxfood"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.commercial.vehicles["Base.isuzuboxmccoy"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.commercial.vehicles["Base.86econoline"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.commercial.vehicles["Base.chevystepvan"] = {index = -1, spawnChance = 20};

	VehicleZoneDistribution.commerciallarge.vehicles["Base.isuzubox"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.f700box"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.chevystepvan"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.f700flatbed"] = {index = -1, spawnChance = 17};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.isuzuboxmccoy"] = {index = -1, spawnChance = 10};

	VehicleZoneDistribution.trailerutility.vehicles["Base.Trailermovingmedium"] = {index = -1, spawnChance = 40};
	VehicleZoneDistribution.trailerutility.vehicles["Base.Trailermovingbig"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.trailerutility.vehicles["Base.Trailerfuelsmall"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.trailerutility.vehicles["Base.Trailer51chevy"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.trailerutility.vehicles["Base.Trailercamperscamp"] = {index = -1, spawnChance = 20};
	
	VehicleZoneDistribution.construction.vehicles["Base.f700dump"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.construction.vehicles["Base.f700propane"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.construction.vehicles["Base.isuzuboxmccoy"] = {index = -1, spawnChance = 15};
	
	VehicleZoneDistribution.movers.vehicles["Base.86econoline"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.movers.vehicles["Base.moveurself"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.movers.vehicles["Base.Trailermovingbig"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.movers.vehicles["Base.Trailermovingmedium"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.movers.vehicles["Base.chevystepvan"] = {index = -1, spawnChance = 10};
	
	VehicleZoneDistribution.recreational.vehicles["Base.86bounder"] = {index = 2, spawnChance = 50};
	VehicleZoneDistribution.recreational.vehicles["Base.86econolinerv"] = {index = 2, spawnChance = 50};
	VehicleZoneDistribution.recreational.vehicles["Base.Trailercamperscamp"] = {index = 2, spawnChance = 20};

	VehicleZoneDistribution.racing.vehicles["Base.69chargerdaytona"] = {index = -1, spawnChance = 15};

	VehicleZoneDistribution.policelarge.vehicles["Base.chevystepvanswat"] = {index = -1, spawnChance = 20};

	VehicleZoneDistribution.policeonly.vehicles["Base.85vicsheriff"] = {index = -1, spawnChance = 50};
	VehicleZoneDistribution.policeonly.vehicles["Base.87capricePD"] = {index = -1, spawnChance = 40};
	VehicleZoneDistribution.policeonly.vehicles["Base.91blazerpd"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.policeonly.vehicles["Base.92crownvicPD"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.policeonly.vehicles["Base.chevystepvanswat"] = {index = -1, spawnChance = 5};

	VehicleZoneDistribution.ambulanceonly.vehicles["Base.80f350ambulance"] = {index = 0, spawnChance = 200};
	VehicleZoneDistribution.ambulanceonly.vehicles["Base.86econolineambulance"] = {index = 0, spawnChance = 150};

	VehicleZoneDistribution.fireonly.vehicles["Base.87c10fire"] = {index = 0, spawnChance = 100};
	VehicleZoneDistribution.fireonly.vehicles["Base.firepumper"] = {index = 0, spawnChance = 50};
	
	VehicleZoneDistribution.firelarge.vehicles["Base.firepumper"] = {index = 0, spawnChance = 100};
	
	VehicleZoneDistribution.mccoyonly.vehicles["Base.87c10mccoy"] = {index = 2, spawnChance = 50};
	VehicleZoneDistribution.mccoyonly.vehicles["Base.isuzuboxmccoy"] = {index = 2, spawnChance = 20};
	VehicleZoneDistribution.mccoyonly.vehicles["Base.f700flatbed"] = {index = 1, spawnChance = 15};
	
end

if getActivatedMods():contains("67commando") and VehicleZoneDistribution then

	VehicleZoneDistribution.policelarge.vehicles["Base.67commandoPolice"] = {index = -1, spawnChance = 10};

	VehicleZoneDistribution.policeonly.vehicles["Base.67commandoPolice"] = {index = -1, spawnChance = 3};
	
end

if getActivatedMods():contains("82oshkoshM911") and VehicleZoneDistribution then

	VehicleZoneDistribution.commerciallarge.vehicles["Base.82oshkoshM911"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.82oshkoshM911B"] = {index = -1, spawnChance = 9};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.TrailerM127stake"] = {index = -1, spawnChance = 3};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.TrailerM128van"] = {index = -1, spawnChance = 3};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.TrailerM129van"] = {index = -1, spawnChance = 3};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.TrailerM747lowbed"] = {index = -1, spawnChance = 3};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.TrailerM967tanker"] = {index = -1, spawnChance = 2};

	VehicleZoneDistribution.trailerhuge.vehicles["Base.TrailerM127stake"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.trailerhuge.vehicles["Base.TrailerM128van"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.trailerhuge.vehicles["Base.TrailerM129van"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.trailerhuge.vehicles["Base.TrailerM747lowbed"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.trailerhuge.vehicles["Base.TrailerM967tanker"] = {index = -1, spawnChance = 3};
	
end

if getActivatedMods():contains("P.A.R.C") and VehicleZoneDistribution then

	VehicleZoneDistribution.commercial.vehicles["Base.GAZEL_VAN"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.commercial.vehicles["Base.GAZEL_TENT"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.commercial.vehicles["Base.GAZEL"] = {index = -1, spawnChance = 10};

	VehicleZoneDistribution.commerciallarge.vehicles["Base.KAMAZ"] = {index = -1, spawnChance = 10};
	
end

if getActivatedMods():contains("rSemiTruck") and VehicleZoneDistribution then

	VehicleZoneDistribution.commercial.vehicles["Rotators.SemiTruckBox"] = {index = -1, spawnChance = 30};

	VehicleZoneDistribution.commerciallarge.vehicles["Rotators.SemiTruckBox"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.commerciallarge.vehicles["Rotators.SemiTruck"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.commerciallarge.vehicles["Rotators.SemiTruckLite"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.commerciallarge.vehicles["Rotators.SemiTrailerVan"] = {index = -1, spawnChance = 4};
	VehicleZoneDistribution.commerciallarge.vehicles["Rotators.SemiTrailerCistern"] = {index = -1, spawnChance = 2};

	VehicleZoneDistribution.trailerhuge.vehicles["Rotators.SemiTrailerVan"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.trailerhuge.vehicles["Rotators.SemiTrailerCistern"] = {index = -1, spawnChance = 8};
	
end

if getActivatedMods():contains("DeLoreanDMC-12") and VehicleZoneDistribution then

	VehicleZoneDistribution.collectors.vehicles["Base.deloreandmc12"] = {index = -1, spawnChance = 15};
	
end

if getActivatedMods():contains("1989Porsche911Turbo") and VehicleZoneDistribution then

	VehicleZoneDistribution.specialdealer.vehicles["Base.89porshce911turbo"] = {index = -1, spawnChance = 20};

	VehicleZoneDistribution.newdealer.vehicles["Base.89porshce911turbo"] = {index = -1, spawnChance = 10};

	VehicleZoneDistribution.collectors.vehicles["Base.89porshce911turbo"] = {index = -1, spawnChance = 20};
	
end

if getActivatedMods():contains("93lorevehiclepack") and VehicleZoneDistribution then

	VehicleZoneDistribution.collectors.vehicles["Base.93dodgeviper"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.collectors.vehicles["Base.92typhoon"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.collectors.vehicles["Base.92syclone"] = {index = -1, spawnChance = 10};

	VehicleZoneDistribution.specialdealer.vehicles["Base.93dodgeviper"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.specialdealer.vehicles["Base.92typhoon"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.specialdealer.vehicles["Base.92syclone"] = {index = -1, spawnChance = 30};

	VehicleZoneDistribution.newdealer.vehicles["Base.92premiersts"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.93grandamsedan"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93fleetwood"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93markviii"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93lhs"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.92Jimmy"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93yukon"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93tahoe"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93suburban"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93gmcsuburban"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93continental"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.92bronco"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.92typhoon"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.93gmcblazer"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93blazer"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93aurora"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.92vision"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.92grandmarquis"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.92intrepid"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.92concord"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.91oldsmobilecustomcrusier"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.91dynasty"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.91caprice"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.91buickroadmaster"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.93sevillests"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.92deville"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.90crownvictoria"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.90caprice"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.92crownvictoria"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93crownvictoria"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.93capriceLTZ"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.93capriceclassic"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.93fordthunderbird"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.93taurus"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.93lumiasedan"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.90regalsedan"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.90supreme"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.90tornado"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.93transam"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.93elderado"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.92grandprix"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.90laser"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.92lumiacoupe"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.93camaro"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.93corvette"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.90beretta"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.93dodgeviper"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.newdealer.vehicles["Base.92syclone"] = {index = -1, spawnChance = 17};
	VehicleZoneDistribution.newdealer.vehicles["Base.93G10van"] = {index = -1, spawnChance = 17};
	VehicleZoneDistribution.newdealer.vehicles["Base.93c10vanshort"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.90electra"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.90grandamsedan"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.90customcruiser"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.90customcruiser"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.90cutlessciera"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.90skylark"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.91spirit"] = {index = -1, spawnChance = 17};
	VehicleZoneDistribution.newdealer.vehicles["Base.92crownvictoriawagon"] = {index = -1, spawnChance = 17};
	VehicleZoneDistribution.newdealer.vehicles["Base.92imperial"] = {index = -1, spawnChance = 17};
	VehicleZoneDistribution.newdealer.vehicles["Base.90century"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.90sixtyspecial"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.91newyorker"] = {index = -1, spawnChance = 17};
	VehicleZoneDistribution.newdealer.vehicles["Base.90cutlasscalais"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.92Colony"] = {index = -1, spawnChance = 17};
	VehicleZoneDistribution.newdealer.vehicles["Base.92gmcserriamedium"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.92gmcserria"] = {index = -1, spawnChance = 17};
	VehicleZoneDistribution.newdealer.vehicles["Base.92F150"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.92silvarado"] = {index = -1, spawnChance = 17};
	VehicleZoneDistribution.newdealer.vehicles["Base.92F150long"] = {index = -1, spawnChance = 17};
	VehicleZoneDistribution.newdealer.vehicles["Base.92F150dual"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.92silvaradolong"] = {index = -1, spawnChance = 17};

	VehicleZoneDistribution.useddealer.vehicles["Base.87fordthunderbird"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.88riviera"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.89fury"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.89diplomat"] = {index = -1, spawnChance = 12};
	VehicleZoneDistribution.useddealer.vehicles["Base.89cougar"] = {index = -1, spawnChance = 12};
	VehicleZoneDistribution.useddealer.vehicles["Base.85delta88"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.85lesabre"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.85fifthavenue"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.85impala"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.useddealer.vehicles["Base.90caprice"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.useddealer.vehicles["Base.90crownvictoria"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.useddealer.vehicles["Base.91oldsmobilecustomcrusier"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.93capricewagon"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.90regalsedan"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.useddealer.vehicles["Base.93blazer"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.92bronco"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.86capricewagon"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.useddealer.vehicles["Base.89LeSabreWagon"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.useddealer.vehicles["Base.85impalawagon"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.90grandamsedan"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.90skylark"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.92gmcserria"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.92gmcserriamedium"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.92F150"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.92F150long"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.92F150dual"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.92F150"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.92F1504x4"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.useddealer.vehicles["Base.92F150duallong4x4"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.useddealer.vehicles["Base.92silvarado"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.92silvaradolong"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.92F1504x4"] = {index = -1, spawnChance = 7};
	
	VehicleZoneDistribution.commercial.vehicles["Base.93G10van"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.commercial.vehicles["Base.93c10vanshort"] = {index = -1, spawnChance = 20};

	VehicleZoneDistribution.commerciallarge.vehicles["Base.93fl70box"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.87macktrucklflatbed"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.87macktruckbox"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.93fl70flatbed"] = {index = -1, spawnChance = 13};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.88navistarbox"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.88w900"] = {index = -1, spawnChance = 15};

	VehicleZoneDistribution.policelarge.vehicles["Base.87macktruckswat"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.policelarge.vehicles["Base.93FL70swat"] = {index = -1, spawnChance = 20};

	VehicleZoneDistribution.policeonly.vehicles["Base.90crownvictorialtdpolice"] = {index = -1, spawnChance = 50};
	VehicleZoneDistribution.policeonly.vehicles["Base.92crownvictoriap71police"] = {index = -1, spawnChance = 40};
	VehicleZoneDistribution.policeonly.vehicles["Base.93interceptorp71"] = {index = -1, spawnChance = 50};
	VehicleZoneDistribution.policeonly.vehicles["Base.93interceptor2p71"] = {index = -1, spawnChance = 40};
	VehicleZoneDistribution.policeonly.vehicles["Base.87macktruckswat"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.policeonly.vehicles["Base.86caprice9c1police"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.policeonly.vehicles["Base.90caprice9c1police"] = {index = -1, spawnChance = 45};
	VehicleZoneDistribution.policeonly.vehicles["Base.939c1policecruiser"] = {index = -1, spawnChance = 50};
	VehicleZoneDistribution.policeonly.vehicles["Base.939c1policecruiser2"] = {index = -1, spawnChance = 50};
	VehicleZoneDistribution.policeonly.vehicles["Base.93FL70swat"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.policeonly.vehicles["Base.919c1police"] = {index = -1, spawnChance = 50};
	VehicleZoneDistribution.policeonly.vehicles["Base.85impalacruiser"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.policeonly.vehicles["Base.85lesabrepolice"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.policeonly.vehicles["Base.85delta88police"] = {index = -1, spawnChance = 40};
	VehicleZoneDistribution.policeonly.vehicles["Base.89diplomatpolice"] = {index = -1, spawnChance = 40};
	VehicleZoneDistribution.policeonly.vehicles["Base.89furypolice"] = {index = -1, spawnChance = 40};
	VehicleZoneDistribution.policeonly.vehicles["Base.93tahoepolice"] = {index = -1, spawnChance = 35};
	VehicleZoneDistribution.policeonly.vehicles["Base.92intrepidpolice"] = {index = -1, spawnChance = 40};
	VehicleZoneDistribution.policeonly.vehicles["Base.92broncopolice"] = {index = -1, spawnChance = 35};
	VehicleZoneDistribution.policeonly.vehicles["Base.93yukonpolice"] = {index = -1, spawnChance = 35};
	VehicleZoneDistribution.policeonly.vehicles["Base.92F150sheriff"] = {index = -1, spawnChance = 35};
	VehicleZoneDistribution.policeonly.vehicles["Base.92gmcserriasheriff"] = {index = -1, spawnChance = 35};
	VehicleZoneDistribution.policeonly.vehicles["Base.92intrepidstatepolice"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.policeonly.vehicles["Base.93crownvictoriap71state"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.policeonly.vehicles["Base.93capricestatepolice1"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.policeonly.vehicles["Base.93capricestatepolice2"] = {index = -1, spawnChance = 30};
	
	VehicleZoneDistribution.busservice.vehicles["Base.87rtsbus"] = {index = -1, spawnChance = 50};
	VehicleZoneDistribution.busservice.vehicles["Base.87rtsbusshort"] = {index = -1, spawnChance = 25};
	
	VehicleZoneDistribution.busriverside.vehicles["Base.87rtsbus"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.busriverside.vehicles["Base.87rtsbusshort"] = {index = -1, spawnChance = 15};
	
	VehicleZoneDistribution.busstation.vehicles["Base.87rtsbus"] = {index = -1, spawnChance = 50};
	VehicleZoneDistribution.busstation.vehicles["Base.87rtsbusshort"] = {index = -1, spawnChance = 25};

	VehicleZoneDistribution.ambulanceonly.vehicles["Base.93frieghtlignerambulance"] = {index = 0, spawnChance = 75};
	VehicleZoneDistribution.ambulanceonly.vehicles["Base.93frieghtlignerambulancefire"] = {index = 0, spawnChance = 75};
	VehicleZoneDistribution.ambulanceonly.vehicles["Base.93c10boxambulance"] = {index = 0, spawnChance = 125};
	VehicleZoneDistribution.ambulanceonly.vehicles["Base.93c10vanambulance"] = {index = 0, spawnChance = 125};
	VehicleZoneDistribution.ambulanceonly.vehicles["Base.93c10vanambulance"] = {index = 0, spawnChance = 75};

	VehicleZoneDistribution.fireonly.vehicles["Base.93frieghtlignerambulancefire"] = {index = 0, spawnChance = 35};
	VehicleZoneDistribution.fireonly.vehicles["Base.939c1fire"] = {index = 0, spawnChance = 50};
	VehicleZoneDistribution.fireonly.vehicles["Base.93capricewagonfire"] = {index = 0, spawnChance = 50};
	VehicleZoneDistribution.fireonly.vehicles["Base.88w900firedept"] = {index = 0, spawnChance = 40};
	VehicleZoneDistribution.fireonly.vehicles["Base.93lefrance"] = {index = 0, spawnChance = 40};
	VehicleZoneDistribution.fireonly.vehicles["Base.93lefrance2"] = {index = 0, spawnChance = 40};
	VehicleZoneDistribution.fireonly.vehicles["Base.92gmcserriafiredept"] = {index = 0, spawnChance = 75};
	
	VehicleZoneDistribution.firelarge.vehicles["Base.93frieghtlignerambulancefire"] = {index = 0, spawnChance = 75};
	VehicleZoneDistribution.firelarge.vehicles["Base.88w900firedept"] = {index = 0, spawnChance = 75};
	VehicleZoneDistribution.firelarge.vehicles["Base.93lefrance"] = {index = 0, spawnChance = 75};
	VehicleZoneDistribution.firelarge.vehicles["Base.93lefrance2"] = {index = 0, spawnChance = 75};
	
	VehicleZoneDistribution.postallarge.vehicles["Base.88navistarboxmail"] = {index = 0, spawnChance = 25};
	
end

if getActivatedMods():contains("RidingMower") and VehicleZoneDistribution then

	VehicleZoneDistribution.vehicletiny.vehicles["Base.RidingMower"] = {index = -1, spawnChance = 50};
	VehicleZoneDistribution.vehicletiny.vehicles["Base.RidingMower_Trailer"] = {index = -1, spawnChance = 20};

	VehicleZoneDistribution.mower.vehicles["Base.RidingMower"] = {index = -1, spawnChance = 50};
	VehicleZoneDistribution.mower.vehicles["Base.RidingMower_Trailer"] = {index = -1, spawnChance = 20};

	VehicleZoneDistribution.trailertiny.vehicles["Base.RidingMower_Trailer"] = {index = -1, spawnChance = 20};
	
end

if getActivatedMods():contains("GoKart") and VehicleZoneDistribution then

VehicleZoneDistribution.vehicletiny.vehicles["Base.GoKart"] = {index = -1, spawnChance = 50};

end


if getActivatedMods():contains("mpeBugattiEB110") and VehicleZoneDistribution then

	VehicleZoneDistribution.collectors.vehicles["Base.mpeBugattiEB110SS"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.collectors.vehicles["Base.mpeBugattiEB110GT"] = {index = -1, spawnChance = 13};

	VehicleZoneDistribution.exotic.vehicles["Base.mpeBugattiEB110SS"] = {index = -1, spawnChance = 13};
	VehicleZoneDistribution.exotic.vehicles["Base.mpeBugattiEB110GT"] = {index = -1, spawnChance = 17};

	VehicleZoneDistribution.specialdealer.vehicles["Base.mpeBugattiEB110SS"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.specialdealer.vehicles["Base.mpeBugattiEB110GT"] = {index = -1, spawnChance = 15};

end


if getActivatedMods():contains("RS_WaterCistern") and VehicleZoneDistribution then

    VehicleZoneDistribution.trailerutility.vehicles["Base.TrailerKbacRSWater"] = {index = -1, spawnChance = 15};
	
	VehicleZoneDistribution.wasteservice.vehicles["Base.f700vacuum"] = {index = -1, spawnChance = 10};
	
	VehicleZoneDistribution.fireonly.vehicles["Base.f700water"] = {index = 0, spawnChance = 10};
end


if getActivatedMods():contains("smith200") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.smithcustom200"] = {index = -1, spawnChance = 18};

    VehicleZoneDistribution.barnfind.vehicles["Base.smithcustom200"] = {index = -1, spawnChance = 20};
	
	VehicleZoneDistribution.policeonly.vehicles["Base.smithcustom200police"] = {index = -1, spawnChance = 5};
end

if getActivatedMods():contains("shubert38") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.shubertdelibery38"] = {index = -1, spawnChance = 17};

    VehicleZoneDistribution.barnfind.vehicles["Base.shubertdelibery38"] = {index = -1, spawnChance = 22};
	
	VehicleZoneDistribution.policeonly.vehicles["Base.shubertcoroner38"] = {index = -1, spawnChance = 6};
end

if getActivatedMods():contains("jeffersonfutura") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.JeffersonFutura"] = {index = -1, spawnChance = 10};

    VehicleZoneDistribution.expocarshow.vehicles["Base.JeffersonFutura"] = {index = -1, spawnChance = 15};
end

if getActivatedMods():contains("LassiterSerie75") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.LassiterSerie75"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.collectors.vehicles["Base.LassiterSerie75Supercharguer"] = {index = -1, spawnChance = 12};

    VehicleZoneDistribution.barnfind.vehicles["Base.LassiterSerie75"] = {index = -1, spawnChance = 25};
	
	VehicleZoneDistribution.amateurmechanic.vehicles["Base.LassiterSerie75"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.amateurmechanic.vehicles["Base.LassiterSerie75Supercharguer"] = {index = -1, spawnChance = 18};
	
	VehicleZoneDistribution.racing.vehicles["Base.LassiterSerie75Supercharguer"] = {index = -1, spawnChance = 10};
end

if getActivatedMods():contains("CulverEmpire") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.CulverEmpire"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.collectors.vehicles["Base.CulverEmpireSuperCharger"] = {index = -1, spawnChance = 12};

    VehicleZoneDistribution.barnfind.vehicles["Base.CulverEmpire"] = {index = -1, spawnChance = 25};
	
	VehicleZoneDistribution.amateurmechanic.vehicles["Base.CulverEmpire"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.amateurmechanic.vehicles["Base.CulverEmpireSuperCharger"] = {index = -1, spawnChance = 18};
	
	VehicleZoneDistribution.racing.vehicles["Base.CulverEmpireSuperCharger"] = {index = -1, spawnChance = 10};
	
	VehicleZoneDistribution.policeonly.vehicles["Base.CulverEmpirePolice"] = {index = -1, spawnChance = 8};
end

if getActivatedMods():contains("HTowTruckFix") and VehicleZoneDistribution then

	VehicleZoneDistribution.towservice.vehicles["Base.Chevalier_Rhino_TowTruck"] = {index = -1, spawnChance = 50};
end

if getActivatedMods():contains("HTowTruck") and VehicleZoneDistribution then

	VehicleZoneDistribution.towservice.vehicles["Base.Chevalier_Rhino_TowTruck"] = {index = -1, spawnChance = 50};
end

if getActivatedMods():contains("USPSTruck") and VehicleZoneDistribution then

	VehicleZoneDistribution.postalonly.vehicles["Base.USPSTruck"] = {index = -1, spawnChance = 50};
	
end


--------Credit to Funnypig for the following mod integrations--------

--------Skizot's Vehicles--------

if getActivatedMods():contains("SprinterAE86") and VehicleZoneDistribution then

    VehicleZoneDistribution.amateurmechanic.vehicles["Base.SprinterAE86"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.amateurmechanic.vehicles["Base.SprinterAE86_InitialD"] = {index = -1, spawnChance = 10};

    VehicleZoneDistribution.expocarshow.vehicles["Base.SprinterAE86_InitialD"] = {index = -1, spawnChance = 10};

    VehicleZoneDistribution.import.vehicles["Base.SprinterAE86"] = {index = -1, spawnChance = 10};
end

if getActivatedMods():contains("GarbageTruck") and VehicleZoneDistribution then

    VehicleZoneDistribution.utility.vehicles["Base.GarbageTruck"] = {index = -1, spawnChance = 2};

    VehicleZoneDistribution.commerciallarge.vehicles["Base.GarbageTruck"] = {index = -1, spawnChance = 5};
	
	VehicleZoneDistribution.wasteservice.vehicles["Base.GarbageTruck"] = {index = -1, spawnChance = 20};
end

if getActivatedMods():contains("IceCreamTruckFreezer") and VehicleZoneDistribution then

    VehicleZoneDistribution.commercial.vehicles["Base.StepVanIceCreamFreeze"] = {index = -1, spawnChance = 1};
end

--------Misc Mods--------

if getActivatedMods():contains("toyotasupraa70") and VehicleZoneDistribution then

    VehicleZoneDistribution.newdealer.vehicles["Base.toyotasupraa70"] = {index = -1, spawnChance = 10};
	
	VehicleZoneDistribution.useddealer.vehicles["Base.toyotasupraa70"] = {index = -1, spawnChance = 10};
	
end

if getActivatedMods():contains("rx7fc") and VehicleZoneDistribution then

    VehicleZoneDistribution.newdealer.vehicles["Base.rx7fc"] = {index = -1, spawnChance = 10};
	
	VehicleZoneDistribution.useddealer.vehicles["Base.rx7fc"] = {index = -1, spawnChance = 10};

end

if getActivatedMods():contains("sputnik26") and VehicleZoneDistribution then

    VehicleZoneDistribution.barnfind.vehicles["Base.SputnikSedan"] = {index = -1, spawnChance = 3};
    VehicleZoneDistribution.barnfind.vehicles["Base.SputnikUniversal"] = {index = -1, spawnChance = 2};

    VehicleZoneDistribution.collectors.vehicles["Base.SputnikSedan"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.collectors.vehicles["Base.SputnikUniversal"] = {index = -1, spawnChance = 1};

    VehicleZoneDistribution.import.vehicles["Base.SputnikSedan"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.import.vehicles["Base.SputnikUniversal"] = {index = -1, spawnChance = 1};
end

if getActivatedMods():contains("T3") and VehicleZoneDistribution then

    VehicleZoneDistribution.amateurmechanic.vehicles["Base.T3"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.amateurmechanic.vehicles["Base.T3Cargo"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.amateurmechanic.vehicles["Base.T3Roof"] = {index = -1, spawnChance = 1};

    VehicleZoneDistribution.barnfind.vehicles["Base.T3"] = {index = -1, spawnChance = 3};
    VehicleZoneDistribution.barnfind.vehicles["Base.T3Cargo"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.barnfind.vehicles["Base.T3Roof"] = {index = -1, spawnChance = 2};

    VehicleZoneDistribution.import.vehicles["Base.T3"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.import.vehicles["Base.T3Cargo"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.import.vehicles["Base.T3Roof"] = {index = -1, spawnChance = 1};
end

--------ATA and Tsar's--------

if getActivatedMods():contains("ATA_Petyarbuilt") and VehicleZoneDistribution then
    
    VehicleZoneDistribution.commerciallarge.vehicles["Base.ATAPetyarbuilt"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.commerciallarge.vehicles["Base.ATAPetyarbuiltSleeper"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.commerciallarge.vehicles["Base.ATAPetyarbuiltSleeperLong"] = {index = -1, spawnChance = 10};
end

if getActivatedMods():contains("ATA_Dadge") and VehicleZoneDistribution then

    VehicleZoneDistribution.newdealer.vehicles["Base.ATADodge"] = {index = -1, spawnChance = 10};

    VehicleZoneDistribution.useddealer.vehicles["Base.ATADodge"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.racing.vehicles["Base.ATADodgePpg"] = {index = -1, spawnChance = 5};
	
	VehicleZoneDistribution.pacecar.vehicles["Base.ATADodgePpg"] = {index = -1, spawnChance = 20};
end

if getActivatedMods():contains("autotsartrailers") and VehicleZoneDistribution then

    VehicleZoneDistribution.trailerutility.vehicles["Base.TrailerFirst"] = {index = -1, spawnChance = 45};
    VehicleZoneDistribution.trailerutility.vehicles["Base.TrailerSecond"] = {index = -1, spawnChance = 35};
    VehicleZoneDistribution.trailerutility.vehicles["Base.TrailerHome"] = {index = -1, spawnChance = 20};
    VehicleZoneDistribution.trailerutility.vehicles["Base.TrailerHomeHartman"] = {index = -1, spawnChance = 15};
    VehicleZoneDistribution.trailerutility.vehicles["Base.TrailerHomeExplorer"] = {index = -1, spawnChance = 15};
    VehicleZoneDistribution.trailerutility.vehicles["Base.TrailerGenerator"] = {index = -1, spawnChance = 10};
	
	VehicleZoneDistribution.construction.vehicles["Base.TrailerGenerator"] = {index = -1, spawnChance = 10};
	
	VehicleZoneDistribution.recreational.vehicles["Base.TrailerHome"] = {index = 2, spawnChance = 20};
	VehicleZoneDistribution.recreational.vehicles["Base.TrailerHomeHartman"] = {index = 2, spawnChance = 10};
	VehicleZoneDistribution.recreational.vehicles["Base.TrailerHomeExplorer"] = {index = 2, spawnChance = 5};
	
end

if getActivatedMods():contains("rWaterTrailer") and VehicleZoneDistribution then

    VehicleZoneDistribution.trailerutility.vehicles["Rotators.TrailerWaterSmall"] = {index = -1, spawnChance = 20};
    VehicleZoneDistribution.trailerutility.vehicles["Rotators.TrailerWaterBig"] = {index = -1, spawnChance = 10};
end

--------Danny's--------

if getActivatedMods():contains("1970FordMustangBoss302") and VehicleZoneDistribution then

    VehicleZoneDistribution.barnfind.vehicles["Base.70fordmustang302boss"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.barnfind.vehicles["Base.70fordmustang302bossfull"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.collectors.vehicles["Base.70fordmustang302boss"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.collectors.vehicles["Base.70fordmustang302bossfull"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.amateurmechanic.vehicles["Base.70fordmustang302boss"] = {index = -1, spawnChance = 7};
    VehicleZoneDistribution.amateurmechanic.vehicles["Base.70fordmustang302bossfull"] = {index = -1, spawnChance = 7};
end

if getActivatedMods():contains("1969FordMustangBoss429") and VehicleZoneDistribution then

    VehicleZoneDistribution.barnfind.vehicles["Base.fordmustang429boss"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.barnfind.vehicles["Base.fordmustang429bossfull"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.barnfind.vehicles["Base.fordmustang429cheap"] = {index = -1, spawnChance = 2};

    VehicleZoneDistribution.collectors.vehicles["Base.fordmustang429boss"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.collectors.vehicles["Base.fordmustang429bossfull"] = {index = -1, spawnChance = 3};

    VehicleZoneDistribution.amateurmechanic.vehicles["Base.fordmustang429boss"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.amateurmechanic.vehicles["Base.fordmustang429bossfull"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.amateurmechanic.vehicles["Base.fordmustang429cheap"] = {index = -1, spawnChance = 3};
end

if getActivatedMods():contains("1967ChevroletImpala") and VehicleZoneDistribution then

    VehicleZoneDistribution.barnfind.vehicles["Base.67chevroletimpala"] = {index = -1, spawnChance = 10};

    VehicleZoneDistribution.collectors.vehicles["Base.67chevroletimpala"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.amateurmechanic.vehicles["Base.67chevroletimpala"] = {index = -1, spawnChance = 5};
end

if getActivatedMods():contains("1967ChevroletImpalaStationWagon") and VehicleZoneDistribution then

    VehicleZoneDistribution.barnfind.vehicles["Base.67chevroletimpalaSW"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.barnfind.vehicles["Base.67chevroletimpalaSWRR"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.barnfind.vehicles["Base.67chevroletimpalaSWItems"] = {index = -1, spawnChance = 2};

    VehicleZoneDistribution.amateurmechanic.vehicles["Base.67chevroletimpalaSW"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.amateurmechanic.vehicles["Base.67chevroletimpalaSWRR"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.amateurmechanic.vehicles["Base.67chevroletimpalaSWItems"] = {index = -1, spawnChance = 2};
end

--------KI5's--------

if getActivatedMods():contains("59meteor") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.59meteor"] = {index = -1, spawnChance = 15};
    VehicleZoneDistribution.collectors.vehicles["Base.59ambulance"] = {index = -1, spawnChance = 10};

    VehicleZoneDistribution.expocarshow.vehicles["Base.59meteor"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.expocarshow.vehicles["Base.59ambulance"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.barnfind.vehicles["Base.59meteor"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.barnfind.vehicles["Base.59ambulance"] = {index = -1, spawnChance = 10};
end

if getActivatedMods():contains("ECTO1") and VehicleZoneDistribution then

    VehicleZoneDistribution.expocarshow.vehicles["Base.ECTO1"] = {index = -1, spawnChance = 10};
	
	VehicleZoneDistribution.specialdealer.vehicles["Base.ECTO1"] = {index = -1, spawnChance = 3};
	
end

if getActivatedMods():contains("84merc") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.84mercSWB"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.collectors.vehicles["Base.84mercLWB2"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.collectors.vehicles["Base.84mercLWB4"] = {index = -1, spawnChance = 2};

    VehicleZoneDistribution.import.vehicles["Base.84mercSWB"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.import.vehicles["Base.84mercLWB2"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.import.vehicles["Base.84mercLWB4"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.useddealer.vehicles["Base.84mercSWB"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.useddealer.vehicles["Base.84mercLWB2"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.useddealer.vehicles["Base.84mercLWB4"] = {index = -1, spawnChance = 5};
	
end

if getActivatedMods():contains("85merc") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.85mercSedan"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.collectors.vehicles["Base.85mercWagon"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.collectors.vehicles["Base.85mercWagon2"] = {index = -1, spawnChance = 2};

    VehicleZoneDistribution.import.vehicles["Base.85mercSedan"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.import.vehicles["Base.85mercWagon"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.import.vehicles["Base.85mercWagon2"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.useddealer.vehicles["Base.85mercSedan"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.useddealer.vehicles["Base.85mercWagon"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.useddealer.vehicles["Base.85mercWagon2"] = {index = -1, spawnChance = 5};
	
end

if getActivatedMods():contains("87cruiser") and VehicleZoneDistribution then

    VehicleZoneDistribution.useddealer.vehicles["Base.87cruiserLights"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.useddealer.vehicles["Base.87cruiserRoofrack"] = {index = -1, spawnChance = 10};
	
end

if getActivatedMods():contains("88golfMk2") and VehicleZoneDistribution then

    VehicleZoneDistribution.useddealer.vehicles["Base.88golf2doorMk2"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.useddealer.vehicles["Base.88golf4doorMk2"] = {index = -1, spawnChance = 10};
	
end

if getActivatedMods():contains("88jettaMk2") and VehicleZoneDistribution then

    VehicleZoneDistribution.useddealer.vehicles["Base.88jetta2doorMk2"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.useddealer.vehicles["Base.88jetta4doorMk2"] = {index = -1, spawnChance = 10};
	
end

if getActivatedMods():contains("89def90") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.89def90"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.import.vehicles["Base.89def90"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.useddealer.vehicles["Base.89def90"] = {index = -1, spawnChance = 5};
	
end

if getActivatedMods():contains("89def110") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.89def110"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.collectors.vehicles["Base.89def110op"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.import.vehicles["Base.89def110"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.import.vehicles["Base.89def110op"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.useddealer.vehicles["Base.89def110"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.useddealer.vehicles["Base.89def110op"] = {index = -1, spawnChance = 5};
	
end

if getActivatedMods():contains("90niva") and VehicleZoneDistribution then

    VehicleZoneDistribution.import.vehicles["Base.90niva"] = {index = -1, spawnChance = 5};
end

if getActivatedMods():contains("91range") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.91range"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.collectors.vehicles["Base.91range2"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.import.vehicles["Base.91range"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.import.vehicles["Base.91range2"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.useddealer.vehicles["Base.91range"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.useddealer.vehicles["Base.91range2"] = {index = -1, spawnChance = 5};
end

if getActivatedMods():contains("amclub") and VehicleZoneDistribution then

    VehicleZoneDistribution.barnfind.vehicles["Base.AMC_bmw_classic"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.barnfind.vehicles["Base.AMC_bmw_custom"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.barnfind.vehicles["Base.AMC_harley"] = {index = -1, spawnChance = 10};

    VehicleZoneDistribution.collectors.vehicles["Base.AMC_bmw_classic"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.collectors.vehicles["Base.AMC_bmw_custom"] = {index = -1, spawnChance = 3};
    VehicleZoneDistribution.collectors.vehicles["Base.AMC_harley"] = {index = -1, spawnChance = 10};

    VehicleZoneDistribution.racing.vehicles["Base.AMC_bmw_custom"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.import.vehicles["Base.AMC_bmw_classic"] = {index = -1, spawnChance = 10};

    VehicleZoneDistribution.useddealer.vehicles["Base.AMC_bmw_classic"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.useddealer.vehicles["Base.AMC_harley"] = {index = -1, spawnChance = 5};
	
end

--------cyt and Shark's--------

if getActivatedMods():contains("SL500") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.SL500"] = {index = -1, spawnChance = 2};

    VehicleZoneDistribution.specialdealer.vehicles["Base.SL500"] = {index = -1, spawnChance = 20};

    VehicleZoneDistribution.newdealer.vehicles["Base.SL500"] = {index = -1, spawnChance = 10};
	
end

if getActivatedMods():contains("290GD") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.290D2Door"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.collectors.vehicles["Base.290D2DoorSmall"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.collectors.vehicles["Base.290GD4Door"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.collectors.vehicles["Base.290GDOpenTop"] = {index = -1, spawnChance = 1};

    VehicleZoneDistribution.import.vehicles["Base.290D2Door"] = {index = -1, spawnChance = 20};
    VehicleZoneDistribution.import.vehicles["Base.290D2DoorSmall"] = {index = -1, spawnChance = 20};
    VehicleZoneDistribution.import.vehicles["Base.290GD4Door"] = {index = -1, spawnChance = 20};
    VehicleZoneDistribution.import.vehicles["Base.290GDOpenTop"] = {index = -1, spawnChance = 20};

    VehicleZoneDistribution.newdealer.vehicles["Base.290D2Door"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.newdealer.vehicles["Base.290D2DoorSmall"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.newdealer.vehicles["Base.290GD4Door"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.newdealer.vehicles["Base.290GDOpenTop"] = {index = -1, spawnChance = 10};
end

if getActivatedMods():contains("GWagen") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.GWagen"] = {index = -1, spawnChance = 1};

    VehicleZoneDistribution.import.vehicles["Base.GWagen"] = {index = -1, spawnChance = 20};

    VehicleZoneDistribution.newdealer.vehicles["Base.GWagen"] = {index = -1, spawnChance = 10};
	
end

if getActivatedMods():contains("FJ75C") and VehicleZoneDistribution then

    VehicleZoneDistribution.newdealer.vehicles["Base.FJ75PC"] = {index = -1, spawnChance = 15};

    VehicleZoneDistribution.useddealer.vehicles["Base.FJ75PC"] = {index = -1, spawnChance = 5};
end

if getActivatedMods():contains("SCKCO") and VehicleZoneDistribution then

	VehicleZoneDistribution.commercial.vehicles["Base.SC_G30BoxVan"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.commercial.vehicles["Base.SC_ChevroletC70GrainTruck"] = {index = -1, spawnChance = 15};
	
	VehicleZoneDistribution.commerciallarge.vehicles["Base.SC_G30BoxVan"] = {index = -1, spawnChance = 12};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.SC_FordF700BoxTruck"] = {index = -1, spawnChance = 20};
	
    VehicleZoneDistribution.newdealer.vehicles["Base.SC_CapriceCiv"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.SC_JeepCherokee"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.SC_MazdaB"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.SC_FordBronco"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.SC_FordF150"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.SC_ToyotaCamry"] = {index = -1, spawnChance = 25};

    VehicleZoneDistribution.useddealer.vehicles["Base.SC_CapriceCiv"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.useddealer.vehicles["Base.SC_CadillacFuneralCoach"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.SC_PlymouthVoyager"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.useddealer.vehicles["Base.SC_MazdaB"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.SC_GeoTracker"] = {index = -1, spawnChance = 15};
	
	VehicleZoneDistribution.movers.vehicles["Base.SC_G30BoxVan"] = {index = -1, spawnChance = 10};

    VehicleZoneDistribution.policelarge.vehicles["Base.SC_StepVanP30Police"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.policelarge.vehicles["Base.SC_FordF700ArmoredPolice"] = {index = -1, spawnChance = 20};

    VehicleZoneDistribution.policeonly.vehicles["Base.SC_Caprice9C1StatePolice"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.policeonly.vehicles["Base.SC_CrownVictoriaStatePolice"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.policeonly.vehicles["Base.SC_K5BlazerStatePolice"] = {index = -1, spawnChance = 7};

    VehicleZoneDistribution.fireonly.vehicles["Base.SC_CrownFireCoach"] = {index = 0, spawnChance = 100};
	
	VehicleZoneDistribution.firelarge.vehicles["Base.SC_CrownFireCoach"] = {index = 0, spawnChance = 100};
end

--------Credit to Panopticon for the following mod integrations--------

-- Special Emergency Vehicles & FBI for Filibuster Rhymes' Used Cars!
if getActivatedMods():contains("SpecialEmergencyVehiclesFRsm") and VehicleZoneDistribution then

	VehicleZoneDistribution.policelarge.vehicles["Base.86econolinervFBIMHQLG"] = {index = -1, spawnChance = 20}
	VehicleZoneDistribution.policelarge.vehicles["Base.86econolinervLVMHQLG"] = {index = -1, spawnChance = 20}
	VehicleZoneDistribution.policelarge.vehicles["Base.f700boxbombsquadLG"] = {index = -1, spawnChance = 20}
	VehicleZoneDistribution.policelarge.vehicles["Base.moveurselfFBIEVIDENCERT"] = {index = -1, spawnChance = 20}
	VehicleZoneDistribution.policelarge.vehicles["Base.stepvanchevybOMBSQUAD"] = {index = -1, spawnChance = 20}
	VehicleZoneDistribution.policelarge.vehicles["Base.stepvanchevyFBIBOMBSQUAD"] = {index = -1, spawnChance = 20}
	VehicleZoneDistribution.policelarge.vehicles["Base.Vehicles_sogmobilehq"] = {index = -1, spawnChance = 20}

	VehicleZoneDistribution.policeonly.vehicles["Base.86econolinervFBIMHQLG"] = {index = -1, spawnChance = 5}
	VehicleZoneDistribution.policeonly.vehicles["Base.86econolinervLVMHQLG"] = {index = -1, spawnChance = 5}
	VehicleZoneDistribution.policeonly.vehicles["Base.92crownvicPDFBIMARKEDlg"] = {index = -1, spawnChance = 5}
	VehicleZoneDistribution.policeonly.vehicles["Base.92crownvicFBIunm"] = {index = -1, spawnChance = 5}
	VehicleZoneDistribution.policeonly.vehicles["Base.93jeepcherokeeFBIunmarkLG"] = {index = -1, spawnChance = 5}
	VehicleZoneDistribution.policeonly.vehicles["Base.93jeepcherokeeparkrangerlg"] = {index = -1, spawnChance = 5}
	VehicleZoneDistribution.policeonly.vehicles["Base.93jeepcherookeerangerlb1test"] = {index = -1, spawnChance = 5}
	VehicleZoneDistribution.policeonly.vehicles["Base.93jeepcherookeerangerLBOG"] = {index = -1, spawnChance = 5}
	VehicleZoneDistribution.policeonly.vehicles["Base.71chevyc10offroadlbparkrangerLG"] = {index = -1, spawnChance = 5}
	VehicleZoneDistribution.policeonly.vehicles["Base.f700boxbombsquadLG"] = {index = -1, spawnChance = 5}
	VehicleZoneDistribution.policeonly.vehicles["Base.moveurselfFBIEVIDENCERT"] = {index = -1, spawnChance = 5}
	VehicleZoneDistribution.policeonly.vehicles["Base.stepvanchevybOMBSQUAD"] = {index = -1, spawnChance = 5}
	VehicleZoneDistribution.policeonly.vehicles["Base.stepvanchevyFBIBOMBSQUAD"] = {index = -1, spawnChance = 5}
	VehicleZoneDistribution.policeonly.vehicles["Base.Vehicles_sogmobilehq"] = {index = -1, spawnChance = 5}

	VehicleZoneDistribution.ambulanceonly.vehicles["Base.86bounderHAzardmaterials"] = {index = -1, spawnChance = 75}
	VehicleZoneDistribution.ambulanceonly.vehicles["Base.moveurselfFBIEVIDENCERT"] = {index = -1, spawnChance = 25}
	VehicleZoneDistribution.ambulanceonly.vehicles["Base.80f350ambulanceFEMAas"] = {index = -1, spawnChance = 75}
	VehicleZoneDistribution.ambulanceonly.vehicles["Base.Vehicles_fematruck01"] = {index = -1, spawnChance = 25}

	VehicleZoneDistribution.fireonly.vehicles["Base.86bounderHAzardmaterials"] = {index = -1, spawnChance = 35}
	VehicleZoneDistribution.fireonly.vehicles["Base.Vehicles_fematruck01"] = {index = -1, spawnChance = 50}

	VehicleZoneDistribution.firelarge.vehicles["Base.86bounderHAzardmaterials"] = {index = -1, spawnChance = 25}
	VehicleZoneDistribution.firelarge.vehicles["Base.Vehicles_fematruck01"] = {index = -1, spawnChance = 75}
end

-- Fox's Extra Police
if getActivatedMods():contains("FEP") and VehicleZoneDistribution then

    VehicleZoneDistribution.policeonly.vehicles["Base.85vicsheriff2"] = {index = -1, spawnChance = 15}
    VehicleZoneDistribution.policeonly.vehicles["Base.91vicsheriff"] = {index = -1, spawnChance = 10}
    VehicleZoneDistribution.policeonly.vehicles["Base.85vicltdPD2"] = {index = -1, spawnChance = 10}
	VehicleZoneDistribution.policeonly.vehicles["Base.92crownvicPD2"] = {index = -1, spawnChance = 25}
    VehicleZoneDistribution.policeonly.vehicles["Base.92crownvicPD3"] = {index = -1, spawnChance = 25}
    VehicleZoneDistribution.policeonly.vehicles["Base.91blazerPD2"] = {index = -1, spawnChance = 25}
end

-- KI5's '92 AM General M998 + M101A3 Cargo trailer (because Hummers LOL) (also has a trailer)
if getActivatedMods():contains("92amgeneralM998") and VehicleZoneDistribution then

	VehicleZoneDistribution.utility.vehicles["Base.TrailerM101A3cargo"] = {index = -1, spawnChance = 3}

	VehicleZoneDistribution.trailerutility.vehicles["Base.TrailerM101A3cargo"] = {index = -1, spawnChance = 10}

	VehicleZoneDistribution.expocarshow.vehicles["Base.92amgeneralM998"] = {index = -1, spawnChance = 4}
end

-- KI5's '74 AM General M151A2 MUTT (because Willy's Jeep)
if getActivatedMods():contains("74amgeneralM151A2") and VehicleZoneDistribution then

	VehicleZoneDistribution.barnfind.vehicles["Base.74amgeneralM151A2"] = {index = -1, spawnChance = 7}

	VehicleZoneDistribution.collectors.vehicles["Base.74amgeneralM151A2"] = {index = -1, spawnChance = 6}

	VehicleZoneDistribution.policeonly.vehicles["Base.74amgeneralM151A2MP"] = {index = -1, spawnChance = 5}
end

-- KI5's '92 NISSAN Skyline GT-R (R32)
if getActivatedMods():contains("92nissanGTR") and VehicleZoneDistribution then

	VehicleZoneDistribution.specialdealer.vehicles["Base.92nissanGTR"] = {index = -1, spawnChance = 15}

	VehicleZoneDistribution.amateurmechanic.vehicles["Base.92nissanGTR"] = {index = -1, spawnChance = 5}

	VehicleZoneDistribution.import.vehicles["Base.92nissanGTR"] = {index = -1, spawnChance = 30}

	--VehicleZoneDistribution.racing.vehicles["Base.92nissanGTR"] = {index = -1, spawnChance = 10}
end

-- KI5's '86 Ford Econoline E-150 + Pop Culture vans
if getActivatedMods():contains("86fordE150") and VehicleZoneDistribution then

	VehicleZoneDistribution.commercial.vehicles["Base.86fordE150"] = {index = -1, spawnChance = 15}
	VehicleZoneDistribution.commercial.vehicles["Base.86fordE150slide"] = {index = -1, spawnChance = 15}
	VehicleZoneDistribution.commercial.vehicles["Base.86fordE150long"] = {index = -1, spawnChance = 15}

	VehicleZoneDistribution.utility.vehicles["Base.86fordE150"] = {index = -1, spawnChance = 15}
	VehicleZoneDistribution.utility.vehicles["Base.86fordE150slide"] = {index = -1, spawnChance = 15}
	VehicleZoneDistribution.utility.vehicles["Base.86fordE150long"] = {index = -1, spawnChance = 15}

	VehicleZoneDistribution.movers.vehicles["Base.86fordE150"] = {index = -1, spawnChance = 10}
	VehicleZoneDistribution.movers.vehicles["Base.86fordE150slide"] = {index = -1, spawnChance = 10}
	VehicleZoneDistribution.movers.vehicles["Base.86fordE150long"] = {index = -1, spawnChance = 10}

	if getActivatedMods():contains("86fordE150dnd") then
		
		VehicleZoneDistribution.specialdealer.vehicles["Base.86fordE150dnd"] = {index = -1, spawnChance = 3}

		VehicleZoneDistribution.expocarshow.vehicles["Base.86fordE150dnd"] = {index = -1, spawnChance = 10}

	end if getActivatedMods():contains("86fordE150mm") then
		
		VehicleZoneDistribution.specialdealer.vehicles["Base.86fordE150mm"] = {index = -1, spawnChance = 3}

		VehicleZoneDistribution.expocarshow.vehicles["Base.86fordE150mm"] = {index = -1, spawnChance = 10}

	end if getActivatedMods():contains("86fordE150pd") then

		VehicleZoneDistribution.movers.vehicles["Base.86fordE150pd"] = {index = -1, spawnChance = 5}
		
		VehicleZoneDistribution.heistvehicle.vehicles["Base.86fordE150pd"] = {index = -1, spawnChance = 12}
	end
end

-- KI5's '70 Dodge Challenger
if getActivatedMods():contains("70dodge") and VehicleZoneDistribution then
	
	VehicleZoneDistribution.barnfind.vehicles["Base.70dodgeRT"] = {index = -1, spawnChance = 10}
	VehicleZoneDistribution.barnfind.vehicles["Base.70dodgeTA"] = {index = -1, spawnChance = 10}
	
	VehicleZoneDistribution.useddealer.vehicles["Base.70dodgeRT"] = {index = -1, spawnChance = 3}
	VehicleZoneDistribution.useddealer.vehicles["Base.70dodgeTA"] = {index = -1, spawnChance = 2}

	VehicleZoneDistribution.policeonly.vehicles["Base.70dodgePD"] = {index = -1, spawnChance = 5}
end

-- KI5's '82 Jeep J10 with Mellow Yellow truck
if getActivatedMods():contains("82jeepJ10") and VehicleZoneDistribution then

	VehicleZoneDistribution.utility.vehicles["Base.82jeepJ10"] = {index = -1, spawnChance = 15}

	VehicleZoneDistribution.useddealer.vehicles["Base.82jeepJ10"] = {index = -1, spawnChance = 15}

	if getActivatedMods():contains("82jeepJ10t") then

		VehicleZoneDistribution.specialdealer.vehicles["Base.82jeepJ10t"] = {index = -1, spawnChance = 3}

		VehicleZoneDistribution.expocarshow.vehicles["Base.82jeepJ10t"] = {index = -1, spawnChance = 10}
	end
end

-- KI5's '88 Chevrolet S10
if getActivatedMods():contains("88chevyS10") and VehicleZoneDistribution then

	VehicleZoneDistribution.commercial.vehicles["Base.88chevyS10"] = {index = -1, spawnChance = 9}

	VehicleZoneDistribution.utility.vehicles["Base.88chevyS10"] = {index = -1, spawnChance = 15}

	VehicleZoneDistribution.useddealer.vehicles["Base.88chevyS10"] = {index = -1, spawnChance = 15}
end

-- KI5's '89 Ford Bronco
if getActivatedMods():contains("89fordBronco") and VehicleZoneDistribution then

	VehicleZoneDistribution.commercial.vehicles["Base.89fordBronco"] = {index = -1, spawnChance = 10}

	VehicleZoneDistribution.utility.vehicles["Base.89fordBronco"] = {index = -1, spawnChance = 15}

	VehicleZoneDistribution.useddealer.vehicles["Base.89fordBronco"] = {index = -1, spawnChance = 15}
end

-- KI5's '49 Dodge Power Wagon Crew Cab
if getActivatedMods():contains("49powerWagon") and VehicleZoneDistribution then

	VehicleZoneDistribution.specialdealer.vehicles["Base.49powerWagon"] = {index = -1, spawnChance = 10}

	VehicleZoneDistribution.barnfind.vehicles["Base.49powerWagon"] = {index = -1, spawnChance = 5}
	VehicleZoneDistribution.barnfind.vehicles["Base.49powerWagonPA"] = {index = -1, spawnChance = 20}
	VehicleZoneDistribution.barnfind.vehicles["Base.49powerWagonPD"] = {index = -1, spawnChance = 5}
	VehicleZoneDistribution.barnfind.vehicles["Base.49powerWagonMP"] = {index = -1, spawnChance = 10}

	VehicleZoneDistribution.amateurmechanic.vehicles["Base.49powerWagon"] = {index = -1, spawnChance = 10}
	VehicleZoneDistribution.amateurmechanic.vehicles["Base.49powerWagonPA"] = {index = -1, spawnChance = 20}

	VehicleZoneDistribution.collectors.vehicles["Base.49powerWagon"] = {index = -1, spawnChance = 10}

	VehicleZoneDistribution.policeonly.vehicles["Base.49powerWagonPD"] = {index = -1, spawnChance = 5}
	VehicleZoneDistribution.policeonly.vehicles["Base.49powerWagonMP"] = {index = -1, spawnChance = 1}
end

-- KI5's '70 Plymouth Barracuda
if getActivatedMods():contains("70barracuda") and VehicleZoneDistribution then

	VehicleZoneDistribution.specialdealer.vehicles["Base.70barracudaAAR"] = {index = -1, spawnChance = 15}
	
	VehicleZoneDistribution.useddealer.vehicles["Base.70cuda"] = {index = -1, spawnChance = 3}
	VehicleZoneDistribution.useddealer.vehicles["Base.70barracuda"] = {index = -1, spawnChance = 3}
	VehicleZoneDistribution.useddealer.vehicles["Base.70cuda"] = {index = -1, spawnChance = 2}

	VehicleZoneDistribution.barnfind.vehicles["Base.70barracuda"] = {index = -1, spawnChance = 5}
	VehicleZoneDistribution.barnfind.vehicles["Base.70cuda"] = {index = -1, spawnChance = 10}
	VehicleZoneDistribution.barnfind.vehicles["Base.70barracudaAAR"] = {index = -1, spawnChance = 15}

	VehicleZoneDistribution.collectors.vehicles["Base.70barracudaAAR"] = {index = -1, spawnChance = 15}

	VehicleZoneDistribution.racing.vehicles["Base.70barracudaAAR"] = {index = -1, spawnChance = 7}
end

-- KI5's '93 Lincoln Town Car + Limo
if getActivatedMods():contains("93townCar") and VehicleZoneDistribution then

	VehicleZoneDistribution.newdealer.vehicles["Base.93townCar"] = {index = -1, spawnChance = 20}

	VehicleZoneDistribution.specialdealer.vehicles["Base.93townCarLimo"] = {index = -1, spawnChance = 10}

	VehicleZoneDistribution.exotic.vehicles["Base.93townCarLimo"] = {index = -1, spawnChance = 10}
end

-- KI5's '89 Isuzu Trooper
if getActivatedMods():contains("89trooper") and VehicleZoneDistribution then

	VehicleZoneDistribution.newdealer.vehicles["Base.89trooper"] = {index = -1, spawnChance = 15}

	VehicleZoneDistribution.useddealer.vehicles["Base.89trooper"] = {index = -1, spawnChance = 15}
	VehicleZoneDistribution.useddealer.vehicles["Base.89trooperRS"] = {index = -1, spawnChance = 10}
	VehicleZoneDistribution.useddealer.vehicles["Base.89trooperOP"] = {index = -1, spawnChance = 10}

	VehicleZoneDistribution.specialdealer.vehicles["Base.89trooperOP"] = {index = -1, spawnChance = 10}

	VehicleZoneDistribution.racing.vehicles["Base.89trooperRS"] = {index = -1, spawnChance = 5}

	VehicleZoneDistribution.recreational.vehicles["Base.89trooperOP"] = {index = -1, spawnChance = 25}
end

-- KI5's '69 Mini Mk2
if getActivatedMods():contains("69mini") and VehicleZoneDistribution then

	VehicleZoneDistribution.specialdealer.vehicles["Base.69mini"] = {index = -1, spawnChance = 15}
	VehicleZoneDistribution.specialdealer.vehicles["Base.69miniUnionJack"] = {index = -1, spawnChance = 10}

	VehicleZoneDistribution.barnfind.vehicles["Base.69mini"] = {index = -1, spawnChance = 10}

	VehicleZoneDistribution.import.vehicles["Base.69miniUnionJack"] = {index = -1, spawnChance = 30}

	VehicleZoneDistribution.collectors.vehicles["Base.69mini"] = {index = -1, spawnChance = 15}
	VehicleZoneDistribution.collectors.vehicles["Base.69miniUnionJack"] = {index = -1, spawnChance = 10}

	if getActivatedMods():contains("69mini_ItalianJob") then

		VehicleZoneDistribution.specialdealer.vehicles["Base.69miniIJ"] = {index = -1, spawnChance = 5}

		VehicleZoneDistribution.barnfind.vehicles["Base.69miniIJ"] = {index = -1, spawnChance = 15}

		VehicleZoneDistribution.collectors.vehicles["Base.69miniIJ"] = {index = -1, spawnChance = 15}

		VehicleZoneDistribution.racing.vehicles["Base.69miniIJ"] = {index = -1, spawnChance = 9}

	end if getActivatedMods():contains("69mini_MrBean") then

		VehicleZoneDistribution.barnfind.vehicles["Base.69miniMrB"] = {index = -1, spawnChance = 5}

		VehicleZoneDistribution.import.vehicles["Base.69miniMrB"] = {index = -1, spawnChance = 5}

	end if getActivatedMods():contains("69mini_PitbullSpecial") then

		VehicleZoneDistribution.specialdealer.vehicles["Base.69miniPS"] = {index = -1, spawnChance = 3}

		VehicleZoneDistribution.exotic.vehicles["Base.69miniPS"] = {index = -1, spawnChance = 5}

		VehicleZoneDistribution.expocarshow.vehicles["Base.69miniPS"] = {index = -1, spawnChance = 10}
		
		VehicleZoneDistribution.racing.vehicles["Base.69miniPS"] = {index = -1, spawnChance = 7}
	end
end

-- KI5's '80 Kawasaki Kz1000 Police
if getActivatedMods():contains("80kz1000") and VehicleZoneDistribution then

	VehicleZoneDistribution.barnfind.vehicles["Base.80kz1000"] = {index = -1, spawnChance = 5}

	VehicleZoneDistribution.collectors.vehicles["Base.80kz1000"] = {index = -1, spawnChance = 5}

	VehicleZoneDistribution.policeonly.vehicles["Base.80kz1000"] = {index = -1, spawnChance = 20}

	VehicleZoneDistribution.import.vehicles["Base.80kz1000"] = {index = -1, spawnChance = 10}
end

-- KI5's '13 Yamaha Vino 125 + PizzaBoy
if getActivatedMods():contains("vino125") and VehicleZoneDistribution then

	VehicleZoneDistribution.specialdealer.vehicles["Base.vino125b"] = {index = -1, spawnChance = 10}

	VehicleZoneDistribution.barnfind.vehicles["Base.vino125"] = {index = -1, spawnChance = 10}

	VehicleZoneDistribution.import.vehicles["Base.vino125b"] = {index = -1, spawnChance = 10}

	VehicleZoneDistribution.collectors.vehicles["Base.vino125"] = {index = -1, spawnChance = 5}
	VehicleZoneDistribution.collectors.vehicles["Base.vino125b"] = {index = -1, spawnChance = 10}
	VehicleZoneDistribution.collectors.vehicles["Base.vino125pizza"] = {index = -1, spawnChance = 5}

	VehicleZoneDistribution.expocarshow.vehicles["Base.vino125pizza"] = {index = -1, spawnChance = 5}
end

-- KI5's '28 Brough Superior SS100
if getActivatedMods():contains("28ss100") and VehicleZoneDistribution then

	VehicleZoneDistribution.specialdealer.vehicles["Base.28ss100"] = {index = -1, spawnChance = 10}
	VehicleZoneDistribution.specialdealer.vehicles["Base.28ss100hermes"] = {index = -1, spawnChance = 5}

	VehicleZoneDistribution.barnfind.vehicles["Base.28ss100"] = {index = -1, spawnChance = 10}
	VehicleZoneDistribution.barnfind.vehicles["Base.28ss100hermes"] = {index = -1, spawnChance = 5}

	VehicleZoneDistribution.import.vehicles["Base.28ss100"] = {index = -1, spawnChance = 10}
	VehicleZoneDistribution.import.vehicles["Base.28ss100hermes"] = {index = -1, spawnChance = 5}

	VehicleZoneDistribution.collectors.vehicles["Base.28ss100"] = {index = -1, spawnChance = 10}
	VehicleZoneDistribution.collectors.vehicles["Base.28ss100hermes"] = {index = -1, spawnChance = 5}

	VehicleZoneDistribution.expocarshow.vehicles["Base.28ss100hermes"] = {index = -1, spawnChance = 5}

	VehicleZoneDistribution.racing.vehicles["Base.28ss100"] = {index = -1, spawnChance = 5}
end

-- KI5's '90 Zanella 50cc Delivery Scooter
if getActivatedMods():contains("90zanella50cc") and VehicleZoneDistribution then

	VehicleZoneDistribution.newdealer.vehicles["Base.90zanella50cc"] = {index = -1, spawnChance = 5}

	VehicleZoneDistribution.useddealer.vehicles["Base.90zanella50cc"] = {index = -1, spawnChance = 5}

	VehicleZoneDistribution.import.vehicles["Base.90zanella50cc"] = {index = -1, spawnChance = 5}

	VehicleZoneDistribution.vehicletiny.vehicles["Base.90zanella50cc"] = {index = -1, spawnChance = 25}
end

-- KI5's '90 Pierce Arrow Pumper
if getActivatedMods():contains("90pierceArrow") and VehicleZoneDistribution then

    VehicleZoneDistribution.fireonly.vehicles["Base.90pierceArrow"] = {index = -1, spawnChance = 50}
	
    VehicleZoneDistribution.firelarge.vehicles["Base.90pierceArrow"] = {index = -1, spawnChance = 100}
end