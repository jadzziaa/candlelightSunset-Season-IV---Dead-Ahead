-- This removes the context menu entries "Equip Primary" and "Equip Secondary" when in the player's inventory

require 'ISUI/ISInventoryItemContextMenu';

function removeContextMenuEntries(player, context, items)

    -- Check if the first item in menu tree is already an InventoryItem else use the first item of the submenu tree
    local invItem = items[1];
    if not instanceof(invItem, "InventoryItem") then
        invItem = items[1].items[1];
    end

    if invItem:getType() == SmallHeaterObject.itemType then
        context:removeOptionByName(getText("ContextMenu_Equip_Primary"));
        context:removeOptionByName(getText("ContextMenu_Equip_Secondary"));
    end

    if invItem:getType() == OutdoorHeaterObject.itemType then
        context:removeOptionByName(getText("ContextMenu_Equip_Primary"));
        context:removeOptionByName(getText("ContextMenu_Equip_Secondary"));
    end

    if invItem:getType() == ElectricHeaterObject.itemType then
        context:removeOptionByName(getText("ContextMenu_Equip_Primary"));
        context:removeOptionByName(getText("ContextMenu_Equip_Secondary"));
    end   
end

Events.OnFillInventoryObjectContextMenu.Add(removeContextMenuEntries);