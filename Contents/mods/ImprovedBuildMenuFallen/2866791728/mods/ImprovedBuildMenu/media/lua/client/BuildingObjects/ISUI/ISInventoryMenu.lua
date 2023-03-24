if getActivatedMods():contains("BuildingTime") then return end

ISInventoryMenu = {};

require "ISBaseObject"

ISInventoryMenu = ISBaseObject:derive("ISInventoryMenu");

ISInventoryMenu.doBuildMenu = function(player, context, worldobjects, test)
    if test and ISWorldObjectContextMenu.Test then return true end

    local concreteBucket = {};
    local notFullConcrete = {};

    local playerInv = getSpecificPlayer(player):getInventory();

    for i=0, playerInv:getItems():size() - 1 do
        local testItem = playerInv:getItems():get(i);
        if testItem:getType() == "BucketConcreteFull" then
            table.insert(concreteBucket, testItem)
            if testItem:getUsedDelta() + testItem:getUseDelta() <= 1 then
                table.insert(notFullConcrete, testItem)
            end
        end
    end
    if #concreteBucket > 0 then
        if test then return ISWorldObjectContextMenu.setTest() end
        local option = context:addOption(getText("ContextMenu_Concrete_Floor"), worldobjects, nil);
        local subMenu = ISContextMenu:getNew(context);
        context:addSubMenu(option, subMenu)
        for _,item in ipairs(concreteBucket) do
            subMenu:addOption(item:getName() .. " (" .. item:getUsedDelta() * 100 .. "%)", item, ISInventoryMenu.onSpillConcrete, getSpecificPlayer(player))
        end
    end
end

--    self:setAnimVariable("FoodType", "Bucket");
--    self:setActionAnim("fill_container_tap");
--    self:setOverrideHandModels(nil, "Bucket");

ISInventoryMenu.onSpillConcrete = function(concreteBucket, player)
    local conFloor = ISWoodenFloor:new("blends_street_01_102", "blends_street_01_103", concreteBucket, player);
    conFloor.actionAnim = "fill_container_tap";
    getCell():setDrag(conFloor, player:getPlayerNum());
end

Events.OnFillWorldObjectContextMenu.Add(ISInventoryMenu.doBuildMenu);
