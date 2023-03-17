MoreSmokes = MoreSmokes or {}; 

local sVars = SandboxVars.MoreSmokes;
sVars.StonedIncreaseMulti = sVars.StonedIncreaseMulti or 2;
sVars.StonedDecreaseMulti = sVars.StonedDecreaseMulti or 2;

MoreSmokes.stonedIncrease = function(player, stonedchange)    
	--print("Running stoned Increase function");
	--print(" - change: " .. tostring(stonedchange));
    
    player = getSpecificPlayer(tonumber(player)) or getPlayer();

    if not player
    then
        return true;
    end
            
    local modData = player:getModData()
    
    if player:HasTrait("Stoner") then
		stonedchange = stonedchange * (0.4 * sVars.StonedIncreaseMulti);
    else
        stonedchange = stonedchange * (0.55 * sVars.StonedIncreaseMulti);
    end
    
    modData.StonedChange = (modData.StonedChange or 0) + stonedchange;
    
	if modData.StonedChange > 100 then
		modData.StonedChange = 100;
	end
    
	--print("Stoned value is " .. modData.StonedChange)
end

MoreSmokes.stonedDecrease = function(player)    
	--print("Running stoned Decrease function");
    
    player = type(player) == "number" 
        and getSpecificPlayer(tonumber(player)) 
        or player;
        
    player = player or getPlayer()

    if not player
    then
        return true;
    end
        
    local modData = player:getModData()
    local decrease = 1.5;
    
    if player:HasTrait("Stoner") then
		decrease = decrease * (0.55 * sVars.StonedDecreaseMulti);
    else
        decrease = decrease * (0.4 * sVars.StonedDecreaseMulti);
    end
    
    modData.StonedChange = (modData.StonedChange or 0) - decrease;
    
	if modData.StonedChange < 0 then
		modData.StonedChange = 0;
	end
    
	--print("Stoned value is " .. modData.StonedChange)
end