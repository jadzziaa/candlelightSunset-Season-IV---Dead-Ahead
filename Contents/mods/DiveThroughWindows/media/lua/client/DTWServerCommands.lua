local DiveThruWindows_Server_Commands = {}
local Server_Commands = {}

local noise = function(msg)
    print('ServerCommand: '..msg)
end

local function playBlockAnim(player)
	local playerWeapon = player:getPrimaryHandItem()
	if (not playerWeapon) or not instanceof(playerWeapon, "HandWeapon") then return true end
	if player:getSecondaryHandItem() == playerWeapon or playerWeapon:getSwingAnim() == "Handgun" then
		return false
	else
		return true
	end
	
end

local delayFunction = function(func, delay)

    delay = delay or 1;
    local ticks = 0;
    local canceled = false;

    local function onTick()

        if not canceled and ticks < delay then
            ticks = ticks + 1;
            return;
        end

        Events.OnTick.Remove(onTick);
        if not canceled then func(); end
    end

    Events.OnTick.Add(onTick);
    return function()
        canceled = true;
    end
end

Server_Commands.DiveThruWindows = {}
Server_Commands.DiveThruWindows.hopWindowOther = function(args)
	noise('Hop request received.')
	
	local player = getPlayerFromUsername(args.player)
	local localPlayer = getPlayer()
		
	if not player then
		noise('error getting player')
		return
	end
	
	if player ~= localPlayer then
		
		local dir = IsoDirections.fromIndex(args.playerDir)
		player:setPosition(args.x, args.y, args.z)
		player:setDirectionAngle(args.ang)
		
		local character = player
		
		if args.didSmash then
			if playBlockAnim(player) then
				player:setVariable("DiveThruWindow", true);
			end
			if args.smashFail then
				player:setSprinting(false)
				delayFunction(function() 
					if player:getVariableString("ClimbFenceOutcome") == 'falling' then
						
					else
						player:setVariable("ClimbFenceOutcome", "fall")
					end
				end, 1)
			end
		end
		
		player:setNoClip(true)
		player:setSprinting(true)
		player:climbOverFence(dir)
		
		local noClipTime = 18
		
		if args.didSmash then
			--player:setVariable("DiveThruWindow", false);
			noClipTime = 16
			delayFunction(function() 
				player:setVariable("DiveThruWindow", false)
			end, 100)
		end
		
		delayFunction(function()
			player:setNoClip(false)
		end, noClipTime)
		
		noise('did anim. dir: ' .. tostring(dir))
	end
end


DiveThruWindows_Server_Commands.OnServerCommand = function(module, command, args)
    if Server_Commands[module] and Server_Commands[module][command] then
        local argStr = ''
        if args then
            for k,v in pairs(args) do argStr = argStr..' '..k..'='..tostring(v) end
        end
        noise('received '..module..' '..command..' '..argStr)
        Server_Commands[module][command](args)
    end
end

Events.OnServerCommand.Add(DiveThruWindows_Server_Commands.OnServerCommand)