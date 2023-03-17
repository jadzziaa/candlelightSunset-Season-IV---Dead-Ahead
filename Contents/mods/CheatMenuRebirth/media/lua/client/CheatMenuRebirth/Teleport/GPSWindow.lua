require "ISTimer"
GPSWindow = ISCollapsableWindow:derive("GPSWindow");

GPSWindow.compassLines = {}

function GPSWindow:initialise()
	ISCollapsableWindow.initialise(self);
end

function GPSWindow:new(x, y, width, height)
	local o = {};
	o = ISCollapsableWindow:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	o.title = "GPS";
	o.pin = false;
	o:noBackground();
	return o;
end

function GPSWindow:createChildren()
	ISCollapsableWindow.createChildren(self);
	self.HomeWindow = ISRichTextPanel:new(0, 16, 250, 400);
	self.HomeWindow:initialise();
	self.HomeWindow.autosetheight = false
	self.HomeWindow:ignoreHeightChange()
	self:addChild(self.HomeWindow)
end


function CheatWindowCreate()
	GPSWindow = GPSWindow:new(35, 250, 250, 400)
	GPSWindow:addToUIManager();
	GPSWindow:setVisible(false);
	GPSWindow.pin = true;
	GPSWindow.resizable = true
end

--function ISTextEntryBox:onCommandEntered()
	--local str = ISUILuaWindow.LuaBar:getText()
	--ISUILuaWindow.LuaBar:setText(str.."\n ")
--end



Events.OnGameStart.Add(CheatWindowCreate);