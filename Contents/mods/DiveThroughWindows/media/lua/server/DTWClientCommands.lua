

function noise (msg)
	print('ClientCommand: '..msg)
end

function SendServerCommandToClients(module, command, args)
	if not isClient() and not isServer() then
		triggerEvent("OnServerCommand", module, command, args); -- Singleplayer
	else
		sendServerCommand(module, command, args) -- Multiplayer
	end
end

function SendServerCommandToSpecificClient(module, command, player, args)
	if not isClient() and not isServer() then
		triggerEvent("OnServerCommand", module, command, args); -- Singleplayer
	else
		sendServerCommand(player, module, command, args) -- Multiplayer
	end
end

local DiveThruWindows_Client_Commands = {}
local Client_Commands = {}

Client_Commands.DiveThruWindows = {}
Client_Commands.DiveThruWindows.hopWindow = function(player, args)
	SendServerCommandToClients("DiveThruWindows", "hopWindowOther", args)
end

DiveThruWindows_Client_Commands.OnClientCommand = function(module, command, player, args)
	if Client_Commands[module] and Client_Commands[module][command] then
		local argStr = ''
		if args then
			for k,v in pairs(args) do argStr = argStr..' '..k..'='..tostring(v) end
		end
		noise('received '..module..' '..command..' '..tostring(player)..argStr)
		Client_Commands[module][command](player, args)
	end
end

Events.OnClientCommand.Add(DiveThruWindows_Client_Commands.OnClientCommand)
