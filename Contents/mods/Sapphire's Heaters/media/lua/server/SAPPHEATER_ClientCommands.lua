require "HeaterSettings"

function noise (msg)
	--print('ClientCommand: '..msg)
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

SAPPHEATER_Client_Commands = {}
Client_Commands = {}

Client_Commands.heater = {}
Client_Commands.heater.placed = function(player, args)

	ModData.getOrCreate('SAPPHEATER')[args.id] = args;
	ModData.transmit('SAPPHEATER')

end

Client_Commands.heater.pickup = function(player, args)

	ModData.getOrCreate('SAPPHEATER')[args.id] = nil
	ModData.transmit('SAPPHEATER')

	SendServerCommandToClients("heater", "turnOff", args)
end

Client_Commands.heater.turnOn = function(player, args)

	ModData.getOrCreate('SAPPHEATER')[args.id].state = "On"
	ModData.transmit("SAPPHEATER")

	SendServerCommandToClients("heater", "turnOn", args)
end

Client_Commands.heater.turnOff = function(player, args)

	ModData.getOrCreate('SAPPHEATER')[args.id].state = "Off"
	ModData.transmit("SAPPHEATER")

	SendServerCommandToClients("heater", "turnOff", args)
end

Client_Commands.heater.updateBattery = function(player, args)

	ModData.getOrCreate('SAPPHEATER')[args.id].battery = args.battery
	ModData.transmit('SAPPHEATER')

end

-- copy below function and check each minute if the area is electricity for the gene heater, if no turn it off

function ConsumeBatteries()

	local toTurnOff = {}
	local count = 0

	local heaters = ModData.get("SAPPHEATER")
	if heaters == nil then return end

	for k,v in pairs(heaters) do

		if v.state == "On" then
			v.battery = v.battery - (v.rate) -- Consume Battery By Rate * 4 ( 4 x To Equal Consumption in 1 Minute)
			if v.battery < 0.0 then
				v.battery = 0.0
				table.insert(toTurnOff, v)
			end
			count = count + 1
		end
	end

	if count > 0 then

		-- Turn Off Client Heaters
		for _,v in ipairs(toTurnOff) do
			heaters[v.id].state = "Off"
			SendServerCommandToClients("heater", "turnOff", heaters[v.id])
		end

		ModData.transmit("SAPPHEATER")
	end
end

function NoPowerNoHeater()

	local toTurnOff = {}
	local count = 0;

	local heaters = ModData.get("SAPPHEATER")
	if heaters == nil then return end

	for k,v in pairs(heaters) do

		if v.state == "On" then

			local square = getSquare(v.x, v.y, v.z)
			if square == nil then return end

			if square:haveElectricity() == false and v.itemType == ElectricHeaterObject.itemType then
				table.insert(toTurnOff, v)
			end

			count = count + 1
		end
	end

	if count > 0 then

		-- Turn Off Client Heaters
		for _,v in ipairs(toTurnOff) do
			heaters[v.id].state = "Off"
			SendServerCommandToClients("heater", "turnOff", heaters[v.id])
		end

		ModData.transmit("SAPPHEATER")
	end	

end


Events.EveryOneMinute.Add(ConsumeBatteries)
Events.EveryOneMinute.Add(NoPowerNoHeater)


SAPPHEATER_Client_Commands.OnClientCommand = function(module, command, player, args)
	if Client_Commands[module] and Client_Commands[module][command] then
		local argStr = ''
		if args then
			for k,v in pairs(args) do argStr = argStr..' '..k..'='..tostring(v) end
		end
		noise('received '..module..' '..command..' '..tostring(player)..argStr)
		Client_Commands[module][command](player, args)
	end
end

Events.OnClientCommand.Add(SAPPHEATER_Client_Commands.OnClientCommand)