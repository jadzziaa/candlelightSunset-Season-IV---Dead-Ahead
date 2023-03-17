require('TimedActions/ISBaseTimedAction');

RepairWallCrackAction = ISBaseTimedAction:derive("RepairWallCrackAction");

function RepairWallCrackAction:isValid()
	local playerInv = self.character:getInventory()
	return ISBuildMenu.cheat or playerInv:contains("BucketPlasterFull") and (playerInv:contains("HandShovel"));
end

function RepairWallCrackAction:waitToStart()
	self.character:faceLocation(self.square:getX(), self.square:getY())
	return self.character:shouldBeTurning()
end

function RepairWallCrackAction:update()
	self.character:faceLocation(self.square:getX(), self.square:getY())
    self.character:setMetabolicTarget(Metabolics.MediumWork);
end

function RepairWallCrackAction:start()
	self.sound = self.character:playSound("Plastering")
	local primaryItem = self.character:getPrimaryHandItem()
	if primaryItem:getType() == "HandShovel" then
		self:setActionAnim("Loot")
		self.character:SetVariable("LootPosition", "Mid")
		self:setOverrideHandModels("HandShovel", nil);
	else
		self:setActionAnim("Loot");
		self.character:SetVariable("LootPosition", "Low");
		self:setOverrideHandModels(nil, "HandShovel");
	end
	self.character:reportEvent("EventRepairWallCrack");
end

function RepairWallCrackAction:stop()
	if self.sound then self.character:stopOrTriggerSound(self.sound) end
    ISBaseTimedAction.stop(self);
end

function RepairWallCrackAction:perform()
	if self.sound then self.character:stopOrTriggerSound(self.sound) end
    local plasterBucket = self.character:getInventory():getItemFromType("BucketPlasterFull");
	local args = { x = self.square:getX(), y = self.square:getY(), z = self.square:getZ() }
    sendClientCommand(self.character, 'RepairWallCrack', 'RepairWallCrackCommand', args)

	plasterBucket:Use();

    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function RepairWallCrackAction:new(character, square, plasterBucket)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.plasterBucket = plasterBucket;
	o.square = square;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 100;
    o.caloriesModifier = 8;
	return o;
end
