local debugitems = TRUE;

local function giveItems()
    if debugitems then
        local player = getSpecificPlayer(0);
        player:getinventory():Additem("SDelight.BoxofCigars");
        player:getinventory():Additem("SDelight.Cigar");
    end
end

Events.OnGameBoot.Add(info);
Events.OnGameStart.Add(giveitems);