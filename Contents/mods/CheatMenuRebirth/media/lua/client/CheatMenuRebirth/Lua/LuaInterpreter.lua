ISUILuaWindow = ISCollapsableWindow:derive("ISUILuaWindow");

function ISUILuaWindow:initialise()
	ISCollapsableWindow.initialise(self);
	
	local hgt;
	--[[
	if isClient() then
		hgt = 16
	else
		hgt = self:titleBarHeight()
	end
	--]]
	
	self.LuaBar = ISTextEntryBox:new("", 0, self:titleBarHeight(), self:getWidth() / 1.15, self:getHeight() + 1);
	self.LuaBar:initialise();
	self.LuaBar:instantiate();
	self.LuaBar:setMultipleLine(true)
	self.LuaBar.javaObject:setMaxLines(99999);
	self:addChild(self.LuaBar);
	
	local btnX = math.floor(self:getWidth() - (self:getWidth() - self.LuaBar:getWidth()))
	local btnWidth = math.floor(self:getWidth() - self.LuaBar:getWidth())
	local btnHeight = math.floor(self.LuaBar:getHeight() / 3)
	



	self.pathBar = ISTextEntryBox:new(getText("UI_CMRB_Lua_Filename"), 0, self.LuaBar:getHeight() + self:titleBarHeight(), self.LuaBar:getWidth(), self.LuaBar:getHeight() / 10);
	self.pathBar:initialise();
	self.pathBar:instantiate();
	self.pathBar:setMultipleLine(false)
	self.pathBar.javaObject:setMaxLines(1);
	self.pathBar.borderColor = {r=0.4, g=0.4, b=0.4, a=0.4};
	self.pathBar:setVisible(false);
	self:addChild(self.pathBar);
	
	
	local mod = getModInfoByID("CheatMenuRB")
	local destPath = mod:getDir().."\\user_lua\\"
	
	self.pathBox = ISRichTextPanel:new(0, self.LuaBar:getHeight() + self.pathBar:getHeight() + self:titleBarHeight(), self.LuaBar:getWidth(), ((getCore():getScreenHeight() / 2.8) - 15) - (self.LuaBar:getHeight() + self.pathBar:getHeight()));
	self.pathBox.borderColor = {r=0.4, g=0.4, b=0.4, a=0.4};
	self.pathBox.marginTop = 4;
	self.pathBox.text = getText("UI_CMRB_Lua_ScrollDown") .. destPath
	self.pathBox:initialise();
	self.pathBox.autosetheight = false;
	self.pathBox:paginate();
	self.pathBox:setVisible(false);
	self:addChild(self.pathBox);

	self.goButton = ISButton:new(btnX, self.pathBar:getY(), btnWidth, self.pathBar:getHeight(), "Go", self, function() ISUILuaWindow.portLua() end);
	self.goButton:initialise();
	self.goButton:instantiate();
	self.goButton.borderColor = {r=0.4, g=0.4, b=0.4, a=0.4};
	self.goButton:setVisible(false);
	self:addChild(self.goButton);
	
	self.closeButton = ISButton:new(btnX, self.pathBox:getY(), btnWidth, self.pathBox:getHeight(), "Close", self, ISUILuaWindow.togglePathBar); 
	self.closeButton:initialise();
	self.closeButton:instantiate();
	self.closeButton.borderColor = {r=0.4, g=0.4, b=0.4, a=0.4};
	self.closeButton:setVisible(false);
	self:addChild(self.closeButton);
	
	
	self.confirmBox = ISRichTextPanel:new(self.LuaBar:getWidth() / 6,self.LuaBar:getHeight() / 2.5,self.LuaBar:getWidth() / 1.5,self.LuaBar:getHeight() / 3);
	self.confirmBox.backgroundColor = {r=0, g=0, b=0, a=0.8};
	self.confirmBox.borderColor = {r=0.4, g=0.4, b=0.4, a=1};
	self.confirmBox.text = getText("UI_CMRB_Lua_FileExists");
	
	self.confirmBox.noButton = ISButton:new(self.confirmBox:getWidth() / 16, self.confirmBox:getHeight() / 2.5, self.confirmBox:getWidth() / 2.5, self.confirmBox:getHeight() / 2, "NO", self, function() ISUILuaWindow.confirmBox:setVisible(false) end);
	self.confirmBox.noButton.borderColor = {r=0.4, g=0.4, b=0.4, a=0.6};
	self.confirmBox.yesButton = ISButton:new(self.confirmBox:getWidth() / 1.88, self.confirmBox:getHeight() / 2.5, self.confirmBox:getWidth() / 2.5, self.confirmBox:getHeight() / 2, "YES", self, function() ISUILuaWindow.portLua(nil,false,true); ISUILuaWindow.confirmBox:setVisible(false) end);
	self.confirmBox.yesButton.borderColor = {r=0.4, g=0.4, b=0.4, a=0.6};
	self.confirmBox:addChild(self.confirmBox.yesButton); -- add these buttons to confirmBox so I can manipulate them as a single element
	self.confirmBox:addChild(self.confirmBox.noButton);
	
	
	self.confirmBox:initialise();
	self.confirmBox.autosetheight = false;
	self.confirmBox:paginate();
	self.confirmBox:setVisible(false);
	self:addChild(self.confirmBox);
	
	self.runButton = ISButton:new(btnX, self:titleBarHeight(), btnWidth, btnHeight, getText("UI_CMRB_Lua_Run"), self, ISUILuaWindow.runLua);
	self.runButton:initialise();
	self.runButton:instantiate();
	self.runButton.borderColor = {r=0.4, g=0.4, b=0.4, a=0.4};
	self:addChild(self.runButton);
	
	self.exportButton = ISButton:new(btnX, self.runButton:getHeight() + self:titleBarHeight(), btnWidth, btnHeight, getText("UI_CMRB_Lua_Export"), self, function() ISUILuaWindow.portLua("export", true) end);
	self.exportButton:initialise();
	self.exportButton:instantiate();
	self.exportButton.borderColor = {r=0.4, g=0.4, b=0.4, a=0.4};
	self:addChild(self.exportButton);
	
	self.importButton = ISButton:new(btnX, (self.runButton:getHeight() * 2) + self:titleBarHeight(), btnWidth, btnHeight, getText("UI_CMRB_Lua_Import"), self, function() ISUILuaWindow.portLua("import", true) end);
	self.importButton:initialise();
	self.importButton:instantiate();
	self.importButton.borderColor = {r=0.4, g=0.4, b=0.4, a=0.4};
	self:addChild(self.importButton);
	

	
end

function ISUILuaWindow.togglePathBar()
	if ISUILuaWindow.pathBar:getIsVisible() ~= true then -- basic if else statement
		ISUILuaWindow:setHeight(getCore():getScreenHeight() / 2.8) -- make the window larger to accomodate for the new bar
		ISUILuaWindow.pathBar:setVisible(true) -- unhide the pathbar elements
		ISUILuaWindow.goButton:setVisible(true)
		ISUILuaWindow.pathBox:setVisible(true)
		ISUILuaWindow.closeButton:setVisible(true)
	else
		ISUILuaWindow:setHeight((getCore():getScreenHeight() / 3.5) + ISUILuaWindow:titleBarHeight()) -- else, shrink it back to normal
		ISUILuaWindow.pathBar:setVisible(false) -- set everything to nonvisible
		ISUILuaWindow.goButton:setVisible(false)
		ISUILuaWindow.pathBox:setVisible(false)
		ISUILuaWindow.closeButton:setVisible(false)
	end
end


function ISUILuaWindow.portLua(mode, noStart, doNotCheck)
	
	if ISUILuaWindow.pathBar:getIsVisible() ~= true then
		ISUILuaWindow.togglePathBar()
	end
	

	if type(mode) == "string" then -- set the mode, either export or import
		ISUILuaWindow["mode"] = mode
	end
	
	
	if noStart ~= true then
		local mod = getModInfoByID("CheatMenuRB")
		local destPath = mod:getDir().."\\user_lua\\"..ISUILuaWindow.pathBar:getText() -- for the user to look at
		local destPath2 = "user_lua/" .. string.gsub(ISUILuaWindow.pathBar:getText(), ".lua", "") .. ".lua" -- for the game-relative path
		
		if ISUILuaWindow.mode == "export" then -- commence export actions
			local strTable = {}
	
			for i in string.gmatch(ISUILuaWindow.LuaBar:getText(),"[\n]*.+") do -- put each line of the lua bar's content into a separate table entry, so I can write them to a file later
			   strTable[#strTable+1] = i
			end
			if doNotCheck ~= true then
				if fileExists(destPath) then
					print("[CHEAT MENU]: FILE "..destPath.." ALREADY EXISTS! Prompting user to overwrite.")
					ISUILuaWindow.confirmBox:setVisible(true)
					return false
				end
			end
			CheatCoreCM.writeFile(strTable, "CheatMenuRB", destPath2)
			print("[CHEAT MENU] File successfully written!")
		elseif ISUILuaWindow.mode == "import" then -- otherwise, commence import actions
			if fileExists(destPath) then -- check if the file exists first, to prevent errors and to prevent readFile from creating a new file
				local fileT = CheatCoreCM.readFile("CheatMenuRB", destPath2) -- CheatCoreCM.readFile returns table of file, line by line.
				ISUILuaWindow.LuaBar:clear() -- clear the lua interpreter first
				for i = 1,#fileT do
					ISUILuaWindow.LuaBar:setText(ISUILuaWindow.LuaBar:getText()..fileT[i].."\n")
				end
				print("[CHEAT MENU] File successfully imported!") -- inform user in console if successful
			else
				print("[CHEAT MENU] Error: file does not exist!") -- or if unsuccessful.
			end
		end
	end
end

function ISUILuaWindow:new(x, y, width, height)
	local o = {};
	o = ISCollapsableWindow:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	o.title = getText("UI_CMRB_Lua_Interpreter");
	o.pin = true;
	o.resizable = false
	o:noBackground();
	o.borderColor = {r=0.4, g=0.4, b=0.4, a=0.4};
	return o;
end

function ISUILuaWindow.runLua()
	--[[
	local fail, message, stacktrace = pcall(loadstring(ISUILuaWindow.LuaBar:getText()))
	print(fail)
	print(message)
	print(stacktrace)
	--]]
	loadstring(ISUILuaWindow.LuaBar:getText())()
end

function ISUILuaWindow.SetupBar()
	ISUILuaWindow:setVisible(true)
	ISUILuaWindow.LuaBar:setEditable(true)
	ISUILuaWindow.LuaBar.borderColor = {r=0.4, g=0.4, b=0.4, a=0.4}; -- for some reason LuaBar's border color refused to stick if I defined it in the init or anywhere else.
end

function LuaWindowCreate() -- basic UI setup
	ISUILuaWindow = ISUILuaWindow:new(math.floor(getCore():getScreenWidth() / 3), math.floor(getCore():getScreenHeight() / 2), math.floor(getCore():getScreenWidth() / 3), math.floor(getCore():getScreenHeight() / 3.5));
	ISUILuaWindow:initialise();
	ISUILuaWindow:addToUIManager();
	ISUILuaWindow:setVisible(false);
	ISUILuaWindow:setHeight(ISUILuaWindow:getHeight() + ISUILuaWindow:titleBarHeight())
end


Events.OnGameStart.Add(LuaWindowCreate);