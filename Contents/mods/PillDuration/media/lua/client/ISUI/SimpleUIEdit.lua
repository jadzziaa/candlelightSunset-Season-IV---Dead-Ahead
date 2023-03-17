require "ISUI/ISCollapsableWindow"
require "ISUI/ISSimpleUI"

function ISSimpleUI:openAndAdd()
    if not self.isUIVisible then
        self:setVisible(true);
        self:addToUIManager();
        self.isUIVisible = true;
    end
end

function ISSimpleUI:closeAndRemove()
    if self.isUIVisible then
        self:setVisible(false);
        self:removeFromUIManager();
        self.isUIVisible = false;
    end
end

function ISSimpleUI:getPositionX()
    return self.x;
end

function ISSimpleUI:getPositionY()
    return self.y;
end