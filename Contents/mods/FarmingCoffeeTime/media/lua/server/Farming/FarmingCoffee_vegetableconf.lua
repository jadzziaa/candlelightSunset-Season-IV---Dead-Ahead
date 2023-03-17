
require "FarmingCoffee_Utilities"

farming_vegetableconf.icons["CoffeeFruit"] = "media/textures/Item_Coffee.png";

farming_vegetableconf.props["CoffeeFruit"] = farming_vegetableconf.props["CoffeeFruit"] or {}
farming_vegetableconf.props["CoffeeFruit"].seedsRequired = 5;--10;
farming_vegetableconf.props["CoffeeFruit"].texture = "coffee_tree_06";
farming_vegetableconf.props["CoffeeFruit"].waterLvl = 85;
farming_vegetableconf.props["CoffeeFruit"].timeToGrow = ZombRand(298,303); --once a period in the month with 3 grows per period => nbhoursinmonth/3 < x < nbhoursinmonth (nbhoursinmonth~=720)
farming_vegetableconf.props["CoffeeFruit"].vegetableName = "CoffeeFruit";
farming_vegetableconf.props["CoffeeFruit"].seedName = "Base.CoffeeFruit";
farming_vegetableconf.props["CoffeeFruit"].growCode = "FCTrees.growCoffee";
farming_vegetableconf.props["CoffeeFruit"].harvestCode = "FCTrees.harvestTrees";
farming_vegetableconf.props["CoffeeFruit"].seedPerVeg = 0;
farming_vegetableconf.props["CoffeeFruit"].minVeg = 28;
farming_vegetableconf.props["CoffeeFruit"].maxVeg = 42;
farming_vegetableconf.props["CoffeeFruit"].minVegAutorized = 28;
farming_vegetableconf.props["CoffeeFruit"].maxVegAutorized = 42;
farming_vegetableconf.props["CoffeeFruit"].retainOnHarvest = 3;
farming_vegetableconf.props["CoffeeFruit"].hasSeed = false;

farming_vegetableconf.props["CoffeeFruit"].onOld = "Base.Log";
farming_vegetableconf.props["CoffeeFruit"].waterConsumption = 1;

farming_vegetableconf.props["CoffeeFruit"].id = "CoffeeFruit"
farming_vegetableconf.props["CoffeeFruit"].vegetableName2 = ""
farming_vegetableconf.props["CoffeeFruit"].numberOfVegetables2 = 0;
farming_vegetableconf.props["CoffeeFruit"].plantWithFruit = true;
farming_vegetableconf.props["CoffeeFruit"].waterLvlMax = 100;
farming_vegetableconf.props["CoffeeFruit"].numberOfVegetables = 10;
farming_vegetableconf.props["CoffeeFruit"].seedBearingVegetables = 0;
farming_vegetableconf.props["CoffeeFruit"].seedCollect = 0;
farming_vegetableconf.props["CoffeeFruit"].minTemp = 13;
farming_vegetableconf.props["CoffeeFruit"].bestTemp = 25;
farming_vegetableconf.props["CoffeeFruit"].maxTemp = 45;
farming_vegetableconf.props["CoffeeFruit"].damageFromStorm = true;

farming_vegetableconf.props["CoffeeFruit"].onPlantUpdateCode = "FCTrees.onCoffeePlantUpdate";
farming_vegetableconf.props["CoffeeFruit"].monthRestriction = true;--TODO make some generic stuff
farming_vegetableconf.props["CoffeeFruit"].windThreshold = 0.15;--applies only outside --above that health decreases proportionaly
farming_vegetableconf.props["CoffeeFruit"].minTempThreshold = 10;--below that health decreases proportionaly
farming_vegetableconf.props["CoffeeFruit"].maxTempThreshold = 40;--above that health decreases proportionaly
farming_vegetableconf.props["CoffeeFruit"].immuneToDisease = true;
farming_vegetableconf.props["CoffeeFruit"].phaseName1 = "Farming_Young";
farming_vegetableconf.props["CoffeeFruit"].phaseName2 = "Farming_Young";
farming_vegetableconf.props["CoffeeFruit"].phaseName3 = "Farming_Fully_grown";
farming_vegetableconf.props["CoffeeFruit"].phaseName4 = "Farming_In_bloom";
farming_vegetableconf.props["CoffeeFruit"].phaseName5 = "Farming_Ready_to_harvest";
farming_vegetableconf.props["CoffeeFruit"].phaseName6 = "Farming_Ready_to_harvest";

farming_vegetableconf.sprite["CoffeeFruit"] = {
"coffee_tree_01",
"coffee_tree_02",
"coffee_tree_03",
"coffee_tree_04",
"coffee_tree_05",
"coffee_tree_06",
"coffee_tree_06",
"coffee_tree_03",
}


farming_vegetableconf.props["CoffeeFruit"].stages = {}
farming_vegetableconf.props["CoffeeFruit"].stages[0] = "Farming_Seedling"
farming_vegetableconf.props["CoffeeFruit"].stages[1] = "Farming_Young"
farming_vegetableconf.props["CoffeeFruit"].stages[2] = "Farming_Young"
farming_vegetableconf.props["CoffeeFruit"].stages[3] = "Farming_Fully_grown"
farming_vegetableconf.props["CoffeeFruit"].stages[4] = "Farming_In_bloom"
farming_vegetableconf.props["CoffeeFruit"].stages[5] = "Farming_Ready_to_harvest"
farming_vegetableconf.props["CoffeeFruit"].stages[6] = "Farming_Ready_to_harvest"
