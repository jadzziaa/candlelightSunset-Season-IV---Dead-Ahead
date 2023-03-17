if getActivatedMods():contains("FRUsedCars") and VehicleZoneDistribution then
--------------------------------New spawn zones--------------------------------


---Ranger 100%---

VehicleZoneDistribution.rangercien = VehicleZoneDistribution.rangercien or {};
VehicleZoneDistribution.rangercien.vehicles = VehicleZoneDistribution.rangercien.vehicles or {};

VehicleZoneDistribution.rangercien.vehicles["Base.85vicranger"] = {index = 0, spawnChance = 50};
VehicleZoneDistribution.rangercien.vehicles["Base.92wranglerranger"] = {index = 0, spawnChance = 50};

VehicleZoneDistribution.rangercien.spawnRate = 100;

---Ranger 50%---

VehicleZoneDistribution.rangercincuenta= VehicleZoneDistribution.rangercincuenta or {};
VehicleZoneDistribution.rangercincuenta.vehicles = VehicleZoneDistribution.rangercincuenta.vehicles or {};

VehicleZoneDistribution.rangercincuenta.vehicles["Base.85vicranger"] = {index = 0, spawnChance = 50};
VehicleZoneDistribution.rangercincuenta.vehicles["Base.92wranglerranger"] = {index = 0, spawnChance = 50};

VehicleZoneDistribution.rangercincuenta.spawnRate = 50;
---Police 100%---

VehicleZoneDistribution.policecien = VehicleZoneDistribution.policecien or {};
VehicleZoneDistribution.policecien.vehicles = VehicleZoneDistribution.policecien.vehicles or {};

VehicleZoneDistribution.policecien.vehicles["Base.PickUpVanLightsPolice"] = {index = 0, spawnChance = 25};
VehicleZoneDistribution.policecien.vehicles["Base.CarLightsPolice"] = {index = 0, spawnChance = 25};
VehicleZoneDistribution.policecien.vehicles["Base.85vicsheriff"] = {index = -1, spawnChance = 50};
VehicleZoneDistribution.policecien.vehicles["Base.87capricePD"] = {index = -1, spawnChance = 40};
VehicleZoneDistribution.policecien.vehicles["Base.91blazerpd"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.policecien.vehicles["Base.92crownvicPD"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.policecien.vehicles["Base.chevystepvanswat"] = {index = -1, spawnChance = 5};

VehicleZoneDistribution.policecien.spawnRate = 100;



---Police only 50%---

VehicleZoneDistribution.policecincuenta = VehicleZoneDistribution.policecincuenta or {};
VehicleZoneDistribution.policecincuenta.vehicles = VehicleZoneDistribution.policecincuenta.vehicles or {};


VehicleZoneDistribution.policecincuenta.vehicles["Base.PickUpVanLightsPolice"] = {index = 0, spawnChance = 25};
VehicleZoneDistribution.policecincuenta.vehicles["Base.CarLightsPolice"] = {index = 0, spawnChance = 25};
VehicleZoneDistribution.policecincuenta.vehicles["Base.85vicsheriff"] = {index = -1, spawnChance = 50};
VehicleZoneDistribution.policecincuenta.vehicles["Base.87capricePD"] = {index = -1, spawnChance = 40};
VehicleZoneDistribution.policecincuenta.vehicles["Base.91blazerpd"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.policecincuenta.vehicles["Base.92crownvicPD"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.policecincuenta.vehicles["Base.chevystepvanswat"] = {index = -1, spawnChance = 5};

VehicleZoneDistribution.policecincuenta.spawnRate = 50;
---military 100%---

VehicleZoneDistribution.militarycien = VehicleZoneDistribution.militarycien or {}
VehicleZoneDistribution.militarycien.vehicles = VehicleZoneDistribution.militarycien.vehicles or {}
VehicleZoneDistribution.militarycien.vehicles["Base.hmmwvht"] = {index = -1, spawnChance = 50};
VehicleZoneDistribution.militarycien.vehicles["Base.hmmwvtr"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.militarycien.vehicles["Base.m151canvas"] = {index = -1, spawnChance = 50};
VehicleZoneDistribution.militarycien.vehicles["Base.m35a2bed"] = {index = -1, spawnChance = 20};
VehicleZoneDistribution.militarycien.vehicles["Base.m35a2covered"] = {index = -1, spawnChance = 20};
VehicleZoneDistribution.militarycien.vehicles["Base.m35a2fuel"] = {index = -1, spawnChance = 10};
VehicleZoneDistribution.militarycien.baseVehicleQuality = 1;
VehicleZoneDistribution.militarycien.chanceToSpawnSpecial = 0;
VehicleZoneDistribution.militarycien.spawnRate = 100;


---military 50%---

VehicleZoneDistribution.militarycincuenta = VehicleZoneDistribution.militarycincuenta or {}
VehicleZoneDistribution.militarycincuenta.vehicles = VehicleZoneDistribution.militarycincuenta.vehicles or {}
VehicleZoneDistribution.militarycincuenta.vehicles["Base.hmmwvht"] = {index = -1, spawnChance = 50};
VehicleZoneDistribution.militarycincuenta.vehicles["Base.hmmwvtr"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.militarycincuenta.vehicles["Base.m151canvas"] = {index = -1, spawnChance = 50};
VehicleZoneDistribution.militarycincuenta.vehicles["Base.m35a2bed"] = {index = -1, spawnChance = 20};
VehicleZoneDistribution.militarycincuenta.vehicles["Base.m35a2covered"] = {index = -1, spawnChance = 20};
VehicleZoneDistribution.militarycincuenta.vehicles["Base.m35a2fuel"] = {index = -1, spawnChance = 10};
VehicleZoneDistribution.militarycincuenta.baseVehicleQuality = 1;
VehicleZoneDistribution.militarycincuenta.chanceToSpawnSpecial = 0;
VehicleZoneDistribution.militarycincuenta.spawnRate = 50;

---ambulance 100%---

VehicleZoneDistribution.ambucien = VehicleZoneDistribution.ambucien or {};
VehicleZoneDistribution.ambucien.vehicles = VehicleZoneDistribution.ambucien.vehicles or {};

VehicleZoneDistribution.ambucien.vehicles["Base.80f350ambulance"] = {index = -1, spawnChance = 100};
VehicleZoneDistribution.ambucien.vehicles["Base.86econolineambulance"] = {index = -1, spawnChance = 90};

VehicleZoneDistribution.ambucien.spawnRate = 100;


---ambulance 50%---

VehicleZoneDistribution.ambucincuenta = VehicleZoneDistribution.ambucincuenta or {};
VehicleZoneDistribution.ambucincuenta.vehicles = VehicleZoneDistribution.ambucincuenta.vehicles or {};


VehicleZoneDistribution.ambucincuenta.vehicles["Base.80f350ambulance"] = {index = -1, spawnChance = 100};
VehicleZoneDistribution.ambucincuenta.vehicles["Base.86econolineambulance"] = {index = -1, spawnChance = 90};

VehicleZoneDistribution.ambucincuenta.spawnRate = 50;

---Utility & trucks---

VehicleZoneDistribution.utilidad = VehicleZoneDistribution.utilidad or {};
VehicleZoneDistribution.utilidad.vehicles = VehicleZoneDistribution.utilidad.vehicles or {};

VehicleZoneDistribution.utilidad.vehicles["Base.87c10lb"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.utilidad.vehicles["Base.87c10sb"] = {index = -1, spawnChance = 20};
VehicleZoneDistribution.utilidad.vehicles["Base.90ramlb"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.utilidad.vehicles["Base.90ramsb"] = {index = -1, spawnChance = 20};
VehicleZoneDistribution.utilidad.vehicles["Base.91chevys10"] = {index = -1, spawnChance = 20};
VehicleZoneDistribution.utilidad.vehicles["Base.91chevys10ext"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.utilidad.vehicles["Base.80f350"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.utilidad.vehicles["Base.80f350quad"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.utilidad.vehicles["Base.83hilux"] = {index = -1, spawnChance = 15};
VehicleZoneDistribution.utilidad.vehicles["Base.51chevy3100"] = {index = -1, spawnChance = 5};
VehicleZoneDistribution.utilidad.vehicles["Base.51chevy3100old"] = {index = -1, spawnChance = 5};
VehicleZoneDistribution.utilidad.vehicles["Base.70elcamino"] = {index = -1, spawnChance = 7};
VehicleZoneDistribution.utilidad.vehicles["Base.86econoline"] = {index = -1, spawnChance = 15};
VehicleZoneDistribution.utilidad.vehicles["Base.86econolineflorist"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.utilidad.vehicles["Base.f700propane"] = {index = -1, spawnChance = 20};
VehicleZoneDistribution.utilidad.vehicles["Base.moveurself"] = {index = -1, spawnChance = 5};
VehicleZoneDistribution.utilidad.vehicles["Base.Trailermovingmedium"] = {index = -1, spawnChance = 5};
VehicleZoneDistribution.utilidad.vehicles["Base.Trailermovingbig"] = {index = -1, spawnChance = 5};
VehicleZoneDistribution.utilidad.vehicles["Base.Trailer51chevy"] = {index = -1, spawnChance = 5};
VehicleZoneDistribution.utilidad.vehicles["Base.Trailerfuelmedium"] = {index = -1, spawnChance = 5};
VehicleZoneDistribution.utilidad.vehicles["Base.Trailerfuelsmall"] = {index = -1, spawnChance = 5};
VehicleZoneDistribution.utilidad.spawnRate = 25;


VehicleZoneDistribution.camiones = VehicleZoneDistribution.camiones or {};
VehicleZoneDistribution.camiones.vehicles = VehicleZoneDistribution.camiones.vehicles or {};

VehicleZoneDistribution.camiones.vehicles["Base.f700box"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.camiones.vehicles["Base.f700dump"] = {index = -1, spawnChance = 20};
VehicleZoneDistribution.camiones.vehicles["Base.f700propane"] = {index = -1, spawnChance = 15};
VehicleZoneDistribution.camiones.vehicles["Base.f700tractor"] = {index = -1, spawnChance = 30};
VehicleZoneDistribution.camiones.vehicles["Base.f700flatbed"] = {index = -1, spawnChance = 20};

VehicleZoneDistribution.camiones.spawnRate = 25;

---fire 100%---
VehicleZoneDistribution.firecien = VehicleZoneDistribution.firecien or {};
VehicleZoneDistribution.firecien.vehicles = VehicleZoneDistribution.firecien.vehicles or {};

VehicleZoneDistribution.firecien = {};
VehicleZoneDistribution.firecien.vehicles = {};
VehicleZoneDistribution.firecien.vehicles["Base.87c10fire"] = {index = -1, spawnChance = 100};
VehicleZoneDistribution.firecien.vehicles["Base.firepumper"] = {index = -1, spawnChance = 50};

VehicleZoneDistribution.firecien.spawnRate = 100;


---fire 50%---
VehicleZoneDistribution.firecincuenta = VehicleZoneDistribution.firecincuenta or {};
VehicleZoneDistribution.firecincuenta.vehicles = VehicleZoneDistribution.firecincuenta.vehicles or {};

VehicleZoneDistribution.firecincuenta = {};
VehicleZoneDistribution.firecincuenta.vehicles = {};
VehicleZoneDistribution.firecincuenta.vehicles["Base.87c10fire"] = {index = -1, spawnChance = 100};
VehicleZoneDistribution.firecincuenta.vehicles["Base.firepumper"] = {index = -1, spawnChance = 50};

VehicleZoneDistribution.firecincuenta.spawnRate = 50;

---Autobus 50%---
VehicleZoneDistribution.shoolbus = VehicleZoneDistribution.shoolbus or {};
VehicleZoneDistribution.shoolbus.vehicles = VehicleZoneDistribution.shoolbus.vehicles or {};

VehicleZoneDistribution.shoolbus = {};
VehicleZoneDistribution.shoolbus.vehicles = {};
VehicleZoneDistribution.shoolbus.vehicles["Base.schoolbus"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.shoolbus.vehicles["Base.schoolbusshort"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.shoolbus.spawnRate = 50;
end