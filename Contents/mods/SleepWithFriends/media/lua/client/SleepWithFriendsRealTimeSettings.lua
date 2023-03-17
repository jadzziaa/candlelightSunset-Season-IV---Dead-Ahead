function getVars()
	if SandboxVars.SleepWithFriends.RTorIG == 1 then
		fixHours()
	elseif SandboxVars.SleepWithFriends.RTorIG == 2 then
		Events.EveryOneMinute.Add(swfIG)
	else
	end
end
function fixHours()
	local player = getPlayer()
    local modData = player:getModData()
	if SandboxVars.DayLength == 1 then
		modData.swfServerDayLength = .25
		Events.EveryOneMinute.Add(swfRT)
	elseif SandboxVars.DayLength == 2 then
		modData.swfServerDayLength = .5
		Events.EveryOneMinute.Add(swfRT)
	elseif SandboxVars.DayLength > 2 then
		modData.swfServerDayLength = (SandboxVars.DayLength - 2)
		Events.EveryOneMinute.Add(swfRT)
	end
end
function swfRT()
    local player = getPlayer()
    local modData = player:getModData()
	if player:isAsleep() then
		if  modData.swfLoopCheck == 1 then
			modData.swfFatigue = (modData.swfFatigue - modData.swfFatThree)
			modData.swfEndurance = (modData.swfEndurance + modData.swfEndur)
			player:getStats():setFatigue(math.max(0, modData.swfFatigue))
			player:getStats():setEndurance(math.min(1, modData.swfEndurance))
			if player:getStats():getFatigue() <= 0 and modData.swfAutoWake == 1 then
				modData.swfLoopCheck = 0
				player:forceAwake()
			else
			end
        elseif modData.swfLoopCheck == 0 then
			modData.swfFatigue = player:getStats():getFatigue()
			modData.swfEndurance = player:getStats():getEndurance()
			modData.swfAutoWake = SandboxVars.SleepWithFriends.AutoWake
			modData.swfFatOne = (24 / modData.swfServerDayLength)
			modData.swfFatTwo = (1 / modData.swfFatOne)
			modData.swfFatThree = (modData.swfFatTwo / SandboxVars.SleepWithFriends.SleepLength)
			modData.swfEndur = (modData.swfFatThree * SandboxVars.SleepWithFriends.EndurMulti)
			modData.swfLoopCheck = 1
		end
	else
		modData.swfLoopCheck = 0
	end
end
function swfIG()
    local player = getPlayer()
    local modData = player:getModData()
	if player:isAsleep() then
		if  modData.swfLoopCheck == 1 then
			modData.swfFatigue = (modData.swfFatigue - modData.swfFatTwo)
			modData.swfEndurance = (modData.swfEndurance + modData.swfEndur)
			player:getStats():setFatigue(math.max(0, modData.swfFatigue))
			player:getStats():setEndurance(math.min(1, modData.swfEndurance))
			if player:getStats():getFatigue() <= 0 and SandboxVars.SleepWithFriends.AutoWake == 1 then
				modData.swfLoopCheck = 0
				player:forceAwake()	
				end
        elseif modData.swfLoopCheck == 0 then
			modData.swfFatigue = player:getStats():getFatigue()
			modData.swfEndurance = player:getStats():getEndurance()
			modData.swfFatOne = (SandboxVars.SleepWithFriends.SleepLength * 60)
			modData.swfFatTwo = (1 / modData.swfFatOne)
			modData.swfEndur = (modData.swfFatTwo * SandboxVars.SleepWithFriends.EndurMulti)
			modData.swfLoopCheck = 1
		end
	else
		modData.swfLoopCheck = 0
	end
end

Events.OnChatWindowInit.Add(getVars)

