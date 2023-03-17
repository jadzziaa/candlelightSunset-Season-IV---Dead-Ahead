-- this method was copied from the excellent Skateboard mod by Dislaik https://steamcommunity.com/sharedfiles/filedetails/?id=2728300240
-- I considered making new code from scratch, albeit I would still be "copying their homework", but decided against, for the sake of ease of comprehension + conistency
if not isClient() then return end
local Commands = {};
Commands.GarbageTruck = {};


Commands.GarbageTruck.PlayerEnter = function(args)
	local players = getOnlinePlayers()
	local vehicle = getVehicleById(args.vehicleId)
	for i = 0, players:size() - 1 do
		local player = players:get(i)
		if player:getOnlineID() == args.playerId then
			GarbageTruck_Enter_Server(player)
			break
		end
	end
end

Commands.GarbageTruck.PlayerExit = function(args)
	local players = getOnlinePlayers()
	for i = 0, players:size() - 1 do
		local player = players:get(i)
		if player:getOnlineID() == args.playerId then
			player:SetVariable("VehicleScriptName", "")
			break
		end
	end
end


local onServerCommand = function(module, command, args)
	if Commands[module] and Commands[module][command] then
		Commands[module][command](args)
	end
end

Events.OnServerCommand.Add(onServerCommand)
