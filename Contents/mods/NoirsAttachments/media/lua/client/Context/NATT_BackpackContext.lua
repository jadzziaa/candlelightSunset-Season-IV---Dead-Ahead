local function hasNATTSlot(NATTattachments) 
    for _,v in pairs(NATTattachments) do
        if v then
            return v
        end
    end
end

local function sortSlotsUI(worldobjects,playerObj,backpack,NATTattachments)
    NATTSortSlotsUI:show(backpack,NATTattachments)
end

local function OnPreFillInventoryObjectContextMenu(player, context, items)
    local playerObj = getSpecificPlayer(player);
    if(playerObj:getVehicle() ~= nil) then return end
    items = ISInventoryPane.getActualItems(items)
    if not items or #items>1 then return end
    local backpack = items[1]
    if not backpack then return end
    if not backpack:isInPlayerInventory() then return end
    local modData = backpack:getModData()
    local NATTattachments = modData.NATTattachments
    if not NATTattachments then return end
    if not hasNATTSlot(NATTattachments) then return end
    if not backpack:isEquipped() then
        context:addOption(getText("IGUI_NATT_Sort_Slots"), worldobjects, sortSlotsUI, playerObj,backpack,NATTattachments);
    end
end

Events.OnPreFillInventoryObjectContextMenu.Add(OnPreFillInventoryObjectContextMenu);