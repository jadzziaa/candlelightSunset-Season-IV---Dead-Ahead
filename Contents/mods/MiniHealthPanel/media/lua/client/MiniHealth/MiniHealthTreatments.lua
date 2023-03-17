MiniHealthTreatment = {}

-- ==================================================================
-- == Literal copy-paste of items functions from ISHealthPanel.lua ==
-- ==================================================================

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
    return mhpHandle.player
end

function BaseHandler:getPatient()
    return mhpHandle.player
end

-----

local HApplyBandage = BaseHandler:derive("HApplyBandage")

function HApplyBandage:new(panel, bodyPart)
    local o = BaseHandler.new(self, panel, bodyPart)
    o.items.ITEMS = {}
    return o
end

function HApplyBandage:checkItem(item)
    if item:getBandagePower() > 0 then
        self:addItem(self.items.ITEMS, item)
    end
end

function HApplyBandage:addToMenu(context,optionsCount)
    local types = self:getAllItemTypes(self.items.ITEMS)
    if #types > 0 and self:isInjured() then
        optionsCount = optionsCount + 1
        local option = context:addOption(getText("ContextMenu_Bandage"), nil)
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        for i=1,#types do
            local item = self:getItemOfType(self.items.ITEMS, types[i])
            subMenu:addOption(item:getName(), self, self.onMenuOptionSelected, types[i])
        end
    end
    return optionsCount
end

function HApplyBandage:dropItems(items)
    local types = self:getAllItemTypes(items)
    if #self.items.ITEMS > 0 and #types == 1 and self:isInjured() then
        self:onMenuOptionSelected(types[1])
        return true
    end
    return false
end

function HApplyBandage:isValid(itemType)
    self:checkItems()
    return self:getItemOfType(self.items.ITEMS, itemType) and self:isInjured()
end

function HApplyBandage:perform(previousAction, itemType)
    local item = self:getItemOfType(self.items.ITEMS, itemType)
    previousAction = self:toPlayerInventory(item, previousAction)
    local action = ISApplyBandage:new(self:getDoctor(), self:getPatient(), item, self.bodyPart, true)
    ISTimedActionQueue.addAfter(previousAction, action)
end

-----

local HRemoveBandage = BaseHandler:derive("HRemoveBandage")

function HRemoveBandage:new(panel, bodyPart)
    local o = BaseHandler.new(self, panel, bodyPart)
    return o
end

function HRemoveBandage:checkItem(item)
end

function HRemoveBandage:addToMenu(context,optionsCount)
    if self.bodyPart:bandaged() then
        optionsCount = optionsCount + 1
        context:addOption(getText("ContextMenu_Remove_Bandage"), self, self.onMenuOptionSelected)
    end
    return optionsCount
end

function HRemoveBandage:isValid()
    return self.bodyPart:bandaged()
end

function HRemoveBandage:perform(previousAction)
    local action = ISApplyBandage:new(self:getDoctor(), self:getPatient(), nil, self.bodyPart, false)
    ISTimedActionQueue.addAfter(previousAction, action)
end

-----

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

function HApplyPoultice:addToMenu(context,optionsCount)
    local types = self:getAllItemTypes(self.items.ITEMS)
    if #types > 0 and self:isInjured() and
            self.bodyPart:getPlantainFactor() == 0 and
            self.bodyPart:getComfreyFactor() == 0 and
            self.bodyPart:getGarlicFactor() == 0 then
        optionsCount = optionsCount + 1
        local option = context:addOption(getText(self.menuLabel), nil)
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        for i=1,#types do
            local item = self:getItemOfType(self.items.ITEMS, types[i])
            subMenu:addOption(item:getName(), self, self.onMenuOptionSelected, types[i])
        end
    end
    return optionsCount
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

-----

local HApplyComfrey = HApplyPoultice:derive("HApplyComfrey")

function HApplyComfrey:new(panel, bodyPart)
    return HApplyPoultice.new(self, panel, bodyPart, "ComfreyCataplasm", "ContextMenu_ComfreyCataplasm", ISComfreyCataplasm)
end

-----

local HApplyGarlic = HApplyPoultice:derive("HApplyGarlic")

function HApplyGarlic:new(panel, bodyPart)
    return HApplyPoultice.new(self, panel, bodyPart, "WildGarlicCataplasm", "ContextMenu_GarlicCataplasm", ISGarlicCataplasm)
end

-----

local HApplyPlantain = HApplyPoultice:derive("HApplyPlantain")

function HApplyPlantain:new(panel, bodyPart)
    return HApplyPoultice.new(self, panel, bodyPart, "PlantainCataplasm", "ContextMenu_PlantainCataplasm", ISPlantainCataplasm)
end

-----

local HDisinfect = BaseHandler:derive("HDisinfect")

function HDisinfect:new(panel, bodyPart)
    local o = BaseHandler.new(self, panel, bodyPart)
    o.items.ITEMS = {}
    return o
end

function HDisinfect:checkItem(item)
    if item:getAlcoholPower() > 0 then
        self:addItem(self.items.ITEMS, item)
    end
end

function HDisinfect:addToMenu(context,optionsCount)
    local types = self:getAllItemTypes(self.items.ITEMS)
    if #types > 0 and self:isInjured() then
        optionsCount = optionsCount + 1
        local option = context:addOption(getText("ContextMenu_Disinfect"), nil)
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        for i=1,#types do
            local item = self:getItemOfType(self.items.ITEMS, types[i])
            subMenu:addOption(item:getName(), self, self.onMenuOptionSelected, types[i])
        end
    end
    return optionsCount
end

function HDisinfect:dropItems(items)
    local types = self:getAllItemTypes(items)
    if #self.items.ITEMS > 0 and #types == 1 and self:isInjured() then
        self:onMenuOptionSelected(types[1])
        return true
    end
    return false
end

function HDisinfect:isValid(itemType)
    self:checkItems()
    return self:getItemOfType(self.items.ITEMS, itemType) and self:isInjured()
end

function HDisinfect:perform(previousAction, itemType)
    local item = self:getItemOfType(self.items.ITEMS, itemType)
    previousAction = self:toPlayerInventory(item, previousAction)
    local action = ISDisinfect:new(self:getDoctor(), self:getPatient(), item, self.bodyPart)
    ISTimedActionQueue.addAfter(previousAction, action)
end

-----

local HStitch = BaseHandler:derive("HStitch")

function HStitch:new(panel, bodyPart)
    local o = BaseHandler.new(self, panel, bodyPart)
    o.items.ITEMS = {}
    return o
end

function HStitch:checkItem(item)
    if item:getType() == "Needle" or item:hasTag("SewingNeedle") then
        self:addItem(self.items.ITEMS, item)
    end
    if item:getType() == "Thread" and item:getUsedDelta() >= 0 then
        self:addItem(self.items.ITEMS, item)
    end
    if item:getType() == "SutureNeedle" then
        self:addItem(self.items.ITEMS, item)
    end
end

function HStitch:addToMenu(context,optionsCount)
    if not self:isInjured() or not self.bodyPart:isDeepWounded() or self.bodyPart:haveGlass() then
        return optionsCount
    end
    local needle = self:getItemOfType(self.items.ITEMS, "Base.Needle") or self:getItemOfTag(self.items.ITEMS, "SewingNeedle")
    local thread = self:getItemOfType(self.items.ITEMS, "Base.Thread")
    local needlePlusThread = self:getItemOfType(self.items.ITEMS, "Base.SutureNeedle")
    if (needle and thread) or needlePlusThread then
        optionsCount = optionsCount + 1
        local option = context:addOption(getText("ContextMenu_Stitch"), nil)
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        if needlePlusThread then
            subMenu:addOption(needlePlusThread:getName(), self, self.onMenuOptionSelected, needlePlusThread:getFullType(), needlePlusThread:getFullType())
        end
        if needle and thread then
            local text = needle:getName() .. " + " .. thread:getName()
            subMenu:addOption(text, self, self.onMenuOptionSelected, needle:getFullType(), thread:getFullType())
        end
    end
    return optionsCount
end

function HStitch:dropItems(items)
    if not self:isInjured() or not self.bodyPart:isDeepWounded() or self.bodyPart:haveGlass() then
        return false
    end
    local needlePlusThread = self:getItemOfType(self.items.ITEMS, "Base.SutureNeedle")
    if needlePlusThread then
        self:onMenuOptionSelected(needlePlusThread:getFullType(), needlePlusThread:getFullType())
        return true
    end
    local needle = self:getItemOfType(self.items.ITEMS, "Base.Needle") or self:getItemOfTag(self.items.ITEMS, "SewingNeedle")
    local thread = self:getItemOfType(self.items.ITEMS, "Base.Thread")
    if needle and thread then
        self:onMenuOptionSelected(needle:getFullType(), thread:getFullType())
        return true
    end
    return false
end

function HStitch:isValid(needleType, threadType)
    if not self:isInjured() or not self.bodyPart:isDeepWounded() or self.bodyPart:haveGlass() then
        return false
    end
    self:checkItems()
    if needleType == threadType then
        local needlePlusThread = self:getItemOfType(self.items.ITEMS, needleType)
        return needlePlusThread ~= nil
    else
        local needle = self:getItemOfType(self.items.ITEMS, needleType)
        local thread = self:getItemOfType(self.items.ITEMS, threadType)
        return (needle and thread) ~= nil
    end
end

function HStitch:perform(previousAction, needleType, threadType)
    if needleType == threadType then
        local needle = self:getItemOfType(self.items.ITEMS, needleType)
        previousAction = self:toPlayerInventory(needle, previousAction)
        local action = ISStitch:new(self:getDoctor(), self:getPatient(), needle, self.bodyPart, true)
        ISTimedActionQueue.addAfter(previousAction, action)
    else
        local needle = self:getItemOfType(self.items.ITEMS, needleType)
        local thread = self:getItemOfType(self.items.ITEMS, threadType)
        previousAction = self:toPlayerInventory(needle, previousAction)
        previousAction = self:toPlayerInventory(thread, previousAction)
        local action = ISStitch:new(self:getDoctor(), self:getPatient(), thread, self.bodyPart, true)
        ISTimedActionQueue.addAfter(previousAction, action)
    end
end

-----

local HRemoveStitch = BaseHandler:derive("HRemoveStitch")

function HRemoveStitch:new(panel, bodyPart)
    local o = BaseHandler.new(self, panel, bodyPart)
    return o
end

function HRemoveStitch:checkItem(item)
end

function HRemoveStitch:addToMenu(context,optionsCount)
    if self.bodyPart:stitched() then
        optionsCount = optionsCount + 1
        context:addOption(getText("ContextMenu_Remove_Stitch"), self, self.onMenuOptionSelected)
    end
    return optionsCount
end

function HRemoveStitch:isValid()
    return self.bodyPart:stitched()
end

function HRemoveStitch:perform(previousAction)
    local action = ISStitch:new(self:getDoctor(), self:getPatient(), nil, self.bodyPart, false)
    ISTimedActionQueue.addAfter(previousAction, action)
end

-----

local HRemoveGlass = BaseHandler:derive("HRemoveGlass")

function HRemoveGlass:new(panel, bodyPart)
    local o = BaseHandler.new(self, panel, bodyPart)
    o.items.ITEMS = {}
    return o
end

function HRemoveGlass:checkItem(item)
    if item:hasTag("RemoveGlass") or item:getType() == "SutureNeedleHolder" or item:getType() == "Tweezers" then
        self:addItem(self.items.ITEMS, item)
    end
end

function HRemoveGlass:addToMenu(context,optionsCount)
    local types = self:getAllItemTypes(self.items.ITEMS)
    if self:isInjured() and self.bodyPart:haveGlass() then
        optionsCount = optionsCount + 1
        local option = context:addOption(getText("ContextMenu_Remove_Glass"), nil)
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        if #types > 0 then
            for i=1,#types do
                local item = self:getItemOfType(self.items.ITEMS, types[i])
                subMenu:addOption(item:getName(), self, self.onMenuOptionSelected, types[i])
            end
        end
        subMenu:addOption(getText("ContextMenu_Hand"), self, self.onMenuOptionSelected, "Hands")
    end
    return optionsCount
end

function HRemoveGlass:dropItems(items)
    local types = self:getAllItemTypes(items)
    if #self.items.ITEMS > 0 and #types == 1 and self:isInjured() and self.bodyPart:haveGlass() then
        self:onMenuOptionSelected(types[1])
        return true
    end
    return false
end

function HRemoveGlass:isValid(itemType)
    self:checkItems()
    return (self:getItemOfType(self.items.ITEMS, itemType) and self:isInjured() and self.bodyPart:haveGlass()) or (itemType == "Hands" and self:isInjured() and self.bodyPart:haveGlass())
end

function HRemoveGlass:perform(previousAction, itemType)
    if (itemType == "Hands") then
        local action = ISRemoveGlass:new(self:getDoctor(), self:getPatient(), self.bodyPart, true)
        ISTimedActionQueue.add(action)
    else
        local item = self:getItemOfType(self.items.ITEMS, itemType)
        previousAction = self:toPlayerInventory(item, previousAction)
        local action = ISRemoveGlass:new(self:getDoctor(), self:getPatient(), self.bodyPart)
        ISTimedActionQueue.addAfter(previousAction, action)
    end
end

-----

local HSplint = BaseHandler:derive("HSplint")

function HSplint:new(panel, bodyPart)
    local o = BaseHandler.new(self, panel, bodyPart)
    o.items.splint = {}
    o.items.plank = {}
    o.items.rippedSheet = {}
    return o
end

function HSplint:checkItem(item)
    if item:getType() == "Splint" then
        self:addItem(self.items.splint, item)
    end
    if item:getType() == "Plank" or item:getType() == "TreeBranch" or item:getType() == "WoodenStick" then
        self:addItem(self.items.plank, item)
    end
    if item:getType() == "RippedSheets" then
        self:addItem(self.items.rippedSheet, item)
    end
end

function HSplint:addToMenu(context,optionsCount)
    -- can't splint chest/head
    if self.bodyPart:getType() == BodyPartType.Head or self.bodyPart:getType() == BodyPartType.Torso_Upper or self.bodyPart:getType() == BodyPartType.Torso_Lower then
        return optionsCount;
    end;
    if (not self.bodyPart:HasInjury() or self.bodyPart:stitched() or self.bodyPart:getSplintFactor() > 0) or self.bodyPart:getFractureTime() <= 0 or self.bodyPart:getSplintFactor() > 0 then
        return optionsCount;
    end
    local splintType = self:getAllItemTypes(self.items.splint)
    local plankType = self:getAllItemTypes(self.items.plank)
    local rippedSheetType = self:getAllItemTypes(self.items.rippedSheet)
    if #splintType > 0 or (#plankType > 0 and #rippedSheetType > 0) then
        optionsCount = optionsCount + 1
        local option = context:addOption(getText("ContextMenu_Splint"), nil)
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        for i=1,#splintType do
            local item = self:getItemOfType(self.items.splint, splintType[i])
            subMenu:addOption(item:getName(), self, self.onMenuOptionSelected, nil, item:getFullType())
        end
        if #plankType > 0 and #rippedSheetType > 0 then
            local rippedSheet = self:getItemOfType(self.items.rippedSheet, rippedSheetType[1])
            for i=1,#plankType do
                local plank = self:getItemOfType(self.items.plank, plankType[i])
                local text = plank:getName() .. " + " .. rippedSheet:getName()
                subMenu:addOption(text, self, self.onMenuOptionSelected, rippedSheet:getFullType(), plank:getFullType())
            end
        end
    end
    return optionsCount
end

function HSplint:dropItems(items)
    if self.bodyPart:getType() == BodyPartType.Head or
            self.bodyPart:getType() == BodyPartType.Torso_Upper or
            self.bodyPart:getType() == BodyPartType.Torso_Lower or
            not (not self.bodyPart:HasInjury() or self.bodyPart:stitched() or self.bodyPart:getSplintFactor() > 0) or
            self.bodyPart:getFractureTime() <= 0 or
            self.bodyPart:getSplintFactor() > 0 then
        return false
    end
    local splintType = self:getAllItemTypes(self.items.splint)
    if #splintType > 0 then
        self:onMenuOptionSelected(nil, splintType[1])
        return true
    end
    local plankType = self:getAllItemTypes(self.items.plank)
    local rippedSheetType = self:getAllItemTypes(self.items.rippedSheet)
    if #plankType > 0 and #rippedSheetType > 0 then
        self:onMenuOptionSelected(rippedSheetType[1], plankType[1])
        return true
    end
    return false
end

function HSplint:isValid(rippedSheetType, plankType)
    if (not self.bodyPart:HasInjury() or self.bodyPart:stitched() or self.bodyPart:getSplintFactor() > 0) or self.bodyPart:getFractureTime() <= 0 or self.bodyPart:getSplintFactor() > 0 then
        return false
    end
    self:checkItems()
    local splints = self.items.splint
    local planks = self.items.plank
    local rippedSheets = self.items.rippedSheet
    return #splints > 0 or (#planks > 0 and #rippedSheets > 0)
end

function HSplint:perform(previousAction, rippedSheetType, plankType)
    if rippedSheetType then
        local rippedSheet = self:getItemOfType(self.items.rippedSheet, rippedSheetType)
        local plank = self:getItemOfType(self.items.plank, plankType)
        previousAction = self:toPlayerInventory(rippedSheet, previousAction)
        previousAction = self:toPlayerInventory(plank, previousAction)
        local action = ISSplint:new(self:getDoctor(), self:getPatient(), rippedSheet, plank, self.bodyPart, true)
        ISTimedActionQueue.addAfter(previousAction, action)
    else
        local splint = self:getItemOfType(self.items.splint, plankType)
        previousAction = self:toPlayerInventory(splint, previousAction)
        local action = ISSplint:new(self:getDoctor(), self:getPatient(), nil, splint, self.bodyPart, true)
        ISTimedActionQueue.addAfter(previousAction, action)
    end
end

-----

local HRemoveSplint = BaseHandler:derive("HRemoveSplint")

function HRemoveSplint:new(panel, bodyPart)
    local o = BaseHandler.new(self, panel, bodyPart)
    return o
end

function HRemoveSplint:checkItem(item)
end

function HRemoveSplint:addToMenu(context,optionsCount)
    if (self.bodyPart:HasInjury() or self.bodyPart:stitched() or self.bodyPart:getSplintFactor() > 0) and self.bodyPart:getSplintFactor() > 0 then
        optionsCount = optionsCount + 1
        context:addOption(getText("ContextMenu_Remove_Splint"), self, self.onMenuOptionSelected)
    end
    return optionsCount
end

function HRemoveSplint:isValid()
    return (self.bodyPart:HasInjury() or self.bodyPart:stitched() or self.bodyPart:getSplintFactor() > 0) and self.bodyPart:getSplintFactor() > 0
end

function HRemoveSplint:perform(previousAction)
    local action = ISSplint:new(self:getDoctor(), self:getPatient(), nil, nil, self.bodyPart, false)
    ISTimedActionQueue.addAfter(previousAction, action)
end

-----

local HRemoveBullet = BaseHandler:derive("HRemoveBullet")

function HRemoveBullet:new(panel, bodyPart)
    local o = BaseHandler.new(self, panel, bodyPart)
    o.items.ITEMS = {}
    return o
end

function HRemoveBullet:checkItem(item)
    if item:hasTag("RemoveBullet") or item:getType() == "Tweezers" or item:getType() == "SutureNeedleHolder" then
        self:addItem(self.items.ITEMS, item)
    end
end

function HRemoveBullet:addToMenu(context,optionsCount)
    local types = self:getAllItemTypes(self.items.ITEMS)
    if #types > 0 and self:isInjured() and self.bodyPart:haveBullet() then
        optionsCount = optionsCount + 1
        local option = context:addOption(getText("ContextMenu_Remove_Bullet"), nil)
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        for i=1,#types do
            local item = self:getItemOfType(self.items.ITEMS, types[i])
            subMenu:addOption(item:getName(), self, self.onMenuOptionSelected, item:getFullType())
        end
    end
    return optionsCount
end

function HRemoveBullet:dropItems(items)
    local types = self:getAllItemTypes(items)
    if #self.items.ITEMS > 0 and #types == 1 and self:isInjured() and self.bodyPart:haveBullet() then
        self:onMenuOptionSelected(types[1])
        return true
    end
    return false
end

function HRemoveBullet:isValid(itemType)
    return self:isInjured() and self.bodyPart:haveBullet() and self:getItemOfType(self.items.ITEMS, itemType)
end

function HRemoveBullet:perform(previousAction, itemType)
    local item = self:getItemOfType(self.items.ITEMS, itemType)
    previousAction = self:toPlayerInventory(item, previousAction)
    local action = ISRemoveBullet:new(self:getDoctor(), self:getPatient(), self.bodyPart)
    ISTimedActionQueue.addAfter(previousAction, action)
end

-----

local HCleanBurn = BaseHandler:derive("HCleanBurn")

function HCleanBurn:new(panel, bodyPart)
    local o = BaseHandler.new(self, panel, bodyPart)
    o.items.ITEMS = {}
    return o
end

function HCleanBurn:checkItem(item)
    if item:getBandagePower() >= 2 then
        self:addItem(self.items.ITEMS, item)
    end
end

function HCleanBurn:addToMenu(context,optionsCount)
    local types = self:getAllItemTypes(self.items.ITEMS)
    if #types > 0 and self:isInjured() and self.bodyPart:isNeedBurnWash() then
        optionsCount = optionsCount + 1
        local option = context:addOption(getText("ContextMenu_Clean_Burn"), nil)
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        for i=1,#types do
            local item = self:getItemOfType(self.items.ITEMS, types[i])
            subMenu:addOption(item:getName(), self, self.onMenuOptionSelected, item:getFullType())
        end
    end
    return optionsCount
end

function HCleanBurn:dropItems(items)
    local types = self:getAllItemTypes(items)
    if #self.items.ITEMS > 0 and #types == 1 and self:isInjured() and self.bodyPart:isNeedBurnWash() then
        -- FIXME: A bandage can be used to clean a burn or bandage it
        self:onMenuOptionSelected(types[1])
        return true
    end
    return false
end

function HCleanBurn:isValid(itemType)
    return self:isInjured() and self.bodyPart:isNeedBurnWash() and self:getItemOfType(self.items.ITEMS, itemType)
end

function HCleanBurn:perform(previousAction, itemType)
    local item = self:getItemOfType(self.items.ITEMS, itemType)
    previousAction = self:toPlayerInventory(item, previousAction)
    local action = ISCleanBurn:new(self:getDoctor(), self:getPatient(), item, self.bodyPart)
    ISTimedActionQueue.addAfter(previousAction, action)
end

-----

function MiniHealthTreatment:checkItems(handlers)
    local containers = ISInventoryPaneContextMenu.getContainers(mhpHandle.player)
    local done = {}
    local childContainers = {}
    for i=1,containers:size() do
        local container = containers:get(i-1)
        done[container] = true
        table.wipe(childContainers)
        self:checkContainerItems(container, childContainers, handlers)
        for _,container2 in ipairs(childContainers) do
            if not done[container2] then
                done[container2] = true
                self:checkContainerItems(container, nil, handlers)
            end
        end
    end
end

function MiniHealthTreatment:checkContainerItems(container, childContainers, handlers)
    local containerItems = container:getItems()
    for i=1,containerItems:size() do
        local item = containerItems:get(i-1)
        if item:IsInventoryContainer() then
            if childContainers then
                table.insert(childContainers, item:getInventory())
            end
        else
            for _,handler in ipairs(handlers) do
                handler:checkItem(item)
            end
        end
    end
end

function MiniHealthTreatment:doBodyPartContextMenu(bodyPart, context)
    local playerNum = mhpHandle.playerIndex

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

    self:checkItems(handlers)
    
    local optionsCount = 0

    for _,handler in ipairs(handlers) do
        optionsCount = handler:addToMenu(context, optionsCount)
    end

    if optionsCount <= 0 then
        context:addOption("No action available")
    end

end