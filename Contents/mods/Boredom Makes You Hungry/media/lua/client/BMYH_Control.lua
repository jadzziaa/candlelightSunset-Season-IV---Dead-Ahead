--****************************
--****by: orcslayer94#4442****
--****************************

function CheckBoredom()

	for playerIndex = 0, getNumActivePlayers() -1 do
		local player = getSpecificPlayer(playerIndex)
		local bodydamage = player:getBodyDamage()
		local stats = player:getStats()
		local boredom = bodydamage:getBoredomLevel()
		local hunger = stats:getHunger()
		local fatigue = stats:getFatigue()
		
		if boredom >= 75 then
		
			stats:setHunger(hunger + 0.025)
			
			-- check to work with my other mods
			if fatigue <= 0.89 then
				local sayrandom = ZombRand(4)
				if sayrandom == 1 then
					player:Say("I wonder whats in the fridge...")
				end
				if sayrandom == 2 then
					player:Say("Chips sound nice right about now.")
				end
				if sayrandom == 3 then
					player:Say("Let me see whats in the pantry.")
				end
			end
			
		end
		
	end

end

Events.EveryTenMinutes.Add(CheckBoredom);