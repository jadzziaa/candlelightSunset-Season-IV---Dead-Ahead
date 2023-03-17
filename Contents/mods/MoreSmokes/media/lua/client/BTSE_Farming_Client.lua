require "BTSE_Farming_Base";

BTSE.Farming["knownSprites"] = {};

-- grouping and caching

function BTSE.Farming:createGroupedSeedsCache()
    local plantsPerGroup = {};
    local groupsBySeed = {};

    BTSE.Farming["seedsAreGrouped"] = false;

    for seedName, props in pairs(farming_vegetableconf["props"])
    do
        local group = getText("Farming_" .. seedName);

        if props["btseGroup"]
        then
            group = getText(props["btseGroup"]);
            BTSE.Farming["seedsAreGrouped"] = true;
        end

        groupsBySeed[seedName] = group;

        plantsPerGroup[group] = plantsPerGroup[group] or 0;
        plantsPerGroup[group] = plantsPerGroup[group] + 1;
    end

    local seedList = {};

    for seedName, props in pairs(farming_vegetableconf["props"])
    do
        local data = {
            name = seedName,
            group = groupsBySeed[seedName],
            title = getText("Farming_" .. seedName),
            props = props,
        };

        if plantsPerGroup[data["group"]] > 1
        then
            data["sortTitle"] = string.upper((data["group"] ~= data["title"]
                and data["group"] .. " "
                or ""
            ) .. data["title"]);
        else
            data["sortTitle"] = data["title"];
        end

        BTSE.Farming:log("title: [" .. tostring(data["title"]) .. "], group: [" .. tostring(data["group"]) .. "], in group: [" .. tostring(plantsPerGroup[data["group"]]) .. "], sortTitle: [" .. tostring(data["sortTitle"]) .. "]");

        table.insert(seedList, data);
    end

    if BTSE.Farming["seedsAreGrouped"]
    then
        local seedsByGroup = {};

        table.sort(seedList, function(a, b)
            return not string.sort(a["sortTitle"], b["sortTitle"]);
        end);

        for i, seedConfig in ipairs(seedList)
        do
            seedsByGroup[seedConfig["group"]] = seedsByGroup[seedConfig["group"]] or {};
            seedsByGroup[seedConfig["group"]]["_count"] = seedsByGroup[seedConfig["group"]]["_count"]
                and seedsByGroup[seedConfig["group"]]["_count"] + 1
                or 1;
            seedsByGroup[seedConfig["group"]][seedConfig["name"]] = seedConfig["props"];
        end

        BTSE.Farming["seedsByGroup"] = seedsByGroup;

        return BTSE.Farming["seedsByGroup"];
    end
end

-- recovering from borked farming data

function BTSE.Farming:revitalizePlant(sterileTile, seedName, spriteIndex)
    local player = getPlayer()
    local square = sterileTile:getSquare();

    square:transmitRemoveItemFromSquare(sterileTile);
    sterileTile:removeFromSquare();

    sendClientCommand(player, "btse_farming", "revitalizePlant", {
        seedName = seedName,
        spriteIndex = spriteIndex,
        x = square:getX(),
        y = square:getY(),
        z = square:getZ(),
    });

    player:setHaloNote(getText("IGUI_PARP_F_CnfRevitalized"), 255, 87, 87, 300);
end

-- context menu helpers to make this more independent to run in More Smokes and Project Grub

function BTSE.Farming:processContextMenuItemIconConfig(entry, icon)
    if type(icon) == "string"
    then
        entry["hoverIcon"] = string.gsub(icon, "%.png", "_hover.png");

        if entry["hoverIcon"] -- add a nice hover if btse is active
        then
            entry["hoverIcon"] = getTexture(entry["hoverIcon"]);
            entry["hoverIcon"] = entry["hoverIcon"] or nil;
        end

        entry["defaultIcon"] = getTexture(icon);
        entry["iconTexture"] = entry["defaultIcon"];
    else
        entry["iconTexture"] = icon;
    end

    return entry;
end

function BTSE.Farming:addContextMenuSubMenu(context, title, disabled, icon)
    local entry = context:addOption(title);
    local subMenu = ISContextMenu:getNew(context);

    if disabled
    then
        entry["onSelect"] = nil;
        entry["notAvailable"] = true;
    end

    BTSE.Farming:processContextMenuItemIconConfig(entry, icon);

    context:addSubMenu(entry, subMenu);

    return subMenu;
end

function BTSE.Farming:addContextMenuItem(context, title, handler, icon)
    local entry = context:addOption(title, nil, handler);

    BTSE.Farming:processContextMenuItemIconConfig(entry, icon);

    return entry;
end

function BTSE.Farming:addSeedContextMenuItem(context, playerObj, furrow, square, seedName, props)
    local seedItem = InventoryItemFactory.CreateItem(props["seedName"]);
    local seedIcon = nil;

    if seedItem and seedItem:getTexture()
    then
        seedIcon = seedItem:getTexture();
    end

    local plantOption = BTSE.Farming:addContextMenuItem(context, getText("Farming_" .. seedName), function()
        ISFarmingMenu.onSeed(playerObj, seedName, furrow, square);
    end, seedIcon);

    ISFarmingMenu.canPlow(playerObj:getInventory():getCountTypeRecurse(props["seedName"]), seedName, plantOption);

    return plantOption;
end

function BTSE.Farming:getGroupSeedCount(groupedItems, playerObj)
    local totalCount = 0;

    for seedName, props in pairs(groupedItems)
    do
        if seedName ~= "_count"
        then
            totalCount = totalCount + playerObj:getInventory():getCountTypeRecurse(props["seedName"]);
        end
    end

    return totalCount;
end

function BTSE.Farming:createSeedGroupContextMenuItems(targetMenu, groupedItems, playerObj, furrow, square)
    for seedName, props in pairs(groupedItems)
    do
        if seedName ~= "_count"
        then
            BTSE.Farming:addSeedContextMenuItem(targetMenu, playerObj, furrow, square, seedName, props);
        end
    end
end

-- more helpers to make this more independent to run in More Smokes and Project Grub

function BTSE.Farming:getObjectSpriteName(object)
    return object.getSprite
        and object:getSprite()
        and object:getSprite():getName();
end

function BTSE.Farming:spriteIsKnown(spriteName, returnIndex)
    for i, aValue in ipairs(farming_vegetableconf["sprite"][BTSE.Farming["knownSprites"][spriteName]])
    do
        if aValue == spriteName
        then
            return i;
        end
    end

    return 1;
end

-- events

Events.OnGameStart.Add(function()
    for seedName, sprites in pairs(farming_vegetableconf["sprite"])
    do
        for i, sprite in ipairs(sprites)
        do
            if not BTSE.Farming["knownSprites"][sprite]
            then
                BTSE.Farming["knownSprites"][sprite] = seedName;
            end
        end
    end
end);

Events.OnFillWorldObjectContextMenu.Add(function(player, contextMenu, worldObjects)
    for i = 1, #worldObjects - 1
    do
        local spriteName = BTSE.Farming:getObjectSpriteName(worldObjects[i]);

        if spriteName and BTSE.Farming["knownSprites"][spriteName]
        then
            BTSE.Farming:addContextMenuItem(contextMenu, getText("IGUI_BTSE_F_RevitalizePlant", getText("Farming_" .. BTSE.Farming["knownSprites"][spriteName])), function()
                BTSE.Farming:revitalizePlant(worldObjects[i], BTSE.Farming["knownSprites"][spriteName], BTSE.Farming:spriteIsKnown(spriteName, true));
            end, BTSE.Icons["farming"]);

            break;
        end
    end
end);

Events.LoadGridsquare.Add(function(square)
    local plant = CFarmingSystem.instance:getLuaObjectOnSquare(square);

    if plant and plant["state"] ~= "plow" and farming_vegetableconf["sprite"][plant["typeOfSeed"]]
    then
        local plantObject = plant:getObject();

        if plantObject
        then
            local newSprite = nil;

            if plant["state"] == "rotten"
            then
                newSprite = BTSE.Farming:getCropConfig(plant["typeOfSeed"], "rottenSprite");
            elseif plant["state"] == "destroy"
            then
                newSprite = BTSE.Farming:getCropConfig(plant["typeOfSeed"], "destroyedSprite");
            elseif plant["state"] == "dry"
            then
                newSprite = BTSE.Farming:getCropConfig(plant["typeOfSeed"], "drySprite");
            elseif plant["state"] == "seeded" and plant["nbOfGrow"] > 0
            then
                newSprite = farming_vegetableconf["sprite"][plant["typeOfSeed"]][plant["nbOfGrow"]];
            end

            if newSprite
            then
                plantObject:setSprite(newSprite);
            end
        end
    end
end);