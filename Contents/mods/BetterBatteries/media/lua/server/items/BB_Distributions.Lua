local function AddLootToType(itemName, containerName, itemChance)
	local containerData = ProceduralDistributions.list[containerName]
    if not containerData then
        print("Container does not exist. Are you sure you typed it in correctly?")
        return
    end

	table.insert(containerData.items, itemName);
	table.insert(containerData.items, itemChance);
end

AddLootToType("HandCrank", "CrateElectronics", 2)
AddLootToType("HandCrank", "ElectronicStoreMisc", 4)
AddLootToType("HandCrank", "EngineerTools", 1)
AddLootToType("HandCrank", "StoreShelfElectronics", 3)
AddLootToType("HandCrank", "GigamartHouseElectronics", 4)
AddLootToType("MakeshiftCrank", "ImprovisedCrafts", 1)
