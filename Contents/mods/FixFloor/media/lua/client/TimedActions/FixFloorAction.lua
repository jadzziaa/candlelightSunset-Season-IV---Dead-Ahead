require('TimedActions/ISBaseTimedAction');

FixFloorAction = ISBaseTimedAction:derive("FixFloorAction");

function FixFloorAction:isValid()
	local playerInv = self.character:getInventory()
	return playerInv:contains("Hammer") and (self.character:HasTrait("Handy") or self.character:getPerkLevel(Perks.Woodwork) >= 5);
end

function FixFloorAction:waitToStart()
	self.character:faceLocation(self.square:getX(), self.square:getY())
	return self.character:shouldBeTurning()
end

function FixFloorAction:update()
    local worldSoundRadius = 0

	self.character:faceLocation(self.square:getX(), self.square:getY())
    self.character:setMetabolicTarget(Metabolics.LightWork);
    
    if not self.hammerSound or not self.character:getEmitter():isPlaying(self.hammerSound) then
        self.hammerSound = self.character:getEmitter():playSound("Hammering");
        worldSoundRadius = math.ceil(20 * self.character:getHammerSoundMod())
    end
    
    if worldSoundRadius > 0 then
        ISBuildAction.worldSoundTime = getTimestamp()
        addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), worldSoundRadius, worldSoundRadius)
    end
end

function FixFloorAction:start()

    self:setActionAnim(CharacterActionAnims.BuildLow);
    self:setOverrideHandModels("Hammer", nil);
    
    self.hammerSound = 0
    
	self.character:reportEvent("EventFixFloor");
end

function FixFloorAction:stop()
    if self.hammerSound and self.hammerSound ~= 0 and self.character:getEmitter():isPlaying(self.hammerSound) then
        self.character:getEmitter():stopSound(self.hammerSound);
    end

    ISBaseTimedAction.stop(self);
end

function FixFloorAction:perform()
	local args = { x = self.square:getX(), y = self.square:getY(), z = self.square:getZ() }
    
    sendClientCommand(self.character, 'FixFloor', 'FixFloorCommand', args)

    if self.hammerSound and self.hammerSound ~= 0 and self.character:getEmitter():isPlaying(self.hammerSound) then
        self.character:getEmitter():stopSound(self.hammerSound);
    end
    
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function FixFloorAction:new(character, square, time)
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
