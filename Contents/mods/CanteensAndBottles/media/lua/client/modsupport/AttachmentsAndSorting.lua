-- DarkSlayerEX's Item Tweaker Core: an API for tweaking existing items without redefining them entirely.
--Initializes the tables needed for the code to run
if not ItemTweaker then  ItemTweaker = {} end
if not TweakItem then  TweakItem = {} end
if not TweakItemData then  TweakItemData = {} end

--Prep code to make the changes to all item in the TweakItemData table.
function ItemTweaker.tweakItems()
	local item;
	for k,v in pairs(TweakItemData) do
		for t,y in pairs(v) do
			item = ScriptManager.instance:getItem(k);
			if item ~= nil then
				item:DoParam(t.." = "..y);
				print(k..": "..t..", "..y);
			end
		end
	end
end

function TweakItem(itemName, itemProperty, propertyValue)
	if not TweakItemData[itemName] then
		TweakItemData[itemName] = {};
	end
	TweakItemData[itemName][itemProperty] = propertyValue;
end

Events.OnGameBoot.Add(ItemTweaker.tweakItems)

if getActivatedMods():contains("BetterSortCC") then
TweakItem("CanteensAndBottles.CanteenOliveDrabEmpty","DisplayCategory","Container");
TweakItem("CanteensAndBottles.CanteenArmyGreenEmpty","DisplayCategory","Container");
TweakItem("CanteensAndBottles.FlaskEmpty","DisplayCategory","Container");
TweakItem("CanteensAndBottles.FlaskSpiffoEmpty","DisplayCategory","Container");
TweakItem("CanteensAndBottles.GymBottleBlueYellowEmpty","DisplayCategory","Container");
TweakItem("CanteensAndBottles.GymBottleOrangeCharcoalEmpty","DisplayCategory","Container");
TweakItem("CanteensAndBottles.GymBottlePurpleGreyEmpty","DisplayCategory","Container");
TweakItem("CanteensAndBottles.GymBottleSpiffoEmpty","DisplayCategory","Container");
TweakItem("CanteensAndBottles.MedicinalCanteenWhiteGreenEmpty","DisplayCategory","Container");
TweakItem("CanteensAndBottles.MedicinalCanteenGreenWhiteEmpty","DisplayCategory","Container");
TweakItem("CanteensAndBottles.MedicinalCanteenWhiteRedEmpty","DisplayCategory","Container");
TweakItem("CanteensAndBottles.MedicinalCanteenRedWhiteEmpty","DisplayCategory","Container");
TweakItem("CanteensAndBottles.CampingCanteenArmyEmpty","DisplayCategory","Container");
TweakItem("CanteensAndBottles.CampingCanteenReadyPrepEmpty","DisplayCategory","Container");
TweakItem("CanteensAndBottles.CampingCanteenTartanEmpty","DisplayCategory","Container");
TweakItem("CanteensAndBottles.SmallWaterskinEmpty","DisplayCategory","Container");
TweakItem("CanteensAndBottles.LargeWaterskinEmpty","DisplayCategory","Container");
TweakItem("CanteensAndBottles.QualityWaterskinEmpty","DisplayCategory","Container");
TweakItem("CanteensAndBottles.GiantWaterBottleEmpty","DisplayCategory","Container");
TweakItem("CanteensAndBottles.JerryCanTankEmpty","DisplayCategory","Container");
TweakItem("CanteensAndBottles.JumboJerryCanTankEmpty","DisplayCategory","Container");
TweakItem("CanteensAndBottles.CanteenOliveDrabWater","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.CanteenArmyGreenWater","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.FlaskWater","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.FlaskSpiffoWater","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.GymBottleBlueYellowWater","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.GymBottleOrangeCharcoalWater","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.GymBottlePurpleGreyWater","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.GymBottleSpiffoWater","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.MedicinalCanteenWhiteGreenWater","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.MedicinalCanteenGreenWhiteWater","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.MedicinalCanteenWhiteRedWater","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.MedicinalCanteenRedWhiteWater","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.CampingCanteenArmyWater","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.CampingCanteenReadyPrepWater","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.CampingCanteenTartanWater","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.SmallWaterskinWater","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.LargeWaterskinWater","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.QualityWaterskinWater","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.GiantWaterBottleWater","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.CanteenOliveDrabPetrol","DisplayCategory","Fuel");
TweakItem("CanteensAndBottles.CanteenArmyGreenPetrol","DisplayCategory","Fuel");
TweakItem("CanteensAndBottles.FlaskPetrol","DisplayCategory","Fuel");
TweakItem("CanteensAndBottles.FlaskSpiffoPetrol","DisplayCategory","Fuel");
TweakItem("CanteensAndBottles.GymBottleBlueYellowPetrol","DisplayCategory","Fuel");
TweakItem("CanteensAndBottles.GymBottleOrangeCharcoalPetrol","DisplayCategory","Fuel");
TweakItem("CanteensAndBottles.GymBottlePurpleGreyPetrol","DisplayCategory","Fuel");
TweakItem("CanteensAndBottles.GymBottleSpiffoPetrol","DisplayCategory","Fuel");
TweakItem("CanteensAndBottles.MedicinalCanteenWhiteGreenPetrol","DisplayCategory","Fuel");
TweakItem("CanteensAndBottles.MedicinalCanteenGreenWhitePetrol","DisplayCategory","Fuel");
TweakItem("CanteensAndBottles.MedicinalCanteenWhiteRedPetrol","DisplayCategory","Fuel");
TweakItem("CanteensAndBottles.MedicinalCanteenRedWhitePetrol","DisplayCategory","Fuel");
TweakItem("CanteensAndBottles.CampingCanteenArmyPetrol","DisplayCategory","Fuel");
TweakItem("CanteensAndBottles.CampingCanteenReadyPrepPetrol","DisplayCategory","Fuel");
TweakItem("CanteensAndBottles.CampingCanteenTartanPetrol","DisplayCategory","Fuel");
TweakItem("CanteensAndBottles.SmallWaterskinPetrol","DisplayCategory","Fuel");
TweakItem("CanteensAndBottles.LargeWaterskinPetrol","DisplayCategory","Fuel");
TweakItem("CanteensAndBottles.QualityWaterskinPetrol","DisplayCategory","Fuel");
TweakItem("CanteensAndBottles.GiantWaterBottlePetrol","DisplayCategory","Fuel");
TweakItem("CanteensAndBottles.JerryCanTank","DisplayCategory","Fuel");
TweakItem("CanteensAndBottles.JumboJerryCanTank","DisplayCategory","Fuel");
TweakItem("CanteensAndBottles.FlaskBourbon","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.FlaskSpiffoJuice","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.GymBottleSpiffoade","DisplayCategory","FoodB");
TweakItem("CanteensAndBottles.MedicinalCanteenWhiteGreenSerum","DisplayCategory","Medical");
TweakItem("CanteensAndBottles.MedicinalCanteenGreenWhiteSerum","DisplayCategory","Medical");
TweakItem("CanteensAndBottles.MedicinalCanteenWhiteRedMedicine","DisplayCategory","Medical");
TweakItem("CanteensAndBottles.MedicinalCanteenRedWhiteMedicine","DisplayCategory","Medical");
end

if getActivatedMods():contains("Authentic Z - Current") or getActivatedMods():contains("AuthenticZLite") or getActivatedMods():contains("AuthenticZBackpacks+") or getActivatedMods():contains("nattachments") then
TweakItem("CanteensAndBottles.CanteenOliveDrabEmpty","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.CanteenOliveDrabWater","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.CanteenOliveDrabPetrol","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.CanteenArmyGreenEmpty","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.CanteenArmyGreenWater","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.CanteenArmyGreenPetrol","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.FlaskEmpty","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.FlaskWater","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.FlaskPetrol","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.FlaskBourbon","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.FlaskSpiffoEmpty","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.FlaskSpiffoWater","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.FlaskSpiffoPetrol","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.FlaskSpiffoJuice","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.GymBottleBlueYellowEmpty","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.GymBottleBlueYellowWater","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.GymBottleBlueYellowPetrol","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.GymBottleOrangeCharcoalEmpty","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.GymBottleOrangeCharcoalWater","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.GymBottleOrangeCharcoalPetrol","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.GymBottlePurpleGreyEmpty","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.GymBottlePurpleGreyWater","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.GymBottlePurpleGreyPetrol","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.GymBottleSpiffoEmpty","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.GymBottleSpiffoWater","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.GymBottleSpiffoPetrol","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.GymBottleSpiffoade","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.MedicinalCanteenWhiteGreenEmpty","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.MedicinalCanteenWhiteGreenWater","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.MedicinalCanteenWhiteGreenPetrol","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.MedicinalCanteenWhiteGreenSerum","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.MedicinalCanteenGreenWhiteEmpty","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.MedicinalCanteenGreenWhiteWater","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.MedicinalCanteenGreenWhitePetrol","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.MedicinalCanteenGreenWhiteSerum","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.MedicinalCanteenWhiteRedEmpty","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.MedicinalCanteenWhiteRedWater","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.MedicinalCanteenWhiteRedPetrol","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.MedicinalCanteenWhiteRedMedicine","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.MedicinalCanteenRedWhiteEmpty","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.MedicinalCanteenRedWhiteWater","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.MedicinalCanteenRedWhitePetrol","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.MedicinalCanteenRedWhiteMedicine","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.CampingCanteenArmyEmpty","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.CampingCanteenArmyWater","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.CampingCanteenArmyPetrol","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.CampingCanteenReadyPrepEmpty","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.CampingCanteenReadyPrepWater","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.CampingCanteenReadyPrepPetrol","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.CampingCanteenTartanEmpty","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.CampingCanteenTartanWater","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.CampingCanteenTartanPetrol","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.SmallWaterskinEmpty","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.SmallWaterskinWater","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.SmallWaterskinPetrol","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.LargeWaterskinEmpty","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.LargeWaterskinWater","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.LargeWaterskinPetrol","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.QualityWaterskinEmpty","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.QualityWaterskinWater","AttachmentType","Canteen");
TweakItem("CanteensAndBottles.QualityWaterskinPetrol","AttachmentType","Canteen");
end

-- Thanks to Cosmic, KI5 and Authentic Peach!