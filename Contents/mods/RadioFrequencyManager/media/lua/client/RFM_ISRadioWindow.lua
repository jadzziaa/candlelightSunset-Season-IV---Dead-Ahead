require "RadioCom/ISRadioWindow"
require "RadioCom/RadioWindowModules/RWMPanel"
require "ISUI/ISButton"

-- add a new RadioWindowModule, RWMFrequencyManager
local ISRadioWindow_createChildren =  ISRadioWindow.createChildren;
function ISRadioWindow:createChildren()
    ISRadioWindow_createChildren(self);
    self:addModule(RWMFrequencyManager:new (0, 0, self.width, 0 ), getText("UI_KRFM_RadioTabTitle"), true);
end

-- define module
RWMFrequencyManager = RWMPanel:derive("RWMFrequencyManager");

function RWMFrequencyManager:initialise()
    ISPanel.initialise(self)
end

function RWMFrequencyManager:createChildren()
    self.openRfmButton = ISButton:new(10, 5, self.width-20, 18, getText("UI_KRFM_OpenRfm"), self, RWMFrequencyManager.onOpenRfm);
    self.openRfmButton:initialise();
    self.openRfmButton.backgroundColor = {r=0, g=0, b=0, a=0.0};
    self.openRfmButton.backgroundColorMouseOver = {r=1.0, g=1.0, b=1.0, a=0.1};
    self.openRfmButton.borderColor = {r=1.0, g=1.0, b=1.0, a=0.3};
    self:addChild(self.openRfmButton);
    self:setHeight(5+self.openRfmButton:getHeight()+5);
end

function RWMFrequencyManager:onOpenRfm()
    KaldoRFM_UI.toggle();
end

function RWMFrequencyManager:readFromObject( _player, _deviceObject, _deviceData, _deviceType )
    RWMPanel.readFromObject(self, _player, _deviceObject, _deviceData, _deviceType );
    if self.deviceData:getIsTelevision() or self.deviceData:isNoTransmit() then
        return false;
    end
    return true;
end

function RWMFrequencyManager:update()
    ISPanel.update(self);
end

function RWMFrequencyManager:prerender()
    ISPanel.prerender(self);
end

function RWMFrequencyManager:render()
    ISPanel.render(self);
end

function RWMFrequencyManager:onJoypadDown(button)
    if button == Joypad.AButton then
        self:onOpenRfm()
    end
end

function RWMFrequencyManager:getAPrompt()
    return getText("UI_KRFM_OpenRfm");
end
function RWMFrequencyManager:getBPrompt()
    return nil;
end
function RWMFrequencyManager:getXPrompt()
    return nil;
end
function RWMFrequencyManager:getYPrompt()
    return nil;
end

function RWMFrequencyManager:new(x, y, width, height)
    local o = RWMPanel:new(x, y, width, height);
    setmetatable(o, self)
    self.__index = self
    o.x = x;
    o.y = y;
    o.background = true;
    o.backgroundColor = {r=0, g=0, b=0, a=0.0};
    o.borderColor = {r=0.4, g=0.4, b=0.4, a=1};
    o.width = width;
    o.height = height;
    o.anchorLeft = true;
    o.anchorRight = false;
    o.anchorTop = true;
    o.anchorBottom = false;
    o.fontheight = getTextManager():MeasureStringY(UIFont.Small, "AbdfghijklpqtyZ")+2;
    o.muteState = false;
    return o
end
