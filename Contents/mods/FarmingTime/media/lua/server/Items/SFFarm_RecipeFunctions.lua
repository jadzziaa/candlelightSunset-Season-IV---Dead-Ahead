-- give either 2 or 6 ripped sheets depending on what you ripped
function SFRipClothing_OnCreate(items, result, player, selectedItem)
    local isInfected = false;
    local isDirty = false;
    local ragItem = "Base.RippedSheets";
    local numItems = 6;
    for i=0,items:size() - 1 do
        if instanceof (items:get(i), "Clothing") and (items:get(i):isBloody() or items:get(i):isDirty()) then
            isDirty = true;
            if (items:get(i):isInfected()) then
                isInfected = true;
            end
        end
    end
    
    local isUnderwear = false;
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "Underwear1" or items:get(i):getType() == "Underwear2" or items:get(i):getType() == "SFCloth" then
            isUnderwear = true;
            break
        end
    end

    -- clothing is bloody, remove the previous rag and do a bloody one
    if isDirty then
        player:getInventory():Remove(result);
        ragItem = "Base.RippedSheetsDirty";
    end
    if not isUnderwear then
        numItems = 6
        player:getInventory():AddItems(ragItem, numItems);
    else
        numItems = 1
        player:getInventory():AddItems(ragItem, numItems);
    end

    if isInfected then
        for i=(player:getInventory():getItems():size() - numItems), player:getInventory():getItems():size()-1 do
            if player:getInventory():getItems():get(i):getType() == "RippedSheetsDirty" then
                player:getInventory():getItems():get(i):setInfected(true)
            end
        end
    end
end

function SFMakeBeetSyrup_OnCreate(items, result, player, selectedItem)
        player:getInventory():AddItem("filcher.SFClothDirty");
	result:setCooked(false);
end

function Recipe.OnCreate.AddDirtyRag(items, result, player)
    player:getInventory():AddItem("Base.RippedSheetsDirty");
end

function OnlyIfCooked_TestIsValid(sourceItem, result)
	if instanceof(sourceItem, "Food") then
		return sourceItem:isCooked();
	else
		return true -- the tools
	end
end

function SFMakeSugar_OnCreate(items, result, player, selectedItem)
        player:getInventory():AddItem("Base.Pot");
end