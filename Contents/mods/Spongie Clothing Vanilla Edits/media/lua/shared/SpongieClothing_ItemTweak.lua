if getActivatedMods():contains("ItemTweakerAPI") then
	require("ItemTweaker_Core");
else return end
Events.OnGameBoot.Add(function()

	-- OPEN JACKETS
	local currentItem = "Base.Jacket_WhiteTINT";
	TweakItem(currentItem,"ClothingItemExtra", "Base.Jacket_WhiteOPEN");
	TweakItem(currentItem,"ClothingItemExtraOption", "OpenJacket");
	TweakItem(currentItem,"clothingExtraSubmenu", "CloseJacket");


	local currentItem = "Base.Jacket_Fireman";
	TweakItem(currentItem,"ClothingItemExtra", "Base.Jacket_FiremanOPEN");
	TweakItem(currentItem,"ClothingItemExtraOption", "OpenJacket");
	TweakItem(currentItem,"clothingExtraSubmenu", "CloseJacket");

	local currentItem = "Base.Jacket_Chef";
	TweakItem(currentItem,"ClothingItemExtra", "Base.Jacket_ChefOPEN");
	TweakItem(currentItem,"ClothingItemExtraOption", "OpenJacket");
	TweakItem(currentItem,"clothingExtraSubmenu", "CloseJacket");

	local currentItem = "Base.Jacket_ArmyCamoDesert";
	TweakItem(currentItem,"ClothingItemExtra", "Base.Jacket_ArmyCamoDesertOPEN");
	TweakItem(currentItem,"ClothingItemExtraOption", "OpenJacket");
	TweakItem(currentItem,"clothingExtraSubmenu", "CloseJacket");

	local currentItem = "Base.Jacket_ArmyCamoGreen";
	TweakItem(currentItem,"ClothingItemExtra", "Base.Jacket_ArmyCamoGreenOPEN");
	TweakItem(currentItem,"ClothingItemExtraOption", "OpenJacket");
	TweakItem(currentItem,"clothingExtraSubmenu", "CloseJacket");

	local currentItem = "Base.Jacket_Police";
	TweakItem(currentItem,"ClothingItemExtra", "Base.Jacket_PoliceOPEN");
	TweakItem(currentItem,"ClothingItemExtraOption", "OpenJacket");
	TweakItem(currentItem,"clothingExtraSubmenu", "CloseJacket");

	local currentItem = "Base.Jacket_Ranger";
	TweakItem(currentItem,"ClothingItemExtra", "Base.Jacket_RangerOPEN");
	TweakItem(currentItem,"ClothingItemExtraOption", "OpenJacket");
	TweakItem(currentItem,"clothingExtraSubmenu", "CloseJacket");

	local currentItem = "Base.Jacket_CoatArmy";
	TweakItem(currentItem,"ClothingItemExtra", "Base.Jacket_CoatArmyOPEN");
	TweakItem(currentItem,"ClothingItemExtraOption", "OpenJacket");
	TweakItem(currentItem,"clothingExtraSubmenu", "CloseJacket");

	local currentItem = "Base.Jacket_Varsity";
	TweakItem(currentItem,"ClothingItemExtra", "Base.Jacket_VarsityOPEN");
	TweakItem(currentItem,"ClothingItemExtraOption", "OpenJacket");
	TweakItem(currentItem,"clothingExtraSubmenu", "CloseJacket");


	local currentItem = "Base.JacketLong_Doctor";
	TweakItem(currentItem,"ClothingItemExtra", "JacketLong_DoctorOPEN");
	TweakItem(currentItem,"ClothingItemExtraOption", "OpenJacket");
	TweakItem(currentItem,"clothingExtraSubmenu", "CloseJacket");

	local currentItem = "Base.JacketLong_Random";
	TweakItem(currentItem,"ClothingItemExtra", "JacketLong_RandomOPEN");
	TweakItem(currentItem,"ClothingItemExtraOption", "OpenJacket");
	TweakItem(currentItem,"clothingExtraSubmenu", "CloseJacket");

	local currentItem = "Base.JacketLong_Santa";
	TweakItem(currentItem,"ClothingItemExtra", "JacketLong_SantaOPEN");
	TweakItem(currentItem,"ClothingItemExtraOption", "OpenJacket");
	TweakItem(currentItem,"clothingExtraSubmenu", "CloseJacket");

	local currentItem = "Base.JacketLong_SantaGreen";
	TweakItem(currentItem,"ClothingItemExtra", "JacketLong_SantaGreenOPEN");
	TweakItem(currentItem,"ClothingItemExtraOption", "OpenJacket");
	TweakItem(currentItem,"clothingExtraSubmenu", "CloseJacket");


	local currentItem = "Base.Jacket_Black";
	TweakItem(currentItem,"ClothingItemExtra", "Base.Jacket_BlackOPEN");
	TweakItem(currentItem,"ClothingItemExtraOption", "OpenJacket");
	TweakItem(currentItem,"clothingExtraSubmenu", "CloseJacket");

	local currentItem = "Base.Jacket_LeatherWildRacoons";
	TweakItem(currentItem,"ClothingItemExtra", "Base.Jacket_LeatherWildRacoonsOPEN");
	TweakItem(currentItem,"ClothingItemExtraOption", "OpenJacket");
	TweakItem(currentItem,"clothingExtraSubmenu", "CloseJacket");

	local currentItem = "Base.Jacket_LeatherIronRodent";
	TweakItem(currentItem,"ClothingItemExtra", "Base.Jacket_LeatherIronRodentOPEN");
	TweakItem(currentItem,"ClothingItemExtraOption", "OpenJacket");
	TweakItem(currentItem,"clothingExtraSubmenu", "CloseJacket");

	local currentItem = "Base.Jacket_LeatherBarrelDogs";
	TweakItem(currentItem,"ClothingItemExtra", "Base.Jacket_LeatherBarrelDogsOPEN");
	TweakItem(currentItem,"ClothingItemExtraOption", "OpenJacket");
	TweakItem(currentItem,"clothingExtraSubmenu", "CloseJacket");

end)