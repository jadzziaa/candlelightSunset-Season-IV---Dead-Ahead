--[[
		Developed by Codename280
		Working Treadmill 41.78+
]]

FWOWorkingTreadmillMenu2 = {};

-- Add use option to treadmill context menus
FWOWorkingTreadmillMenu2.doBuildMenu = function(player, context, worldobjects)

	local treadmillObject = nil
	local treadmillGroupName = nil

	for _,object in ipairs(worldobjects) do
		local square = object:getSquare()
		if not square then
			--print(do not find world object)
			return
		end
		
		for i=1,square:getObjects():size() do
			local thisObject = square:getObjects():get(i-1)
			
			if thisObject:getSprite() then

				local properties = thisObject:getSprite():getProperties()

				if properties == nil then
					--print(do not find world object properties)
					return
				end
				
				local groupName = nil
				local customName = nil
				
				if properties:Is("GroupName") or properties:Is("CustomName") then
					groupName = properties:Val("GroupName")
					customName = properties:Val("CustomName")
				end
				
				if customName == "Hamster Wheel" then
					if not ((SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier) or thisObject:getSquare():haveElectricity()) then
						getSpecificPlayer(player):Say("The treadmill needs electricity to run")
						return
					end
					
					treadmillObject = thisObject
					FWOObject = thisObject
					treadmillGroupName = groupName
					break
				end -- if customName == "Hamster Wheel"
			end -- if ThisObject:getSprite()
		end -- for i=1,square:getObjects...
		--if treadmillObject then break	
	end
	
	if not treadmillObject then 
		--print("this isn't treadmill")
		return 
	end
	
	local contextMenu = nil
	local actionType = nil
	
	if treadmillGroupName == "Human" then
		local spriteName = treadmillObject:getSprite():getName()
		--print("Sprite Name: " .. spriteName)
		
		if (spriteName == "recreational_sports_01_28") or (spriteName == "recreational_sports_01_31") or (spriteName == "recreational_sports_01_37") or (spriteName == "recreational_sports_01_38") then
			--print("Ignore running wheel side of treadmill")
			return 
		end
		
		contextMenu = "Use Treadmill fitness"
		actionType = "treadmill"
		--print("Found usable treadmill")
	else
		return
	end
	
	context:addOption(getText(contextMenu),
					  worldobjects,
					  FWOWorkingTreadmillMenu2.onUseTreadmill,
					  getSpecificPlayer(player),
					  treadmillObject,
					  actionType,
					  5760)
	
end


FWOWorkingTreadmillMenu2.walkToFront = function(thisPlayer, treadmillObject)
	local frontSquare = nil
	local controllerSquare = nil
	local spriteName = treadmillObject:getSprite():getName()
	if not spriteName then
		return false
	end

	local properties = treadmillObject:getSprite():getProperties()
	
	local facing = nil
	if properties:Is("Facing") then
		facing = properties:Val("Facing")
		--thisPlayer:Say("WalkToFront Sprite Facing: " .. facing)
	else
		return
	end
	
	if facing == "S" then
		frontSquare = treadmillObject:getSquare():getS()
	elseif facing == "E" then
		frontSquare = treadmillObject:getSquare():getE()
	elseif facing == "W" then
		frontSquare = treadmillObject:getSquare():getW()
	elseif facing == "N" then
		frontSquare = treadmillObject:getSquare():getN()
	end
	
	if not frontSquare then
		return false
	end
	
	if not controllerSquare then
		controllerSquare = treadmillObject:getSquare()
	end

	-- If the front of treadmill square is valid, walk to it
	if AdjacentFreeTileFinder.privTrySquare(controllerSquare, frontSquare) then
		ISTimedActionQueue.add(ISWalkToTimedAction:new(thisPlayer, frontSquare))
		return true
	end
	return false
end


-- Do when player selects option to use a treadmill (from context menu)
FWOWorkingTreadmillMenu2.onUseTreadmill = function(worldobjects, player, machine, actionType, length)
	if FWOWorkingTreadmillMenu2.walkToFront(player, machine) then
	
		forceDropHeavyItems(player)
		player:setPrimaryHandItem(nil)
		player:setSecondaryHandItem(nil)
		
		if player:getMoodles():getMoodleLevel(MoodleType.Endurance) > 2 then
			player:Say("Too exhausted to use")
			return
		end
		if player:getMoodles():getMoodleLevel(MoodleType.Pain) > 3 then
			player:Say("Too much pain to use")
			return
		end
				
		if not SandboxVars.FWOWorkingTreadmill.BenchTreadKeepBagsOn then		
			-- take off worn container items
			for i=0,player:getWornItems():size()-1 do
				local item = player:getWornItems():get(i):getItem();
				if item and instanceof(item, "InventoryContainer") then
					ISTimedActionQueue.add(ISUnequipAction:new(player, item, 50));
					if SandboxVars.FWOWorkingTreadmill.TreadmillDropBags then
						ISTimedActionQueue.add(ISDropItemAction:new(player, item, 50));
					end
				end
			end
		end	
		
		if player:getMoodles():getMoodleLevel(MoodleType.HeavyLoad) > 2 then
			player:Say("Too heavy to use")
			return
		end
		ISTimedActionQueue.add(ISFitnessAction:new(player, actionType, length , ISFitnessUI:new(0,0, 600, 350, player) , FitnessExercises.exercisesType.treadmill ))
	end
end

Events.OnPreFillWorldObjectContextMenu.Add(FWOWorkingTreadmillMenu2.doBuildMenu);
