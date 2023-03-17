require "ISUI/ISPanelJoypad"
require "ISUI/ISButton"
require "ISUI/ISScrollingListBox"
require "TimedActions/ISTimedActionQueue"

local function transformToPatern(name) -- For the filter, remove upper and lowercase issue. Like that Short and short is the same thing.
	local toReturn = ""
	for i = 1, #name do
		local c = name:sub(i,i)
		toReturn = toReturn .. "[" .. c:lower() .. c:upper() .. "]"
	end
	return toReturn
end

RFM_ScrollableChannels = ISScrollingListBox:derive("RFM_ScrollableChannels");
RFM_ScrollableChannels.joypadListIndex = 1;

-- function RFM_ScrollableChannels:openFoldersVisible(name)
-- 	for i,k in pairs(self.folders) do
-- 		if not k.hide then
-- 			self:openFolder(i)
-- 		end
-- 	end

-- 	self:setOrder(name);
-- end

-- function RFM_ScrollableChannels:setOrder(name)
-- 	local nitems = {}
-- 	local indexMax = 0
-- 	for i,v in pairs(self.items) do
-- 		if v.folderIndex and v.folderIndex > indexMax then indexMax = v.folderIndex end
-- 	end

-- 	for index = 0, indexMax do -- Do folder in order
-- 		for i,item in pairs(self.items) do -- for all items
-- 			if item.folderIndex == index then -- if folder and folder is good index
-- 				table.insert(nitems, item) -- Add the folder to the list of items
-- 				for j,item2 in pairs(self.items) do -- For all items
-- 					if item2.parent == item.text then -- If the items is the child of the folder
-- 						if name then
-- 							if string.find(item2.text, transformToPatern(name)) then -- If filter
-- 								table.insert(nitems, item2)
-- 							end
-- 						else
-- 							table.insert(nitems, item2)
-- 						end
-- 					end
-- 				end
-- 			end
-- 		end
-- 	end
-- 	self.items = nitems
-- end

-- function RFM_ScrollableChannels:openFolder(folder)
-- 	for i,k in ipairs(self.folders[folder].items) do
-- 		k.text = "child_".. folder .. "_" .. k.text
-- 		self:addItem(k.text, k.item)
-- 	end
-- end

-- function RFM_ScrollableChannels:openAllFolders()
-- 	for i,k in pairs(self.folders) do
-- 		k.hide = false;
-- 	end
-- end

-- function RFM_ScrollableChannels:closeAllFolders()
-- 	for i,k in pairs(self.folders) do
-- 		k.hide = true;
-- 	end
-- end

-- function RFM_ScrollableChannels:closeFolder(folder)
-- 	for i,k in pairs(self.folders[folder].items) do
-- 		self:removeItem(k.text)
-- 	end
-- end

function RFM_ScrollableChannels:doDrawItem(y, item, alt)
	-- -- Folders
    -- if item.isFolder then
    --     local FONT_HGT1 = getTextManager():getFontHeight(self.font)
	-- 	if not self.folders[item.text].hide then self:drawRect(0, y, self:getWidth(), self.itemheight, 1, 0.2, 0.2, 0.2) end
    --     self:drawRectBorder(0, (y), self:getWidth(), self.itemheight, 1, self.borderColor.r, self.borderColor.g, self.borderColor.b);
    --     self:drawText(item.text, 10 * self.UI_SIZE, y + (self.itemheight - FONT_HGT1) / 2, 1, 1, 1, 1, self.font);
    --     return y + self.itemheight;
    -- end

	-- -- Items
	-- -- Add progress bar of condition blood and dirty
	-- local dx = 0
	-- local dx2 = 0
	-- if item.isChild then dx = self:getWidth()/20 end
	-- if self:isVScrollBarVisible() then dx2 = dx end
	-- if SETTINGS_QOLMT.options.fullBar then
	-- 	if item.item:IsClothing() or item.item:IsWeapon() then
	-- 		local r, g
	-- 		local pctCond = item.item:getCondition() / item.item:getConditionMax()
	-- 		r, g = 1 - pctCond, pctCond
	-- 		self:drawRect(self.itemheight+dx, y, (self:getWidth() -self.itemheight-dx) * pctCond, self.itemheight, 0.2, r, g, 0);

	-- 		if item.item:IsClothing() then
	-- 			local pctBlood = item.item:getBloodlevel() / 100
	-- 			self:drawRect(self:getWidth()-dx-dx2, y+self.itemheight*(1-pctBlood), dx, self.itemheight*pctBlood, pctBlood, 0.7, 0, 0);
	-- 			local pctDirt = item.item:getDirtyness() / 100
	-- 			self:drawRect(self:getWidth()-2*dx-dx2, y+self.itemheight*(1-pctDirt), dx, self.itemheight*pctDirt, pctDirt, 0.6, 0.3, 0);
	-- 		end
	-- 	end
	-- else
	-- 	if item.item:IsClothing() or item.item:IsWeapon() then
	-- 		local r, g
	-- 		local pctCond = item.item:getCondition() / item.item:getConditionMax()
	-- 		r, g = 1 - pctCond, pctCond
	-- 		self:drawRect(self:getWidth()-dx-dx2, y+self.itemheight*(1-pctCond), dx, self.itemheight*pctCond, 0.4, r, g, 0);

	-- 		if item.item:IsClothing() then
	-- 			local pctBlood = item.item:getBloodlevel() / 100
	-- 			self:drawRect(self:getWidth()-2*dx-dx2, y+self.itemheight*(1-pctBlood), dx, self.itemheight*pctBlood, pctBlood, 0.7, 0, 0);
	-- 			local pctDirt = item.item:getDirtyness() / 100
	-- 			self:drawRect(self:getWidth()-3*dx-dx2, y+self.itemheight*(1-pctDirt), dx, self.itemheight*pctDirt, pctDirt, 0.6, 0.3, 0);
	-- 		end
	-- 	end
	-- end

    -- -- Add the rectangle
    -- local FONT_HGT1 = getTextManager():getFontHeight(self.font)
    -- self:drawRectBorder(0, (y), self:getWidth(), self.itemheight, 1, self.borderColor.r, self.borderColor.g, self.borderColor.b);
    -- if self.selected == item.index then
    --     local sltCol = nil
    --     if sltCol ~= nil then
    --         self:drawRect(0, (y), self:getWidth(), item.height-1, sltCol.a, sltCol.r, sltCol.g, sltCol.b);
    --     else
    --         self:drawRect(0, (y), self:getWidth(), item.height-1, 0.3, 0.7, 0.35, 0.15);
    --     end
    -- end
    -- local icon = item.item:getTexture()
    -- self:drawTextureScaled(icon, dx+1, y+1, self.itemheight-2, self.itemheight-2, 1, 1, 1, 1)
    -- self:drawRectBorder(dx, y, self.itemheight, self.itemheight, 1, self.borderColor.r, self.borderColor.g, self.borderColor.b);
    -- self:drawText(item.text, dx + 5 + self.itemheight, y + (self.itemheight - FONT_HGT1) / 2, 1, 1, 1, 1, self.font);
	-- self:drawRect(0, y-1, dx, self.itemheight+1, 1, 0.2, 0.2, 0.2);

    -- return y + self.itemheight;
    return 20;
end

function RFM_ScrollableChannels:onClickItem()
	-- if self.selected == -1 then return end
    -- local item = self.items[self.selected].item
    -- local justClose = false;

	-- if not self.toolRender then self.renderTooltip = false; end

    -- -- Remove tooltip
    -- if self.toolRender then
    --     self.toolRender:removeFromUIManager();
    --     self.toolRender = nil;
    --     self.renderTooltip = false;
    --     justClose = true;
    -- end


    -- if not self.items[self.selected].isFolder then
    --     if item and not self.renderTooltip and (not justClose or item ~= self.renderTooltipItem) then
    --         self.toolRender = ISToolTipInv:new(item)
    --         self.toolRender:initialise()
    --         self.toolRender:addToUIManager()
    --         self.toolRender:setVisible(true)
    --         self.toolRender:setOwner(self.parent)
    --         self.toolRender:setCharacter(self.char)
    --         self.toolRender:bringToTop()
    --         self.toolRender.backgroundColor = {r=0, g=0, b=0, a=1};
    --         self.renderTooltipItem = item;
    --         self.renderTooltip = true;
    --     end
    --     self.selectedColor = {r=0.3, g=0.3, b=0.3, a=0.5 }
    -- elseif self.items[self.selected].isFolder then
    --     local folder = self.items[self.selected].text
    --     if self.folders[folder].hide then
    --         self.folders[folder].hide = false;
    --     else
    --         self.folders[folder].hide = true;
    --     end
    -- end
end

function RFM_ScrollableChannels:onMouseDown(x, y, isRight)
	-- if #self.items == 0 then return end
	-- local row = self:rowAt(x, y)

	-- if row > #self.items then
	-- 	row = -1;
	-- end
	-- if row < -1 then
	-- 	row = -1;
	-- end

	-- if not isRight then
	-- 	if self.selected == y then
	-- 		self.selected = -1;
	-- 		return;
	-- 	end
	-- end

	-- if row~=-1 then getSoundManager():playUISound("UISelectListItem") end

	-- self.selected = row;

	-- if self.isItemList then
	-- 	self:onClickItem()
	-- end

	-- if self.onmousedown and row ~= -1 then
	-- 	self.onmousedown(self.target, self.items[self.selected].item);
	-- end
end

function RFM_ScrollableChannels:clear()
	self.items = {}
	for k,v in pairs(self.folders) do
		self.wasHide[k] = v.hide
	end
	self.folders = {}
	self.selected = 1;
	self.itemheightoverride = {}
    self.count = 0;
	self.folderCount = 0;
end

function RFM_ScrollableChannels:isVScrollBarVisible()
    return true;
	-- if self.count * self.itemheight > self.height then return true else return false end
end

-- function RFM_ScrollableChannels:addItem(name, item, folder)
--     local i, j = {}, {}
-- 	if folder then
-- 		if not self.folders[folder] then
-- 			self.folders[folder] = {}

-- 			j.text=folder;
-- 			j.item="folder_" .. folder;
-- 			j.tooltip = nil;
-- 			j.isFolder = true;
-- 			j.parent = "";
-- 			j.folderIndex = FolderIndex[folder]
-- 			j.itemindex = self.count + 1;
-- 			j.height = self.itemheight
-- 			table.insert(self.items, j);
-- 			self:setScrollHeight(self:getScrollHeight()+j.height);
-- 			self.count = self.count + 1;
-- 			self.folderCount = self.folderCount + 1;
-- 			self.folders[folder].count = 0;
-- 			self.folders[folder].items = {}
-- 			if self.wasHide[folder] ~= nil then
-- 				self.folders[folder].hide = self.wasHide[folder];
-- 			else
-- 				self.folders[folder].hide = true;
-- 			end
-- 		end
-- 		i.text=name;
-- 		i.item=item;
-- 		i.tooltip = nil;
-- 		i.itemindex = self.folders[folder].count + 1;
-- 		i.height = self.itemheight
-- 		table.insert(self.folders[folder].items, i);
-- 		self.folders[folder].count = self.folders[folder].count + 1
-- 	else
-- 		if self:isAChild(name) then
-- 			i.isChild = true;
-- 			folder, name = self:isAChild(name)
-- 			i.parent = folder
-- 		end
-- 		i.text=name;
-- 		i.item=item;
-- 		i.tooltip = nil;
-- 		i.itemindex = self.count + 1;
-- 		i.height = self.itemheight
-- 		table.insert(self.items, i);
-- 		self.count = self.count + 1;
-- 		self:setScrollHeight(self:getScrollHeight()+i.height);
-- 	end
--     return i;
-- end

-- function RFM_ScrollableChannels:findFolderName(text)
--     local result = {};
--     for match in (text.."_"):gmatch("(.-)".."_") do
--         table.insert(result, match);
--     end
--     return result[2];
-- end

-- function RFM_ScrollableChannels:isAChild(text)
--     local result = {};
-- 	if string.find(text, "child_") then
-- 		for match in (text.."_"):gmatch("(.-)".."_") do
-- 			table.insert(result, match);
-- 		end
-- 		return result[2], result[3];
-- 	else
-- 		return false
-- 	end
-- end

function RFM_ScrollableChannels:new(x, y, width, height)
	local o = {}
	o = ISScrollingListBox:new(x, y, width, height);
	setmetatable(o, self)
	self.__index = self

	o.UI_SIZE = 1;
	o.folderCount = 0;
	o.isItemList = true;

	o.folders = {}
	o.wasHide = {}
	return o
end

