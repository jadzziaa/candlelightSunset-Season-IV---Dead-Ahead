require 'Items/SuburbsDistributions'
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"






--Item drops.
--Set Sandbox Settings values.
local PerishableSpawnChance = SandboxVars.SapphCooking.PerishableChance; 
local NonPerishableSpawnChance = SandboxVars.SapphCooking.NonPerishableChance; 
local MagazineSpawnChance = SandboxVars.SapphCooking.MagazineChance; 
local MRESpawnChance = SandboxVars.SapphCooking.MREChance; 
local KitchenUtensilsSpawnChance = SandboxVars.SapphCooking.KitchenUtensilsChance;
local AlcoholSpawnChance = SandboxVars.SapphCooking.AlcoholChance;
local ZombieSpawnChance = SandboxVars.SapphCooking.ZombieLootSpawn;
--Default value is 3.
--Creates the none value.
if (PerishableSpawnChance == 6) then
PerishableSpawnChance = 0;
end

if (NonPerishableSpawnChance == 6) then
NonPerishableSpawnChance = 0;
end

if (MagazineSpawnChance == 6) then
MagazineSpawnChance = 0;
end

if (MRESpawnChance == 6) then
MRESpawnChance = 0;
end

if (KitchenUtensilsSpawnChance == 6) then
KitchenUtensilsSpawnChance = 0;
end

if (AlcoholSpawnChance == 6) then
AlcoholSpawnChance = 0;
end

if (ZombieSpawnChance == 6) then
ZombieSpawnChance = 0;
end

-- Since the sandbox options were added after a few updates, i had to divide everything by its default value then multiply by the sandbox Settings
-- i don't know if that's the optimal way.


--Random Zombie Drops
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "SapphCooking.ProteinBar");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, ZombieSpawnChance * 0.07);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "SapphCooking.PackofCandyCigarretes");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, ZombieSpawnChance * 0.006);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "SapphCooking.MeatTenderizer");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, ZombieSpawnChance * 0.0033);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "SapphCooking.ChefKnife1");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, ZombieSpawnChance * 0.0022);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "SapphCooking.ChefKnife2");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, ZombieSpawnChance * 0.0022);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "SapphCooking.ChefKnife3");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, ZombieSpawnChance * 0.0022);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "SapphCooking.Bonbon");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, ZombieSpawnChance * 0.006);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "SapphCooking.Bonbon_Liqueur");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, ZombieSpawnChance * 0.006);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "SapphCooking.Heart_Chocolate");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, ZombieSpawnChance * 0.006);






table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "SapphCooking.ProteinBar");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, ZombieSpawnChance * 0.07);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "SapphCooking.PackofCandyCigarretes");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, ZombieSpawnChance * 0.02);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "SapphCooking.MeatTenderizer");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, ZombieSpawnChance * 0.0033);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "SapphCooking.ChefKnife1");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, ZombieSpawnChance * 0.0022);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "SapphCooking.ChefKnife2");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, ZombieSpawnChance * 0.0022);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "SapphCooking.ChefKnife3");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, ZombieSpawnChance * 0.0022);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "SapphCooking.Bonbon");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, ZombieSpawnChance * 0.006);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "SapphCooking.Bonbon_Liqueur");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, ZombieSpawnChance * 0.006);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "SapphCooking.Heart_Chocolate");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, ZombieSpawnChance * 0.006);

--Survivor Bag (Rare)
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "SapphCooking.ProteinBar");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, NonPerishableSpawnChance * 0.15);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "SapphCooking.PackofCandyCigarretes");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, NonPerishableSpawnChance * 0.2);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "SapphCooking.MRE_Pack5");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, NonPerishableSpawnChance * 0.33);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "SapphCooking.MRE_Pack6");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, NonPerishableSpawnChance * 0.33);
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "SapphCooking.MRE_Pack7");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, NonPerishableSpawnChance * 0.33);

--Kitchen Pots

table.insert(ProceduralDistributions["list"]["KitchenPots"].items, "SapphCooking.PlasticSpork");
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, KitchenUtensilsSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, "SapphCooking.WokPan");
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, KitchenUtensilsSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, "SapphCooking.Laddle");
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, KitchenUtensilsSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, "SapphCooking.WoodenSpoon");
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, KitchenUtensilsSpawnChance * 2.66);
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, "SapphCooking.CoffeeGrinder");
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, KitchenUtensilsSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, "SapphCooking.PlasticFilterHolder");
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, KitchenUtensilsSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, "SapphCooking.MeatTenderizer");
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, KitchenUtensilsSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, "SapphCooking.StackBowl2");
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, KitchenUtensilsSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, "SapphCooking.StackBowl3");
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, KitchenUtensilsSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, "SapphCooking.LowballGlass");
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, KitchenUtensilsSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, "SapphCooking.CocktailGlass");
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, KitchenUtensilsSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, "SapphCooking.CocktailMixer");
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, KitchenUtensilsSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, "SapphCooking.MetalWhisk");
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, KitchenUtensilsSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, "SapphCooking.DoughnutCutter");
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, KitchenUtensilsSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, "SapphCooking.EmptyThermos");
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, KitchenUtensilsSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, "SapphCooking.ChefKnife1");
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, KitchenUtensilsSpawnChance * 0.05);
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, "SapphCooking.ChefKnife2");
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, KitchenUtensilsSpawnChance * 0.05);
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, "SapphCooking.ChefKnife3");
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, KitchenUtensilsSpawnChance * 0.05);
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, "SapphCooking.MessTray");
table.insert(ProceduralDistributions["list"]["KitchenPots"].items, KitchenUtensilsSpawnChance * 0.1);

--CrateDishes
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "SapphCooking.WokPan");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, KitchenUtensilsSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "SapphCooking.MetalWhisk");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, KitchenUtensilsSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "SapphCooking.PlasticSpork");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, KitchenUtensilsSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "SapphCooking.DoughnutCutter");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, KitchenUtensilsSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "SapphCooking.Laddle");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, KitchenUtensilsSpawnChance * 3.33);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "SapphCooking.WoodenSpoon");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, KitchenUtensilsSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "SapphCooking.MeatTenderizer");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, KitchenUtensilsSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "SapphCooking.StackBowl2");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, KitchenUtensilsSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "SapphCooking.LowballGlass");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, KitchenUtensilsSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "SapphCooking.CocktailGlass");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, KitchenUtensilsSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "SapphCooking.CocktailMixer");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, KitchenUtensilsSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "SapphCooking.StackBowl2");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, KitchenUtensilsSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "SapphCooking.CoffeeGrinder");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, KitchenUtensilsSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "SapphCooking.PlasticFilterHolder");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, KitchenUtensilsSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "Base.BakingSoda");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, KitchenUtensilsSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "SapphCooking.EmptyThermos");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, KitchenUtensilsSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "SapphCooking.ChefKnife1");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, KitchenUtensilsSpawnChance * 0.2);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "SapphCooking.ChefKnife2");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, KitchenUtensilsSpawnChance * 0.2);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "SapphCooking.ChefKnife3");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, KitchenUtensilsSpawnChance * 0.2);



--Kitchen Canned Foods
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.CanofProteinPowder");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.BagofWontonWrappers");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.CoffeeBeansBag");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.PackofCoffeeFilters");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.CanofRefriedBeans");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.PackofCandyCigarretes");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.ProteinBar");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.WhiteChocolate");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.CannedBread");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.CanofKernelCorn");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.CanofPowderedMilk");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.CannedSausages");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.PeanutOil");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.CanolaOil");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.AvocadoOil");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.MRE_Pack1");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, MRESpawnChance * 0.0004);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.MRE_Pack2");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, MRESpawnChance * 0.0004);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.MRE_Pack3");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, MRESpawnChance * 0.0004);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.MRE_Pack4");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, MRESpawnChance * 0.0004);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.MRE_Pack5");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, MRESpawnChance * 0.0004);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.MRE_Pack6");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, MRESpawnChance * 0.0004);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.MRE_Pack7");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, MRESpawnChance * 0.0004);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.MRE_Pack8");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, MRESpawnChance * 0.0004);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.MRE_Pack9");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, MRESpawnChance * 0.0004);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.MRE_Pack10");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, MRESpawnChance * 0.0004);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.MRE_Pack12");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, MRESpawnChance * 0.0004);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.Drinkmix_Lemon");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.Drinkmix_Orange");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.Drinkmix_Pineapple");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.Drinkmix_Strawberry");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.Drinkmix_Watermelon");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.Drinkmix_Peach");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.BeefBroth");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.ChickenBroth");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.ArborioRice");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.BrownRice");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.BagofSeaweed");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.BagofHotdogBuns");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, PerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.BagofFlourTortillas");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 0.8);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.GranulatedSugar");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "Base.BakingSoda");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.BagofMarshmallows");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.CanofBeets");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 1.6);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.Jello_Lime");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.Jello_Orange");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.Jello_Strawberry");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.Jello_Pineapple");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.Jello_Grape");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.BoxofTeaBags");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.CannedBacon");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.PowderedEggs");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.Box_Bonbon");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 0.0005);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.Box_LiqueurBonbons");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 0.0005);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.Box_HeartChocolate");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 0.0005);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.BagofWoodenSkewers");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, NonPerishableSpawnChance * 0.8);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.PipingBags");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, KitchenUtensilsSpawnChance * 0.2);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "SapphCooking.ClothFilter");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, KitchenUtensilsSpawnChance * 0.05);





--Fridges Generic
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.BrownEggCarton");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.FrankfurterSausage");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.ViennaSausage");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.StrawberryMilk");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 2.66);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.AlmondMilk");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 2.66);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.CheeseSandwich");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.CarbonatedWater");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, NonPerishableSpawnChance * 1.6);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.Corndog");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.ParmesanCheese");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.MozzarelaCheese");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.BowlofGuacamole");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.BottlewithProteinShake");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, NonPerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.BowlofMashedPotatoes");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.BowlofFriedRice");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.BrownRiceBowl");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.66);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.ArborioRiceBowl");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.66);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.BowlofRavioli");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.BowlofQueso");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.BowlofTortellini");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.BowlofBeefStew");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.CreamCheese");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.BottlewithMilk");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.LasagnaPiece");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.Meatballs");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.VegetableSushi");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.CutCheeseSandwich");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.BowlofInstantNoodles");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.BowlofYakisoba");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.BowlofKungPaoChicken");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.BowlofShuiZhuYu");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.WildGarlicBreadCooked");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.ColaBottle");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.BowlofJapaneseCurry");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.TinofCaviar");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, NonPerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.BowlJello_Lime");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, NonPerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.BowlJello_Strawberry");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, NonPerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.BowlJello_Orange");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, NonPerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.BowlJello_Pineapple");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, NonPerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.BowlJello_Grape");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, NonPerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.ChurrosPlain");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.Plate_BaconandEggs");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.016);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.EnergyDrink");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, NonPerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.HomemadeSourCream");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.2);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.SourCream");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.2);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.MisoPaste");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, NonPerishableSpawnChance * 0.3);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.TurkeyLegs");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.3);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "SapphCooking.Takoyaki");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, PerishableSpawnChance * 0.3);



--FridgeRich
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.BrownEggCarton");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.FrankfurterSausage");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.BottlewithProteinShake");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.ViennaSausage");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.StrawberryMilk");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.AlmondMilk");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.CheeseSandwich");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.CarbonatedWater");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.Corndog");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.ParmesanCheese");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.MozzarelaCheese");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.BowlofGuacamole");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.BowlofMashedPotatoes");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.BowlofFriedRice");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.BrownRiceBowl");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.66);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.ArborioRiceBowl");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.66);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.BowlofRavioli");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.BowlofQueso");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.BowlofTortellini");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.BowlofBeefStew");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.CreamCheese");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.BottlewithMilk");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.LasagnaPiece");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.Meatballs");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.VegetableSushi");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.CutCheeseSandwich");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.BowlofYakisoba");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.BowlofKungPaoChicken");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.BowlofShuiZhuYu");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.WildGarlicBreadCooked");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.ColaBottle");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.BowlofJapaneseCurry");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.TinofCaviar");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, NonPerishableSpawnChance * 0.66);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.TiramisuPiece");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.66);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.EnergyDrink");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, NonPerishableSpawnChance * 0.3);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.SourCream");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.6)
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "SapphCooking.Seitan");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, PerishableSpawnChance * 0.2)


--FridgeTrailerPark

table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.BrownEggCarton");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.FrankfurterSausage");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.BottlewithProteinShake");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.ViennaSausage");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.StrawberryMilk");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.AlmondMilk");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.CheeseSandwich");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.CarbonatedWater");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.Corndog");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.ParmesanCheese");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.MozzarelaCheese");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.BowlofGuacamole");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.BowlofMashedPotatoes");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.BowlofFriedRice");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.BrownRiceBowl");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.66);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.ArborioRiceBowl");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.66);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.BowlofRavioli");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.BowlofQueso");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.BowlofTortellini");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.BowlofBeefStew");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.CreamCheese");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.BottlewithMilk");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.LasagnaPiece");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.Meatballs");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.VegetableSushi");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.CutCheeseSandwich");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.BowlofYakisoba");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.BowlofKungPaoChicken");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.BowlofShuiZhuYu");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.WildGarlicBreadCooked");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.ColaBottle");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "SapphCooking.BowlofJapaneseCurry");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, PerishableSpawnChance * 0.07);


--BurgerKitchenFridge
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, "SapphCooking.BrownEggCarton");
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, PerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, "SapphCooking.BowlofQueso");
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, "SapphCooking.FrankfurterSausage");
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, "SapphCooking.ViennaSausage");
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, "SapphCooking.CarbonatedWater");
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, "SapphCooking.ParmesanCheese");
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, PerishableSpawnChance * 1.6);
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, "SapphCooking.MozzarelaCheese");
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, "SapphCooking.BowlofGuacamole");
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, PerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, "SapphCooking.CreamCheese");
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, PerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, "SapphCooking.BottlewithMilk");
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, "SapphCooking.Meatballs");
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, PerishableSpawnChance * 1.6);
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, "SapphCooking.BowlofYakisoba");
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, "SapphCooking.BowlofKungPaoChicken");
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, "SapphCooking.BowlofShuiZhuYu");
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, PerishableSpawnChance * 0.07);

--FridgeOther
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.BrownEggCarton");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.FrankfurterSausage");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.BottlewithProteinShake");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.ViennaSausage");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.SlicedChicken");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.3);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.SlicedCarrots");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.3);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.SlicedTomato");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.3);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.StrawberryMilk");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.AlmondMilk");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.CheeseSandwich");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.CarbonatedWater");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.Corndog");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.ParmesanCheese");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.MozzarelaCheese");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.BowlofGuacamole");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.BowlofMashedPotatoes");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.BowlofFriedRice");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.BowlofRavioli");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.BowlofQueso");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.BowlofTortellini");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.BowlofBeefStew");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.CreamCheese");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.BottlewithMilk");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.LasagnaPiece");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.Meatballs");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.VegetableSushi");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.CutCheeseSandwich");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.BowlofYakisoba");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.BowlofKungPaoChicken");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.BowlofShuiZhuYu");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.WildGarlicBreadCooked");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.ColaBottle");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.BowlofJapaneseCurry");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.TinofCaviar");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.Jar_Kimchi_Fermented");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, NonPerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.MisoPaste");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, NonPerishableSpawnChance * 0.3);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.TurkeyLegs");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.3);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "SapphCooking.Takoyaki");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, PerishableSpawnChance * 0.3);


--FridgeBreakRoom
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "SapphCooking.BrownEggCarton");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "SapphCooking.BottlewithProteinShake");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "SapphCooking.BowlofQueso");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "SapphCooking.FrankfurterSausage");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "SapphCooking.ViennaSausage");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "SapphCooking.StrawberryMilk");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "SapphCooking.AlmondMilk");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "SapphCooking.CheeseSandwich");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "SapphCooking.CarbonatedWater");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "SapphCooking.Corndog");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, PerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "SapphCooking.ParmesanCheese");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "SapphCooking.MozzarelaCheese");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "SapphCooking.BowlofGuacamole");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, PerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "SapphCooking.CreamCheese");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, PerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "SapphCooking.BottlewithMilk");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "SapphCooking.Meatballs");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "SapphCooking.BowlofYakisoba");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "SapphCooking.BowlofKungPaoChicken");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "SapphCooking.BowlofShuiZhuYu");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, PerishableSpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "SapphCooking.TinofCaviar");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, PerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "SapphCooking.SourCream");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, PerishableSpawnChance * 0.33);


--ClassroomDesk
table.insert(ProceduralDistributions["list"]["ClassroomDesk"].items, "SapphCooking.PackofCandyCigarretes");
table.insert(ProceduralDistributions["list"]["ClassroomDesk"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["ClassroomDesk"].items, "SapphCooking.Ladyfingers");
table.insert(ProceduralDistributions["list"]["ClassroomDesk"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["ClassroomDesk"].items, "SapphCooking.Bonbon");
table.insert(ProceduralDistributions["list"]["ClassroomDesk"].items, NonPerishableSpawnChance * 0.2);
table.insert(ProceduralDistributions["list"]["ClassroomDesk"].items, "SapphCooking.Heart_Chocolate");
table.insert(ProceduralDistributions["list"]["ClassroomDesk"].items, NonPerishableSpawnChance * 0.2);

--BinGeneric
table.insert(ProceduralDistributions["list"]["BinGeneric"].items, "SapphCooking.PackofCandyCigarretes");
table.insert(ProceduralDistributions["list"]["BinGeneric"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["BinGeneric"].items, "SapphCooking.WoodenSkewers");
table.insert(ProceduralDistributions["list"]["BinGeneric"].items, KitchenUtensilsSpawnChance * 0.8);
table.insert(ProceduralDistributions["list"]["BinGeneric"].items, "SapphCooking.MessTray");
table.insert(ProceduralDistributions["list"]["BinGeneric"].items, KitchenUtensilsSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["BinGeneric"].items, "SapphCooking.BagofWoodenSkewers");
table.insert(ProceduralDistributions["list"]["BinGeneric"].items, NonPerishableSpawnChance * 0.05);

--DaycareDesk
table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, "SapphCooking.PackofCandyCigarretes");
table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, "SapphCooking.Box_Bonbon");
table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, NonPerishableSpawnChance * 0.001);
table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, "SapphCooking.Box_HeartChocolate");
table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, NonPerishableSpawnChance * 0.001);
table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, "SapphCooking.Heart_Chocolate");
table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, NonPerishableSpawnChance * 0.5);

--DishCabinetGeneric
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.PackofCandyCigarretes");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.CanofRefriedBeans");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 1.6);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.BagofWontonWrappers");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.CoffeeBeansBag");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.PackofCoffeeFilters");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.CanofKernelCorn");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 1.6);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.CanofPowderedMilk");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 1.6);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.LowballGlass");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, KitchenUtensilsSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.CocktailGlass");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, KitchenUtensilsSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.CocktailMixer");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, KitchenUtensilsSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.StackBowl2");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, KitchenUtensilsSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.CanolaOil");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.PeanutOil");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.AvocadoOil");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.BeefBroth");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.ChickenBroth");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.Drinkmix_Lemon");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.Drinkmix_Orange");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.Drinkmix_Pineapple");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.Drinkmix_Strawberry");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.Drinkmix_Watermelon");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.Drinkmix_Peach");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.Drinkmix_Apple");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.GinFull");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, AlcoholSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.SakeFull");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, AlcoholSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.VodkaFull");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, AlcoholSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.CachaçaFull");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, AlcoholSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.TequillaFull");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, AlcoholSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.RumFull");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, AlcoholSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.SaltPacket");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.SugarPacket");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.HotsaucePacket");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.SoySauce_Sachet");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.Mustard_Sachet");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.Tomato_Sachet");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.MonosodiumGlutamate_MSG");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.PeanutButter_Sachet");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.GranulatedSugar");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.ArborioRice");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.BrownRice");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "Base.BakingSoda");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.BagofMarshmallows");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.CurryPowder");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.CanofBeets");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 1.6);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.Jello_Lime");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.Jello_Orange");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.Jello_Strawberry");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.Jello_Pineapple");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.Jello_Grape");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.CannedBacon");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.12);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.PipingBags");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, KitchenUtensilsSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.BakingMolds");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, KitchenUtensilsSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.BagofWoodenSkewers");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 1.2);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.PowderedEggs");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, NonPerishableSpawnChance * 0.06);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.MessTray");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, KitchenUtensilsSpawnChance * 0.08);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "SapphCooking.ClothFilter");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, KitchenUtensilsSpawnChance * 0.02);



--FreezerGeneric
table.insert(ProceduralDistributions["list"]["FreezerGeneric"].items, "SapphCooking.Meatballs");
table.insert(ProceduralDistributions["list"]["FreezerGeneric"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FreezerGeneric"].items, "SapphCooking.ViennaSausage");
table.insert(ProceduralDistributions["list"]["FreezerGeneric"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FreezerGeneric"].items, "SapphCooking.FrankfurterSausage");
table.insert(ProceduralDistributions["list"]["FreezerGeneric"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FreezerGeneric"].items, "SapphCooking.IcecreamSandwich");
table.insert(ProceduralDistributions["list"]["FreezerGeneric"].items, PerishableSpawnChance * 0.6);

--KitchenDryFood
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.CanolaOil");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "Base.Soysauce");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.PeanutOil");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.BagofWontonWrappers");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.CoffeeBeansBag");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.PackofCoffeeFilters");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.AvocadoOil");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.CanofRefriedBeans");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.CanofKernelCorn");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.CanofPowderedMilk");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.BrownRice");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.ArborioRice");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.BagofFlourTortillas");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.20);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.BagofHotdogBuns");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, PerishableSpawnChance * 0.22);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.BagofSeaweed");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.BeefBroth");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.ChickenBroth");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.Drinkmix_Lemon");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.Drinkmix_Orange");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.Drinkmix_Pineapple");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.Drinkmix_Strawberry");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.Drinkmix_Watermelon");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.Drinkmix_Peach");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.Drinkmix_Apple");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.PackofCandyCigarretes");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.SaltPacket");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.SugarPacket");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.HotsaucePacket");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.GranulatedSugar");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.SoySauce_Sachet");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.5);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.Mustard_Sachet");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.5);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.Tomato_Sachet");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.5);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.MonosodiumGlutamate_MSG");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.5);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.PeanutButter_Sachet");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.5);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "Base.BakingSoda");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.BagofMarshmallows");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.CurryPowder");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.Jello_Lime");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.Jello_Orange");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.Jello_Strawberry");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.Jello_Pineapple");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.Jello_Grape");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.BagofWoodenSkewers");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, NonPerishableSpawnChance * 1.2);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "SapphCooking.ClothFilter");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, KitchenUtensilsSpawnChance * 0.02);


--GigamartDryGoods
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.CanofPowderedMilk");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.BrownRice");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.ArborioRice");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.BagofFlourTortillas");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 0.20);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.BagofHotdogBuns");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, PerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.BagofSeaweed");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.Drinkmix_Lemon");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.Drinkmix_Orange");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.Drinkmix_Pineapple");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.Drinkmix_Strawberry");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.Drinkmix_Watermelon");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.Drinkmix_Peach");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.Drinkmix_Apple");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.SaltPacket");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.SugarPacket");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.HotsaucePacket");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.GranulatedSugar");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "Base.BakingSoda");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.BagofMarshmallows");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.CurryPowder");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.Jello_Lime");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.Jello_Orange");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.Jello_Strawberry");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.Jello_Pineapple");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.Jello_Grape");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "SapphCooking.BoxofTeaBags");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, NonPerishableSpawnChance * 0.6);


--GigamartCannedFood
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, "SapphCooking.CoffeeBeansBag");
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, "SapphCooking.PackofCoffeeFilters");
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, "SapphCooking.CannedSausages");
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, NonPerishableSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, "SapphCooking.CanofRefriedBeans");
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, "SapphCooking.CannedBread");
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, "SapphCooking.CanofKernelCorn");
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, "SapphCooking.CanofPowderedMilk");
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, "SapphCooking.BagofFlourTortillas");
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, NonPerishableSpawnChance * 0.20);
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, "SapphCooking.PackofCandyCigarretes");
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, "SapphCooking.SaltPacket");
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, "SapphCooking.SugarPacket");
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, "SapphCooking.HotsaucePacket");
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, "Base.BakingSoda");
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, "SapphCooking.TinofCaviar");
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, NonPerishableSpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, "SapphCooking.CanofBeets");
table.insert(ProceduralDistributions["list"]["GigamartCannedFood"].items, NonPerishableSpawnChance * 2);


--GigamartCandy
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "SapphCooking.WhiteChocolate");
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, NonPerishableSpawnChance * 2.66);
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "SapphCooking.PackofCandyCigarretes");
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, NonPerishableSpawnChance * 2.66);
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "SapphCooking.BagofMarshmallows");
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, NonPerishableSpawnChance * 2.66);
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "SapphCooking.Box_Bonbon");
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, NonPerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "SapphCooking.Box_LiqueurBonbons");
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, NonPerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "SapphCooking.Box_HeartChocolate");
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, NonPerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "SapphCooking.Heart_Chocolate");
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, NonPerishableSpawnChance * 2.66);
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "SapphCooking.Bonbon");
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, NonPerishableSpawnChance * 2.66);
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "SapphCooking.Bonbon_Liqueur");
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, NonPerishableSpawnChance * 2.66);
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "SapphCooking.ChocolateEgg_Small");
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, NonPerishableSpawnChance * 0.22);
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "SapphCooking.ChocolateEgg_Medium");
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, NonPerishableSpawnChance * 0.22);
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "SapphCooking.ChocolateEgg_Large");
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, NonPerishableSpawnChance * 0.22);
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "SapphCooking.Gingerbread_Man");
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, NonPerishableSpawnChance * 0.05);

--GigamartHousewares
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, "SapphCooking.Laddle");
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, KitchenUtensilsSpawnChance * 2.66);
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, "SapphCooking.MeatTenderizer");
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, KitchenUtensilsSpawnChance * 2.66);
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, "SapphCooking.EmptyThermos");
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, KitchenUtensilsSpawnChance * 2.66);

--GigamartPots
table.insert(ProceduralDistributions["list"]["GigamartPots"].items, "SapphCooking.WokPan");
table.insert(ProceduralDistributions["list"]["GigamartPots"].items, KitchenUtensilsSpawnChance * 1.6);
table.insert(ProceduralDistributions["list"]["GigamartPots"].items, "SapphCooking.MeatTenderizer");
table.insert(ProceduralDistributions["list"]["GigamartPots"].items, KitchenUtensilsSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["GigamartPots"].items, "SapphCooking.Laddle");
table.insert(ProceduralDistributions["list"]["GigamartPots"].items, KitchenUtensilsSpawnChance * 2.66);
table.insert(ProceduralDistributions["list"]["GigamartPots"].items, "SapphCooking.MessTray");
table.insert(ProceduralDistributions["list"]["GigamartPots"].items, KitchenUtensilsSpawnChance * 0.2);

--GigamartSauce
table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, "SapphCooking.CanolaOil");
table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, "Base.Soysauce");
table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, "SapphCooking.PeanutOil");
table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, "SapphCooking.AvocadoOil");
table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, "SapphCooking.CurryPowder");
table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, NonPerishableSpawnChance * 2.66);
table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, "SapphCooking.SoySauce_Sachet");
table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, NonPerishableSpawnChance * 0.5);
table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, "SapphCooking.Mustard_Sachet");
table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, NonPerishableSpawnChance * 0.5);
table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, "SapphCooking.Tomato_Sachet");
table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, NonPerishableSpawnChance * 0.5);
table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, "SapphCooking.MonosodiumGlutamate_MSG");
table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, NonPerishableSpawnChance * 0.5);
table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, "SapphCooking.PeanutButter_Sachet");
table.insert(ProceduralDistributions["list"]["GigamartSauce"].items, NonPerishableSpawnChance * 0.5);




--BakeryBread
table.insert(ProceduralDistributions["list"]["BakeryBread"].items, "SapphCooking.CheeseSandwich");
table.insert(ProceduralDistributions["list"]["BakeryBread"].items, PerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BakeryBread"].items, "SapphCooking.GrilledCheese");
table.insert(ProceduralDistributions["list"]["BakeryBread"].items, PerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BakeryBread"].items, "SapphCooking.Banana_Bread");
table.insert(ProceduralDistributions["list"]["BakeryBread"].items, PerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BakeryBread"].items, "SapphCooking.TunaSandwich");
table.insert(ProceduralDistributions["list"]["BakeryBread"].items, PerishableSpawnChance * 2);

--BandPracticeFridge
table.insert(ProceduralDistributions["list"]["BandPracticeFridge"].items, "SapphCooking.CheeseSandwich");
table.insert(ProceduralDistributions["list"]["BandPracticeFridge"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["BandPracticeFridge"].items, "SapphCooking.GrilledCheese");
table.insert(ProceduralDistributions["list"]["BandPracticeFridge"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["BandPracticeFridge"].items, "SapphCooking.TunaSandwich");
table.insert(ProceduralDistributions["list"]["BandPracticeFridge"].items, PerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["BandPracticeFridge"].items, "SapphCooking.WildGarlicBreadCooked");
table.insert(ProceduralDistributions["list"]["BandPracticeFridge"].items, PerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["BandPracticeFridge"].items, "SapphCooking.ColaBottle");
table.insert(ProceduralDistributions["list"]["BandPracticeFridge"].items, NonPerishableSpawnChance * 2);

--CafeteriaSandwiches
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, "SapphCooking.CheeseSandwich");
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, PerishableSpawnChance * 1.6);
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, "SapphCooking.GrilledCheese");
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, PerishableSpawnChance * 1.6);
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, "SapphCooking.TunaSandwich");
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, PerishableSpawnChance * 1.6);
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, "SapphCooking.WildGarlicBreadCooked");
table.insert(ProceduralDistributions["list"]["CafeteriaSandwiches"].items, PerishableSpawnChance * 1);



--BakeryKitchenBaking
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, "SapphCooking.CanolaOil");
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, "SapphCooking.PeanutOil");
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, "SapphCooking.AvocadoOil");
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, "SapphCooking.GranulatedSugar");
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, "SapphCooking.PastaDough");
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, "SapphCooking.RolledPastaDough");
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, "SapphCooking.BagelShapedDough");
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, "SapphCooking.PastaSheets");
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, "SapphCooking.Banana_Bread");
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, "SapphCooking.PipingBag_PastryDough");
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, PerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, "SapphCooking.PipingBag_Icing");
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, PerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, "SapphCooking.PastryDough");
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, PerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, "SapphCooking.PipingBags");
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, KitchenUtensilsSpawnChance * 3);
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, "SapphCooking.BakingMolds");
table.insert(ProceduralDistributions["list"]["BakeryKitchenBaking"].items, KitchenUtensilsSpawnChance * 3);



--BakeryMisc
table.insert(ProceduralDistributions["list"]["BakeryMisc"].items, "SapphCooking.Box_Bonbon");
table.insert(ProceduralDistributions["list"]["BakeryMisc"].items, NonPerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["BakeryMisc"].items, "SapphCooking.Box_LiqueurBonbons");
table.insert(ProceduralDistributions["list"]["BakeryMisc"].items, NonPerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["BakeryMisc"].items, "SapphCooking.Box_HeartChocolate");
table.insert(ProceduralDistributions["list"]["BakeryMisc"].items, NonPerishableSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["BakeryMisc"].items, "SapphCooking.Heart_Chocolate");
table.insert(ProceduralDistributions["list"]["BakeryMisc"].items, NonPerishableSpawnChance * 1.66);
table.insert(ProceduralDistributions["list"]["BakeryMisc"].items, "SapphCooking.Bonbon");
table.insert(ProceduralDistributions["list"]["BakeryMisc"].items, NonPerishableSpawnChance * 1.66);





--StoreKitchenBaking
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "SapphCooking.CanolaOil");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "SapphCooking.PeanutOil");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "SapphCooking.AvocadoOil");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "SapphCooking.GranulatedSugar");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "SapphCooking.PastaDough");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "SapphCooking.RolledPastaDough");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "SapphCooking.BagelShapedDough");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "SapphCooking.PastaSheets");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "SapphCooking.PipingBag_PastryDough");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, PerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "SapphCooking.PipingBag_Icing");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, PerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "SapphCooking.PastryDough");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, PerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "SapphCooking.PipingBags");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, KitchenUtensilsSpawnChance * 3);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "SapphCooking.BakingMolds");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, KitchenUtensilsSpawnChance * 3);




--StoreKitchenGlasses
table.insert(ProceduralDistributions["list"]["StoreKitchenGlasses"].items, "SapphCooking.CocktailGlass");
table.insert(ProceduralDistributions["list"]["StoreKitchenGlasses"].items, KitchenUtensilsSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["StoreKitchenGlasses"].items, "SapphCooking.CocktailMixer");
table.insert(ProceduralDistributions["list"]["StoreKitchenGlasses"].items, KitchenUtensilsSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["StoreKitchenGlasses"].items, "SapphCooking.LowballGlass");
table.insert(ProceduralDistributions["list"]["StoreKitchenGlasses"].items, KitchenUtensilsSpawnChance * 0.33);


--GigamartBakingMisc
table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, "SapphCooking.PipingBags");
table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, KitchenUtensilsSpawnChance * 3);
table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, "SapphCooking.BakingMolds");
table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, KitchenUtensilsSpawnChance * 3);
table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, "SapphCooking.CoffeeGrinder");
table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, KitchenUtensilsSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, "SapphCooking.PlasticFilterHolder");
table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, KitchenUtensilsSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, "SapphCooking.MessTray");
table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, KitchenUtensilsSpawnChance * 0.5);


--BurgerKitchenSauce
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, "SapphCooking.SaltPacket");
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, "SapphCooking.SugarPacket");
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, "SapphCooking.HotsaucePacket");
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, "SapphCooking.CanolaOil");
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, "SapphCooking.PeanutOil");
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, "SapphCooking.AvocadoOil");
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, "SapphCooking.BeefBroth");
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, "SapphCooking.ChickenBroth");
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, "Base.BakingSoda");
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, "Base.Soysauce");
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, "SapphCooking.CurryPowder");
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, "SapphCooking.SoySauce_Sachet");
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, NonPerishableSpawnChance * 0.5);
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, "SapphCooking.Mustard_Sachet");
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, NonPerishableSpawnChance * 0.5);
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, "SapphCooking.Tomato_Sachet");
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, NonPerishableSpawnChance * 0.5);
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, "SapphCooking.MonosodiumGlutamate_MSG");
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, NonPerishableSpawnChance * 0.5);
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, "SapphCooking.PeanutButter_Sachet");
table.insert(ProceduralDistributions["list"]["BurgerKitchenSauce"].items, NonPerishableSpawnChance * 0.5);

--BarShelfLiquor
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "SapphCooking.CocktailGlass");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, KitchenUtensilsSpawnChance * 6.65);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "SapphCooking.CocktailMixer");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, KitchenUtensilsSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "SapphCooking.LowballGlass");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, KitchenUtensilsSpawnChance * 6.65);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "SapphCooking.GinFull");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "SapphCooking.VodkaFull");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "SapphCooking.CachaçaFull");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "SapphCooking.TequillaFull");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "SapphCooking.Vermouth");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "SapphCooking.LiqueurBottle");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "SapphCooking.SakeFull");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "SapphCooking.RumFull");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "SapphCooking.EnergyDrink");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, NonPerishableSpawnChance * 0.1);



--DrugShackDrugs
table.insert(ProceduralDistributions["list"]["DrugShackDrugs"].items, "SapphCooking.GinFull");
table.insert(ProceduralDistributions["list"]["DrugShackDrugs"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DrugShackDrugs"].items, "SapphCooking.VodkaFull");
table.insert(ProceduralDistributions["list"]["DrugShackDrugs"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DrugShackDrugs"].items, "SapphCooking.CachaçaFull");
table.insert(ProceduralDistributions["list"]["DrugShackDrugs"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DrugShackDrugs"].items, "SapphCooking.TequillaFull");
table.insert(ProceduralDistributions["list"]["DrugShackDrugs"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DrugShackDrugs"].items, "SapphCooking.Vermouth");
table.insert(ProceduralDistributions["list"]["DrugShackDrugs"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DrugShackDrugs"].items, "SapphCooking.LiqueurBottle");
table.insert(ProceduralDistributions["list"]["DrugShackDrugs"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DrugShackDrugs"].items, "SapphCooking.SakeFull");
table.insert(ProceduralDistributions["list"]["DrugShackDrugs"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DrugShackDrugs"].items, "SapphCooking.RumFull");
table.insert(ProceduralDistributions["list"]["DrugShackDrugs"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DrugShackDrugs"].items, "SapphCooking.EnergyDrink");
table.insert(ProceduralDistributions["list"]["DrugShackDrugs"].items, NonPerishableSpawnChance * 0.1);


--BarCounterGlasses
table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, "SapphCooking.CocktailGlass");
table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, KitchenUtensilsSpawnChance * 6.65);
table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, "SapphCooking.CocktailMixer");
table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, KitchenUtensilsSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, "SapphCooking.LowballGlass");
table.insert(ProceduralDistributions["list"]["BarCounterGlasses"].items, KitchenUtensilsSpawnChance * 6.65);


--StoreKitchenPots
table.insert(ProceduralDistributions["list"]["StoreKitchenPots"].items, "SapphCooking.WokPan");
table.insert(ProceduralDistributions["list"]["StoreKitchenPots"].items, KitchenUtensilsSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["StoreKitchenPots"].items, "SapphCooking.MeatTenderizer");
table.insert(ProceduralDistributions["list"]["StoreKitchenPots"].items, KitchenUtensilsSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["StoreKitchenPots"].items, "SapphCooking.Laddle");
table.insert(ProceduralDistributions["list"]["StoreKitchenPots"].items, KitchenUtensilsSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["StoreKitchenPots"].items, "SapphCooking.WoodenSpoon");
table.insert(ProceduralDistributions["list"]["StoreKitchenPots"].items, KitchenUtensilsSpawnChance * 2);

--StoreKitchenCutlery
table.insert(ProceduralDistributions["list"]["StoreKitchenCutlery"].items, "SapphCooking.WokPan");
table.insert(ProceduralDistributions["list"]["StoreKitchenCutlery"].items, KitchenUtensilsSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["StoreKitchenCutlery"].items, "SapphCooking.MeatTenderizer");
table.insert(ProceduralDistributions["list"]["StoreKitchenCutlery"].items, KitchenUtensilsSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["StoreKitchenCutlery"].items, "SapphCooking.Laddle");
table.insert(ProceduralDistributions["list"]["StoreKitchenCutlery"].items, KitchenUtensilsSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["StoreKitchenCutlery"].items, "SapphCooking.WoodenSpoon");
table.insert(ProceduralDistributions["list"]["StoreKitchenCutlery"].items, KitchenUtensilsSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["StoreKitchenCutlery"].items, "SapphCooking.CoffeeGrinder");
table.insert(ProceduralDistributions["list"]["StoreKitchenCutlery"].items, KitchenUtensilsSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["StoreKitchenCutlery"].items, "SapphCooking.PlasticFilterHolder");
table.insert(ProceduralDistributions["list"]["StoreKitchenCutlery"].items, KitchenUtensilsSpawnChance * 1.3);
table.insert(ProceduralDistributions["list"]["StoreKitchenCutlery"].items, "SapphCooking.MessTray");
table.insert(ProceduralDistributions["list"]["StoreKitchenCutlery"].items, KitchenUtensilsSpawnChance * 0.3);
table.insert(ProceduralDistributions["list"]["StoreKitchenCutlery"].items, "SapphCooking.ChefKnife1");
table.insert(ProceduralDistributions["list"]["StoreKitchenCutlery"].items, KitchenUtensilsSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["StoreKitchenCutlery"].items, "SapphCooking.ChefKnife2");
table.insert(ProceduralDistributions["list"]["StoreKitchenCutlery"].items, KitchenUtensilsSpawnChance * 0.1);
table.insert(ProceduralDistributions["list"]["StoreKitchenCutlery"].items, "SapphCooking.ChefKnife3");
table.insert(ProceduralDistributions["list"]["StoreKitchenCutlery"].items, KitchenUtensilsSpawnChance * 0.1);


--CrateOilVegetable
table.insert(ProceduralDistributions["list"]["CrateOilVegetable"].items, "SapphCooking.CanolaOil");
table.insert(ProceduralDistributions["list"]["CrateOilVegetable"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["CrateOilVegetable"].items, "SapphCooking.PeanutOil");
table.insert(ProceduralDistributions["list"]["CrateOilVegetable"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["CrateOilVegetable"].items, "SapphCooking.AvocadoOil");
table.insert(ProceduralDistributions["list"]["CrateOilVegetable"].items, NonPerishableSpawnChance * 0.33);

--GrillAcessories
table.insert(ProceduralDistributions["list"]["GrillAcessories"].items, "SapphCooking.MeatTenderizer");
table.insert(ProceduralDistributions["list"]["GrillAcessories"].items, KitchenUtensilsSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["GrillAcessories"].items, "SapphCooking.Laddle");
table.insert(ProceduralDistributions["list"]["GrillAcessories"].items, KitchenUtensilsSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["GrillAcessories"].items, "SapphCooking.WoodenSpoon");
table.insert(ProceduralDistributions["list"]["GrillAcessories"].items, KitchenUtensilsSpawnChance * 2);

--CrateChocolate
table.insert(ProceduralDistributions["list"]["CrateChocolate"].items, "SapphCooking.WhiteChocolate");
table.insert(ProceduralDistributions["list"]["CrateChocolate"].items, NonPerishableSpawnChance * 0.33);

--CrateRice
table.insert(ProceduralDistributions["list"]["CrateRice"].items, "SapphCooking.BrownRice");
table.insert(ProceduralDistributions["list"]["CrateRice"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["CrateRice"].items, "SapphCooking.ArborioRice");
table.insert(ProceduralDistributions["list"]["CrateRice"].items, NonPerishableSpawnChance * 0.33);

--FridgeSnacks
table.insert(ProceduralDistributions["list"]["FridgeSnacks"].items, "SapphCooking.Onigiri");
table.insert(ProceduralDistributions["list"]["FridgeSnacks"].items, PerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["FridgeSnacks"].items, "SapphCooking.VegetableSushi");
table.insert(ProceduralDistributions["list"]["FridgeSnacks"].items, PerishableSpawnChance * 2);

--ChineseKitchenCutlery
table.insert(ProceduralDistributions["list"]["ChineseKitchenCutlery"].items, "SapphCooking.MeatTenderizer");
table.insert(ProceduralDistributions["list"]["ChineseKitchenCutlery"].items, KitchenUtensilsSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["ChineseKitchenCutlery"].items, "SapphCooking.Laddle");
table.insert(ProceduralDistributions["list"]["ChineseKitchenCutlery"].items, KitchenUtensilsSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["ChineseKitchenCutlery"].items, "SapphCooking.WoodenSpoon");
table.insert(ProceduralDistributions["list"]["ChineseKitchenCutlery"].items, KitchenUtensilsSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["ChineseKitchenCutlery"].items, "SapphCooking.ChefKnife1");
table.insert(ProceduralDistributions["list"]["ChineseKitchenCutlery"].items, KitchenUtensilsSpawnChance * 0.2);
table.insert(ProceduralDistributions["list"]["ChineseKitchenCutlery"].items, "SapphCooking.ChefKnife2");
table.insert(ProceduralDistributions["list"]["ChineseKitchenCutlery"].items, KitchenUtensilsSpawnChance * 0.2);
table.insert(ProceduralDistributions["list"]["ChineseKitchenCutlery"].items, "SapphCooking.ChefKnife3");
table.insert(ProceduralDistributions["list"]["ChineseKitchenCutlery"].items, KitchenUtensilsSpawnChance * 0.2);

--StoreKitchenDishes
table.insert(ProceduralDistributions["list"]["StoreKitchenDishes"].items, "SapphCooking.StackBowl2");
table.insert(ProceduralDistributions["list"]["StoreKitchenDishes"].items, KitchenUtensilsSpawnChance * 2);

--CrateSodaCans
table.insert(ProceduralDistributions["list"]["CrateSodaCans"].items, "SapphCooking.CarbonatedWater");
table.insert(ProceduralDistributions["list"]["CrateSodaCans"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["CrateSodaCans"].items, "SapphCooking.BottleofLemonJuice");
table.insert(ProceduralDistributions["list"]["CrateSodaCans"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["CrateSodaCans"].items, "SapphCooking.BottleofOrangeJuice");
table.insert(ProceduralDistributions["list"]["CrateSodaCans"].items, NonPerishableSpawnChance * 0.33);

--FridgeSoda
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "SapphCooking.CarbonatedWater");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "SapphCooking.BottleofLemonJuice");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "SapphCooking.BottleofOrangeJuice");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "SapphCooking.BottleofLemonJuice");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "SapphCooking.BottleofOrangeJuice");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "SapphCooking.BottleofAppleJuice");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "SapphCooking.BottleofStrawberryJuice");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "SapphCooking.BottleofPeachJuice");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "SapphCooking.BottleofWatermelonJuice");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "SapphCooking.BottleofGrapeJuice");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "SapphCooking.ColaBottle");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "SapphCooking.EnergyDrink");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, NonPerishableSpawnChance * 2);

--FridgeWater
table.insert(ProceduralDistributions["list"]["FridgeWater"].items, "SapphCooking.CarbonatedWater");
table.insert(ProceduralDistributions["list"]["FridgeWater"].items, NonPerishableSpawnChance * 6.65);
table.insert(ProceduralDistributions["list"]["FridgeWater"].items, "SapphCooking.BottleofLemonJuice");
table.insert(ProceduralDistributions["list"]["FridgeWater"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["FridgeWater"].items, "SapphCooking.BottleofOrangeJuice");
table.insert(ProceduralDistributions["list"]["FridgeWater"].items, NonPerishableSpawnChance * 0.6);

--GasStorageCombo
table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, "SapphCooking.Drinkmix_Lemon");
table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, NonPerishableSpawnChance * 1.33);
table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, "SapphCooking.Drinkmix_Orange");
table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, NonPerishableSpawnChance * 1.33);
table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, "SapphCooking.Drinkmix_Pineapple");
table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, NonPerishableSpawnChance * 1.33);
table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, "SapphCooking.Drinkmix_Strawberry");
table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, NonPerishableSpawnChance * 1.33);
table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, "SapphCooking.Drinkmix_Watermelon");
table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, NonPerishableSpawnChance * 1.33);
table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, "SapphCooking.Drinkmix_Peach");
table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, NonPerishableSpawnChance * 1.33);
table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, "SapphCooking.PackofCandyCigarretes");
table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, NonPerishableSpawnChance * 2.66);

--KitchenBottles
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "SapphCooking.BottleofLemonJuice");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "SapphCooking.BottleofOrangeJuice");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "SapphCooking.BottleofAppleJuice");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "SapphCooking.BottleofStrawberryJuice");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "SapphCooking.BottleofPeachJuice");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "SapphCooking.BottleofWatermelonJuice");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "SapphCooking.BottleofGrapeJuice");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "SapphCooking.CarbonatedWater");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "SapphCooking.ColaBottle");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, NonPerishableSpawnChance * 0.6);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "SapphCooking.EnergyDrink");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, NonPerishableSpawnChance * 0.4);

--StoreShelfCombo
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "SapphCooking.PackofCandyCigarretes");
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "SapphCooking.Drinkmix_Lemon");
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "SapphCooking.Drinkmix_Orange");
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "SapphCooking.Drinkmix_Pineapple");
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "SapphCooking.Drinkmix_Strawberry");
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "SapphCooking.Drinkmix_Watermelon");
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "SapphCooking.Drinkmix_Peach");
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, NonPerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "SapphCooking.BagofFlourTortillas");
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "SapphCooking.BagofHotdogBuns");
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, PerishableSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "SapphCooking.BagofSeaweed");
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, NonPerishableSpawnChance * 2);


--StoreShelfBeer

table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, "SapphCooking.GinFull");
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, "SapphCooking.VodkaFull");
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, "SapphCooking.CachaçaFull");
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, "SapphCooking.TequillaFull");
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, "SapphCooking.Vermouth");
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, "SapphCooking.LiqueurBottle");
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, "SapphCooking.SakeFull");
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, "SapphCooking.RumFull");
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, "SapphCooking.EnergyDrink");
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, NonPerishableSpawnChance * 0.1);


--StoreShelfSnacks
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "SapphCooking.PackofCandyCigarretes");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "SapphCooking.WhiteChocolate");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "SapphCooking.BagofFlourTortillas");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "SapphCooking.BagofHotdogBuns");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, PerishableSpawnChance * 2.66);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "SapphCooking.BagofSeaweed");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, NonPerishableSpawnChance * 2.66);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "SapphCooking.ChocolateEgg_Small");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, NonPerishableSpawnChance * 0.66);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "SapphCooking.ChocolateEgg_Medium");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, NonPerishableSpawnChance * 0.66);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "SapphCooking.ChocolateEgg_Large");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, NonPerishableSpawnChance * 0.66); 
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "SapphCooking.Box_Bonbon");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, NonPerishableSpawnChance * 0.2);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "SapphCooking.Box_LiqueurBonbons");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, NonPerishableSpawnChance * 0.2);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "SapphCooking.Box_HeartChocolate");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, NonPerishableSpawnChance * 0.2);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "SapphCooking.Heart_Chocolate");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, NonPerishableSpawnChance * 1.66);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "SapphCooking.Bonbon");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, NonPerishableSpawnChance * 1.66);


--CafeteriaSnacks
table.insert(ProceduralDistributions["list"]["CafeteriaSnacks"].items, "SapphCooking.PackofCandyCigarretes");
table.insert(ProceduralDistributions["list"]["CafeteriaSnacks"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["CafeteriaSnacks"].items, "SapphCooking.WhiteChocolate");
table.insert(ProceduralDistributions["list"]["CafeteriaSnacks"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["CafeteriaSnacks"].items, "SapphCooking.ChocolateEgg_Small");
table.insert(ProceduralDistributions["list"]["CafeteriaSnacks"].items, NonPerishableSpawnChance * 0.33);


--CrateCandyPackage
table.insert(ProceduralDistributions["list"]["CrateCandyPackage"].items, "SapphCooking.PackofCandyCigarretes");
table.insert(ProceduralDistributions["list"]["CrateCandyPackage"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["CrateCandyPackage"].items, "SapphCooking.WhiteChocolate");
table.insert(ProceduralDistributions["list"]["CrateCandyPackage"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["CrateCandyPackage"].items, "SapphCooking.ChocolateEgg_Small");
table.insert(ProceduralDistributions["list"]["CrateCandyPackage"].items, NonPerishableSpawnChance * 0.22);
table.insert(ProceduralDistributions["list"]["CrateCandyPackage"].items, "SapphCooking.ChocolateEgg_Medium");
table.insert(ProceduralDistributions["list"]["CrateCandyPackage"].items, NonPerishableSpawnChance * 0.22);
table.insert(ProceduralDistributions["list"]["CrateCandyPackage"].items, "SapphCooking.ChocolateEgg_Large");
table.insert(ProceduralDistributions["list"]["CrateCandyPackage"].items, NonPerishableSpawnChance * 0.22);
table.insert(ProceduralDistributions["list"]["CrateCandyPackage"].items, "SapphCooking.Gingerbread_Man");
table.insert(ProceduralDistributions["list"]["CrateCandyPackage"].items, NonPerishableSpawnChance * 0.05);

--DishCabinetLiquor
table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, "SapphCooking.CocktailGlass");
table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, KitchenUtensilsSpawnChance * 6.65);
table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, "SapphCooking.CocktailMixer");
table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, KitchenUtensilsSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, "SapphCooking.LowballGlass");
table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, KitchenUtensilsSpawnChance * 6.65);
table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, "SapphCooking.GinFull");
table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, "SapphCooking.VodkaFull");
table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, "SapphCooking.CachaçaFull");
table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, "SapphCooking.TequillaFull");
table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, AlcoholSpawnChance * 0.330);
table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, "SapphCooking.Vermouth");
table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, "SapphCooking.SakeFull");
table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, "SapphCooking.RumFull");
table.insert(ProceduralDistributions["list"]["DishCabinetLiquor"].items, AlcoholSpawnChance * 0.33);

--BarCounterLiquor
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "SapphCooking.CocktailGlass");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, KitchenUtensilsSpawnChance * 6.65);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "SapphCooking.CocktailMixer");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, KitchenUtensilsSpawnChance * 2);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "SapphCooking.LowballGlass");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, KitchenUtensilsSpawnChance * 6.65);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "SapphCooking.GinFull");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "SapphCooking.VodkaFull");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "SapphCooking.CachaçaFull");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "SapphCooking.TequillaFull");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "SapphCooking.Vermouth");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "SapphCooking.SakeFull");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "SapphCooking.RumFull");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "SapphCooking.CocktailMixer");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, KitchenUtensilsSpawnChance * 1);


--CandyStoreSnacks
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "SapphCooking.PackofCandyCigarretes");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "SapphCooking.WhiteChocolate");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "SapphCooking.BagofFlourTortillas");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, NonPerishableSpawnChance * 1);
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "SapphCooking.BagofHotdogBuns");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, PerishableSpawnChance * 1.33);
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "SapphCooking.BagofSeaweed");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, NonPerishableSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "SapphCooking.ChocolateEgg_Small");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, NonPerishableSpawnChance * 0.66);
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "SapphCooking.ChocolateEgg_Medium");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, NonPerishableSpawnChance * 0.66);
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "SapphCooking.ChocolateEgg_Large");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, NonPerishableSpawnChance * 0.66); 
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "SapphCooking.Box_Bonbon");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, NonPerishableSpawnChance * 0.2);
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "SapphCooking.Box_LiqueurBonbons");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, NonPerishableSpawnChance * 0.2);
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "SapphCooking.Box_HeartChocolate");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, NonPerishableSpawnChance * 0.2);
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "SapphCooking.Heart_Chocolate");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, NonPerishableSpawnChance * 1.66);
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "SapphCooking.Bonbon");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, NonPerishableSpawnChance * 1.66);
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "SapphCooking.Bonbon_Liqueur");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, NonPerishableSpawnChance * 1.66);


-- FreezerTrailerPark
table.insert(ProceduralDistributions["list"]["FreezerTrailerPark"].items, "SapphCooking.GinFull");
table.insert(ProceduralDistributions["list"]["FreezerTrailerPark"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["FreezerTrailerPark"].items, "SapphCooking.VodkaFull");
table.insert(ProceduralDistributions["list"]["FreezerTrailerPark"].items, AlcoholSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["FreezerTrailerPark"].items, "SapphCooking.IcecreamSandwich");
table.insert(ProceduralDistributions["list"]["FreezerTrailerPark"].items, PerishableSpawnChance * 0.6);

--Buffets 




--MRE

--TruckBed
table.insert(VehicleDistributions.Police["TruckBed"].items, "SapphCooking.MRE_Pack1");
table.insert(VehicleDistributions.Police["TruckBed"].items, MRESpawnChance * 0.15);
table.insert(VehicleDistributions.Police["TruckBed"].items, "SapphCooking.MRE_Pack2");
table.insert(VehicleDistributions.Police["TruckBed"].items, MRESpawnChance * 0.15);
table.insert(VehicleDistributions.Police["TruckBed"].items, "SapphCooking.MRE_Pack3");
table.insert(VehicleDistributions.Police["TruckBed"].items, MRESpawnChance * 0.15);
table.insert(VehicleDistributions.Police["TruckBed"].items, "SapphCooking.MRE_Pack4");
table.insert(VehicleDistributions.Police["TruckBed"].items, MRESpawnChance * 0.15);
table.insert(VehicleDistributions.Police["TruckBed"].items, "SapphCooking.MRE_Pack5");
table.insert(VehicleDistributions.Police["TruckBed"].items, MRESpawnChance * 0.15);
table.insert(VehicleDistributions.Police["TruckBed"].items, "SapphCooking.MRE_Pack6");
table.insert(VehicleDistributions.Police["TruckBed"].items, MRESpawnChance * 0.15);
table.insert(VehicleDistributions.Police["TruckBed"].items, "SapphCooking.MRE_Pack7");
table.insert(VehicleDistributions.Police["TruckBed"].items, MRESpawnChance * 0.15);
table.insert(VehicleDistributions.Police["TruckBed"].items, "SapphCooking.MRE_Pack8");
table.insert(VehicleDistributions.Police["TruckBed"].items, MRESpawnChance * 0.15);
table.insert(VehicleDistributions.Police["TruckBed"].items, "SapphCooking.MRE_Pack9");
table.insert(VehicleDistributions.Police["TruckBed"].items, MRESpawnChance * 0.15);
table.insert(VehicleDistributions.Police["TruckBed"].items, "SapphCooking.MRE_Pack10");
table.insert(VehicleDistributions.Police["TruckBed"].items, MRESpawnChance * 0.15);
table.insert(VehicleDistributions.Police["TruckBed"].items, "SapphCooking.MRE_Pack11");
table.insert(VehicleDistributions.Police["TruckBed"].items, MRESpawnChance * 0.15);
table.insert(VehicleDistributions.Police["TruckBed"].items, "SapphCooking.MRE_Pack12");
table.insert(VehicleDistributions.Police["TruckBed"].items, MRESpawnChance * 0.15);



--SurvivorCache1
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack1");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack2");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack3");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack4");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack5");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack6");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack7");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack8");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack9");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack10");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack11");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack12");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, MRESpawnChance * 0.15);

--SurvivorCache2
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack1");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack2");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack3");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack4");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack5");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack6");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack7");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack8");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack9");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack10");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack11");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, MRESpawnChance * 0.15);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "SapphCooking.MRE_Pack12");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, MRESpawnChance * 0.15);

--HuntingLockers
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, "SapphCooking.MRE_Pack1");
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, "SapphCooking.MRE_Pack2");
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, "SapphCooking.MRE_Pack3");
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, "SapphCooking.MRE_Pack4");
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, "SapphCooking.MRE_Pack5");
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, "SapphCooking.MRE_Pack6");
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, "SapphCooking.MRE_Pack7");
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, "SapphCooking.MRE_Pack8");
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, "SapphCooking.MRE_Pack9");
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, "SapphCooking.MRE_Pack10");
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, "SapphCooking.MRE_Pack11");
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, "SapphCooking.MRE_Pack12");
table.insert(ProceduralDistributions["list"]["HuntingLockers"].items, MRESpawnChance * 0.07);

--LockerArmyBedroom
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, "SapphCooking.MRE_Pack1");
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, "SapphCooking.MRE_Pack2");
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, "SapphCooking.MRE_Pack3");
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, "SapphCooking.MRE_Pack4");
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, "SapphCooking.MRE_Pack5");
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, "SapphCooking.MRE_Pack6");
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, "SapphCooking.MRE_Pack7");
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, "SapphCooking.MRE_Pack8");
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, "SapphCooking.MRE_Pack9");
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, "SapphCooking.MRE_Pack10");
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, "SapphCooking.MRE_Pack11");
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, MRESpawnChance * 0.07);
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, "SapphCooking.MRE_Pack12");
table.insert(ProceduralDistributions["list"]["LockerArmyBedroom"].items, MRESpawnChance * 0.07);

--ArmySurplusMisc
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, "SapphCooking.MRE_Pack1");
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, MRESpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, "SapphCooking.MRE_Pack2");
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, MRESpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, "SapphCooking.MRE_Pack3");
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, MRESpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, "SapphCooking.MRE_Pack4");
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, MRESpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, "SapphCooking.MRE_Pack5");
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, MRESpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, "SapphCooking.MRE_Pack6");
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, MRESpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, "SapphCooking.MRE_Pack7");
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, MRESpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, "SapphCooking.MRE_Pack8");
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, MRESpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, "SapphCooking.MRE_Pack9");
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, MRESpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, "SapphCooking.MRE_Pack10");
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, MRESpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, "SapphCooking.MRE_Pack11");
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, MRESpawnChance * 0.15);
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, "SapphCooking.MRE_Pack12");
table.insert(ProceduralDistributions["list"]["ArmySurplusMisc"].items, MRESpawnChance * 0.15);


--Books

table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "SapphCooking.AsianFoodMagazine");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "SapphCooking.EuropeFoodMagazine");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "SapphCooking.PastaDoughMagazine");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "SapphCooking.AsianFoodMagazine");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "SapphCooking.EuropeFoodMagazine");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "SapphCooking.PastaDoughMagazine");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, "SapphCooking.AsianFoodMagazine");
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, "SapphCooking.EuropeFoodMagazine");
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, "SapphCooking.PastaDoughMagazine");
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["PrisonGuardLockers"].items, "SapphCooking.AsianFoodMagazine");
table.insert(ProceduralDistributions["list"]["PrisonGuardLockers"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["PrisonGuardLockers"].items, "SapphCooking.EuropeFoodMagazine");
table.insert(ProceduralDistributions["list"]["PrisonGuardLockers"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["PrisonGuardLockers"].items, "SapphCooking.PastaDoughMagazine");
table.insert(ProceduralDistributions["list"]["PrisonGuardLockers"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["LibraryCounter"].items, "SapphCooking.AsianFoodMagazine");
table.insert(ProceduralDistributions["list"]["LibraryCounter"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["LibraryCounter"].items, "SapphCooking.EuropeFoodMagazine");
table.insert(ProceduralDistributions["list"]["LibraryCounter"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["LibraryCounter"].items, "SapphCooking.PastaDoughMagazine");
table.insert(ProceduralDistributions["list"]["LibraryCounter"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BookstoreStationery"].items, "SapphCooking.AsianFoodMagazine");
table.insert(ProceduralDistributions["list"]["BookstoreStationery"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BookstoreStationery"].items, "SapphCooking.EuropeFoodMagazine");
table.insert(ProceduralDistributions["list"]["BookstoreStationery"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BookstoreStationery"].items, "SapphCooking.PastaDoughMagazine");
table.insert(ProceduralDistributions["list"]["BookstoreStationery"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["ClassroomShelves"].items, "SapphCooking.AsianFoodMagazine");
table.insert(ProceduralDistributions["list"]["ClassroomShelves"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["ClassroomShelves"].items, "SapphCooking.EuropeFoodMagazine");
table.insert(ProceduralDistributions["list"]["ClassroomShelves"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["ClassroomShelves"].items, "SapphCooking.PastaDoughMagazine");
table.insert(ProceduralDistributions["list"]["ClassroomShelves"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, "SapphCooking.AsianFoodMagazine");
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, "SapphCooking.EuropeFoodMagazine");
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, "SapphCooking.PastaDoughMagazine");
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BookstoreMisc"].items, "SapphCooking.AsianFoodMagazine");
table.insert(ProceduralDistributions["list"]["BookstoreMisc"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BookstoreMisc"].items, "SapphCooking.EuropeFoodMagazine");
table.insert(ProceduralDistributions["list"]["BookstoreMisc"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BookstoreMisc"].items, "SapphCooking.PastaDoughMagazine");
table.insert(ProceduralDistributions["list"]["BookstoreMisc"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, "SapphCooking.AsianFoodMagazine");
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, "SapphCooking.EuropeFoodMagazine");
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, "SapphCooking.PastaDoughMagazine");
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, "SapphCooking.AsianFoodMagazine");
table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, "SapphCooking.EuropeFoodMagazine");
table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, "SapphCooking.PastaDoughMagazine");
table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, "SapphCooking.AsianFoodMagazine");
table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, "SapphCooking.EuropeFoodMagazine");
table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, MagazineSpawnChance * 0.33);
table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, "SapphCooking.PastaDoughMagazine");
table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, MagazineSpawnChance * 0.33);








