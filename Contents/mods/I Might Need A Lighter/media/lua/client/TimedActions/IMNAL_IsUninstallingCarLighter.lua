--I Might Need A Lighter Mod by Fingbel

require "TimedActions/ISBaseTimedAction"
IsUnInstallingCarLighter = ISBaseTimedAction:derive('IsUnInstallingCarLighter')

function IsUnInstallingCarLighter:isValid()
return self.character:getVehicle() ~= nill
end

function IsUnInstallingCarLighter:start()
	self.character:getEmitter():playSound("CarLighter_PlugOut");
end

function IsUnInstallingCarLighter:stop()
	ISBaseTimedAction.stop(self);	
end

function IsUnInstallingCarLighter:perform()
	self.character:getInventory():AddItem("Base.CarLighter")
	if(getWorld():getGameMode() ~= "Multiplayer")then
		self.character:getModData().CL = "1"
		IMNALSPVehicles[self.character:getVehicle():getKeyId()] = "1"
	end
	sendClientCommand(self.character, 'IMNAL', 'Upgrade', {vehicle = self.character:getVehicle():getKeyId(),playerID = self.character:getOnlineID(), newCL = "1"})
	--FinishTimeBasedAction
	ISBaseTimedAction.perform(self)
end

function IsUnInstallingCarLighter:new (character, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.maxTime = time;
	if character:isTimedActionInstant() then
		o.maxTime = 1;
	end
	return o
end