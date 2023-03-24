require "TimedActions/ISBaseTimedAction"

ISMMTourniquetOnNeck = ISBaseTimedAction:derive("ISMMTourniquetOnNeck");

function ISMMTourniquetOnNeck:isValid()
    if ISHealthPanel.DidPatientMove(self.character, self.otherPlayer, self.bandagedPlayerX, self.bandagedPlayerY) then
        return false
    end
    return self.character:getInventory():contains(self.item)
end

function ISMMTourniquetOnNeck:waitToStart()
    if self.character == self.otherPlayer then
        return false
    end
    self.character:faceThisObject(self.otherPlayer)
    return self.character:shouldBeTurning()
end

function ISMMTourniquetOnNeck:update()
    if self.character ~= self.otherPlayer then
        self.character:faceThisObject(self.otherPlayer)
    end
    self.item:setJobDelta(self:getJobDelta());
    ISHealthPanel.setBodyPartActionForPlayer(self.otherPlayer, self.bodyPart, self, getText("IGUI_JobType_ApplyTourniquetOnNeck"), { plantain = true })
end

function ISMMTourniquetOnNeck:start()
    self.item:setJobType(getText("IGUI_JobType_ApplyTourniquetOnNeck"));
    self.item:setJobDelta(0.0);
    self.character:Say(getText("IGUI_PlayerText_MMPleaseStop"));
        self:setActionAnim("Loot")
        self.character:SetVariable("LootPosition", "Mid")
        self.character:reportEvent("EventLootItem");
    self:setOverrideHandModels(nil, nil);
end

function ISMMTourniquetOnNeck:stop()
    ISHealthPanel.setBodyPartActionForPlayer(self.otherPlayer, self.bodyPart, nil, nil, nil)
    ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

function ISMMTourniquetOnNeck:perform()
    self.item:setJobDelta(0.0);
    self.character:Kill(self.character)
    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end

function ISMMTourniquetOnNeck:new(doctor, otherPlayer, item, bodyPart)
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
    o.maxTime = 1800 - (o.doctorLevel * 40);
    if doctor:isTimedActionInstant() then
        o.maxTime = 1;
    end
    if doctor:getAccessLevel() ~= "None" then
        o.doctorLevel = 10;
    end
    return o;
end
