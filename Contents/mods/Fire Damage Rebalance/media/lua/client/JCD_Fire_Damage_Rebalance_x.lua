JCD_FBR = JCD_FBR

local function JCD_FRB_reduceAllPlayerFireDamage()
	for playerIndex = 0, getNumActivePlayers()-1 do
		local player = getSpecificPlayer(playerIndex);
		
		player:setFireKillRate(0.00095);  -- default 0.003800000064074993, 0.00095 = 4 times less.
	end
end

local function JCD_FRB_increaseAllZombieFireDamage()
	local zombies = getWorld():getCell():getZombieList()
	
	for i=0,zombies:size() -1 do
		--zombies:get(i):setFireSpreadProbability(6) --Fire spread probability. default value: 6, 0 = Fire will never be spread by zombies.
		zombies:get(i):setFireKillRate(0.0152) --Fire kill rate. default value: 0.003800000064074993, 0 = Fire can never kill zombies, 0.0152 = 4 times more.
	end
end


Events.EveryTenMinutes.Add(JCD_FRB_reduceAllPlayerFireDamage)
Events.EveryTenMinutes.Add(JCD_FRB_increaseAllZombieFireDamage)
Events.OnGameStart.Add(JCD_FRB_reduceAllPlayerFireDamage)
Events.OnGameStart.Add(JCD_FRB_increaseAllZombieFireDamage)