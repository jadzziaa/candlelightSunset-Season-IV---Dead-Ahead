if getActivatedMods():contains("SpecialEmergencyVehiclesFRsm") and VehicleZoneDistribution then
--------------------------------New spawn zones--------------------------------



---FEMAPack 100%---

VehicleZoneDistribution.femacien = VehicleZoneDistribution.femacien or {};
VehicleZoneDistribution.femacien.vehicles = VehicleZoneDistribution.femacien.vehicles or {};

VehicleZoneDistribution.femacien.vehicles["Base.Vehicles_fematruck01"] = {index = -1, spawnChance = 15};
VehicleZoneDistribution.femacien.vehicles["Base.80f350ambulanceFEMAas"] = {index = -1, spawnChance = 15};

VehicleZoneDistribution.femacien.spawnRate = 100;


---FEMAPack 50%---

VehicleZoneDistribution.femacincuenta = VehicleZoneDistribution.femacincuenta or {};
VehicleZoneDistribution.femacincuenta.vehicles = VehicleZoneDistribution.femacincuenta.vehicles or {};


VehicleZoneDistribution.femacincuenta.vehicles["Base.Vehicles_fematruck01"] = {index = -1, spawnChance = 15};
VehicleZoneDistribution.femacincuenta.vehicles["Base.80f350ambulanceFEMAas"] = {index = -1, spawnChance = 15};

VehicleZoneDistribution.femacincuenta.spawnRate = 50;
end