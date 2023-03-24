require "TimedActions/ISBaseTimedAction"

ISMMPowderPackHemostatic = ISBaseTimedAction:derive("ISMMPowderPackHemostatic");

function ISMMPowderPackHemostatic:isValid()
	if ISHealthPanel.DidPatientMove(self.character, self.otherPlayer, self.bandagedPlayerX, self.bandagedPlayerY) then
		return false
	end
    return self.character:getInventory():contains(self.item)
end

function ISMMPowderPackHemostatic:waitToStart()
    if self.character == self.otherPlayer then
        return false
    end
    self.character:faceThisObject(self.otherPlayer)
    return self.character:shouldBeTurning()
end

function ISMMPowderPackHemostatic:update()
    if self.character ~= self.otherPlayer then
        self.character:faceThisObject(self.otherPlayer)
    end
    self.item:setJobDelta(self:getJobDelta());
    ISHealthPanel.setBodyPartActionForPlayer(self.otherPlayer, self.bodyPart, self, getText("IGUI_JobType_ApplyPowderPackHemostatic"), { plantain = true })
end

function ISMMPowderPackHemostatic:start()
    self.item:setJobType(getText("IGUI_JobType_ApplyPowderPackHemostatic"));
    self.item:setJobDelta(0.0);
    if self.character == self.otherPlayer then
        self:setActionAnim(CharacterActionAnims.Bandage);
        self:setAnimVariable("BandageType", ISHealthPanel.getBandageType(self.bodyPart));
        self.character:reportEvent("EventBandage");
    else
        self:setActionAnim("Loot")
        self.character:SetVariable("LootPosition", "Mid")
        self.character:reportEvent("EventLootItem");
    end
    self:setOverrideHandModels(nil, nil);
end

function ISMMPowderPackHemostatic:stop()
    ISHealthPanel.setBodyPartActionForPlayer(self.otherPlayer, self.bodyPart, nil, nil, nil)
    ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

function ISMMPowderPackHemostatic:perform()
    self.item:setJobDelta(0.0);

    if self.character:HasTrait("Hemophobic") and self.bodyPart:getBleedingTime() > 0 then
        self.character:getStats():setPanic(self.character:getStats():getPanic() + 50);
    end

    if (self.bodyPart:bleeding()) then
        -- остановить кровотечение
        self.bodyPart:setBleedingTime(0.0f);
        self.bodyPart:setBleeding(false);
         -- отравление 5%
        self.character:getBodyDamage():setPoisonLevel(self.character:getBodyDamage():getPoisonLevel() + 5)
    end
    self.character:getInventory():Remove(self.item);

    ISHealthPanel.setBodyPartActionForPlayer(self.otherPlayer, self.bodyPart, nil, nil, nil)
    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end

function ISMMPowderPackHemostatic:new(doctor, otherPlayer, item, bodyPart)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = doctor;
    o.otherPlayer = otherPlayer;
    o.doctorLevel = doctor:getPerkLevel(Perks.Doctor);
	o.item = item;
	o.bodyPart = bodyPart;
	o.stopOnWalk = true;
	o.stopOnRun = true;
    o.bandagedPlayerX = otherPlayer:getX();
    o.bandagedPlayerY = otherPlayer:getY();
    o.maxTime = 120 - (o.doctorLevel * 4);
    if doctor:isTimedActionInstant() then
        o.maxTime = 1;
    end
    if doctor:getAccessLevel() ~= "None" then
        o.doctorLevel = 10;
    end
	return o;
end
