require "0_Utilities/SuperSurvivorSuitsUtilities"
require "0_Utilities/SuperSurvivorSuitsRegistry"

-- this file is heavily modified
-- For Coord-based spawns.

local enableDebugSuits = false

local function debugSuits(text)
	if enableDebugSuits then
		print(text)
	end
end

-- Here you'll see that I added custom "Rare" categories.
-- Do NOT do this unless you 100% need to.

	SurvivorRandomSuits["RareRW"] = {} -- Rosewood
	SurvivorRandomSuits["RareRS"] = {} -- Riverside
	SurvivorRandomSuits["RareMD"] = {} -- Muldraugh
	SurvivorRandomSuits["RareWP"] = {} -- WestPoint
	SurvivorRandomSuits["RareLV"] = {} -- Louisville
	SurvivorRandomSuits["RareJCPD"] = {} -- JeffersonCountyPD
	SurvivorRandomSuits["RareJCSD"] = {} -- JeffersonCountySD
--	SurvivorRandomSuits["Rare"] = SurvivorRandomSuits["Rare"] or {} -- MeadeCounty

	if isModEnabled("RavenCreek") then
		SurvivorRandomSuits["RareRCR"] = {} -- RavenCreek
	end

--SmallTownResponders Stuff, Very Confusing
--Rosewood
	SurvivorRandomSuits["RareRW"]["Bride1F"] = {"Base.WeddingDress", "Base.Shirt_FormalWhite", "Base.Socks_Long", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareRW"]["Groom1M"] = {"Base.Tie_BowTieFull", "Base.Gloves_WhiteTINT", "Base.WeddingJacket", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Socks_Long", "Shoes_Black"}
	SurvivorRandomSuits["RareRW"]["Priest1"] = {"Base.Shirt_Priest", "Base.Trousers_Suit", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareRW"]["ShopSpiffo1"] = {"Base.Tshirt_BusinessSpiffo", "Base.Apron_Spiffos", "Base.TrousersMesh_DenimLight", "Base.Socks_Ankle", "Base.Shoes_TrainerTINT"}
	SurvivorRandomSuits["RareRW"]["Swimwear1F"] = {"Base.Bikini_Pattern01", "Base.Shoes_FlipFlop"}
	SurvivorRandomSuits["RareRW"]["Swimwear1M"] = {"Base.SwimTrunks_Blue", "Base.Shoes_FlipFlop"}
	SurvivorRandomSuits["RareRW"]["Nurse1"] = {"Base.Hat_SurgicalMask_Blue", "Base.Tshirt_Scrubs", "Base.Trousers_Scrubs", "Base.Socks_Ankle", "Base.Shoes_Black"}
	--EMS
    SurvivorRandomSuits["RareRW"]["MeadeCountyEMS1"] = {"STR.Hat_BaseballCap_EMS_Meade", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "STR.Jacket_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRW"]["MeadeCountyEMS2"] = {"STR.Hat_BaseballCap_EMS_Meade", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRW"]["MeadeCountyEMS3"] = {"STR.Hat_BaseballCap_EMS_Meade", "STR.TShirt_EMS_Meade", "STR.Trousers_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRW"]["MeadeCountyEMS4"] = {"STR.Hat_BaseballCap_EMS_Meade_Reverse", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "STR.Jacket_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRW"]["MeadeCountyEMS5"] = {"STR.Hat_BaseballCap_EMS_Meade_Reverse", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRW"]["MeadeCountyEMS6"] = {"STR.Hat_BaseballCap_EMS_Meade_Reverse", "STR.TShirt_EMS_Meade", "STR.Trousers_EMS_Meade", "Base.Shoes_Black"}

	SurvivorRandomSuits["RareRW"]["Prepper1"] = {"Base.Hat_GasMask", "Base.HoodieUP_GreenTINT", "Base.Vest_BulletCivilian", "Base.TrousersMesh_DenimLight", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareRW"]["Bandit1"] = {"Base.Hat_BalaclavaFull", "Base.Jacket_Padded", "Base.TrousersMesh_DenimLight", "Base.Tshirt_Rock", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareRW"]["Bandit2"] = {"Base.Hat_BalaclavaFull", "Base.HoodieUP_WhiteTINT", "Base.TrousersMesh_DenimLight", "Tshirt_DefaultDECAL", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareRW"]["Bandit3"] = {"Base.Hat_BalaclavaFull", "Base.Vest_Hunting_Camo", "Base.Trousers_CamoGreen", "Base.Shoes_BlackBoots"}
	--Prisoners
    SurvivorRandomSuits["RareRW"]["MeadeCountyPrisoner1"] = {"STR.Boilersuit_MeadeGenPopPrisoner", "Base.Socks_Long", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRW"]["MeadeCountyPrisoner2"] = {"STR.Boilersuit_MeadeLowRiskPrisoner", "Base.Socks_Long", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRW"]["MeadeCountyPrisoner3"] = {"STR.Boilersuit_MeadeMaxPrisoner", "Base.Socks_Long", "Base.Shoes_Black"}
	--Rangers
    SurvivorRandomSuits["RareRW"]["FederalRanger1"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "STR.Jacket_Federal_Ranger", "Base.Shoes_Black", "STR.FederalRangerBadge"}
    SurvivorRandomSuits["RareRW"]["FederalRanger2"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "Base.Shoes_Black", "STR.FederalRangerBadge"}
    SurvivorRandomSuits["RareRW"]["FederalRanger3"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Trousers_FederalRanger", "Base.Shoes_Black", "STR.FederalRangerBadge"}

    SurvivorRandomSuits["RareRW"]["StateLawRanger1"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "STR.Jacket_State_LawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}
    SurvivorRandomSuits["RareRW"]["StateLawRanger2"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}
    SurvivorRandomSuits["RareRW"]["StateLawRanger3"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Trousers_StateLawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}

    SurvivorRandomSuits["RareRW"]["StateRanger1"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "STR.Jacket_State_Ranger", "Base.Shoes_Black", "STR.StateRangerBadge"}
    SurvivorRandomSuits["RareRW"]["StateRanger2"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "Base.Shoes_Black", "STR.StateRangerBadge"}
    SurvivorRandomSuits["RareRW"]["StateRanger3"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Trousers_StateRanger", "Base.Shoes_Black", "STR.StateRangerBadge"}
	--Rosewood Black
    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB1"] = {"STR.Hat_Fireman_Rosewood_Black", "STR.TShirt_Profession_FiremanBlue_Rosewood", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB2"] = {"STR.Hat_Fireman_Rosewood_Black", "STR.TShirt_Profession_FiremanRed_Rosewood", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB3"] = {"STR.Hat_Fireman_Rosewood_Black", "STR.TShirt_Profession_FiremanRed_Rosewood02", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB4"] = {"STR.Hat_Fireman_Rosewood_Black", "STR.TShirt_Profession_FiremanWhite_Rosewood", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_Black", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB5"] = {"STR.Hat_Fireman_Rosewood_Red", "STR.TShirt_Profession_FiremanBlue_Rosewood", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB6"] = {"STR.Hat_Fireman_Rosewood_Red", "STR.TShirt_Profession_FiremanRed_Rosewood", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB7"] = {"STR.Hat_Fireman_Rosewood_Red", "STR.TShirt_Profession_FiremanRed_Rosewood02", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB8"] = {"STR.Hat_Fireman_Rosewood_Red", "STR.TShirt_Profession_FiremanWhite_Rosewood", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_Black", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB9"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanBlue_Rosewood", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB10"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanRed_Rosewood", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB11"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanRed_Rosewood02", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB12"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanWhite_Rosewood", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_Black", "Base.Shoes_BlackBoots"}
	--Rosewood Khaki
	SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK1"] = {"STR.Hat_Fireman_Rosewood_Black", "STR.TShirt_Profession_FiremanBlue_Rosewood", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK2"] = {"STR.Hat_Fireman_Rosewood_Black", "STR.TShirt_Profession_FiremanRed_Rosewood", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK3"] = {"STR.Hat_Fireman_Rosewood_Black", "STR.TShirt_Profession_FiremanRed_Rosewood02", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK4"] = {"STR.Hat_Fireman_Rosewood_Black", "STR.TShirt_Profession_FiremanWhite_Rosewood", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_Khaki", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK5"] = {"STR.Hat_Fireman_Rosewood_Red", "STR.TShirt_Profession_FiremanBlue_Rosewood", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK6"] = {"STR.Hat_Fireman_Rosewood_Red", "STR.TShirt_Profession_FiremanRed_Rosewood", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK7"] = {"STR.Hat_Fireman_Rosewood_Red", "STR.TShirt_Profession_FiremanRed_Rosewood02", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK8"] = {"STR.Hat_Fireman_Rosewood_Red", "STR.TShirt_Profession_FiremanWhite_Rosewood", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_Khaki", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK9"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanBlue_Rosewood", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK10"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanRed_Rosewood", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK11"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanRed_Rosewood02", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK12"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanWhite_Rosewood", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_Khaki", "Base.Shoes_BlackBoots"}
	--Police
    SurvivorRandomSuits["RareRW"]["RosewoodSD1"] = {"STR.Hat_Police_Rosewood", "STR.TShirt_Police_Rosewood", "STR.Shirt_Police_Rosewood", "STR.Trousers_Police_Rosewood", "STR.Jacket_Police_Rosewood", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.RosewoodSheriffBadge"}
    SurvivorRandomSuits["RareRW"]["RosewoodSD2"] = {"STR.Hat_Police_Rosewood", "STR.TShirt_Police_Rosewood", "STR.Shirt_Police_Rosewood", "STR.Trousers_Police_Rosewood", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.RosewoodSheriffBadge"}
    SurvivorRandomSuits["RareRW"]["RosewoodSD3"] = {"STR.Hat_Police_Rosewood", "STR.TShirt_Police_Rosewood", "STR.Trousers_Police_Rosewood", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.RosewoodSheriffBadge"}

    SurvivorRandomSuits["RareRW"]["RosewoodSD1Pistol"] = {"STR.Hat_Police_Rosewood", "STR.TShirt_Police_Rosewood", "STR.Shirt_Police_Rosewood", "STR.Trousers_Police_Rosewood", "STR.Jacket_Police_Rosewood", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.RosewoodSheriffBadge"}
    SurvivorRandomSuits["RareRW"]["RosewoodSD2Pistol"] = {"STR.Hat_Police_Rosewood", "STR.TShirt_Police_Rosewood", "STR.Shirt_Police_Rosewood", "STR.Trousers_Police_Rosewood", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.RosewoodSheriffBadge"}
    SurvivorRandomSuits["RareRW"]["RosewoodSD3Pistol"] = {"STR.Hat_Police_Rosewood", "STR.TShirt_Police_Rosewood", "STR.Trousers_Police_Rosewood", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.RosewoodSheriffBadge"}

    SurvivorRandomSuits["RareRW"]["RosewoodSD1Shotgun"] = {"STR.Hat_Police_Rosewood", "STR.TShirt_Police_Rosewood", "STR.Shirt_Police_Rosewood", "STR.Trousers_Police_Rosewood", "STR.Jacket_Police_Rosewood", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.RosewoodSheriffBadge"}
    SurvivorRandomSuits["RareRW"]["RosewoodSD2Shotgun"] = {"STR.Hat_Police_Rosewood", "STR.TShirt_Police_Rosewood", "STR.Shirt_Police_Rosewood", "STR.Trousers_Police_Rosewood", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.RosewoodSheriffBadge"}
    SurvivorRandomSuits["RareRW"]["RosewoodSD3Shotgun"] = {"STR.Hat_Police_Rosewood", "STR.TShirt_Police_Rosewood", "STR.Trousers_Police_Rosewood", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.RosewoodSheriffBadge"}

    SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol1"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol2"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol3"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol4"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol5"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol6"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

    SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol1Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol2Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol3Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol4Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol5Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol6Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

    SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol1Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol2Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol3Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol4Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol5Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol6Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
	--USPS
    SurvivorRandomSuits["RareRW"]["USPS1"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRW"]["USPS2"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRW"]["USPS3"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRW"]["USPS4"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRW"]["USPS5"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRW"]["USPS6"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRW"]["USPS7"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRW"]["USPS8"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRW"]["USPS9"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRW"]["USPS10"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRW"]["USPS11"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRW"]["USPS12"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
	--Judge
    SurvivorRandomSuits["RareRW"]["Judge1"] = {"STR.Judge_Robe", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRW"]["Judge2"] = {"STR.Judge_Robe", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Shoes_Brown"}

	if isModEnabled("STRSJ") then
		--EMS
		SurvivorRandomSuits["RareRW"]["MeadeCountyEMS1Open"] = {"STR.Hat_BaseballCap_EMS_Meade", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "STR.Jacket_EMS_MeadeOPEN", "Base.Shoes_Black"}
		SurvivorRandomSuits["RareRW"]["MeadeCountyEMS4Open"] = {"STR.Hat_BaseballCap_EMS_Meade_Reverse", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "STR.Jacket_EMS_MeadeOPEN", "Base.Shoes_Black"}
		--Prisoners
		SurvivorRandomSuits["RareRW"]["MeadeCountyPrisoner1Open"] = {"STR.Boilersuit_MeadeGenPopPrisonerOPEN", "Base.Socks_Long", "Base.Shoes_Black"}
		SurvivorRandomSuits["RareRW"]["MeadeCountyPrisoner2Open"] = {"STR.Boilersuit_MeadeLowRiskPrisonerOPEN", "Base.Socks_Long", "Base.Shoes_Black"}
		SurvivorRandomSuits["RareRW"]["MeadeCountyPrisoner3Open"] = {"STR.Boilersuit_MeadeMaxPrisonerOPEN", "Base.Socks_Long", "Base.Shoes_Black"}
		--Rangers
		SurvivorRandomSuits["RareRW"]["FederalRanger1Open"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "STR.Jacket_Federal_RangerOPEN", "Base.Shoes_Black", "STR.FederalRangerBadge"}

		SurvivorRandomSuits["RareRW"]["StateLawRanger1Open"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "STR.Jacket_State_LawRangerOPEN", "Base.Shoes_Black", "STR.StateLawRangerBadge"}

		SurvivorRandomSuits["RareRW"]["StateRanger1Open"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "STR.Jacket_State_RangerOPEN", "Base.Shoes_Black", "STR.StateRangerBadge"}
		--Rosewood Black
		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB1Open"] = {"STR.Hat_Fireman_Rosewood_Black", "STR.TShirt_Profession_FiremanBlue_Rosewood", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB2Open"] = {"STR.Hat_Fireman_Rosewood_Black", "STR.TShirt_Profession_FiremanRed_Rosewood", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB3Open"] = {"STR.Hat_Fireman_Rosewood_Black", "STR.TShirt_Profession_FiremanRed_Rosewood02", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB4Open"] = {"STR.Hat_Fireman_Rosewood_Black", "STR.TShirt_Profession_FiremanWhite_Rosewood", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_BlackOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB5Open"] = {"STR.Hat_Fireman_Rosewood_Red", "STR.TShirt_Profession_FiremanBlue_Rosewood", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB6Open"] = {"STR.Hat_Fireman_Rosewood_Red", "STR.TShirt_Profession_FiremanRed_Rosewood", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB7Open"] = {"STR.Hat_Fireman_Rosewood_Red", "STR.TShirt_Profession_FiremanRed_Rosewood02", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB8Open"] = {"STR.Hat_Fireman_Rosewood_Red", "STR.TShirt_Profession_FiremanWhite_Rosewood", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_BlackOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB9Open"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanBlue_Rosewood", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB10Open"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanRed_Rosewood", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB11Open"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanRed_Rosewood02", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullB12Open"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanWhite_Rosewood", "STR.Trousers_Fireman_Rosewood_Black", "STR.Jacket_Fireman_Rosewood_BlackOPEN", "Base.Shoes_BlackBoots"}
		--Rosewood Khaki
		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK1Open"] = {"STR.Hat_Fireman_Rosewood_Black", "STR.TShirt_Profession_FiremanBlue_Rosewood", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK2Open"] = {"STR.Hat_Fireman_Rosewood_Black", "STR.TShirt_Profession_FiremanRed_Rosewood", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK3Open"] = {"STR.Hat_Fireman_Rosewood_Black", "STR.TShirt_Profession_FiremanRed_Rosewood02", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK4Open"] = {"STR.Hat_Fireman_Rosewood_Black", "STR.TShirt_Profession_FiremanWhite_Rosewood", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_KhakiOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK5Open"] = {"STR.Hat_Fireman_Rosewood_Red", "STR.TShirt_Profession_FiremanBlue_Rosewood", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK6Open"] = {"STR.Hat_Fireman_Rosewood_Red", "STR.TShirt_Profession_FiremanRed_Rosewood", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK7Open"] = {"STR.Hat_Fireman_Rosewood_Red", "STR.TShirt_Profession_FiremanRed_Rosewood02", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK8Open"] = {"STR.Hat_Fireman_Rosewood_Red", "STR.TShirt_Profession_FiremanWhite_Rosewood", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_KhakiOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK9Open"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanBlue_Rosewood", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK10Open"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanRed_Rosewood", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK11Open"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanRed_Rosewood02", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRW"]["RosewoodFiremanFullK12Open"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanWhite_Rosewood", "STR.Trousers_Fireman_Rosewood_Khaki", "STR.Jacket_Fireman_Rosewood_KhakiOPEN", "Base.Shoes_BlackBoots"}
		--Police
		SurvivorRandomSuits["RareRW"]["RosewoodSD1Open"] = {"STR.Hat_Police_Rosewood", "STR.TShirt_Police_Rosewood", "STR.Shirt_Police_Rosewood", "STR.Trousers_Police_Rosewood", "STR.Jacket_Police_RosewoodOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.RosewoodSheriffBadge"}

		SurvivorRandomSuits["RareRW"]["RosewoodSD1OpenPistol"] = {"STR.Hat_Police_Rosewood", "STR.TShirt_Police_Rosewood", "STR.Shirt_Police_Rosewood", "STR.Trousers_Police_Rosewood", "STR.Jacket_Police_RosewoodOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.RosewoodSheriffBadge"}

		SurvivorRandomSuits["RareRW"]["RosewoodSD1OpenShotgun"] = {"STR.Hat_Police_Rosewood", "STR.TShirt_Police_Rosewood", "STR.Shirt_Police_Rosewood", "STR.Trousers_Police_Rosewood", "STR.Jacket_Police_RosewoodOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.RosewoodSheriffBadge"}

		SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol1Open"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol4Open"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

		SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol1OpenPistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol4OpenPistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

		SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol1OpenShotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareRW"]["KentuckyStatePatrol4OpenShotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		--USPS
		SurvivorRandomSuits["RareRW"]["USPS1Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareRW"]["USPS4Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareRW"]["USPS7Open"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareRW"]["USPS10Open"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
	end

--Riverside
	SurvivorRandomSuits["RareRS"]["Bride1F"] = {"Base.WeddingDress", "Base.Shirt_FormalWhite", "Base.Socks_Long", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareRS"]["Groom1M"] = {"Base.Tie_BowTieFull", "Base.Gloves_WhiteTINT", "Base.WeddingJacket", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Socks_Long", "Shoes_Black"}
	SurvivorRandomSuits["RareRS"]["Priest1"] = {"Base.Shirt_Priest", "Base.Trousers_Suit", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareRS"]["ShopSpiffo1"] = {"Base.Tshirt_BusinessSpiffo", "Base.Apron_Spiffos", "Base.TrousersMesh_DenimLight", "Base.Socks_Ankle", "Base.Shoes_TrainerTINT"}
	SurvivorRandomSuits["RareRS"]["Swimwear1F"] = {"Base.Bikini_Pattern01", "Base.Shoes_FlipFlop"}
	SurvivorRandomSuits["RareRS"]["Swimwear1M"] = {"Base.SwimTrunks_Blue", "Base.Shoes_FlipFlop"}
	SurvivorRandomSuits["RareRS"]["Nurse1"] = {"Base.Hat_SurgicalMask_Blue", "Base.Tshirt_Scrubs", "Base.Trousers_Scrubs", "Base.Socks_Ankle", "Base.Shoes_Black"}
	--EMS
    SurvivorRandomSuits["RareRS"]["MeadeCountyEMS1"] = {"STR.Hat_BaseballCap_EMS_Meade", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "STR.Jacket_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyEMS2"] = {"STR.Hat_BaseballCap_EMS_Meade", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyEMS3"] = {"STR.Hat_BaseballCap_EMS_Meade", "STR.TShirt_EMS_Meade", "STR.Trousers_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyEMS4"] = {"STR.Hat_BaseballCap_EMS_Meade_Reverse", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "STR.Jacket_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyEMS5"] = {"STR.Hat_BaseballCap_EMS_Meade_Reverse", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyEMS6"] = {"STR.Hat_BaseballCap_EMS_Meade_Reverse", "STR.TShirt_EMS_Meade", "STR.Trousers_EMS_Meade", "Base.Shoes_Black"}

	SurvivorRandomSuits["RareRS"]["Prepper1"] = {"Base.Hat_GasMask", "Base.HoodieUP_GreenTINT", "Base.Vest_BulletCivilian", "Base.TrousersMesh_DenimLight", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareRS"]["Bandit1"] = {"Base.Hat_BalaclavaFull", "Base.Jacket_Padded", "Base.TrousersMesh_DenimLight", "Base.Tshirt_Rock", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareRS"]["Bandit2"] = {"Base.Hat_BalaclavaFull", "Base.HoodieUP_WhiteTINT", "Base.TrousersMesh_DenimLight", "Tshirt_DefaultDECAL", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareRS"]["Bandit3"] = {"Base.Hat_BalaclavaFull", "Base.Vest_Hunting_Camo", "Base.Trousers_CamoGreen", "Base.Shoes_BlackBoots"}
	--Prisoners
    SurvivorRandomSuits["RareRS"]["MeadeCountyPrisoner1"] = {"STR.Boilersuit_MeadeGenPopPrisoner", "Base.Socks_Long", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyPrisoner2"] = {"STR.Boilersuit_MeadeLowRiskPrisoner", "Base.Socks_Long", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyPrisoner3"] = {"STR.Boilersuit_MeadeMaxPrisoner", "Base.Socks_Long", "Base.Shoes_Black"}
	--Rangers
    SurvivorRandomSuits["RareRS"]["FederalRanger1"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "STR.Jacket_Federal_Ranger", "Base.Shoes_Black", "STR.FederalRangerBadge"}
    SurvivorRandomSuits["RareRS"]["FederalRanger2"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "Base.Shoes_Black", "STR.FederalRangerBadge"}
    SurvivorRandomSuits["RareRS"]["FederalRanger3"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Trousers_FederalRanger", "Base.Shoes_Black", "STR.FederalRangerBadge"}

    SurvivorRandomSuits["RareRS"]["StateLawRanger1"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "STR.Jacket_State_LawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}
    SurvivorRandomSuits["RareRS"]["StateLawRanger2"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}
    SurvivorRandomSuits["RareRS"]["StateLawRanger3"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Trousers_StateLawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}

    SurvivorRandomSuits["RareRS"]["StateRanger1"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "STR.Jacket_State_Ranger", "Base.Shoes_Black", "STR.StateRangerBadge"}
    SurvivorRandomSuits["RareRS"]["StateRanger2"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "Base.Shoes_Black", "STR.StateRangerBadge"}
    SurvivorRandomSuits["RareRS"]["StateRanger3"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Trousers_StateRanger", "Base.Shoes_Black", "STR.StateRangerBadge"}
	--Meade County Black
    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB1"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB2"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB3"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB4"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB5"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB6"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB7"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB8"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB9"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB10"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB11"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB12"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
	--Meade County Khaki
	SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK1"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK2"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK3"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK4"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK5"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK6"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK7"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK8"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK9"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK10"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK11"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK12"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
	--Police
    SurvivorRandomSuits["RareRS"]["RiversidePD1"] = {"STR.Hat_Police_Riverside", "STR.TShirt_Police_Riverside", "STR.Shirt_Police_Riverside", "STR.Trousers_Police_Riverside", "STR.Jacket_Police_Riverside", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.RiversidePoliceBadge"}
    SurvivorRandomSuits["RareRS"]["RiversidePD2"] = {"STR.Hat_Police_Riverside", "STR.TShirt_Police_Riverside", "STR.Shirt_Police_Riverside", "STR.Trousers_Police_Riverside", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.RiversidePoliceBadge"}
    SurvivorRandomSuits["RareRS"]["RiversidePD3"] = {"STR.Hat_Police_Riverside", "STR.TShirt_Police_Riverside", "STR.Trousers_Police_Riverside", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.RiversidePoliceBadge"}

    SurvivorRandomSuits["RareRS"]["RiversidePD1Pistol"] = {"STR.Hat_Police_Riverside", "STR.TShirt_Police_Riverside", "STR.Shirt_Police_Riverside", "STR.Trousers_Police_Riverside", "STR.Jacket_Police_Riverside", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.RiversidePoliceBadge"}
    SurvivorRandomSuits["RareRS"]["RiversidePD2Pistol"] = {"STR.Hat_Police_Riverside", "STR.TShirt_Police_Riverside", "STR.Shirt_Police_Riverside", "STR.Trousers_Police_Riverside", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.RiversidePoliceBadge"}
    SurvivorRandomSuits["RareRS"]["RiversidePD3Pistol"] = {"STR.Hat_Police_Riverside", "STR.TShirt_Police_Riverside", "STR.Trousers_Police_Riverside", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.RiversidePoliceBadge"}

    SurvivorRandomSuits["RareRS"]["RiversidePD1Shotgun"] = {"STR.Hat_Police_Riverside", "STR.TShirt_Police_Riverside", "STR.Shirt_Police_Riverside", "STR.Trousers_Police_Riverside", "STR.Jacket_Police_Riverside", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.RiversidePoliceBadge"}
    SurvivorRandomSuits["RareRS"]["RiversidePD2Shotgun"] = {"STR.Hat_Police_Riverside", "STR.TShirt_Police_Riverside", "STR.Shirt_Police_Riverside", "STR.Trousers_Police_Riverside", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.RiversidePoliceBadge"}
    SurvivorRandomSuits["RareRS"]["RiversidePD3Shotgun"] = {"STR.Hat_Police_Riverside", "STR.TShirt_Police_Riverside", "STR.Trousers_Police_Riverside", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.RiversidePoliceBadge"}

    SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol1"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol2"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol3"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol4"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol5"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol6"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

    SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol1Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol2Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol3Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol4Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol5Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol6Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

    SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol1Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol2Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol3Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol4Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol5Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol6Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
	--USPS
    SurvivorRandomSuits["RareRS"]["USPS1"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRS"]["USPS2"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRS"]["USPS3"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRS"]["USPS4"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRS"]["USPS5"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRS"]["USPS6"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRS"]["USPS7"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRS"]["USPS8"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRS"]["USPS9"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRS"]["USPS10"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRS"]["USPS11"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRS"]["USPS12"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
	--Judge
    SurvivorRandomSuits["RareRS"]["Judge1"] = {"STR.Judge_Robe", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRS"]["Judge2"] = {"STR.Judge_Robe", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Shoes_Brown"}

	if isModEnabled("STRSJ") then
		--EMS
		SurvivorRandomSuits["RareRS"]["MeadeCountyEMS1Open"] = {"STR.Hat_BaseballCap_EMS_Meade", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "STR.Jacket_EMS_MeadeOPEN", "Base.Shoes_Black"}
		SurvivorRandomSuits["RareRS"]["MeadeCountyEMS4Open"] = {"STR.Hat_BaseballCap_EMS_Meade_Reverse", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "STR.Jacket_EMS_MeadeOPEN", "Base.Shoes_Black"}
		--Prisoners
		SurvivorRandomSuits["RareRS"]["MeadeCountyPrisoner1Open"] = {"STR.Boilersuit_MeadeGenPopPrisonerOPEN", "Base.Socks_Long", "Base.Shoes_Black"}
		SurvivorRandomSuits["RareRS"]["MeadeCountyPrisoner2Open"] = {"STR.Boilersuit_MeadeLowRiskPrisonerOPEN", "Base.Socks_Long", "Base.Shoes_Black"}
		SurvivorRandomSuits["RareRS"]["MeadeCountyPrisoner3Open"] = {"STR.Boilersuit_MeadeMaxPrisonerOPEN", "Base.Socks_Long", "Base.Shoes_Black"}
		--Rangers
		SurvivorRandomSuits["RareRS"]["FederalRanger1Open"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "STR.Jacket_Federal_RangerOPEN", "Base.Shoes_Black", "STR.FederalRangerBadge"}

		SurvivorRandomSuits["RareRS"]["StateLawRanger1Open"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "STR.Jacket_State_LawRangerOPEN", "Base.Shoes_Black", "STR.StateLawRangerBadge"}

		SurvivorRandomSuits["RareRS"]["StateRanger1Open"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "STR.Jacket_State_RangerOPEN", "Base.Shoes_Black", "STR.StateRangerBadge"}
		--Meade County Black
		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB1Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB2Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB3Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB4Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB5Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB6Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB7Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB8Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB9Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB10Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB11Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullB12Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		--Meade County Khaki
		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK1Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK2Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK3Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK4Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK5Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK6Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK7Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK8Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK9Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK10Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK11Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRS"]["MeadeCountyFiremanFullK12Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		--Police
		SurvivorRandomSuits["RareRS"]["RiversidePD1Open"] = {"STR.Hat_Police_Riverside", "STR.TShirt_Police_Riverside", "STR.Shirt_Police_Riverside", "STR.Trousers_Police_Riverside", "STR.Jacket_Police_RiversideOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick"}

		SurvivorRandomSuits["RareRS"]["RiversidePD1OpenPistol"] = {"STR.Hat_Police_Riverside", "STR.TShirt_Police_Riverside", "STR.Shirt_Police_Riverside", "STR.Trousers_Police_Riverside", "STR.Jacket_Police_RiversideOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox"}

		SurvivorRandomSuits["RareRS"]["RiversidePD1OpenShotgun"] = {"STR.Hat_Police_Riverside", "STR.TShirt_Police_Riverside", "STR.Shirt_Police_Riverside", "STR.Trousers_Police_Riverside", "STR.Jacket_Police_RiversideOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox"}

		SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol1Open"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol4Open"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

		SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol1OpenPistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol4OpenPistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

		SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol1OpenShotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareRS"]["KentuckyStatePatrol4OpenShotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		--USPS
		SurvivorRandomSuits["RareRS"]["USPS1Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareRS"]["USPS4Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareRS"]["USPS7Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareRS"]["USPS12Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
	end

--Muldraugh
	SurvivorRandomSuits["RareMD"]["Bride1F"] = {"Base.WeddingDress", "Base.Shirt_FormalWhite", "Base.Socks_Long", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareMD"]["Groom1M"] = {"Base.Tie_BowTieFull", "Base.Gloves_WhiteTINT", "Base.WeddingJacket", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Socks_Long", "Shoes_Black"}
	SurvivorRandomSuits["RareMD"]["Priest1"] = {"Base.Shirt_Priest", "Base.Trousers_Suit", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareMD"]["ShopSpiffo1"] = {"Base.Tshirt_BusinessSpiffo", "Base.Apron_Spiffos", "Base.TrousersMesh_DenimLight", "Base.Socks_Ankle", "Base.Shoes_TrainerTINT"}
	SurvivorRandomSuits["RareMD"]["Swimwear1F"] = {"Base.Bikini_Pattern01", "Base.Shoes_FlipFlop"}
	SurvivorRandomSuits["RareMD"]["Swimwear1M"] = {"Base.SwimTrunks_Blue", "Base.Shoes_FlipFlop"}
	SurvivorRandomSuits["RareMD"]["Nurse1"] = {"Base.Hat_SurgicalMask_Blue", "Base.Tshirt_Scrubs", "Base.Trousers_Scrubs", "Base.Socks_Ankle", "Base.Shoes_Black"}
	--EMS
    SurvivorRandomSuits["RareMD"]["MeadeCountyEMS1"] = {"STR.Hat_BaseballCap_EMS_Meade", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "STR.Jacket_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyEMS2"] = {"STR.Hat_BaseballCap_EMS_Meade", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyEMS3"] = {"STR.Hat_BaseballCap_EMS_Meade", "STR.TShirt_EMS_Meade", "STR.Trousers_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyEMS4"] = {"STR.Hat_BaseballCap_EMS_Meade_Reverse", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "STR.Jacket_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyEMS5"] = {"STR.Hat_BaseballCap_EMS_Meade_Reverse", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyEMS6"] = {"STR.Hat_BaseballCap_EMS_Meade_Reverse", "STR.TShirt_EMS_Meade", "STR.Trousers_EMS_Meade", "Base.Shoes_Black"}

	SurvivorRandomSuits["RareMD"]["Prepper1"] = {"Base.Hat_GasMask", "Base.HoodieUP_GreenTINT", "Base.Vest_BulletCivilian", "Base.TrousersMesh_DenimLight", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareMD"]["Bandit1"] = {"Base.Hat_BalaclavaFull", "Base.Jacket_Padded", "Base.TrousersMesh_DenimLight", "Base.Tshirt_Rock", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareMD"]["Bandit2"] = {"Base.Hat_BalaclavaFull", "Base.HoodieUP_WhiteTINT", "Base.TrousersMesh_DenimLight", "Tshirt_DefaultDECAL", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareMD"]["Bandit3"] = {"Base.Hat_BalaclavaFull", "Base.Vest_Hunting_Camo", "Base.Trousers_CamoGreen", "Base.Shoes_BlackBoots"}
	--Prisoners
    SurvivorRandomSuits["RareMD"]["MeadeCountyPrisoner1"] = {"STR.Boilersuit_MeadeGenPopPrisoner", "Base.Socks_Long", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyPrisoner2"] = {"STR.Boilersuit_MeadeLowRiskPrisoner", "Base.Socks_Long", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyPrisoner3"] = {"STR.Boilersuit_MeadeMaxPrisoner", "Base.Socks_Long", "Base.Shoes_Black"}
	--Rangers
    SurvivorRandomSuits["RareMD"]["FederalRanger1"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "STR.Jacket_Federal_Ranger", "Base.Shoes_Black", "STR.FederalRangerBadge"}
    SurvivorRandomSuits["RareMD"]["FederalRanger2"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "Base.Shoes_Black", "STR.FederalRangerBadge"}
    SurvivorRandomSuits["RareMD"]["FederalRanger3"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Trousers_FederalRanger", "Base.Shoes_Black", "STR.FederalRangerBadge"}

    SurvivorRandomSuits["RareMD"]["StateLawRanger1"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "STR.Jacket_State_LawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}
    SurvivorRandomSuits["RareMD"]["StateLawRanger2"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}
    SurvivorRandomSuits["RareMD"]["StateLawRanger3"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Trousers_StateLawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}

    SurvivorRandomSuits["RareMD"]["StateRanger1"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "STR.Jacket_State_Ranger", "Base.Shoes_Black", "STR.StateRangerBadge"}
    SurvivorRandomSuits["RareMD"]["StateRanger2"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "Base.Shoes_Black", "STR.StateRangerBadge"}
    SurvivorRandomSuits["RareMD"]["StateRanger3"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Trousers_StateRanger", "Base.Shoes_Black", "STR.StateRangerBadge"}
	--Meade County Black
    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB1"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB2"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB3"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB4"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB5"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB6"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB7"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB8"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB9"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB10"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB11"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB12"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
	--Meade County Khaki
	SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK1"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK2"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK3"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK4"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK5"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK6"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK7"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK8"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK9"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK10"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK11"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK12"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
	--Police
    SurvivorRandomSuits["RareMD"]["MuldraughPD1"] = {"STR.Hat_Police_Muldraugh", "STR.TShirt_Police_Muldraugh", "STR.Shirt_Police_Muldraugh", "STR.Trousers_Police_Muldraugh", "STR.Jacket_Police_Muldraugh", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.MuldraughPoliceBadge"}
    SurvivorRandomSuits["RareMD"]["MuldraughPD2"] = {"STR.Hat_Police_Muldraugh", "STR.TShirt_Police_Muldraugh", "STR.Shirt_Police_Muldraugh", "STR.Trousers_Police_Muldraugh", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.MuldraughPoliceBadge"}
    SurvivorRandomSuits["RareMD"]["MuldraughPD3"] = {"STR.Hat_Police_Muldraugh", "STR.TShirt_Police_Muldraugh", "STR.Trousers_Police_Muldraugh", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.MuldraughPoliceBadge"}

    SurvivorRandomSuits["RareMD"]["MuldraughPD1Pistol"] = {"STR.Hat_Police_Muldraugh", "STR.TShirt_Police_Muldraugh", "STR.Shirt_Police_Muldraugh", "STR.Trousers_Police_Muldraugh", "STR.Jacket_Police_Muldraugh", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.MuldraughPoliceBadge"}
    SurvivorRandomSuits["RareMD"]["MuldraughPD2Pistol"] = {"STR.Hat_Police_Muldraugh", "STR.TShirt_Police_Muldraugh", "STR.Shirt_Police_Muldraugh", "STR.Trousers_Police_Muldraugh", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.MuldraughPoliceBadge"}
    SurvivorRandomSuits["RareMD"]["MuldraughPD3Pistol"] = {"STR.Hat_Police_Muldraugh", "STR.TShirt_Police_Muldraugh", "STR.Trousers_Police_Muldraugh", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.MuldraughPoliceBadge"}

    SurvivorRandomSuits["RareMD"]["MuldraughPD1Shotgun"] = {"STR.Hat_Police_Muldraugh", "STR.TShirt_Police_Muldraugh", "STR.Shirt_Police_Muldraugh", "STR.Trousers_Police_Muldraugh", "STR.Jacket_Police_Muldraugh", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.MuldraughPoliceBadge"}
    SurvivorRandomSuits["RareMD"]["MuldraughPD2Shotgun"] = {"STR.Hat_Police_Muldraugh", "STR.TShirt_Police_Muldraugh", "STR.Shirt_Police_Muldraugh", "STR.Trousers_Police_Muldraugh", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.MuldraughPoliceBadge"}
    SurvivorRandomSuits["RareMD"]["MuldraughPD3Shotgun"] = {"STR.Hat_Police_Muldraugh", "STR.TShirt_Police_Muldraugh", "STR.Trousers_Police_Muldraugh", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.MuldraughPoliceBadge"}

    SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol1"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol2"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol3"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol4"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol5"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol6"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

    SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol1Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol2Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol3Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol4Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol5Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol6Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

    SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol1Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol2Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol3Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol4Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol5Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol6Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
	--USPS
    SurvivorRandomSuits["RareMD"]["USPS1"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareMD"]["USPS2"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareMD"]["USPS3"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareMD"]["USPS4"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareMD"]["USPS5"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareMD"]["USPS6"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareMD"]["USPS7"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareMD"]["USPS8"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareMD"]["USPS9"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareMD"]["USPS10"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareMD"]["USPS11"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareMD"]["USPS12"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
	--Judge
    SurvivorRandomSuits["RareMD"]["Judge1"] = {"STR.Judge_Robe", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareMD"]["Judge2"] = {"STR.Judge_Robe", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Shoes_Brown"}

	if isModEnabled("STRSJ") then
		--EMS
		SurvivorRandomSuits["RareMD"]["MeadeCountyEMS1Open"] = {"STR.Hat_BaseballCap_EMS_Meade", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "STR.Jacket_EMS_MeadeOPEN", "Base.Shoes_Black"}
		SurvivorRandomSuits["RareMD"]["MeadeCountyEMS4Open"] = {"STR.Hat_BaseballCap_EMS_Meade_Reverse", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "STR.Jacket_EMS_MeadeOPEN", "Base.Shoes_Black"}
		--Prisoners
		SurvivorRandomSuits["RareMD"]["MeadeCountyPrisoner1Open"] = {"STR.Boilersuit_MeadeGenPopPrisonerOPEN", "Base.Socks_Long", "Base.Shoes_Black"}
		SurvivorRandomSuits["RareMD"]["MeadeCountyPrisoner2Open"] = {"STR.Boilersuit_MeadeLowRiskPrisonerOPEN", "Base.Socks_Long", "Base.Shoes_Black"}
		SurvivorRandomSuits["RareMD"]["MeadeCountyPrisoner3Open"] = {"STR.Boilersuit_MeadeMaxPrisonerOPEN", "Base.Socks_Long", "Base.Shoes_Black"}
		--Rangers
		SurvivorRandomSuits["RareMD"]["FederalRanger1Open"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "STR.Jacket_Federal_RangerOPEN", "Base.Shoes_Black", "STR.FederalRangerBadge"}

		SurvivorRandomSuits["RareMD"]["StateLawRanger1Open"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "STR.Jacket_State_LawRangerOPEN", "Base.Shoes_Black", "STR.StateLawRangerBadge"}

		SurvivorRandomSuits["RareMD"]["StateRanger1Open"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "STR.Jacket_State_RangerOPEN", "Base.Shoes_Black", "STR.StateRangerBadge"}
		--Meade County Black
		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB1Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB2Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB3Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB4Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB5Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB6Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB7Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB8Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB9Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB10Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB11Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullB12Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		--Meade County Khaki
		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK1Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK2Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK3Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK4Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK5Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK6Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK7Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK8Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK9Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK10Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK11Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareMD"]["MeadeCountyFiremanFullK12Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		--Police
		SurvivorRandomSuits["RareMD"]["MuldraughPD1Open"] = {"STR.Hat_Police_Muldraugh", "STR.TShirt_Police_Muldraugh", "STR.Shirt_Police_Muldraugh", "STR.Trousers_Police_Muldraugh", "STR.Jacket_Police_MuldraughOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.MuldraughPoliceBadge"}

		SurvivorRandomSuits["RareMD"]["MuldraughPD1OpenPistol"] = {"STR.Hat_Police_Muldraugh", "STR.TShirt_Police_Muldraugh", "STR.Shirt_Police_Muldraugh", "STR.Trousers_Police_Muldraugh", "STR.Jacket_Police_MuldraughOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.MuldraughPoliceBadge"}

		SurvivorRandomSuits["RareMD"]["MuldraughPD1OpenShotgun"] = {"STR.Hat_Police_Muldraugh", "STR.TShirt_Police_Muldraugh", "STR.Shirt_Police_Muldraugh", "STR.Trousers_Police_Muldraugh", "STR.Jacket_Police_MuldraughOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.MuldraughPoliceBadge"}

		SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol1Open"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol4Open"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

		SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol1OpenPistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol4OpenPistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

		SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol1OpenShotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareMD"]["KentuckyStatePatrol4OpenShotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		--USPS
		SurvivorRandomSuits["RareMD"]["USPS1Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareMD"]["USPS4Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareMD"]["USPS7Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareMD"]["USPS12Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
	end

--WestPoint
	SurvivorRandomSuits["RareWP"]["Bride1F"] = {"Base.WeddingDress", "Base.Shirt_FormalWhite", "Base.Socks_Long", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareWP"]["Groom1M"] = {"Base.Tie_BowTieFull", "Base.Gloves_WhiteTINT", "Base.WeddingJacket", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Socks_Long", "Shoes_Black"}
	SurvivorRandomSuits["RareWP"]["Priest1"] = {"Base.Shirt_Priest", "Base.Trousers_Suit", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareWP"]["ShopSpiffo1"] = {"Base.Tshirt_BusinessSpiffo", "Base.Apron_Spiffos", "Base.TrousersMesh_DenimLight", "Base.Socks_Ankle", "Base.Shoes_TrainerTINT"}
	SurvivorRandomSuits["RareWP"]["Swimwear1F"] = {"Base.Bikini_Pattern01", "Base.Shoes_FlipFlop"}
	SurvivorRandomSuits["RareWP"]["Swimwear1M"] = {"Base.SwimTrunks_Blue", "Base.Shoes_FlipFlop"}
	SurvivorRandomSuits["RareWP"]["Nurse1"] = {"Base.Hat_SurgicalMask_Blue", "Base.Tshirt_Scrubs", "Base.Trousers_Scrubs", "Base.Socks_Ankle", "Base.Shoes_Black"}
	--EMS
    SurvivorRandomSuits["RareWP"]["MeadeCountyEMS1"] = {"STR.Hat_BaseballCap_EMS_Meade", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "STR.Jacket_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyEMS2"] = {"STR.Hat_BaseballCap_EMS_Meade", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyEMS3"] = {"STR.Hat_BaseballCap_EMS_Meade", "STR.TShirt_EMS_Meade", "STR.Trousers_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyEMS4"] = {"STR.Hat_BaseballCap_EMS_Meade_Reverse", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "STR.Jacket_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyEMS5"] = {"STR.Hat_BaseballCap_EMS_Meade_Reverse", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyEMS6"] = {"STR.Hat_BaseballCap_EMS_Meade_Reverse", "STR.TShirt_EMS_Meade", "STR.Trousers_EMS_Meade", "Base.Shoes_Black"}

	SurvivorRandomSuits["RareWP"]["Prepper1"] = {"Base.Hat_GasMask", "Base.HoodieUP_GreenTINT", "Base.Vest_BulletCivilian", "Base.TrousersMesh_DenimLight", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareWP"]["Bandit1"] = {"Base.Hat_BalaclavaFull", "Base.Jacket_Padded", "Base.TrousersMesh_DenimLight", "Base.Tshirt_Rock", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareWP"]["Bandit2"] = {"Base.Hat_BalaclavaFull", "Base.HoodieUP_WhiteTINT", "Base.TrousersMesh_DenimLight", "Tshirt_DefaultDECAL", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareWP"]["Bandit3"] = {"Base.Hat_BalaclavaFull", "Base.Vest_Hunting_Camo", "Base.Trousers_CamoGreen", "Base.Shoes_BlackBoots"}
	--Prisoners
    SurvivorRandomSuits["RareWP"]["MeadeCountyPrisoner1"] = {"STR.Boilersuit_MeadeGenPopPrisoner", "Base.Socks_Long", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyPrisoner2"] = {"STR.Boilersuit_MeadeLowRiskPrisoner", "Base.Socks_Long", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyPrisoner3"] = {"STR.Boilersuit_MeadeMaxPrisoner", "Base.Socks_Long", "Base.Shoes_Black"}
	--Rangers
    SurvivorRandomSuits["RareWP"]["FederalRanger1"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "STR.Jacket_Federal_Ranger", "Base.Shoes_Black", "STR.FederalRangerBadge"}
    SurvivorRandomSuits["RareWP"]["FederalRanger2"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "Base.Shoes_Black", "STR.FederalRangerBadge"}
    SurvivorRandomSuits["RareWP"]["FederalRanger3"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Trousers_FederalRanger", "Base.Shoes_Black", "STR.FederalRangerBadge"}

    SurvivorRandomSuits["RareWP"]["StateLawRanger1"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "STR.Jacket_State_LawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}
    SurvivorRandomSuits["RareWP"]["StateLawRanger2"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}
    SurvivorRandomSuits["RareWP"]["StateLawRanger3"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Trousers_StateLawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}

    SurvivorRandomSuits["RareWP"]["StateRanger1"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "STR.Jacket_State_Ranger", "Base.Shoes_Black", "STR.StateRangerBadge"}
    SurvivorRandomSuits["RareWP"]["StateRanger2"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "Base.Shoes_Black", "STR.StateRangerBadge"}
    SurvivorRandomSuits["RareWP"]["StateRanger3"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Trousers_StateRanger", "Base.Shoes_Black", "STR.StateRangerBadge"}
	--Meade County Black
    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB1"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB2"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB3"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB4"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB5"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB6"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB7"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB8"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB9"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB10"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB11"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB12"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
	--Meade County Khaki
	SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK1"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK2"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK3"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK4"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK5"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK6"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK7"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK8"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK9"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK10"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK11"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK12"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
	--Police
    SurvivorRandomSuits["RareWP"]["WestPointPD1"] = {"STR.Hat_Police_WestPoint", "STR.TShirt_Police_WestPoint", "STR.Shirt_Police_WestPoint", "STR.Trousers_Police_WestPoint", "STR.Jacket_Police_WestPoint", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.WestPointPoliceBadge"}
    SurvivorRandomSuits["RareWP"]["WestPointPD2"] = {"STR.Hat_Police_WestPoint", "STR.TShirt_Police_WestPoint", "STR.Shirt_Police_WestPoint", "STR.Trousers_Police_WestPoint", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.WestPointPoliceBadge"}
    SurvivorRandomSuits["RareWP"]["WestPointPD3"] = {"STR.Hat_Police_WestPoint", "STR.TShirt_Police_WestPoint", "STR.Trousers_Police_WestPoint", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.WestPointPoliceBadge"}

    SurvivorRandomSuits["RareWP"]["WestPointPD1Pistol"] = {"STR.Hat_Police_WestPoint", "STR.TShirt_Police_WestPoint", "STR.Shirt_Police_WestPoint", "STR.Trousers_Police_WestPoint", "STR.Jacket_Police_WestPoint", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.WestPointPoliceBadge"}
    SurvivorRandomSuits["RareWP"]["WestPointPD2Pistol"] = {"STR.Hat_Police_WestPoint", "STR.TShirt_Police_WestPoint", "STR.Shirt_Police_WestPoint", "STR.Trousers_Police_WestPoint", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.WestPointPoliceBadge"}
    SurvivorRandomSuits["RareWP"]["WestPointPD3Pistol"] = {"STR.Hat_Police_WestPoint", "STR.TShirt_Police_WestPoint", "STR.Trousers_Police_WestPoint", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.WestPointPoliceBadge"}

    SurvivorRandomSuits["RareWP"]["WestPointPD1Shotgun"] = {"STR.Hat_Police_WestPoint", "STR.TShirt_Police_WestPoint", "STR.Shirt_Police_WestPoint", "STR.Trousers_Police_WestPoint", "STR.Jacket_Police_WestPoint", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.WestPointPoliceBadge"}
    SurvivorRandomSuits["RareWP"]["WestPointPD2Shotgun"] = {"STR.Hat_Police_WestPoint", "STR.TShirt_Police_WestPoint", "STR.Shirt_Police_WestPoint", "STR.Trousers_Police_WestPoint", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.WestPointPoliceBadge"}
    SurvivorRandomSuits["RareWP"]["WestPointPD3Shotgun"] = {"STR.Hat_Police_WestPoint", "STR.TShirt_Police_WestPoint", "STR.Trousers_Police_WestPoint", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.WestPointPoliceBadge"}

    SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol1"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol2"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol3"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol4"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol5"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol6"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

    SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol1Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol2Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol3Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol4Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol5Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol6Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

    SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol1Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol2Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol3Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol4Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol5Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol6Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
	--USPS
    SurvivorRandomSuits["RareWP"]["USPS1"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareWP"]["USPS2"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareWP"]["USPS3"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareWP"]["USPS4"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareWP"]["USPS5"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareWP"]["USPS6"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareWP"]["USPS7"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareWP"]["USPS8"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareWP"]["USPS9"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareWP"]["USPS10"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareWP"]["USPS11"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareWP"]["USPS12"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
	--Judge
    SurvivorRandomSuits["RareWP"]["Judge1"] = {"STR.Judge_Robe", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareWP"]["Judge2"] = {"STR.Judge_Robe", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Shoes_Brown"}

	if isModEnabled("STRSJ") then
		--EMS
		SurvivorRandomSuits["RareWP"]["MeadeCountyEMS1Open"] = {"STR.Hat_BaseballCap_EMS_Meade", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "STR.Jacket_EMS_MeadeOPEN", "Base.Shoes_Black"}
		SurvivorRandomSuits["RareWP"]["MeadeCountyEMS4Open"] = {"STR.Hat_BaseballCap_EMS_Meade_Reverse", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "STR.Jacket_EMS_MeadeOPEN", "Base.Shoes_Black"}
		--Prisoners
		SurvivorRandomSuits["RareWP"]["MeadeCountyPrisoner1Open"] = {"STR.Boilersuit_MeadeGenPopPrisonerOPEN", "Base.Socks_Long", "Base.Shoes_Black"}
		SurvivorRandomSuits["RareWP"]["MeadeCountyPrisoner2Open"] = {"STR.Boilersuit_MeadeLowRiskPrisonerOPEN", "Base.Socks_Long", "Base.Shoes_Black"}
		SurvivorRandomSuits["RareWP"]["MeadeCountyPrisoner3Open"] = {"STR.Boilersuit_MeadeMaxPrisonerOPEN", "Base.Socks_Long", "Base.Shoes_Black"}
		--Rangers
		SurvivorRandomSuits["RareWP"]["FederalRanger1Open"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "STR.Jacket_Federal_RangerOPEN", "Base.Shoes_Black", "STR.FederalRangerBadge"}

		SurvivorRandomSuits["RareWP"]["StateLawRanger1Open"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "STR.Jacket_State_LawRangerOPEN", "Base.Shoes_Black", "STR.StateLawRangerBadge"}

		SurvivorRandomSuits["RareWP"]["StateRanger1Open"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "STR.Jacket_State_RangerOPEN", "Base.Shoes_Black", "STR.StateRangerBadge"}
		--Meade County Black
		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB1Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB2Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB3Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB4Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB5Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB6Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB7Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB8Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB9Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB10Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB11Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullB12Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		--Meade County Khaki
		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK1Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK2Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK3Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK4Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK5Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK6Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK7Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK8Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK9Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK10Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK11Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareWP"]["MeadeCountyFiremanFullK12Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		--Police
		SurvivorRandomSuits["RareWP"]["WestPointPD1Open"] = {"STR.Hat_Police_WestPoint", "STR.TShirt_Police_WestPoint", "STR.Shirt_Police_WestPoint", "STR.Trousers_Police_WestPoint", "STR.Jacket_Police_WestPointOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.WestPointPoliceBadge"}

		SurvivorRandomSuits["RareWP"]["WestPointPD1OpenPistol"] = {"STR.Hat_Police_WestPoint", "STR.TShirt_Police_WestPoint", "STR.Shirt_Police_WestPoint", "STR.Trousers_Police_WestPoint", "STR.Jacket_Police_WestPointOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.WestPointPoliceBadge"}

		SurvivorRandomSuits["RareWP"]["WestPointPD1OpenShotgun"] = {"STR.Hat_Police_WestPoint", "STR.TShirt_Police_WestPoint", "STR.Shirt_Police_WestPoint", "STR.Trousers_Police_WestPoint", "STR.Jacket_Police_WestPointOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.WestPointPoliceBadge"}

		SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol1Open"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol4Open"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

		SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol1OpenPistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol4OpenPistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

		SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol1OpenShotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareWP"]["KentuckyStatePatrol4OpenShotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		--USPS
		SurvivorRandomSuits["RareWP"]["USPS1Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareWP"]["USPS4Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareWP"]["USPS7Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareWP"]["USPS12Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
	end

--Louisville
	SurvivorRandomSuits["RareLV"]["Bride1F"] = {"Base.WeddingDress", "Base.Shirt_FormalWhite", "Base.Socks_Long", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareLV"]["Groom1M"] = {"Base.Tie_BowTieFull", "Base.Gloves_WhiteTINT", "Base.WeddingJacket", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Socks_Long", "Shoes_Black"}
	SurvivorRandomSuits["RareLV"]["Priest1"] = {"Base.Shirt_Priest", "Base.Trousers_Suit", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareLV"]["ShopSpiffo1"] = {"Base.Tshirt_BusinessSpiffo", "Base.Apron_Spiffos", "Base.TrousersMesh_DenimLight", "Base.Socks_Ankle", "Base.Shoes_TrainerTINT"}
	SurvivorRandomSuits["RareLV"]["Swimwear1F"] = {"Base.Bikini_Pattern01", "Base.Shoes_FlipFlop"}
	SurvivorRandomSuits["RareLV"]["Swimwear1M"] = {"Base.SwimTrunks_Blue", "Base.Shoes_FlipFlop"}
	SurvivorRandomSuits["RareLV"]["Nurse1"] = {"Base.Hat_SurgicalMask_Blue", "Base.Tshirt_Scrubs", "Base.Trousers_Scrubs", "Base.Socks_Ankle", "Base.Shoes_Black"}
	--EMS
    SurvivorRandomSuits["RareLV"]["LouisvilleEMS1"] = {"STR.Hat_BaseballCap_EMS_Louisville", "STR.TShirt_EMS_Louisville", "STR.Shirt_EMS_Louisville", "STR.Trousers_EMS_Louisville", "STR.Jacket_EMS_Louisville", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareLV"]["LouisvilleEMS2"] = {"STR.Hat_BaseballCap_EMS_Louisville", "STR.TShirt_EMS_Louisville", "STR.Shirt_EMS_Louisville", "STR.Trousers_EMS_Louisville", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareLV"]["LouisvilleEMS3"] = {"STR.Hat_BaseballCap_EMS_Louisville", "STR.TShirt_EMS_Louisville", "STR.Trousers_EMS_Louisville", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareLV"]["LouisvilleEMS4"] = {"STR.Hat_BaseballCap_EMS_Louisville_Reverse", "STR.TShirt_EMS_Louisville", "STR.Shirt_EMS_Louisville", "STR.Trousers_EMS_Louisville", "STR.Jacket_EMS_Louisville", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareLV"]["LouisvilleEMS5"] = {"STR.Hat_BaseballCap_EMS_Louisville_Reverse", "STR.TShirt_EMS_Louisville", "STR.Shirt_EMS_Louisville", "STR.Trousers_EMS_Louisville", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareLV"]["LouisvilleEMS6"] = {"STR.Hat_BaseballCap_EMS_Louisville_Reverse", "STR.TShirt_EMS_Louisville", "STR.Trousers_EMS_Louisville", "Base.Shoes_Black"}

	SurvivorRandomSuits["RareLV"]["Prepper1"] = {"Base.Hat_GasMask", "Base.HoodieUP_GreenTINT", "Base.Vest_BulletCivilian", "Base.TrousersMesh_DenimLight", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareLV"]["Bandit1"] = {"Base.Hat_BalaclavaFull", "Base.Jacket_Padded", "Base.TrousersMesh_DenimLight", "Base.Tshirt_Rock", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareLV"]["Bandit2"] = {"Base.Hat_BalaclavaFull", "Base.HoodieUP_WhiteTINT", "Base.TrousersMesh_DenimLight", "Tshirt_DefaultDECAL", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareLV"]["Bandit3"] = {"Base.Hat_BalaclavaFull", "Base.Vest_Hunting_Camo", "Base.Trousers_CamoGreen", "Base.Shoes_BlackBoots"}
	--Prisoners
    SurvivorRandomSuits["RareLV"]["JeffersonCountyPrisoner1"] = {"STR.Boilersuit_JeffersonPrisoner", "Base.Socks_Long", "Base.Shoes_Black"}
	--Rangers
    SurvivorRandomSuits["RareLV"]["FederalRanger1"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "STR.Jacket_Federal_Ranger", "Base.Shoes_Black", "STR.FederalRangerBadge"}
    SurvivorRandomSuits["RareLV"]["FederalRanger2"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "Base.Shoes_Black", "STR.FederalRangerBadge"}
    SurvivorRandomSuits["RareLV"]["FederalRanger3"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Trousers_FederalRanger", "Base.Shoes_Black", "STR.FederalRangerBadge"}

    SurvivorRandomSuits["RareLV"]["StateLawRanger1"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "STR.Jacket_State_LawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}
    SurvivorRandomSuits["RareLV"]["StateLawRanger2"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}
    SurvivorRandomSuits["RareLV"]["StateLawRanger3"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Trousers_StateLawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}

    SurvivorRandomSuits["RareLV"]["StateRanger1"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "STR.Jacket_State_Ranger", "Base.Shoes_Black", "STR.StateRangerBadge"}
    SurvivorRandomSuits["RareLV"]["StateRanger2"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "Base.Shoes_Black", "STR.StateRangerBadge"}
    SurvivorRandomSuits["RareLV"]["StateRanger3"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Trousers_StateRanger", "Base.Shoes_Black", "STR.StateRangerBadge"}
	--Louisville Black
    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB1"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB2"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB3"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB4"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB5"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB6"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB7"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB8"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB9"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB10"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB11"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB12"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
	--Louisville Khaki
	SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK1"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK2"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK3"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK4"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK5"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK6"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK7"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK8"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK9"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK10"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK11"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK12"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
	--Police
    SurvivorRandomSuits["RareLV"]["LouisvillePD1"] = {"STR.Hat_Police_Louisville", "STR.TShirt_Police_Louisville", "STR.Shirt_Police_Louisville", "STR.Trousers_Police_Louisville", "STR.Jacket_Police_Louisville", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.LouisvillePoliceBadge"}
    SurvivorRandomSuits["RareLV"]["LouisvillePD2"] = {"STR.Hat_Police_Louisville", "STR.TShirt_Police_Louisville", "STR.Shirt_Police_Louisville", "STR.Trousers_Police_Louisville", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.LouisvillePoliceBadge"}
    SurvivorRandomSuits["RareLV"]["LouisvillePD3"] = {"STR.Hat_Police_Louisville", "STR.TShirt_Police_Louisville", "STR.Trousers_Police_Louisville", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.LouisvillePoliceBadge"}

    SurvivorRandomSuits["RareLV"]["LouisvillePD1Pistol"] = {"STR.Hat_Police_Louisville", "STR.TShirt_Police_Louisville", "STR.Shirt_Police_Louisville", "STR.Trousers_Police_Louisville", "STR.Jacket_Police_Louisville", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.LouisvillePoliceBadge"}
    SurvivorRandomSuits["RareLV"]["LouisvillePD2Pistol"] = {"STR.Hat_Police_Louisville", "STR.TShirt_Police_Louisville", "STR.Shirt_Police_Louisville", "STR.Trousers_Police_Louisville", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.LouisvillePoliceBadge"}
    SurvivorRandomSuits["RareLV"]["LouisvillePD3Pistol"] = {"STR.Hat_Police_Louisville", "STR.TShirt_Police_Louisville", "STR.Trousers_Police_Louisville", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.LouisvillePoliceBadge"}

    SurvivorRandomSuits["RareLV"]["LouisvillePD1Shotgun"] = {"STR.Hat_Police_Louisville", "STR.TShirt_Police_Louisville", "STR.Shirt_Police_Louisville", "STR.Trousers_Police_Louisville", "STR.Jacket_Police_Louisville", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.LouisvillePoliceBadge"}
    SurvivorRandomSuits["RareLV"]["LouisvillePD2Shotgun"] = {"STR.Hat_Police_Louisville", "STR.TShirt_Police_Louisville", "STR.Shirt_Police_Louisville", "STR.Trousers_Police_Louisville", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.LouisvillePoliceBadge"}
    SurvivorRandomSuits["RareLV"]["LouisvillePD3Shotgun"] = {"STR.Hat_Police_Louisville", "STR.TShirt_Police_Louisville", "STR.Trousers_Police_Louisville", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.LouisvillePoliceBadge"}

    SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol1"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol2"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol3"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol4"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol5"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol6"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

    SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol1Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol2Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol3Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol4Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol5Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol6Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

    SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol1Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol2Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol3Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol4Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol5Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol6Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
	--USPS
    SurvivorRandomSuits["RareLV"]["USPS1"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareLV"]["USPS2"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareLV"]["USPS3"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareLV"]["USPS4"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareLV"]["USPS5"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareLV"]["USPS6"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareLV"]["USPS7"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareLV"]["USPS8"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareLV"]["USPS9"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareLV"]["USPS10"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareLV"]["USPS11"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareLV"]["USPS12"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
	--Judge
    SurvivorRandomSuits["RareLV"]["Judge1"] = {"STR.Judge_Robe", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareLV"]["Judge2"] = {"STR.Judge_Robe", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Shoes_Brown"}

	if isModEnabled("STRSJ") then
		--EMS
		SurvivorRandomSuits["RareLV"]["LouisvilleEMS1Open"] = {"STR.Hat_BaseballCap_EMS_Louisville", "STR.TShirt_EMS_Louisville", "STR.Shirt_EMS_Louisville", "STR.Trousers_EMS_Louisville", "STR.Jacket_EMS_LouisvilleOPEN", "Base.Shoes_Black"}
		SurvivorRandomSuits["RareLV"]["LouisvilleEMS4Open"] = {"STR.Hat_BaseballCap_EMS_Louisville_Reverse", "STR.TShirt_EMS_Louisville", "STR.Shirt_EMS_Louisville", "STR.Trousers_EMS_Louisville", "STR.Jacket_EMS_LouisvilleOPEN", "Base.Shoes_Black"}
		--Prisoners
		SurvivorRandomSuits["RareLV"]["JeffersonCountyPrisoner1Open"] = {"STR.Boilersuit_JeffersonPrisonerOPEN", "Base.Socks_Long", "Base.Shoes_Black"}
		--Rangers
		SurvivorRandomSuits["RareLV"]["FederalRanger1Open"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "STR.Jacket_Federal_RangerOPEN", "Base.Shoes_Black", "STR.FederalRangerBadge"}

		SurvivorRandomSuits["RareLV"]["StateLawRanger1Open"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "STR.Jacket_State_LawRangerOPEN", "Base.Shoes_Black", "STR.StateLawRangerBadge"}

		SurvivorRandomSuits["RareLV"]["StateRanger1Open"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "STR.Jacket_State_RangerOPEN", "Base.Shoes_Black", "STR.StateRangerBadge"}
		--Louisville Black
		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB1Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB2Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB3Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB4Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB5Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB6Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB7Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB8Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB9Open"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB10Open"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB11Open"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullB12Open"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		--Louisville Khaki
		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK1Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK2Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK3Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK4Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK5Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK6Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK7Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK8Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK9Open"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK10Open"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK11Open"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareLV"]["LouisvilleFiremanFullK12Open"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		--Police
		SurvivorRandomSuits["RareLV"]["LouisvillePD1Open"] = {"STR.Hat_Police_Louisville", "STR.TShirt_Police_Louisville", "STR.Shirt_Police_Louisville", "STR.Trousers_Police_Louisville", "STR.Jacket_Police_LouisvilleOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.LouisvillePoliceBadge"}

		SurvivorRandomSuits["RareLV"]["LouisvillePD1OpenPistol"] = {"STR.Hat_Police_Louisville", "STR.TShirt_Police_Louisville", "STR.Shirt_Police_Louisville", "STR.Trousers_Police_Louisville", "STR.Jacket_Police_LouisvilleOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.LouisvillePoliceBadge"}

		SurvivorRandomSuits["RareLV"]["LouisvillePD1OpenShotgun"] = {"STR.Hat_Police_Louisville", "STR.TShirt_Police_Louisville", "STR.Shirt_Police_Louisville", "STR.Trousers_Police_Louisville", "STR.Jacket_Police_LouisvilleOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.LouisvillePoliceBadge"}

		SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol1Open"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol4Open"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

		SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol1OpenPistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol4OpenPistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

		SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol1OpenShotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareLV"]["KentuckyStatePatrol4OpenShotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		--USPS
		SurvivorRandomSuits["RareLV"]["USPS1Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareLV"]["USPS4Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareLV"]["USPS7Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareLV"]["USPS12Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
	end

--JeffersonCountyPD
	SurvivorRandomSuits["RareJCPD"]["Bride1F"] = {"Base.WeddingDress", "Base.Shirt_FormalWhite", "Base.Socks_Long", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareJCPD"]["Groom1M"] = {"Base.Tie_BowTieFull", "Base.Gloves_WhiteTINT", "Base.WeddingJacket", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Socks_Long", "Shoes_Black"}
	SurvivorRandomSuits["RareJCPD"]["Priest1"] = {"Base.Shirt_Priest", "Base.Trousers_Suit", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareJCPD"]["ShopSpiffo1"] = {"Base.Tshirt_BusinessSpiffo", "Base.Apron_Spiffos", "Base.TrousersMesh_DenimLight", "Base.Socks_Ankle", "Base.Shoes_TrainerTINT"}
	SurvivorRandomSuits["RareJCPD"]["Swimwear1F"] = {"Base.Bikini_Pattern01", "Base.Shoes_FlipFlop"}
	SurvivorRandomSuits["RareJCPD"]["Swimwear1M"] = {"Base.SwimTrunks_Blue", "Base.Shoes_FlipFlop"}
	SurvivorRandomSuits["RareJCPD"]["Nurse1"] = {"Base.Hat_SurgicalMask_Blue", "Base.Tshirt_Scrubs", "Base.Trousers_Scrubs", "Base.Socks_Ankle", "Base.Shoes_Black"}
	--EMS
    SurvivorRandomSuits["RareJCPD"]["JeffersonCountyEMS1"] = {"STR.Hat_BaseballCap_EMS_Jefferson", "STR.TShirt_EMS_Jefferson", "STR.Shirt_EMS_Jefferson", "STR.Trousers_EMS_Jefferson", "STR.Jacket_EMS_Jefferson", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareJCPD"]["JeffersonCountyEMS2"] = {"STR.Hat_BaseballCap_EMS_Jefferson", "STR.TShirt_EMS_Jefferson", "STR.Shirt_EMS_Jefferson", "STR.Trousers_EMS_Jefferson", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareJCPD"]["JeffersonCountyEMS3"] = {"STR.Hat_BaseballCap_EMS_Jefferson", "STR.TShirt_EMS_Jefferson", "STR.Trousers_EMS_Jefferson", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareJCPD"]["JeffersonCountyEMS4"] = {"STR.Hat_BaseballCap_EMS_Jefferson_Reverse", "STR.TShirt_EMS_Jefferson", "STR.Shirt_EMS_Jefferson", "STR.Trousers_EMS_Jefferson", "STR.Jacket_EMS_Jefferson", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareJCPD"]["JeffersonCountyEMS5"] = {"STR.Hat_BaseballCap_EMS_Jefferson_Reverse", "STR.TShirt_EMS_Jefferson", "STR.Shirt_EMS_Jefferson", "STR.Trousers_EMS_Jefferson", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareJCPD"]["JeffersonCountyEMS6"] = {"STR.Hat_BaseballCap_EMS_Jefferson_Reverse", "STR.TShirt_EMS_Jefferson", "STR.Trousers_EMS_Jefferson", "Base.Shoes_Black"}

	SurvivorRandomSuits["RareJCPD"]["Prepper1"] = {"Base.Hat_GasMask", "Base.HoodieUP_GreenTINT", "Base.Vest_BulletCivilian", "Base.TrousersMesh_DenimLight", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareJCPD"]["Bandit1"] = {"Base.Hat_BalaclavaFull", "Base.Jacket_Padded", "Base.TrousersMesh_DenimLight", "Base.Tshirt_Rock", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareJCPD"]["Bandit2"] = {"Base.Hat_BalaclavaFull", "Base.HoodieUP_WhiteTINT", "Base.TrousersMesh_DenimLight", "Tshirt_DefaultDECAL", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareJCPD"]["Bandit3"] = {"Base.Hat_BalaclavaFull", "Base.Vest_Hunting_Camo", "Base.Trousers_CamoGreen", "Base.Shoes_BlackBoots"}
	--Prisoners
    SurvivorRandomSuits["RareJCPD"]["JeffersonCountyPrisoner1"] = {"STR.Boilersuit_JeffersonPrisoner", "Base.Socks_Long", "Base.Shoes_Black"}
	--Rangers
    SurvivorRandomSuits["RareJCPD"]["FederalRanger1"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "STR.Jacket_Federal_Ranger", "Base.Shoes_Black", "STR.FederalRangerBadge"}
    SurvivorRandomSuits["RareJCPD"]["FederalRanger2"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "Base.Shoes_Black", "STR.FederalRangerBadge"}
    SurvivorRandomSuits["RareJCPD"]["FederalRanger3"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Trousers_FederalRanger", "Base.Shoes_Black", "STR.FederalRangerBadge"}

    SurvivorRandomSuits["RareJCPD"]["StateLawRanger1"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "STR.Jacket_State_LawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}
    SurvivorRandomSuits["RareJCPD"]["StateLawRanger2"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}
    SurvivorRandomSuits["RareJCPD"]["StateLawRanger3"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Trousers_StateLawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}

    SurvivorRandomSuits["RareJCPD"]["StateRanger1"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "STR.Jacket_State_Ranger", "Base.Shoes_Black", "STR.StateRangerBadge"}
    SurvivorRandomSuits["RareJCPD"]["StateRanger2"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "Base.Shoes_Black", "STR.StateRangerBadge"}
    SurvivorRandomSuits["RareJCPD"]["StateRanger3"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Trousers_StateRanger", "Base.Shoes_Black", "STR.StateRangerBadge"}
	--Louisville Black
    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB1"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB2"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB3"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB4"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB5"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB6"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB7"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB8"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB9"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB10"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB11"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB12"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
	--Louisville Khaki
	SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK1"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK2"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK3"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK4"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK5"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK6"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK7"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK8"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK9"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK10"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK11"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK12"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
	--Police
    SurvivorRandomSuits["RareJCPD"]["JeffersonPD1"] = {"STR.Hat_Police_JeffersonPD", "STR.TShirt_Police_JeffersonPD", "STR.Shirt_Police_JeffersonPD", "STR.Trousers_Police_JeffersonPD", "STR.Jacket_Police_JeffersonPD", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.JeffersonPoliceBadge"}
    SurvivorRandomSuits["RareJCPD"]["JeffersonPD2"] = {"STR.Hat_Police_JeffersonPD", "STR.TShirt_Police_JeffersonPD", "STR.Shirt_Police_JeffersonPD", "STR.Trousers_Police_JeffersonPD", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.JeffersonPoliceBadge"}
    SurvivorRandomSuits["RareJCPD"]["JeffersonPD3"] = {"STR.Hat_Police_JeffersonPD", "STR.TShirt_Police_JeffersonPD", "STR.Trousers_Police_JeffersonPD", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.JeffersonPoliceBadge"}

    SurvivorRandomSuits["RareJCPD"]["JeffersonPD1Pistol"] = {"STR.Hat_Police_JeffersonPD", "STR.TShirt_Police_JeffersonPD", "STR.Shirt_Police_JeffersonPD", "STR.Trousers_Police_JeffersonPD", "STR.Jacket_Police_JeffersonPD", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.JeffersonPoliceBadge"}
    SurvivorRandomSuits["RareJCPD"]["JeffersonPD2Pistol"] = {"STR.Hat_Police_JeffersonPD", "STR.TShirt_Police_JeffersonPD", "STR.Shirt_Police_JeffersonPD", "STR.Trousers_Police_JeffersonPD", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.JeffersonPoliceBadge"}
    SurvivorRandomSuits["RareJCPD"]["JeffersonPD3Pistol"] = {"STR.Hat_Police_JeffersonPD", "STR.TShirt_Police_JeffersonPD", "STR.Trousers_Police_JeffersonPD", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.JeffersonPoliceBadge"}

    SurvivorRandomSuits["RareJCPD"]["JeffersonPD1Shotgun"] = {"STR.Hat_Police_JeffersonPD", "STR.TShirt_Police_JeffersonPD", "STR.Shirt_Police_JeffersonPD", "STR.Trousers_Police_JeffersonPD", "STR.Jacket_Police_JeffersonPD", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.JeffersonPoliceBadge"}
    SurvivorRandomSuits["RareJCPD"]["JeffersonPD2Shotgun"] = {"STR.Hat_Police_JeffersonPD", "STR.TShirt_Police_JeffersonPD", "STR.Shirt_Police_JeffersonPD", "STR.Trousers_Police_JeffersonPD", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.JeffersonPoliceBadge"}
    SurvivorRandomSuits["RareJCPD"]["JeffersonPD3Shotgun"] = {"STR.Hat_Police_JeffersonPD", "STR.TShirt_Police_JeffersonPD", "STR.Trousers_Police_JeffersonPD", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.JeffersonPoliceBadge"}

    SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol1"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol2"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol3"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol4"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol5"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol6"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

    SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol1Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol2Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol3Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol4Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol5Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol6Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

    SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol1Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol2Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol3Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol4Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol5Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol6Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
	--USPS
    SurvivorRandomSuits["RareJCPD"]["USPS1"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCPD"]["USPS2"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCPD"]["USPS3"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCPD"]["USPS4"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCPD"]["USPS5"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCPD"]["USPS6"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCPD"]["USPS7"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCPD"]["USPS8"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCPD"]["USPS9"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCPD"]["USPS10"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCPD"]["USPS11"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCPD"]["USPS12"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
	--Judge
    SurvivorRandomSuits["RareJCPD"]["Judge1"] = {"STR.Judge_Robe", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareJCPD"]["Judge2"] = {"STR.Judge_Robe", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Shoes_Brown"}

	if isModEnabled("STRSJ") then
		--EMS
		SurvivorRandomSuits["RareJCPD"]["JeffersonCountyEMS1Open"] = {"STR.Hat_BaseballCap_EMS_Jefferson", "STR.TShirt_EMS_Jefferson", "STR.Shirt_EMS_Jefferson", "STR.Trousers_EMS_Jefferson", "STR.Jacket_EMS_JeffersonOPEN", "Base.Shoes_Black"}
		SurvivorRandomSuits["RareJCPD"]["JeffersonCountyEMS4Open"] = {"STR.Hat_BaseballCap_EMS_Jefferson_Reverse", "STR.TShirt_EMS_Jefferson", "STR.Shirt_EMS_Jefferson", "STR.Trousers_EMS_Jefferson", "STR.Jacket_EMS_JeffersonOPEN", "Base.Shoes_Black"}
		--Prisoners
		SurvivorRandomSuits["RareJCPD"]["JeffersonCountyPrisoner1Open"] = {"STR.Boilersuit_JeffersonPrisonerOPEN", "Base.Socks_Long", "Base.Shoes_Black"}
		--Rangers
		SurvivorRandomSuits["RareJCPD"]["FederalRanger1Open"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "STR.Jacket_Federal_RangerOPEN", "Base.Shoes_Black", "STR.FederalRangerBadge"}

		SurvivorRandomSuits["RareJCPD"]["StateLawRanger1Open"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "STR.Jacket_State_LawRangerOPEN", "Base.Shoes_Black", "STR.StateLawRangerBadge"}

		SurvivorRandomSuits["RareJCPD"]["StateRanger1Open"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "STR.Jacket_State_RangerOPEN", "Base.Shoes_Black", "STR.StateRangerBadge"}
		--Louisville Black
		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB1Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB2Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB3Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB4Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB5Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB6Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB7Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB8Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB9Open"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB10Open"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB11Open"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullB12Open"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		--Louisville Khaki
		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK1Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK2Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK3Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK4Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK5Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK6Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK7Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK8Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK9Open"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK10Open"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK11Open"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCPD"]["LouisvilleFiremanFullK12Open"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		--Police
		SurvivorRandomSuits["RareJCPD"]["JeffersonPD1Open"] = {"STR.Hat_Police_JeffersonPD", "STR.TShirt_Police_JeffersonPD", "STR.Shirt_Police_JeffersonPD", "STR.Trousers_Police_JeffersonPD", "STR.Jacket_Police_JeffersonPDOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.JeffersonPoliceBadge"}

		SurvivorRandomSuits["RareJCPD"]["JeffersonPD1OpenPistol"] = {"STR.Hat_Police_JeffersonPD", "STR.TShirt_Police_JeffersonPD", "STR.Shirt_Police_JeffersonPD", "STR.Trousers_Police_JeffersonPD", "STR.Jacket_Police_JeffersonPDOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.JeffersonPoliceBadge"}

		SurvivorRandomSuits["RareJCPD"]["JeffersonPD1OpenShotgun"] = {"STR.Hat_Police_JeffersonPD", "STR.TShirt_Police_JeffersonPD", "STR.Shirt_Police_JeffersonPD", "STR.Trousers_Police_JeffersonPD", "STR.Jacket_Police_JeffersonPDOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.JeffersonPoliceBadge"}

		SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol1Open"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol4Open"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

		SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol1OpenPistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol4OpenPistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

		SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol1OpenShotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareJCPD"]["KentuckyStatePatrol4OpenShotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		--USPS
		SurvivorRandomSuits["RareJCPD"]["USPS1Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareJCPD"]["USPS4Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareJCPD"]["USPS7Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareJCPD"]["USPS12Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
	end

--JeffersonCountySD
	SurvivorRandomSuits["RareJCSD"]["Bride1F"] = {"Base.WeddingDress", "Base.Shirt_FormalWhite", "Base.Socks_Long", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareJCSD"]["Groom1M"] = {"Base.Tie_BowTieFull", "Base.Gloves_WhiteTINT", "Base.WeddingJacket", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Socks_Long", "Shoes_Black"}
	SurvivorRandomSuits["RareJCSD"]["Priest1"] = {"Base.Shirt_Priest", "Base.Trousers_Suit", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareJCSD"]["ShopSpiffo1"] = {"Base.Tshirt_BusinessSpiffo", "Base.Apron_Spiffos", "Base.TrousersMesh_DenimLight", "Base.Socks_Ankle", "Base.Shoes_TrainerTINT"}
	SurvivorRandomSuits["RareJCSD"]["Swimwear1F"] = {"Base.Bikini_Pattern01", "Base.Shoes_FlipFlop"}
	SurvivorRandomSuits["RareJCSD"]["Swimwear1M"] = {"Base.SwimTrunks_Blue", "Base.Shoes_FlipFlop"}
	SurvivorRandomSuits["RareJCSD"]["Nurse1"] = {"Base.Hat_SurgicalMask_Blue", "Base.Tshirt_Scrubs", "Base.Trousers_Scrubs", "Base.Socks_Ankle", "Base.Shoes_Black"}
	--EMS
    SurvivorRandomSuits["RareJCSD"]["JeffersonCountyEMS1"] = {"STR.Hat_BaseballCap_EMS_Jefferson", "STR.TShirt_EMS_Jefferson", "STR.Shirt_EMS_Jefferson", "STR.Trousers_EMS_Jefferson", "STR.Jacket_EMS_Jefferson", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareJCSD"]["JeffersonCountyEMS2"] = {"STR.Hat_BaseballCap_EMS_Jefferson", "STR.TShirt_EMS_Jefferson", "STR.Shirt_EMS_Jefferson", "STR.Trousers_EMS_Jefferson", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareJCSD"]["JeffersonCountyEMS3"] = {"STR.Hat_BaseballCap_EMS_Jefferson", "STR.TShirt_EMS_Jefferson", "STR.Trousers_EMS_Jefferson", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareJCSD"]["JeffersonCountyEMS4"] = {"STR.Hat_BaseballCap_EMS_Jefferson_Reverse", "STR.TShirt_EMS_Jefferson", "STR.Shirt_EMS_Jefferson", "STR.Trousers_EMS_Jefferson", "STR.Jacket_EMS_Jefferson", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareJCSD"]["JeffersonCountyEMS5"] = {"STR.Hat_BaseballCap_EMS_Jefferson_Reverse", "STR.TShirt_EMS_Jefferson", "STR.Shirt_EMS_Jefferson", "STR.Trousers_EMS_Jefferson", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareJCSD"]["JeffersonCountyEMS6"] = {"STR.Hat_BaseballCap_EMS_Jefferson_Reverse", "STR.TShirt_EMS_Jefferson", "STR.Trousers_EMS_Jefferson", "Base.Shoes_Black"}

	SurvivorRandomSuits["RareJCSD"]["Prepper1"] = {"Base.Hat_GasMask", "Base.HoodieUP_GreenTINT", "Base.Vest_BulletCivilian", "Base.TrousersMesh_DenimLight", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareJCSD"]["Bandit1"] = {"Base.Hat_BalaclavaFull", "Base.Jacket_Padded", "Base.TrousersMesh_DenimLight", "Base.Tshirt_Rock", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareJCSD"]["Bandit2"] = {"Base.Hat_BalaclavaFull", "Base.HoodieUP_WhiteTINT", "Base.TrousersMesh_DenimLight", "Tshirt_DefaultDECAL", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareJCSD"]["Bandit3"] = {"Base.Hat_BalaclavaFull", "Base.Vest_Hunting_Camo", "Base.Trousers_CamoGreen", "Base.Shoes_BlackBoots"}
	--Prisoners
    SurvivorRandomSuits["RareJCSD"]["JeffersonCountyPrisoner1"] = {"STR.Boilersuit_JeffersonPrisoner", "Base.Socks_Long", "Base.Shoes_Black"}
	--Rangers
    SurvivorRandomSuits["RareJCSD"]["FederalRanger1"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "STR.Jacket_Federal_Ranger", "Base.Shoes_Black", "STR.FederalRangerBadge"}
    SurvivorRandomSuits["RareJCSD"]["FederalRanger2"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "Base.Shoes_Black", "STR.FederalRangerBadge"}
    SurvivorRandomSuits["RareJCSD"]["FederalRanger3"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Trousers_FederalRanger", "Base.Shoes_Black", "STR.FederalRangerBadge"}

    SurvivorRandomSuits["RareJCSD"]["StateLawRanger1"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "STR.Jacket_State_LawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}
    SurvivorRandomSuits["RareJCSD"]["StateLawRanger2"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}
    SurvivorRandomSuits["RareJCSD"]["StateLawRanger3"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Trousers_StateLawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}

    SurvivorRandomSuits["RareJCSD"]["StateRanger1"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "STR.Jacket_State_Ranger", "Base.Shoes_Black", "STR.StateRangerBadge"}
    SurvivorRandomSuits["RareJCSD"]["StateRanger2"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "Base.Shoes_Black", "STR.StateRangerBadge"}
    SurvivorRandomSuits["RareJCSD"]["StateRanger3"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Trousers_StateRanger", "Base.Shoes_Black", "STR.StateRangerBadge"}
	--Louisville Black
    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB1"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB2"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB3"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB4"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB5"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB6"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB7"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB8"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB9"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB10"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB11"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB12"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_Black", "Base.Shoes_BlackBoots"}
	--Louisville Khaki
	SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK1"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK2"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK3"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK4"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK5"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK6"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK7"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK8"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK9"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK10"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK11"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK12"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_Khaki", "Base.Shoes_BlackBoots"}
	--Police
    SurvivorRandomSuits["RareJCSD"]["JeffersonSD1"] = {"STR.Hat_Police_JeffersonSD", "STR.TShirt_Police_JeffersonSD", "STR.Shirt_Police_JeffersonSD", "STR.Trousers_Police_JeffersonSD", "STR.Jacket_Police_JeffersonSD", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.JeffersonSheriffBadge"}
    SurvivorRandomSuits["RareJCSD"]["JeffersonSD2"] = {"STR.Hat_Police_JeffersonSD", "STR.TShirt_Police_JeffersonSD", "STR.Shirt_Police_JeffersonSD", "STR.Trousers_Police_JeffersonSD", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.JeffersonSheriffBadge"}
    SurvivorRandomSuits["RareJCSD"]["JeffersonSD3"] = {"STR.Hat_Police_JeffersonSD", "STR.TShirt_Police_JeffersonSD", "STR.Trousers_Police_JeffersonSD", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.JeffersonSheriffBadge"}

    SurvivorRandomSuits["RareJCSD"]["JeffersonSD1Pistol"] = {"STR.Hat_Police_JeffersonSD", "STR.TShirt_Police_JeffersonSD", "STR.Shirt_Police_JeffersonSD", "STR.Trousers_Police_JeffersonSD", "STR.Jacket_Police_JeffersonSD", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.JeffersonSheriffBadge"}
    SurvivorRandomSuits["RareJCSD"]["JeffersonSD2Pistol"] = {"STR.Hat_Police_JeffersonSD", "STR.TShirt_Police_JeffersonSD", "STR.Shirt_Police_JeffersonSD", "STR.Trousers_Police_JeffersonSD", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.JeffersonSheriffBadge"}
    SurvivorRandomSuits["RareJCSD"]["JeffersonSD3Pistol"] = {"STR.Hat_Police_JeffersonSD", "STR.TShirt_Police_JeffersonSD", "STR.Trousers_Police_JeffersonSD", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.JeffersonSheriffBadge"}

    SurvivorRandomSuits["RareJCSD"]["JeffersonSD1Shotgun"] = {"STR.Hat_Police_JeffersonSD", "STR.TShirt_Police_JeffersonSD", "STR.Shirt_Police_JeffersonSD", "STR.Trousers_Police_JeffersonSD", "STR.Jacket_Police_JeffersonSD", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.JeffersonSheriffBadge"}
    SurvivorRandomSuits["RareJCSD"]["JeffersonSD2Shotgun"] = {"STR.Hat_Police_JeffersonSD", "STR.TShirt_Police_JeffersonSD", "STR.Shirt_Police_JeffersonSD", "STR.Trousers_Police_JeffersonSD", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.JeffersonSheriffBadge"}
    SurvivorRandomSuits["RareJCSD"]["JeffersonSD3Shotgun"] = {"STR.Hat_Police_JeffersonSD", "STR.TShirt_Police_JeffersonSD", "STR.Trousers_Police_JeffersonSD", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.JeffersonSheriffBadge"}

    SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol1"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol2"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol3"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol4"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol5"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol6"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

    SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol1Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol2Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol3Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol4Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol5Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol6Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

    SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol1Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol2Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol3Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol4Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol5Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol6Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
	--USPS
    SurvivorRandomSuits["RareJCSD"]["USPS1"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCSD"]["USPS2"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCSD"]["USPS3"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCSD"]["USPS4"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCSD"]["USPS5"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCSD"]["USPS6"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCSD"]["USPS7"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCSD"]["USPS8"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCSD"]["USPS9"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCSD"]["USPS10"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCSD"]["USPS11"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareJCSD"]["USPS12"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
	--Judge
    SurvivorRandomSuits["RareJCSD"]["Judge1"] = {"STR.Judge_Robe", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareJCSD"]["Judge2"] = {"STR.Judge_Robe", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Shoes_Brown"}

	if isModEnabled("STRSJ") then
		--EMS
		SurvivorRandomSuits["RareJCSD"]["JeffersonCountyEMS1Open"] = {"STR.Hat_BaseballCap_EMS_Jefferson", "STR.TShirt_EMS_Jefferson", "STR.Shirt_EMS_Jefferson", "STR.Trousers_EMS_Jefferson", "STR.Jacket_EMS_JeffersonOPEN", "Base.Shoes_Black"}
		SurvivorRandomSuits["RareJCSD"]["JeffersonCountyEMS4Open"] = {"STR.Hat_BaseballCap_EMS_Jefferson_Reverse", "STR.TShirt_EMS_Jefferson", "STR.Shirt_EMS_Jefferson", "STR.Trousers_EMS_Jefferson", "STR.Jacket_EMS_JeffersonOPEN", "Base.Shoes_Black"}
		--Prisoners
		SurvivorRandomSuits["RareJCSD"]["JeffersonCountyPrisoner1Open"] = {"STR.Boilersuit_JeffersonPrisonerOPEN", "Base.Socks_Long", "Base.Shoes_Black"}
		--Rangers
		SurvivorRandomSuits["RareJCSD"]["FederalRanger1Open"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "STR.Jacket_Federal_RangerOPEN", "Base.Shoes_Black", "STR.FederalRangerBadge"}

		SurvivorRandomSuits["RareJCSD"]["StateLawRanger1Open"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "STR.Jacket_State_LawRangerOPEN", "Base.Shoes_Black", "STR.StateLawRangerBadge"}

		SurvivorRandomSuits["RareJCSD"]["StateRanger1Open"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "STR.Jacket_State_RangerOPEN", "Base.Shoes_Black", "STR.StateRangerBadge"}
		--Louisville Black
		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB1Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB2Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB3Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB4Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB5Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB6Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB7Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB8Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB9Open"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB10Open"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB11Open"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullB12Open"] = {"STR.Hat_Fireman_Louisville_Yellow", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Black", "STR.Jacket_Fireman_Louisville_BlackOPEN", "Base.Shoes_BlackBoots"}
		--Louisville Khaki
		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK1Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK2Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK3Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK4Open"] = {"STR.Hat_Fireman_Louisville_Black", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK5Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK6Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK7Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK8Open"] = {"STR.Hat_Fireman_Louisville_Red", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK9Open"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanBlue_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK10Open"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK11Open"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanRed_Louisville02", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareJCSD"]["LouisvilleFiremanFullK12Open"] = {"STR.Hat_Fireman_Rosewood_Yellow", "STR.TShirt_Profession_FiremanWhite_Louisville", "STR.Trousers_Fireman_Louisville_Khaki", "STR.Jacket_Fireman_Louisville_KhakiOPEN", "Base.Shoes_BlackBoots"}
		--Police
		SurvivorRandomSuits["RareJCSD"]["JeffersonSD1Open"] = {"STR.Hat_Police_JeffersonSD", "STR.TShirt_Police_JeffersonSD", "STR.Shirt_Police_JeffersonSD", "STR.Trousers_Police_JeffersonSD", "STR.Jacket_Police_JeffersonSDOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.JeffersonSheriffBadge"}

		SurvivorRandomSuits["RareJCSD"]["JeffersonSD1OpenPistol"] = {"STR.Hat_Police_JeffersonSD", "STR.TShirt_Police_JeffersonSD", "STR.Shirt_Police_JeffersonSD", "STR.Trousers_Police_JeffersonSD", "STR.Jacket_Police_JeffersonSDOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.JeffersonSheriffBadge"}

		SurvivorRandomSuits["RareJCSD"]["JeffersonSD1OpenShotgun"] = {"STR.Hat_Police_JeffersonSD", "STR.TShirt_Police_JeffersonSD", "STR.Shirt_Police_JeffersonSD", "STR.Trousers_Police_JeffersonSD", "STR.Jacket_Police_JeffersonSDOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.JeffersonSheriffBadge"}

		SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol1Open"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol4Open"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

		SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol1OpenPistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol4OpenPistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

		SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol1OpenShotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareJCSD"]["KentuckyStatePatrol4OpenShotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		--USPS
		SurvivorRandomSuits["RareJCSD"]["USPS1Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareJCSD"]["USPS4Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareJCSD"]["USPS7Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareJCSD"]["USPS12Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
	end

-- Here I'm using the standard "Rare" option so other people's outfits will actually appear.
-- Compatibility is impertent!

--MeadeCounty
	SurvivorRandomSuits["Rare"]["Bride1F"] = {"Base.WeddingDress", "Base.Shirt_FormalWhite", "Base.Socks_Long", "Base.Shoes_Black"}
	SurvivorRandomSuits["Rare"]["Groom1M"] = {"Base.Tie_BowTieFull", "Base.Gloves_WhiteTINT", "Base.WeddingJacket", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Socks_Long", "Shoes_Black"}
	SurvivorRandomSuits["Rare"]["Priest1"] = {"Base.Shirt_Priest", "Base.Trousers_Suit", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["Rare"]["ShopSpiffo1"] = {"Base.Tshirt_BusinessSpiffo", "Base.Apron_Spiffos", "Base.TrousersMesh_DenimLight", "Base.Socks_Ankle", "Base.Shoes_TrainerTINT"}
	SurvivorRandomSuits["Rare"]["Swimwear1F"] = {"Base.Bikini_Pattern01", "Base.Shoes_FlipFlop"}
	SurvivorRandomSuits["Rare"]["Swimwear1M"] = {"Base.SwimTrunks_Blue", "Base.Shoes_FlipFlop"}
	SurvivorRandomSuits["Rare"]["Nurse1"] = {"Base.Hat_SurgicalMask_Blue", "Base.Tshirt_Scrubs", "Base.Trousers_Scrubs", "Base.Socks_Ankle", "Base.Shoes_Black"}
	--EMS
    SurvivorRandomSuits["Rare"]["MeadeCountyEMS1"] = {"STR.Hat_BaseballCap_EMS_Meade", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "STR.Jacket_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["Rare"]["MeadeCountyEMS2"] = {"STR.Hat_BaseballCap_EMS_Meade", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["Rare"]["MeadeCountyEMS3"] = {"STR.Hat_BaseballCap_EMS_Meade", "STR.TShirt_EMS_Meade", "STR.Trousers_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["Rare"]["MeadeCountyEMS4"] = {"STR.Hat_BaseballCap_EMS_Meade_Reverse", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "STR.Jacket_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["Rare"]["MeadeCountyEMS5"] = {"STR.Hat_BaseballCap_EMS_Meade_Reverse", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "Base.Shoes_Black"}
    SurvivorRandomSuits["Rare"]["MeadeCountyEMS6"] = {"STR.Hat_BaseballCap_EMS_Meade_Reverse", "STR.TShirt_EMS_Meade", "STR.Trousers_EMS_Meade", "Base.Shoes_Black"}

	SurvivorRandomSuits["Rare"]["Prepper1"] = {"Base.Hat_GasMask", "Base.HoodieUP_GreenTINT", "Base.Vest_BulletCivilian", "Base.TrousersMesh_DenimLight", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["Rare"]["Bandit1"] = {"Base.Hat_BalaclavaFull", "Base.Jacket_Padded", "Base.TrousersMesh_DenimLight", "Base.Tshirt_Rock", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["Rare"]["Bandit2"] = {"Base.Hat_BalaclavaFull", "Base.HoodieUP_WhiteTINT", "Base.TrousersMesh_DenimLight", "Tshirt_DefaultDECAL", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["Rare"]["Bandit3"] = {"Base.Hat_BalaclavaFull", "Base.Vest_Hunting_Camo", "Base.Trousers_CamoGreen", "Base.Shoes_BlackBoots"}
	--Prisoners
    SurvivorRandomSuits["Rare"]["MeadeCountyPrisoner1"] = {"STR.Boilersuit_MeadeGenPopPrisoner", "Base.Socks_Long", "Base.Shoes_Black"}
    SurvivorRandomSuits["Rare"]["MeadeCountyPrisoner2"] = {"STR.Boilersuit_MeadeLowRiskPrisoner", "Base.Socks_Long", "Base.Shoes_Black"}
    SurvivorRandomSuits["Rare"]["MeadeCountyPrisoner3"] = {"STR.Boilersuit_MeadeMaxPrisoner", "Base.Socks_Long", "Base.Shoes_Black"}
	--Rangers
    SurvivorRandomSuits["Rare"]["FederalRanger1"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "STR.Jacket_Federal_Ranger", "Base.Shoes_Black", "STR.FederalRangerBadge"}
    SurvivorRandomSuits["Rare"]["FederalRanger2"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "Base.Shoes_Black", "STR.FederalRangerBadge"}
    SurvivorRandomSuits["Rare"]["FederalRanger3"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Trousers_FederalRanger", "Base.Shoes_Black", "STR.FederalRangerBadge"}

    SurvivorRandomSuits["Rare"]["StateLawRanger1"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "STR.Jacket_State_LawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}
    SurvivorRandomSuits["Rare"]["StateLawRanger2"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}
    SurvivorRandomSuits["Rare"]["StateLawRanger3"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Trousers_StateLawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}

    SurvivorRandomSuits["Rare"]["StateRanger1"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "STR.Jacket_State_Ranger", "Base.Shoes_Black", "STR.StateRangerBadge"}
    SurvivorRandomSuits["Rare"]["StateRanger2"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "Base.Shoes_Black", "STR.StateRangerBadge"}
    SurvivorRandomSuits["Rare"]["StateRanger3"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Trousers_StateRanger", "Base.Shoes_Black", "STR.StateRangerBadge"}
	--Meade County Black
    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB1"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB2"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB3"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB4"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB5"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB6"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB7"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB8"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB9"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB10"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB11"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB12"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_Black", "Base.Shoes_BlackBoots"}
	--Meade County Khaki
	SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK1"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK2"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK3"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK4"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK5"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK6"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK7"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK8"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK9"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK10"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK11"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK12"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_Khaki", "Base.Shoes_BlackBoots"}
	--Police
    SurvivorRandomSuits["Rare"]["MeadeCountySO1"] = {"STR.Hat_Police_Meade", "STR.TShirt_Police_Meade", "STR.Shirt_Police_Meade", "STR.Trousers_Police_Meade", "STR.Jacket_Police_Meade", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.MeadeSheriffBadge"}
    SurvivorRandomSuits["Rare"]["MeadeCountySO2"] = {"STR.Hat_Police_Meade", "STR.TShirt_Police_Meade", "STR.Shirt_Police_Meade", "STR.Trousers_Police_Meade", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.MeadeSheriffBadge"}
    SurvivorRandomSuits["Rare"]["MeadeCountySO3"] = {"STR.Hat_Police_Meade", "STR.TShirt_Police_Meade", "STR.Trousers_Police_Meade", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.MeadeSheriffBadge"}

    SurvivorRandomSuits["Rare"]["MeadeCountySO1Pistol"] = {"STR.Hat_Police_Meade", "STR.TShirt_Police_Meade", "STR.Shirt_Police_Meade", "STR.Trousers_Police_Meade", "STR.Jacket_Police_Meade", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.MeadeSheriffBadge"}
    SurvivorRandomSuits["Rare"]["MeadeCountySO2Pistol"] = {"STR.Hat_Police_Meade", "STR.TShirt_Police_Meade", "STR.Shirt_Police_Meade", "STR.Trousers_Police_Meade", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.MeadeSheriffBadge"}
    SurvivorRandomSuits["Rare"]["MeadeCountySO3Pistol"] = {"STR.Hat_Police_Meade", "STR.TShirt_Police_Meade", "STR.Trousers_Police_Meade", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.MeadeSheriffBadge"}

    SurvivorRandomSuits["Rare"]["MeadeCountySO1Shotgun"] = {"STR.Hat_Police_Meade", "STR.TShirt_Police_Meade", "STR.Shirt_Police_Meade", "STR.Trousers_Police_Meade", "STR.Jacket_Police_Meade", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.MeadeSheriffBadge"}
    SurvivorRandomSuits["Rare"]["MeadeCountySO2Shotgun"] = {"STR.Hat_Police_Meade", "STR.TShirt_Police_Meade", "STR.Shirt_Police_Meade", "STR.Trousers_Police_Meade", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.MeadeSheriffBadge"}
    SurvivorRandomSuits["Rare"]["MeadeCountySO3Shotgun"] = {"STR.Hat_Police_Meade", "STR.TShirt_Police_Meade", "STR.Trousers_Police_Meade", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.MeadeSheriffBadge"}

    SurvivorRandomSuits["Rare"]["KentuckyStatePatrol1"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["Rare"]["KentuckyStatePatrol2"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["Rare"]["KentuckyStatePatrol3"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["Rare"]["KentuckyStatePatrol4"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["Rare"]["KentuckyStatePatrol5"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["Rare"]["KentuckyStatePatrol6"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

    SurvivorRandomSuits["Rare"]["KentuckyStatePatrol1Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["Rare"]["KentuckyStatePatrol2Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["Rare"]["KentuckyStatePatrol3Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["Rare"]["KentuckyStatePatrol4Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["Rare"]["KentuckyStatePatrol5Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["Rare"]["KentuckyStatePatrol6Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

    SurvivorRandomSuits["Rare"]["KentuckyStatePatrol1Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["Rare"]["KentuckyStatePatrol2Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["Rare"]["KentuckyStatePatrol3Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["Rare"]["KentuckyStatePatrol4Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["Rare"]["KentuckyStatePatrol5Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["Rare"]["KentuckyStatePatrol6Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
	--USPS
    SurvivorRandomSuits["Rare"]["USPS1"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["Rare"]["USPS2"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["Rare"]["USPS3"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["Rare"]["USPS4"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["Rare"]["USPS5"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["Rare"]["USPS6"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["Rare"]["USPS7"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["Rare"]["USPS8"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["Rare"]["USPS9"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["Rare"]["USPS10"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["Rare"]["USPS11"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["Rare"]["USPS12"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
	--Judge
    SurvivorRandomSuits["Rare"]["Judge1"] = {"STR.Judge_Robe", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Shoes_Black"}
    SurvivorRandomSuits["Rare"]["Judge2"] = {"STR.Judge_Robe", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Shoes_Brown"}

	if isModEnabled("STRSJ") then
		--EMS
		SurvivorRandomSuits["Rare"]["MeadeCountyEMS1Open"] = {"STR.Hat_BaseballCap_EMS_Meade", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "STR.Jacket_EMS_MeadeOPEN", "Base.Shoes_Black"}
		SurvivorRandomSuits["Rare"]["MeadeCountyEMS4Open"] = {"STR.Hat_BaseballCap_EMS_Meade_Reverse", "STR.TShirt_EMS_Meade", "STR.Shirt_EMS_Meade", "STR.Trousers_EMS_Meade", "STR.Jacket_EMS_MeadeOPEN", "Base.Shoes_Black"}
		--Prisoners
		SurvivorRandomSuits["Rare"]["MeadeCountyPrisoner1Open"] = {"STR.Boilersuit_MeadeGenPopPrisonerOPEN", "Base.Socks_Long", "Base.Shoes_Black"}
		SurvivorRandomSuits["Rare"]["MeadeCountyPrisoner2Open"] = {"STR.Boilersuit_MeadeLowRiskPrisonerOPEN", "Base.Socks_Long", "Base.Shoes_Black"}
		SurvivorRandomSuits["Rare"]["MeadeCountyPrisoner3Open"] = {"STR.Boilersuit_MeadeMaxPrisonerOPEN", "Base.Socks_Long", "Base.Shoes_Black"}
		--Rangers
		SurvivorRandomSuits["Rare"]["FederalRanger1Open"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "STR.Jacket_Federal_RangerOPEN", "Base.Shoes_Black", "STR.FederalRangerBadge"}

		SurvivorRandomSuits["Rare"]["StateLawRanger1Open"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "STR.Jacket_State_LawRangerOPEN", "Base.Shoes_Black", "STR.StateLawRangerBadge"}

		SurvivorRandomSuits["Rare"]["StateRanger1Open"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "STR.Jacket_State_RangerOPEN", "Base.Shoes_Black", "STR.StateRangerBadge"}
		--Meade County Black
		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB1Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB2Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB3Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB4Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB5Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB6Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB7Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB8Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB9Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB10Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB11Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullB12Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Black", "STR.Jacket_Fireman_Meade_BlackOPEN", "Base.Shoes_BlackBoots"}
		--Meade County Khaki
		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK1Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK2Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK3Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK4Open"] = {"STR.Hat_Fireman_Meade_Black", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK5Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK6Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK7Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK8Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK9Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK10Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK11Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["Rare"]["MeadeCountyFiremanFullK12Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		--Police
		SurvivorRandomSuits["Rare"]["MeadeCountySO1Open"] = {"STR.Hat_Police_Meade", "STR.TShirt_Police_Meade", "STR.Shirt_Police_Meade", "STR.Trousers_Police_Meade", "STR.Jacket_Police_MeadeOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.MeadeSheriffBadge"}

		SurvivorRandomSuits["Rare"]["MeadeCountySO1OpenPistol"] = {"STR.Hat_Police_Meade", "STR.TShirt_Police_Meade", "STR.Shirt_Police_Meade", "STR.Trousers_Police_Meade", "STR.Jacket_Police_MeadeOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.MeadeSheriffBadge"}

		SurvivorRandomSuits["Rare"]["MeadeCountySO1OpenShotgun"] = {"STR.Hat_Police_Meade", "STR.TShirt_Police_Meade", "STR.Shirt_Police_Meade", "STR.Trousers_Police_Meade", "STR.Jacket_Police_MeadeOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.MeadeSheriffBadge"}

		SurvivorRandomSuits["Rare"]["KentuckyStatePatrol1Open"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["Rare"]["KentuckyStatePatrol4Open"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

		SurvivorRandomSuits["Rare"]["KentuckyStatePatrol1OpenPistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["Rare"]["KentuckyStatePatrol4OpenPistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

		SurvivorRandomSuits["Rare"]["KentuckyStatePatrol1OpenShotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["Rare"]["KentuckyStatePatrol4OpenShotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		--USPS
		SurvivorRandomSuits["Rare"]["USPS1Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["Rare"]["USPS4Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["Rare"]["USPS7Open"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["Rare"]["USPS10Open"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
	end

--RavenCreek Stuff, Very Confusing
if isModEnabled("RavenCreek") then
--RavenCreek
	SurvivorRandomSuits["RareRCR"]["Bride1F"] = {"Base.WeddingDress", "Base.Shirt_FormalWhite", "Base.Socks_Long", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareRCR"]["Groom1M"] = {"Base.Tie_BowTieFull", "Base.Gloves_WhiteTINT", "Base.WeddingJacket", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Socks_Long", "Shoes_Black"}
	SurvivorRandomSuits["RareRCR"]["Priest1"] = {"Base.Shirt_Priest", "Base.Trousers_Suit", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareRCR"]["ShopSpiffo1"] = {"Base.Tshirt_BusinessSpiffo", "Base.Apron_Spiffos", "Base.TrousersMesh_DenimLight", "Base.Socks_Ankle", "Base.Shoes_TrainerTINT"}
	SurvivorRandomSuits["RareRCR"]["Swimwear1F"] = {"Base.Bikini_Pattern01", "Base.Shoes_FlipFlop"}
	SurvivorRandomSuits["RareRCR"]["Swimwear1M"] = {"Base.SwimTrunks_Blue", "Base.Shoes_FlipFlop"}
	SurvivorRandomSuits["RareRCR"]["Nurse1"] = {"Base.Hat_SurgicalMask_Blue", "Base.Tshirt_Scrubs", "Base.Trousers_Scrubs", "Base.Socks_Ankle", "Base.Shoes_Black"}

	SurvivorRandomSuits["RareRCR"]["Prepper1"] = {"Base.Hat_GasMask", "Base.HoodieUP_GreenTINT", "Base.Vest_BulletCivilian", "Base.TrousersMesh_DenimLight", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareRCR"]["Bandit1"] = {"Base.Hat_BalaclavaFull", "Base.Jacket_Padded", "Base.TrousersMesh_DenimLight", "Base.Tshirt_Rock", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareRCR"]["Bandit2"] = {"Base.Hat_BalaclavaFull", "Base.HoodieUP_WhiteTINT", "Base.TrousersMesh_DenimLight", "Tshirt_DefaultDECAL", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareRCR"]["Bandit3"] = {"Base.Hat_BalaclavaFull", "Base.Vest_Hunting_Camo", "Base.Trousers_CamoGreen", "Base.Shoes_BlackBoots"}
	--EMS
    SurvivorRandomSuits["RareRCR"]["RavenCreekEMS1"] = {"STR.Hat_BaseballCap_EMS_RavenCreek", "STR.TShirt_EMS_RavenCreek", "STR.Shirt_EMS_RavenCreek", "STR.Trousers_EMS_RavenCreek", "STR.Jacket_EMS_RavenCreek", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekEMS2"] = {"STR.Hat_BaseballCap_EMS_RavenCreek", "STR.TShirt_EMS_RavenCreek", "STR.Shirt_EMS_RavenCreek", "STR.Trousers_EMS_RavenCreek", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekEMS3"] = {"STR.Hat_BaseballCap_EMS_RavenCreek", "STR.TShirt_EMS_RavenCreek", "STR.Trousers_EMS_RavenCreek", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekEMS4"] = {"STR.Hat_BaseballCap_EMS_RavenCreek_Reverse", "STR.TShirt_EMS_RavenCreek", "STR.Shirt_EMS_RavenCreek", "STR.Trousers_EMS_RavenCreek", "STR.Jacket_EMS_RavenCreek", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekEMS5"] = {"STR.Hat_BaseballCap_EMS_RavenCreek_Reverse", "STR.TShirt_EMS_RavenCreek", "STR.Shirt_EMS_RavenCreek", "STR.Trousers_EMS_RavenCreek", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekEMS6"] = {"STR.Hat_BaseballCap_EMS_RavenCreek_Reverse", "STR.TShirt_EMS_RavenCreek", "STR.Trousers_EMS_RavenCreek", "Base.Shoes_Black"}

	SurvivorRandomSuits["RareRCR"]["Prepper1"] = {"Base.Hat_GasMask", "Base.HoodieUP_GreenTINT", "Base.Vest_BulletCivilian", "Base.TrousersMesh_DenimLight", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareRCR"]["Bandit1"] = {"Base.Hat_BalaclavaFull", "Base.Jacket_Padded", "Base.TrousersMesh_DenimLight", "Base.Tshirt_Rock", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareRCR"]["Bandit2"] = {"Base.Hat_BalaclavaFull", "Base.HoodieUP_WhiteTINT", "Base.TrousersMesh_DenimLight", "Tshirt_DefaultDECAL", "Base.Socks_Ankle", "Base.Shoes_Black"}
	SurvivorRandomSuits["RareRCR"]["Bandit3"] = {"Base.Hat_BalaclavaFull", "Base.Vest_Hunting_Camo", "Base.Trousers_CamoGreen", "Base.Shoes_BlackBoots"}
	--Prisoners
    SurvivorRandomSuits["RareRCR"]["RavenCreekPrisoner1"] = {"STR.Boilersuit_RavenCreekPrisoner", "Base.Socks_Long", "Base.Shoes_Black"}
	--Rangers
    SurvivorRandomSuits["RareRCR"]["FederalRanger1"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "STR.Jacket_Federal_Ranger", "Base.Shoes_Black", "STR.FederalRangerBadge"}
    SurvivorRandomSuits["RareRCR"]["FederalRanger2"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "Base.Shoes_Black", "STR.FederalRangerBadge"}
    SurvivorRandomSuits["RareRCR"]["FederalRanger3"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Trousers_FederalRanger", "Base.Shoes_Black", "STR.FederalRangerBadge"}

    SurvivorRandomSuits["RareRCR"]["StateLawRanger1"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "STR.Jacket_State_LawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}
    SurvivorRandomSuits["RareRCR"]["StateLawRanger2"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}
    SurvivorRandomSuits["RareRCR"]["StateLawRanger3"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Trousers_StateLawRanger", "Base.Shoes_Black", "STR.StateLawRangerBadge"}

    SurvivorRandomSuits["RareRCR"]["StateRanger1"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "STR.Jacket_State_Ranger", "Base.Shoes_Black", "STR.StateRangerBadge"}
    SurvivorRandomSuits["RareRCR"]["StateRanger2"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "Base.Shoes_Black", "STR.StateRangerBadge"}
    SurvivorRandomSuits["RareRCR"]["StateRanger3"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Trousers_StateRanger", "Base.Shoes_Black", "STR.StateRangerBadge"}
	--RavenCreek Black
    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB1"] = {"STR.Hat_Fireman_RavenCreek_Black", "STR.TShirt_Profession_FiremanBlue_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB2"] = {"STR.Hat_Fireman_RavenCreek_Black", "STR.TShirt_Profession_FiremanRed_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB3"] = {"STR.Hat_Fireman_RavenCreek_Black", "STR.TShirt_Profession_FiremanRed_RavenCreek02", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB4"] = {"STR.Hat_Fireman_RavenCreek_Black", "STR.TShirt_Profession_FiremanWhite_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_Black", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB5"] = {"STR.Hat_Fireman_RavenCreek_Red", "STR.TShirt_Profession_FiremanBlue_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB6"] = {"STR.Hat_Fireman_RavenCreek_Red", "STR.TShirt_Profession_FiremanRed_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB7"] = {"STR.Hat_Fireman_RavenCreek_Red", "STR.TShirt_Profession_FiremanRed_RavenCreek02", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB8"] = {"STR.Hat_Fireman_RavenCreek_Red", "STR.TShirt_Profession_FiremanWhite_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_Black", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB9"] = {"STR.Hat_Fireman_RavenCreek_Yellow", "STR.TShirt_Profession_FiremanBlue_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB10"] = {"STR.Hat_Fireman_RavenCreek_Yellow", "STR.TShirt_Profession_FiremanRed_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB11"] = {"STR.Hat_Fireman_RavenCreek_Yellow", "STR.TShirt_Profession_FiremanRed_RavenCreek02", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_Black", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB12"] = {"STR.Hat_Fireman_RavenCreek_Yellow", "STR.TShirt_Profession_FiremanWhite_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_Black", "Base.Shoes_BlackBoots"}
	--RavenCreek Khaki
	SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK1"] = {"STR.Hat_Fireman_RavenCreek_Black", "STR.TShirt_Profession_FiremanBlue_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Khaki", "STR.Jacket_Fireman_RavenCreek_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK2"] = {"STR.Hat_Fireman_RavenCreek_Black", "STR.TShirt_Profession_FiremanRed_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Khaki", "STR.Jacket_Fireman_RavenCreek_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK3"] = {"STR.Hat_Fireman_RavenCreek_Black", "STR.TShirt_Profession_FiremanRed_RavenCreek02", "STR.Trousers_Fireman_RavenCreek_Khaki", "STR.Jacket_Fireman_RavenCreek_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK4"] = {"STR.Hat_Fireman_RavenCreek_Black", "STR.TShirt_Profession_FiremanWhite_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Khaki", "STR.Jacket_Fireman_RavenCreek_Khaki", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK5"] = {"STR.Hat_Fireman_RavenCreek_Red", "STR.TShirt_Profession_FiremanBlue_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Khaki", "STR.Jacket_Fireman_RavenCreek_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK6"] = {"STR.Hat_Fireman_RavenCreek_Red", "STR.TShirt_Profession_FiremanRed_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Khaki", "STR.Jacket_Fireman_RavenCreek_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK7"] = {"STR.Hat_Fireman_RavenCreek_Red", "STR.TShirt_Profession_FiremanRed_RavenCreek02", "STR.Trousers_Fireman_RavenCreek_Khaki", "STR.Jacket_Fireman_RavenCreek_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK8"] = {"STR.Hat_Fireman_RavenCreek_Red", "STR.TShirt_Profession_FiremanWhite_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Khaki", "STR.Jacket_Fireman_RavenCreek_Khaki", "Base.Shoes_BlackBoots"}

    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK9"] = {"STR.Hat_Fireman_RavenCreek_Yellow", "STR.TShirt_Profession_FiremanBlue_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Khaki", "STR.Jacket_Fireman_RavenCreek_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK10"] = {"STR.Hat_Fireman_RavenCreek_Yellow", "STR.TShirt_Profession_FiremanRed_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Khaki", "STR.Jacket_Fireman_RavenCreek_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK11"] = {"STR.Hat_Fireman_RavenCreek_Yellow", "STR.TShirt_Profession_FiremanRed_RavenCreek02", "STR.Trousers_Fireman_RavenCreek_Khaki", "STR.Jacket_Fireman_RavenCreek_Khaki", "Base.Shoes_BlackBoots"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK12"] = {"STR.Hat_Fireman_RavenCreek_Yellow", "STR.TShirt_Profession_FiremanWhite_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Khaki", "STR.Jacket_Fireman_RavenCreek_Khaki", "Base.Shoes_BlackBoots"}
	--Police
    SurvivorRandomSuits["RareRCR"]["RavenCreekPD1"] = {"STR.Hat_Police_RavenCreek", "STR.TShirt_Police_RavenCreek", "STR.Shirt_Police_RavenCreek", "STR.Trousers_Police_RavenCreek", "STR.Jacket_Police_RavenCreek", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekPD2"] = {"STR.Hat_Police_RavenCreek", "STR.TShirt_Police_RavenCreek", "STR.Shirt_Police_RavenCreek", "STR.Trousers_Police_RavenCreek", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekPD3"] = {"STR.Hat_Police_RavenCreek", "STR.TShirt_Police_RavenCreek", "STR.Trousers_Police_RavenCreek", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick"}

    SurvivorRandomSuits["RareRCR"]["RavenCreekPD1Pistol"] = {"STR.Hat_Police_RavenCreek", "STR.TShirt_Police_RavenCreek", "STR.Shirt_Police_RavenCreek", "STR.Trousers_Police_RavenCreek", "STR.Jacket_Police_RavenCreek", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekPD2Pistol"] = {"STR.Hat_Police_RavenCreek", "STR.TShirt_Police_RavenCreek", "STR.Shirt_Police_RavenCreek", "STR.Trousers_Police_RavenCreek", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekPD3Pistol"] = {"STR.Hat_Police_RavenCreek", "STR.TShirt_Police_RavenCreek", "STR.Trousers_Police_RavenCreek", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox"}

    SurvivorRandomSuits["RareRCR"]["RavenCreekPD1Shotgun"] = {"STR.Hat_Police_RavenCreek", "STR.TShirt_Police_RavenCreek", "STR.Shirt_Police_RavenCreek", "STR.Trousers_Police_RavenCreek", "STR.Jacket_Police_RavenCreek", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekPD2Shotgun"] = {"STR.Hat_Police_RavenCreek", "STR.TShirt_Police_RavenCreek", "STR.Shirt_Police_RavenCreek", "STR.Trousers_Police_RavenCreek", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox"}
    SurvivorRandomSuits["RareRCR"]["RavenCreekPD3Shotgun"] = {"STR.Hat_Police_RavenCreek", "STR.TShirt_Police_RavenCreek", "STR.Trousers_Police_RavenCreek", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox"}

    SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol1"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol2"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol3"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol4"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol5"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol6"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

    SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol1Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol2Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol3Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol4Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol5Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol6Pistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

    SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol1Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol2Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol3Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Summer", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol4Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSP", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol5Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
    SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol6Shotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Trousers_PoliceKSP_Winter", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
	--USPS
    SurvivorRandomSuits["RareRCR"]["USPS1"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRCR"]["USPS2"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRCR"]["USPS3"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRCR"]["USPS4"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRCR"]["USPS5"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRCR"]["USPS6"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRCR"]["USPS7"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRCR"]["USPS8"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRCR"]["USPS9"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Trousers_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRCR"]["USPS10"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRCR"]["USPS11"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
    SurvivorRandomSuits["RareRCR"]["USPS12"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shorts_USPS", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
	--Judge
    SurvivorRandomSuits["RareRCR"]["Judge1"] = {"STR.Judge_Robe", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Shoes_Black"}
    SurvivorRandomSuits["RareRCR"]["Judge2"] = {"STR.Judge_Robe", "Base.Shirt_FormalWhite", "Base.Trousers_Suit", "Base.Shoes_Brown"}

	if isModEnabled("STRSJ") then
		--EMS
		SurvivorRandomSuits["RareRCR"]["RavenCreekEMS1Open"] = {"STR.Hat_BaseballCap_EMS_RavenCreek", "STR.TShirt_EMS_RavenCreek", "STR.Shirt_EMS_RavenCreek", "STR.Trousers_EMS_RavenCreek", "STR.Jacket_EMS_RavenCreekOPEN", "Base.Shoes_Black"}
		SurvivorRandomSuits["RareRCR"]["RavenCreekEMS4Open"] = {"STR.Hat_BaseballCap_EMS_RavenCreek_Reverse", "STR.TShirt_EMS_RavenCreek", "STR.Shirt_EMS_RavenCreek", "STR.Trousers_EMS_RavenCreek", "STR.Jacket_EMS_RavenCreekOPEN", "Base.Shoes_Black"}
		--Prisoners
		SurvivorRandomSuits["RareRCR"]["RavenCreekPrisoner1Open"] = {"STR.Boilersuit_RavenCreekPrisonerOPEN", "Base.Socks_Long", "Base.Shoes_Black"}
		--Rangers
		SurvivorRandomSuits["RareRCR"]["FederalRanger1Open"] = {"STR.Hat_FederalRanger", "STR.TShirt_Federal_Ranger", "STR.Shirt_Federal_Ranger", "STR.Trousers_FederalRanger", "STR.Jacket_Federal_RangerOPEN", "Base.Shoes_Black", "STR.FederalRangerBadge"}

		SurvivorRandomSuits["RareRCR"]["StateLawRanger1Open"] = {"STR.Hat_StateLawRanger", "STR.TShirt_State_LawRanger", "STR.Shirt_State_LawRanger", "STR.Trousers_StateLawRanger", "STR.Jacket_State_LawRangerOPEN", "Base.Shoes_Black", "STR.StateLawRangerBadge"}

		SurvivorRandomSuits["RareRCR"]["StateRanger1Open"] = {"STR.Hat_StateRanger", "STR.TShirt_State_Ranger", "STR.Shirt_State_Ranger", "STR.Trousers_StateRanger", "STR.Jacket_State_RangerOPEN", "Base.Shoes_Black", "STR.StateRangerBadge"}
		--RavenCreek Black
		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB1Open"] = {"STR.Hat_Fireman_RavenCreek_Black", "STR.TShirt_Profession_FiremanBlue_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB2Open"] = {"STR.Hat_Fireman_RavenCreek_Black", "STR.TShirt_Profession_FiremanRed_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB3Open"] = {"STR.Hat_Fireman_RavenCreek_Black", "STR.TShirt_Profession_FiremanRed_RavenCreek02", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB4Open"] = {"STR.Hat_Fireman_RavenCreek_Black", "STR.TShirt_Profession_FiremanWhite_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_BlackOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB5Open"] = {"STR.Hat_Fireman_RavenCreek_Red", "STR.TShirt_Profession_FiremanBlue_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB6Open"] = {"STR.Hat_Fireman_RavenCreek_Red", "STR.TShirt_Profession_FiremanRed_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB7Open"] = {"STR.Hat_Fireman_RavenCreek_Red", "STR.TShirt_Profession_FiremanRed_RavenCreek02", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB8Open"] = {"STR.Hat_Fireman_RavenCreek_Red", "STR.TShirt_Profession_FiremanWhite_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_BlackOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB9Open"] = {"STR.Hat_Fireman_RavenCreek_Yellow", "STR.TShirt_Profession_FiremanBlue_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB10Open"] = {"STR.Hat_Fireman_RavenCreek_Yellow", "STR.TShirt_Profession_FiremanRed_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB11Open"] = {"STR.Hat_Fireman_RavenCreek_Yellow", "STR.TShirt_Profession_FiremanRed_RavenCreek02", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_BlackOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullB12Open"] = {"STR.Hat_Fireman_RavenCreek_Yellow", "STR.TShirt_Profession_FiremanWhite_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Black", "STR.Jacket_Fireman_RavenCreek_BlackOPEN", "Base.Shoes_BlackBoots"}
		--RavenCreek Khaki
		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK1Open"] = {"STR.Hat_Fireman_RavenCreek_Black", "STR.TShirt_Profession_FiremanBlue_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Khaki", "STR.Jacket_Fireman_RavenCreek_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK2Open"] = {"STR.Hat_Fireman_RavenCreek_Black", "STR.TShirt_Profession_FiremanRed_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Khaki", "STR.Jacket_Fireman_RavenCreek_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK3Open"] = {"STR.Hat_Fireman_RavenCreek_Black", "STR.TShirt_Profession_FiremanRed_RavenCreek02", "STR.Trousers_Fireman_RavenCreek_Khaki", "STR.Jacket_Fireman_RavenCreek_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK4Open"] = {"STR.Hat_Fireman_RavenCreek_Black", "STR.TShirt_Profession_FiremanWhite_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Khaki", "STR.Jacket_Fireman_RavenCreek_KhakiOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK5Open"] = {"STR.Hat_Fireman_RavenCreek_Red", "STR.TShirt_Profession_FiremanBlue_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Khaki", "STR.Jacket_Fireman_RavenCreek_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK6Open"] = {"STR.Hat_Fireman_RavenCreek_Red", "STR.TShirt_Profession_FiremanRed_RavenCreek", "STR.Trousers_Fireman_RavenCreek_Khaki", "STR.Jacket_Fireman_RavenCreek_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK7Open"] = {"STR.Hat_Fireman_RavenCreek_Red", "STR.TShirt_Profession_FiremanRed_RavenCreek02", "STR.Trousers_Fireman_RavenCreek_Khaki", "STR.Jacket_Fireman_RavenCreek_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK8Open"] = {"STR.Hat_Fireman_Meade_Red", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}

		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK9Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanBlue_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK10Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK11Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanRed_Meade02", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		SurvivorRandomSuits["RareRCR"]["RavenCreekFiremanFullK12Open"] = {"STR.Hat_Fireman_Meade_Yellow", "STR.TShirt_Profession_FiremanWhite_Meade", "STR.Trousers_Fireman_Meade_Khaki", "STR.Jacket_Fireman_Meade_KhakiOPEN", "Base.Shoes_BlackBoots"}
		--Police
		SurvivorRandomSuits["Rare"]["RavenCreekSO1Open"] = {"STR.Hat_Police_RavenCreek", "STR.TShirt_Police_RavenCreek", "STR.Shirt_Police_RavenCreek", "STR.Trousers_Police_RavenCreek", "STR.Jacket_Police_RavenCreekOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.MeadeSheriffBadge"}

		SurvivorRandomSuits["Rare"]["MeadeCountySO1OpenPistol"] = {"STR.Hat_Police_RavenCreek", "STR.TShirt_Police_RavenCreek", "STR.Shirt_Police_RavenCreek", "STR.Trousers_Police_RavenCreek", "STR.Jacket_Police_RavenCreekOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.MeadeSheriffBadge"}

		SurvivorRandomSuits["Rare"]["MeadeCountySO1OpenShotgun"] = {"STR.Hat_Police_RavenCreek", "STR.TShirt_Police_RavenCreek", "STR.Shirt_Police_RavenCreek", "STR.Trousers_Police_RavenCreek", "STR.Jacket_Police_RavenCreekOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.MeadeSheriffBadge"}

		SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol1Open"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol4Open"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Nightstick", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

		SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol1OpenPistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol4OpenPistol"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Pistol", "Base.9mmClip", "Base.Bullets9mmBox", "Base.Bullets9mmBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}

		SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol1OpenShotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Summer", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		SurvivorRandomSuits["RareRCR"]["KentuckyStatePatrol4OpenShotgun"] = {"STR.Hat_PoliceKSP", "STR.TShirt_PoliceKSP", "STR.Tie_Full_KSP", "STR.Shirt_PoliceKSP", "STR.Trousers_PoliceKSP_Winter", "STR.Jacket_PoliceKSPOPEN", "Base.Shoes_Black", "STR.Belt_PoliceDuty", "STR.Chest_Walkie", "Base.Shotgun", "Base.ShotgunShellsBox", "Base.ShotgunShellsBox", "STR.KSPPoliceBadge", "STR.Tie_Full_KSP"}
		--USPS
		SurvivorRandomSuits["RareRCR"]["USPS1Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareRCR"]["USPS4Open"] = {"STR.Hat_BaseballCap_USPS", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareRCR"]["USPS7Open"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Trousers_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
		SurvivorRandomSuits["RareRCR"]["USPS10Open"] = {"STR.Hat_BaseballCap_USPS_Reverse", "STR.TShirt_USPS", "STR.Shirt_USPS", "STR.Shorts_USPS", "STR.Jacket_USPSOPEN", "Base.Shoes_Black", "STR.Bag_Satchel_USPS"}
	end
end

--Vanilla Survivors Outfits
--Overlapping entries that I don't need can be found here, Being removed.

	SurvivorRandomSuits["Rare"]["Prisoner1"] = nil
	SurvivorRandomSuits["Rare"]["Fireman1"] = nil

	SurvivorRandomSuits["Rare"]["Police1"] = nil
	SurvivorRandomSuits["Rare"]["Deputy1"] = nil

--Vanilla Survivors Presets
--Overlapping entries that I don't need can be found here, Being replaced.

SurvivorRandomSuits["Preset"]["Preset_Fireman"] = {
  "STR.Hat_Fireman_Meade_Yellow", 
  "STR.TShirt_Profession_FiremanBlue_Meade",
  "STR.Trousers_Fireman_Meade_Khaki",
  "STR.Jacket_Fireman_Meade_Khaki",
  "Base.Shoes_BlackBoots"
}
SurvivorRandomSuits["Preset"]["Preset_Police"] = {
  "STR.Hat_PoliceKSP", 
  "STR.TShirt_PoliceKSP",
  "STR.Tie_Full_KSP",
  "STR.Shirt_PoliceKSP",
  "STR.Trousers_PoliceKSP_Summer",
  "STR.Jacket_PoliceKSP",
  "STR.Belt_PoliceDuty",
  "STR.Chest_Walkie",
  "Base.Shoes_Black",
  "STR.KSPPoliceBadge"
}
SurvivorRandomSuits["Preset"]["Preset_Guard"] = {
  "STR.Hat_BaseballCap_DOC_Meade", 
  "STR.TShirt_DOC_Meade",
  "STR.Shirt_DOC_Meade",
  "STR.Trousers_DOC_Meade",
  "STR.Jacket_DOC_Meade",
  "Base.Shoes_Black"
}
SurvivorRandomSuits["Preset"]["Preset_Inmate"] = {
  "STR.Boilersuit_MeadeGenPopPrisoner", 
  "Base.Shoes_Slippers",
  "Base.Socks_Ankle",
  "Base.Tshirt_DefaultTEXTURE",
  "Base.Belt2"
}

-- Here I'm doing a nono by overriding the spawning function.
function getRandomSurvivorSuit(SS)
	debugSuits(" ----- getRandomSurvivorSuit -----")

	local roll = ZombRand(1,100)
	local tempTable = nil
	local randomize = false
	debugSuits("roll : " .. tostring(roll))

	-- Coord Stuff
	-- 1 is Xmin
	-- 2 is XMax
	-- 3 is YMin
	-- 4 is YMax
	-- Rosewood
	local Rosewood = {};
	Rosewood[1] = 7900;
	Rosewood[2] = 8550;
	Rosewood[3] = 11220;
	Rosewood[4] = 12300;
	-- Riverside
	local Riverside = {};
	Riverside[1] = 5620;
	Riverside[2] = 6900;
	Riverside[3] = 5150;
	Riverside[4] = 5615;
	-- Muldraugh
	local Muldraugh = {};
	Muldraugh[1] = 10250;
	Muldraugh[2] = 11100;
	Muldraugh[3] = 9100;
	Muldraugh[4] = 10850;
	-- WestPoint
	local WestPoint = {};
	WestPoint[1] = 10850;
	WestPoint[2] = 12315;
	WestPoint[3] = 6500;
	WestPoint[4] = 7175;
	-- JeffersonCountySD1
	local JCSD1 = {};
	JCSD1[1] = 12891;
	JCSD1[2] = 14800;
	JCSD1[3] = 2200;
	JCSD1[4] = 2690;
	-- JeffersonCountySD2
	local JCSD2 = {};
	JCSD2[1] = 13771;
	JCSD2[2] = 14800;
	JCSD2[3] = 2691;
	JCSD2[4] = 3440;
	-- JeffersonCountySD3
	local JCSD3 = {};
	JCSD3[1] = 13041;
	JCSD3[2] = 14800;
	JCSD3[3] = 3441;
	JCSD3[4] = 6300;
	-- JeffersonCountyPD1
	local JCPD1 = {};
	JCPD1[1] = 12901;
	JCPD1[2] = 13770;
	JCPD1[3] = 2691;
	JCPD1[4] = 3440;
	-- JeffersonCountyPD2
	local JCPD2 = {};
	JCPD2[1] = 12901;
	JCPD2[2] = 13040;
	JCPD2[3] = 2691;
	JCPD2[4] = 3865;
	-- LouisvillePD1
	local LPD1 = {};
	LPD1[1] = 11900;
	LPD1[2] = 12900;
	LPD1[3] = 900;
	LPD1[4] = 2190;
	-- LouisvillePD2
	local LPD2 = {};
	LPD2[1] = 11900;
	LPD2[2] = 12900;
	LPD2[3] = 2191;
	LPD2[4] = 2690;
	-- LouisvillePD3
	local LPD3 = {};
	LPD3[1] = 11900;
	LPD3[2] = 12660;
	LPD3[3] = 2691;
	LPD3[4] = 3890;
	-- LouisvilleKSP1
	local KSP1 = {};
	KSP1[1] = 12901;
	KSP1[2] = 14800;
	KSP1[3] = 900;
	KSP1[4] = 2199;
	-- LouisvilleKSP2
	local KSP2 = {};
	KSP2[1] = 12200;
	KSP2[2] = 13040;
	KSP2[3] = 3891;
	KSP2[4] = 6700;
	-- LouisvilleKSP3
	local KSP3 = {};
	KSP3[1] = 3500;
	KSP3[2] = 4800;
	KSP3[3] = 7100;
	KSP3[4] = 10900;
	-- RavenCreek
	local RCR = {};
	RCR[1] = 3000;
	RCR[2] = 5500;
	RCR[3] = 11001;
	RCR[4] = 13500;
	-- Louisville
	local LV = {};
	LV[1] = 11900;
	LV[2] = 14800;
	LV[3] = 900;
	LV[4] = 2300;
	-- JeffersonCounty
	local JC = {};
	JC[1] = 11900;
	JC[2] = 14800;
	JC[3] = 2301;
	JC[4] = 6500;

	--Assign Tables Based On Coordinate Ranges
	if SS:getX() >= Rosewood[1] and SS:getX() <= Rosewood[2] and SS:getY() >= Rosewood[3] and SS:getY() <= Rosewood[4] then
		if(roll == 1) then -- choose legendary suit
			debugSuits("Legendary suit:")
			tempTable = SurvivorRandomSuits["Legendary"]
		elseif(roll <= 5) then -- choose veryrare suit
			debugSuits("VeryRare suit:")
			tempTable = SurvivorRandomSuits["VeryRare"]
		elseif(roll <= 15) then -- choose rare suit
			debugSuits("Rare suit:")
			tempTable = SurvivorRandomSuits["RareRW"]
		elseif(roll <= 25) then -- chose normal suit
			debugSuits("Normal suit:")
			tempTable = SurvivorRandomSuits["Normal"]
		elseif(roll <= 40) then -- chose uncommon suit
			debugSuits("Uncommon suit:")
			tempTable = SurvivorRandomSuits["Uncommon"]
		else -- chose common suit
			debugSuits("Common suit:")
			tempTable = SurvivorRandomSuits["Common"]
			randomize = false
		end
	elseif SS:getX() >= Riverside[1] and SS:getX() <= Riverside[2] and SS:getY() >= Riverside[3] and SS:getY() <= Riverside[4] then
		if(roll == 1) then -- choose legendary suit
			debugSuits("Legendary suit:")
			tempTable = SurvivorRandomSuits["Legendary"]
		elseif(roll <= 5) then -- choose veryrare suit
			debugSuits("VeryRare suit:")
			tempTable = SurvivorRandomSuits["VeryRare"]
		elseif(roll <= 15) then -- choose rare suit
			debugSuits("Rare suit:")
			tempTable = SurvivorRandomSuits["RareRS"]
		elseif(roll <= 25) then -- chose normal suit
			debugSuits("Normal suit:")
			tempTable = SurvivorRandomSuits["Normal"]
		elseif(roll <= 40) then -- chose uncommon suit
			debugSuits("Uncommon suit:")
			tempTable = SurvivorRandomSuits["Uncommon"]
		else -- chose common suit
			debugSuits("Common suit:")
			tempTable = SurvivorRandomSuits["Common"]
			randomize = false
		end
	elseif SS:getX() >= Muldraugh[1] and SS:getX() <= Muldraugh[2] and SS:getY() >= Muldraugh[3] and SS:getY() <= Muldraugh[4] then
		if(roll == 1) then -- choose legendary suit
			debugSuits("Legendary suit:")
			tempTable = SurvivorRandomSuits["Legendary"]
		elseif(roll <= 5) then -- choose veryrare suit
			debugSuits("VeryRare suit:")
			tempTable = SurvivorRandomSuits["VeryRare"]
		elseif(roll <= 15) then -- choose rare suit
			debugSuits("Rare suit:")
			tempTable = SurvivorRandomSuits["RareMD"]
		elseif(roll <= 25) then -- chose normal suit
			debugSuits("Normal suit:")
			tempTable = SurvivorRandomSuits["Normal"]
		elseif(roll <= 40) then -- chose uncommon suit
			debugSuits("Uncommon suit:")
			tempTable = SurvivorRandomSuits["Uncommon"]
		else -- chose common suit
			debugSuits("Common suit:")
			tempTable = SurvivorRandomSuits["Common"]
			randomize = false
		end
	elseif SS:getX() >= WestPoint[1] and SS:getX() <= WestPoint[2] and SS:getY() >= WestPoint[3] and SS:getY() <= WestPoint[4] then
		if(roll == 1) then -- choose legendary suit
			debugSuits("Legendary suit:")
			tempTable = SurvivorRandomSuits["Legendary"]
		elseif(roll <= 5) then -- choose veryrare suit
			debugSuits("VeryRare suit:")
			tempTable = SurvivorRandomSuits["VeryRare"]
		elseif(roll <= 15) then -- choose rare suit
			debugSuits("Rare suit:")
			tempTable = SurvivorRandomSuits["RareWP"]
		elseif(roll <= 25) then -- chose normal suit
			debugSuits("Normal suit:")
			tempTable = SurvivorRandomSuits["Normal"]
		elseif(roll <= 40) then -- chose uncommon suit
			debugSuits("Uncommon suit:")
			tempTable = SurvivorRandomSuits["Uncommon"]
		else -- chose common suit
			debugSuits("Common suit:")
			tempTable = SurvivorRandomSuits["Common"]
			randomize = false
		end
	elseif SS:getX() >= LPD1[1] and SS:getX() <= LPD1[2] and SS:getY() >= LPD1[3] and SS:getY() <= LPD1[4] then
		if(roll == 1) then -- choose legendary suit
			debugSuits("Legendary suit:")
			tempTable = SurvivorRandomSuits["Legendary"]
		elseif(roll <= 5) then -- choose veryrare suit
			debugSuits("VeryRare suit:")
			tempTable = SurvivorRandomSuits["VeryRare"]
		elseif(roll <= 15) then -- choose rare suit
			debugSuits("Rare suit:")
			tempTable = SurvivorRandomSuits["RareLV"]
		elseif(roll <= 25) then -- chose normal suit
			debugSuits("Normal suit:")
			tempTable = SurvivorRandomSuits["Normal"]
		elseif(roll <= 40) then -- chose uncommon suit
			debugSuits("Uncommon suit:")
			tempTable = SurvivorRandomSuits["Uncommon"]
		else -- chose common suit
			debugSuits("Common suit:")
			tempTable = SurvivorRandomSuits["Common"]
			randomize = false
		end
	elseif SS:getX() >= LPD2[1] and SS:getX() <= LPD2[2] and SS:getY() >= LPD2[3] and SS:getY() <= LPD2[4] then
		if(roll == 1) then -- choose legendary suit
			debugSuits("Legendary suit:")
			tempTable = SurvivorRandomSuits["Legendary"]
		elseif(roll <= 5) then -- choose veryrare suit
			debugSuits("VeryRare suit:")
			tempTable = SurvivorRandomSuits["VeryRare"]
		elseif(roll <= 15) then -- choose rare suit
			debugSuits("Rare suit:")
			tempTable = SurvivorRandomSuits["RareLV"]
		elseif(roll <= 25) then -- chose normal suit
			debugSuits("Normal suit:")
			tempTable = SurvivorRandomSuits["Normal"]
		elseif(roll <= 40) then -- chose uncommon suit
			debugSuits("Uncommon suit:")
			tempTable = SurvivorRandomSuits["Uncommon"]
		else -- chose common suit
			debugSuits("Common suit:")
			tempTable = SurvivorRandomSuits["Common"]
			randomize = false
		end
	elseif SS:getX() >= LPD3[1] and SS:getX() <= LPD3[2] and SS:getY() >= LPD3[3] and SS:getY() <= LPD3[4] then
		if(roll == 1) then -- choose legendary suit
			debugSuits("Legendary suit:")
			tempTable = SurvivorRandomSuits["Legendary"]
		elseif(roll <= 5) then -- choose veryrare suit
			debugSuits("VeryRare suit:")
			tempTable = SurvivorRandomSuits["VeryRare"]
		elseif(roll <= 15) then -- choose rare suit
			debugSuits("Rare suit:")
			tempTable = SurvivorRandomSuits["RareLV"]
		elseif(roll <= 25) then -- chose normal suit
			debugSuits("Normal suit:")
			tempTable = SurvivorRandomSuits["Normal"]
		elseif(roll <= 40) then -- chose uncommon suit
			debugSuits("Uncommon suit:")
			tempTable = SurvivorRandomSuits["Uncommon"]
		else -- chose common suit
			debugSuits("Common suit:")
			tempTable = SurvivorRandomSuits["Common"]
			randomize = false
		end
	elseif SS:getX() >= JCPD1[1] and SS:getX() <= JCPD1[2] and SS:getY() >= JCPD1[3] and SS:getY() <= JCPD1[4] then
		if(roll == 1) then -- choose legendary suit
			debugSuits("Legendary suit:")
			tempTable = SurvivorRandomSuits["Legendary"]
		elseif(roll <= 5) then -- choose veryrare suit
			debugSuits("VeryRare suit:")
			tempTable = SurvivorRandomSuits["VeryRare"]
		elseif(roll <= 15) then -- choose rare suit
			debugSuits("Rare suit:")
			tempTable = SurvivorRandomSuits["RareJCPD"]
		elseif(roll <= 25) then -- chose normal suit
			debugSuits("Normal suit:")
			tempTable = SurvivorRandomSuits["Normal"]
		elseif(roll <= 40) then -- chose uncommon suit
			debugSuits("Uncommon suit:")
			tempTable = SurvivorRandomSuits["Uncommon"]
		else -- chose common suit
			debugSuits("Common suit:")
			tempTable = SurvivorRandomSuits["Common"]
			randomize = false
		end
	elseif SS:getX() >= JCPD2[1] and SS:getX() <= JCPD2[2] and SS:getY() >= JCPD2[3] and SS:getY() <= JCPD2[4] then
		if(roll == 1) then -- choose legendary suit
			debugSuits("Legendary suit:")
			tempTable = SurvivorRandomSuits["Legendary"]
		elseif(roll <= 5) then -- choose veryrare suit
			debugSuits("VeryRare suit:")
			tempTable = SurvivorRandomSuits["VeryRare"]
		elseif(roll <= 15) then -- choose rare suit
			debugSuits("Rare suit:")
			tempTable = SurvivorRandomSuits["RareJCPD"]
		elseif(roll <= 25) then -- chose normal suit
			debugSuits("Normal suit:")
			tempTable = SurvivorRandomSuits["Normal"]
		elseif(roll <= 40) then -- chose uncommon suit
			debugSuits("Uncommon suit:")
			tempTable = SurvivorRandomSuits["Uncommon"]
		else -- chose common suit
			debugSuits("Common suit:")
			tempTable = SurvivorRandomSuits["Common"]
			randomize = false
		end
	elseif SS:getX() >= JCSD1[1] and SS:getX() <= JCSD1[2] and SS:getY() >= JCSD1[3] and SS:getY() <= JCSD1[4] then
		if(roll == 1) then -- choose legendary suit
			debugSuits("Legendary suit:")
			tempTable = SurvivorRandomSuits["Legendary"]
		elseif(roll <= 5) then -- choose veryrare suit
			debugSuits("VeryRare suit:")
			tempTable = SurvivorRandomSuits["VeryRare"]
		elseif(roll <= 15) then -- choose rare suit
			debugSuits("Rare suit:")
			tempTable = SurvivorRandomSuits["RareJCSD"]
		elseif(roll <= 25) then -- chose normal suit
			debugSuits("Normal suit:")
			tempTable = SurvivorRandomSuits["Normal"]
		elseif(roll <= 40) then -- chose uncommon suit
			debugSuits("Uncommon suit:")
			tempTable = SurvivorRandomSuits["Uncommon"]
		else -- chose common suit
			debugSuits("Common suit:")
			tempTable = SurvivorRandomSuits["Common"]
			randomize = false
		end
	elseif SS:getX() >= JCSD2[1] and SS:getX() <= JCSD2[2] and SS:getY() >= JCSD2[3] and SS:getY() <= JCSD2[4] then
		if(roll == 1) then -- choose legendary suit
			debugSuits("Legendary suit:")
			tempTable = SurvivorRandomSuits["Legendary"]
		elseif(roll <= 5) then -- choose veryrare suit
			debugSuits("VeryRare suit:")
			tempTable = SurvivorRandomSuits["VeryRare"]
		elseif(roll <= 15) then -- choose rare suit
			debugSuits("Rare suit:")
			tempTable = SurvivorRandomSuits["RareJCSD"]
		elseif(roll <= 25) then -- chose normal suit
			debugSuits("Normal suit:")
			tempTable = SurvivorRandomSuits["Normal"]
		elseif(roll <= 40) then -- chose uncommon suit
			debugSuits("Uncommon suit:")
			tempTable = SurvivorRandomSuits["Uncommon"]
		else -- chose common suit
			debugSuits("Common suit:")
			tempTable = SurvivorRandomSuits["Common"]
			randomize = false
		end
	elseif SS:getX() >= JCSD3[1] and SS:getX() <= JCSD3[2] and SS:getY() >= JCSD3[3] and SS:getY() <= JCSD3[4] then
		if(roll == 1) then -- choose legendary suit
			debugSuits("Legendary suit:")
			tempTable = SurvivorRandomSuits["Legendary"]
		elseif(roll <= 5) then -- choose veryrare suit
			debugSuits("VeryRare suit:")
			tempTable = SurvivorRandomSuits["VeryRare"]
		elseif(roll <= 15) then -- choose rare suit
			debugSuits("Rare suit:")
			tempTable = SurvivorRandomSuits["RareJCSD"]
		elseif(roll <= 25) then -- chose normal suit
			debugSuits("Normal suit:")
			tempTable = SurvivorRandomSuits["Normal"]
		elseif(roll <= 40) then -- chose uncommon suit
			debugSuits("Uncommon suit:")
			tempTable = SurvivorRandomSuits["Uncommon"]
		else -- chose common suit
			debugSuits("Common suit:")
			tempTable = SurvivorRandomSuits["Common"]
			randomize = false
		end
	elseif (SS:getX() >= RCR[1]) and (SS:getX() <= RCR[2]) and (SS:getY() >= RCR[3]) and (SS:getY() <= RCR[4]) then
		if isModEnabled("RavenCreek") then
			if(roll == 1) then -- choose legendary suit
				debugSuits("Legendary suit:")
				tempTable = SurvivorRandomSuits["Legendary"]
			elseif(roll <= 5) then -- choose veryrare suit
				debugSuits("VeryRare suit:")
				tempTable = SurvivorRandomSuits["VeryRare"]
			elseif(roll <= 15) then -- choose rare suit
				debugSuits("Rare suit:")
				tempTable = SurvivorRandomSuits["RareRCR"]
			elseif(roll <= 25) then -- chose normal suit
				debugSuits("Normal suit:")
				tempTable = SurvivorRandomSuits["Normal"]
			elseif(roll <= 40) then -- chose uncommon suit
				debugSuits("Uncommon suit:")
				tempTable = SurvivorRandomSuits["Uncommon"]
			else -- chose common suit
				debugSuits("Common suit:")
				tempTable = SurvivorRandomSuits["Common"]
				randomize = false
			end
		elseif not isModEnabled("RavenCreek") then
			if(roll == 1) then -- choose legendary suit
				debugSuits("Legendary suit:")
				tempTable = SurvivorRandomSuits["Legendary"]
			elseif(roll <= 5) then -- choose veryrare suit
				debugSuits("VeryRare suit:")
				tempTable = SurvivorRandomSuits["VeryRare"]
			elseif(roll <= 15) then -- choose rare suit
				debugSuits("Rare suit:")
				tempTable = SurvivorRandomSuits["Rare"]
			elseif(roll <= 25) then -- chose normal suit
				debugSuits("Normal suit:")
				tempTable = SurvivorRandomSuits["Normal"]
			elseif(roll <= 40) then -- chose uncommon suit
				debugSuits("Uncommon suit:")
				tempTable = SurvivorRandomSuits["Uncommon"]
			else -- chose common suit
				debugSuits("Common suit:")
				tempTable = SurvivorRandomSuits["Common"]
				randomize = false
			end
		end
	else
		if(roll == 1) then -- choose legendary suit
			debugSuits("Legendary suit:")
			tempTable = SurvivorRandomSuits["Legendary"]
		elseif(roll <= 5) then -- choose veryrare suit
			debugSuits("VeryRare suit:")
			tempTable = SurvivorRandomSuits["VeryRare"]
		elseif(roll <= 15) then -- choose rare suit
			debugSuits("Rare suit:")
			tempTable = SurvivorRandomSuits["Rare"]
		elseif(roll <= 25) then -- chose normal suit
			debugSuits("Normal suit:")
			tempTable = SurvivorRandomSuits["Normal"]
		elseif(roll <= 40) then -- chose uncommon suit
			debugSuits("Uncommon suit:")
			tempTable = SurvivorRandomSuits["Uncommon"]
		else -- chose common suit
			debugSuits("Common suit:")
			tempTable = SurvivorRandomSuits["Common"]
			randomize = false
		end
	end

	local result = table.randFrom(tempTable)

	while (string.sub(result, -1) == "F" and not SS.player:isFemale()) or (string.sub(result, -1) == "M" and SS.player:isFemale()) do
		debugSuits("Wrong gender " .. result .. " (it's only 1993 and KY isn't woke yet)")
		result = table.randFrom(tempTable)
	end
	debugSuits("random key result is: "..tostring(result))

	local suitTable = tempTable[result]
	for i=1, #suitTable do
		if(suitTable[i] ~= nil) then
			debugSuits("WearThis: " .. tostring(suitTable[i]))
			SS:WearThis(suitTable[i])
		end
	end

	if randomize then
		for i=1, ZombRand(0, 3) do
			tempTable = SurvivorRandomSuits[table.randFrom(SurvivorRandomSuits)]
			local result = table.randFrom(tempTable)
			local suitTable = tempTable[result]
			item = suitTable[ZombRand(1, #suitTable)]
			debugSuits("WearThis randomize: " .. item)
			SS:WearThis(item)
		end
	end

	debugSuits(" ----- getRandomSurvivorSuit -----")
end
