function sleepOnIt()
	for playerIndex = 0, getNumActivePlayers()-1 do
		local player = getSpecificPlayer(playerIndex)
		if player:isAsleep() then
			local currentBoredom = player:getBodyDamage():getBoredomLevel()
			player:getBodyDamage():setBoredomLevel(currentBoredom - 1.5)
			if player:getBodyDamage():getBoredomLevel() < 0 then
				player:getBodyDamage():setBoredomLevel(0)
			end
			local currentUnhappyness = player:getBodyDamage():getUnhappynessLevel()
			player:getBodyDamage():setUnhappynessLevel(currentUnhappyness - 0.5)
			if player:getBodyDamage():getUnhappynessLevel() < 0 then
				player:getBodyDamage():setUnhappynessLevel(0)
			end
		end
	end
end

Events.EveryTenMinutes.Add(sleepOnIt)