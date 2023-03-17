--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

ISMakePathCursor = ISBuildingObject:derive("ISMakePathCursor")

local function predicateShovel(item)
	return not item:isBroken() and item:hasTag("TakeDirt")
end

function ISMakePathCursor:create(x, y, z, north, sprite)
	local playerObj = self.character
	local square = getWorld():getCell():getGridSquare(x, y, z)
	local groundType,object = self:getDirtGravelSand(square)
	if luautils.walkAdj(playerObj, square, true) then
		ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), predicateShovel, true, true)
		ISTimedActionQueue.add(ISMakePath:new(playerObj, object, "blends_natural_01_64"))
	end
end

function ISMakePathCursor:new(sprite, northSprite, character, groundType)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o:init()
	o:setSprite(sprite)
	o:setNorthSprite(northSprite)
	o.groundType = groundType
	o.character = character
	o.player = character:getPlayerNum()
	o.noNeedHammer = true
	o.skipBuildAction = true
	return o
end

function ISMakePathCursor:isValid(square)
	local groundType,object = self:getDirtGravelSand(square)
	if groundType == "dirt" or groundType == "gravel" or groundType == "sand" then
		return true
	else
		return false
	end
end

function ISMakePathCursor:render(x, y, z, square)
	local groundType,object = self:getDirtGravelSand(square)
	if not ISMakePathCursor.floorSprite then
		ISMakePathCursor.floorSprite = IsoSprite.new()
		ISMakePathCursor.floorSprite:LoadFramesNoDirPageSimple('media/ui/FloorTileCursor.png')
	end
	local r,g,b,a = 0.0,1.0,0.0,0.8
	if not self:isValid(square) then
		r = 1.0
		g = 0.0
	end
	ISMakePathCursor.floorSprite:RenderGhostTileColor(x, y, z, r, g, b, a)
end

function ISMakePathCursor.GetDirtGravelSand(square)
	for i=1,square:getObjects():size() do
		local obj = square:getObjects():get(i-1)
		if obj:hasModData() and obj:getModData().shovelled then
			-- skip already-shovelled squares
		elseif not isServer() and CFarmingSystem.instance:getLuaObjectOnSquare(square) then
			-- skip dirt with farm plants
		elseif obj:getSprite() and obj:getSprite():getName() then
			local spriteName = obj:getSprite():getName()
			if spriteName == "floors_exterior_natural_01_13" or
					spriteName == "blends_street_01_55" or
					spriteName == "blends_street_01_54" or
					spriteName == "blends_street_01_53" or
					spriteName == "blends_street_01_48" then
				return "gravel",obj
			end
			if spriteName == "blends_natural_01_0" or
						spriteName == "blends_natural_01_5" or
						spriteName == "blends_natural_01_6" or
						spriteName == "blends_natural_01_7" or
						spriteName == "floors_exterior_natural_01_24" then
				return "sand",obj
			end
			if luautils.stringStarts(spriteName, "blends_natural_01_") or
					luautils.stringStarts(spriteName, "floors_exterior_natural") then
				return "dirt",obj
			end
		end
	end
	return nil
end

function ISMakePathCursor:getDirtGravelSand(square)
	return ISMakePathCursor.GetDirtGravelSand(square)
end