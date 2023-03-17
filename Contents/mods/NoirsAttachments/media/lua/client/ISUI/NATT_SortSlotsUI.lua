require "ISUI/ISCollapsableWindow"

NATTSortSlotsUI = ISCollapsableWindow:derive("NATTSortSlotsUI");
NATTSortSlotsUI.instance = nil;
NATTSortSlotsUI.SMALL_FONT_HGT = getTextManager():getFontFromEnum(UIFont.Small):getLineHeight()
NATTSortSlotsUI.MEDIUM_FONT_HGT = getTextManager():getFontFromEnum(UIFont.Medium):getLineHeight()

local UIText = {
    MoveUp = getText("IGUI_NATT_MoveUp"),
    MoveDown = getText("IGUI_NATT_MoveDown"),
    Ok = getText("IGUI_NATT_Ok"),
}

local render = false;
local attachments = {}
local sortedAttachments = ArrayList.new();
local nextSelected = 0
local Direction = {
    UP = "up",
    DOWN = "down",
}

local width = 390
local height = 330

function NATTSortSlotsUI:show(backpack,NATTattachments)
    attachments = NATTattachments
    if NATTSortSlotsUI.instance==nil then
        NATTSortSlotsUI.instance = NATTSortSlotsUI:new (0, 0, width, height, getPlayer(),backpack);
        NATTSortSlotsUI.instance:initialise();
        NATTSortSlotsUI.instance:instantiate();
    end
    NATTSortSlotsUI.instance.pinButton:setVisible(false)
    NATTSortSlotsUI.instance.collapseButton:setVisible(false)
    NATTSortSlotsUI.instance:addToUIManager();
    NATTSortSlotsUI.instance:setVisible(true);
    return NATTSortSlotsUI.instance;
end

function NATTSortSlotsUI:createChildren()
    ISCollapsableWindow.createChildren(self);
    local th = self:titleBarHeight();
    local fontHgtSmall = self.SMALL_FONT_HGT
    local entryHgt = fontHgtSmall + 2 * 2
    local x = 27
    local y = 50

    self.upButton = ISButton:new(x+12, y+50, 80,25,UIText.MoveUp,self, NATTSortSlotsUI.upButton);
    self.upButton:initialise()
    self:addChild(self.upButton);

    self.downButton = ISButton:new(x+12, y+85, 80,25,UIText.MoveDown,self, NATTSortSlotsUI.downButton);
    self.downButton:initialise()
    self:addChild(self.downButton);

    self.okButton = ISButton:new(x+25, y+150, 50,25,UIText.Ok,self, NATTSortSlotsUI.okButton);
    self.okButton:initialise()
    self:addChild(self.okButton);

    self.nattslots = ISScrollingListBox:new(x+130, entryHgt+25, self.width / 2, self.height - 70);
    self.nattslots:initialise();
    self.nattslots:instantiate();
    self.nattslots:setAnchorRight(false)
    self.nattslots:setAnchorBottom(true)
    self.nattslots.font = UIFont.NewSmall;
    self.nattslots.itemheight = 2 + self.MEDIUM_FONT_HGT  + 4;
    self.nattslots.selected = 1;
    self.nattslots.joypadParent = self;
    self.nattslots.drawBorder = false;
    self.nattslots.SMALL_FONT_HGT = self.SMALL_FONT_HGT
    self.nattslots.MEDIUM_FONT_HGT = self.MEDIUM_FONT_HGT   
    self:addChild(self.nattslots);

    for k,v in pairs(attachments) do
        if v then 
            local slotName = NATTSlotsName[k]
            self.nattslots:addItem(slotName,k);
            sortedAttachments:add(k)
        end
    end

end

function NATTSortSlotsUI:swapper(selectedSlot,direction)
    local index = selectedSlot.index-1
    local slot = selectedSlot.item
    if direction == Direction.UP and index == 0 then return end
    if direction == Direction.DOWN and index == sortedAttachments:size()-1 then return end
    local nextIndex = index+nextSelected
    local temp = sortedAttachments:get(nextIndex)
    sortedAttachments:set(nextIndex,slot)
    sortedAttachments:set(index,temp)
    render = true    
end

function NATTSortSlotsUI:upButton()
    local selectedRow = self.nattslots
    if selectedRow.selected == 0 then return end
    local selectedSlot = self.nattslots.items[selectedRow.selected]
    nextSelected = -1
    NATTSortSlotsUI:swapper(selectedSlot,Direction.UP)
end

function NATTSortSlotsUI:downButton()
    local selectedRow = self.nattslots
    if selectedRow.selected == 0 then return end
    local selectedSlot = self.nattslots.items[selectedRow.selected]
    nextSelected = 1
    NATTSortSlotsUI:swapper(selectedSlot,Direction.DOWN)
end

function NATTSortSlotsUI:okButton()
    local sortedSlots = {}
    for i=0, sortedAttachments:size() - 1 do
        sortedSlots[sortedAttachments:get(i)] = true
    end
    self.backpack:getModData().NATTattachments = sortedSlots
    self:close()
end

function NATTSortSlotsUI:render()
    ISCollapsableWindow.render(self);
    if not render then return end
    render = false
    self.nattslots.items = {}
    for i=0, sortedAttachments:size() - 1 do
        local slotName =  NATTSlotsName[sortedAttachments:get(i)]
        self.nattslots:addItem(slotName,sortedAttachments:get(i));
    end
    self.nattslots.selected = self.nattslots.selected+nextSelected
end

function NATTSortSlotsUI:close()
	ISCollapsableWindow.close(self);
    NATTSortSlotsUI.instance = nil
    self.nattslots.items = {}
    attachments = {}
    sortedAttachments = ArrayList.new();
    nextSelected = 0
    self:removeFromUIManager()
end

NATTSortSlotsUI.exitUI = function (key)
    if NATTSortSlotsUI.instance==nil then return end
	NATTSortSlotsUI.instance:close()
end

function NATTSortSlotsUI:new(x, y, width, height, player,backpack)
    local o = {}
    if x == 0 and y == 0 then
        x = (getCore():getScreenWidth() / 2) - (width / 2);
        y = (getCore():getScreenHeight() / 2) - (height / 2);
    end
    o = ISCollapsableWindow:new(x, y, width, height);
    setmetatable(o, self)
    self.__index = self
    o.backpack = backpack
    o.title = backpack:getDisplayName();
    o.resizable = false;
    return o
end

Events.OnKeyPressed.Add(NATTSortSlotsUI.exitUI);
Events.OnKeyKeepPressed.Add(NATTSortSlotsUI.exitUI)