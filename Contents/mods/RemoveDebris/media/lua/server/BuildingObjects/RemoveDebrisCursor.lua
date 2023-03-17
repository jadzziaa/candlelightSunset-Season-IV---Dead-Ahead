RemoveDebrisCursor = ISBuildingObject:derive("RemoveDebrisCursor")

local function predicateNotBroken(item)
	return not item:isBroken() --and item:hasTag("DigPlow")
end

function RemoveDebrisCursor:create(x, y, z, north, sprite)
	local player = self.character
	local inventory = player:getInventory()
	local square = getWorld():getCell():getGridSquare(x, y, z)
	local item = inventory:getFirstTypeEvalRecurse("HandShovel", predicateNotBroken);
	if luautils.walkAdj(player, square, true) then
		ISWorldObjectContextMenu.transferIfNeeded(player, item)
		luautils.equipItems(player, item)
		ISTimedActionQueue.add(RemoveDebrisAction:new(player, square, 150));
	end

end

function RemoveDebrisCursor:isValid(square)
	local player = self.character
	local playerInv = player:getInventory()
	local workingCount = playerInv:getCountTypeEvalRecurse("HandShovel", predicateNotBroken)
	for i=0,square:getObjects():size()-1 do
		local object = square:getObjects():get(i);
        
        	if object then
	            if object:getTextureName() and luautils.stringStarts(object:getTextureName(), "d_generic_1") then
			if workingCount > 0 then 
				return true
			end
	            else
	                local attached = object:getAttachedAnimSprite()
        	        if attached then
                	    for n=1,attached:size() do
                        	local sprite = attached:get(n-1)
	                        if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and 
        	                    luautils.stringStarts(sprite:getParentSprite():getName(), "d_generic_1") then
				    if workingCount > 0 then 
					return true
		                    end
				end
			    end
		    	end
                    end
                end
	end
    
    return false
end

function RemoveDebrisCursor:render(x, y, z, square)
	if not RemoveDebrisCursor.floorSprite then
		RemoveDebrisCursor.floorSprite = IsoSprite.new()
		RemoveDebrisCursor.floorSprite:LoadFramesNoDirPageSimple('media/ui/FloorTileCursor.png')
	end
	local r,g,b,a = 0.0,1.0,0.0,0.8
	if self:isValid(square) == false then
		r = 1.0
		g = 0.0
	end
	RemoveDebrisCursor.floorSprite:RenderGhostTileColor(x, y, z, r, g, b, a)
end

function RemoveDebrisCursor:new(sprite, northSprite, character)
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

