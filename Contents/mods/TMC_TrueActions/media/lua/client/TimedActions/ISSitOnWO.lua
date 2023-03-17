require "TimedActions/ISBaseTimedAction"
require "TrueActionsSetting"

ISSitOnWO = ISBaseTimedAction:derive("ISSitOnWO");

function ISSitOnWO:isValid()
    local chrSqr = self.character:getSquare()
    local itemSqr = self.item:getSquare()
    if chrSqr:isWallTo(itemSqr) or chrSqr:isWindowTo(itemSqr) then
        self.character:Say(getText("IGUI_PlayerText_TRUEA_need_come_closer"))
        return false
    else
        if not self.item:getModData().trueActions then
            self.item:getModData().trueActions = {}
            return true
        elseif self.item:getModData().trueActions.occupied then
            return false
        else
            return true
        end
    end
end

function ISSitOnWO:update()
    if not self.character:shouldBeTurning() then
        self:forceComplete()
        return
    end
end

function ISSitOnWO:start()
    -- print("ISSitOnWO:start")
    forceDropHeavyItems(self.character)
    self.character:setPrimaryHandItem(nil)
    self.character:setSecondaryHandItem(nil)
    -- self.character:setHideWeaponModel(true)
    if self.direction == "E" then
        self.character:facePosition(self.item:getSquare():getX() + 10, self.item:getSquare():getY())
        self.character:getModData()["facePosition"] = {self.item:getSquare():getX() + 10, self.item:getSquare():getY()}
    elseif self.direction == "S" then
        self.character:facePosition(self.item:getSquare():getX(), self.item:getSquare():getY() + 10)
        self.character:getModData()["facePosition"] = {self.item:getSquare():getX(), self.item:getSquare():getY() + 10}
    elseif self.direction == "W" then
        self.character:facePosition(self.item:getSquare():getX() - 10, self.item:getSquare():getY())
        self.character:getModData()["facePosition"] = {self.item:getSquare():getX() - 10, self.item:getSquare():getY()}
    else
        self.character:facePosition(self.item:getSquare():getX(), self.item:getSquare():getY() - 10)
        self.character:getModData()["facePosition"] = {self.item:getSquare():getX(), self.item:getSquare():getY() - 10}
    end
    
    -- if self.deltaX > self.deltaY then
        -- self.character:facePosition(self.item:getSquare():getX() + 10, self.item:getSquare():getY())
        -- self.character:getModData()["facePosition"] = {self.item:getSquare():getX() + 10, self.item:getSquare():getY()}
    -- else
        -- self.character:facePosition(self.item:getSquare():getX(), self.item:getSquare():getY() + 10)
        -- self.character:getModData()["facePosition"] = {self.item:getSquare():getX(), self.item:getSquare():getY() + 10}
    -- end
    -- print(self.direction)
    self.character:setX(self.item:getSquare():getX() + self.deltaX)
    self.character:setY(self.item:getSquare():getY() + self.deltaY)
end

function ISSitOnWO:stop()
    -- print("ISSitOnWO:stop")
    ISBaseTimedAction.stop(self);
end

function ISSitOnWO:perform()
    -- print("ISSitOnWO:perform")
    self.character:setPrimaryHandItem(nil)
    -- self.character:setHideWeaponModel(true)
    self.character:setSecondaryHandItem(nil)
    self.item:getModData().trueActions.occupied = self.character
    self.item:getModData().trueActions.occup = self.character:getUsername()

    if not self.character:getModData().trueActions then
        self.character:getModData().trueActions = {}
    end
    -- if self.direction == "N" then
        -- local sq = getSquare(self.item:getSquare():getX(), self.item:getSquare():getY() + 1, self.item:getSquare():getZ())
        -- sq:AddTileObject(IsoObject.new(sq, "fixtures_bathroom_01_35"));
    -- elseif self.direction == "W" then
        -- local sq = getSquare(self.item:getSquare():getX(), self.item:getSquare():getY() + 1, self.item:getSquare():getZ())
        -- sq:AddTileObject(IsoObject.new(sq, "fixtures_bathroom_01_34"));
    -- end
    self.character:getModData().trueActions.on = self.item
    self.character:reportEvent("EventSitOnGround");
    self.character:setVariable("SitWOAnim", "Idle");
    self.item:getModData().trueActions.sitwoanim = "Idle";
    self.item:getModData().trueActions.forcegetup = false
    self.item:transmitModData()
    -- self.character:getModData().trueActions.SitWOAnim = "Idle";
    -- ModData.request("trueActionsData");
    -- ModData.getOrCreate("trueActionsData")[self.character:getUsername()] = "Idle";
    -- ModData.transmit("trueActionsData");
    self.character:setBlockMovement(true)
    
    
    
    -- sendClientCommand(self.character, 'player', 'seatWo', {SitWOAnim = "Idle" ; })
    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end

function ISSitOnWO:new(character, item, deltaX, deltaY, direction)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character;
    o.item = item;
    o.deltaX = deltaX;
    o.deltaY = deltaY;
    o.direction = direction;
    o.maxTime = -1;
    o.stopOnWalk = true;
    o.stopOnRun = true;
    return o;
end
