	require("OpenJackets_ItemTweaks");

-- Copying these over because they're locals :/
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

-- Jacket
AddNewExtraItem("STR.Jacket_DOC_RavenCreek", "STR.Jacket_DOC_RavenCreekOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Police_RavenCreek", "STR.Jacket_Police_RavenCreekOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_BlackOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Fireman_RavenCreek_Khaki", "STR.Jacket_Fireman_RavenCreek_KhakiOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_EMS_RavenCreek", "STR.Jacket_EMS_RavenCreekOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Police_Muldraugh", "STR.Jacket_Police_MuldraughOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Police_Meade", "STR.Jacket_Police_MeadeOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Police_WestPoint", "STR.Jacket_Police_WestPointOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Police_Riverside", "STR.Jacket_Police_RiversideOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Police_Rosewood", "STR.Jacket_Police_RosewoodOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Police_Louisville", "STR.Jacket_Police_LouisvilleOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Police_JeffersonPD", "STR.Jacket_Police_JeffersonPDOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Police_JeffersonSD", "STR.Jacket_Police_JeffersonSDOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_PoliceKSP", "STR.Jacket_PoliceKSPOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Federal_Ranger", "STR.Jacket_Federal_RangerOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_State_LawRanger", "STR.Jacket_State_LawRangerOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_State_Ranger", "STR.Jacket_State_RangerOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_DOC_Meade", "STR.Jacket_DOC_MeadeOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_DOC_Jefferson", "STR.Jacket_DOC_JeffersonOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_EMS_Meade", "STR.Jacket_EMS_MeadeOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_EMS_Jefferson", "STR.Jacket_EMS_JeffersonOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_EMS_Louisville", "STR.Jacket_EMS_LouisvilleOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_BlackOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_KhakiOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_USPS", "STR.Jacket_USPSOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Security_Bank", "STR.Jacket_Security_BankOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Suit_Security_Hotel_Fancy", "STR.Jacket_Suit_Security_Hotel_FancyOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Security_Mall_Ohio", "STR.Jacket_Security_Mall_OhioOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Security_Mall_Valley", "STR.Jacket_Security_Mall_ValleyOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Security_Mall_LV", "STR.Jacket_Security_Mall_LVOPEN", "CloseJacket", "OpenJacket", 0.75);

AddNewExtraItem("STR.Jacket_Dress_Police_RavenCreek", "STR.Jacket_Dress_Police_RavenCreekOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Dress_Police_RavenCreek_Supervisor", "STR.Jacket_Dress_Police_RavenCreek_SupervisorOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Dress_EMS_RavenCreek", "STR.Jacket_Dress_EMS_RavenCreekOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Dress_EMS_Supervisor_RavenCreek", "STR.Jacket_Dress_EMS_Supervisor_RavenCreekOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Dress_Fire_RavenCreek", "STR.Jacket_Dress_Fire_RavenCreekOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Dress_Police_Rosewood", "STR.Jacket_Dress_Police_RosewoodOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Dress_Police_Jefferson", "STR.Jacket_Dress_Police_JeffersonOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Dress_Police_KSP", "STR.Jacket_Dress_Police_KSPOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Dress_Police_Louisville", "STR.Jacket_Dress_Police_LouisvilleOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Dress_Police_Meade", "STR.Jacket_Dress_Police_MeadeOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Dress_Police_Muldraugh", "STR.Jacket_Dress_Police_MuldraughOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Dress_Police_Riverside", "STR.Jacket_Dress_Police_RiversideOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Dress_Police_WestPoint", "STR.Jacket_Dress_Police_WestPointOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Dress_Sheriff_Jefferson", "STR.Jacket_Dress_Sheriff_JeffersonOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Dress_EMS_Jefferson", "STR.Jacket_Dress_EMS_JeffersonOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Dress_EMS_Louisville", "STR.Jacket_Dress_EMS_LouisvilleOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Dress_EMS_Meade", "STR.Jacket_Dress_EMS_MeadeOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Dress_Fire_Louisville", "STR.Jacket_Dress_Fire_LouisvilleOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Dress_Federal_Ranger", "STR.Jacket_Dress_Federal_RangerOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Dress_State_Ranger", "STR.Jacket_Dress_State_RangerOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Dress_State_Law_Ranger", "STR.Jacket_Dress_State_Law_RangerOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Jacket_Dress_Security_Hotel_Havisham", "STR.Jacket_Dress_Security_Hotel_HavishamOPEN", "CloseJacket", "OpenJacket", 0.75);


-- Boiler Suit
AddNewExtraItem("STR.Boilersuit_RavenCreekPrisoner", "STR.Boilersuit_RavenCreekPrisonerOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Boilersuit_JeffersonPrisoner", "STR.Boilersuit_JeffersonPrisonerOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Boilersuit_MeadeMaxPrisoner", "STR.Boilersuit_MeadeMaxPrisonerOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Boilersuit_MeadeLowRiskPrisoner", "STR.Boilersuit_MeadeLowRiskPrisonerOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.Boilersuit_MeadeGenPopPrisoner", "STR.Boilersuit_MeadeGenPopPrisonerOPEN", "CloseJacket", "OpenJacket", 0.75);


-- Trousers tucked
AddNewExtraItem("STR.Trousers_DOC_RavenCreek", "STR.Trousers_DOC_RavenCreekTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Police_RavenCreek", "STR.Trousers_Police_RavenCreekTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_EMS_RavenCreek", "STR.Trousers_EMS_RavenCreekTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Fire_Formal_RavenCreek", "STR.Trousers_Fire_Formal_RavenCreekTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Fireman_RavenCreek_Black", "STR.Trousers_Fireman_RavenCreek_BlackTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Fireman_RavenCreek_Khaki", "STR.Trousers_Fireman_RavenCreek_KhakiTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Police_Muldraugh", "STR.Trousers_Police_MuldraughTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Police_Meade", "STR.Trousers_Police_MeadeTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Police_WestPoint", "STR.Trousers_Police_WestPointTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Police_Riverside", "STR.Trousers_Police_RiversideTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Police_Rosewood", "STR.Trousers_Police_RosewoodTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Police_Louisville", "STR.Trousers_Police_LouisvilleTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Police_JeffersonPD", "STR.Trousers_Police_JeffersonPDTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Police_JeffersonSD", "STR.Trousers_Police_JeffersonSDTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_PoliceKSP_Summer", "STR.Trousers_PoliceKSP_SummerTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_PoliceKSP_Winter", "STR.Trousers_PoliceKSP_WinterTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Federal_Ranger", "STR.Trousers_Federal_RangerTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_State_LawRanger", "STR.Trousers_State_LawRangerTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_State_Ranger", "STR.Trousers_State_RangerTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_DOC_Meade", "STR.Trousers_DOC_MeadeTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_DOC_Jefferson", "STR.Trousers_DOC_JeffersonTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_EMS_Meade", "STR.Trousers_EMS_MeadeTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_EMS_Jefferson", "STR.Trousers_EMS_JeffersonTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_EMS_Louisville", "STR.Trousers_EMS_LouisvilleTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Fireman_Meade_Black", "STR.Trousers_Fireman_Meade_BlackTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Fireman_Meade_Khaki", "STR.Trousers_Fireman_Meade_KhakiTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Fireman_Rosewood_Black", "STR.Trousers_Fireman_Rosewood_BlackTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Fireman_Rosewood_Khaki", "STR.Trousers_Fireman_Rosewood_KhakiTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Fireman_Louisville_Black", "STR.Trousers_Fireman_Louisville_BlackTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Fireman_Louisville_Khaki", "STR.Trousers_Fireman_Louisville_KhakiTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_USPS", "STR.Trousers_USPSTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Fire_Formal_Louisville", "STR.Trousers_Fire_Formal_LouisvilleTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Fire_Formal_Meade", "STR.Trousers_Fire_Formal_MeadeTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Fire_Formal_Rosewood", "STR.Trousers_Fire_Formal_RosewoodTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Security_Bank", "STR.Trousers_Security_BankTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Security_Hotel_Havisham", "STR.Trousers_Security_Hotel_HavishamTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Security_Hotel_Fancy", "STR.Trousers_Security_Hotel_FancyTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Security_Mall_Ohio", "STR.Trousers_Security_Mall_OhioTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Security_Mall_Valley", "STR.Trousers_Security_Mall_ValleyTUCK", "TuckOut", "TuckIn", 1);
AddNewExtraItem("STR.Trousers_Security_Mall_LV", "STR.Trousers_Security_Mall_LVTUCK", "TuckOut", "TuckIn", 1);


-- shirts
AddNewExtraItem("STR.TShirt_DOC_RavenCreek", "STR.TShirt_DOC_RavenCreekOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Police_RavenCreek", "STR.TShirt_Police_RavenCreekOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_EMS_RavenCreek", "STR.TShirt_EMS_RavenCreekOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_EMS_Supervisor_RavenCreek", "STR.TShirt_EMS_RavenCreek_SupervisorOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Fire_RavenCreek", "STR.TShirt_Fire_RavenCreekOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Fire_Supervisor_RavenCreek", "STR.TShirt_Fire_Supervisor_RavenCreekOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_DOC_Jefferson", "STR.TShirt_DOC_JeffersonOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_DOC_Meade", "STR.TShirt_DOC_MeadeOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_EMS_Jefferson", "STR.TShirt_EMS_JeffersonOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_EMS_Louisville", "STR.TShirt_EMS_LouisvilleOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_EMS_Meade", "STR.TShirt_EMS_MeadeOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Federal_Ranger", "STR.TShirt_Federal_RangerOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_State_Ranger", "STR.TShirt_State_RangerOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_State_LawRanger", "STR.TShirt_State_LawRangerOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_PoliceKSP", "STR.TShirt_PoliceKSPOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Police_WestPoint", "STR.TShirt_Police_WestPointOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Police_Rosewood", "STR.TShirt_Police_RosewoodOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Police_Riverside", "STR.TShirt_Police_RiversideOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Police_Meade", "STR.TShirt_Police_MeadeOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Police_Muldraugh", "STR.TShirt_Police_MuldraughOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Police_JeffersonPD", "STR.TShirt_Police_JeffersonPDOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Police_JeffersonSD", "STR.TShirt_Police_JeffersonSDOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Police_Louisville", "STR.TShirt_Police_LouisvilleOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Fire_Louisville", "STR.TShirt_Fire_LouisvilleOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Fire_Supervisor_Louisville", "STR.TShirt_Fire_Supervisor_LouisvilleOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Fire_Supervisor_Formal_Louisville", "STR.TShirt_Fire_Supervisor_Formal_LouisvilleOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Fire_Meade", "STR.TShirt_Fire_MeadeOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Fire_Supervisor_Meade", "STR.TShirt_Fire_Supervisor_MeadeOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Fire_Rosewood", "STR.TShirt_Fire_RosewoodOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Fire_Supervisor_Rosewood", "STR.TShirt_Fire_Supervisor_RosewoodOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Security_Bank", "STR.TShirt_Security_BankOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Security_Hotel_Havisham", "STR.TShirt_Security_Hotel_HavishamOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Security_Mall_Ohio", "STR.TShirt_Security_Mall_OhioOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Security_Mall_Valley", "STR.TShirt_Security_Mall_ValleyOPEN", "CloseJacket", "OpenJacket", 0.75);
AddNewExtraItem("STR.TShirt_Security_Mall_LV", "STR.TShirt_Security_Mall_LVOPEN", "CloseJacket", "OpenJacket", 0.75);

Add4WayExtraItem("STR.Shirt_DOC_RavenCreek","STR.Shirt_DOC_RavenCreekROLL","STR.Shirt_DOC_RavenCreekOPENROLL","STR.Shirt_DOC_RavenCreekOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Police_RavenCreek","STR.Shirt_Police_RavenCreekROLL","STR.Shirt_Police_RavenCreekOPENROLL","STR.Shirt_Police_RavenCreekOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_EMS_RavenCreek","STR.Shirt_EMS_RavenCreekROLL","STR.Shirt_EMS_RavenCreekOPENROLL","STR.Shirt_EMS_RavenCreekOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_EMS_Supervisor_RavenCreek","STR.Shirt_EMS_RavenCreek_SupervisorROLL","STR.Shirt_EMS_RavenCreek_SupervisorOPENROLL","STR.Shirt_EMS_RavenCreek_SupervisorOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Fire_RavenCreek","STR.Shirt_Fire_RavenCreekROLL","STR.Shirt_Fire_RavenCreekOPENROLL","STR.Shirt_Fire_RavenCreekOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Fire_Supervisor_RavenCreek","STR.Shirt_Fire_Supervisor_RavenCreekROLL","STR.Shirt_Fire_Supervisor_RavenCreekOPENROLL","STR.Shirt_Fire_Supervisor_RavenCreekOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_USPS","STR.Shirt_USPSROLL","STR.Shirt_USPSOPENROLL","STR.Shirt_USPSOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_DOC_Jefferson","STR.Shirt_DOC_JeffersonROLL","STR.Shirt_DOC_JeffersonOPENROLL","STR.Shirt_DOC_JeffersonOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_DOC_Meade","STR.Shirt_DOC_MeadeROLL","STR.Shirt_DOC_MeadeOPENROLL","STR.Shirt_DOC_MeadeOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_EMS_Jefferson","STR.Shirt_EMS_JeffersonROLL","STR.Shirt_EMS_JeffersonOPENROLL","STR.Shirt_EMS_JeffersonOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_EMS_Louisville","STR.Shirt_EMS_LouisvilleROLL","STR.Shirt_EMS_LouisvilleOPENROLL","STR.Shirt_EMS_LouisvilleOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_EMS_Meade","STR.Shirt_EMS_MeadeROLL","STR.Shirt_EMS_MeadeOPENROLL","STR.Shirt_EMS_MeadeOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Federal_Ranger","STR.Shirt_Federal_RangerROLL","STR.Shirt_Federal_RangerOPENROLL","STR.Shirt_Federal_RangerOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_State_Ranger","STR.Shirt_State_RangerROLL","STR.Shirt_State_RangerOPENROLL","STR.Shirt_State_RangerOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_State_LawRanger","STR.Shirt_State_LawRangerROLL","STR.Shirt_State_LawRangerOPENROLL","STR.Shirt_State_LawRangerOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_PoliceKSP","STR.Shirt_PoliceKSPROLL","STR.Shirt_PoliceKSPOPENROLL","STR.Shirt_PoliceKSPOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Police_WestPoint","STR.Shirt_Police_WestPointROLL","STR.Shirt_Police_WestPointOPENROLL","STR.Shirt_Police_WestPointOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Police_Rosewood","STR.Shirt_Police_RosewoodROLL","STR.Shirt_Police_RosewoodOPENROLL","STR.Shirt_Police_RosewoodOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Police_Riverside","STR.Shirt_Police_RiversideROLL","STR.Shirt_Police_RiversideOPENROLL","STR.Shirt_Police_RiversideOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Police_Meade","STR.Shirt_Police_MeadeROLL","STR.Shirt_Police_MeadeOPENROLL","STR.Shirt_Police_MeadeOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Police_Muldraugh","STR.Shirt_Police_MuldraughROLL","STR.Shirt_Police_MuldraughOPENROLL","STR.Shirt_Police_MuldraughOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Police_JeffersonPD","STR.Shirt_Police_JeffersonPDROLL","STR.Shirt_Police_JeffersonPDOPENROLL","STR.Shirt_Police_JeffersonPDOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Police_JeffersonSD","STR.Shirt_Police_JeffersonSDROLL","STR.Shirt_Police_JeffersonSDOPENROLL","STR.Shirt_Police_JeffersonSDOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Police_Louisville","STR.Shirt_Police_LouisvilleROLL","STR.Shirt_Police_LouisvilleOPENROLL","STR.Shirt_Police_LouisvilleOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Fire_Louisville","STR.Shirt_Fire_LouisvilleROLL","STR.Shirt_Fire_LouisvilleOPENROLL","STR.Shirt_Fire_LouisvilleOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Fire_Supervisor_Louisville","STR.Shirt_Fire_Supervisor_LouisvilleROLL","STR.Shirt_Fire_Supervisor_LouisvilleOPENROLL","STR.Shirt_Fire_Supervisor_LouisvilleOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Fire_Supervisor_Formal_Louisville","STR.Shirt_Fire_Supervisor_Formal_LouisvilleROLL","STR.Shirt_Fire_Supervisor_Formal_LouisvilleOPENROLL","STR.Shirt_Fire_Supervisor_Formal_LouisvilleOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Fire_Meade","STR.Shirt_Fire_MeadeROLL","STR.Shirt_Fire_MeadeOPENROLL","STR.Shirt_Fire_MeadeOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Fire_Supervisor_Meade","STR.Shirt_Fire_Supervisor_MeadeROLL","STR.Shirt_Fire_Supervisor_MeadeOPENROLL","STR.Shirt_Fire_Supervisor_MeadeOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Fire_Rosewood","STR.Shirt_Fire_RosewoodROLL","STR.Shirt_Fire_RosewoodOPENROLL","STR.Shirt_Fire_RosewoodOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Fire_Supervisor_Rosewood","STR.Shirt_Fire_Supervisor_RosewoodROLL","STR.Shirt_Fire_Supervisor_RosewoodOPENROLL","STR.Shirt_Fire_Supervisor_RosewoodOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Security_Bank","STR.Shirt_Security_BankROLL","STR.Shirt_Security_BankOPENROLL","STR.Shirt_Security_BankOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Security_Hotel_Havisham","STR.Shirt_Security_Hotel_HavishamROLL","STR.Shirt_Security_Hotel_HavishamOPENROLL","STR.Shirt_Security_Hotel_HavishamOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Security_Hotel_Fancy","STR.Shirt_Security_Hotel_FancyROLL","STR.Shirt_Security_Hotel_FancyOPENROLL","STR.Shirt_Security_Hotel_FancyOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Security_Mall_Ohio","STR.Shirt_Security_Mall_OhioROLL","STR.Shirt_Security_Mall_OhioOPENROLL","STR.Shirt_Security_Mall_OhioOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Security_Mall_Valley","STR.Shirt_Security_Mall_ValleyROLL","STR.Shirt_Security_Mall_ValleyOPENROLL","STR.Shirt_Security_Mall_ValleyOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
Add4WayExtraItem("STR.Shirt_Security_Mall_LV","STR.Shirt_Security_Mall_LVROLL","STR.Shirt_Security_Mall_LVOPENROLL","STR.Shirt_Security_Mall_LVOPEN","CloseRollDown","CloseRollUp","OpenRollUp","OpenRollDown",0.75)
