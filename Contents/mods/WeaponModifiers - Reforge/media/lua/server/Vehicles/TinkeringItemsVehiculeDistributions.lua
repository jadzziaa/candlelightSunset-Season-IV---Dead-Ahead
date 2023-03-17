require "Vehicles/VehicleDistributions"

table.insert(VehicleDistributions["PostalTruckBed"].items, "WeaponModifiers.BookTinkering1");
table.insert(VehicleDistributions["PostalTruckBed"].items, 6);
table.insert(VehicleDistributions["PostalTruckBed"].items, "WeaponModifiers.BookTinkering2");
table.insert(VehicleDistributions["PostalTruckBed"].items, 4);
table.insert(VehicleDistributions["PostalTruckBed"].items, "WeaponModifiers.BookTinkering3");
table.insert(VehicleDistributions["PostalTruckBed"].items, 2);
table.insert(VehicleDistributions["PostalTruckBed"].items, "WeaponModifiers.BookTinkering4");
table.insert(VehicleDistributions["PostalTruckBed"].items, 1);
table.insert(VehicleDistributions["PostalTruckBed"].items, "WeaponModifiers.BookTinkering5");
table.insert(VehicleDistributions["PostalTruckBed"].items, 0.5);

table.insert(VehicleDistributions["PostalTruckBed"].items, "WeaponModifiers.TinkeringMag");
table.insert(VehicleDistributions["PostalTruckBed"].items, 0.5);

VehicleDistributions.Postal.TruckBed = VehicleDistributions.PostalTruckBed;
