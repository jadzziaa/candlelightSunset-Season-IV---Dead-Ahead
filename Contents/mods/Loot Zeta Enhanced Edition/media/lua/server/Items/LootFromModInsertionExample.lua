-- Formato (Indumentaria, Item, Chance, Script Count, Nombre del mod).

--Indumentaria: Zombie Outfit.
--Item: The Module and Item type (If module is Base you don't need to write it).
--Chance: from 0.00000 to 100.
--Script Count: Some items have a property in scripts called count, it determines the count of items spawns. you can activate or not this feature for the item you set. (true: Spawns the item count in scripts. false not)
--Nombre del mod: The ModName (For debug extra info)
--Example:
--**************************************************************************************************--

-- require "Items/LZEEFunction"

-- function ModNameInsertLZTable()
	-- if LZFunc then
		-- LZFunc.LootZetaAddItemTable("AirCrew","ModuleName.Item",15,false,"AliceBackPack");
	-- end
-- end

-- ModNameInsertLZTable()