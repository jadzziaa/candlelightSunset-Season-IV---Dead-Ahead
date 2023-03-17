ItemCondition = ItemCondition or {}
ItemCondition.UI = ItemCondition.UI or {}

function ItemCondition.UI:GetDraggedItem(a_ui)
    if (not ISMouseDrag.dragging) then
        return nil
    end

    local draggedItem = nil
    local slotIndex = a_ui:getSlotIndexAt(a_ui:getMouseX(), a_ui:getMouseY())
    if (slotIndex ~= -1) then
        local slot = a_ui.availableSlot[slotIndex]
        local items = ISInventoryPane.getActualItems(ISMouseDrag.dragging)
        for _, item in ipairs(items) do
            if a_ui:canBeAttached(slot, item) then
                draggedItem = item
                break
            end
        end
    end

    return draggedItem
end

function ItemCondition.UI:DrawRect(a_ui, a_x, a_y, a_width, a_height, a_alpha, a_color)
    a_ui:drawRect(a_x, a_y, a_width, a_height, a_alpha, a_color.r, a_color.g, a_color.b)
end

function ItemCondition.UI:DrawRectProgressVertical(a_ui, a_progress, a_x, a_y, a_width, a_height, a_padding, a_alpha, a_color)
    local progress = math.floor((a_width - (a_padding * 2)) * a_progress)
    if (a_progress > 0) then
        progress = math.max(progress, 1)
    end

    local x = a_x + a_padding
    local y = a_y + a_padding + a_height - (a_padding * 2) - progress
    local width = a_width - (a_padding * 2)
    local height = progress
    self:DrawRect(a_ui, x, y, width, height, a_alpha, a_color)
end

function ItemCondition.UI:DrawRectProgressHorizontal(a_ui, a_progress, a_x, a_y, a_width, a_height, a_padding, a_alpha, a_color)
    local progress = math.floor((a_width - (a_padding * 2)) * a_progress)
    if (a_progress > 0) then
        progress = math.max(progress, 1)
    end

    local x = a_x + a_padding
    local y = a_y + a_padding
    local width = progress
    local height = a_height - (a_padding * 2)
    self:DrawRect(a_ui, x, y, width, height, a_alpha, a_color)
end

function ItemCondition.UI:DrawTexture(a_ui, a_texture, a_x, a_y, a_alpha, a_color)
    a_ui:drawTexture(a_texture, a_x, a_y, a_alpha, a_color.r, a_color.g, a_color.b)
end

function ItemCondition.UI:DrawTextureScaled(a_ui, a_texture, a_x, a_y, a_width, a_height, a_alpha, a_color)
    a_ui:drawTextureScaled(a_texture, a_x, a_y, a_width, a_height, a_alpha, a_color.r, a_color.g, a_color.b)
end
