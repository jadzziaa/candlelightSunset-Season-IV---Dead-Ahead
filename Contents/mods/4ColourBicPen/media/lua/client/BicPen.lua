require "ISUI/ISMap"
require "ISUI/Maps/ISTextBoxMap"
require "ISUI/Maps/ISWorldMapSymbols"

local oldCanWrite = ISMap.canWrite
function ISMap:canWrite(...)
	local inv = self.character:getInventory()
	return inv:contains("BicPen", true) or oldCanWrite(self, ...)
end

local shouldReplace = { ["Base.Pen"] = true, ["Base.RedPen"] = true, ["Base.BluePen"] = true }

local function doReplace(inv, v)
	if inv and inv:containsTypeRecurse("BicPen.BicPen") then
		for _,elem in ipairs(v) do
			elem.item = shouldReplace[elem.item] and "BicPen.BicPen" or elem.item
		end
	end
end

local function alreadyInserted(tbl)
	for i = #tbl, 1, -1 do -- reverse search to optimise search time, since we're usually last.
		if tbl[i].bicpen then
			return true
		end
	end
end

local function makeNewIndex(self, oldMt)
	return function(t, k, v)
		if k == "colorButtonInfo" then
			doReplace(self and self.character and self.character:getInventory() or nil, v)
			if not alreadyInserted(v) then
				table.insert(v, {item="BicPen.BicPen", colorInfo=ColorInfo.new(0, 1, 0, 1), tooltip=getText("Tooltip_Map_NeedBicPen"), bicpen = true })
			end
		end
		if oldMt then
			oldMt(t, k, v)
		else
			rawset(t, k, v)
		end
	end
end

local oldInitialise = ISTextBoxMap.initialise
function ISTextBoxMap:initialise(...)
	local mt = getmetatable(self) or {}
	mt.__newindex = makeNewIndex(self, mt.__newindex)
	setmetatable(self, mt)
	return oldInitialise(self, ...)
end

local oldCreateChildren = ISWorldMapSymbols.createChildren
function ISWorldMapSymbols:createChildren(...)
	local mt = getmetatable(self) or {}
	mt.__newindex = makeNewIndex(nil, mt.__newindex)
	setmetatable(self, mt)
	return oldCreateChildren(self, ...)
end

local oldCheckInventory = ISWorldMapSymbols.checkInventory
function ISWorldMapSymbols:checkInventory(...)
	local tbl = {}
	for _,v in ipairs(self.colorButtons) do
		table.insert(tbl, v.buttonInfo)
	end
	doReplace(self.character and self.character:getInventory() or nil, tbl)
	return oldCheckInventory(self, ...)
end

local oldcanWrite2 = ISWorldMapSymbols.canWrite
function ISWorldMapSymbols:canWrite(...)
	doReplace(self.character and self.character:getInventory() or nil, self.colorButtonInfo)
	return oldcanWrite2(self, ...)
end

local oldCanErase = ISWorldMapSymbols.canErase
function ISWorldMapSymbols:canErase(...)
	return self.character and self.character:getInventory():containsTypeRecurse("Base.Pencil") or oldCanErase(self, ...)
end

Events.OnGameTimeLoaded.Add(function()
	local recipe = getScriptManager():getModule('Base'):getRecipe('Transcribe Journal')
	if recipe then
		local sources = recipe:getSource()
		for i = 0, sources:size() - 1 do
			local items = sources:get(i):getItems()
			for j = 0, items:size() - 1 do
				if items:get(j) == 'Base.Pen' then
					items:add('BicPen.BicPen')
					return
				end
			end
		end
	end
end)