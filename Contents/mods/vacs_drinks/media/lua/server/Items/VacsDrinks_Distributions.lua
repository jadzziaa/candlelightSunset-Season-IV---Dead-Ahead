require "Items/ProceduralDistributions"
require "Items/Distributions"
require "Vehicles/VehicleDistributions"

local k, v, i, j

local OPTIONS = VACS_DRINKS.OPTIONS

local removevanilladrinks = true
local spawnbudlight = true
local spawnbudweiser = true
local spawncoorslight = true
local spawncoronaextra = true
local spawnheineken = true
local spawnmillerlite = true
local spawnmodelo = true
local spawnblueribbon = true
local spawnbluemoon = true
local spawncocacola = true
local spawnpepsi = true
local spawndietcoke = true
local spawndrpepper = true
local spawnmountaindew = true
local spawnsprite = true
local spawndietpepsi = true
local spawnfanta = true
local spawnmugrootbeer = true

if ModOptions and ModOptions.getInstance then
  local settings = ModOptions:getInstance(OPTIONS, "vacsdrinks", "Vac's Drinks")

  ModOptions:loadFile()

  removevanilladrinks = OPTIONS.removevanilladrinks
  spawnbudlight = OPTIONS.spawnbudlight
  spawnbudweiser = OPTIONS.spawnbudweiser
  spawncoorslight = OPTIONS.spawncoorslight
  spawncoronaextra = OPTIONS.spawncoronaextra
  spawnheineken = OPTIONS.spawnheineken
  spawnmillerlite = OPTIONS.spawnmillerlite
  spawnmodelo = OPTIONS.spawnmodelo
  spawnblueribbon = OPTIONS.spawnblueribbon
  spawnbluemoon = OPTIONS.spawnbluemoon
  spawncocacola = OPTIONS.spawncocacola
  spawnpepsi = OPTIONS.spawnpepsi
  spawndietcoke = OPTIONS.spawndietcoke
  spawndrpepper = OPTIONS.spawndrpepper
  spawnmountaindew = OPTIONS.spawnmountaindew
  spawnsprite = OPTIONS.spawnsprite
  spawndietpepsi = OPTIONS.spawndietpepsi
  spawnfanta = OPTIONS.spawnfanta
  spawnmugrootbeer = OPTIONS.spawnmugrootbeer
end

local removeItemFromPopTable = {
  "Pop",
  "Pop2",
  "Pop3",
  "PopBottle",
  "PopEmpty",
  "PopBottleEmpty",
}

local removeItemFromBeerTable = {
  "BeerBottle",
  "BeerCan",
  "BeerEmpty",
  "BeerCanEmpty",
}

local proceduralDistPopLocations = {
  "BandPracticeFridge",
  "BandPracticeFridge",
  "BandPracticeFridge",
  "BandPracticeFridge",
  "BarCounterMisc",
  "BarCounterMisc",
  "BarCounterMisc",
  "BarCounterMisc",
  "BinBar",
  "BinGeneric",
  "BinGeneric",
  "CafeteriaDrinks",
  "CafeteriaDrinks",
  "CafeteriaDrinks",
  "CafeteriaDrinks",
  "ClassroomDesk",
  "CrateEmptyMixed",
  "CrateEmptyMixed",
  "CrateEmptyMixed",
  "CrateEmptyMixed",
  "CrateEmptyMixed",
  "CrateEmptyMixed",
  "CrateEmptyMixed",
  "CrateSodaBottles",
  "CrateSodaBottles",
  "CrateSodaBottles",
  "CrateSodaBottles",
  "CrateSodaBottles",
  "CrateSodaCans",
  "CrateSodaCans",
  "CrateSodaCans",
  "CrateSodaCans",
  "CrateSodaCans",
  "CrateSodaCans",
  "FridgeBottles",
  "FridgeBottles",
  "FridgeBottles",
  "FridgeBottles",
  "FridgeBreakRoom",
  "FridgeBreakRoom",
  "FridgeBreakRoom",
  "FridgeBreakRoom",
  "FridgeGeneric",
  "FridgeOffice",
  "FridgeOffice",
  "FridgeOffice",
  "FridgeOffice",
  "FridgeRich",
  "FridgeSoda",
  "FridgeSoda",
  "FridgeSoda",
  "FridgeSoda",
  "FridgeSoda",
  "FridgeSoda",
  "FridgeSoda",
  "FridgeSoda",
  "FridgeTrailerPark",
  "FridgeTrailerPark",
  "FridgeTrailerPark",
  "FridgeTrailerPark",
  "GasStorageCombo",
  "GasStorageCombo",
  "GasStorageCombo",
  "GasStorageCombo",
  "GigamartBottles",
  "GigamartBottles",
  "GigamartBottles",
  "GigamartBottles",
  "GigamartBottles",
  "GigamartBottles",
  "GigamartBottles",
  "GigamartBottles",
  "GigamartCrisps",
  "KitchenBottles",
  "KitchenBottles",
  "KitchenBottles",
  "KitchenBottles",
  "KitchenBottles",
  "MotelFridge",
  "MotelFridge",
  "MotelFridge",
  "MotelFridge",
  "MotelFridge",
  "StoreShelfCombo",
  "StoreShelfCombo",
  "StoreShelfCombo",
  "StoreShelfCombo",
  "StoreShelfCombo",
  "StoreShelfDrinks",
  "StoreShelfDrinks",
  "StoreShelfDrinks",
  "StoreShelfDrinks",
  "StoreShelfDrinks",
  "StoreShelfDrinks",
  "StoreShelfDrinks",
  "StoreShelfDrinks",
  "TheatreDrinks",
  "TheatreDrinks",
  "TheatreDrinks",
  "TheatreDrinks",
  "TheatreDrinks",
  "TheatreDrinks",
  "TheatreDrinks",
  "TheatreDrinks",
  "TheatreDrinks",
  "TheatreDrinks",
}

local proceduralDistBeerLocations = {
  "BandPracticeFridge",
  "BandPracticeFridge",
  "BandPracticeFridge",
  "BandPracticeFridge",
  "BarCounterLiquor",
  "BarCounterLiquor",
  "BarCounterLiquor",
  "BarCounterLiquor",
  "BarCounterLiquor",
  "BarCounterLiquor",
  "BarCounterLiquor",
  "BarCounterLiquor",
  "BarCounterWeapon",
  "BarCounterWeapon",
  "BarCounterWeapon",
  "BarCounterWeapon",
  "BarCounterWeapon",
  "BarCounterWeapon",
  "BarCounterWeapon",
  "BarCounterWeapon",
  "BarShelfLiquor",
  "BarShelfLiquor",
  "BarShelfLiquor",
  "BarShelfLiquor",
  "BarShelfLiquor",
  "BarShelfLiquor",
  "BarShelfLiquor",
  "BarShelfLiquor",
  "BinBar",
  "BinBar",
  "BinBar",
  "BinBar",
  "BinBar",
  "BinBar",
  "BinGeneric",
  "BinGeneric",
  "BreweryBottles",
  "BreweryBottles",
  "BreweryBottles",
  "BreweryBottles",
  "BreweryBottles",
  "BreweryCans",
  "BreweryCans",
  "BreweryCans",
  "BreweryCans",
  "BreweryCans",
  "BreweryEmptyBottles",
  "BreweryEmptyBottles",
  "BreweryEmptyBottles",
  "BreweryEmptyBottles",
  "BreweryEmptyBottles",
  "CrateEmptyBottles1",
  "CrateEmptyBottles1",
  "CrateEmptyBottles1",
  "CrateEmptyBottles1",
  "CrateEmptyBottles1",
  "DrugShackDrugs",
  "DrugShackDrugs",
  "DrugShackDrugs",
  "DrugShackDrugs",
  "FridgeBeer",
  "FridgeBeer",
  "FridgeBeer",
  "FridgeBeer",
  "FridgeBeer",
  "FridgeBeer",
  "FridgeBeer",
  "FridgeBeer",
  "FridgeGeneric",
  "FridgeGeneric",
  "FridgeRich",
  "FridgeTrailerPark",
  "KitchenBottles",
  "KitchenBottles",
  "StoreShelfBeer",
  "StoreShelfBeer",
  "StoreShelfBeer",
  "StoreShelfBeer",
  "StoreShelfBeer",
  "StoreShelfBeer",
  "StoreShelfBeer",
  "StoreShelfBeer",
}

local distPopLocations = {
  "bin",
  "bin",
  "vendingpop",
  "vendingpop",
  "vendingpop",
  "vendingpop",
}

local distPopLocations2 = {
  "Bag_Schoolbag",
  "GroceryBag1",
  "GroceryBag1",
  "GroceryBag1",
  "GroceryBag1",
  "GroceryBag3",
  "GroceryBag3",
  "GroceryBag3",
  "GroceryBag3",
  "GroceryBag5",
  "GroceryBag5",
  "GroceryBag5",
  "GroceryBag5",
  "GroceryBag5",
  "GroceryBag5",
  "GroceryBag5",
  "GroceryBag5",
  "Bag_Satchel",
}

local distBeerLocations = {
  "bin",
  "bin",
  "Outfit_Biker",
  "Outfit_Punk",
  "Outfit_Punk",
  "Outfit_Redneck",
  "Outfit_Rocker",
}

local vehDistPopLocations = {
  "TrunkStandard",
  "TrunkStandard",
  "TrunkHeavy",
  "TrunkHeavy",
  "TrunkSports",
  "TrunkSports",
  "SurvivalistTruckBed",
  "SurvivalistTruckBed",
  "FishermanTruckBed",
  "FishermanTruckBed",
  "GroceriesTruckBed",
  "GroceriesTruckBed",
  "GolfTruckBed",
  "GolfTruckBed",
  "ClothingTruckBed",
  "ClothingTruckBed",
  "CarpenterTruckBed",
  "CarpenterTruckBed",
  "ElectricianTruckBed",
  "FarmerTruckBed",
  "MetalWelderTruckBed",
  "DoctorTruckBed",
  "RadioTruckBed",
  "PainterTruckBed",
  "ConstructionWorkerTruckBed",
  "TaxiTruckBed",
  "PoliceTruckBed",
  "RangerTruckBed",
  "FossoilTruckBed",
  "PostalTruckBed",
  "SpiffoTruckBed",
  "MassGenFacTruckBed",
  "TransitTruckBed",
  "DistilleryTruckBed",
  "HeraldsTruckBed",
  "AmbulanceTruckBed",
  "ElectricianTruckBed",
  "FarmerTruckBed",
  "MetalWelderTruckBed",
  "DoctorTruckBed",
  "RadioTruckBed",
  "PainterTruckBed",
  "ConstructionWorkerTruckBed",
  "TaxiTruckBed",
  "PoliceTruckBed",
  "RangerTruckBed",
  "FossoilTruckBed",
  "PostalTruckBed",
  "SpiffoTruckBed",
  "SpiffoTruckBed",
  "SpiffoTruckBed",
  "MassGenFacTruckBed",
  "TransitTruckBed",
  "DistilleryTruckBed",
  "HeraldsTruckBed",
  "AmbulanceTruckBed",
}

if(removevanilladrinks) then
  --Remove Pops from ProceduralDistributions
  for i = 1, #removeItemFromPopTable do
    for j = 1, #proceduralDistPopLocations do
      for k,v in ipairs(ProceduralDistributions.list[proceduralDistPopLocations[j]].items) do
        if(ProceduralDistributions.list[proceduralDistPopLocations[j]].items[k] == removeItemFromPopTable[i]) then
          table.remove(ProceduralDistributions.list[proceduralDistPopLocations[j]].items,k+1)
          table.remove(ProceduralDistributions.list[proceduralDistPopLocations[j]].items,k)
        end
      end
    end
  end
  --Remove Beers from ProceduralDistributions
  for i = 1, #removeItemFromBeerTable do
    for j = 1, #proceduralDistBeerLocations do
      for k,v in ipairs(ProceduralDistributions.list[proceduralDistBeerLocations[j]].items) do
        if(ProceduralDistributions.list[proceduralDistBeerLocations[j]].items[k] == removeItemFromBeerTable[i]) then
          table.remove(ProceduralDistributions.list[proceduralDistBeerLocations[j]].items,k+1)
          table.remove(ProceduralDistributions.list[proceduralDistBeerLocations[j]].items,k)
        end
      end
    end
  end

  --Remove Pops from SuburbsDistributions
  for i = 1, #removeItemFromPopTable do
    for j = 1, #distPopLocations do
      for k,v in ipairs(SuburbsDistributions["all"][distPopLocations[j]].items) do
        if(SuburbsDistributions["all"][distPopLocations[j]].items[k] == removeItemFromPopTable[i]) then
          table.remove(SuburbsDistributions["all"][distPopLocations[j]].items,k+1)
          table.remove(SuburbsDistributions["all"][distPopLocations[j]].items,k)
        end
      end
    end
  end

  --Remove Pops from SuburbsDistributions
  for i = 1, #removeItemFromPopTable do
    for j = 1, #distPopLocations2 do
      for k,v in ipairs(SuburbsDistributions[distPopLocations2[j]].items) do
        if(SuburbsDistributions[distPopLocations2[j]].items[k] == removeItemFromPopTable[i]) then
          table.remove(SuburbsDistributions[distPopLocations2[j]].items,k+1)
          table.remove(SuburbsDistributions[distPopLocations2[j]].items,k)
        end
      end
    end
  end

  --Remove Beers from SuburbsDistributions
  for i = 1, #removeItemFromBeerTable do
    for j = 1, #distBeerLocations do
      for k,v in ipairs(SuburbsDistributions["all"][distBeerLocations[j]].items) do
        if(SuburbsDistributions["all"][distBeerLocations[j]].items[k] == removeItemFromBeerTable[i]) then
          table.remove(SuburbsDistributions["all"][distBeerLocations[j]].items,k+1)
          table.remove(SuburbsDistributions["all"][distBeerLocations[j]].items,k)
        end
      end
    end
  end

  --Remove Pops from VehicleDistributions
  for i = 1, #removeItemFromPopTable do
    for j = 1, #vehDistPopLocations do
      for k,v in ipairs(VehicleDistributions[vehDistPopLocations[j]].items) do
        if(VehicleDistributions[vehDistPopLocations[j]].items[k] == removeItemFromPopTable[i]) then
          table.remove(VehicleDistributions[vehDistPopLocations[j]].items,k+1)
          table.remove(VehicleDistributions[vehDistPopLocations[j]].items,k)
        end
      end
    end
  end
end

local vacsdrinksPopsToAdd = {}

local vacsdrinksEmptyPopsToAdd = {}

local vacsdrinksBeersToAdd = {}

local vacsdrinksEmptyBeersToAdd = {}

local vacsdrinksProcDistLocations = {
  "BandPracticeFridge",2,
  "BarCounterMisc",4,
  "CafeteriaDrinks",4,
  "ClassroomDesk",0.11,
  "CrateSodaBottles",12,
  "CrateSodaCans",10,
  "FridgeBottles",6.6,
  "FridgeBreakRoom",2,
  "FridgeGeneric",0.22,
  "FridgeOffice",2,
  "FridgeRich",0.22,
  "FridgeSoda",13.3,
  "FridgeTrailerPark",0.9,
  "GasStorageCombo",4.5,
  "GigamartBottles",13.3,
  "KitchenBottles",5.1,
  "MotelFridge",3.3,
  "StoreShelfCombo",6.6,
  "StoreShelfDrinks",13.3,
  "TheatreDrinks",16.6,
}

local vacsdrinksProcBeerDistLocations = {
  "BandPracticeFridge",6.6,
  "BarCounterLiquor",13,
  "BarCounterWeapon",13,
  "BarShelfLiquor",13,
  "BreweryBottles",13,
  "BreweryCans",13,
  "DrugShackDrugs",6.6,
  "FridgeBeer",13,
  "FridgeGeneric",0.22,
  "FridgeRich",0.44,
  "FridgeTrailerPark",0.44,
  "KitchenBottles",0.33,
  "StoreShelfBeer",13,
}

local vacsdrinksProcEmptyBeerDistLocations = {
  "BinBar",10,
  "BinGeneric",0.33,
  "BreweryEmptyBottles",13,
  "CrateEmptyBottles1",13,
}

local vacsdrinksProcEmptyPopDistLocations = {
  "BinBar",0.1,
  "BinGeneric",0.66,
  "CrateEmptyMixed",12.2,
}

if(spawnbudlight)then
  table.insert(vacsdrinksBeersToAdd,"vacsdrinks.VacsDrinks_Can_Budlight")
  table.insert(vacsdrinksEmptyBeersToAdd,"vacsdrinks.VacsDrinks_Can_Budlight_Empty")
end

if(spawnbudweiser)then
  table.insert(vacsdrinksBeersToAdd,"vacsdrinks.VacsDrinks_Can_Budweiser")
  table.insert(vacsdrinksEmptyBeersToAdd,"vacsdrinks.VacsDrinks_Can_Budweiser_Empty")
end

if(spawncoorslight)then
  table.insert(vacsdrinksBeersToAdd,"vacsdrinks.VacsDrinks_Can_CoorsLight")
  table.insert(vacsdrinksEmptyBeersToAdd,"vacsdrinks.VacsDrinks_Can_CoorsLight_Empty")
end

if(spawncoronaextra)then
  table.insert(vacsdrinksBeersToAdd,"vacsdrinks.VacsDrinks_Can_CoronaExtra")
  table.insert(vacsdrinksEmptyBeersToAdd,"vacsdrinks.VacsDrinks_Can_CoronaExtra_Empty")
end

if(spawnheineken)then
  table.insert(vacsdrinksBeersToAdd,"vacsdrinks.VacsDrinks_Can_Heineken")
  table.insert(vacsdrinksEmptyBeersToAdd,"vacsdrinks.VacsDrinks_Can_Heineken_Empty")
end

if(spawnmillerlite)then
  table.insert(vacsdrinksBeersToAdd,"vacsdrinks.VacsDrinks_Can_MillerLite")
  table.insert(vacsdrinksEmptyBeersToAdd,"vacsdrinks.VacsDrinks_Can_MillerLite_Empty")
end

if(spawnmodelo)then
  table.insert(vacsdrinksBeersToAdd,"vacsdrinks.VacsDrinks_Can_Modelo")
  table.insert(vacsdrinksEmptyBeersToAdd,"vacsdrinks.VacsDrinks_Can_Modelo_Empty")
end

if(spawnblueribbon)then
  table.insert(vacsdrinksBeersToAdd,"vacsdrinks.VacsDrinks_Can_BlueRibbon")
  table.insert(vacsdrinksEmptyBeersToAdd,"vacsdrinks.VacsDrinks_Can_BlueRibbon_Empty")
end

if(spawnbluemoon)then
  table.insert(vacsdrinksBeersToAdd,"vacsdrinks.VacsDrinks_Can_BlueMoon")
  table.insert(vacsdrinksEmptyBeersToAdd,"vacsdrinks.VacsDrinks_Can_BlueMoon_Empty")
end

if(spawncocacola)then
  table.insert(vacsdrinksPopsToAdd,"vacsdrinks.VacsDrinks_Can_CocaCola")
  table.insert(vacsdrinksEmptyPopsToAdd,"vacsdrinks.VacsDrinks_Can_CocaCola_Empty")
end

if(spawnpepsi)then
  table.insert(vacsdrinksPopsToAdd,"vacsdrinks.VacsDrinks_Can_Pepsi")
  table.insert(vacsdrinksEmptyPopsToAdd,"vacsdrinks.VacsDrinks_Can_Pepsi_Empty")
end

if(spawndietcoke)then
  table.insert(vacsdrinksPopsToAdd,"vacsdrinks.VacsDrinks_Can_DietCoke")
  table.insert(vacsdrinksEmptyPopsToAdd,"vacsdrinks.VacsDrinks_Can_DietCoke_Empty")
end

if(spawndrpepper)then
  table.insert(vacsdrinksPopsToAdd,"vacsdrinks.VacsDrinks_Can_DrPepper")
  table.insert(vacsdrinksEmptyPopsToAdd,"vacsdrinks.VacsDrinks_Can_DrPepper_Empty")
end

if(spawnmountaindew)then
  table.insert(vacsdrinksPopsToAdd,"vacsdrinks.VacsDrinks_Can_MountainDew")
  table.insert(vacsdrinksEmptyPopsToAdd,"vacsdrinks.VacsDrinks_Can_MountainDew_Empty")
end

if(spawnsprite)then
  table.insert(vacsdrinksPopsToAdd,"vacsdrinks.VacsDrinks_Can_Sprite")
  table.insert(vacsdrinksEmptyPopsToAdd,"vacsdrinks.VacsDrinks_Can_Sprite_Empty")
end

if(spawndietpepsi)then
  table.insert(vacsdrinksPopsToAdd,"vacsdrinks.VacsDrinks_Can_DietPepsi")
  table.insert(vacsdrinksEmptyPopsToAdd,"vacsdrinks.VacsDrinks_Can_DietPepsi_Empty")
end

if(spawnfanta)then
  table.insert(vacsdrinksPopsToAdd,"vacsdrinks.VacsDrinks_Can_Fanta")
  table.insert(vacsdrinksEmptyPopsToAdd,"vacsdrinks.VacsDrinks_Can_Fanta_Empty")
end

if(spawnmugrootbeer)then
  table.insert(vacsdrinksPopsToAdd,"vacsdrinks.VacsDrinks_Can_MugRootBeer")
  table.insert(vacsdrinksEmptyPopsToAdd,"vacsdrinks.VacsDrinks_Can_MugRootBeer_Empty")
end




--Add Empty vacsdrinks cans to vehicles
for i = 1, #vacsdrinksEmptyPopsToAdd do
  table.insert(VehicleDistributions["SpiffoTruckBed"].items,vacsdrinksEmptyPopsToAdd[i])
  table.insert(VehicleDistributions["SpiffoTruckBed"].items,4)
end

--Add vacsdrinks pops to ProceduralDistributions
for i = 1, #vacsdrinksPopsToAdd do
  for j = 1, #vacsdrinksProcDistLocations, 2 do
    table.insert(ProceduralDistributions.list[vacsdrinksProcDistLocations[j]].items,vacsdrinksPopsToAdd[i])
    table.insert(ProceduralDistributions.list[vacsdrinksProcDistLocations[j]].items,vacsdrinksProcDistLocations[j+1])
  end
end

--Add Empty vacsdrinks pops to ProceduralDistributions
for i = 1, #vacsdrinksEmptyPopsToAdd do
  for j = 1, #vacsdrinksProcEmptyPopDistLocations, 2 do
    table.insert(ProceduralDistributions.list[vacsdrinksProcEmptyPopDistLocations[j]].items,vacsdrinksEmptyPopsToAdd[i])
    table.insert(ProceduralDistributions.list[vacsdrinksProcEmptyPopDistLocations[j]].items,vacsdrinksProcEmptyPopDistLocations[j+1])
  end
end

--Add vacsdrinks beers to ProceduralDistributions
for i = 1, #vacsdrinksBeersToAdd do
  for j = 1, #vacsdrinksProcBeerDistLocations, 2 do
    table.insert(ProceduralDistributions.list[vacsdrinksProcBeerDistLocations[j]].items,vacsdrinksBeersToAdd[i])
    table.insert(ProceduralDistributions.list[vacsdrinksProcBeerDistLocations[j]].items,vacsdrinksProcBeerDistLocations[j+1])
  end
end

--Add Empty vacsdrinks beers to ProceduralDistributions
for i = 1, #vacsdrinksEmptyBeersToAdd do
  for j = 1, #vacsdrinksProcEmptyBeerDistLocations, 2 do
    table.insert(ProceduralDistributions.list[vacsdrinksProcEmptyBeerDistLocations[j]].items,vacsdrinksEmptyBeersToAdd[i])
    table.insert(ProceduralDistributions.list[vacsdrinksProcEmptyBeerDistLocations[j]].items,vacsdrinksProcEmptyBeerDistLocations[j+1])
  end
end