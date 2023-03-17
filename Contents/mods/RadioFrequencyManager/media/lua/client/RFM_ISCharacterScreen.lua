-- require "ISUI/ISButton"
-- require "ISUI/ISCharacterScreen"

-- local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small);

-- local ISCharacterScreen_create = ISCharacterScreen.create;
-- function ISCharacterScreen:create()
--     ISCharacterScreen_create(self);

--     local x = self.literatureButton:getRight() - self.literatureButton.width;
--     local y = self.literatureButton:getBottom() + 5;

-- 	self.rfmButton = ISButton:new(x, y, 100, FONT_HGT_SMALL, getText("UI_KRFM_OpenRfm"), self, ISCharacterScreen.onOpenRfm);
-- 	self.rfmButton:initialise();
-- 	self.rfmButton:instantiate();
-- 	self.rfmButton.background = false;
-- 	self:addChild(self.rfmButton);
-- end

-- function ISCharacterScreen:onOpenRfm()
--     KaldoRFM_UI.toggle();
-- end

-- local ISCharacterScreen_render = ISCharacterScreen.render;
-- function ISCharacterScreen:render()
--     ISCharacterScreen_render(self);

--     local x = self.literatureButton:getRight() - self.literatureButton:getWidth();
--     local y = self.literatureButton:getBottom() + 10;
--     self.rfmButton:setX(x);
--     self.rfmButton:setY(y);
-- end