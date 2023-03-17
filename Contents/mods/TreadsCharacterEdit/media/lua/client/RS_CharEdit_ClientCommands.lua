-------------------------------- Code by Tread ----- (Trealak on Steam) -------------------------------

local RSClientCommands = {}
local Commands = {}

function Commands.RS_Client_EditKillCount(args)
	print('RSCHar - Client - Kill Command Received')
--	local playerObj = getSpecificPlayer(args.player) 
	local playerObj = getPlayer();
	if args.player == playerObj:getUsername() then
		local value = args.amount
		playerObj:setZombieKills(value); --- set Zombie Kills of that player
	end
end

function Commands.RS_Client_EditHoursSurvived(args)
	print('RSCHar - Client - Time Command Received')
--	local playerObj = getSpecificPlayer(args.player) 
	local playerObj = getPlayer();
	if args.player == playerObj:getUsername() then
		local value = args.amount
		playerObj:setHoursSurvived(value); --- set Hours Survived of that player
	end
end



RSClientCommands.onServerCommand = function(module, command, args)
--local function onServerCommand(module, command, args)
    if module == "RS_Client" and Commands[command] then
		print('RSCHar - Client - Some Command Received')
		Commands[command](args)
    end
end
--Events.OnServerCommand.Add(onServerCommand);
Events.OnServerCommand.Add(RSClientCommands.onServerCommand);

--[[
function onServerCommand_RS(module, command, args)
    if module == "RS_Client" then
		print('RSCHar - Client - Some Command Received')
        if command == "RS_Client_EditKillCount" then
            Commands.RS_Client_EditKillCount(args)
		elseif command == "RS_Client_EditHoursSurvived" then
			Commands.RS_Client_EditHoursSurvived(args)
        end
    end
end
Events.OnServerCommand.Add(onServerCommand_RS);
]]--