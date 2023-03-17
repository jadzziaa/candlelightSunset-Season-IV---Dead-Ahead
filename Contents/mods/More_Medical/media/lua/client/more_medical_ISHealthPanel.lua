---------------------------------- Vanilla

local BaseHandler = ISBaseObject:derive("BaseHandler")

function BaseHandler:new(panel, bodyPart)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.panel = panel
    o.bodyPart = bodyPart
    o.items = {}
    return o
end

function BaseHandler:isInjured()
    local bodyPart = self.bodyPart
    return (bodyPart:HasInjury() or bodyPart:stitched() or bodyPart:getSplintFactor() > 0) and not bodyPart:bandaged()
end

function BaseHandler:checkItems()
    for k,v in pairs(self.items) do
        table.wipe(v)
    end

    local containers = ISInventoryPaneContextMenu.getContainers(self:getDoctor())
    local done = {}
    local childContainers = {}
    for i=1,containers:size() do
        local container = containers:get(i-1)
        done[container] = true
        table.wipe(childContainers)
        self:checkContainerItems(container, childContainers)
        for _,container2 in ipairs(childContainers) do
            if not done[container2] then
                done[container2] = true
                self:checkContainerItems(container2, nil)
            end
        end
    end
end

function BaseHandler:checkContainerItems(container, childContainers)
    local containerItems = container:getItems()
    for i=1,containerItems:size() do
        local item = containerItems:get(i-1)
        if item:IsInventoryContainer() then
            if childContainers then
                table.insert(childContainers, item:getInventory())
            end
        else
            self:checkItem(item)
        end
    end
end

function BaseHandler:dropItems(items)
    return false
end

function BaseHandler:addItem(items, item)
    table.insert(items, item)
end

function BaseHandler:getAllItemTypes(items)
    local done = {}
    local types = {}
    for _,item in ipairs(items) do
        if not done[item:getFullType()] then
            table.insert(types, item:getFullType())
            done[item:getFullType()] = true
        end
    end
    return types
end

function BaseHandler:getItemOfType(items, type)
    for _,item in ipairs(items) do
        if item:getFullType() == type then
            return item
        end
    end
    return nil
end

function BaseHandler:getItemOfTag(items, type)
    for _,item in ipairs(items) do
        if item:hasTag(type) then
            return item
        end
    end
    return nil
end

function BaseHandler:getAllItemsOfType(items, type)
    local items = {}
    for _,item in ipairs(items) do
        if item:getFullType() == type then
            table.insert(items, item)
        end
    end
    return items
end

function BaseHandler:onMenuOptionSelected(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    ISTimedActionQueue.add(HealthPanelAction:new(self:getDoctor(), self, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8))
end

function BaseHandler:toPlayerInventory(item, previousAction)
    if item:getContainer() ~= self:getDoctor():getInventory() then
        local action = ISInventoryTransferAction:new(self:getDoctor(), item, item:getContainer(), self:getDoctor():getInventory())
        ISTimedActionQueue.addAfter(previousAction, action)
        -- FIXME: ISHealthPanel.actions never gets cleared
        self.panel.actions = self.panel.actions or {}
        self.panel.actions[action] = self.bodyPart
        return action
    end
    return previousAction
end

function BaseHandler:getDoctor()
    return self.panel.otherPlayer or self.panel.character
end

function BaseHandler:getPatient()
    return self.panel.character
end


local HApplyPoultice = BaseHandler:derive("HApplyPoultice")

function HApplyPoultice:new(panel, bodyPart, itemType, menuLabel, actionClass)
    local o = BaseHandler.new(self, panel, bodyPart)
    o.items.ITEMS = {}
    o.itemType = itemType
    o.menuLabel = menuLabel
    o.actionClass = actionClass
    return o
end

function HApplyPoultice:checkItem(item)
    if item:getType() == self.itemType then
        self:addItem(self.items.ITEMS, item)
    end
end

function HApplyPoultice:addToMenu(context)
    local types = self:getAllItemTypes(self.items.ITEMS)
    if #types > 0 and self:isInjured() and
            self.bodyPart:getPlantainFactor() == 0 and
            self.bodyPart:getComfreyFactor() == 0 and
            self.bodyPart:getGarlicFactor() == 0 then
        local option = context:addOption(getText(self.menuLabel), nil)
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        for i=1,#types do
            local item = self:getItemOfType(self.items.ITEMS, types[i])
            subMenu:addOption(item:getName(), self, self.onMenuOptionSelected, types[i])
        end
    end
end

function HApplyPoultice:dropItems(items)
    local types = self:getAllItemTypes(items)
    if #self.items.ITEMS > 0 and #types == 1 and self:isInjured() and
            self.bodyPart:getPlantainFactor() == 0 and
            self.bodyPart:getComfreyFactor() == 0 and
            self.bodyPart:getGarlicFactor() == 0 then
        self:onMenuOptionSelected(types[1])
        return true
    end
    return false
end

function HApplyPoultice:isValid(itemType)
    self:checkItems()
    return self:getItemOfType(self.items.ITEMS, itemType) and self:isInjured() and
        self.bodyPart:getPlantainFactor() == 0 and
        self.bodyPart:getComfreyFactor() == 0 and
        self.bodyPart:getGarlicFactor() == 0
end

function HApplyPoultice:perform(previousAction, itemType)
    local item = self:getItemOfType(self.items.ITEMS, itemType)
    previousAction = self:toPlayerInventory(item, previousAction)
    local action = self.actionClass:new(self:getDoctor(), self:getPatient(), item, self.bodyPart)
    ISTimedActionQueue.addAfter(previousAction, action)
end

----------------------------------
 
local HApplyBurnTreatment = HApplyPoultice:derive("HApplyBurnTreatment")

function HApplyBurnTreatment:new(panel, bodyPart)
    return HApplyPoultice.new(self, panel, bodyPart, "BurnTreatment", "ContextMenu_BurnTreatment", ISMMBurnTreatment)
end

local HApplyPowderPackHemostatic = HApplyPoultice:derive("HApplyPowderPackHemostatic")

function HApplyPowderPackHemostatic:new(panel, bodyPart)
    return HApplyPoultice.new(self, panel, bodyPart, "PowderPackHemostatic", "ContextMenu_PackHemostatic", ISMMPowderPackHemostatic)
end

local HApplyTourniquet = HApplyPoultice:derive("HApplyTourniquet")
function HApplyTourniquet:new(panel, bodyPart)
    return HApplyPoultice.new(self, panel, bodyPart, "Tourniquet", "ContextMenu_Tourniquet", ISMMTourniquet)
end

local HApplyTourniquetNeck = HApplyPoultice:derive("HApplyTourniquetNeck")
function HApplyTourniquetNeck:new(panel, bodyPart)
    return HApplyPoultice.new(self, panel, bodyPart, "Tourniquet", "ContextMenu_Tourniquet", ISMMTourniquetOnNeck)
end

local old_ISHealthPanel_doBodyPartContextMenu = ISHealthPanel.doBodyPartContextMenu
function ISHealthPanel:doBodyPartContextMenu(bodyPart, x, y)
    old_ISHealthPanel_doBodyPartContextMenu(self, bodyPart, x, y)
    
    local playerNum = self.otherPlayer and self.otherPlayer:getPlayerNum() or self.character:getPlayerNum()
    local context = getPlayerContextMenu(playerNum);

    local handlers = {}
    table.insert(handlers, HApplyBurnTreatment:new(self, bodyPart))
    table.insert(handlers, HApplyPowderPackHemostatic:new(self, bodyPart))
    table.insert(handlers, HApplyTourniquet:new(self, bodyPart))
    table.insert(handlers, HApplyTourniquetNeck:new(self, bodyPart))

    self:checkItems(handlers)
    
    if bodyPart:isBurnt() then
        handlers[1]:addToMenu(context)
    end
    if bodyPart:bleeding() then
        handlers[2]:addToMenu(context)
        if bodyPart:getType() == BodyPartType.Neck then
            handlers[4]:addToMenu(context)
        elseif not (bodyPart:getType() == BodyPartType.Torso_Upper or 
            bodyPart:getType() == BodyPartType.Torso_Upper or
            bodyPart:getType() == BodyPartType.Torso_Lower or
            bodyPart:getType() == BodyPartType.Head or
            bodyPart:getType() == BodyPartType.Groin) then
            handlers[3]:addToMenu(context)
        end
    end

    -- if self.blockingMessage or context:isEmpty()  then
        -- context:setVisible(false);
    -- end

    -- if JoypadState.players[playerNum+1] and context:getIsVisible() then
        -- context.mouseOver = 1
        -- context.origin = self
        -- JoypadState.players[playerNum+1].focus = context
        -- updateJoypadFocus(JoypadState.players[playerNum+1])
    -- end
end