require "ISUI/Maps/ISWorldMap"
require "DrawOnMap/FreeHandUI"

local _freeHandUi

ISWorldMap.handleFreeHandButtonClick = function(self)
	self.freeHandUI:setVisible(not self.freeHandUI:getIsVisible())
end

local function createFreeHandUI(symbolsUI)
    local freeHandUI = FreeHandUI:new(20, getCore():getScreenHeight() - 240, 225, 150, symbolsUI)
    freeHandUI:setAnchorLeft(true)
	freeHandUI:setAnchorRight(false)
    freeHandUI:init()
    return freeHandUI
end

ISWorldMap.createChildren_prepatch_drawonmap = ISWorldMap.createChildren;
ISWorldMap.createChildren = function(self)
	self:createChildren_prepatch_drawonmap();

    self.freeHandUI = createFreeHandUI(self.symbolsUI)
    self:addChild(self.freeHandUI)

    _freeHandUi = self.freeHandUI

    self.freeHandButton = ISButton:new(0, 0, 48, 48, "", self, self.handleFreeHandButtonClick);
    self.freeHandButton:setImage(getTexture("media/ui/DrawOnTheMap/pencil_icon.png"));
    self:addChild(self.freeHandButton)

    local worldMap = self;
    self.freeHandButton.prerender = function(self)
		ISButton.prerender(self)
		
		local offset = 68 --20px spacing + 48px img
		if worldMap.legendButton then
			self:setX(worldMap.legendButton:getX() + offset)
			self:setY(worldMap.legendButton:getY())
		else
			self:setX(20)
			self:setY(getCore():getScreenHeight() - offset)
		end
	end
end

ISMap.createChildren_prepatch_drawonmap = ISMap.createChildren;
ISMap.createChildren = function(self)
	self:createChildren_prepatch_drawonmap();

    self.freeHandUI = createFreeHandUI(self.symbolsUI)
    self.freeHandUI:setVisible(false)
    self:addChild(self.freeHandUI)
end

ISMap.onButtonClick_prepatch_drawonmap = ISMap.onButtonClick;
ISMap.onButtonClick = function(self, button)
	self:onButtonClick_prepatch_drawonmap(button);

	if button.internal == "SYMBOLS" then
		self.freeHandUI:setVisible(self.symbolsUI:isVisible())
    end  
end

local function OnResolutionChange()
	if _freeHandUi then
		_freeHandUi:setX(20)
		_freeHandUi:setY(getCore():getScreenHeight() - 240)
	end
end

Events.OnResolutionChange.Add(OnResolutionChange)
