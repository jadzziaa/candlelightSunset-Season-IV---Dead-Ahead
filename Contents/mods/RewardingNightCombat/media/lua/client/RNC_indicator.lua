RewardingNightCombat = RewardingNightCombat or {};
RewardingNightCombat.client = {};
RewardingNightCombat.indicator = nil;

RNCIndicator = ISImage:derive('RNCIndicator')

local indicatorDragged = false
local indicatorDefaultCoordinates = {x = 0, y = 0}

function RNCIndicator:onDragClicked(_, _)
    indicatorDragged = not indicatorDragged
    if indicatorDragged == false then
        RewardingNightCombat.indicator.dragPanel.borderColor = { r = 0, g = 0, b = 0, a = 0 }
    end
end

function RNCIndicator:render()
    if indicatorDragged then
        RewardingNightCombat.indicator.dragPanel.borderColor = { r = 1, g = 0, b = 0, a = 1 }
        local x = getMouseX() - self.dragPanel:getWidth() / 2
        local y = getMouseY() - self.dragPanel:getHeight() / 2
        self:setX(x)
        self:setY(y)
        getPlayer():getModData().indicator_coordinates = {x=x, y=y}
    end
end

local function onIndicatorDraggedKeyPressed(key)
    if indicatorDragged == true and key == Keyboard.KEY_BACK then
        indicatorDragged = false
        RewardingNightCombat.indicator.dragPanel.borderColor = { r = 0, g = 0, b = 0, a = 0 }
        RewardingNightCombat.indicator:setX(indicatorDefaultCoordinates.x)
        RewardingNightCombat.indicator:setY(indicatorDefaultCoordinates.y)
        getPlayer():getModData().indicator_coordinates = {x=indicatorDefaultCoordinates.x, y=indicatorDefaultCoordinates.y}
    end
end

RewardingNightCombat.RNC_INDICATOR_ICON_PATHS = {
    "media/ui/rnc_original.png",
    "media/ui/rnc_brightorange.png",
    "media/ui/rnc_crimson.png",
    "media/ui/rnc_cyan.png",
    "media/ui/rnc_toxicgreen.png",
    "media/ui/rnc_darkcyan_limegreen.png"
}

RewardingNightCombat.client.fetchTooltipText = function(sandboxSettings, title_text)
    local text = { }

    if title_text ~= nil then
        table.insert(text, title_text);
    end

    table.insert(text,  "<RGB:1,1,1>" ..getText("IGUI_perks_Axe").. ": "
            ..tostring(sandboxSettings.axeMultiplier + 1.0) .."x <RGB:0.5,0.5,0.5> (+"
            ..tostring(sandboxSettings.axeMultiplier * 100).. "% XP)")

    table.insert(text,  "<RGB:1,1,1>" ..getText("IGUI_perks_Blunt").. ": "
            ..tostring(sandboxSettings.longBluntMultiplier + 1.0) .."x <RGB:0.5,0.5,0.5> (+"
            ..tostring(sandboxSettings.longBluntMultiplier * 100).. "% XP)")

    table.insert(text,  "<RGB:1,1,1>" ..getText("IGUI_perks_SmallBlunt").. ": "
            ..tostring(sandboxSettings.shortBluntMultiplier + 1.0) .."x <RGB:0.5,0.5,0.5> (+"
            ..tostring(sandboxSettings.shortBluntMultiplier * 100).. "% XP)")

    table.insert(text,  "<RGB:1,1,1>" ..getText("IGUI_perks_LongBlade").. ": "
            ..tostring(sandboxSettings.longBladeMultiplier + 1.0) .."x <RGB:0.5,0.5,0.5> (+"
            ..tostring(sandboxSettings.longBladeMultiplier * 100).. "% XP)")

    table.insert(text,  "<RGB:1,1,1>" ..getText("IGUI_perks_SmallBlade").. ": "
            ..tostring(sandboxSettings.shortBladeMultiplier + 1.0) .."x <RGB:0.5,0.5,0.5> (+"
            ..tostring(sandboxSettings.shortBladeMultiplier * 100).. "% XP)")

    table.insert(text,  "<RGB:1,1,1>" ..getText("IGUI_perks_Spear").. ": "
            ..tostring(sandboxSettings.spearMultiplier + 1.0) .."x <RGB:0.5,0.5,0.5> (+"
            ..tostring(sandboxSettings.spearMultiplier * 100).. "% XP)")

    table.insert(text,  "<RGB:1,1,1>" ..getText("IGUI_perks_Aiming").. ": "
            ..tostring(sandboxSettings.aimingMultiplier + 1.0) .."x <RGB:0.5,0.5,0.5> (+"
            ..tostring(sandboxSettings.aimingMultiplier * 100).. "% XP)")

    return table.concat(text,"\n")
end


RewardingNightCombat.client.setup = function()
    local sandboxSettings = RewardingNightCombat.sandboxSettings;

    local icon_width = RewardingNightCombat.options.indicator.width;
    local icon_height = RewardingNightCombat.options.indicator.height;
    local coordinate_origin = RewardingNightCombat.options.indicator.coordinate_origin;
    local x_offset = RewardingNightCombat.options.indicator.x_offset;
    local y_offset = RewardingNightCombat.options.indicator.y_offset;
    local title_text_tooltip = RewardingNightCombat.options.indicator.title_text_tooltip;

    local icon_path;
    local icon_texture;
    if RewardingNightCombat.options.indicator.custom_icon == true then
        icon_texture = RewardingNightCombat.options.indicator.texture;
    else
        icon_path = RewardingNightCombat.RNC_INDICATOR_ICON_PATHS[sandboxSettings.indicatorColor];
        icon_texture = Texture.getSharedTexture(icon_path);
    end

    local coord_x, coord_y = nil, nil

    if coordinate_origin == 1 then
        coord_x = x_offset
        coord_y = y_offset
    elseif coordinate_origin == 2 then
        coord_x = getCore():getScreenWidth() + x_offset
        coord_y = y_offset
    elseif coordinate_origin == 3 then
        coord_x = x_offset
        coord_y = getCore():getScreenHeight() + y_offset
    else
        coord_x = getCore():getScreenWidth() + x_offset
        coord_y = getCore():getScreenHeight() + y_offset
    end

    indicatorDefaultCoordinates.x = coord_x
    indicatorDefaultCoordinates.y = coord_y

    RewardingNightCombat.indicator = RNCIndicator:new(
            coord_x, coord_y,
            icon_width, icon_height,
            icon_texture
    );

    RewardingNightCombat.indicator:setVisible(false);
    if RewardingNightCombat.options.indicator.enable_tooltip == true then
        RewardingNightCombat.indicator:setMouseOverText(RewardingNightCombat.client.fetchTooltipText(sandboxSettings, title_text_tooltip));
    end
    RewardingNightCombat.indicator:addToUIManager();

    if sandboxSettings.draggableIndicator == true then
        RewardingNightCombat.indicator.dragPanel = ISPanel:new(0, 0, RewardingNightCombat.indicator:getWidth(), RewardingNightCombat.indicator:getHeight());
        RewardingNightCombat.indicator.dragPanel.backgroundColor = { r = 0, g = 0, b = 0, a = 0 };
        RewardingNightCombat.indicator.dragPanel.borderColor = { r = 0, g = 0, b = 0, a = 0 };
        RewardingNightCombat.indicator.dragPanel.onMouseDown = RewardingNightCombat.indicator.onDragClicked;
        RewardingNightCombat.indicator.dragPanel:initialise();
        RewardingNightCombat.indicator:addChild(RewardingNightCombat.indicator.dragPanel);

        local indicator_coordinates = getPlayer():getModData().indicator_coordinates;

        if indicator_coordinates ~= nil then
            RewardingNightCombat.indicator:setX(indicator_coordinates.x);
            RewardingNightCombat.indicator:setY(indicator_coordinates.y);
        else
            getPlayer():getModData().indicator_coordinates = {
                x = RewardingNightCombat.indicator.x,
                y = RewardingNightCombat.indicator.y
            }
        end

        Events.OnKeyPressed.Add(onIndicatorDraggedKeyPressed)
    end

    RewardingNightCombat.indicator:initialise();
end

RewardingNightCombat.client.updateIndicator = function()
    if RewardingNightCombat.indicator == nil then
        RewardingNightCombat.client.setup()
    end
    if RewardingNightCombat.sandboxSettings.enableIndicator == true then
        if RewardingNightCombat.status == RewardingNightCombat.Status.STARTED
        or RewardingNightCombat.status == RewardingNightCombat.Status.DURING then
            RewardingNightCombat.indicator:setVisible(true);
        else
            RewardingNightCombat.indicator:setVisible(false);
            indicatorDragged = false
        end
    end
end

RewardingNightCombat.client.updatePlayer = function()
    RewardingNightCombat.client.updateIndicator();
    if RewardingNightCombat.status == RewardingNightCombat.Status.STARTED and RewardingNightCombat.sandboxSettings.enableTriggerSound == true then
        if RewardingNightCombat.options.sounds.custom_trigger_sound == true then
            getPlayer():playSound("RNCCustomTriggerSound");
        else
            getPlayer():playSound("RNCTriggerSound");
        end
    elseif RewardingNightCombat.status == RewardingNightCombat.Status.ENDED and RewardingNightCombat.options.sounds.custom_ending_sound == true then
        getPlayer():playSound("RNCCustomEndingSound");
    end
end

--RewardingNightCombat.client.statusRequest = function()
--    print("RNCStatusRequest sending")
--    sendClientCommand("RewardingNightCombat","RNCStatusRequest", {});
--end

RewardingNightCombat.client.onServerCommand = function(module, command, args)
    if command == "RNCStatus" then
        --print("RNCStatus received")
        RewardingNightCombat.status = args[1];
        RewardingNightCombat.client.updatePlayer();
    end
end

local function OnGameStart()
    RewardingNightCombat.client.updateIndicator();
end

Events.OnGameStart.Add(OnGameStart)

if isClient() == true then
    Events.OnServerCommand.Add(RewardingNightCombat.client.onServerCommand);
end

