require('TimedActions/ISBaseTimedAction');

CleanDirtAction = ISBaseTimedAction:derive("CleanDirtAction");

function CleanDirtAction:isValid()
	local playerInv = self.character:getInventory()
	return playerInv:contains("Bleach") and (playerInv:contains("BathTowel") or playerInv:contains("DishCloth") or playerInv:contains("Broom") or playerInv:contains("Mop"));
end

function CleanDirtAction:waitToStart()
	self.character:faceLocation(self.square:getX(), self.square:getY())
	return self.character:shouldBeTurning()
end

function CleanDirtAction:update()
	self.character:faceLocation(self.square:getX(), self.square:getY())
    self.character:setMetabolicTarget(Metabolics.LightWork);end

function CleanDirtAction:start()
	-- if we have dish clothes, play low animation & show bleach
	local primaryItem = self.character:getPrimaryHandItem()
	if primaryItem:getType() == "Broom" or primaryItem:getType() == "Mop" then
		self:setActionAnim("Rake");
		self:setOverrideHandModels("Broom", nil);
	else
		self:setActionAnim("Loot");
		self.character:SetVariable("LootPosition", "Low");
		self:setOverrideHandModels(nil, "BleachBottle");
	end
	self.character:reportEvent("EventCleanDirt");
end

function CleanDirtAction:stop()
    ISBaseTimedAction.stop(self);
end

function CleanDirtAction:perform()
    local bleach = self.character:getInventory():getItemFromType("Bleach");
    bleach:setThirstChange(bleach:getThirstChange() + 0.05);
	local args = { x = self.square:getX(), y = self.square:getY(), z = self.square:getZ() }
    
    if bleach:getThirstChange() > -0.05 then
        bleach:Use();
    end
    sendClientCommand(self.character, 'CleanDirt', 'CleanDirtCommand', args)
    
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function CleanDirtAction:new(character, square, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.square = square;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
    o.caloriesModifier = 5;
    if character:isTimedActionInstant() then
        o.maxTime = 1;
    end
	return o;
end
