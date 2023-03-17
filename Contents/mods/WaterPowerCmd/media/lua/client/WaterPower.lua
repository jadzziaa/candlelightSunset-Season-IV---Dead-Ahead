WaterPower = WaterPower or {};

-- events

Events.OnGameStart.Add(function()
    if Bikinitools
    then
        local btConfigMenu = Bikinitools.Options.createConfigContextMenu;

        function Bikinitools.Options.createConfigContextMenu(btMenu)
            if WaterPower:userIsAdmin() or WaterPower:gameIsSP()
            then
                Bikinitools:addContextMenuHeader(btMenu, getText("IGUI_WPCmd_ModName"));
                WaterPower:createContextMenu(btMenu);
            end

            return btConfigMenu(btMenu);
        end
    else
        Events.OnFillWorldObjectContextMenu.Add(function(player, contextMenu, worldObjects)
            if WaterPower:userIsAdmin() or WaterPower:gameIsSP()
            then
                WaterPower:createContextMenu(contextMenu);
            end
        end);
    end
end);

-- handlers

function WaterPower:createContextMenu(contextMenu)
    local wpMenu = WaterPower:addContextMenuSubMenu(contextMenu, getText("IGUI_WPCmd_Toggle"));

    for which, translation in pairs({
        water = "IGUI_WPCmd_Water",
        power = "IGUI_WPCmd_Power",
    })
    do
        local state = getSandboxOptions():getOptionByName(WaterPower:getOptionName(which)):getValue() > -1;

        WaterPower:addContextMenuItem(wpMenu, getText(translation) .. " [" .. getText("IGUI_WPCmd_" .. (state
            and "On"
            or "Off"
        )) .. "]", function()
            WaterPower:toggle(which, state
                and "off"
                or "on"
            );
        end);
    end
end

-- main function

function WaterPower:toggle(which, state)
    local options = SandboxOptions.new();

    if state == "on" or state == "off"
    then
        options:copyValuesFrom(getSandboxOptions());
        options:getOptionByName(WaterPower:getOptionName(which)):setValue(state == "on"
            and 2147483647
            or -1
        );

        getPlayer():setHaloNote(getText(which == "power"
            and "IGUI_WPCmd_Power"
            or "IGUI_WPCmd_Water"
        ) .. " " .. getText(state == "on"
            and "IGUI_WPCmd_TurnedOn"
            or "IGUI_WPCmd_TurnedOff"
        ), 255, 87, 87, 300);
    end

    if WaterPower:gameIsSP()
    then
        getSandboxOptions():copyValuesFrom(options);
        getSandboxOptions():toLua();
    else
        options:sendToServer();
    end
end

-- helpers

function WaterPower:gameIsSP()
    return isClient() == false;
end

function WaterPower:userIsAdmin()
    return isAdmin();
end

function WaterPower:mergeArrays(array1, array2)
    if not array2
    then
        return array1;
    end

    for key, value in pairs(array2)
    do
        array1[key] = value;
    end

    return array1;
end

function WaterPower:getOptionName(which)
    return (which == "power"
        and "ElecShut"
        or "WaterShut"
    ) .. "Modifier";
end

-- context menu wrapper because the vanilla method sucks

function WaterPower:addContextMenuItem(context, text, handler, params, options)
    return WaterPower:createContextMenuOption(context, text, handler, params, WaterPower:mergeArrays({
        isSubMenu = false
    }, options));
end

function WaterPower:addContextMenuSubMenu(context, text, handler, params, options)
    return WaterPower:createContextMenuOption(context, text, handler, params, WaterPower:mergeArrays({
        isSubMenu = true
    }, options));
end

function WaterPower:createContextMenuOption(context, text, handler, params, options)
    -- C:\Program Files (x86)\Steam\steamapps\common\ProjectZomboid\media\lua\client\ISUI\ISContextMenu.lua
    -- ISContextMenu:addOption(name, target, onSelect, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)

    if not params
    then
        params = {};
    end

    local entry = context:addOption(
        text or nil,
        params[1] or nil,
        handler or nil,
        params[2] or nil,
        params[3] or nil,
        params[4] or nil,
        params[5] or nil,
        params[6] or nil
    );

    entry.notAvailable = options.disabled;

    if options.tip ~= nil and options.tip ~= "" and string.sub(options.tip, 0, 5) ~= "IGUI_"
    then
        entry.toolTip = ISWorldObjectContextMenu.addToolTip();
        entry.toolTip.description = options.tip;
    end

    if options.isSubMenu
    then
        local menu = ISContextMenu:getNew(context);
        context:addSubMenu(entry, menu);

        return menu;
    else
        return entry;
    end
end