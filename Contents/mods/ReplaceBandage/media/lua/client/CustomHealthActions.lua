HReplaceBandage = QL_BaseHandler:derive("HReplaceBandage")

function HReplaceBandage:new(panel, bodyPart)
    local o = QL_BaseHandler.new(self, panel, bodyPart)
    o.items.ITEMS = {}
    return o
end

function HReplaceBandage:checkItem(item)
    if item:getBandagePower() > 0 then
        self:addItem(self.items.ITEMS, item)
    end
end

function HReplaceBandage:addToMenu(context)
    local types = self:getAllItemTypes(self.items.ITEMS)
    if #types > 0 and self.bodyPart:bandaged() then
        local option = context:addOption(getText("Replace Bandage"), nil)
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        for i=1,#types do
            local item = self:getItemOfType(self.items.ITEMS, types[i])
            subMenu:addOption(item:getName(), self, self.onMenuOptionSelected, types[i])
        end
    end
end

function HReplaceBandage:dropItems(items)
    local types = self:getAllItemTypes(items)
    if #self.items.ITEMS > 0 and #types == 1 and self.bodyPart:damaged() then
        self:onMenuOptionSelected(types[1])
        return true
    end
    return false
end

function HReplaceBandage:isValid(itemType)
    self:checkItems()
    return self:getItemOfType(self.items.ITEMS, itemType) and self.bodyPart:bandaged()
end

function HReplaceBandage:perform(previousAction, itemType)
    local removeBandage = ISApplyBandage:new(self:getDoctor(), self:getPatient(), nil, self.bodyPart, false)
    ISTimedActionQueue.addAfter(previousAction, removeBandage)

    local item = self:getItemOfType(self.items.ITEMS, itemType)
    previousAction = self:toPlayerInventory(item, previousAction)
    local addBandage = ISApplyBandage:new(self:getDoctor(), self:getPatient(), item, self.bodyPart, true)
    ISTimedActionQueue.addAfter(removeBandage, addBandage)
end