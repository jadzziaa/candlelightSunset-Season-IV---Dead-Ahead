-- require("AUD/DebugPanel/CustomTab")

-- AUD.setButton(1, "53 x 265", function()

-- 	for i = 1, 53 do

-- 		getPlayer():getXp():AddXP(Perks.Electricity, 130)

-- 	end

-- end)

-- AUD.setButton(3, "x3 mult", function()

-- 	getPlayer():getXp():addXpMultiplier(Perks.Electricity, 3, 0, 2)

-- end)

-- AUD.setButton(4, "x5 mult", function()

-- 	getPlayer():getXp():addXpMultiplier(Perks.Electricity, 5, 2, 4)

-- end)

-- AUD.setButton(4, "10 x 339", function()
	
-- 	for i = 1, 10 do

-- 		getPlayer():getXp():AddXP(Perks.Electricity, 339)

-- 	end

-- end)

-- AUD.setButton(5, "Reset", function()
	
-- 	ExpRecovery.reset()

-- end)

-- AUD.setButton(6, "Give", function()
	
-- 	ExpRecovery.give()

-- end)

-- function ExpRecovery.reset()

-- 	for k,v in pairs(getPlayer():getModData()["ExpRecovery"]) do

-- 		for i = 1, 5 do
			
-- 			v[i] = 0

-- 		end

-- 	end

-- 	local player = getPlayer():getXp()
	
-- 	local pf = PerkFactory.PerkList
-- 	local pfSize = PerkFactory.PerkList:size()	
-- 	for i = pfSize-1, 0, -1 do
-- 		local obj = pf:get(i)
-- 		local skill = obj:getType()

-- 		for i = 1, 10 do
			
-- 			getPlayer():LevelPerk(skill)
-- 			getPlayer():getXp():setXPToLevel(skill, i)

-- 		end
		
-- 		getPlayer():level0(skill)
-- 		getPlayer():getXp():setXPToLevel(skill, 0)
-- 		getPlayer():getXp():setPerkBoost(skill, 0)
-- 		getPlayer():getXp():setPerkBoost(skill, 0)
-- 		getPlayer():getXp():getMultiplierMap():remove(skill)
-- 	end

-- 	-- for i = 1, 2 do
			
-- 	-- 	getPlayer():LevelPerk(Perks.Electricity)
-- 	-- 	getPlayer():getXp():setXPToLevel(Perks.Electricity, i)

-- 	-- end
	
-- 	getPlayer():setAlreadyReadPages("Base.BookElectrician1", 0)
-- 	getPlayer():setAlreadyReadPages("Base.BookElectrician2", 0)
-- 	getPlayer():setAlreadyReadPages("Base.BookElectrician3", 0)
-- 	getPlayer():setAlreadyReadPages("Base.BookElectrician4", 0)
-- 	getPlayer():setAlreadyReadPages("Base.BookElectrician5", 0)

-- end

-- function ExpRecovery.give()

-- 	local character = getPlayer()

-- 	for k,v in pairs(character:getModData()["ExpRecovery"]) do

-- 		for i = 1, 5 do

-- 			ExpRecovery:GiveMissedExpForPerk(character, Perks[k], i)

-- 		end

-- 	end

-- end

-- function ExpRecovery.ExpDebug()

-- 	local mod_data = getPlayer():getModData()["ExpRecovery"]

-- 	if not mod_data then
-- 		return
-- 	end

-- 	mod_data = mod_data["Electricity"]

-- 	if not mod_data then
-- 		return
-- 	end

-- 	AUD.insp("Cached Electricity Exp", "Level   Exp",
-- 		string.format(
-- 			"\n1           %f\n2           %f\n3           %f\n4           %f\n5           %f",
-- 			mod_data[1], mod_data[2], mod_data[3], mod_data[4], mod_data[5]
-- 		)
-- 	)

-- end

-- Events.OnTick.Add(ExpRecovery.ExpDebug)