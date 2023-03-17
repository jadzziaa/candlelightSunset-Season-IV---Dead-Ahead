-------------------------------- Code by Tread ----- (Trealak on Steam) -------------------------------

--if isClient() then return end

local RSServerCommands = {}
local Commands = {}

function Commands.RS_Server_EditKillCount(player, args)	
	local playerObj = getPlayerFromUsername(args.player)
	print('RSCHar - Server - Kill Command Received | ' .. args.player)
--	local playerObj = args.player
--	sendServerCommand(playerObj, 'RS_Client', 'RS_Client_EditKillCount', args)
	sendServerCommand('RS_Client', 'RS_Client_EditKillCount', args)

end

function Commands.RS_Server_EditHoursSurvived(player, args)	
	local playerObj = getPlayerFromUsername(args.player)
	print('RSCHar - Server - Time Command Received | ' .. args.player)
--	local playerObj = args.player
--	sendServerCommand(playerObj, 'RS_Client', 'RS_Client_EditHoursSurvived', args)
	sendServerCommand('RS_Client', 'RS_Client_EditHoursSurvived', args)

end

RSServerCommands.OnClientCommand = function(module, command, playerObj, args)
	if module == 'RS_Server' and Commands[command] then
		local argStr = ''
		args = args or {}
		for k,v in pairs(args) do
			argStr = argStr..' '..k..'='..tostring(v)
		end
--		noise('received '..module..' '..command..' '..tostring(playerObj)..argStr)
		Commands[command](playerObj, args)
	end
end

Events.OnClientCommand.Add(RSServerCommands.OnClientCommand)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------