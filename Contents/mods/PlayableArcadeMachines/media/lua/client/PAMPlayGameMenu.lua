--***********************************************************
--** PseudonymousEd, the Dev
--** Playable Arcade Machines 41.50+
--** Context menu for playing an arcade machine
--***********************************************************

PAMPlayGameMenu = {};

-- Add play option to arcade machine context menus
PAMPlayGameMenu.doBuildMenu = function(player, context, worldobjects)

	-- Default to using Custom Animations	
	local USE_CUSTOM_ANIMATION = true
	
	local thisPlayer = getSpecificPlayer(player);
	
	-- Default to not using Custom Animations if in Build 41.50
	if getCore():getVersionNumber() == "41.50 - IWBUMS" then
		USE_CUSTOM_ANIMATION = false
	end
	--****************************************
	--* ATTENTION: If you have installed
	--*      the custom animations manually for Build 41.50,
	--*      make sure to uncomment
	--*      (remove -- from the front of)
	--*      local USE_CUSTOM_ANIMATION = true
	--****************************************
	
	-- To enable Custom Animations for Build 41.50,
	-- remove the -- from the following line:
	--local USE_CUSTOM_ANIMATION = true
	
	local arcadeMachine = nil
	local arcadeGroupName = nil

	for _,object in ipairs(worldobjects) do
		local square = object:getSquare()
		if square then
			for i=1,square:getObjects():size() do
				local thisObject = square:getObjects():get(i-1)
				
				if thisObject:getSprite() then

					local properties = thisObject:getSprite():getProperties()

					if properties ~= nil then
						local groupName = nil
						local customName = nil
						
						if properties:Is("GroupName") then
							groupName = properties:Val("GroupName")
							--print("PseudoEdPAM: Sprite GroupName: " .. groupName);
						end
						
						if properties:Is("CustomName") then
							customName = properties:Val("CustomName")
							--print("PseudoEdPAM: Sprite CustomName: " .. customName);
						end
			
						-- For Arcade Machines, Custom Name = "Machine" and the Group Name is more specific 
						if customName == "Machine" then

							if not ((SandboxVars.ElecShutModifier > -1 and
									 GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier) or
								thisObject:getSquare():haveElectricity()) then
								-- print("PseudoEdPAM: This object is unpowered");
								return
							end
							arcadeMachine = thisObject
							arcadeGroupName = groupName
							-- TODO:  Attempt to favor the square right in front of you
							-- thisPlayer:Say("Found " .. arcadeGroupName)
							break
						end -- if customName == "Machine"
					end -- if properties ~= nil
				end -- if ThisObject:getSprite()
			end -- for i=1,square:getObjects...
		end -- if square
		-- TODO: Attempt to favor the square right in front of you
		--if arcadeMachine then break
	end
							
	if not arcadeMachine then return end
				
	local soundFile = nil;
	local contextMenu = nil;
	local actionType = nil;
	
	if arcadeGroupName == "Kaboom Arcade" then
		soundFile = "PAMkaboomplay"
		soundEnd = "PAMkaboomend"
		contextMenu = "ContextMenu_Play_Kaboom"
		actionType = "Loot"
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayArcade"
		end
	elseif arcadeGroupName == "Dr. Oids Arcade" then
		soundFile = "PAMdroidsplay"
		soundEnd = "PAMdroidsend"
		contextMenu = "ContextMenu_Play_DrOids"
		actionType = "Loot"
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayArcade"
		end
	elseif arcadeGroupName == "PAWS Pinball" then
		local spriteName = arcadeMachine:getSprite():getName()
		-- TODO Fix and enable for the back of the Pinball machine
		if (spriteName == "recreational_01_25" or spriteName == "recreational_01_26") then
			-- print("PseudoEdPAM: Currently ignoring pinball backs.  Returning")
			-- -- print("PseudoEdPAM:  Not ignoring pinball backs right now")
			-- Currently unable to put player in correct position for back of pinball machine
			return
		end
		
		soundFile = "PAMpinballplay"
		soundEnd = "PAMpinballend"
		contextMenu = "ContextMenu_Play_PAWS_Pinball"
		actionType = "Loot"
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayPinball"
		end
	else
		print("PseudoEdPAM: Found unplayable machine with groupName " .. arcadeGroupName)
		return
	end -- if arcadeGroupName
	
	context:addOption(getText(contextMenu),
					  worldobjects,
					  PAMPlayGameMenu.onPlayGame,
					  getSpecificPlayer(player),
					  arcadeMachine,
					  soundFile,
					  soundEnd,
					  actionType,
					  960,
					  8,
					  5);
	
end

-- Moreso than the rest of the code, I don't really know what I'm doing here
PAMPlayGameMenu.walkToFront = function(thisPlayer, arcadeMachine)
	local frontSquare = nil
	local controllerSquare = nil
	local spriteName = arcadeMachine:getSprite():getName()
	if not spriteName then
		return false
	end

	local properties = arcadeMachine:getSprite():getProperties()
	
	local facing = nil
	if properties:Is("Facing") then
		facing = properties:Val("Facing")
		--print("PseudoEdPAM: walkToFront Sprite Facing: " .. facing)
	else
		print("PseudoEdPAM: " .. spriteName .. " has no facing")
		return
	end
	
	if facing == "S" then
		frontSquare = arcadeMachine:getSquare():getS()
	elseif facing == "E" then
		frontSquare = arcadeMachine:getSquare():getE()
	elseif facing == "W" then
		frontSquare = arcadeMachine:getSquare():getW()
	elseif facing == "N" then
		frontSquare = arcadeMachine:getSquare():getN()
	end
	
	if not frontSquare then
		return false
	end
	
	if not controllerSquare then
		controllerSquare = arcadeMachine:getSquare()
	end

	-- If the front of machine square is valid, walk to it
	if AdjacentFreeTileFinder.privTrySquare(controllerSquare, frontSquare) then
		-- TODO: AdjacentFreeTileFinder didn't work for me on 1st floor for pinball back
		-- Also didn't work on the 2nd floor if I used getOrCreateGridSquare for frontSquare
		--print("PseudoEdPAM: Valid front square, moving")
		ISTimedActionQueue.add(ISWalkToTimedAction:new(thisPlayer, frontSquare))
		return true
	end
	return false
end

-- Do when player selects option to play the game (from context menu)
PAMPlayGameMenu.onPlayGame = function(worldobjects, player, machine, soundFile, soundEnd, actionType, length, boredomReduction, stressReduction)
	if PAMPlayGameMenu.walkToFront(player, machine) then
		ISTimedActionQueue.add(PAMPlayGame:new(player, machine, soundFile, soundEnd, actionType, length, boredomReduction, stressReduction));
	end
end

Events.OnPreFillWorldObjectContextMenu.Add(PAMPlayGameMenu.doBuildMenu);
