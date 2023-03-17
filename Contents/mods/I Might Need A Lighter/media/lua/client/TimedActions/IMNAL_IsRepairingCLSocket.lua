--I Might Need A Lighter Mod by Fingbel

require "TimedActions/ISBaseTimedAction"
IsRepairingCLSocket = ISBaseTimedAction:derive('IsRepairingCLSocket')

function IsRepairingCLSocket:isValid()
	return self.character:getVehicle() ~= nill
end

function IsRepairingCLSocket:start()
	self.sound = self.character:playSound("GeneratorRepair")
end

function IsRepairingCLSocket:stop()
	self.character:stopOrTriggerSound(self.sound)
	--StopTimeBasedAction
	ISBaseTimedAction.stop(self);	
end

function IsRepairingCLSocket:perform()
	self.character:stopOrTriggerSound(self.sound)
	if(getWorld():getGameMode() ~= "Multiplayer")then
		self.character:getModData().CL = "1"	
		IMNALSPVehicles[self.character:getVehicle():getKeyId()] = "1"
	end
	sendClientCommand(self.character, 'IMNAL', 'Upgrade', {vehicle = self.character:getVehicle():getKeyId(),playerID = self.character:getOnlineID(), newCL = "1"})
--FinishTimeBasedAction
	ISBaseTimedAction.perform(self)
end

function IsRepairingCLSocket:new (character,  time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.maxTime = time
	if character:isTimedActionInstant() then
		o.maxTime = 1
	end
	return o
end