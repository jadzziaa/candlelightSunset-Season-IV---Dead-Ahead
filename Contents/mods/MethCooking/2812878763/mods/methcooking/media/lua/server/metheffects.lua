--[[
	IRL meth suppresses appetite, causes agitation, reduces fatigue, induces euphoria, increases feelings of physical
			capability and longer term use results in weight loss and, eventually, psychosis and malnutrition. So how
			should we model this? For code my base adjustments have been mostly based around a 1/3rd range variation
			of the stat's native range...
				* Boredom:	-1/3 (alleviates some boredom, but doesn't eradicate it).
				* Drunkenness:	+50 (inebritaed) rather than +100 (utterly shit-faced)
				* Endurance:	+1/3 (meth heightens feelings of physical capability).
				* Fatigue:	-1/3 (meth heightens feelings of physical capability).
				* Fear:		-1/3 (meth reduces fear)
							NOTE: Bad meth increases fear.
				* Hunger:	=0 (meth removes appetite)
				* Panic:	+1/3 (meth produces feelings of 'slight panic')
							NOTE: Bad meth produices double the panic.
				* Stress:	+1/3 (meth makes us 'anxious')
							NOTE: Bad meth produces double the stress.
				* PoisonLevel: Only bad meth sets this, with a 5%-10% chance of a potentially fatal dose of poison.
			For blue or pepper meth some of the values are adjusted away these base values.

	Testing on stat changes (done in debugger)...
			setAnger(X)			0:normal, 0.2:irritated, 0.3:annoyed, 0.6:angry, 0.8:furious
			setBoredom(X)		No effect? Cannot be adjusted manually? But the debugger GUI adjusts it and adjusting it in mod code works?!?
			setDrunkenness(X)	0:normal, 20:a bit tipsy, 40:inebriated, 60:plastered, 80:utterly shit-faced
			setEndurance(X)		0:exhausted, 0.1:exessive exertion, 0.3:high exertion, 0.5:moderate exertion, 0.8:normal
			setFatigue(X)		0:normal, 0.6:drowsy, 0.7:drowsy, 0.8:very tired, 0.9:ridiculously tired, 
			setFear(X)			No moodle effect. Debugger shows it as a 0.0 through 1.0 attribute. (0 best, 1 worst)
			setFitness(X)		No visible effect. Debugger shows it as a 0.0 through 1.0 attribute. (0 best, 1 worst)
			setFoodSicknessLevel(X)	0:normal, 30:queasy, 60:nauseus, 80:sick, 100:fever
			setHunger(X)		0:normal, 0.2:peckish, 0.3:hungry, 0.5:very hungry, 0.7:starving
			setIdleboredom(X)	See Boredom.
			setMorale(X)		"Can only be adjusted when stress>0". Adjusting this seems to have no effect on Morale.
			setPain(X)			Cannot be adjusted manually.
			setPanic(X)			0:normal, 10:slight panic, 40:panic, 70:strong panic, 90:extreme panic
			setPoisonLevel(X)	Range -1000000000 to 1000000000. Values from 5 are significant, from 27.5 kill a freshspawn.
			setSanity(X)		No visible effect. Debugger shows it as a 0.0 through 1.0 attribute. (0 best, 1 worst)
			setSickness(X)		Cannot be adjusted manually.
			setStress(X)		0:normal, 0.3:anxious, 0.5:agitated, 0.8:stressed, 0.9:nervious wreck, 
			setStressFromCigarettes(X)	0:normal, 0.3:anxious, 0.6:agitated, 
			setThirst(X)		0:normal, 0.2:slightly thirsty, 0.3:thirsty, 0.7:parched, 0.9:dying of thirst
--]]

function OnTake_MethGood(food, player)

	local dmg = player:getBodyDamage();
	local stats = player:getStats();
	
	dmg:setFoodSicknessLevel(dmg:getFoodSicknessLevel() + 20);
	stats:setBoredom(stats:getBoredom() - 33.3);				-- surf: -100 -> -33.3
	stats:setPanic(stats:getPanic() + 33.3);					-- surf: 75 -> 33.3
	stats:setFear(stats:getFear() - 0.333);						-- surf: 25 -> -0.333
	stats:setDrunkenness(stats:getDrunkenness() + 50);			-- surf: 100 -> 50
	
	-- surfarcher additions.
	stats:setEndurance(stats:getEndurance() + 0.333);
	stats:setFatigue(stats:getFatigue() - 0.333);
	stats:setHunger(0);
	stats:setStress(stats:getStress() + 0.333);
	
	for i = 0, dmg:getBodyParts():size() - 1 do
        local bod = dmg:getBodyParts():get(i);
        bod:AddDamage(1.5);
	end
	
end

function OnTake_MethBad(food, player, items, result)
	
	local dmg = player:getBodyDamage();
	local stats = player:getStats();
	
	dmg:setFoodSicknessLevel(dmg:getFoodSicknessLevel() + 50);
	stats:setBoredom(stats:getBoredom() - 33.3);				-- surf: -100 -> -33.3
	stats:setPanic(stats:getPanic() + 66.6);					-- surf: 75 -> 66.6
	stats:setFear(stats:getFear() + 0.333);						-- surf: 25 -> 0.333
	stats:setDrunkenness(stats:getDrunkenness() + 50);			-- surf: 100 -> 50
	
	-- surfarcher additions.
	stats:setEndurance(stats:getEndurance() + 0.333);
	stats:setFatigue(stats:getFatigue() - 0.333);
	stats:setHunger(0);
	stats:setStress(stats:getStress() + 0.666);
	
	for i = 0, dmg:getBodyParts():size() - 1 do
        local bod = dmg:getBodyParts():get(i);
        bod:AddDamage(2.5);
	end
	
	-- surfarcher: MethBad has a 15% chance of potentially fatal poisoning.
	if ZombRand(1, 100) <= 15 then
		dmg:setPoisonLevel(dmg:getPoisonLevel() + ZombRand(5, 35));
	end

end

function OnTake_BlueMethGood(food, player)

	local dmg = player:getBodyDamage();
	local stats = player:getStats();
	
	dmg:setFoodSicknessLevel(dmg:getFoodSicknessLevel() + 10);
	stats:setBoredom(stats:getBoredom() - 66.6);				-- surf: -100 -> -66.6
	stats:setPanic(stats:getPanic() + 33.3);					-- surf: 50 -> 33.3
	stats:setFear(stats:getFear() - 0.666);						-- surf: 0 -> -0.666
	stats:setDrunkenness(stats:getDrunkenness() + 50);			-- surf: 100 -> 50
	
	-- surfarcher additions.
	stats:setEndurance(stats:getEndurance() + 0.666);
	stats:setFatigue(stats:getFatigue() - 0.666);
	stats:setHunger(0);
	stats:setStress(stats:getStress() + 0.333);
	
	for i = 0, dmg:getBodyParts():size() - 1 do
        local bod = dmg:getBodyParts():get(i);
        bod:AddDamage(1);
	end
	
end

function OnTake_BlueMethBad(food, player)

	local dmg = player:getBodyDamage();
	local stats = player:getStats();
	
	dmg:setFoodSicknessLevel(dmg:getFoodSicknessLevel() + 20);
	stats:setBoredom(stats:getBoredom() - 66.6);				-- surf: -100 -> -66.6
	stats:setPanic(stats:getPanic() + 66.6);					-- surf: 75 -> 66.6
	stats:setFear(stats:getFear() + 0.666);						-- surf: 25 -> +0.666
	stats:setDrunkenness(stats:getDrunkenness() + 50);			-- surf: 100 -> 50
	
	-- surfarcher additions.
	stats:setEndurance(stats:getEndurance() + 0.666);
	stats:setFatigue(stats:getFatigue() - 0.666);
	stats:setHunger(0);
	stats:setStress(stats:getStress() + 0.666);
	
	for i = 0, dmg:getBodyParts():size() - 1 do
        local bod = dmg:getBodyParts():get(i);
        bod:AddDamage(2.5);
	end
	
	-- surfarcher: BlueMethBad has a 5% chance of potentially fatal poisoning.
	if ZombRand(1, 100) <= 5 then
		dmg:setPoisonLevel(dmg:getPoisonLevel() + ZombRand(5, 35));
	end
	
end

function OnTake_PepperMethGood(food, player)

	local dmg = player:getBodyDamage();
	local stats = player:getStats();
	
	dmg:setFoodSicknessLevel(dmg:getFoodSicknessLevel() + 15);
	stats:setBoredom(stats:getBoredom() - 50);					-- surf: -100 -> -50
	stats:setPanic(stats:getPanic() + 33.3);					-- surf: 20 -> 33.3
	stats:setFear(stats:getFear() - 0.5);						-- surf: 20 -> -0.5
	stats:setDrunkenness(stats:getDrunkenness() + 50);			-- surf: 100 -> 50
	stats:setEndurance(stats:getEndurance() + 0.5);				-- surf: 10 -> 0.5
	
	-- surfarcher additions.
	stats:setFatigue(stats:getFatigue() - 0.5);
	stats:setHunger(0);
	stats:setStress(stats:getStress() + 0.333);
	
	for i = 0, dmg:getBodyParts():size() - 1 do
        local bod = dmg:getBodyParts():get(i);
        bod:AddDamage(2.5);
	end
	
end

function OnTake_PepperMethBad(food, player)

	local dmg = player:getBodyDamage();
	local stats = player:getStats();
	
	dmg:setFoodSicknessLevel(dmg:getFoodSicknessLevel() + 75);
	stats:setBoredom(stats:getBoredom() - 50);					-- surf: -100 -> -50
	stats:setPanic(stats:getPanic() + 66.6);					-- surf: 50 -> 66.6
	stats:setFear(stats:getFear() + 0.5);						-- surf: 25 -> 0.5
	stats:setDrunkenness(stats:getDrunkenness() + 50);			-- surf: 100 -> 50
	stats:setEndurance(stats:getEndurance() + 0.5);				-- surf: 50 -> 0.5
	
	-- surfarcher additions.
	stats:setFatigue(stats:getFatigue() - 0.5);
	stats:setHunger(0);
	stats:setStress(stats:getStress() + 0.666);
	
	for i = 0, dmg:getBodyParts():size() - 1 do
        local bod = dmg:getBodyParts():get(i);
        bod:AddDamage(5);
	end
	
	-- surfarcher: PepperMethBad has a 10% chance of potentially fatal poisoning.
	if ZombRand(1, 100) <= 10 then
		dmg:setPoisonLevel(dmg:getPoisonLevel() + ZombRand(5, 35));
	end
	
end

