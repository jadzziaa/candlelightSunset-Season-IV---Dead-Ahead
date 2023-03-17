require 'Items/SuburbsDistributions'
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"
require "Items/ItemPicker"

print("[MilitaryPonchosExpanded] Adding To Procedural Distribution..")

local ponchoItems =
{
	"Base.MPonchoGreenUP",
	"Base.MPonchoYellowUP",
	"Base.MPonchoBlackUP",
	"Base.MPonchoRedUP",
	"Base.MPonchoNavyUP",
	"Base.MPonchoBrownUP",
	"Base.MPonchoWhiteUP",
}

--All of these are half the rates of the original mod since they were a bit overly common.
local variantCount = #ponchoItems + 1 --+1 is for the cow one handled outside the list.

for _,item in pairs(ponchoItems) do

	table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, item);
	table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, 5 / variantCount);

	table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, item)
	table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, 2.5 / variantCount)	
		
	table.insert(ProceduralDistributions.list["ArmySurplusOutfit"].items, item);
	table.insert(ProceduralDistributions.list["ArmySurplusOutfit"].items, 5 / variantCount);

	table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, item);
	table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, 5 / variantCount);

	table.insert(ProceduralDistributions.list["GunStoreShelf"].items, item);
	table.insert(ProceduralDistributions.list["GunStoreShelf"].items, 2.5 / variantCount);

	table.insert(ProceduralDistributions.list["CampingStoreGear"].items, item);
	table.insert(ProceduralDistributions.list["CampingStoreGear"].items, 1 / variantCount);

	table.insert(ProceduralDistributions.list.CampingStoreBackpacks.items, item)
	table.insert(ProceduralDistributions.list.CampingStoreBackpacks.items, 1 / variantCount)

	table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, item);
	table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 1 / variantCount);
		
	table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, item);
	table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 1 / variantCount);
		
	table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, item);
	table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1 / variantCount);
		
	table.insert(VehicleDistributions["SurvivalistTruckBed"].items, item);
	table.insert(VehicleDistributions["SurvivalistTruckBed"].items, 2.5 / variantCount);	

	table.insert(VehicleDistributions["HunterTruckBed"].items, item);
	table.insert(VehicleDistributions["HunterTruckBed"].items, 2.5 / variantCount);
	
end

--Cow Poncho is done on its own and because it's found 1/4 as often as the rest.

local item = "Base.MPonchoCowUP"

table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, item);
table.insert(ProceduralDistributions.list["ArmyStorageOutfit"].items, 1.25 / variantCount);

table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, item)
table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, .625 / variantCount)	
	
table.insert(ProceduralDistributions.list["ArmySurplusOutfit"].items, item);
table.insert(ProceduralDistributions.list["ArmySurplusOutfit"].items, 1.25 / variantCount);

table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, item);
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, 1.25 / variantCount);

table.insert(ProceduralDistributions.list["GunStoreShelf"].items, item);
table.insert(ProceduralDistributions.list["GunStoreShelf"].items, .625 / variantCount);

table.insert(ProceduralDistributions.list["CampingStoreGear"].items, item);
table.insert(ProceduralDistributions.list["CampingStoreGear"].items, .25 / variantCount);

table.insert(ProceduralDistributions.list.CampingStoreBackpacks.items, item)
table.insert(ProceduralDistributions.list.CampingStoreBackpacks.items, .25 / variantCount)

table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, item);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, .25 / variantCount);
	
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, item);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, .25 / variantCount);
	
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, item);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, .25 / variantCount);
	
table.insert(VehicleDistributions["SurvivalistTruckBed"].items, item);
table.insert(VehicleDistributions["SurvivalistTruckBed"].items, .625 / variantCount);	

table.insert(VehicleDistributions["HunterTruckBed"].items, item);
table.insert(VehicleDistributions["HunterTruckBed"].items, .625 / variantCount);