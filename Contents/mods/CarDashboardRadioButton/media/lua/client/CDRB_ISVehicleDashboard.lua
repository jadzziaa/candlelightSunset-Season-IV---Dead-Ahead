require "Vehicles/ISUI/ISVehicleDashboard"
require "RadioCom/ISRadioAction"
require "ISUI/ISImage"

local radioIcon = getTexture("Icon_Radio_Speaker");
-- local radioIcon = getTexture("media/ui/cassette.png");
local backgroundLeft = getTexture("media/ui/background.png");
local backgroundRight = getTexture("media/ui/background_right.png");

local ISVehicleDashboard_createChildren = ISVehicleDashboard.createChildren;
function ISVehicleDashboard:createChildren()
    ISVehicleDashboard_createChildren(self);

    local w = radioIcon:getWidthOrig(); -- 32
    local h = radioIcon:getHeightOrig();
    local bw = backgroundLeft:getWidthOrig(); -- 32
    local bh = backgroundLeft:getHeightOrig();

    -- we want to initialize it before other elements because of z-level
    self.toggleRadioBackgroundRight = ISImage:new(0, 0, bw, bh, backgroundRight);
    self.toggleRadioBackgroundRight:initialise();
    self.toggleRadioBackgroundRight:instantiate();
    self:addChild(self.toggleRadioBackgroundRight);

    self.toggleRadioBackground = ISImage:new(0, 0, bw, bh, backgroundLeft);
    self.toggleRadioBackground:initialise();
    self.toggleRadioBackground:instantiate();
    self:addChild(self.toggleRadioBackground);

    self.toggleRadioButton = ISImage:new(0, 0, w, h, radioIcon);
    self.toggleRadioButton.scaledWidth = 16;
    self.toggleRadioButton.scaledHeight = 16;
    self.toggleRadioButton:initialise();
    self.toggleRadioButton.backgroundColor = {r=1, g=1, b=1, a=0.8};
    self.toggleRadioButton:instantiate();
    self.toggleRadioButton.onclick = ISVehicleDashboard.onToggleRadioClicked;
    self.toggleRadioButton.target = self;
	self.toggleRadioButton.mouseovertext = getText("UI_CDRB_OpenRfm");
    -- TrueMusic
    if ISTCBoomboxWindow and ISTCBoomboxWindow.activate then
        self.toggleRadioButton.mouseovertext = getText("UI_CDRB_OpenRfmWithTrueMusic");
        self.toggleRadioButton.onRightMouseUp = ISVehicleDashboard.onToggleTrueMusicClicked;
    end
	self:addChild(self.toggleRadioButton);

    -- Re-add trunkTex to place it on top
    self.trunkTex:close();
    self.trunkTex = nil;
    self.trunkTex = ISImage:new(700,35, self.iconTrunk:getWidthOrig(), self.iconTrunk:getHeightOrig(), self.iconTrunk);
    self.trunkTex:initialise();
    self.trunkTex:instantiate();
    self.trunkTex.onclick = ISVehicleDashboard.onClickTrunk;
    self.trunkTex.target = self;
    self:addChild(self.trunkTex);

    -- Link in to TrueMusic cassette play toggle
    if ISTCBoomboxAction and ISTCBoomboxAction.performToggleOnOff then
        local ISVehicleDashboard_performToggleOnOff = ISTCBoomboxAction.performToggleOnOff;
        function ISTCBoomboxAction:performToggleOnOff()
            ISVehicleDashboard_performToggleOnOff(self);
            local player = getPlayer();
            local thisPlayerData = getPlayerData(player:getPlayerNum());
            local dashboard = thisPlayerData.vehicleDashboard;
            local vehicle = player:getVehicle();
            if dashboard and vehicle then
                dashboard:updateRadioIconColor();
            end
        end
    end
end

local oLightsX = nil;
local oHeaterX = nil;
local oTrunkX = nil;
local ICON_OFFSET = 18;
local ISVehicleDashboard_setVehicle = ISVehicleDashboard.setVehicle;
function ISVehicleDashboard:setVehicle(vehicle)
    ISVehicleDashboard_setVehicle(self, vehicle);

    if not vehicle then
		return
	end

    if vehicle then
        local fuelX = self.backgroundTex:getWidth() / 2;
        local fuelY = self.fuelGauge:getCentreY();
        local x = fuelX + 55 + ICON_OFFSET;
        local y = fuelY - 12;

        -- Check if we are the driver in a car
        local seat = vehicle:getSeat(playerObj);
        if seat == 1 then
            -- We are
            self.toggleRadioButton:setX(x);
            self.toggleRadioButton:setY(y);
            self.toggleRadioButton:setVisible(true);

            self.toggleRadioBackground:setX(x-10);
            self.toggleRadioBackground:setY(y-7);
            self.toggleRadioBackground:setVisible(true);

            self.toggleRadioBackgroundRight:setX(x+90);
            self.toggleRadioBackgroundRight:setY(y-7);
            self.toggleRadioBackgroundRight:setVisible(true);

            -- Set beginning state
            self:updateRadioIconColor();
        end

        if oLightsX == nil then
            oLightsX = self.lightsTex:getX();
            oHeaterX = self.heaterTex:getX();
            oTrunkX = self.trunkTex:getX();
        end
        self.lightsTex:setX(oLightsX + ICON_OFFSET);
        self.heaterTex:setX(oHeaterX + ICON_OFFSET);
        self.trunkTex:setX(oTrunkX + ICON_OFFSET);
    end
end

function ISVehicleDashboard:getRadioPart()
    local vehicle = self.vehicle;
    local seat = vehicle:getSeat(playerObj)
    if seat <= 1 then -- only front seats can access the radio
        for partIndex=1, vehicle:getPartCount() do
            local part = vehicle:getPartByIndex(partIndex-1)
            if part:getDeviceData() and part:getInventoryItem() then
                return part;
            end
        end
    end
    return nil;
end

-- local isOn = false;
function ISVehicleDashboard:onToggleRadioClicked(button, x, y)
	if getGameSpeed() == 0 then return; end
	if getGameSpeed() > 1 then setGameSpeed(1); end

    local player = getPlayer();
    local playerNum = player:getPlayerNum();
    local radioIso = ISRadioWindow.instancesIso[playerNum];

    if radioIso and radioIso:getIsVisible() then
        radioIso:close();
    else
        local part = self:getRadioPart();
        if part ~= nil then -- if nil, car doesnt have a radio installed
            ISVehicleMenu.onSignalDevice(player, part);
        end
    end
end

function ISVehicleDashboard:onToggleTrueMusicClicked(x, y)
    if getGameSpeed() == 0 then return; end
	if getGameSpeed() > 1 then setGameSpeed(1); end
    local player = getPlayer();
    local playerNum = player:getPlayerNum();

    if ISTCBoomboxWindow
            and ISTCBoomboxWindow.instancesIso
            and ISTCBoomboxWindow.instancesIso[playerNum]
            and ISTCBoomboxWindow.instancesIso[playerNum]:getIsVisible() then
        ISTCBoomboxWindow.instancesIso[playerNum]:close();
    else
        local part = self.parent:getRadioPart();
        if part ~= nil then -- if nil, car doesnt have a radio installed
            ISTCBoomboxWindow.activate(player, part);
        end
    end
end

function ISVehicleDashboard:isRadioTurnedOn()
    local part = self:getRadioPart();
    if part == nil then
        return false;
    end
    local deviceData = part:getDeviceData();
    if deviceData and part:getInventoryItem() then
        return deviceData:getIsTurnedOn();
    end
    return false;
end

function ISVehicleDashboard:updateRadioIconColor()
    local part = self:getRadioPart();
	local alpha = self:getAlphaFlick(0.65);
	local greyBg = {r=0.5, g=0.5, b=0.5, a=alpha};
    if part == nil and self.vehicle:isKeysInIgnition() then
        self.toggleRadioButton.backgroundColor = {r=1, g=0, b=0, a=alpha};
    elseif self:isRadioTurnedOn() then
        self.toggleRadioButton.backgroundColor = {r=0, g=1, b=0, a=alpha};
    else
        self.toggleRadioButton.backgroundColor = greyBg;
    end
end

local ISVehicleDashboard_onClickKeys = ISVehicleDashboard.onClickKeys;
function ISVehicleDashboard:onClickKeys()
    ISVehicleDashboard_onClickKeys(self);
    self:updateRadioIconColor();
end

local ISRadioAction_performToggleOnOff = ISRadioAction.performToggleOnOff;
function ISRadioAction:performToggleOnOff()
    ISRadioAction_performToggleOnOff(self);

    local player = getPlayer();
    local thisPlayerData = getPlayerData(player:getPlayerNum());
    local dashboard = thisPlayerData.vehicleDashboard;
    local vehicle = player:getVehicle();
    if dashboard and vehicle then
        dashboard:updateRadioIconColor();
    end
end