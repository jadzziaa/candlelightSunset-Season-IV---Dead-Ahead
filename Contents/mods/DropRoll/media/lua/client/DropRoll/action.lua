DropRollAction = ISBaseTimedAction:derive("DropRollAction");

DropRollAction.CLOTHING_LAYER_ORDERING = {
    "FullSuit",
    "FullSuitHead",
    "Tail",
    "Jacket",
    "BathRobe",
    "Dress",
    "Sweater",
    "SweaterHat",
    "Skirt",
    "Pants",
    "FullHelmet",
    "Hat",
    "FullHat",
    "Mask",
    "MaskEyes",
    "MaskFull",
    "TorsoExtra",
    "ShortSleeveShirt",
    "Shirt",
    "Tshirt",
    "Underwear",
    "Legs1",
    "TankTop",
    "Socks",
    "UnderwearInner",
    "Shoes",
    "Torso1Legs1",
    "UnderwearTop",
    "UnderwearBottom",
    "UnderwearExtra1",
    "UnderwearExtra2",
}

function DropRollAction.isValidForPlayer(player)
    if player:getVehicle() then
        print("Dropping and rolling not valid: in vehicle");
        return false;
    end;

    if not player:isOnFire() then
        print("Dropping and rolling not valid: not on fire");
        return false;
    end

    return true;
end

function DropRollAction:isValid()
    -- We only check when populating.
    return true;
end

function DropRollAction:determineNumItemsToDestroy()
    local lucky = self.character:getTraits():contains("Lucky");
    local unlucky = self.character:getTraits():contains("Unlucky");
    local numItemsToDestroy = Math.ceil(ZombRand(2));
    if lucky then
        numItemsToDestroy = numItemsToDestroy - Math.ceil(ZombRand(2));
    elseif unlucky then
        numItemsToDestroy = numItemsToDestroy + Math.ceil(ZombRand(2));
    end
    if unlucky or not lucky then
        numItemsToDestroy = Math.min(numItemsToDestroy, 1);
    end
    if numItemsToDestroy < 0 then return 0 end;
    return numItemsToDestroy;
end

function DropRollAction.addClothingHole(clothing)
    local coveredParts = BloodClothingType.getCoveredParts(clothing:getBloodClothingType());
    local coveredPartsLength = coveredParts:size();
    for i=0,coveredPartsLength do
        local coveredPart = coveredParts:get(i);
        if clothing:getVisual():getHole(coveredPart) == 0.0 then
            print("Added hole to ", clothing, " at ", coveredPart);
            clothing:getVisual():setHole(coveredPart);
            clothing:removePatch(coveredPart);
            clothing:setCondition(clothing:getCondition() - clothing:getCondLossPerHole());
            return;
        end
    end
end

function DropRollAction.burnClothing(clothing)
    if not clothing:getCanHaveHoles() then
        print("Clothing can't have holes, so setting condition to zero.");
        clothing:setCondition(clothing:getCondition() / 2);
        return;
    end

    DropRollAction.addClothingHole(clothing);
end

function DropRollAction:destroyRandomClothing()
    local numItemsToDestroy = self:determineNumItemsToDestroy();
    print("Items to destroy: ", numItemsToDestroy);
    if numItemsToDestroy == 0 then
        return
    end

    local numDestroyed = 0;
    for _, bodyLocation in ipairs(DropRollAction.CLOTHING_LAYER_ORDERING) do
        local foundClothing = nil;
        for i=0, self.character:getWornItems():size()-1 do
            local clothing = self.character:getWornItems():getItemByIndex(i);
            if clothing:getBodyLocation() == bodyLocation then
                foundClothing = clothing;
                break;
            end;
        end
        if foundClothing then
            print("Burning: ", foundClothing);
            DropRollAction.burnClothing(foundClothing);
            numDestroyed = numDestroyed + 1;
        end
        if numDestroyed == numItemsToDestroy then
            print("Destroyed enough clothing.");
            break;
        end
    end

    print("Sending clothing update...");
    self.character:resetModel();
    sendClothing(self.character);
end

function DropRollAction:extinguishFlames()
    if isClient() then
        self.character:sendStopBurning();
    else
        self.character:StopBurning()
    end

    self.character:getSquare():transmitStopFire();
    self.character:getSquare():stopFire();
end

function DropRollAction:update()
    self.tick = self.tick + 1;
    if (self.tick == self.quashTime) then
        print("Extinguishing!");
        self:destroyRandomClothing();
        self:extinguishFlames();
    end
   self.character:setMetabolicTarget(Metabolics.FitnessHeavy);
end

function DropRollAction:start()
    print("Dropping and rolling!");
    self:setActionAnim("DropRoll");
end

function DropRollAction:stop()
    print("No longer dropping and rolling!");
    ISBaseTimedAction.stop(self);
end

function DropRollAction:perform()
    ISBaseTimedAction.perform(self);
end

function DropRollAction:new(character, time, quashTime)
    local o = ISBaseTimedAction.new(self, character);
    o.stopOnAim = true;
    o.stopOnWalk = true;
    o.stopOnRun = true;
    o.tick = 0;
    o.quashTime = quashTime;
    o.maxTime = time;
    o.ignoreHandsWounds = true;
    o.animSpeed = 1.0;
    if o.character:isTimedActionInstant() then o.maxTime = 1; end
    o.caloriesModifier = 16;
    return o;
end

function DropRollAction.doDropRollAction(player)
    local lucky = player:getTraits():contains("Lucky");
    local unlucky = player:getTraits():contains("Unlucky");
    local reducedTime = 0;
    if lucky then
        reducedTime = 15 + Math.ceil(ZombRand(30));
    elseif not unlucky then
        reducedTime = Math.ceil(ZombRand(15));
    end
    print("Luck-based quash time reduction: ", reducedTime);
    local dropRollAction = DropRollAction:new(player, 300, 180 - reducedTime);
    ISTimedActionQueue.add(dropRollAction);
end

function DropRollAction.onFillWorldObjectContextMenu(playerNum, context, worldObjects, test)
    if test then return end;

    local player = getSpecificPlayer(playerNum);

    if DropRollAction.isValidForPlayer(player) then
        context:addOption("Stop, Drop 'n Roll!", player, DropRollAction.doDropRollAction, player:getSquare());
    end
end

Events.OnFillWorldObjectContextMenu.Add(DropRollAction.onFillWorldObjectContextMenu);