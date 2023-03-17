require "TrueActionsSetting"
require "CommonTemplates/ISUI/ISContextMenuExtension" 

function ISWorldObjectContextMenu.sitOnObject(player, context, worldobjects, test)
    -- print("sitOnObject")
    if item then
        -- print("ITEM: ", item:getSprite():getName())
        -- print(item:getSprite():getProperties():Is(IsoFlagType.solidtrans))
        -- print(item:getSprite():getProperties():Is(IsoFlagType.solid))
    end
    if bed then
        -- print("BED: ", bed:getSprite():getName())
        -- if not bed:getSprite():getProperties():Is(IsoFlagType.solidtrans) then
        
        -- bed:getSprite():getProperties():Set(IsoFlagType.doorW)
        -- bed:getSprite():getProperties():Set(IsoFlagType.doorN)
        
        
        -- Test IsoFlagType
        -- local flag = IsoFlagType.doorW
        -- print(flag)
        -- print(bed:getSprite():getProperties():Is(flag))
        -- if bed:getSprite():getProperties():Is(flag) then
            -- bed:getSprite():getProperties():UnSet(flag)
        -- else
            -- bed:getSprite():getProperties():Set(flag)
        -- end
        
        
        
        -- end
        -- if not bed:getSprite():getProperties():Is(IsoFlagType.solid) then
            -- print(bed:getSprite():getProperties():Is(IsoFlagType.solid))
            -- bed:getSprite():getProperties():Set(IsoFlagType.solid)
        -- end
        
        --IsoFlagType.doorN - делают прозрачным тайл для других игроков
        --IsoFlagType.doorW - 
    end

    local playerObj = getSpecificPlayer(player)
    if not playerObj:getVehicle() then
        local woForSeat = nil
        local woForLie = nil
        if bed and bed:getSprite() then
            if TrueActions.WorldSeatObject[bed:getSprite():getName()] then
                woForSeat = bed
            end
            if TrueActions.WorldLieObject[bed:getSprite():getName()] then
                woForLie = bed
            end
        end
        -- print(item:getSprite():getName())
        if not woForSeat and item and item:getSprite() and TrueActions.WorldSeatObject[item:getSprite():getName()] then
            woForSeat = item
        end
        if not woForLie and item and item:getSprite() and TrueActions.WorldLieObject[item:getSprite():getName()] then
            woForLie = item
        end
        if not playerObj:isSitOnGround() then -- and not playerObj:isSitOnGround()        
            if woForSeat then
                context:addOption(getText("ContextMenu_Sit"), playerObj, TrueActions.onSitOnWorldObject, woForSeat, TrueActions.WorldSeatObject[woForSeat:getSprite():getName()], woForSeat:getSprite():getProperties():Val("Facing"));
            end
            if woForLie then
                -- print("isJustMoved")
                -- print(getPlayer():isJustMoved())
                context:addOption(getText("ContextMenu_Lie"), playerObj, TrueActions.onLieOnWorldObject, woForLie, TrueActions.WorldLieObject[woForLie:getSprite():getName()]);
            end
            if woForLie then
                context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_Sleep")))
            end
        elseif (playerObj:getVariableString("SitWOAnim") == "OnBed" or 
                playerObj:getVariableString("SitWOAnim") == "OnBedReversoE" or 
                playerObj:getVariableString("SitWOAnim") == "OnBedReversoS") then
            context:addOption(getText("ContextMenu_OnSleep"), playerObj, TrueActions.onSleepOnWorldObject);
            TrueActions.updateSleepOption(context, player, bed, TrueActions.WorldLieObject[name_sprite])
        elseif  playerObj:getVariableString("SitWOAnim") == "Sleep" or 
                playerObj:getVariableString("SitWOAnim") == "SleepReversoE" or 
                playerObj:getVariableString("SitWOAnim") == "SleepReversoS"then
            context:addOption(getText("ContextMenu_Sit"), playerObj, TrueActions.fromSleep);
            TrueActions.updateSleepOption(context, player, bed, TrueActions.WorldLieObject[name_sprite])
        end
    end
end


function TrueActions.updateSleepOption (context, player, item, dirData)
    local old_option_update = context:getOptionFromName(getText("ContextMenu_Sleep"))
    if old_option_update then
        local playerObj = getSpecificPlayer(player)
        local sleepOption = context:updateOptionTsar(old_option_update.id, old_option_update.name, player, TrueActions.onSleepOnWorldObjectQuickly, item, dirData)
        local tooltipText = nil
        -- Not tired enough
        local sleepNeeded = not isClient() or getServerOptions():getBoolean("SleepNeeded")
        if sleepNeeded and playerObj:getStats():getFatigue() <= 0.3 then
            sleepOption.notAvailable = true;
            tooltipText = getText("IGUI_Sleep_NotTiredEnough");
        end
        -- Sleeping pills counter those sleeping problems
        if playerObj:getSleepingTabletEffect() < 2000 then
            -- In pain, can still sleep if really tired
            if playerObj:getMoodles():getMoodleLevel(MoodleType.Pain) >= 2 and playerObj:getStats():getFatigue() <= 0.85 then
                sleepOption.notAvailable = true;
                tooltipText = getText("ContextMenu_PainNoSleep");
            -- In panic
            elseif playerObj:getMoodles():getMoodleLevel(MoodleType.Panic) >= 1 then
                sleepOption.notAvailable = true;
                tooltipText = getText("ContextMenu_PanicNoSleep");
            -- tried to sleep not so long ago
            elseif sleepNeeded and (playerObj:getHoursSurvived() - playerObj:getLastHourSleeped()) <= 1 then
                sleepOption.notAvailable = true;
                tooltipText = getText("ContextMenu_NoSleepTooEarly");
            end
        end
        if bed then
            local bedType = bed:getProperties():Val("BedType") or "averageBed";
            local bedTypeXln = getTextOrNull("Tooltip_BedType_" .. bedType)
            if bedTypeXln then
                if tooltipText then
                    tooltipText = tooltipText .. " <BR> " .. getText("Tooltip_BedType", bedTypeXln)
                else
                    tooltipText = getText("Tooltip_BedType", bedTypeXln)
                end
            end
        end
        if tooltipText then
            local sleepTooltip = ISWorldObjectContextMenu.addToolTip();
            sleepTooltip:setName(getText("ContextMenu_Sleeping"));
            sleepTooltip.description = tooltipText;
            sleepOption.toolTip = sleepTooltip;
        end
    end
end

function TrueActions.walkAdj10(playerObj, square, keepActions)
    if not keepActions then
        ISTimedActionQueue.clear(playerObj);
    end
    local diffX = math.abs(square:getX() + 0.5 - playerObj:getX());
    local diffY = math.abs(square:getY() + 0.5 - playerObj:getY());
    if diffX <= 0.8 and diffY <= 0.8 then
        return true;
    end
    
    square = luautils.getCorrectSquareForWall(playerObj, square);
    local adjacent = AdjacentFreeTileFinder.Find(square, playerObj);
    if adjacent ~= nil then
        ISTimedActionQueue.add(ISWalkToTimedAction:new(playerObj, adjacent));
        return true;
    else
        return  false;
    end
end


TrueActions.onSitOnWorldObject = function(playerObj, item, delta, facing)
    if item:getModData().trueActions and (item:getModData().trueActions.occup or item:getModData().trueActions.occupied)  then
        local player = item:getModData().trueActions.occupied or getPlayerFromUsername(item:getModData().trueActions.occup)
        if player then
            if (player == playerObj) or (player:getX() >= item:getX() + 2 or player:getX() < item:getX() - 2 or
                    player:getY() >= item:getY() + 2 or player:getY() < item:getY() - 2) then
                item:getModData().trueActions.occupied = nil
                item:getModData().trueActions.occup = nil
                item:transmitModData()
            else
                processSayMessage(getText(TrueActions.Phrases["Sit"][ZombRand(#TrueActions.Phrases["Sit"])+1]))
                return
            end
        else
            item:getModData().trueActions = {}
            item:transmitModData()
        end
    end
    if playerObj:getStats():getNumVisibleZombies() == 0 then
        if not TrueActions.walkAdj10(playerObj, item:getSquare(), true) then
            return
        end
        ISTimedActionQueue.add(ISSitOnWO:new(playerObj, item, delta[1], delta[2], facing));
    else
        processSayMessage(getText("IGUI_PlayerText_TRUEA_cant_sit"))
    end
end

TrueActions.onSleepOnWorldObject = function(playerObj)
    if playerObj:getVariableString("SitWOAnim") == "OnBed" then
        playerObj:setVariable("SitWOAnim", "Sleep"); 
        playerObj:getModData().trueActions.on:getModData().trueActions.sitwoanim = "Sleep";
        playerObj:getModData().trueActions.on:transmitModData()
        -- ModData.request("trueActionsData");
        -- ModData.getOrCreate("trueActionsData")[playerObj:getUsername()] = "Sleep";
        -- ModData.transmit("trueActionsData");
        -- playerObj:getModData().trueActions.SitWOAnim = "Sleep";
    elseif playerObj:getVariableString("SitWOAnim") == "OnBedReversoE" then
        playerObj:setVariable("SitWOAnim", "SleepReversoE"); 
        playerObj:getModData().trueActions.on:getModData().trueActions.sitwoanim = "SleepReversoE";
        playerObj:getModData().trueActions.on:transmitModData()
        -- ModData.request("trueActionsData");
        -- ModData.getOrCreate("trueActionsData")[playerObj:getUsername()] = "SleepReversoE";
        -- ModData.transmit("trueActionsData");
        -- playerObj:getModData().trueActions.SitWOAnim = "SleepReversoE";
    elseif playerObj:getVariableString("SitWOAnim") == "OnBedReversoS" then
        playerObj:setVariable("SitWOAnim", "SleepReversoS");
        playerObj:getModData().trueActions.on:getModData().trueActions.sitwoanim = "SleepReversoS";
        playerObj:getModData().trueActions.on:transmitModData()
        -- ModData.request("trueActionsData");
        -- ModData.getOrCreate("trueActionsData")[playerObj:getUsername()] = "SleepReversoS";
        -- ModData.transmit("trueActionsData");        
        -- playerObj:getModData().trueActions.SitWOAnim = "SleepReversoS";
    end
end

TrueActions.onSleepOnWorldObjectQuickly = function(player, bed, dirData)
    local playerObj = getSpecificPlayer(player)
    TrueActions.onSleepOnWorldObject(playerObj)
    TrueActions.onSleepUpdated(bed, player)
end


TrueActions.onSleepUpdated = function(bed, player)
    if ISWorldObjectContextMenu.sleepDialog then
        return;
    end
    ISWorldObjectContextMenu.sleepDialog = ISModalDialog:new(0,0, 250, 150, getText("IGUI_ConfirmSleep"), true, nil, TrueActions.onConfirmSleepUpdated, player, player, bed);
    ISWorldObjectContextMenu.sleepDialog:initialise()
    ISWorldObjectContextMenu.sleepDialog:addToUIManager()
    if JoypadState.players[player+1] then
        setJoypadFocus(player, ISWorldObjectContextMenu.sleepDialog)
    end
end

function TrueActions.onConfirmSleepUpdated(this, button, player, bed)
    ISWorldObjectContextMenu.sleepDialog = nil;
    if button.internal == "YES" then
        local playerObj = getSpecificPlayer(player)
        playerObj:setVariable("ExerciseStarted", false);
        playerObj:setVariable("ExerciseEnded", true);
        ISTimedActionQueue.clear(playerObj)
        ISWorldObjectContextMenu.onSleepWalkToComplete(player, bed)
    end
end

TrueActions.fromSleep = function(playerObj)
    if playerObj:getVariableString("SitWOAnim") == "Sleep" then
        playerObj:setVariable("SitWOAnim", "OnBed"); 
        playerObj:getModData().trueActions.on:getModData().trueActions.sitwoanim = "OnBed";
        playerObj:getModData().trueActions.on:transmitModData()
        -- ModData.request("trueActionsData");
        -- ModData.getOrCreate("trueActionsData")[playerObj:getUsername()] = "OnBed";
        -- ModData.transmit("trueActionsData");
    elseif playerObj:getVariableString("SitWOAnim") == "SleepReversoE" then
        playerObj:setVariable("SitWOAnim", "OnBedReversoE"); 
        playerObj:getModData().trueActions.on:getModData().trueActions.sitwoanim = "OnBedReversoE";
        playerObj:getModData().trueActions.on:transmitModData()
        -- ModData.request("trueActionsData");
        -- ModData.getOrCreate("trueActionsData")[playerObj:getUsername()] = "OnBedReversoE";
        -- ModData.transmit("trueActionsData");
    elseif playerObj:getVariableString("SitWOAnim") == "SleepReversoS" then
        playerObj:setVariable("SitWOAnim", "OnBedReversoS"); 
        playerObj:getModData().trueActions.on:getModData().trueActions.sitwoanim = "OnBedReversoS";
        playerObj:getModData().trueActions.on:transmitModData()
        -- ModData.request("trueActionsData");
        -- ModData.getOrCreate("trueActionsData")[playerObj:getUsername()] = "OnBedReversoS";
        -- ModData.transmit("trueActionsData");
    end
end

TrueActions.isBlocked = function(item, dir, side)
    local sq = item:getSquare()
    local sqDirX = 0
    local sqDirY = 0
    local anotherBedSquareX = 0
    local anotherBedSquareY = 0
    local checkAnotherSquare = false
    if dir == "E" then
        anotherBedSquareX = 1
        anotherBedSquareY = 0
        if side == "L" then
            sqDirX = 0
            sqDirY = 1
        elseif side == "R" then
            sqDirX = 0
            sqDirY = -1
        end
    elseif dir == "S" then
        anotherBedSquareX = 0
        anotherBedSquareY = 1
        if side == "L" then
            sqDirX = -1
            sqDirY = 0
        elseif side == "R" then
            sqDirX = 1
            sqDirY = 0
        end
    end
    local sqDir1 = getSquare(sq:getX()+sqDirX, sq:getY()+sqDirY, sq:getZ())
    local sqDir2 = nil
    local anotherBedSquare = getSquare(sq:getX()+anotherBedSquareX, sq:getY()+anotherBedSquareY, sq:getZ())
    local objects = anotherBedSquare:getObjects();
    for i=0, objects:size()-1 do
        if objects:get(i):getSprite():getProperties():Val("GroupName") == item:getProperties():Val("GroupName") then
            sqDir2 = getSquare(anotherBedSquare:getX()+sqDirX, anotherBedSquare:getY()+sqDirY, anotherBedSquare:getZ())
        end
    end
    if not (sqDir1:getProperties():Is(IsoFlagType.solidtrans) or 
            sqDir1:getProperties():Is(IsoFlagType.solid)) then
        if sq:isWallTo(sqDir1) or sq:isWindowTo(sqDir1) then
            return true
        else
            return false
        end
    elseif sqDir2 and not (sqDir2:getProperties():Is(IsoFlagType.solidtrans) or 
            sqDir2:getProperties():Is(IsoFlagType.solid)) then
        if anotherBedSquare:isWallTo(sqDir2) or anotherBedSquare:isWindowTo(sqDir2) then
            return true
        else
            return false
        end
    else
        return true
    end
end

TrueActions.onLieOnWorldObject = function(playerObj, item, dirData)
    if TrueActions.isBlocked(item, dirData[1].dir, dirData[1].side) then
        if not dirData[2] or TrueActions.isBlocked(item, dirData[2].dir, dirData[2].side) then
            processSayMessage(getText("IGUI_PlayerText_TRUEA_bed_away_wall"))
        else
            TrueActions.onLieOnWorldObjectDo(playerObj, item, dirData[2])
        end
    else
        TrueActions.onLieOnWorldObjectDo(playerObj, item, dirData[1])
    end
end

TrueActions.onLieOnWorldObjectDo = function(playerObj, item, dirData)
    if item:getModData().trueActions and (item:getModData().trueActions.occup or item:getModData().trueActions.occupied) then
        local player = item:getModData().trueActions.occupied or getPlayerFromUsername(item:getModData().trueActions.occup)
        if player then
            if ((player == playerObj) or (player:getX() >= item:getX() + 2 or player:getX() < item:getX() - 2 or
                    player:getY() >= item:getY() + 2 or player:getY() < item:getY() - 2)) then
                item:getModData().trueActions.occupied = nil
                item:getModData().trueActions.occup = nil
                item:transmitModData()
            else
                processSayMessage(getText(TrueActions.Phrases["Lie"][ZombRand(#TrueActions.Phrases["Lie"])+1]))
                return
            end
        else
            item:getModData().trueActions = {}
            item:transmitModData()
        end
    end
    if playerObj:getStats():getNumVisibleZombies() == 0 then
        if not TrueActions.walkAdj10(playerObj, item:getSquare(), true) then
            return
        end
        ISTimedActionQueue.add(ISLieOnWO:new(playerObj, item, dirData));
    else
        processSayMessage(getText("IGUI_PlayerText_TRUEA_cant_lie"))
    end
end


function TrueActions.standUp(playerObj)
-- print("TrueActions.standUp")
    -- if playerObj ~= getPlayer() then
        -- print("TrueActions.standUp")
    -- end
    playerObj:setVariable("forceGetUp", true)
    playerObj:clearVariable("Position")
    -- playerObj:getModData().trueActions.SitWOAnim = nil;
    if playerObj:getModData().trueActions.on then
        playerObj:getModData().trueActions.on:getModData().trueActions.occupied = nil
        playerObj:getModData().trueActions.on:getModData().trueActions.forcegetup = true
        playerObj:getModData().trueActions.on:getModData().trueActions.occup = nil
        playerObj:getModData().trueActions.on:transmitModData()
        -- playerObj:getModData().trueActions.on = nil
    end
end

function TrueActions.checkState()
    local playerObj = getPlayer()
    local players = getOnlinePlayers();
    if players then
        for i=1,players:size() do
            local player = players:get(i-1)
            -- Обработка поведения других игроков
            if player and player ~= playerObj then
                if player:getX() >= playerObj:getX() - 50 and player:getX() < playerObj:getX() + 50 and
                        player:getY() >= playerObj:getY() - 50 and player:getY() < playerObj:getY() + 50 then
                    if not player:getModData().trueActions then
                        player:getModData().trueActions = {}
                    end
                    -- print(player:getModData().trueActions.on)
                    if not player:getModData().trueActions.on then
                        player:clearVariable("SitWOAnim")
                        for x = player:getX()-1,player:getX() + 1 do
                            for y = player:getY()-1,player:getY() + 1 do
                                local sq = getCell():getGridSquare(x,y,player:getZ());
                                if sq then
                                    for i=0,sq:getObjects():size()-1 do
                                        -- print("sq")
                                        local wo = sq:getObjects():get(i)
                                        if instanceof(wo, "IsoObject") and wo:getSprite() and 
                                        (TrueActions.WorldSeatObject[wo:getSprite():getName()] or TrueActions.WorldLieObject[wo:getSprite():getName()]) then
                                            if wo:getModData().trueActions and wo:getModData().trueActions.occup == player:getUsername() then
                                                player:getModData().trueActions.on = wo
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    if player:getModData().trueActions.on and player:getModData().trueActions.on:getSquare() then
                        local wo = player:getModData().trueActions.on
                        if player:getX() >= wo:getX() + 2 or wo:getX() < wo:getX() - 2  or
                                player:getY() >= wo:getY() + 2  or wo:getY() < wo:getY() - 2 then
                            player:setNoClip(false)
                            player:setBlockMovement(false)
                            player:getModData().trueActions.on = nil
                            wo:getModData().trueActions = nil
                            -- print("on clear")
                        else
                            if player:getModData().trueActions.on:getModData().trueActions and player:getModData().trueActions.on:getModData().trueActions.forcegetup then
                                player:setNoClip(false)
                                player:setBlockMovement(false)
                            elseif player:getModData().trueActions.on:getModData().trueActions then
                                player:setNoClip(true)
                                player:setBlockMovement(true)
                                player:setVariable("SitWOAnim", player:getModData().trueActions.on:getModData().trueActions.sitwoanim); 
                                if not string.match(tostring(player:getCurrentState()), "PlayerSitOnGroundState") or
                                    not string.match(tostring(player:getCurrentState()), "PlayerGetUpState") then
                                    player:reportEvent("EventSitOnGround");
                                end
                            end
                        end
                    end
                    
                    
                end
            end
        end
    end
    
    local playersSum = getNumActivePlayers()
    for playerNum = 0, playersSum - 1 do
        playerObj = getSpecificPlayer(playerNum)
        if playerObj then
            local playerObjState = playerObj:getCurrentState()
            -- print(playerObj:getVariableString("SitWOAnim"))
            -- print(playerObjState)
            -- print(playerObj:getVariableBoolean("forceGetUp"))
            if (playerObj:getVariableString("SitWOAnim") == "Idle" or 
                    playerObj:getVariableString("SitWOAnim") == "OnBed" or 
                    playerObj:getVariableString("SitWOAnim") == "OnBedReversoE" or
                    playerObj:getVariableString("SitWOAnim") == "OnBedReversoS" or
                    playerObj:getVariableString("SitWOAnim") == "Sleep" or 
                    playerObj:getVariableString("SitWOAnim") == "SleepReversoE" or 
                    playerObj:getVariableString("SitWOAnim") == "SleepReversoS") then
                if string.match(tostring(playerObjState), "PlayerHitReactionState") then
                    -- TrueActions.standUp(playerObj)
                    playerObj:setBlockMovement(false)
                    playerObj:setNoClip(false)
                    playerObj:clearVariable("SitWOAnim");
                    -- ModData.request("trueActionsData");
                    -- ModData.getOrCreate("trueActionsData")[playerObj:getUsername()] = nil;
                    -- ModData.transmit("trueActionsData");
                elseif string.match(tostring(playerObjState), "PlayerGetUpState") then
                    if playerObj:isNoClip() then
                        playerObj:setNoClip(false)
                    end
                end
                
                if not playerObj:getVariableBoolean("forceGetUp") then
                    if playerObj:getVariableString("Position") == "Save" then
                        playerObj:getModData().trueActions.X = playerObj:getX()
                        playerObj:getModData().trueActions.Y = playerObj:getY()
                        playerObj:setVariable("Position", "Control")
                    end
                    if playerObj:getStats():getNumVisibleZombies() > 0 or playerObj:pressedMovement(true) then
                        TrueActions.standUp(playerObj)
                    end
                end    
            end
                
            if playerObj:getVariableString("SitWOAnim") == "GetUp" then
                if not (playerObjState == PlayerSitOnGroundState.instance()) and
                        not (playerObjState == PlayerGetUpState.instance()) then
                    playerObj:setBlockMovement(false)
                    playerObj:setNoClip(false)
                    playerObj:clearVariable("SitWOAnim");
                    -- ModData.request("trueActionsData");
                    -- ModData.getOrCreate("trueActionsData")[playerObj:getUsername()] = nil;
                    -- ModData.transmit("trueActionsData");
                end
            end
            
            if playerObj:getVariableString("Position") == "Control" then
                local deltaX = math.abs(playerObj:getModData().trueActions.X - playerObj:getX())
                local deltaY = math.abs(playerObj:getModData().trueActions.Y - playerObj:getY())
                -- print("deltaX: ", deltaX)
                -- print("deltaY: ", deltaY)
                if (deltaX > 0.2) or (deltaY > 0.2) then
                    processSayMessage(getText(TrueActions.Phrases["Push"][ZombRand(#TrueActions.Phrases["Push"])+1]))
                    TrueActions.standUp(playerObj)
                end
            end
        end
    end
end

function TrueActions.ClearPlayer(playerNum, playerObj)
-- print("TrueActions.ClearPlayer")
    if playerObj then
        playerObj:setNoClip(false)
        playerObj:setBlockMovement(false)
        playerObj:clearVariable("SitWOAnim");
        -- ModData.request("trueActionsData");
        -- ModData.getOrCreate("trueActionsData")[playerObj:getUsername()] = nil;
        -- ModData.transmit("trueActionsData");
        if playerObj:getModData().trueActions then
            if playerObj:getModData().trueActions.on then
                if playerObj:getModData().trueActions.on:getModData().trueActions then
                    playerObj:getModData().trueActions.on:getModData().trueActions.occupied = nil
                    playerObj:getModData().trueActions.on:getModData().trueActions.occup = nil
                    playerObj:getModData().trueActions.on:transmitModData()
                end
            end
        end
        playerObj:getModData().trueActions = {}
    end
    local players = getOnlinePlayers();
    if players then
        for i=1,players:size() do
            local player = players:get(i-1)
            player:setNoClip(false)
            player:setBlockMovement(false)
            player:clearVariable("SitWOAnim");
            if player:getModData().trueActions then
                if player:getModData().trueActions.on then
                    if player:getModData().trueActions.on:getModData().trueActions then
                        player:getModData().trueActions.on:getModData().trueActions.occupied = nil
                        player:getModData().trueActions.on:getModData().trueActions.occup = nil
                    end
                end
            end
            player:getModData().trueActions = {}
        end
    end
end


Events.OnCreatePlayer.Add(TrueActions.ClearPlayer)
Events.OnPlayerDeath.Add(TrueActions.ClearPlayer)
Events.OnTick.Add(TrueActions.checkState);
Events.OnFillWorldObjectContextMenu.Add(ISWorldObjectContextMenu.sitOnObject)
