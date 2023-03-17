if getActivatedMods():contains("ItemTweakerAPIExtraClothingAddon") then 
	require("ItemTweaker_ExtraClothingOptions");
else return end

local function ModifyParamsFromOriginalItem(originalItemName, newItemName, resistanceModifier)
	local originalItem = ScriptManager.instance:getItem(originalItemName);
	local newItem = ScriptManager.instance:getItem(newItemName);
	
	if ((not originalItem) or (not newItem)) then return end;
	
	if resistanceModifier then 
		-- modify resistance
		TweakItem(newItemName, "Insulation", originalItem:getInsulation()*resistanceModifier);
		TweakItem(newItemName, "WindResistance", originalItem:getWindresist()*resistanceModifier);
		TweakItem(newItemName, "WaterResistance", originalItem:getWaterresist()*resistanceModifier);
	end;
end

--Automates the adding of context menus
local function AddNewExtraItem(originalItem, newItem, originalContextMenu, newContextMenu, resistanceModifier)

	ItemTweaker.AddOrReplaceClothingOption(originalItem, newItem, newContextMenu);
	ItemTweaker.AddOrReplaceClothingOption(newItem, originalItem, originalContextMenu);
	
	TweakItem(originalItem, "clothingExtraSubmenu", originalContextMenu);
	TweakItem(newItem, "clothingExtraSubmenu", newContextMenu);
	
	
	ModifyParamsFromOriginalItem(originalItem, newItem, resistanceModifier);
end


function Add4WayExtraItem(item1, item2, item3, item4, context1, context2, context3, context4, resistanceModifier)
	AddNewExtraItem(item1, item2, context1, context2);
	AddNewExtraItem(item2, item3, context2, context3, resistanceModifier);
	AddNewExtraItem(item1, item4, context1, context4, resistanceModifier);
	AddNewExtraItem(item2, item4, context2, context4);
	AddNewExtraItem(item1, item3, context1, context3);
	AddNewExtraItem(item4, item3, context4, context3);
	
end


-- jackets
AddNewExtraItem("Base.Jacket_WhiteTINT", "Jacket_WhiteOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Jacket_Fireman", "Jacket_FiremanOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Jacket_Chef", "Jacket_ChefOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Jacket_ArmyCamoDesert", "Jacket_ArmyCamoDesertOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Jacket_ArmyCamoGreen", "Jacket_ArmyCamoGreenOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Jacket_Police", "Jacket_PoliceOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Jacket_Ranger", "Jacket_RangerOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Jacket_CoatArmy", "Jacket_CoatArmyOPEN", "CloseJacket", "OpenJacket", 0.75);

AddNewExtraItem("Jacket_Varsity", "Jacket_VarsityOPEN", "CloseJacket", "OpenJacket", 0.75);

AddNewExtraItem("JacketLong_Doctor", "JacketLong_DoctorOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("JacketLong_Random", "JacketLong_RandomOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("JacketLong_Santa", "JacketLong_SantaOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("JacketLong_SantaGreen", "JacketLong_SantaGreenOPEN", "CloseJacket", "OpenJacket", 0.75);

AddNewExtraItem("Jacket_Black", "Jacket_BlackOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Jacket_LeatherWildRacoons", "Jacket_LeatherWildRacoonsOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Jacket_LeatherIronRodent", "Jacket_LeatherIronRodentOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Jacket_LeatherBarrelDogs", "Jacket_LeatherBarrelDogsOPEN", "CloseJacket", "OpenJacket", 0.75);

AddNewExtraItem("WeddingJacket", "WeddingJacketOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Suit_Jacket", "Suit_JacketOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Suit_JacketTINT", "Suit_JacketTINTOPEN", "CloseJacket", "OpenJacket", 0.75);

AddNewExtraItem("Jacket_Shellsuit_Black", "Jacket_Shellsuit_BlackOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Jacket_Shellsuit_Blue", "Jacket_Shellsuit_BlueOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Jacket_Shellsuit_Green", "Jacket_Shellsuit_GreenOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Jacket_Shellsuit_Pink", "Jacket_Shellsuit_PinkOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Jacket_Shellsuit_Teal", "Jacket_Shellsuit_TealOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Jacket_Shellsuit_TINT", "Jacket_Shellsuit_TINTOPEN", "CloseJacket", "OpenJacket", 0.75);

AddNewExtraItem("Jacket_BlackVest", "Jacket_BlackVestOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Jacket_LeatherWildRacoonsVest", "Jacket_LeatherWildRacoonsVestOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Jacket_LeatherIronRodentVest", "Jacket_LeatherIronRodentVestOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Jacket_LeatherBarrelDogsVest", "Jacket_LeatherBarrelDogsVestOPEN", "CloseJacket", "OpenJacket", 0.75);

Add4WayExtraItem("HoodieUP_WhiteTINT","HoodieDOWN_WhiteTINT","HoodieDOWN_WhiteTINTOPEN","HoodieUP_WhiteTINTOPEN","CloseHoodUp","CloseHoodDown","OpenHoodDown","OpenHoodUp",0.75)


-- boiler suit
AddNewExtraItem("Boilersuit", "BoilersuitOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Boilersuit_BlueRed", "Boilersuit_BlueRedOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Boilersuit_Yellow", "Boilersuit_YellowOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Boilersuit_Flying", "Boilersuit_FlyingOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Boilersuit_Prisoner", "Boilersuit_PrisonerOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Boilersuit_PrisonerKhaki", "Boilersuit_PrisonerKhakiOPEN", "CloseJacket", "OpenJacket", 0.75);

-- trousers tucked
AddNewExtraItem("Trousers", "TrousersTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("TrousersMesh_DenimLight", "TrousersMesh_DenimLightTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("Trousers_LeatherBlack", "Trousers_LeatherBlackTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("Trousers_CamoDesert", "Trousers_CamoDesertTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("Trousers_CamoGreen", "Trousers_CamoGreenTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("Trousers_CamoUrban", "Trousers_CamoUrbanTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("Trousers_Chef", "Trousers_ChefTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("Trousers_Denim", "Trousers_DenimTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("Trousers_Fireman", "Trousers_FiremanTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("Trousers_JeanBaggy", "Trousers_JeanBaggyTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("Trousers_Padded", "Trousers_PaddedTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("Trousers_Police", "Trousers_PoliceTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("Trousers_PoliceGrey", "Trousers_PoliceGreyTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("Trousers_PrisonGuard", "Trousers_PrisonGuardTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("Trousers_Ranger", "Trousers_RangerTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("Trousers_Scrubs", "Trousers_ScrubsTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("Trousers_Suit", "Trousers_SuitTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("Trousers_SuitWhite", "Trousers_SuitWhiteTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("Trousers_WhiteTINT", "Trousers_WhiteTINTTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("Trousers_ArmyService", "Trousers_ArmyServiceTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("Trousers_Black", "Trousers_BlackTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("Trousers_NavyBlue", "Trousers_NavyBlue", "TuckOut", "TuckIn", 1);


-- shirts
AddNewExtraItem("Shirt_Bowling_Blue", "Shirt_Bowling_BlueOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Shirt_Bowling_Brown", "Shirt_Bowling_BrownOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Shirt_Bowling_Green", "Shirt_Bowling_GreenOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Shirt_Bowling_LimeGreen", "Shirt_Bowling_LimeGreenOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Shirt_Bowling_Pink", "Shirt_Bowling_PinkOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Shirt_Bowling_White", "Shirt_Bowling_WhiteOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Shirt_Baseball_KY", "Shirt_Baseball_KYOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Shirt_Baseball_Rangers", "Shirt_Baseball_RangersOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Shirt_Baseball_Z", "Shirt_Baseball_ZOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Shirt_FormalWhite_ShortSleeve", "Shirt_FormalWhite_ShortSleeveOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Shirt_FormalWhite_ShortSleeveTINT", "Shirt_FormalWhite_ShortSleeveTINTOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Shirt_HawaiianRed", "Shirt_HawaiianRedOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Shirt_HawaiianTINT", "Shirt_HawaiianTINTOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Shirt_HawaiianRed", "Shirt_HawaiianRedOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Tshirt_PoliceBlue", "Tshirt_PoliceBlueOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Tshirt_PoliceGrey", "Tshirt_PoliceGreyOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("Tshirt_Ranger", "Tshirt_RangerOPEN", "CloseJacket", "OpenJacket", 0.75);

AddNewExtraItem("Tshirt_WhiteLongSleeve", "Tshirt_WhiteLongSleeveROLL", "RollDown", "RollUp", 1);
AddNewExtraItem("Tshirt_WhiteLongSleeveTINT", "Tshirt_WhiteLongSleeveTINTROLL", "RollDown", "RollUp", 1);
AddNewExtraItem("Shirt_Scrubs", "Shirt_ScrubsROLL", "RollDown", "RollUp", 1);
AddNewExtraItem("Tshirt_WhiteLongSleeveTINT", "Tshirt_WhiteLongSleeveTINTROLL", "RollDown", "RollUp", 1);


Add4WayExtraItem("Shirt_CamoDesert","Shirt_CamoDesertROLL","Shirt_CamoDesertOPENROLL","Shirt_CamoDesertOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("Shirt_CamoGreen","Shirt_CamoGreenROLL","Shirt_CamoGreenOPENROLL","Shirt_CamoGreenOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("Shirt_CamoUrban","Shirt_CamoUrbanROLL","Shirt_CamoUrbanOPENROLL","Shirt_CamoUrbanOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("Shirt_Denim","Shirt_DenimROLL","Shirt_DenimOPENROLL","Shirt_DenimOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("Shirt_Lumberjack","Shirt_LumberjackROLL","Shirt_LumberjackOPENROLL","Shirt_LumberjackOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("Shirt_OfficerWhite","Shirt_OfficerWhiteROLL","Shirt_OfficerWhiteOPENROLL","Shirt_OfficerWhiteOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("Shirt_PoliceBlue","Shirt_PoliceBlueROLL","Shirt_PoliceBlueOPENROLL","Shirt_PoliceBlueOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("Shirt_PoliceGrey","Shirt_PoliceGreyROLL","Shirt_PoliceGreyOPENROLL","Shirt_PoliceGreyOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("Shirt_PrisonGuard","Shirt_PrisonGuardROLL","Shirt_PrisonGuardOPENROLL","Shirt_PrisonGuardOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("Shirt_Priest","Shirt_PriestROLL","Shirt_PriestOPENROLL","Shirt_PriestOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("Shirt_Ranger","Shirt_RangerROLL","Shirt_RangerOPENROLL","Shirt_RangerOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("Shirt_FormalTINT","Shirt_FormalTINTROLL","Shirt_FormalTINTOPENROLL","Shirt_FormalTINTOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("Shirt_FormalWhite","Shirt_FormalWhiteROLL","Shirt_FormalWhiteOPENROLL","Shirt_FormalWhiteOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("Shirt_Workman","Shirt_WorkmanROLL","Shirt_WorkmanOPENROLL","Shirt_WorkmanOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("Shirt_Jockey01","Shirt_Jockey01ROLL","Shirt_Jockey01OPENROLL","Shirt_Jockey01OPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("Shirt_Jockey02","Shirt_Jockey02ROLL","Shirt_Jockey02OPENROLL","Shirt_Jockey02OPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("Shirt_Jockey03","Shirt_Jockey03ROLL","Shirt_Jockey03OPENROLL","Shirt_Jockey03OPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("Shirt_Jockey04","Shirt_Jockey04ROLL","Shirt_Jockey04OPENROLL","Shirt_Jockey04OPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("Shirt_Jockey05","Shirt_Jockey05ROLL","Shirt_Jockey05OPENROLL","Shirt_Jockey05OPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("Shirt_Jockey06","Shirt_Jockey06ROLL","Shirt_Jockey06OPENROLL","Shirt_Jockey06OPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)


-- sweater tied
AddNewExtraItem("Jumper_DiamondPatternTINT", "Jumper_DiamondPatternTINTTIED", "Wear", "TieOnWaist",  0.5);
AddNewExtraItem("Jumper_PoloNeck", "Jumper_PoloNeckTIED", "Wear", "TieOnWaist",  0.5);
AddNewExtraItem("Jumper_RoundNeck", "Jumper_RoundNeckTIED", "Wear", "TieOnWaist",  0.5);
AddNewExtraItem("Jumper_VNeck", "Jumper_VNeckTIED", "Wear", "TieOnWaist", 0.5);