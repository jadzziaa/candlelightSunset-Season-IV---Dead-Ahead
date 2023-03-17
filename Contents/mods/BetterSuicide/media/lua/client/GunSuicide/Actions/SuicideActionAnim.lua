require "TimedActions/ISBaseTimedAction"

SuicideActionAnim = ISBaseTimedAction:derive("SuicideActionAnim")

function SuicideActionAnim:isValid()
	return true
end

function SuicideActionAnim:update()
	local uispeed = UIManager.getSpeedControls():getCurrentGameSpeed()
    if uispeed ~= 1 then
        UIManager.getSpeedControls():SetCurrentGameSpeed(1)
    end

	if self:getJobDelta() > 0.1 and not self.isOff then
		self.character:splatBloodFloorBig();
		self.isOff = true
	end

	if self:getJobDelta() > self.shotTime and not self.isStartSound then
		self.character:getEmitter():playSound(self.item:getSwingSound())
		self.isStartSound = true
	end
end

function SuicideActionAnim:start()
	self:setActionAnim(self.anim)
end

function SuicideActionAnim:perform()
	self.character:getBodyDamage():RestoreToFullHealth()
	self.character:getBodyDamage():setInfectionLevel(0)
	self.character:Kill(self.character)

	ISBaseTimedAction.perform(self)
end

function SuicideActionAnim:new(character, item, anim, shotTime, maxTime)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.item = item
	o.anim = anim
	o.shotTime = shotTime
	o.maxTime = maxTime
	
	return o
end




