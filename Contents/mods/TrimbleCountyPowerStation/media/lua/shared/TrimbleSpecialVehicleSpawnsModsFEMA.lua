if getActivatedMods():contains("FEMAPack") and VehicleZoneDistribution then
--------------------------------New spawn zones--------------------------------



---FEMAPack 100%---

VehicleZoneDistribution.femacien = VehicleZoneDistribution.femacien or {};
VehicleZoneDistribution.femacien.vehicles = VehicleZoneDistribution.femacien.vehicles or {};

VehicleZoneDistribution.femacien.vehicles["Base.FEMATruck"] = {index = -1, spawnChance = 15};
VehicleZoneDistribution.femacien.vehicles["Base.93explorerFEMA"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.femacien.vehicles["Base.86econolineFEMA"] = {index = -1, spawnChance = 35};
VehicleZoneDistribution.femacien.vehicles["Base.92crownvicCDC"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.femacien.vehicles["Base.85vicCDC"] = {index = -1, spawnChance = 20};

VehicleZoneDistribution.femacien.spawnRate = 100;


---FEMAPack 50%---

VehicleZoneDistribution.femacincuenta = VehicleZoneDistribution.femacincuenta or {};
VehicleZoneDistribution.femacincuenta.vehicles = VehicleZoneDistribution.femacincuenta.vehicles or {};


VehicleZoneDistribution.femacincuenta.vehicles["Base.FEMATruck"] = {index = -1, spawnChance = 15};
VehicleZoneDistribution.femacincuenta.vehicles["Base.93explorerFEMA"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.femacincuenta.vehicles["Base.86econolineFEMA"] = {index = -1, spawnChance = 35};
VehicleZoneDistribution.femacincuenta.vehicles["Base.92crownvicCDC"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.femacincuenta.vehicles["Base.85vicCDC"] = {index = -1, spawnChance = 20};

VehicleZoneDistribution.femacincuenta.spawnRate = 50;
end