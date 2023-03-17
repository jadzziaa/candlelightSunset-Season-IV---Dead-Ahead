--***********************************************************
--**                    ROBERT JOHNSON                     **
--**                   INSEMINATES COWS                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISMakePath = ISBaseTimedAction:derive("ISMakePath");

function ISMakePath:isValid()
	return 	true
end

function ISMakePath:waitToStart()
	self.character:faceThisObject(self.sandTile)
	return self.character:shouldBeTurning()
end

function ISMakePath:update()
	self.character:faceThisObject(self.sandTile)
    self.character:setMetabolicTarget(Metabolics.DiggingSpade);
end

function ISMakePath:start()
	self:setActionAnim(ISFarmingMenu.getShovelAnim(self.character:getPrimaryHandItem()))
    self.sound = self.character:getEmitter():playSound("Shoveling")
	addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), 10, 1)
end

function ISMakePath:stop()
    if self.sound ~= 0 and self.character:getEmitter():isPlaying(self.sound) then
        self.character:getEmitter():stopSound(self.sound);
    end
    ISBaseTimedAction.stop(self);
end

function ISMakePath:perform()
    if self.sound ~= 0 and self.character:getEmitter():isPlaying(self.sound) then
        self.character:getEmitter():stopSound(self.sound);
    end
	local sq = self.sandTile:getSquare()
	local args = { x = sq:getX(), y = sq:getY(), z = sq:getZ() }
	sendClientCommand(self.character, 'object', 'shovelGround', args)

    if ZombRand(5) == 0 then
        self.character:getInventory():AddItem("Base.Worm");
    end
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISMakePath:new(character, sandTile, newSprite)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.sandTile = sandTile;
    o.newSprite = newSprite;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 100;
    o.caloriesModifier = 8;
	return o;
end
