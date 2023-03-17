--****************************
--****by: orcslayer94#4442****
--****************************

function CheckHappyness()

	for playerIndex = 0, getNumActivePlayers() -1 do
		local player = getSpecificPlayer(playerIndex)
		local bodydamage = player:getBodyDamage()
		local stats = player:getStats()
		local unhappyness = bodydamage:getUnhappynessLevel()
		local fatigue = stats:getFatigue()
		
		if unhappyness >= 80 then
			stats:setFatigue(fatigue + 0.05)
			
			local sayrandom = ZombRand(4)
			if sayrandom == 1 then
				player:Say("I can't wait until its time to sleep...")
			end
			if sayrandom == 2 then
				player:Say("I should be happier in my dreams.")
			end
			if sayrandom == 3 then
				player:Say("I want to escape reality. Sleep may be the answer.")
			end
		end
		
	end

end

Events.EveryTenMinutes.Add(CheckHappyness);