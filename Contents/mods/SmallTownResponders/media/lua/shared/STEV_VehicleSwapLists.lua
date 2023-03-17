if getActivatedMods():contains("TreadsFuelTypesFramework") then
--- Fuels available in my mod: "Gasoline", "Diesel", "LPG"

--- Tables Index:
--- 1) Ignored vehicles (always Gasoline)
--- 2) Forced fuel type (always one type)
--- 3) Multiple available fuel types - roll based (each instance of a car can use different fuel type [from allowed])


--- 1) Table of Vehicles ignored while Fuel Type assignment function runs (Gasoline stays no matter assignment type) ---
RSFuelSwapIgnoreCars = RSFuelSwapIgnoreCars or {}	--- init the table (only once per file)
RSFuelSwapIgnoreCars["Base.91blazerranger"] = true --- add FULL car type name to the table
RSFuelSwapIgnoreCars["Base.92wrangler_USPS"] = true --- add FULL car type name to the table

--- 2) Table of Vehicles with forced Fuel Type while assignment function runs (assign and force ONE fuel type) ---
RSForceFuelSwapCars = RSForceFuelSwapCars or {} --- init the table (only once per file)
RSForceFuelSwapCars["Base.prisonbus_jefferson"] = "Diesel" --- add FULL car type name to the table and assign existing fuel type
RSForceFuelSwapCars["Base.prisonbus_meade"] = "Diesel" --- add FULL car type name to the table and assign existing fuel type
RSForceFuelSwapCars["Base.87gmcarmouredcar"] = "Diesel" --- add FULL car type name to the table and assign existing fuel type

--- 3) Table of Vehicles with multiple Fuel Types while assignment function runs ---
---Each vehicle added should keep format as in examples below.
---Sum of values per FuelType (of each vehicle) should be 100.
---Gasoline 60, Diesel 50, LPG 30 - Give 60% for Gasoline, 40% for Diesel. Each "chance" above 100 is ignored.
---Gasoline 20, Diesel 30 - Give 70% for Gasoline (requested 20 + unassigned 50) and 30% for Diesel.

RSMultiFuelSwapCars = RSMultiFuelSwapCars or {} --- init the table (only once per file)
RSMultiFuelSwapCars["Base.86econoline_jefferson"] = {}		--- add FULL car type name to the table
RSMultiFuelSwapCars["Base.86econoline_jefferson"]["Gasoline"]  = 60		--- assign the car entry a fuel type and its chance
RSMultiFuelSwapCars["Base.86econoline_jefferson"]["Diesel"]  = 40		--- assign the car entry a fuel type and its 
RSMultiFuelSwapCars["Base.86econoline_meade"] = {}		--- add FULL car type name to the table
RSMultiFuelSwapCars["Base.86econoline_meade"]["Gasoline"]  = 60		--- assign the car entry a fuel type and its chance
RSMultiFuelSwapCars["Base.86econoline_meade"]["Diesel"]  = 40		--- assign the car entry a fuel type and its 

end