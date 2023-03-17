CleanAshesCursor = ISBuildingObject:derive("CleanAshesCursor")

local function predicateClearAshes(item)
	return not item:isBroken() and item:hasTag("ClearAshes")
end

function CleanAshesCursor:create(x, y, z, north, sprite)
	local square = getWorld():getCell():getGridSquare(x, y, z)
    local ashes = CleanAshesCursor:getAshesObj(square)
    if ashes then
        local playerObj = self.character
        local playerInv = playerObj:getInventory()
        if square and luautils.walkAdj(playerObj, square, true) then
            ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), predicateClearAshes, true)
            ISTimedActionQueue.add(ISClearAshes:new(playerObj, ashes, 60));
        end
    end
end

function CleanAshesCursor:getAshesObj(square)
	for i=0,square:getObjects():size()-1 do
		local object = square:getObjects():get(i);
        
        --luautils.stringStarts(object:getTextureName(), "floors_burnt")
        if object then
            if object:getTextureName() and instanceof(object, "IsoObject") and object:getSprite() then
                local spriteName = object:getSprite():getName()
                if not spriteName then
                    spriteName = object:getSpriteName()
                end
                if spriteName == 'floors_burnt_01_1' or spriteName == 'floors_burnt_01_2' then
                        return object
                end
            end
        end
	end
    return false
end

function CleanAshesCursor:isValid(square)
    local playerObj = self.character
    local playerInv = playerObj:getInventory()
    if square then 
        if playerInv:containsEvalRecurse(predicateClearAshes) then
            return CleanAshesCursor:getAshesObj(square)
        end
    end
    
    return false
end

function CleanAshesCursor:render(x, y, z, square)
	if not CleanAshesCursor.floorSprite then
		CleanAshesCursor.floorSprite = IsoSprite.new()
		CleanAshesCursor.floorSprite:LoadFramesNoDirPageSimple('media/ui/FloorTileCursor.png')
	end
	local r,g,b,a = 0.0,1.0,0.0,0.8
	if self:isValid(square) == false then
		r = 1.0
		g = 0.0
	end
	CleanAshesCursor.floorSprite:RenderGhostTileColor(x, y, z, r, g, b, a)
end

function CleanAshesCursor:new(sprite, northSprite, character)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o:init()
	o:setSprite(sprite)
	o:setNorthSprite(northSprite)
	o.character = character
	o.player = character:getPlayerNum()
	o.noNeedHammer = true
	o.skipBuildAction = true
	return o
end

