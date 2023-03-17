ItemCondition = ItemCondition or {}
ItemCondition.Hooked = ItemCondition.Hooked or {}

if (not ItemCondition.Hooked.ISEquippedItem_render) then
    ItemCondition.Hooked.ISEquippedItem_render = ISEquippedItem.render
end

function ISEquippedItem:render(...)
    local config = ItemCondition.Config.EquippedItem
    if (config.ProgressBarMode > 1) then
        local primaryItem = self.chr:getPrimaryHandItem();
        if (primaryItem) then
            local itemCondition = ItemCondition.Util:GetItemCondition(primaryItem)
            local itemConfigType = ItemCondition.Util:GetItemConfigType(primaryItem)

            local color = itemConfigType.Colors.P100
            if (config.ProgressBarMode == 3) or (config.ProgressBarMode == 5) then
                color = ItemCondition.Util:GetProgressColor(itemConfigType.Colors, itemCondition)
            end

            local texture
            if (config.ProgressBarMode >= 2) and (config.ProgressBarMode <= 3) then
                texture = getTexture("media/ui/qdx/item_condition/circle_v_" .. math.ceil(itemCondition * 10) .. ".png")
            elseif (config.ProgressBarMode >= 4) and (config.ProgressBarMode <= 5) then
                texture = getTexture("media/ui/qdx/item_condition/circle_h_" .. math.ceil(itemCondition * 10) .. ".png")
            end

            if (texture) then
                ItemCondition.UI:DrawTextureScaled(self.mainHand, texture, 1, 1, 44.0, 44.0, config.ProgressBarOpacity, color)
            end
        end

        local secondaryItem = self.chr:getSecondaryHandItem();
        if (secondaryItem) then
            local itemCondition = ItemCondition.Util:GetItemCondition(secondaryItem)
            local itemConfigType = ItemCondition.Util:GetItemConfigType(secondaryItem)

            local color = itemConfigType.Colors.P100
            if (config.ProgressBarMode == 3) or (config.ProgressBarMode == 5) then
                color = ItemCondition.Util:GetProgressColor(itemConfigType.Colors, itemCondition)
            end

            local texture
            if (config.ProgressBarMode >= 2) and (config.ProgressBarMode <= 3) then
                texture = getTexture("media/ui/qdx/item_condition/circle_v_" .. math.ceil(itemCondition * 10) .. ".png")
            elseif (config.ProgressBarMode >= 4) and (config.ProgressBarMode <= 5) then
                texture = getTexture("media/ui/qdx/item_condition/circle_h_" .. math.ceil(itemCondition * 10) .. ".png")
            end

            if (texture) then
                ItemCondition.UI:DrawTextureScaled(self.offHand, texture, 10, 3, 30.0, 30.0, config.ProgressBarOpacity, color)
            end
        end
    end

    ItemCondition.Hooked.ISEquippedItem_render(self, ...)
end
