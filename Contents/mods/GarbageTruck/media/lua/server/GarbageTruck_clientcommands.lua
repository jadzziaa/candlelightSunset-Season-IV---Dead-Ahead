local Commands = {};
Commands.GarbageTruck = {};

Commands.GarbageTruck.EmptyTrunk = function(player, args)	
    print("it fired")
    print(module)
    local vehicle = args.GTvehicle
    local TrashBox = vehicle:getPartById("TruckBed"):getItemContainer()
    TrashBox:clear()
end

Commands.GarbageTruck.ClearTrashBox = function(origin, args)
	args.vehicle:getPartById("TruckBed"):getItemContainer():clear()
end

local onClientCommand = function(module, command, player, args)
    if Commands[module] and Commands[module][command] then
    Commands[module][command](player, args);
    end
   end

Events.OnClientCommand.Add(onClientCommand);