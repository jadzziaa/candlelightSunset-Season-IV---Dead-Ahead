ISGarage4Door = ISBuildingObject:derive("ISGarage4Door");

function ISGarage4Door:create(x, y, z, north, sprite)
	local cell = getWorld():getCell();
	local square = cell:getGridSquare(x, y, z);
	local xa, ya = self:getSquare2Pos(square, north)
	local xb, yb = self:getSquare3Pos(square, north)
	local xc, yc = self:getSquare4Pos(square, north)
	local spriteAName = self.sprite2;
	local spriteBName = self.sprite3;
	local spriteCName = self.sprite4;
	
	-- if we're not north we also change our sprite
	if self.north then
		spriteAName = self.northSprite2;
		spriteBName = self.northSprite3;
		spriteCName = self.northSprite4;
	end

	self:addDoorPart(x,y,z,north,sprite,1);
	self:addDoorPart(xa,ya,z,north,spriteAName,2);
	self:addDoorPart(xb,yb,z,north,spriteBName,2);
	self:addDoorPart(xc,yc,z,north,spriteCName,3);
end

function ISGarage4Door:new(sprite, spriteIndex)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite .. spriteIndex);
	o.sprite2 = sprite .. spriteIndex+1;
	o.sprite3 = sprite .. spriteIndex+1;
	o.sprite4 = sprite .. spriteIndex+2;
	o:setNorthSprite(sprite .. spriteIndex+3);
	o.northSprite2 = sprite .. spriteIndex+4;
	o.northSprite3 = sprite .. spriteIndex+4;
	o.northSprite4 = sprite .. spriteIndex+5;
	o.thumpDmg = 5;
	o.name = "Garage Door";
	o.isWallLike = false;
	o.isDoor = true;
	return o;
end

function ISGarage4Door:addDoorPart(x,y,z,north,sprite,index)
	local cell = getWorld():getCell();
	self.sq = cell:getGridSquare(x, y, z);
	if self:partExists(self.sq, index) then return end
	self.javaObject = IsoDoor.new(cell, self.sq, sprite, north, self)
	self.javaObject:setHealth(self:getHealth())
	-- buildUtil.setInfo(self.javaObject, self);
	self:overrideModData(index);
	self.sq:AddSpecialObject(self.javaObject)
	
	local consumedItems = {};
	if index == 1 then consumedItems = buildUtil.consumeMaterial(self);	end
	
	-- set the key id if we had one
	for _,item in ipairs(consumedItems) do
		if item:getType() == "Doorknob" and item:getKeyId() ~= -1 then
			self.javaObject:setKeyId(item:getKeyId(), false)
		end
	end
	self.javaObject:transmitCompleteItemToServer();
end

function ISGarage4Door:overrideModData(spriteIndex)
	local modData = self.javaObject:getModData();
	local modData2 = copyTable(modData);
	for k,v in pairs(modData2) do
		if luautils.stringStarts(k, "need:") then
			local itemFullType = luautils.split(k, ":")[2];
			local count = tonumber(v);
			if itemFullType == "Base.Doorknob" then
				if spriteIndex == 2 or spriteIndex == 3 then
					modData[k] = "1";
				else
					modData[k] = nil;
				end
			elseif itemFullType == "Base.Hinge" then
				if spriteIndex == 1 or spriteIndex == 4 then
					modData[k] = tostring(math.floor(count / 2 + 0.01));
				else
					modData[k] = nil;
				end
			else
				local count2 = math.floor(count / 4 + 0.01);
				if (count % 4 ~= 0) and (spriteIndex <= count % 4) then
					count2 = count2 + 1;
				end
				if count2 == 0 then
					modData[k] = nil;
				else
					modData[k] = tostring(count2);
				end
			end
		end
	end
end

-- return the health of the new wall, it's 500 + 50 per metalwelding lvl
function ISGarage4Door:getHealth()
	return 500 + buildUtil.getWoodHealth(self);
end

function ISGarage4Door:isValid(square)
	if not self:haveMaterial(square) then return false end
	if not square:hasFloor(self.north) then return false; end
	if not self:partExists(square, 1) and not square:isFreeOrMidair(false) then
		return false
	end
	if square:isVehicleIntersecting() then return false end

	local xa, ya = self:getSquare2Pos(square, self.north)
	local xb, yb = self:getSquare3Pos(square, self.north)
	local xc, yc = self:getSquare4Pos(square, self.north)
	local squareA = getCell():getGridSquare(xa, ya, square:getZ())
	local squareB = getCell():getGridSquare(xb, yb, square:getZ())
	local squareC = getCell():getGridSquare(xc, yc, square:getZ())

	if (not squareA) or (not squareB) or (not squareC) then return false end

	local existsA = self:partExists(squareA, 2)
	local existsB = self:partExists(squareB, 3)
	local existsC = self:partExists(squareC, 4)

	if not existsA and not buildUtil.canBePlace(self, squareA) then return false end
	if not existsB and not buildUtil.canBePlace(self, squareB) then return false end
	if not existsC and not buildUtil.canBePlace(self, squareC) then return false end
	
	-- don't allow double doors inside buildings to avoid weird conflicts
	-- Allowing this as it prevented building double doors on the outer walls of buildings (to replace a destroyed garage door, for example).
	-- I don't remember what the 'weird conflicts' inside buildings were.
	-- I added a check for walls between each part in IsoDoor.ISGarage4DoorObstructed().
	if square:getBuilding() or squareA:getBuilding() or squareB:getBuilding() or squareC:getBuilding() then return false; end

	if squareA:isSomethingTo(square) then return false end
	if squareB:isSomethingTo(squareA) then return false end
	if squareC:isSomethingTo(squareB) then return false end

	if buildUtil.stairIsBlockingPlacement(square, true, self.north) then return false end
	if buildUtil.stairIsBlockingPlacement(squareA, true, self.north) then return false end
	if buildUtil.stairIsBlockingPlacement(squareB, true, self.north) then return false end
	if buildUtil.stairIsBlockingPlacement(squareC, true, self.north) then return false end

	return true;
end

-- used to render more tile for example
function ISGarage4Door:render(x, y, z, square)
	if not self:partExists(square, 1) then
		-- render the first part
		local spriteName = self:getSprite()
		local sprite = IsoSprite.new()
		sprite:LoadFramesNoDirPageSimple(spriteName)
		
		-- if the square is free and our item can be build
		local spriteFree = ISBuildingObject.isValid(self, square)
		if buildUtil.stairIsBlockingPlacement(square, true, self.north) then spriteFree = false end
		if spriteFree then
			sprite:RenderGhostTile(x, y, z);
		else
			sprite:RenderGhostTileRed(x, y, z);
		end
	end

	-- name of our 3 sprites needed for the rest of the door
	local spriteAName = self.sprite2;
	local spriteBName = self.sprite3;
	local spriteCName = self.sprite4;
	
	local spriteAFree = true;
	local spriteBFree = true;
	local spriteCFree = true;
	
	-- we get the x and y of our next tile (depend if we're placing the door north or not)
	local xa, ya = self:getSquare2Pos(square, self.north)
	local xb, yb = self:getSquare3Pos(square, self.north)
	local xc, yc = self:getSquare4Pos(square, self.north)
	
	-- if we're not north we also change our sprite
	if self.north then
		spriteName = self.northSprite;
		spriteAName = self.northSprite2;
		spriteBName = self.northSprite3;
		spriteCName = self.northSprite4;
	end

	local squareA = getCell():getGridSquare(xa, ya, z);
	if squareA == nil and getWorld():isValidSquare(xa, ya, z) then
		squareA = IsoGridSquare.new(getCell(), nil, xa, ya, z);
		getCell():ConnectNewSquare(squareA, false);
	end
	local squareB = getCell():getGridSquare(xb, yb, z);
	if squareB == nil and getWorld():isValidSquare(xb, yb, z) then
		squareB = IsoGridSquare.new(getCell(), nil, xb, yb, z);
		getCell():ConnectNewSquare(squareB, false);
	end
	local squareC = getCell():getGridSquare(xc, yc, z);
	if squareC == nil and getWorld():isValidSquare(xc, yc, z) then
		squareC = IsoGridSquare.new(getCell(), nil, xc, yc, z);
		getCell():ConnectNewSquare(squareC, false);
	end

	local existsA = self:partExists(squareA, 2)
	local existsB = self:partExists(squareB, 3)
	local existsC = self:partExists(squareC, 4)
	
	-- test if the square are free to add our door
	if not existsA and not buildUtil.canBePlace(self, squareA) then spriteAFree = false; end
	if not existsB and not buildUtil.canBePlace(self, squareB) then spriteBFree = false; end
	if not existsC and not buildUtil.canBePlace(self, squareC) then spriteCFree = false; end

	if squareA and (squareA:isSomethingTo(square) or buildUtil.stairIsBlockingPlacement(squareA, true, self.north)) then
		spriteAFree = false
	end
	if squareB and (squareB:isSomethingTo(squareA) or buildUtil.stairIsBlockingPlacement(squareB, true, self.north)) then
		spriteBFree = false
	end
	if squareC and (squareC:isSomethingTo(squareB) or buildUtil.stairIsBlockingPlacement(squareC, true, self.north)) then
		spriteCFree = false
	end

	-- render each parts
	if not existsA then
		local spriteA = IsoSprite.new();
		spriteA:LoadFramesNoDirPageSimple(spriteAName);
		if spriteAFree then
			spriteA:RenderGhostTile(xa, ya, z);
		else
			spriteA:RenderGhostTileRed(xa, ya, z);
		end
	end
	if not existsB then
		local spriteB = IsoSprite.new();
		spriteB:LoadFramesNoDirPageSimple(spriteBName);
		if spriteBFree then
			spriteB:RenderGhostTile(xb, yb, z);
		else
			spriteB:RenderGhostTileRed(xb, yb, z);
		end
	end
	if not existsC then
		local spriteC = IsoSprite.new();
		spriteC:LoadFramesNoDirPageSimple(spriteCName);
		if spriteCFree then
			spriteC:RenderGhostTile(xc, yc, z);
		else
			spriteC:RenderGhostTileRed(xc, yc, z);
		end
	end
end

function ISGarage4Door:getSquare2Pos(square, north)
	local x = square:getX()
	local y = square:getY()
	local z = square:getZ()
	if north then
		x = x + 1
	else
		y = y - 1
	end
	return x, y, z
end

function ISGarage4Door:getSquare3Pos(square, north)
	local x = square:getX()
	local y = square:getY()
	local z = square:getZ()
	if north then
		x = x + 2
	else
		y = y - 2
	end
	return x, y, z
end

function ISGarage4Door:getSquare4Pos(square, north)
	local x = square:getX()
	local y = square:getY()
	local z = square:getZ()
	if north then
		x = x + 3
	else
		y = y - 3
	end
	return x, y, z
end

function ISGarage4Door:partExists(square, index)
	local spriteName
	if self.north then
		if index == 1 then spriteName = self.northSprite
		elseif index == 2 then spriteName = self.northSprite2
		elseif index == 3 then spriteName = self.northSprite3
		else spriteName = self.northSprite4 end
	else
		if index == 1 then spriteName = self.sprite
		elseif index == 2 then spriteName = self.sprite2
		elseif index == 3 then spriteName = self.sprite3
		else spriteName = self.sprite4 end
	end
	local objects = square:getSpecialObjects()
	for i=1,objects:size() do
		local object = objects:get(i-1)
		if IsoDoor.getDoubleDoorIndex(object) == index and
				object:getNorth() == self.north and
				not object:IsOpen() and
				object:getSprite():getName() == spriteName then
			return true
		end
	end
	return false
end