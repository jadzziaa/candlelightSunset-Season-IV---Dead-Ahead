require 'Items/SuburbsDistributions'
require 'Items/ProceduralDistributions'

local VHSTapeTable = {
	name = "CrateVHSTapes",
	min = 0,
	max = 2,
	weightChance = 100,
}

local function popTraverseTableRecursively(_table)
	local found = false
	if _table ~= nil then
		for k, v in pairs(_table) do
			if _table[k] ~= nil then
				if type(_table[k]) == "table" then
					if type(k) == "string" and k == "items" then
						found = false
						for k2, v2 in pairs(_table[k]) do
							if string.find(v2, "Pop") and not string.find(v2, "Empty") then
								found = true
							end
						end
						
						if found == true then
							--table.insert(_table[k], "MoreTapes.Braundo")
							--table.insert(_table[k], 2)
						end
					else
						if type(_table[k]) == "table" then
							popTraverseTableRecursively(_table[k])
						end
					end
				end
			end
		end
	end
end

local function printTable()
	debugLuaTable(SuburbsDistributions, -5)
end

local function addPopToProceduralList()
	local _list = ProceduralDistributions
	local found = false
	if _list ~= nil then
		for k, v in pairs(_list.list) do
			found = false
			for k2, v2 in pairs(_list.list[k].items) do
				if string.find(v2, "Pop") and not string.find(v2, "Empty") then
					found = true
				end
			end
			
			if found == true then
				table.insert(_list.list[k].items, "MoreTapes.Braundo")
				table.insert(_list.list[k].items, 2)
			end
		end
	end
end

local function addTapesToProceduralList()
	local _list = ProceduralDistributions
	
	local found = false
	if _list ~= nil then
		for k, v in pairs(_list.list) do
			found = false
			if string.find(k, "ElectronicsStoreMisc") or string.find(k, "BookstoreMisc") or string.find(k, "GigamartHouseElectronics") or string.find(k, "LibraryBooks") or string.find(k, "BookstoreBooks") then
				found = true
			end
			
			if found == true then
				table.insert(_list.list[k].items, "Base.VHS_Retail")
				table.insert(_list.list[k].items, 10)
				table.insert(_list.list[k].items, "Base.VHS_Home")
				table.insert(_list.list[k].items, 10)
			end
		end
	end
end

	local start = 1;
	local count = 0;
	local basegameIndex = 0;
	
	for	_ in pairs(Distributions) do
		count = count + 1;
	end
	
	for i = start, count do
		local _table = Distributions[i];
		debugLuaTable(_table)
		for k, v in pairs(_table) do
			if string.find(k, "warehouse") then
				basegameIndex = i
			end
		end
	end
	
	local _table = Distributions[basegameIndex]
	
	table.insert(_table["warehouse"]["crate"]["procList"], VHSTapeTable)
	table.insert(_table["storageunit"]["crate"]["procList"], VHSTapeTable)
	table.insert(_table["shed"]["crate"]["procList"], VHSTapeTable)

--popTraverseTableRecursively(Distributions[1])
--printTable()

--Events.OnPreDistributionMerge.Add(addPopToProceduralList)
Events.OnPreDistributionMerge.Add(addTapesToProceduralList)