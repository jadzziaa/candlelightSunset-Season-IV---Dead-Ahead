require "HeaterSettings"

local SAPPHEATER_Server_Commands = {}
local Server_Commands = {}

ClientHeaters = {}

local noise = function(msg)
    --print('ServerCommand: '..msg)
end

Server_Commands.heater = {}
Server_Commands.heater.turnOn = function(args)

    local heaters = ModData.getOrCreate("SAPPHEATER")
    if heaters[args.id] then
        heaters[args.id].state = "On"
        if ClientHeaters[args.id] == nil then

            if heaters[args.id].itemType == SmallHeaterObject.itemType then
                ClientHeaters[args.id] = ISHeaterHeatObject:new(args.x, args.y, args.z, SmallHeaterObject.heatRadius, SmallHeaterObject.heatTemperature)
                print("We should activate a heater")
            elseif heaters[args.id].itemType == OutdoorHeaterObject.itemType then
                ClientHeaters[args.id] = ISHeaterHeatObject:new(args.x, args.y, args.z, OutdoorHeaterObject.heatRadius, OutdoorHeaterObject.heatTemperature)
                print("We should activate a heater")
            elseif heaters[args.id].itemType == ElectricHeaterObject.itemType then
                ClientHeaters[args.id] = ISHeaterHeatObject:new(args.x, args.y, args.z, ElectricHeaterObject.heatRadius, ElectricHeaterObject.heatTemperature)
                print("We should activate a heater")
            end
        end
    end

end

Server_Commands.heater.turnOff = function(args)

    local heaters = ModData.getOrCreate("SAPPHEATER")
    if heaters[args.id] then
        heaters[args.id].state = "Off"
        -- perhaps remove heatsource here?
    end

    if ClientHeaters[args.id] then
        ClientHeaters[args.id]:destroy()
    end
    ClientHeaters[args.id] = nil

end


SAPPHEATER_Server_Commands.OnServerCommand = function(module, command, args)
    if Server_Commands[module] and Server_Commands[module][command] then
        local argStr = ''
        if args then
            for k,v in pairs(args) do argStr = argStr..' '..k..'='..tostring(v) end
        end
        noise('received '..module..' '..command..' '..argStr)
        Server_Commands[module][command](args)
    end
end

Events.OnServerCommand.Add(SAPPHEATER_Server_Commands.OnServerCommand)


function OnReceiveGlobalModData(key, modData)

    if key == "SAPPHEATER" then
        ModData.add(key, modData)
    end

end

Events.OnReceiveGlobalModData.Add(OnReceiveGlobalModData)