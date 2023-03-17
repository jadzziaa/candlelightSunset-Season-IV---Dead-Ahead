--I Might Need A Lighter Mod by Fingbel

local StoveSmoking = {}

local function LightCigOnStove(_player, context, worldObjects, _test)
    if _test then return true end

	local player = getSpecificPlayer(_player);
	local smokables = CheckInventoryForCigarette(player)
	ContextDrawing(player, context, whatIsUnderTheMouse(worldObjects, player), smokables)
end

Events.OnPreFillWorldObjectContextMenu.Add(LightCigOnStove)

--This function is responsible for the drawing of the context depending on the smokable array size
function ContextDrawing(player, context, stove, smokables)
	
	if stove == nil then return end
	
	--If we do not have nothing to smoke then we don't draw anything
	if smokables == nil then return

		--PREVIOUS METHOD : This add a red option not selectable, this create clutter
		--local foo = context:addOptionOnTop(getText('ContextMenu_Smoke'), player, stove)
		--foo.notAvailable = true
		--return	

	--If we have only one smokable type in the array 
	elseif getTableSize(smokables) == 1 then
		option = context:addOptionOnTop(getText('ContextMenu_Smoke') .."  ".. smokables[0]:getDisplayName(), player, OnStoveSmoking, stove, smokables[0])
	return
	end

	--We have more than one type, we need to draw a sub-menu
	local smokeOption = context:addOptionOnTop(getText('ContextMenu_Smoke'), stove, nil);		
	local subMenu = ISContextMenu:getNew(context)
	for i=0,getTableSize(smokables) -1 do	

		option = subMenu:addOptionOnTop(smokables[i]:getDisplayName(), player, OnStoveSmoking, stove, smokables[i])
		context:addSubMenu(smokeOption, subMenu);		
	end
end

function whatIsUnderTheMouse ( worldObjects, playerObj)
	for i,stove in ipairs(worldObjects) do	
		--Did we click on a player ?
		for x=stove:getSquare():getX()-1,stove:getSquare():getX()+1 do
			for y=stove:getSquare():getY()-1,stove:getSquare():getY()+1 do
				local sq = getCell():getGridSquare(x,y,stove:getSquare():getZ());
				if sq then
					for i=0,sq:getMovingObjects():size()-1 do
						local o = sq:getMovingObjects():get(i)
						if instanceof(o, "IsoPlayer") and (o ~= playerObj) and SandboxVars.IMNAL.allowBump then
							if string.match(o:getAnimationDebug(), "foodtype : Cigarettes") then
							return o
							end
						end
					end
				end
			end
		end
	--did we clicked a stove?	
		if stove:getObjectName() == ("Stove") and not stove:isMicrowave() and SandboxVars.IMNAL.allowStove and ((SandboxVars.ElecShutModifier > -1 and getGameTime():getNightsSurvived() < SandboxVars.ElecShutModifier) or stove:getSquare():haveElectricity()) then return stove
	--did we clicked a microwave ?
		elseif stove:getObjectName() == ("Stove") and stove:isMicrowave() and SandboxVars.IMNAL.allowMicrowave and ((SandboxVars.ElecShutModifier > -1 and getGameTime():getNightsSurvived() < SandboxVars.ElecShutModifier) or stove:getSquare():haveElectricity()) then return stove
	--did we clicked a lit fireplace ?
		elseif stove:getObjectName() == ("Fireplace") and stove:isLit() and SandboxVars.IMNAL.allowFireplace then return stove										
	--did we clicked a lit barbecue ?
		elseif stove:getObjectName() == ("Barbecue") and stove:isLit() and SandboxVars.IMNAL.allowBarbecue then return stove									
	--did we clicked a Campfire ? We check the sprite directly to check if the campfire is lit or not
		elseif stove:getObjectName() == ("IsoObject") and stove:getSpriteName() == "camping_01_5" and SandboxVars.IMNAL.allowCampfire then return stove						
	--did we clicked on a Fire ? You mad man 
		elseif stove:getSquare():haveFire() and SandboxVars.IMNAL.allowFire then return stove end
	end
end

function OnStoveSmoking(_player, stove, _cigarette) 
	ISWorldObjectContextMenu.Test = true

	--We need to make sure the clicked player is still smoking
	if instanceof(stove, 'IsoPlayer') then
		if not string.match(stove:getAnimationDebug(), "foodtype : Cigarettes") then return end
	end

	--Do we need to transfer cigarette from a bag first ? 
	if luautils.walkAdj(_player, stove:getSquare(), true) then 
		if _cigarette:getContainer() ~= _player:getInventory() then
			ISTimedActionQueue.add(ISInventoryTransferAction:new (_player,  _cigarette, _cigarette:getContainer(), _player:getInventory(), 5))
		end
	end
	
	--This is where we calculate the length of the timed action and outcome
	local outcome = DeterminateStoveSmokingOutcome(_player, stove, _cigarette)

	--Let's light what we've found
	if luautils.walkAdj(_player, stove:getSquare(), true) then 
		
		if instanceof(stove, 'IsoStove') and not stove:isMicrowave() then 
			ISTimedActionQueue.add(IsStoveLighting:new (_player, stove, _cigarette,outcome, SandboxVars.IMNAL.stoveBaseTimer/outcome))
		elseif instanceof(stove, 'IsoStove') and stove:isMicrowave() then 
			ISTimedActionQueue.add(IsStoveLighting:new (_player, stove, _cigarette,outcome, SandboxVars.IMNAL.microwaveBaseTimer/outcome)) 
		elseif instanceof(stove,'IsoFireplace') and stove:isLit() then 
			ISTimedActionQueue.add(IsStoveLighting:new (_player, stove, _cigarette,outcome, SandboxVars.IMNAL.fireplaceBaseTimer/outcome)) 
		elseif instanceof(stove,'IsoBarbecue') and stove:isLit() then 
			ISTimedActionQueue.add(IsStoveLighting:new (_player, stove, _cigarette,outcome, SandboxVars.IMNAL.barbecueBaseTimer/outcome)) 
		elseif instanceof(stove, "IsoObject") and stove:getSpriteName() == "camping_01_5" then 
			ISTimedActionQueue.add(IsStoveLighting:new (_player, stove, _cigarette,outcome, SandboxVars.IMNAL.campingBaseTimer/outcome)) 
		elseif stove:getSquare():haveFire() then
			ISTimedActionQueue.add(IsStoveLighting:new (_player, stove, _cigarette,outcome, SandboxVars.IMNAL.fireBaseTimer/outcome))
		else for i=0,stove:getSquare():getMovingObjects():size()-1 do
				local o = stove:getSquare():getMovingObjects():get(i)
				if instanceof(o, "IsoPlayer") and (o ~= playerObj) then
					if string.match(o:getAnimationDebug(), "foodtype : Cigarettes") then 
						ISTimedActionQueue.add(IsStoveLighting:new (_player, stove, _cigarette,outcome, SandboxVars.IMNAL.playerBaseTimer/outcome)) 
					end
				end		
			end
		end
	end

	--Now it's lit, let's smoke it
	if luautils.walkAdj(_player, stove:getSquare(), true) then 	
		ISTimedActionQueue.add(IsStoveSmoking:new(_player, stove, _cigarette, 460)) -- THIS ONE IS HARDCODED TO REFLECT VANILLA SMOKING
	end
end

--This is where we determine the outcome of the attempt. The function return between 0 and 1.
function DeterminateStoveSmokingOutcome(_player, stove, _cigarette)	
	local outcome = 1
	
	local stats = _player:getStats()
	local pain = stats:getPain()
    local endurance = stats:getEndurance()
    local fatigue = stats:getFatigue()
	local panic = stats:getPanic()
	local drunkenness = stats:getDrunkenness()

	local hand_L = _player:getBodyDamage():getBodyPart(BodyPartType.Hand_L)
	local hand_R = _player:getBodyDamage():getBodyPart(BodyPartType.Hand_R)

	print("Pain : ", pain)
	print("Endurance : ",endurance)
	print("Fatigue : ",fatigue)
	print("Panic : ",panic)
	print("Drunkenness:",drunkenness)

	--TODO : BALANCE THIS MESS
	--Fatigue influence on outcome
	if (fatigue >= 0.6) then outcome = outcome - 0.15 end

	--Pain influence on outcome
	if(pain >=50) then outcome = outcome - 0.20 end

	--Panic influence on outcome
	if(panic >= 30 and panic <= 70) then outcome = outcome - 0.15 end
	if(panic >=70) then outcome = outcome - 0.30 end

	--Endurance influence on outcome
	if(endurance > 0 and endurance < 0.25) then outcome = outcome - 0.30 end
	if(endurance > 0.25 and endurance <0.5) then outcome = outcome - 0.15 end
	if(endurance > 0.5 and endurance <0.7) then outcome = outcome - 0.10 end
	
	--Drunkenness influence on outcome
	if(drunkenness > 70) then outcome = outcome - 0.4 end
	if(drunkenness > 35 and drunkenness < 70) then outcome = outcome - 0.2 end

	--Hand Injuries influence on outcome
	if(hand_L:HasInjury() or hand_L:isDeepWounded() or hand_L:isBurnt() or hand_L:isCut() or hand_L:haveGlass() or hand_L:bandaged()) then outcome = outcome -0.15 end
	if(hand_R:HasInjury() or hand_R:isDeepWounded() or hand_R:isBurnt() or hand_R:isCut() or hand_R:haveGlass() or hand_R:bandaged()) then outcome = outcome -0.15 end

	--We're clamping here to not obtain stupidly long lenght for the timed action
	if(outcome < 0.3) then outcome = 0.3 end
	
	--print("Outcome : ", outcome)
	return outcome
end