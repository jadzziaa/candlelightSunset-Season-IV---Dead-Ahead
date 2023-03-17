ISUIGenericWindow = ISCollapsableWindow:derive("ISUIGenericWindow")
ISUIGenericWindow.IDs = {}

function ISUIGenericWindow:initialise()
	ISCollapsableWindow.initialise(self);
end

--function ISUIGenericWindow:setVisible(bool)
	--self.javaObject:setVisible(bool)
--end




function ISUIGenericWindow:new(title, ID, onPress, args)
	local o = ISCollapsableWindow:new(getCore():getScreenWidth() / 2.9, getCore():getScreenHeight() / 1.28, getCore():getScreenWidth() / 10, getCore():getScreenHeight() / 10)
	--ISCollapsableWindow.initialise(o);
	setmetatable(o, self)
	self.__index = self
	o.title = title;
	o.resizable = false;
	--ISCollapsableWindow.initialise(self);
	
	o.func = onPress
	o.args = args
	
	o.InpBar = ISTextEntryBox:new("", 0, o:titleBarHeight(), o:getWidth(), o:getHeight() / 4);
	o.InpBar:initialise();
	o.InpBar:instantiate();
	o.InpBar:setMultipleLine(false)
	o.InpBar.javaObject:setMaxLines(1);
	o:addChild(o.InpBar); -- to center, set border pixel and multiply by border pixel / 2
	
	o.InpButton = ISButton:new(0, o.InpBar:getHeight() + o:titleBarHeight(), o:getWidth(), o:getHeight() / 2, getText("UI_CMRB_Window_Set"), o, function() if o.InpBar:getText() == nil or o.InpBar:getText() == "" then o.func(0, o.args) else o.func(o.InpBar:getText(), o.args) end end); -- function() onPress(o.InpBar:getText(), args); end
	o.InpButton:initialise();
	o.InpButton:instantiate();
	o.InpButton.borderColor = {r=0.4, g=0.4, b=0.4, a=1.0};
	o:addChild(o.InpButton);
	
	o:setHeight(o:getHeight() - (o:titleBarHeight() / 2)) -- remove the space that's usually added for the resize widget
	ISUIGenericWindow.IDs[ID] = o
	return o
end

function ISUIGenericWindow:checkExists(title, ID, onPress, args) -- to prevent duplicates when using it in conjunction with contextmenus. if inputUI returns nil then that means it's the first time the context menu has been opened.
	if ISUIGenericWindow.IDs[ID] == nil then
		local newUI = ISUIGenericWindow:new(title, ID, onPress, args)
		newUI:initialise()
		newUI:addToUIManager()
		newUI:setVisible(false)
	end
	return ISUIGenericWindow.IDs[ID]
end

--Events.OnGameStart.Add(ISUIGenericWindow:initialise())

--[[
CheatCoreCM.toggleWindow = function(label) -- unused
	local window = ISUIGenericWindow[label];
	window:setVisible(true); -- toggles window.not window:getIsVisible() -- I wrote that comment one year ago at this time of writing, I have no idea what it means and I'm just going to leave it in here.
end

CheatCoreCM.createWindows = function()
	for k,v in pairs(ISUIGenericWindow) do -- iterates through all generated windows and initialises them
		ISUIGenericWindow[k] = ISUIGenericWindow[k]:new(getCore():getScreenWidth() / 2.9, getCore():getScreenHeight() / 1.28, getCore():getScreenWidth() / 10, getCore():getScreenHeight() / 10);
		ISUIGenericWindow[k]:initialise();
		ISUIGenericWindow[k]:addToUIManager();
		ISUIGenericWindow[k]:setVisible(false);
	end
end




--start creation of windows for various features--
--CheatCoreCM.setupWindow("Zombie", "Zombie Amount", function(val) CheatCoreCM.HandleToggle('Zombie Brush', nil, "CheatCoreCM.HandleCheck('CheatCoreCM.ZombieBrushEnabled', 'Zombie Brush')", "CheatCoreCM.ZombiesToSpawn = "..tostring(val) ); print(val); end)
--CheatCoreCM.setupWindow("Setter", "Setter", function(val, optionalArgs) local identifier = optionalArgs[1]ptionalArgs[1]; local func = optionalArgs[2] end, CheatCoreCM.GenericSetter)
--]]