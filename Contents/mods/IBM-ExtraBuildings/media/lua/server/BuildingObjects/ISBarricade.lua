ISBarricade = ISBuildingObject:derive("ISBarricade");

function ISBarricade:create(x, y, z, north, sprite)
	local cell = getWorld():getCell();
	self.sq = cell:getGridSquare(x, y, z);
	self.javaObject = IsoThumpable.new(cell, self.sq, sprite, north, self);
	buildUtil.setInfo(self.javaObject, self);
	buildUtil.consumeMaterial(self);
	-- the wooden wall have 100 base health + 100 per carpentry lvl
	self.javaObject:setMaxHealth(self:getHealth());
	self.javaObject:setHealth(self.javaObject:getMaxHealth());
	-- the sound that will be played when our door frame will be broken
	self.javaObject:setBreakSound("BreakObject");
	-- add the item to the ground
    self.sq:AddSpecialObject(self.javaObject);
	
	self.javaObject:transmitCompleteItemToServer();
end

function ISBarricade:removeFromGround(square)
	for i = 0, square:getSpecialObjects():size() do
		local thump = square:getSpecialObjects():get(i);
		if instanceof(thump, "IsoThumpable") then
			square:transmitRemoveItemFromSquare(thump);
		end
	end
end

function ISBarricade:new(name)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o.name = name;
	o.canBarricade = false;
	o.dismantable = true;
	o.blockAllTheSquare = true;
	o.canBeAlwaysPlaced = true;
	o.buildLow = true;
	return o;
end

-- return the health of the new barricade
function ISBarricade:getHealth()
	-- Adjust into sandbox vars
	local smallHealth = 100
	local mediumHealth = 250
	local largeHealth = 500
	
	if self.name == "Small Barricade" then
		return smallHealth + buildUtil.getWoodHealth(self);
	elseif self.name == "Medium Barricade" then
		return mediumHealth + buildUtil.getWoodHealth(self);
	elseif self.name == "Large Barricade" then
		return largeHealth + buildUtil.getWoodHealth(self);
	else
		return 100 + buildUtil.getWoodHealth(self);
	end
end

function ISBarricade:isValid(square)
	if not ISBuildingObject.isValid(self, square) then return false; end
	if not buildUtil.canBePlace(self, square) then return false end
	if self.needToBeAgainstWall then
        for i=0,square:getObjects():size()-1 do
           local obj = square:getObjects():get(i);
           if (self.north and obj:getProperties():Is("WallN")) or (not self.north and obj:getProperties():Is("WallW")) then
               return true;
           end
        end
        return false;
    else
        if buildUtil.stairIsBlockingPlacement( square, true ) then return false; end
    end
    return true;
end

function ISBarricade:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square)
end
