require 'Items/ProceduralDistributions'

local distroList = {
	"ArmyHangarTools", 2.8, --168.02
	"ArmyStorageGuns", 5.1, --304
	"ArmySurplusMisc", 1, --117
	"ArmySurplusTools", 0.7, --42
	"BarCounterWeapon", 0.7, --210.11
	"BedroomSideTable", 0.7, --104.162
	"BurglarTools", 0.4, --126.5
	"DrugLabGuns", 1.8, --184.5
	"DrugShackTools", 0.4, --120.57
	"DrugShackWeapons", 1.2, --113.05
	"FirearmWeapons", 3.7, --220
	"GarageFirearms", 4.15, --166.8
	"GarageTools", 0.95, --138.555
	"GigamartTools", 0.4, --113.57
	"GunStoreCounter", 3.1, --200
	"GunStoreShelf", 8.5, --254
	"HuntingLockers", 3.4, --101.858
	"LockerArmyBedroom", 6.2, --185.555
	"OfficeDeskHome", 0.3, --183.662
	"PawnShopGuns", 2.1, --128
	"PoliceStorageGuns", 3.5, --205
	"PoliceLockers", 2.1, --126.61
	"PrisonGuardLockers", 1, --123.01
	"SurvivalGear", 4.4,}; --264.526
	
for i = 1, #distroList, 2 do
	table.insert(ProceduralDistributions["list"][distroList[i]].items, "Base.FirearmMaintenanceKit");
	table.insert(ProceduralDistributions["list"][distroList[i]].items, distroList[i+1] * 0.25);
	
	table.insert(ProceduralDistributions["list"][distroList[i]].items, "Base.GunsmithingTools");
	table.insert(ProceduralDistributions["list"][distroList[i]].items, distroList[i+1] * 0.125);
	
	table.insert(ProceduralDistributions["list"][distroList[i]].items, "Base.CleaningSolvent");
	table.insert(ProceduralDistributions["list"][distroList[i]].items, distroList[i+1]);		
	table.insert(ProceduralDistributions["list"][distroList[i]].items, "Base.CleaningSolvent");
	table.insert(ProceduralDistributions["list"][distroList[i]].items, distroList[i+1] * 0.5);
	table.insert(ProceduralDistributions["list"][distroList[i]].items, "Base.CleaningSolvent");
	table.insert(ProceduralDistributions["list"][distroList[i]].items, distroList[i+1] * 0.25);
	
	table.insert(ProceduralDistributions["list"][distroList[i]].items, "Base.CleaningSolventBlackLabel");
	table.insert(ProceduralDistributions["list"][distroList[i]].items, distroList[i+1] * 0.25);
	
	table.insert(ProceduralDistributions["list"][distroList[i]].items, "Base.FirearmLubricant");
	table.insert(ProceduralDistributions["list"][distroList[i]].items, distroList[i+1] * 0.5);		
	table.insert(ProceduralDistributions["list"][distroList[i]].items, "Base.FirearmLubricant");
	table.insert(ProceduralDistributions["list"][distroList[i]].items, distroList[i+1] * 0.25);
end
	
local rarityBonus = { 1, 2, 3, 4, 5};

local function AdjustRarity()
	
	local maintenanceKitRarityLevel = SandboxVars.UniversalGunRepair.MaintenanceKitRarity;
	if maintenanceKitRarityLevel == nil then
		maintenanceKitRarityLevel = 3;
		print("UniversalGunRepair: Maitenance Kit Rarity Sandbox option not found")
	end
	
	local gunsmithingToolsRarityLevel = SandboxVars.UniversalGunRepair.GunsmithingToolsRarity;
	if gunsmithingToolsRarityLevel == nil then
		gunsmithingToolsRarityLevel = 3;
		print("UniversalGunRepair: Maitenance Kit Rarity Sandbox option not found")
	end
	
	local solventRarityLevel = SandboxVars.UniversalGunRepair.SolventRarity;
	if solventRarityLevel == nil then
		solventRarityLevel = 3;
		print("UniversalGunRepair: Solvent Rarity Sandbox option not found")
	end
	
	local lubricantRarityLevel = SandboxVars.UniversalGunRepair.LubricantRarity;
	if lubricantRarityLevel == nil then
		lubricantRarityLevel = 3;
		print("UniversalGunRepair: Lubricant Rarity Sandbox option not found")
	end
	
    local itemName = ""
	for i = 1, #distroList, 2 do
		local distribution = ProceduralDistributions["list"][distroList[i]];
		for j=1, #distribution.items, 2 do
			itemName = distribution.items[j]
			if (itemName == "Base.FirearmMaintenanceKit") then
				distribution.items[j+1] = distribution.items[j+1] * rarityBonus[maintenanceKitRarityLevel];
			end
			if (itemName == "Base.GunsmithingTools") then
				distribution.items[j+1] = distribution.items[j+1] * rarityBonus[gunsmithingToolsRarityLevel];
			end
			if (itemName == "Base.CleaningSolvent") or (itemName == "Base.CleaningSolventBlackLabel") then
				distribution.items[j+1] = distribution.items[j+1] * rarityBonus[solventRarityLevel];
			end
			if (itemName == "Base.FirearmLubricant") then
				distribution.items[j+1] = distribution.items[j+1] * rarityBonus[lubricantRarityLevel];
			end
		end
	end
end

Events.OnGameStart.Add(AdjustRarity);