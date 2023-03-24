if getActivatedMods():contains("LagrangePDCrownVic") and VehicleZoneDistribution then
--------------------------------New spawn zones--------------------------------


---Police 100%---lagrange

VehicleZoneDistribution.policecien = VehicleZoneDistribution.policecien or {};
VehicleZoneDistribution.policecien.vehicles = VehicleZoneDistribution.policecien.vehicles or {};

VehicleZoneDistribution.policecien.vehicles["Base.93explorerlagrangepolice"] = {index = 0, spawnChance = 60};
VehicleZoneDistribution.policecien.vehicles["Base.92crownvicPDlagrange"] = {index = -1, spawnChance = 90};
VehicleZoneDistribution.policecien.vehicles["Base.86econolinePDOCpt"] = {index = -1, spawnChance = 10};
VehicleZoneDistribution.policecien.vehicles["Base.93explorerCSheriff"] = {index = 0, spawnChance = 25};
VehicleZoneDistribution.policecien.vehicles["Base.92crownvicHCSheriff"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.policecien.spawnRate = 100;



---Police only 50%---lagrange

VehicleZoneDistribution.policecincuenta = VehicleZoneDistribution.policecincuenta or {};
VehicleZoneDistribution.policecincuenta.vehicles = VehicleZoneDistribution.policecincuenta.vehicles or {};

VehicleZoneDistribution.policecincuenta.vehicles["Base.93explorerCSheriff"] = {index = 0, spawnChance = 25};
VehicleZoneDistribution.policecincuenta.vehicles["Base.92crownvicHCSheriff"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.policecincuenta.vehicles["Base.93explorerlagrangepolice"] = {index = 0, spawnChance = 75};
VehicleZoneDistribution.policecincuenta.vehicles["Base.92crownvicPDlagrange"] = {index = -1, spawnChance = 90};
VehicleZoneDistribution.policecincuenta.vehicles["Base.86econolinePDOCpt"] = {index = -1, spawnChance = 10};

VehicleZoneDistribution.policecincuenta.spawnRate = 50;



---Police 100%---henry

VehicleZoneDistribution.policecienhc = VehicleZoneDistribution.policecienhc or {};
VehicleZoneDistribution.policecienhc.vehicles = VehicleZoneDistribution.policecienhc.vehicles or {};

VehicleZoneDistribution.policecienhc.vehicles["Base.93explorerlagrangepolice"] = {index = 0, spawnChance = 20};
VehicleZoneDistribution.policecienhc.vehicles["Base.92crownvicPDlagrange"] = {index = -1, spawnChance = 20};
VehicleZoneDistribution.policecienhc.vehicles["Base.86econolinePDOCpt"] = {index = -1, spawnChance = 10};
VehicleZoneDistribution.policecienhc.vehicles["Base.93explorerCSheriff"] = {index = 0, spawnChance = 50};
VehicleZoneDistribution.policecienhc.vehicles["Base.92crownvicHCSheriff"] = {index = -1, spawnChance = 70};
VehicleZoneDistribution.policecienhc.spawnRate = 100;



---Police only 50%---henry

VehicleZoneDistribution.policecincuentahc = VehicleZoneDistribution.policecincuentahc or {};
VehicleZoneDistribution.policecincuentahc.vehicles = VehicleZoneDistribution.policecincuentahc.vehicles or {};

VehicleZoneDistribution.policecincuentahc.vehicles["Base.93explorerCSheriff"] = {index = 0, spawnChance = 50};
VehicleZoneDistribution.policecincuentahc.vehicles["Base.92crownvicHCSheriff"] = {index = -1, spawnChance = 70};
VehicleZoneDistribution.policecincuentahc.vehicles["Base.93explorerlagrangepolice"] = {index = 0, spawnChance = 25};
VehicleZoneDistribution.policecincuentahc.vehicles["Base.92crownvicPDlagrange"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.policecincuentahc.vehicles["Base.86econolinePDOCpt"] = {index = -1, spawnChance = 10};

VehicleZoneDistribution.policecincuentahc.spawnRate = 50;

---ambulance 100%---

VehicleZoneDistribution.ambucien = VehicleZoneDistribution.ambucien or {};
VehicleZoneDistribution.ambucien.vehicles = VehicleZoneDistribution.ambucien.vehicles or {};

VehicleZoneDistribution.ambucien.vehicles["Base.80f350ambulancelagrangelivery"] = {index = -1, spawnChance = 75};

VehicleZoneDistribution.ambucien.spawnRate = 100;


---ambulance 50%---

VehicleZoneDistribution.ambucincuenta = VehicleZoneDistribution.ambucincuenta or {};
VehicleZoneDistribution.ambucincuenta.vehicles = VehicleZoneDistribution.ambucincuenta.vehicles or {};


VehicleZoneDistribution.ambucincuenta.vehicles["Base.80f350ambulancelagrangelivery"] = {index = -1, spawnChance = 75};

VehicleZoneDistribution.ambucincuenta.spawnRate = 50;


---fire 100%---lagrange

VehicleZoneDistribution.firecien = {};
VehicleZoneDistribution.firecien.vehicles = {};
VehicleZoneDistribution.firecien.vehicles["Base.87c10fireLagrange"] = {index = -1, spawnChance = 70};
VehicleZoneDistribution.firecien.vehicles["Base.firepumperLagrangeFD"] = {index = -1, spawnChance = 75};

VehicleZoneDistribution.firecien.spawnRate = 100;


---fire 50%---lagrange

VehicleZoneDistribution.firecincuenta = {};
VehicleZoneDistribution.firecincuenta.vehicles = {};
VehicleZoneDistribution.firecincuenta.vehicles["Base.87c10fireLagrange"] = {index = -1, spawnChance = 70};
VehicleZoneDistribution.firecincuenta.vehicles["Base.firepumperLagrangeFD"] = {index = -1, spawnChance = 75};

VehicleZoneDistribution.firecincuenta.spawnRate = 50;

---fire 100%---ballards

VehicleZoneDistribution.firecienbd = VehicleZoneDistribution.firecienbd or {};
VehicleZoneDistribution.firecienbd.vehicles = VehicleZoneDistribution.firecienbd.vehicles or {};

VehicleZoneDistribution.firecienbd = {};
VehicleZoneDistribution.firecienbd.vehicles = {};
VehicleZoneDistribution.firecienbd.vehicles["Base.87c10fireballards"] = {index = -1, spawnChance = 70};
VehicleZoneDistribution.firecienbd.vehicles["Base.firepumperballardsFD"] = {index = -1, spawnChance = 75};

VehicleZoneDistribution.firecienbd.spawnRate = 100;


---fire 50%---ballards

VehicleZoneDistribution.firecincuentabd = VehicleZoneDistribution.firecincuentabd or {};
VehicleZoneDistribution.firecincuentabd.vehicles = VehicleZoneDistribution.firecincuentabd.vehicles or {};

VehicleZoneDistribution.firecincuentabd = {};
VehicleZoneDistribution.firecincuentabd.vehicles = {};
VehicleZoneDistribution.firecincuentabd.vehicles["Base.87c10fireballards"] = {index = -1, spawnChance = 70};
VehicleZoneDistribution.firecincuentabd.vehicles["Base.firepumperballardsFD"] = {index = -1, spawnChance = 75};

VehicleZoneDistribution.firecincuentabd.spawnRate = 50;

end