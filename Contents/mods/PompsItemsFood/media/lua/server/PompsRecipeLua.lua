require "recipecode"

Recipe = Recipe or {}
Recipe.GetItemTypes = Recipe.GetItemTypes or {}
Recipe.OnCanPerform = Recipe.OnCanPerform or {}
Recipe.OnCreate = Recipe.OnCreate or {}
Recipe.OnGiveXP = Recipe.OnGiveXP or {}
Recipe.OnTest = Recipe.OnTest or {}

local function openFood(food, count, items, player)
  local age = items:get(0):getAge()
  print("Age: "..tostring(age))
  local inv = player:getInventory()
  for i=0,count do
    local item = InventoryItemFactory.CreateItem(food)
    item:setAge(age)
    inv:addItem(item)
  end
end

local trashRecipes = {'Open Package of Whizzy Suckers', 'Open Wafflez Waffles', 'Open Frozen Mozzarrela Sticks',
'Open Marley Fried Chicken', 'Open Pomps', 'Open Box of Root Beers',
'Open Box of Dinosaur Nuggets', 'Open Package of Vanilla Sandwich Cookies', 'Open Package of Chocolate Sandwich Cookies',
'Open Packaged Chocolate Cross', 'Open Packaged Chocolate Rabbit', 'Open Packet of Utah Wafers', 'Open Packet of Wasabi Wafers',
'Open Pack of Buckeyes', 'Open Box of Fig Bars', 'Open Ham & Cheddar Snackable', 'Open Pepperoni & Mozzarella Snackable',
'Open Ham & Swiss Snackable', 'Open Turkey & Cheddar Snackable', 'Open Bologna & American Snackable',
'Open Ham & American Snackable', 'Open Cheese Pizza Snackable', 'Open Pepperoni Pizza Snackable',
'Open Chicken Pizza Snackable', 'Open Package of Rocky Mountain Oysters', 'Open Box of Fruit Barrels',
'Open Package of Freeze Pops', 'Open Box of Honey Buns', 'Open Pomps Big Cup', 'Open Bag of Powdered Mini Donuts',
'Open Bag of Chocolate Mini Donuts', 'Open Bag of Strawberry Mini Donuts', 'Open Bag of Glazed Mini Donuts',
'Open Box of Fruit Spillers', 'Open Box of Ice Cream Sandwiches', 'Open Packaged Pepperoni Pizza', 'Open Packaged Cheese Pizza',
'Open Packaged Supreme Pizza', 'Open Packaged Meat Lovers Pizza'}
Events.OnInitGlobalModData.Add(function()
    if not SandboxVars.PompsItems.Littering then return end
    for i = 1, #trashRecipes do
        local recipe = ScriptManager.instance:getRecipe(trashRecipes[i])
        if recipe then
            recipe:setRemoveResultItem(true)
        end
    end
end)

-- Food of the Stale and Rotten Variety
local function addItemsWithAge(container, type, count, age)
    local items = {}
    for i = 1, count do
        table.insert(items, container:AddItem(type))
    end
    for i = 1, count do
        items[i]:setAge(age)
    end
end

	--Pomps
function Recipe.OnCreate.OpenPomps(items, result, player)
    player:getInventory():AddItems("PompsItems.PBCup", 2);
end

	--Wafflez Box
function Recipe.OnCreate.OpenWafflez(items, result, player)
	local inventory = player:getInventory()
	local originalAge = items:get(0):getAge()
	addItemsWithAge(inventory, 'PompsItems.FrozenWafflez', 6, originalAge)
end

	--Moxx Sticks Box
function Recipe.OnCreate.OpenMoxxBox(items, result, player)
	local inventory = player:getInventory()
	local originalAge = items:get(0):getAge()
	addItemsWithAge(inventory, 'PompsItems.MoxxStick', 12, originalAge)
end

	--KFC Box
function Recipe.OnCreate.OpenKFC(items, result, player)
	local inventory = player:getInventory()
	local originalAge = items:get(0):getAge()
	addItemsWithAge(inventory, 'Base.ChickenFried', 6, originalAge)
end

	--Root Beer Box
function Recipe.OnCreate.OpenRootBeerBox(items, result, player)
    player:getInventory():AddItems("PompsItems.PIRootBeer", 12);
end

	--Dino Nug Box
function Recipe.OnCreate.OpenDinoNugBox(items, result, player)
	local inventory = player:getInventory()
	local originalAge = items:get(0):getAge()
	addItemsWithAge(inventory, 'PompsItems.DinoNug1', 6, originalAge)
	addItemsWithAge(inventory, 'PompsItems.DinoNug2', 6, originalAge)
	addItemsWithAge(inventory, 'PompsItems.DinoNug3', 6, originalAge)
end

	--Vanilla Oreos
function Recipe.OnCreate.OpenVanillaSandwichCookies(items, result, player)
    player:getInventory():AddItems("PompsItems.POreoVanilla", 20);
end

	--Chocolate Oreos
function Recipe.OnCreate.OpenChocolateSandwichCookies(items, result, player)
    player:getInventory():AddItems("PompsItems.POreo", 20);
end

	--Chocolate Cross
function Recipe.OnCreate.OpenChocolateCrossBox(items, result, player)
    player:getInventory():AddItem("PompsItems.ChocolateCross");
end

	--Chocolate Rabbit
function Recipe.OnCreate.OpenChocolateRabbitBox(items, result, player)
    player:getInventory():AddItem("PompsItems.ChocolateRabbit");
end

	--Utah Wafers
function Recipe.OnCreate.OpenUtahWafers(items, result, player)
    player:getInventory():AddItems("PompsItems.UtahWafers", 2);
end

	--Wasabi Wafers
function Recipe.OnCreate.OpenWasabiWafers(items, result, player)
    player:getInventory():AddItems("PompsItems.WasabiWafers", 2);
end

	--Buckeyes
function Recipe.OnCreate.OpenBuckeyes(items, result, player)
    player:getInventory():AddItems("PompsItems.Buckeyes", 8);
end

	--Fig Bar Box
function Recipe.OnCreate.OpenFigBarBox(items, result, player)
    player:getInventory():AddItems("PompsItems.PIFigBar", 8);
end

	--Medium Snackable Ham and Cheddar
function Recipe.OnCreate.OpenMedSnackableHamCheddar(items, result, player)
	local inventory = player:getInventory()
	local originalAge = items:get(0):getAge()
	addItemsWithAge(inventory, 'PompsItems.PIRitz', 5, originalAge)
	addItemsWithAge(inventory, 'PompsItems.PIHam', 5, originalAge)
	addItemsWithAge(inventory, 'PompsItems.PICheddar', 5, originalAge)
    player:getInventory():AddItems("PompsItems.POreoVanilla", 2);
end

	--Medium Snackable Pepperoni and Mozzarella
function Recipe.OnCreate.OpenMedSnackablePepperoniMox(items, result, player)
	local inventory = player:getInventory()
	local originalAge = items:get(0):getAge()
	addItemsWithAge(inventory, 'PompsItems.PIRitz', 5, originalAge)
	addItemsWithAge(inventory, 'PompsItems.PIPepperoni', 5, originalAge)
	addItemsWithAge(inventory, 'PompsItems.PIMozzarella', 5, originalAge)
end

	--Medium Snackable Ham and Swiss
function Recipe.OnCreate.OpenMedSnackableHamSwiss(items, result, player)
	local inventory = player:getInventory()
	local originalAge = items:get(0):getAge()
	addItemsWithAge(inventory, 'PompsItems.PIRitz', 5, originalAge)
	addItemsWithAge(inventory, 'PompsItems.PIHam', 5, originalAge)
	addItemsWithAge(inventory, 'PompsItems.PISwissCheese', 5, originalAge)
end

	--Medium Snackable Turkey and Cheddar
function Recipe.OnCreate.OpenMedSnackableTurkeyCheddar(items, result, player)
	local inventory = player:getInventory()
	local originalAge = items:get(0):getAge()
	addItemsWithAge(inventory, 'PompsItems.PIRitz', 5, originalAge)
	addItemsWithAge(inventory, 'PompsItems.PITurkey', 5, originalAge)
	addItemsWithAge(inventory, 'PompsItems.PICheddar', 5, originalAge)
end

	--Medium Snackable Bologna and American
function Recipe.OnCreate.OpenMedSnackableBologna(items, result, player)
	local inventory = player:getInventory()
	local originalAge = items:get(0):getAge()
	addItemsWithAge(inventory, 'PompsItems.PIRitz', 5, originalAge)
	addItemsWithAge(inventory, 'PompsItems.PIBologna', 5, originalAge)
	addItemsWithAge(inventory, 'PompsItems.PIAmerican', 5, originalAge)
    player:getInventory():AddItems("Base.CookieChocolateChip", 2);
end

	--Medium Snackable Ham and American
function Recipe.OnCreate.OpenMedSnackableHamAmerican(items, result, player)
	local inventory = player:getInventory()
	local originalAge = items:get(0):getAge()
	addItemsWithAge(inventory, 'PompsItems.PIRitz', 5, originalAge)
	addItemsWithAge(inventory, 'PompsItems.PIHam', 5, originalAge)
	addItemsWithAge(inventory, 'PompsItems.PIAmerican', 5, originalAge)
    player:getInventory():AddItems("PompsItems.POreo", 2);
end

	--Medium Snackable Cheese Pizza
function Recipe.OnCreate.OpenMedSnackableCheesePizza(items, result, player)
	local inventory = player:getInventory()
	local originalAge = items:get(0):getAge()
	addItemsWithAge(inventory, 'PompsItems.PIPizzaMarinara', 1, originalAge)
	addItemsWithAge(inventory, 'PompsItems.PISnackCheese', 3, originalAge)
	addItemsWithAge(inventory, 'PompsItems.PIPizzaBlank', 3, originalAge)
end

	--Medium Snackable Pepperoni Pizza
function Recipe.OnCreate.OpenMedSnackablePepperoniPizza(items, result, player)
	local inventory = player:getInventory()
	local originalAge = items:get(0):getAge()
	addItemsWithAge(inventory, 'PompsItems.PIPizzaMarinara', 1, originalAge)
	addItemsWithAge(inventory, 'PompsItems.PISnackCheese', 3, originalAge)
	addItemsWithAge(inventory, 'PompsItems.PIPepperoni', 3, originalAge)
	addItemsWithAge(inventory, 'PompsItems.PIPizzaBlank', 3, originalAge)
end

	--Medium Snackable Chicken Pizza
function Recipe.OnCreate.OpenMedSnackableChickenPizza(items, result, player)
	local inventory = player:getInventory()
	local originalAge = items:get(0):getAge()
	addItemsWithAge(inventory, 'PompsItems.PIPizzaMarinara', 1, originalAge)
	addItemsWithAge(inventory, 'PompsItems.PISnackCheese', 3, originalAge)
	addItemsWithAge(inventory, 'PompsItems.PISnackNuggs', 3, originalAge)
	addItemsWithAge(inventory, 'PompsItems.PIPizzaBlank', 3, originalAge)
end

	--Empty RM Oyster Package
function Recipe.OnCreate.OpenRMOysters(items, result, player)
	local inventory = player:getInventory()
	local originalAge = items:get(0):getAge()
	addItemsWithAge(inventory, 'PompsItems.PIOyster', 8, originalAge)
end

	--Fruit Barrel Box
function Recipe.OnCreate.OpenFruitBarrelBox(items, result, player)
    player:getInventory():AddItems("PompsItems.PIBRBarrel", 10);
    player:getInventory():AddItems("PompsItems.PIGreenBarrel", 10);
    player:getInventory():AddItems("PompsItems.PIPurpleBarrel", 10);
    player:getInventory():AddItems("PompsItems.PIRedBarrel", 10);
end

	--Whizzy Suckers
function Recipe.OnCreate.OpenWhizzySuckers(items, result, player)
    player:getInventory():AddItems("PompsItems.PIRingPopBlue", 1);
    player:getInventory():AddItems("PompsItems.PIRingPopRed", 1);
    player:getInventory():AddItems("PompsItems.PIRingPopPurple", 1);
    player:getInventory():AddItems("PompsItems.PIRingPopGreen", 1);
    player:getInventory():AddItems("PompsItems.PIRingPopFancy", 1);
	if SandboxVars.PompsItems.Littering then
        player:getInventory():Remove("PompsItems.PIWhizzyPopsEmpty")
    end
end

	--Freeze Pops
function Recipe.OnCreate.OpenFreezePops(items, result, player)
    player:getInventory():AddItems("PompsItems.PIFreezePopPurple", 4);
    player:getInventory():AddItems("PompsItems.PIFreezePopOrange", 4);
    player:getInventory():AddItems("PompsItems.PIFreezePopBlue", 4);
	player:getInventory():AddItems("PompsItems.PIFreezePopWhite", 4);
	player:getInventory():AddItems("PompsItems.PIFreezePopYellow", 4);
	player:getInventory():AddItems("PompsItems.PIFreezePopGreen", 4);
	player:getInventory():AddItems("PompsItems.PIFreezePopNougat", 4);
	player:getInventory():AddItems("PompsItems.PIFreezePopPink", 4);
	player:getInventory():AddItems("PompsItems.PIFreezePopRed", 4);
	player:getInventory():AddItems("PompsItems.PIFreezePopMango", 4);
end

	--Honey Bun Box
function Recipe.OnCreate.OpenHoneyBunBox(items, result, player)
    player:getInventory():AddItems("PompsItems.PIHoneyBun", 6);
end

	--Powder Donut Bag
function Recipe.OnCreate.OpenPowderDonutBag(items, result, player)
    player:getInventory():AddItems("PompsItems.PIPowderDonut", 20);
end

	--Choc Donut Bag
function Recipe.OnCreate.OpenChocDonutBag(items, result, player)
    player:getInventory():AddItems("PompsItems.PIChocDonut", 20);
end

	--SW Donut Bag
function Recipe.OnCreate.OpenSWDonutBag(items, result, player)
    player:getInventory():AddItems("PompsItems.PISWDonut", 20);
end

	--Glaze Donut Bag
function Recipe.OnCreate.OpenGlazeDonutBag(items, result, player)
    player:getInventory():AddItems("PompsItems.PIGlazeDonut", 20);
end

	--PompsBig
function Recipe.OnCreate.OpenPompsBig(items, result, player)
    player:getInventory():AddItems("PompsItems.PBCupBig", 2);
end

	--Fruit Spillers
function Recipe.OnCreate.OpenFruitSpillers(items, result, player)
    player:getInventory():AddItems("PompsItems.PIFruitSpillers", 6);
end

	--Ice Cream Sandwiches
function Recipe.OnCreate.OpenIceCreamSandwiches(items, result, player)
	local inventory = player:getInventory()
	local originalAge = items:get(0):getAge()
	addItemsWithAge(inventory, 'PompsItems.PIIceCreamSandwich', 12, originalAge)
end

	--Frozen Pepperoni Pizza
function Recipe.OnCreate.OpenPepperoniPizza(items, result, player)
	local inventory = player:getInventory()
	local originalAge = items:get(0):getAge()
	addItemsWithAge(inventory, 'PompsItems.PIFrozenPizzaPepperoni', 1, originalAge)
end

	--Frozen Cheese Pizza
function Recipe.OnCreate.OpenCheesePizza(items, result, player)
	local inventory = player:getInventory()
	local originalAge = items:get(0):getAge()
	addItemsWithAge(inventory, 'PompsItems.PIFrozenPizzaCheese', 1, originalAge)
end

	--Frozen Supreme Pizza
function Recipe.OnCreate.OpenSupremePizza(items, result, player)
	local inventory = player:getInventory()
	local originalAge = items:get(0):getAge()
	addItemsWithAge(inventory, 'PompsItems.PIFrozenPizzaSupreme', 1, originalAge)
end

	--Frozen Meat Pizza
function Recipe.OnCreate.OpenMeatPizza(items, result, player)
	local inventory = player:getInventory()
	local originalAge = items:get(0):getAge()
	addItemsWithAge(inventory, 'PompsItems.PIFrozenPizzaMeat', 1, originalAge)
end

	--Classic Mac & Cheese Packet
function Recipe.OnCreate.PIOpenClassicMacCheese(items, result, player)
    player:getInventory():AddItem("PompsItems.CheetosPacket");
end