require "ISUI/ISInventoryPage"

-- Add background and border to new buttons
ISInventoryPage.addContainerButton_pre_backpack_borders = ISInventoryPage.addContainerButton;
function ISInventoryPage:addContainerButton(...)
    local button = self:addContainerButton_pre_backpack_borders(...);
    button:setBorderRGBA(0.6, 0.6, 0.6, 0.5)
    button:setBackgroundRGBA(0.12, 0.12, 0.12, 0.7)
    return button;
end

-- Intercept the background color clearing
ISInventoryPage.refreshBackpacks_pre_backpack_borders = ISInventoryPage.refreshBackpacks;
function ISInventoryPage:refreshBackpacks(...)
    self:refreshBackpacks_pre_backpack_borders(...);
    for k,containerButton in ipairs(self.backpacks) do
        if containerButton.inventory ~= self.inventory then
            containerButton:setBackgroundRGBA(0.12, 0.12, 0.12, 0.7)
        end
    end
end

ISInventoryPage.setNewContainer_pre_backpack_borders = ISInventoryPage.setNewContainer;
function ISInventoryPage:setNewContainer(inventory)
    self:setNewContainer_pre_backpack_borders(inventory);
    for i,containerButton in ipairs(self.backpacks) do
        if containerButton.inventory ~= inventory then
            containerButton:setBackgroundRGBA(0.12, 0.12, 0.12, 0.7)
        end
    end
end
