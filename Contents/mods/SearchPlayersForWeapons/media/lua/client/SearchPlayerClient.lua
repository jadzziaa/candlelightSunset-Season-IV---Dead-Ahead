-- Module is SearchPlayer
-- commands are requestServerItems
--              requestClientItems
--              respondServerItems
--              respondClientItems

local function predicateWeapon(item)
	return item:IsWeapon()
	-- return item:IsWeapon() and item:getActualWeight() >= 1
end

local function OnServerCommand(module, command, args)
    if module == "SearchPlayer" then
        if command == "requestClientItems" then
            local player = getPlayer();
            local otherPlayer = getPlayerByOnlineID(args[1])
            local playerInv = player:getInventory();
            local weapons = playerInv:getAllEval(predicateWeapon);
            player:Say("Being searched by " .. otherPlayer:getDisplayName())
            print("Found " .. weapons:size() .. " weapons");
            if weapons and weapons:size() > 0 then
                for i=1,weapons:size() do
                    local item = weapons:get(i-1)
                    print(item:getName())
                    tradingUISendAddItem(player, otherPlayer, item);
                end
            end
        end
    end
end

Events.OnServerCommand.Add(OnServerCommand)