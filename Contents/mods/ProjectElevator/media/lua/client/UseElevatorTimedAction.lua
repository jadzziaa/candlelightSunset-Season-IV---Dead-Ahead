
ProjectElevator = {};

ProjectElevator.UseElevator = function(item, player, time, square, direction, floor)
   ISTimedActionQueue.add(UseElevatorAction:new(player:getPlayerNum(), item, time, square, direction, floor));
end

require "TimedActions/ISBaseTimedAction"

UseElevatorAction = ISBaseTimedAction:derive("UseElevatorAction");

 
function UseElevatorAction:isValid()
	return true;
end

function UseElevatorAction:update()
end

function UseElevatorAction:start()
	self.sound = self.character:getEmitter():playSound("ElevatorSound")
	local directionToGo = self.direction
	self.character:Say("Going " .. directionToGo);
end

function UseElevatorAction:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function UseElevatorAction:perform()
	--self.sound = self.character:getEmitter():playSound("ElevatorSound")
	--print("ActionPerform has been fired");
	UseElevatorCall(self.direction, self.character, self.square, self.floor);
	ISBaseTimedAction.perform(self);
end

function UseElevatorAction:new(character, pie, time, square, direction, floor)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = getSpecificPlayer(character);
	o.activate = activate;
	o.pie = pie;
	o.floor = floor;
	o.direction = direction;
	o.square = square;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end

 