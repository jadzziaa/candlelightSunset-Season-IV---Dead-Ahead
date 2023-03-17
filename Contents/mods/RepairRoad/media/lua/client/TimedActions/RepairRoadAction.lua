require('TimedActions/ISBaseTimedAction');

RepairRoadAction = ISBaseTimedAction:derive("RepairRoadAction");

function RepairRoadAction:isValid()
	local playerInv = self.character:getInventory()
	return ISBuildMenu.cheat or playerInv:contains("BucketConcreteFull") and (playerInv:contains("HandShovel"));
end

function RepairRoadAction:waitToStart()
	self.character:faceLocation(self.square:getX(), self.square:getY())
	return self.character:shouldBeTurning()
end

function RepairRoadAction:update()
	self.character:faceLocation(self.square:getX(), self.square:getY())
    self.character:setMetabolicTarget(Metabolics.MediumWork);
end

function RepairRoadAction:start()
	self.sound = self.character:playSound("Plastering")
	local primaryItem = self.character:getPrimaryHandItem()
	if primaryItem:getType() == "HandShovel" then
		self:setActionAnim("Loot")
		self.character:SetVariable("LootPosition", "Low")
		self:setOverrideHandModels("HandShovel", nil);
	else
		self:setActionAnim("Loot");
		self.character:SetVariable("LootPosition", "Low");
		self:setOverrideHandModels(nil, "HandShovel");
	end
	self.character:reportEvent("EventRepairRoad");
end

function RepairRoadAction:stop()
	if self.sound then self.character:stopOrTriggerSound(self.sound) end
    ISBaseTimedAction.stop(self);
end

function RepairRoadAction:perform()
	if self.sound then self.character:stopOrTriggerSound(self.sound) end
    local concreteBucket = self.character:getInventory():getItemFromType("BucketConcreteFull");
	local args = { x = self.square:getX(), y = self.square:getY(), z = self.square:getZ() }
    sendClientCommand(self.character, 'RepairRoad', 'RepairRoadCommand', args)

	concreteBucket:Use();

    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function RepairRoadAction:new(character, square, concreteBucket)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.concreteBucket = concreteBucket;
	o.square = square;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 100;
    o.caloriesModifier = 8;
	return o;
end
