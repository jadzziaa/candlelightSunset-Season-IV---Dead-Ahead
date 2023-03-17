-- this method was copied from the excellent Skateboard mod by Dislaik https://steamcommunity.com/sharedfiles/filedetails/?id=2728300240
-- I considered making new code from scratch, albeit I would still be "copying their homework", but decided against, for the sake of ease of comprehension + conistency
if not isServer() then return end 
local Commands = {}
Commands.GarbageTruck = {}

Commands.GarbageTruck.PlayerEnter = function(origin, args)
	local players = getOnlinePlayers()
	local originId = origin:getOnlineID()
	local vehicle = getVehicleById(args.vehicleId)
	for i = 0, players:size() - 1 do
		local player = players:get(i)
		if player ~= origin then
			sendServerCommand(player, "GarbageTruck", "PlayerEnter", {
				playerId = originId,
				vehicleId = args.vehicleId
			})
		end
	end
end

Commands.GarbageTruck.PlayerExit = function(origin, args)
	local players = getOnlinePlayers()
	local originId = origin:getOnlineID()
	for i = 0, players:size() - 1 do
		local player = players:get(i)
		if player ~= origin then
			sendServerCommand(player, "GarbageTruck", "PlayerExit", {
				playerId = originId
			})
		end
	end
end

local onClientCommand = function(module, command, player, args)
	if Commands[module] and Commands[module][command] then
		Commands[module][command](player, args)
	end
end

Events.OnClientCommand.Add(onClientCommand)
