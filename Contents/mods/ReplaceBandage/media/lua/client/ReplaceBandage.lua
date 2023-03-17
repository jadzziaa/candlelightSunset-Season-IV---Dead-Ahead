ReplaceBandage = {}

-- Move to util
function ReplaceBandage:GetBandagedParts(bodyParts)
    local result = {}
    for i=0,BodyPartType.ToIndex(BodyPartType.MAX) - 1 do
        local bodyPart = bodyParts:get(i);
        if bodyPart:bandaged() then
            table.insert(result, bodyPart);
        end
    end
    return result
end

ReplaceBandage.OnReplaceBandage = function(bandages, bodyPart, player)
    bandages = ISInventoryPane.getActualItems(bandages)
    for i,k in ipairs(bandages) do
        local playerObj = getSpecificPlayer(player)
        ISTimedActionQueue.add(ISApplyBandage:new(playerObj, playerObj, nil, bodyPart, false));

        -- if bandage isn't in main inventory, put it there first.
        ISInventoryPaneContextMenu.transferIfNeeded(playerObj, k)
        -- apply bandage
        ISTimedActionQueue.add(ISApplyBandage:new(playerObj, playerObj, k, bodyPart, true));
        break
    end
end

--- Inventory Panel ---
function ISInventoryPaneContextMenu.doBandageMenu(context, items, player)

    --- Default PZ Method ---
    -- we get all the damaged body part
    local bodyPartDamaged = ISInventoryPaneContextMenu.haveDamagePart(player);
    -- if any part is damaged, we gonna create a sub menu with them
    if #bodyPartDamaged > 0 then
        local bandageOption = context:addOption(getText("ContextMenu_Apply_Bandage"), bodyPartDamaged, nil);
        -- create a new contextual menu
        local subMenuBandage = context:getNew(context);
        -- we add our new menu to the option we want (here bandage)
        context:addSubMenu(bandageOption, subMenuBandage);
        for i,v in ipairs(bodyPartDamaged) do
            subMenuBandage:addOption(BodyPartType.getDisplayName(v:getType()), items, ISInventoryPaneContextMenu.onApplyBandage, v, player);
        end
    end

    --- Custom Replace Bandage ---
    local bandagedParts = ReplaceBandage:GetBandagedParts(getSpecificPlayer(player):getBodyDamage():getBodyParts())
    if #bandagedParts > 0 then
        local option = context:addOption("Replace Bandage", nil)
        local subMenuBodyPart = context:getNew(context)
        context:addSubMenu(option, subMenuBodyPart)

        for i,v in ipairs(bandagedParts) do
            subMenuBodyPart:addOption(BodyPartType.getDisplayName(v:getType()), items, ReplaceBandage.OnReplaceBandage, v, player);
        end
    end
end


--- Health Panel ---
function ISHealthPanel:doBodyPartContextMenu(bodyPart, x, y)
    local playerNum = self.otherPlayer and self.otherPlayer:getPlayerNum() or self.character:getPlayerNum()
    local context = ISContextMenu.get(playerNum, x + self:getAbsoluteX(), y + self:getAbsoluteY());

    local handlers = {}
    table.insert(handlers, HRemoveBandage:new(self, bodyPart))
    table.insert(handlers, HApplyPlantain:new(self, bodyPart))
    table.insert(handlers, HApplyComfrey:new(self, bodyPart))
    table.insert(handlers, HApplyGarlic:new(self, bodyPart))
    table.insert(handlers, HApplyBandage:new(self, bodyPart))
    table.insert(handlers, HDisinfect:new(self, bodyPart))
    table.insert(handlers, HStitch:new(self, bodyPart))
    table.insert(handlers, HRemoveStitch:new(self, bodyPart))
    table.insert(handlers, HRemoveGlass:new(self, bodyPart))
    table.insert(handlers, HSplint:new(self, bodyPart))
    table.insert(handlers, HRemoveSplint:new(self, bodyPart))
    table.insert(handlers, HRemoveBullet:new(self, bodyPart))
    table.insert(handlers, HCleanBurn:new(self, bodyPart))
    table.insert(handlers, HReplaceBandage:new(self, bodyPart))


    self:checkItems(handlers)

    for _,handler in ipairs(handlers) do
        handler:addToMenu(context)
    end

    if ISHealthPanel.cheat then
        local option = context:addOption("Cheat", nil);
        local cheatSubMenu = context:getNew(context);
        context:addSubMenu(option, cheatSubMenu);

        --- Spawn item ---
        option = cheatSubMenu:addOption("Spawn Item")
        local cheatSpawnItemSubMenu = cheatSubMenu:getNew(cheatSubMenu)
        cheatSubMenu:addSubMenu(option, cheatSpawnItemSubMenu)

        local types = { "Base.Bandage", "Base.Bandaid", "Base.RippedSheets", "Base.Disinfectant", "Base.Needle", "Base.Thread", "Base.SutureNeedle", "Base.Tweezers", "Base.SutureNeedleHolder", "Base.Splint", "Base.TreeBranch", "Base.WoodenStick", "Base.PlantainCataplasm", "Base.WildGarlicCataplasm", "Base.ComfreyCataplasm" }
        for _,type in ipairs(types) do
            local scriptItem = getScriptManager():FindItem(type)
            local name = scriptItem and scriptItem:getDisplayName() or type
            cheatSpawnItemSubMenu:addOption(name, type, ISHealthPanel.onCheatItem, self.otherPlayer or self.character)
        end

        --- Visual change ---
        option = cheatSubMenu:addOption("Visual change")
        local cheatVisualChangeSubMenu = cheatSubMenu:getNew(cheatSubMenu)
        cheatSubMenu:addSubMenu(option, cheatVisualChangeSubMenu)

        cheatVisualChangeSubMenu:addOption("Add Dirt", bodyPart, ISHealthPanel.onCheat, "dirt", self.character, self.otherPlayer);
        cheatVisualChangeSubMenu:addOption("Remove Dirt", bodyPart, ISHealthPanel.onCheat, "removedirt", self.character, self.otherPlayer);
        cheatVisualChangeSubMenu:addOption("Add Blood", bodyPart, ISHealthPanel.onCheat, "blood", self.character, self.otherPlayer);
        cheatVisualChangeSubMenu:addOption("Remove Blood", bodyPart, ISHealthPanel.onCheat, "removeblood", self.character, self.otherPlayer);
        cheatVisualChangeSubMenu:addOption("Add Hole", bodyPart, ISHealthPanel.onCheat, "hole", self.character, self.otherPlayer);
        cheatVisualChangeSubMenu:addOption("Add Patch", bodyPart, ISHealthPanel.onCheat, "patch", self.character, self.otherPlayer);

        --- Part change ---
        option = cheatSubMenu:addOption("Part change")
        local cheatPartChangeSubMenu = cheatSubMenu:getNew(cheatSubMenu)
        cheatSubMenu:addSubMenu(option, cheatPartChangeSubMenu)

        cheatPartChangeSubMenu:addOption("Toggle Bleeding", bodyPart, ISHealthPanel.onCheat, "bleeding", self.character, self.otherPlayer);
        cheatPartChangeSubMenu:addOption("Toggle Bullet", bodyPart, ISHealthPanel.onCheat, "bullet", self.character, self.otherPlayer);
        cheatPartChangeSubMenu:addOption("Toggle Burned", bodyPart, ISHealthPanel.onCheat, "burned", self.character, self.otherPlayer);
        cheatPartChangeSubMenu:addOption("Toggle Burn Needs Wash", bodyPart, ISHealthPanel.onCheat, "burnWash", self.character, self.otherPlayer);
        cheatPartChangeSubMenu:addOption("Toggle Deep Wound", bodyPart, ISHealthPanel.onCheat, "deepWound", self.character, self.otherPlayer);
        cheatPartChangeSubMenu:addOption("Toggle Fracture", bodyPart, ISHealthPanel.onCheat, "fracture", self.character, self.otherPlayer);
        cheatPartChangeSubMenu:addOption("Toggle Glass Shards", bodyPart, ISHealthPanel.onCheat, "glass", self.character, self.otherPlayer);
        cheatPartChangeSubMenu:addOption("Toggle Infected", bodyPart, ISHealthPanel.onCheat, "infected", self.character, self.otherPlayer);
        cheatPartChangeSubMenu:addOption("Toggle Scratched", bodyPart, ISHealthPanel.onCheat, "scratched", self.character, self.otherPlayer);
        cheatPartChangeSubMenu:addOption("Toggle Laceration", bodyPart, ISHealthPanel.onCheat, "cut", self.character, self.otherPlayer);
        cheatPartChangeSubMenu:addOption("Toggle Bite", bodyPart, ISHealthPanel.onCheat, "bite", self.character, self.otherPlayer);
        cheatPartChangeSubMenu:addOption("Toggle Exercise Fatique", bodyPart, ISHealthPanel.onCheat, "fatique", self.character, self.otherPlayer);
        cheatPartChangeSubMenu:addOption("Health Full", bodyPart, ISHealthPanel.onCheat, "healthFull", self.character, self.otherPlayer);

        --- Health Full (Body) ---
        cheatSubMenu:addOption("Health Full (Body)", bodyPart, ISHealthPanel.onCheat, "healthFullBody", self.character, self.otherPlayer)
    end

    if self.blockingMessage or context:isEmpty()  then
        context:setVisible(false);
    end

    if JoypadState.players[playerNum+1] and context:getIsVisible() then
        context.mouseOver = 1
        context.origin = self
        JoypadState.players[playerNum+1].focus = context
        updateJoypadFocus(JoypadState.players[playerNum+1])
    end
end