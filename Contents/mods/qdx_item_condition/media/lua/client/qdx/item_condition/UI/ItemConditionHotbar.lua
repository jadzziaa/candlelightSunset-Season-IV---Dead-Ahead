ItemCondition = ItemCondition or {}
ItemCondition.Hooked = ItemCondition.Hooked or {}

if (not ItemCondition.Hooked.ISHotbar_render) then
    ItemCondition.Hooked.ISHotbar_render = ISHotbar.render
end

function ISHotbar:render(...)
    local config = ItemCondition.Config.Hotbar
    if (config.ProgressBarMode > 1) then
        local slotX = self.margins;
        local slotY = self.margins;
        for i, _ in pairs(self.availableSlot) do
            local item = self.attachedItems[i]
            if (item) then
                local itemCondition = ItemCondition.Util:GetItemCondition(item)
                local itemConfigType = ItemCondition.Util:GetItemConfigType(item)

                local color = itemConfigType.Colors.P100
                if (config.ProgressBarMode == 3) or (config.ProgressBarMode == 5) then
                    color = ItemCondition.Util:GetProgressColor(itemConfigType.Colors, itemCondition)
                end

                if (config.ProgressBarMode >= 2) and (config.ProgressBarMode <= 3) then
                    ItemCondition.UI:DrawRectProgressVertical(self, itemCondition, slotX, slotY, self.slotWidth, self.slotHeight, 1.0, config.ProgressBarOpacity, color)
                elseif (config.ProgressBarMode >= 4) and (config.ProgressBarMode <= 5) then
                    ItemCondition.UI:DrawRectProgressHorizontal(self, itemCondition, slotX, slotY, self.slotWidth, self.slotHeight, 1.0, config.ProgressBarOpacity, color)
                end
            end

            slotX = slotX + self.slotWidth + self.slotPad;
        end
    end

    ItemCondition.Hooked.ISHotbar_render(self, ...)
end
