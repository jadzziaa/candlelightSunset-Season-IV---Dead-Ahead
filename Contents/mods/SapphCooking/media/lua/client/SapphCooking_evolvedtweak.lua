--This code is for adding evolved recipes.
--this way it's not necessary to overlap the existing vanila items.

--Thanks Glytch3r and Blair Algol for the help!!



Events.OnGameStart.Add(function()

--BaseItems Tags.
	local item = ScriptManager.instance:getItem("Base.Soysauce")
	if item then 
		item:DoParam("Tags = Soysauce")
	end

	local item = ScriptManager.instance:getItem("Base.Pasta")
	if item then 
		item:DoParam("Tags = Pasta")
	end

	local item = ScriptManager.instance:getItem("Base.Ramen")
	if item then 
		item:DoParam("Tags = Pasta")
	end

	local item = ScriptManager.instance:getItem("Base.RiceBowl")
	if item then 
		item:DoParam("Tags = RiceBowl")
	end

	local item = ScriptManager.instance:getItem("Base.Smallbirdmeat")
	if item then 
		item:DoParam("Tags = Chicken")
	end

	local item = ScriptManager.instance:getItem("Base.Chicken")
	if item then 
		item:DoParam("Tags = Chicken")
	end

	local item = ScriptManager.instance:getItem("Base.Hotsauce")
	if item then 
		item:DoParam("Tags = Pepper")
	end

	--BaseItems Spices Evolved Recipes

	local item = ScriptManager.instance:getItem("Base.Salt")
	if item then 
		item:DoParam("EvolvedRecipe = Pizza:1;Soup:1;Stew:1;Pie:1;Stir fry Griddle Pan:1;Stir fry:1;Burger:1;Salad:1;Roasted Vegetables:1;RicePot:1;RicePan:1;PastaPot:1;PastaPan:1;Sandwich:1;Sandwich Baguette:1;Taco:1;Burrito:1;Beverage:1;Beverage2:1;Beer:1;Beer2:1;SapphCooking.SkewersInsect:1;SapphCooking.SkewersMeat:1;SapphCooking.SkewersVegetable:1;SapphCooking.SapphCrackers:1;SapphCooking.SapphCrackers2:1")
	end

	local item = ScriptManager.instance:getItem("Base.Pepper")
	if item then 
		item:DoParam("EvolvedRecipe = Pizza:1;Soup:1;Stew:1;Pie:1;Stir fry Griddle Pan:1;Stir fry:1;Burger:1;Salad:1;Roasted Vegetables:1;RicePot:1;RicePan:1;PastaPot:1;PastaPan:1;Sandwich:1;Sandwich Baguette:1;Taco:1;Burrito:1;Beverage:1;Beverage2:1;Beer:1;Beer2:1;SapphCooking.SkewersInsect:1;SapphCooking.SkewersMeat:1;SapphCooking.SkewersVegetable:1;SapphCooking.SapphCrackers:1;SapphCooking.SapphCrackers2:1")
	end

	local item = ScriptManager.instance:getItem("Base.Ketchup")
	if item then 
		item:DoParam("EvolvedRecipe = Sandwich:2;Sandwich Baguette:2;Burger:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Taco:2;Burrito:2;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2")
	end

	local item = ScriptManager.instance:getItem("Base.Hotsauce")
	if item then 
		item:DoParam("EvolvedRecipe = Pizza:4;Omelette:2;Sandwich:2;Sandwich Baguette:2;Burger:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Taco:2;Burrito:2;Beverage:1;Beverage2:1;Stir fry:4;Stir fry Griddle Pan:4;Beer:1;Beer2:1;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2")
	end

	local item = ScriptManager.instance:getItem("Base.Honey")
	if item then 
		item:DoParam("EvolvedRecipe =  Beverage:2;Beverage2:2;Cake:5;Sandwich:2;Sandwich Baguette:2;FruitSalad:2;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Pancakes:2;Waffles:2;ConeIcecream:2;PieSweet:5;Toast:2;Oatmeal:2;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2")
	end

	local item = ScriptManager.instance:getItem("Base.PeanutButter")
	if item then 
		item:DoParam("EvolvedRecipe =  Soup:5;Stir fry Griddle Pan:5;Stir fry:5;Sandwich:5;Sandwich Baguette:5;Toast:5;ConeIcecream:5;SapphCooking.SkewersInsect:3;SapphCooking.SkewersMeat:3;SapphCooking.SkewersVegetable:3;SapphCooking.SapphCrackers:3;SapphCooking.SapphCrackers2:3")
	end


	--Evolved recipes
	--Burritos and Tacos

			--Pans
	local item = ScriptManager.instance:getItem("SapphCooking.SaucepanwithArborioRice")
	if item then 
		item:DoParam("EvolvedRecipe = Taco:10;Burrito:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SaucepanwithBrownRice")
	if item then 
		item:DoParam("EvolvedRecipe = Taco:10;Burrito:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SaucepanwithSpaguetti")
	if item then 
		item:DoParam("EvolvedRecipe = Taco:9;Burrito:18")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SaucepanwithSpaguettiandMeatballs")
	if item then 
		item:DoParam("EvolvedRecipe = Taco:9;Burrito:18")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SaucepanwithBeefStew")
	if item then 
		item:DoParam("EvolvedRecipe = Taco:9;Burrito:18")
	end

			--Bowls

	local item = ScriptManager.instance:getItem("SapphCooking.BowlofChickenStroganoff")
	if item then 
		item:DoParam("EvolvedRecipe = Taco:9;Burrito:18")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BowlofYakisoba")
	if item then 
		item:DoParam("EvolvedRecipe = Taco:10;Burrito:15")
	end


	local item = ScriptManager.instance:getItem("SapphCooking.ArborioRiceBowl")
	if item then 
		item:DoParam("EvolvedRecipe = Taco:10;Burrito:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BrownRiceBowl")
	if item then 
		item:DoParam("EvolvedRecipe = Taco:10;Burrito:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BowlofBeefStew")
	if item then 
		item:DoParam("EvolvedRecipe = Taco:9;Burrito:18")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BowlofGuacamole")
	if item then 
		item:DoParam("EvolvedRecipe = Taco:9;Burrito:18")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BowlofQueso")
	if item then 
		item:DoParam("EvolvedRecipe = Taco:9;Burrito:18")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BowlofRefriedBeans")
	if item then 
		item:DoParam("EvolvedRecipe = Taco:9;Burrito:18")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BowlofSpaguetti")
	if item then 
		item:DoParam("EvolvedRecipe = Taco:9;Burrito:18")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BowlofSpaguettiandMeatballs")
	if item then 
		item:DoParam("EvolvedRecipe = Taco:9;Burrito:18")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BowlofChili")
	if item then 
		item:DoParam("EvolvedRecipe = Taco:9;Burrito:15")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.RiceBeanBowl")
	if item then 
		item:DoParam("EvolvedRecipe = Taco:15;Burrito:15")
	end



	--Thermos

	local item = ScriptManager.instance:getItem("Base.Coffee2")
	if item then 
		item:DoParam("EvolvedRecipe = HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("Base.Teabag2")
	if item then 
		item:DoParam("EvolvedRecipe = HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("Base.Sugar")
	if item then 
		item:DoParam("EvolvedRecipe = HotDrink:1;HotDrinkRed:1;HotDrinkWhite:1;HotDrinkSpiffo:1;HotDrinkTea:1;Toast:1;Oatmeal:1;Beverage:1;Beverage2:1;SapphCooking.ThermosBeverage:1")
	end

	local item = ScriptManager.instance:getItem("Base.SugarBrown")
	if item then 
		item:DoParam("EvolvedRecipe = HotDrink:1;HotDrinkRed:1;HotDrinkWhite:1;HotDrinkSpiffo:1;HotDrinkTea:1;Toast:1;Oatmeal:1;Beverage:1;Beverage2:1;SapphCooking.ThermosBeverage:1")
	end

	local item = ScriptManager.instance:getItem("Base.SugarPacket")
	if item then 
		item:DoParam("EvolvedRecipe = HotDrink:1;HotDrinkRed:1;HotDrinkWhite:1;HotDrinkSpiffo:1;HotDrinkTea:1;Toast:1;Oatmeal:1;Beverage:1;Beverage2:1;SapphCooking.ThermosBeverage:1")
	end

	local item = ScriptManager.instance:getItem("Base.CocoaPowder")
	if item then 
		item:DoParam("EvolvedRecipe = HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5;ConeIcecream:5;Pancakes:5;Waffles:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("Base.WhiskeyFull")
	if item then 
		item:DoParam("EvolvedRecipe = Beverage:4;Beverage2:4;HotDrink:4;HotDrinkRed:4;HotDrinkWhite:4;HotDrinkSpiffo:4;HotDrinkTea:4;SapphCooking.ThermosBeverage:4")
	end


	local item = ScriptManager.instance:getItem("Base.Milk")
	if item then 
		item:DoParam("EvolvedRecipe = HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Beverage:2;Beverage2:2;Oatmeal:2;Soup:5;Stew:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("Base.BeerBottle")
	if item then 
		item:DoParam("EvolvedRecipe = Soup:9;Stew:9;Beer:9;Beer2:9;SapphCooking.ThermosBeverage:9")
	end

	local item = ScriptManager.instance:getItem("Base.BeerCan")
	if item then 
		item:DoParam("EvolvedRecipe = Soup:9;Stew:9;Beer:9;Beer2:9;SapphCooking.ThermosBeverage:9")
	end

	local item = ScriptManager.instance:getItem("Base.CannedMilkOpen")
	if item then 
	item:DoParam("EvolvedRecipe = FruitSalad:2;Pancakes:2;Waffles:2;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Beverage:5;Beverage2:5;Oatmeal:2;PieSweet:5;Cake:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SaucepanHotChocolate")
	if item then 
		item:DoParam("EvolvedRecipe = HotDrink:10;HotDrinkRed:10;HotDrinkWhite:10;HotDrinkSpiffo:10;HotDrinkTea:10;SapphCooking.ThermosBeverage:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.AlmondMilk")
	if item then 
		item:DoParam("EvolvedRecipe = FruitSalad:2;Pancakes:2;Waffles:2;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Beverage:5;Beverage2:5;Oatmeal:2;PieSweet:5;Cake:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BottlewithMilk")
	if item then 
		item:DoParam("EvolvedRecipe = FruitSalad:2;Pancakes:2;Waffles:2;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Beverage:5;Beverage2:5;Oatmeal:2;PieSweet:5;Cake:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.PopbottlewithMilk")
	if item then 
		item:DoParam("EvolvedRecipe = FruitSalad:2;Pancakes:2;Waffles:2;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Beverage:5;Beverage2:5;Oatmeal:2;PieSweet:5;Cake:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.ColaBottlewithMilk")
	if item then 
		item:DoParam("EvolvedRecipe = FruitSalad:2;Pancakes:2;Waffles:2;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Beverage:5;Beverage2:5;Oatmeal:2;PieSweet:5;Cake:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.ColaBottlewithProteinShake")
	if item then 
		item:DoParam("EvolvedRecipe = SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BleachBottlewithProteinShake")
	if item then 
		item:DoParam("EvolvedRecipe = SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.PopBottlewithProteinShake")
	if item then 
		item:DoParam("EvolvedRecipe = SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.BottlewithProteinShake")
	if item then 
		item:DoParam("EvolvedRecipe = SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.StrawberryMilk")
	if item then 
		item:DoParam("EvolvedRecipe = FruitSalad:2;Pancakes:2;Waffles:2;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Beverage:5;Beverage2:5;Oatmeal:2;PieSweet:5;Cake:5;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.TequilaFull")
	if item then 
	item:DoParam("EvolvedRecipe = Soup:8;Stew:8;Beer:9;Beer2:9;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.VodkaFull")
	if item then 
		item:DoParam("EvolvedRecipe = Soup:8;Stew:8;Beer:9;Beer2:9;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.CachaçaFull")
	if item then 
		item:DoParam("EvolvedRecipe = Soup:8;Stew:8;Beer:9;Beer2:9;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.GinFull")
	if item then 
		item:DoParam("EvolvedRecipe = Soup:8;Stew:8;Beer:9;Beer2:9;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SakeFull")
	if item then 
		item:DoParam("EvolvedRecipe = Soup:8;Stew:8;Beer:9;Beer2:9;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.RumFull")
	if item then 
		item:DoParam("EvolvedRecipe = Soup:8;Stew:8;Beer:9;Beer2:9;SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.ColaBottle")
	if item then 
		item:DoParam("EvolvedRecipe = SapphCooking.ThermosBeverage:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.EnergyDrink")
	if item then 
		item:DoParam("EvolvedRecipe = HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Beverage:2;Beverage2:2;Oatmeal:2;SapphCooking.ThermosBeverage:4")
	end

	local item = ScriptManager.instance:getItem("Base.PopBottle")
	if item then 
		item:DoParam("EvolvedRecipe = Beverage:4;Beverage2:4;SapphCooking.ThermosBeverage:4")
	end

	local item = ScriptManager.instance:getItem("Base.Pop")
	if item then 
		item:DoParam("EvolvedRecipe = Beverage:4;Beverage2:4;SapphCooking.ThermosBeverage:4")
	end

	local item = ScriptManager.instance:getItem("Base.Pop2")
	if item then 
		item:DoParam("EvolvedRecipe = Beverage:4;Beverage2:4;SapphCooking.ThermosBeverage:4")
	end

	local item = ScriptManager.instance:getItem("Base.Pop3")
	if item then 
		item:DoParam("EvolvedRecipe = Beverage:4;Beverage2:4;SapphCooking.ThermosBeverage:4")
	end


	local item = ScriptManager.instance:getItem("Base.Wine")
	if item then 
		item:DoParam("EvolvedRecipe = Beverage:4;Beverage2:4;WineInGlass:4;PastaPot:4;PastaPan:4;SapphCooking.ThermosBeverage:4")
	end

	local item = ScriptManager.instance:getItem("Base.Wine2")
	if item then 
		item:DoParam("EvolvedRecipe = Beverage:4;Beverage2:4;WineInGlass:4;PastaPot:4;PastaPan:4;SapphCooking.ThermosBeverage:4")
	end




	--Skewers_Insects

	local item = ScriptManager.instance:getItem("Base.Cockroach")
	if item then 
		item:DoParam("EvolvedRecipe = SapphCooking.SkewersInsect:11")
	end

	local item = ScriptManager.instance:getItem("Base.Grasshopper")
	if item then 
		item:DoParam("EvolvedRecipe = SapphCooking.SkewersInsect:7")
	end

	local item = ScriptManager.instance:getItem("Base.Cricket")
	if item then 
		item:DoParam("EvolvedRecipe = SapphCooking.SkewersInsect:6")
	end





	--Skewers_Meat

	local item = ScriptManager.instance:getItem("Base.FishFillet")
	if item then 
		item:DoParam("EvolvedRecipe = Pizza:15;Soup:15;Stew:15;Pie:15;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:5|Cooked;Sandwich Baguette:5|Cooked;Burger:10|Cooked;Salad:10|Cooked;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;Taco:10|Cooked;Burrito:15|Cooked;SapphCooking.SkewersMeat:10")
	end

	local item = ScriptManager.instance:getItem("Base.Salmon")
	if item then 
		item:DoParam("EvolvedRecipe = Pizza:15;Soup:15;Stew:15;Pie:15;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:5|Cooked;Sandwich Baguette:5|Cooked;Salad:10|Cooked;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;Taco:8|Cooked;Burrito:16|Cooked;SapphCooking.SkewersMeat:10")
	end

	local item = ScriptManager.instance:getItem("Base.Rabbitmeat")
	if item then 
		item:DoParam("EvolvedRecipe = Soup:15;Stew:15;Pie:15;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:5|Cooked;Sandwich Baguette:5|Cooked;Burger:10|Cooked;Salad:10|Cooked;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;SapphCooking.SkewersMeat:10")
	end

	local item = ScriptManager.instance:getItem("Base.Smallanimalmeat")
	if item then 
		item:DoParam("EvolvedRecipe = Soup:15;Stew:15;Pie:15;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:5|Cooked;Sandwich Baguette:5|Cooked;Burger:10|Cooked;Salad:10|Cooked;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;SapphCooking.SkewersMeat:10")
	end

	local item = ScriptManager.instance:getItem("Base.Sausage")
	if item then 
		item:DoParam("EvolvedRecipe = Pizza:20;Stew:20;Stir fry Griddle Pan:20;Stir fry:20;Burger:20|Cooked;Roasted Vegetables:20;PastaPot:20;PastaPan:20;RicePot:20;RicePan:20;Taco:5|Cooked;Burrito:10|Cooked;SapphCooking.SkewersMeat:10")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SlicedSteak")
	if item then 
		item:DoParam("EvolvedRecipe = SapphCooking.SkewersMeat:10;Pizza:15;Stew:15;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:5|Cooked;Sandwich Baguette:5|Cooked;Salad:10|Cooked;Roasted Vegetables:15;PastaPot:15;PastaPan:15;RicePot:15;RicePan:15;Taco:15|Cooked;Burrito:15|Cooked")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SlicedChicken")
	if item then 
		item:DoParam("EvolvedRecipe = SapphCooking.SkewersMeat:10;Pizza:12;Soup:15;Stew:15;Pie:12;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:6|Cooked;Sandwich Baguette:6|Cooked;Burger:12|Cooked;Salad:6|Cooked;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;Taco:6|Cooked;Burrito:12|Cooked")
	end




	--Skewers_Vegetable
		--Can be add with all Skewers

	local item = ScriptManager.instance:getItem("Base.MushroomGeneric1")
	if item then 
		item:DoParam("EvolvedRecipe = SapphCooking.SkewersInsect:5;SapphCooking.SkewersVegetable:6;SapphCooking.SkewersMeat:6;Pizza:13;Burger:13;Omelette:13;Stir fry Griddle Pan:13;Stir fry:13;Stew:13;Pie:13;Soup:13;Sandwich:13;Sandwich Baguette:13;Salad:13;Roasted Vegetables:13;RicePot:13;RicePan:13;PastaPot:13;PastaPan:13;HotDrink:6;HotDrinkRed:6;HotDrinkWhite:6;HotDrinkSpiffo:6;HotDrinkTea:6")
	end

	local item = ScriptManager.instance:getItem("Base.MushroomGeneric2")
	if item then 
		item:DoParam("EvolvedRecipe = SapphCooking.SkewersInsect:5;SapphCooking.SkewersVegetable:6;SapphCooking.SkewersMeat:6;Pizza:13;Burger:13;Omelette:13;Stir fry Griddle Pan:13;Stir fry:13;Stew:13;Pie:13;Soup:13;Sandwich:13;Sandwich Baguette:13;Salad:13;Roasted Vegetables:13;RicePot:13;RicePan:13;PastaPot:13;PastaPan:13;HotDrink:6;HotDrinkRed:6;HotDrinkWhite:6;HotDrinkSpiffo:6;HotDrinkTea:6")
	end

	local item = ScriptManager.instance:getItem("Base.MushroomGeneric3")
	if item then 
		item:DoParam("EvolvedRecipe = SapphCooking.SkewersInsect:6;SapphCooking.SkewersVegetable:6;SapphCooking.SkewersMeat:6;Pizza:15;Burger:15;Omelette:15;Stir fry Griddle Pan:15;Stir fry:15;Stew:15;Pie:15;Soup:15;Sandwich:15;Sandwich Baguette:15;Salad:15;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5")
	end

	local item = ScriptManager.instance:getItem("Base.MushroomGeneric4")
	if item then 
		item:DoParam("EvolvedRecipe = SapphCooking.SkewersInsect:5;SapphCooking.SkewersVegetable:6;SapphCooking.SkewersMeat:6;Pizza:13;Burger:13;Omelette:13;Stir fry Griddle Pan:13;Stir fry:13;Stew:13;Pie:13;Soup:13;Sandwich:13;Sandwich Baguette:13;Salad:13;Roasted Vegetables:13;RicePot:13;RicePan:13;PastaPot:13;PastaPan:13;HotDrink:6;HotDrinkRed:6;HotDrinkWhite:6;HotDrinkSpiffo:6;HotDrinkTea:6")
	end

	local item = ScriptManager.instance:getItem("Base.MushroomGeneric5")
	if item then 
		item:DoParam("EvolvedRecipe = SapphCooking.SkewersInsect:6;SapphCooking.SkewersVegetable:6;SapphCooking.SkewersMeat:6;Pizza:15;Burger:15;Omelette:15;Stir fry Griddle Pan:15;Stir fry:15;Stew:15;Pie:15;Soup:15;Sandwich:15;Sandwich Baguette:15;Salad:15;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5")
	end

	local item = ScriptManager.instance:getItem("Base.MushroomGeneric6")
	if item then 
		item:DoParam("EvolvedRecipe = SapphCooking.SkewersInsect:5;SapphCooking.SkewersVegetable:6;SapphCooking.SkewersMeat:6;Pizza:13;Burger:13;Omelette:13;Stir fry Griddle Pan:13;Stir fry:13;Stew:13;Pie:13;Soup:13;Sandwich:13;Sandwich Baguette:13;Salad:13;Roasted Vegetables:13;RicePot:13;RicePan:13;PastaPot:13;PastaPan:13;HotDrink:6;HotDrinkRed:6;HotDrinkWhite:6;HotDrinkSpiffo:6;HotDrinkTea:6")
	end

	local item = ScriptManager.instance:getItem("Base.MushroomGeneric7")
	if item then 
		item:DoParam("EvolvedRecipe = SapphCooking.SkewersInsect:5;SapphCooking.SkewersVegetable:6;SapphCooking.SkewersMeat:6;Pizza:13;Burger:13;Omelette:13;Stir fry Griddle Pan:13;Stir fry:13;Stew:13;Pie:13;Soup:13;Sandwich:13;Sandwich Baguette:13;Salad:13;Roasted Vegetables:13;RicePot:13;RicePan:13;PastaPot:13;PastaPan:13;HotDrink:6;HotDrinkRed:6;HotDrinkWhite:6;HotDrinkSpiffo:6;HotDrinkTea:6")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.Seitan")
	if item then 
		item:DoParam("EvolvedRecipe = SapphCooking.SkewersInsect:5;SapphCooking.SkewersVegetable:10;SapphCooking.SkewersMeat:10;Pizza:12;Soup:15;Stew:15;Pie:12;Stir fry Griddle Pan:15;Stir fry:15;Sandwich:6|Cooked;Sandwich Baguette:6|Cooked;Burger:12|Cooked;Salad:6|Cooked;Roasted Vegetables:15;RicePot:15;RicePan:15;PastaPot:15;PastaPan:15;Taco:6|Cooked;Burrito:12|Cooked")
	end

	local item = ScriptManager.instance:getItem("Base.Cheese")
	if item then 
		item:DoParam("EvolvedRecipe = SapphCooking.SkewersVegetable:5;SapphCooking.SkewersMeat:5;SapphCooking.SkewersInsect:5;Pizza:15;Soup:10;Sandwich:5;Sandwich Baguette:5;Burger:5;Salad:5;PastaPot:10;PastaPan:10;Taco:5;Burrito:5;Bread:5;Toast:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.ParmesanCheese")
	if item then 
		item:DoParam("EvolvedRecipe = SapphCooking.SkewersVegetable:5;SapphCooking.SkewersMeat:5;SapphCooking.SkewersInsect:5;Pizza:15;Soup:10;Sandwich:5;Sandwich Baguette:5;Burger:5;Salad:5;PastaPot:10;PastaPan:10;Taco:5;Burrito:5;Bread:5;Toast:5")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.MozzarelaCheese")
	if item then 
		item:DoParam("EvolvedRecipe = SapphCooking.SkewersVegetable:5;SapphCooking.SkewersMeat:5;SapphCooking.SkewersInsect:5;Pizza:15;Soup:10;Sandwich:5;Sandwich Baguette:5;Burger:5;Salad:5;PastaPot:10;PastaPan:10;Taco:5;Burrito:5;Bread:5;Toast:5")
	end

	--Sachets
	--I may re-do this in the future

		local item = ScriptManager.instance:getItem("SapphCooking.SaltPacket")
	if item then 
		item:DoParam("EvolvedRecipe = Pizza:2;Omelette:2;Soup:2;Stew:2;Pie:2;Stir fry Griddle Pan:2;Stir fry:2;Burger:1;Salad:2;Roasted Vegetables:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Sandwich:2;Sandwich Baguette:2;Taco:2;Burrito:2;SapphCooking.MRE_1:3;SapphCooking.MRE_2:3;SapphCooking.MRE_3:3;SapphCooking.MRE_4:3;SapphCooking.MRE_5:3;SapphCooking.MRE_6:3;SapphCooking.MRE_7:3;SapphCooking.MRE_8:3;SapphCooking.MRE_9:3;SapphCooking.MRE_10:3;SapphCooking.MRE_11:3;SapphCooking.MRE_12:3;SapphCooking.BowlofFriedRice:3;SapphCooking.BowlofOmurice:3;SapphCooking.ArborioRiceBowl:3;SapphCooking.BowlofRisotto:3;SapphCooking.BrownRiceBowl:3;SapphCooking.BowlofRavioli:3;SapphCooking.BowlofTortellini:3;SapphCooking.BowlofBeefStew:3;SapphCooking.BowlofRefriedBeans:3;SapphCooking.BowlofSpaguetti:3;SapphCooking.BowlofSpaguettiandMeatballs:3;SapphCooking.BowlofMashedPotatoes:3;SapphCooking.BowlofYakisoba:3;SapphCooking.BowlofKungPaoChicken:3;SapphCooking.BowlofShuiZhuYu:3;SapphCooking.BowlofJapaneseCurry:3;SapphCooking.BowlofBorscht:3;SapphCooking.BowlofMashedPotatoes_Meatballs:3;SapphCooking.BowlofRiceJapaneseCurry:3;SapphCooking.FryingPan_BaconandEggs:3;SapphCooking.Plate_BaconandEggs:3;SapphCooking.PlateBlue_BaconandEggs:3;SapphCooking.PlateOrange_BaconandEggs:3;SapphCooking.PlateFancy_BaconandEggs:3;SapphCooking.RiceBeanBowl:3;SapphCooking.BowlofChickenStroganoff:3;SapphCooking.BowlofRiceChickenStroganoff:3;SapphCooking.Plate_HuevosRancheros:3;SapphCooking.PlateBlue_HuevosRancheros:3;SapphCooking.PlateOrange_HuevosRancheros:3;SapphCooking.PlateFancy_HuevosRancheros:3;SapphCooking.PoutineBowl:3;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.HotsaucePacket")
	if item then 
		item:DoParam("EvolvedRecipe = Pizza:2;Omelette:2;Soup:2;Stew:2;Pie:2;Stir fry Griddle Pan:2;Stir fry:2;Burger:1;Salad:2;Roasted Vegetables:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Sandwich:2;Sandwich Baguette:2;Taco:2;Burrito:2;SapphCooking.MRE_1:3;SapphCooking.MRE_2:3;SapphCooking.MRE_3:3;SapphCooking.MRE_4:3;SapphCooking.MRE_5:3;SapphCooking.MRE_6:3;SapphCooking.MRE_7:3;SapphCooking.MRE_8:3;SapphCooking.MRE_9:3;SapphCooking.MRE_10:3;SapphCooking.MRE_11:3;SapphCooking.MRE_12:3;SapphCooking.BowlofFriedRice:3;SapphCooking.BowlofOmurice:3;SapphCooking.ArborioRiceBowl:3;SapphCooking.BowlofRisotto:3;SapphCooking.BrownRiceBowl:3;SapphCooking.BowlofRavioli:3;SapphCooking.BowlofTortellini:3;SapphCooking.BowlofBeefStew:3;SapphCooking.BowlofRefriedBeans:3;SapphCooking.BowlofSpaguetti:3;SapphCooking.BowlofSpaguettiandMeatballs:3;SapphCooking.BowlofMashedPotatoes:3;SapphCooking.BowlofYakisoba:3;SapphCooking.BowlofKungPaoChicken:3;SapphCooking.BowlofShuiZhuYu:3;SapphCooking.BowlofJapaneseCurry:3;SapphCooking.BowlofBorscht:3;SapphCooking.BowlofMashedPotatoes_Meatballs:3;SapphCooking.BowlofRiceJapaneseCurry:3;SapphCooking.FryingPan_BaconandEggs:3;SapphCooking.Plate_BaconandEggs:3;SapphCooking.PlateBlue_BaconandEggs:3;SapphCooking.PlateOrange_BaconandEggs:3;SapphCooking.PlateFancy_BaconandEggs:3;SapphCooking.RiceBeanBowl:3;SapphCooking.BowlofChickenStroganoff:3;SapphCooking.BowlofRiceChickenStroganoff:3;SapphCooking.Plate_HuevosRancheros:3;SapphCooking.PlateBlue_HuevosRancheros:3;SapphCooking.PlateOrange_HuevosRancheros:3;SapphCooking.PlateFancy_HuevosRancheros:3;SapphCooking.PoutineBowl:3;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.Tomato_Sachet")
	if item then 
		item:DoParam("EvolvedRecipe = Pizza:2;Omelette:2;Soup:2;Stew:2;Pie:2;Stir fry Griddle Pan:2;Stir fry:2;Burger:1;Salad:2;Roasted Vegetables:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Sandwich:2;Sandwich Baguette:2;Taco:2;Burrito:2;SapphCooking.MRE_1:3;SapphCooking.MRE_2:3;SapphCooking.MRE_3:3;SapphCooking.MRE_4:3;SapphCooking.MRE_5:3;SapphCooking.MRE_6:3;SapphCooking.MRE_7:3;SapphCooking.MRE_8:3;SapphCooking.MRE_9:3;SapphCooking.MRE_10:3;SapphCooking.MRE_11:3;SapphCooking.MRE_12:3;SapphCooking.BowlofFriedRice:3;SapphCooking.BowlofOmurice:3;SapphCooking.ArborioRiceBowl:3;SapphCooking.BowlofRisotto:3;SapphCooking.BrownRiceBowl:3;SapphCooking.BowlofRavioli:3;SapphCooking.BowlofTortellini:3;SapphCooking.BowlofBeefStew:3;SapphCooking.BowlofRefriedBeans:3;SapphCooking.BowlofSpaguetti:3;SapphCooking.BowlofSpaguettiandMeatballs:3;SapphCooking.BowlofMashedPotatoes:3;SapphCooking.BowlofYakisoba:3;SapphCooking.BowlofKungPaoChicken:3;SapphCooking.BowlofShuiZhuYu:3;SapphCooking.BowlofJapaneseCurry:3;SapphCooking.BowlofBorscht:3;SapphCooking.BowlofMashedPotatoes_Meatballs:3;SapphCooking.BowlofRiceJapaneseCurry:3;SapphCooking.FryingPan_BaconandEggs:3;SapphCooking.Plate_BaconandEggs:3;SapphCooking.PlateBlue_BaconandEggs:3;SapphCooking.PlateOrange_BaconandEggs:3;SapphCooking.PlateFancy_BaconandEggs:3;SapphCooking.RiceBeanBowl:3;SapphCooking.BowlofChickenStroganoff:3;SapphCooking.BowlofRiceChickenStroganoff:3;SapphCooking.Plate_HuevosRancheros:3;SapphCooking.PlateBlue_HuevosRancheros:3;SapphCooking.PlateOrange_HuevosRancheros:3;SapphCooking.PlateFancy_HuevosRancheros:3;SapphCooking.PoutineBowl:3;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.SoySauce_Sachet")
	if item then 

		item:DoParam("EvolvedRecipe = Pizza:2;Omelette:2;Soup:2;Stew:2;Pie:2;Stir fry Griddle Pan:2;Stir fry:2;Burger:1;Salad:2;Roasted Vegetables:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Sandwich:2;Sandwich Baguette:2;Taco:2;Burrito:2;SapphCooking.MRE_1:3;SapphCooking.MRE_2:3;SapphCooking.MRE_3:3;SapphCooking.MRE_4:3;SapphCooking.MRE_5:3;SapphCooking.MRE_6:3;SapphCooking.MRE_7:3;SapphCooking.MRE_8:3;SapphCooking.MRE_9:3;SapphCooking.MRE_10:3;SapphCooking.MRE_11:3;SapphCooking.MRE_12:3;SapphCooking.BowlofFriedRice:3;SapphCooking.BowlofOmurice:3;SapphCooking.ArborioRiceBowl:3;SapphCooking.BowlofRisotto:3;SapphCooking.BrownRiceBowl:3;SapphCooking.BowlofRavioli:3;SapphCooking.BowlofTortellini:3;SapphCooking.BowlofBeefStew:3;SapphCooking.BowlofRefriedBeans:3;SapphCooking.BowlofSpaguetti:3;SapphCooking.BowlofSpaguettiandMeatballs:3;SapphCooking.BowlofMashedPotatoes:3;SapphCooking.BowlofYakisoba:3;SapphCooking.BowlofKungPaoChicken:3;SapphCooking.BowlofShuiZhuYu:3;SapphCooking.BowlofJapaneseCurry:3;SapphCooking.BowlofBorscht:3;SapphCooking.BowlofMashedPotatoes_Meatballs:3;SapphCooking.BowlofRiceJapaneseCurry:3;SapphCooking.FryingPan_BaconandEggs:3;SapphCooking.Plate_BaconandEggs:3;SapphCooking.PlateBlue_BaconandEggs:3;SapphCooking.PlateOrange_BaconandEggs:3;SapphCooking.PlateFancy_BaconandEggs:3;SapphCooking.RiceBeanBowl:3;SapphCooking.BowlofChickenStroganoff:3;SapphCooking.BowlofRiceChickenStroganoff:3;SapphCooking.Plate_HuevosRancheros:3;SapphCooking.PlateBlue_HuevosRancheros:3;SapphCooking.PlateOrange_HuevosRancheros:3;SapphCooking.PlateFancy_HuevosRancheros:3;SapphCooking.PoutineBowl:3;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.Mustard_Sachet")
	if item then 
		item:DoParam("EvolvedRecipe = Pizza:2;Omelette:2;Soup:2;Stew:2;Pie:2;Stir fry Griddle Pan:2;Stir fry:2;Burger:1;Salad:2;Roasted Vegetables:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Sandwich:2;Sandwich Baguette:2;Taco:2;Burrito:2;SapphCooking.MRE_1:3;SapphCooking.MRE_2:3;SapphCooking.MRE_3:3;SapphCooking.MRE_4:3;SapphCooking.MRE_5:3;SapphCooking.MRE_6:3;SapphCooking.MRE_7:3;SapphCooking.MRE_8:3;SapphCooking.MRE_9:3;SapphCooking.MRE_10:3;SapphCooking.MRE_11:3;SapphCooking.MRE_12:3;SapphCooking.BowlofFriedRice:3;SapphCooking.BowlofOmurice:3;SapphCooking.ArborioRiceBowl:3;SapphCooking.BowlofRisotto:3;SapphCooking.BrownRiceBowl:3;SapphCooking.BowlofRavioli:3;SapphCooking.BowlofTortellini:3;SapphCooking.BowlofBeefStew:3;SapphCooking.BowlofRefriedBeans:3;SapphCooking.BowlofSpaguetti:3;SapphCooking.BowlofSpaguettiandMeatballs:3;SapphCooking.BowlofMashedPotatoes:3;SapphCooking.BowlofYakisoba:3;SapphCooking.BowlofKungPaoChicken:3;SapphCooking.BowlofShuiZhuYu:3;SapphCooking.BowlofJapaneseCurry:3;SapphCooking.BowlofBorscht:3;SapphCooking.BowlofMashedPotatoes_Meatballs:3;SapphCooking.BowlofRiceJapaneseCurry:3;SapphCooking.FryingPan_BaconandEggs:3;SapphCooking.Plate_BaconandEggs:3;SapphCooking.PlateBlue_BaconandEggs:3;SapphCooking.PlateOrange_BaconandEggs:3;SapphCooking.PlateFancy_BaconandEggs:3;SapphCooking.RiceBeanBowl:3;SapphCooking.BowlofChickenStroganoff:3;SapphCooking.BowlofRiceChickenStroganoff:3;SapphCooking.Plate_HuevosRancheros:3;SapphCooking.PlateBlue_HuevosRancheros:3;SapphCooking.PlateOrange_HuevosRancheros:3;SapphCooking.PlateFancy_HuevosRancheros:3;SapphCooking.PoutineBowl:3;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2")
	end

	local item = ScriptManager.instance:getItem("SapphCooking.PeanutButter_Sachet")
	if item then 
		item:DoParam("EvolvedRecipe = Pizza:2;Omelette:2;Soup:2;Stew:2;Pie:2;Stir fry Griddle Pan:2;Stir fry:2;Burger:1;Salad:2;Roasted Vegetables:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Sandwich:2;Sandwich Baguette:2;Taco:2;Burrito:2;SapphCooking.MRE_1:3;SapphCooking.MRE_2:3;SapphCooking.MRE_3:3;SapphCooking.MRE_4:3;SapphCooking.MRE_5:3;SapphCooking.MRE_6:3;SapphCooking.MRE_7:3;SapphCooking.MRE_8:3;SapphCooking.MRE_9:3;SapphCooking.MRE_10:3;SapphCooking.MRE_11:3;SapphCooking.MRE_12:3;SapphCooking.BowlofFriedRice:3;SapphCooking.BowlofOmurice:3;SapphCooking.ArborioRiceBowl:3;SapphCooking.BowlofRisotto:3;SapphCooking.BrownRiceBowl:3;SapphCooking.BowlofRavioli:3;SapphCooking.BowlofTortellini:3;SapphCooking.BowlofBeefStew:3;SapphCooking.BowlofRefriedBeans:3;SapphCooking.BowlofSpaguetti:3;SapphCooking.BowlofSpaguettiandMeatballs:3;SapphCooking.BowlofMashedPotatoes:3;SapphCooking.BowlofYakisoba:3;SapphCooking.BowlofKungPaoChicken:3;SapphCooking.BowlofShuiZhuYu:3;SapphCooking.BowlofJapaneseCurry:3;SapphCooking.BowlofBorscht:3;SapphCooking.BowlofMashedPotatoes_Meatballs:3;SapphCooking.BowlofRiceJapaneseCurry:3;SapphCooking.FryingPan_BaconandEggs:3;SapphCooking.Plate_BaconandEggs:3;SapphCooking.PlateBlue_BaconandEggs:3;SapphCooking.PlateOrange_BaconandEggs:3;SapphCooking.PlateFancy_BaconandEggs:3;SapphCooking.RiceBeanBowl:3;SapphCooking.BowlofChickenStroganoff:3;SapphCooking.BowlofRiceChickenStroganoff:3;SapphCooking.Plate_HuevosRancheros:3;SapphCooking.PlateBlue_HuevosRancheros:3;SapphCooking.PlateOrange_HuevosRancheros:3;SapphCooking.PlateFancy_HuevosRancheros:3;SapphCooking.PoutineBowl:3;SapphCooking.SkewersInsect:2;SapphCooking.SkewersMeat:2;SapphCooking.SkewersVegetable:2;SapphCooking.SapphCrackers:2;SapphCooking.SapphCrackers2:2")
	end

end)