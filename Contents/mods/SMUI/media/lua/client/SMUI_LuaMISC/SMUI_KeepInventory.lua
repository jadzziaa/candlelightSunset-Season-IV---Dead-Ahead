-- Code originally from Peach

function KeepInventory(item, resultItem, player)

    local player_Inventory = player:getInventory();
    local transferred_Items = {}; 
    local dItem;
    local texture;
    
    for i = 0, (item:size()-1) do 
        dItem = item:get(i); 
        
        if dItem:getCategory() == "Container" then 
        texture = dItem:getTexture()
            if player:getClothingItem_Back() == dItem then 
                player:setClothingItem_Back(nil);
            end
            if player:getPrimaryHandItem() == dItem then 
                player:setPrimaryHandItem(nil);
            end
            if player:getSecondaryHandItem() == dItem then 
                player:setSecondaryHandItem(nil); 
            end
            dInv = dItem:getInventory(); 
            newInv= resultItem:getInventory(); 
            dInvItems = dInv:getItems(); 
            if dInvItems:size() >= 1 then 
                for i2 = 0, (dInvItems:size()-1) do
                    invItem = dInvItems:get(i2);
                    table.insert(transferred_Items, invItem) 
                end
            end
        end
    end
    
    for i3, k3 in ipairs(transferred_Items) do
        dInv:Remove(k3); 
        newInv:AddItem(k3); 
    end
    resultItem:setTexture(texture);
end