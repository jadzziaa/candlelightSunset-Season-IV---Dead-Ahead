local fontConfig = {
    Small   = {y=15,iconY=2},
    Medium  = {y=20,iconY=4},
    Large   = {y=20,iconY=6},
}
local attachmentSlotTexture = getTexture("media/textures/Item_NATTAttachmentSlot.png");

local function getSlotTypes(attachments)
    local slotsTypes = {}
    for k,v in pairs(attachments) do
        if v then
            table.insert(slotsTypes,k) 
        end
    end
    return slotsTypes;
end

local function injectTooltip(slotsTypes,self)
    local fontSize = getCore():getOptionTooltipFont();
    local th = self.tooltip:getHeight();
    local height = fontConfig[fontSize].y*(#slotsTypes+1)
    self:setY(self.tooltip:getY()+th);
    self:setHeight(height);
    self:drawRect(0, 0, self.width, self.height+10, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
    self:drawRectBorder(0, 0, self.width, self.height+10, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);
    local x = 15
    local y = th+5
    self.tooltip:DrawText(self.tooltip:getFont(), getText("IGUI_NATT_AttachmentSlots")..":", 5, y, 1,1,0.8,self.borderColor.a);
    for _,v in ipairs(slotsTypes) do
        local slotName = NATTSlotsName[v]
        if slotName then
            y=y+fontConfig[fontSize].y
            self.tooltip:DrawTextureScaledAspect(attachmentSlotTexture, x-10, y+fontConfig[fontSize].iconY, 10, 10, 1, 1, 1, 1)
            self.tooltip:DrawText(self.tooltip:getFont(),slotName, x, y, 1,1,1,1);
        end
    end
end

local oldRender = ISToolTipInv.render
function ISToolTipInv:render()
    if not ISContextMenu.instance or not ISContextMenu.instance.visibleCheck then
        local item = self.item
        if not item:IsInventoryContainer() then oldRender(self) return end
        local modData = item:getModData()
        if not modData.NATTattachments then oldRender(self) return end
        local slotsTypes = getSlotTypes(modData.NATTattachments)
        if #slotsTypes < 1 then oldRender(self) return end
        injectTooltip(slotsTypes,self)
        oldRender(self)
    end
end