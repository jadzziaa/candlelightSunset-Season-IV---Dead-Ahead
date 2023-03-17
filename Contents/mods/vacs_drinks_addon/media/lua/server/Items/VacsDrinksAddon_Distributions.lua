require "Items/ProceduralDistributions"
require "Items/Distributions"
require "Vehicles/VehicleDistributions"

local k, v, i, j

local OPTIONS = VACS_DRINKS_ADDON.OPTIONS

local spawn5hourenergy = true
local spawnburn = true
local spawnmonster = true
local spawnnos = true
local spawnredbull = true
local spawnrockstar = true
local spawnkarhu = true
local spawnlongdrink = true

if ModOptions and ModOptions.getInstance then
  local settings = ModOptions:getInstance(OPTIONS, "vacsdrinksaddon", "Vac's Drinks Addon")

  ModOptions:loadFile()

  spawn5hourenergy = OPTIONS.spawn5hourenergy
  spawnburn = OPTIONS.spawnburn
  spawnmonster = OPTIONS.spawnmonster
  spawnnos = OPTIONS.spawnnos
  spawnredbull = OPTIONS.spawnredbull
  spawnrockstar = OPTIONS.spawnrockstar
  spawnkarhu = OPTIONS.spawnkarhu
  spawnlongdrink = OPTIONS.spawnlongdrink
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

if(spawn5hourenergy)then
  table.insert(vacsdrinksPopsToAdd,"vacsdrinksaddon.VacsDrinks_Can_5HourEnergyDrink")
  table.insert(vacsdrinksEmptyPopsToAdd,"vacsdrinksaddon.VacsDrinks_Can_5HourEnergyDrink_Empty")
end

if(spawnburn)then
  table.insert(vacsdrinksPopsToAdd,"vacsdrinksaddon.VacsDrinks_Can_Burn")
  table.insert(vacsdrinksEmptyPopsToAdd,"vacsdrinksaddon.VacsDrinks_Can_Burn_Empty")
end

if(spawnmonster)then
  table.insert(vacsdrinksPopsToAdd,"vacsdrinksaddon.VacsDrinks_Can_Monster")
  table.insert(vacsdrinksEmptyPopsToAdd,"vacsdrinksaddon.VacsDrinks_Can_Monster_Empty")
end

if(spawnnos)then
  table.insert(vacsdrinksPopsToAdd,"vacsdrinksaddon.VacsDrinks_Can_Nos")
  table.insert(vacsdrinksEmptyPopsToAdd,"vacsdrinksaddon.VacsDrinks_Can_Nos_Empty")
end

if(spawnredbull)then
  table.insert(vacsdrinksPopsToAdd,"vacsdrinksaddon.VacsDrinks_Can_Redbull")
  table.insert(vacsdrinksEmptyPopsToAdd,"vacsdrinksaddon.VacsDrinks_Can_Redbull_Empty")
end

if(spawnrockstar)then
  table.insert(vacsdrinksPopsToAdd,"vacsdrinksaddon.VacsDrinks_Can_Rockstar")
  table.insert(vacsdrinksEmptyPopsToAdd,"vacsdrinksaddon.VacsDrinks_Can_Rockstar_Empty")
end

if(spawnrockstar)then
  table.insert(vacsdrinksPopsToAdd,"vacsdrinksaddon.VacsDrinks_Can_Rockstar")
  table.insert(vacsdrinksEmptyPopsToAdd,"vacsdrinksaddon.VacsDrinks_Can_Rockstar_Empty")
end

if(spawnkarhu)then
  table.insert(vacsdrinksBeersToAdd,"vacsdrinksaddon.VacsDrinks_Can_Karhu")
  table.insert(vacsdrinksEmptyBeersToAdd,"vacsdrinksaddon.VacsDrinks_Can_Karhu_Empty")
end

if(spawnlongdrink)then
  table.insert(vacsdrinksBeersToAdd,"vacsdrinksaddon.VacsDrinks_Can_LongDrink")
  table.insert(vacsdrinksEmptyBeersToAdd,"vacsdrinksaddon.VacsDrinks_Can_LongDrink_Empty")
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