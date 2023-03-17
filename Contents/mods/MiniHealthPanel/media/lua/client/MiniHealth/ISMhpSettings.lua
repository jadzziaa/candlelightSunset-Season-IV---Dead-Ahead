ISMhpSettings = ISPanel:derive("ISMhpSettings")

function ISMhpSettings:new(x,y,width)
	local panel = {}
	panel = ISPanel:new(x,y,width,50)
	setmetatable(panel, self);
    self.__index = self;
	
	panel.width = width

	return panel
end

function ISMhpSettings:initialise()
	ISPanel.initialise(self)
end

function ISMhpSettings:createChildren()
	local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)

	local btnWid = 100
    local btnHgt = math.max(25, FONT_HGT_SMALL + 3 * 2)
    local padBottom = 10

	self.ok = ISButton:new(10, self:getHeight() - padBottom - btnHgt, btnWid, btnHgt, getText("IGUI_RadioSave"), self, ISMhpSettings.validateButton)
	self.ok.internal = "SAVE";
    self.ok.anchorTop = false
    self.ok.anchorBottom = true
    self.ok:initialise();
    self.ok:instantiate();
    self.ok.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.ok);

	self.tickBox = ISTickBox:new(10, 50, 100, FONT_HGT_SMALL + 5, "Mhp options", self, self.onTicked)
    self.tickBox.choicesColor = {r=1, g=1, b=1, a=1}
    self.tickBox.leftMargin = 2
    self.tickBox:setFont(UIFont.Small)
    self:addChild(self.tickBox);
end

function ISMhpSettings:getOpen()
	return self.isOpen;
end

function ISMhpSettings:setOpen(isOpen,x,y,width)
	self:setVisible(isOpen)
	
	if isOpen then
		self.width = width
		self:setWidth(width)
		self:setX(x)
		self:setY(y)
	end
	
	if isOpen and not self.isOpen then
		self:addToUIManager()
	elseif not isOpen and self.isOpen then
		self:removeFromUIManager()
	end

	self.isOpen = isOpen
end

function ISMhpSettings:populateOptions()
	self.setFunction = {}
	self:addOption("Always visible", mhpHandle.alwaysShow, function(mhpHandle, selected)
		mhpHandle:toggleAlwaysShow(selected)
	end)
	self:addOption("Health bar", mhpHandle.showHpBar, function(mhpHandle, selected)
		mhpHandle:toggleHpBar(selected)
	end)
	self:addOption("Lock window", not mhpHandle.moveWithMouse, function(mhpHandle, selected)
		mhpHandle:toggleLock(not selected)
	end)

	self.tickBox:setWidthToFit()

	self:setHeight(self.tickBox:getBottom() + 20 + self.ok:getHeight() + 10)
end

function ISMhpSettings:addOption(text, selected, setFunction)
    local n = self.tickBox:addOption(text)
    self.tickBox:setSelected(n, selected)
    self.setFunction[n] = setFunction
end

function ISMhpSettings:validateButton()
	for i=1,#self.tickBox.options do
		self.setFunction[i](mhpHandle, self.tickBox:isSelected(i))
	end

	self.isOpen = false
	self:setVisible(false);
end

function ISMhpSettings:prerender()
	local z = 20;
    local splitPoint = 100;
    local x = 10;
    self:drawRect(0, 0, self.width, self.height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
    self:drawRectBorder(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);
    self:drawText("Settings", self.width/2 - (getTextManager():MeasureStringX(UIFont.Medium, "Settings") / 2), z, 1,1,1,1, UIFont.Medium);
end