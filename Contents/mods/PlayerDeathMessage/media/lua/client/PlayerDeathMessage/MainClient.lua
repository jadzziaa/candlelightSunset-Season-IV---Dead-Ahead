
local ChatSystem = require("PlayerDeathMessage/ChatSystem");

local function getFavouriteWeapon(playerObj)
	local favouriteWeapon = nil;
	local swing = 0;
	for iPData,vPData in pairs(playerObj:getModData()) do
		for index in string.gmatch(iPData, "^Fav:(.+)") do
			if vPData > swing then
				favouriteWeapon = index;
				swing = vPData;
			end
		end
	end
    return favouriteWeapon
end

local function OnPlayerDeath(playerObj)
   
    if SandboxVars.PlayerDeathMessage.disabled then return end

    local gender = "Male";
    if playerObj:isFemale() then
        gender = "Female";
    end
    local username = playerObj:getUsername();
    local name = playerObj:getDescriptor():getForename() .. " " .. playerObj:getDescriptor():getSurname();

    sendClientCommand("PlayerDeathMessage", "PlayerDied", {
        gender = gender,
        username = username,
        name = name,
        zombieKill = tostring(playerObj:getZombieKills()),
        survivorKill = tostring(playerObj:getSurvivorKills()),
        time = playerObj:getTimeSurvived(),
        weapon = getFavouriteWeapon(playerObj),
    });
    
end
Events.OnPlayerDeath.Add(OnPlayerDeath);

local function OnServerCommand(module, command, args)

    if module ~= "PlayerDeathMessage" then return end

    if command == "PlayerDied" then

        local message = "";
        if SandboxVars.PlayerDeathMessage.useUsername and SandboxVars.PlayerDeathMessage.useCharacterName then
            message = getText("IGUI_PlayerDeathMessage_PlayerDied_Both", args.name, args.username);
        elseif SandboxVars.PlayerDeathMessage.useUsername then
            message = getText("IGUI_PlayerDeathMessage_PlayerDied", args.username);
        elseif SandboxVars.PlayerDeathMessage.useCharacterName then
            message = getText("IGUI_PlayerDeathMessage_PlayerDied", args.name);
        else
            message = getText("IGUI_PlayerDeathMessage_PlayerDied_Unknown");
        end

        if SandboxVars.PlayerDeathMessage.showPlayerStats then
            if getServerOptions():getBoolean("PVP") then
                message = message .. " " .. getText("IGUI_PlayerDeathMessage_PlayerDiedStatsPvp" .. args.gender, args.time, args.zombieKill, args.survivorKill)
            else
                message = message .. " " .. getText("IGUI_PlayerDeathMessage_PlayerDiedStats" .. args.gender, args.time, args.zombieKill)
            end
        end

        if SandboxVars.PlayerDeathMessage.showPlayerFavWeapon and args.weapon then
            message = message .. " " .. getText("IGUI_PlayerDeathMessage_PlayerFavWeapon" .. args.gender, args.weapon);
        end

        local color = SandboxVars.PlayerDeathMessage.messageColorRed .. "," .. SandboxVars.PlayerDeathMessage.messageColorGreen .. "," .. SandboxVars.PlayerDeathMessage.messageColorBlue
        ChatSystem.addLineToChat(message, "<RGB:" .. color .. ">");
    end

end
Events.OnServerCommand.Add(OnServerCommand);
