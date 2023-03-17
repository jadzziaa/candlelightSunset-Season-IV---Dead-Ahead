-- WILL BE ADDED EVENTUALLY

require "ISUI/ISCollapsableWindow"
local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)

HeaterUI = ISCollapsableWindow:derive("HeaterUI");
HeaterUI.instances = {};
HeaterUI.instancesIso = {};

function HeaterUI.activate( _player, _heater )
    
    local HeaterWindow, instances;

    instances = HeaterUI.instancesIso;

    if instances then
        local HeaterUI = HeaterUI:new()
        HeaterUI:initialise();
    end

    HeaterUI:readFromObject( _player, _heater );

    HeaterUI:addToUIManager();
    HeaterUI:setVisible(true);
end
    

function HeaterUI:initialise()
    ISCollapsableWindow.initialise(self);
end

function HeaterUI:prerender()
    ISCollapsableWindow.prerender(self);
    -- self:drawText("Hello!", 10 ,10, 1,1,1,1, UIFont.Small);

    local ymod = self:titleBarHeight()+1;
    for i=1,#self.modules do
        if self.modules[i].enabled then
            self.modules[i].element:setY(ymod);
            ymod = ymod + self.modules[i].element:getHeight()+1;
        else
            self.modules[i].element:setVisible(false);
        end
    end
    self:setHeight(ymod);
end

function HeaterUI:render()
    ISCollapsableWindow.render(self);
end

function HeaterUI:create()
end

function HeaterUI:addModule( _modulePanel, _moduleName, _enable )
    local module = {};
    module.enabled = _enable;
    --module.panel = _modulePanel;
    --module.name = _moduleName;
    module.element = RWMElement:new (0, 0, self.width, 0, _modulePanel, _moduleName, self);
    table.insert(self.modules, module);
    self:addChild(module.element);
end

function HeaterUI:createChildren()
    ISCollapsableWindow.createChildren(self);
    -- local th = self:titleBarHeight();

    self:addModule(RWMPower:new (0, 0, self.width, 0), getText("IGUI_RadioPower"), true);
end

function HeaterUI:new()
    local o = {};
    x = getMouseX() + 10;
    y = getMouseY() + 10;
    o = ISCollapsableWindow:new(x, y, 300, 200);
    setmetatable(o, self);
    self.__index = self;
    o.borderColor = {r=0.4, g=0.4, b=0.4, a=1};
    o.backgroundColor = {r=0, g=0, b=0, a=1};
    o.moveWithMouse = false;

    o.pin = true;
    o.isCollapsed = false;
    o.collapseCounter = 0;
    o.title = "Electric Heater";
    o.anchorLeft = true;
    o.anchorRight = false;

    o.resizable = false;
    o.drawFrame = true;    

    o.device = nil;     -- item or object linked to panel
    o.deviceData = nil; -- deviceData
    o.modules = {};     -- table of modules to use
    o.overrideBPrompt = true;
    o.subFocus = nil;
    o.hotKeyPanels = {};
    o.isJoypadWindow = false;

    return o;
end

function openHeaterUI()
    local HeaterUI = HeaterUI:new()
    HeaterUI:initialise();
    HeaterUI:addToUIManager();
    HeaterUI:setVisible(true);
end

--Events.OnGameStart.Add(openHeaterUI)

--o.x = x;
--o.y = y;
--o.character = player;
--o.characterNum = player:getPlayerNum();
--o.anchorLeft = true;
--o.anchorRight = false;
--o.anchorTop = true;
--o.anchorBottom = false;
--o.pin = true;
--o.isCollapsed = false;
--o.collapseCounter = 0;
--o.title = "Radio/Television Window";
--o.viewList = {}
--o.resizable = false;
--o.drawFrame = true;

--o.device = nil;     -- item or object linked to panel
--o.deviceData = nil; -- deviceData
--o.modules = {};     -- table of modules to use
--o.overrideBPrompt = true;
--o.subFocus = nil;
--o.hotKeyPanels = {};
--o.isJoypadWindow = false;
--return o