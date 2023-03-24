
local function OnClientCommand(module, command, player, args)

    if module ~= "PlayerDeathMessage" then return end

    if command == "PlayerDied" then
        sendServerCommand("PlayerDeathMessage", "PlayerDied", args);
    end

end
Events.OnClientCommand.Add(OnClientCommand);
