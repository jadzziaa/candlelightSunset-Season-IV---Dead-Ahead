JCD_FIPS = JCD_FIPS

JCD_FIPS_players_already_extinguished = {}
JCD_FIPS_players_already_extinguished_minute_later = {}

local function JCD_FIPS_checkFireExtinguish(player)
	local playerIsOnFire = player:isOnFire();
	local getPlayerNum = player:getPlayerNum();
	
	if playerIsOnFire then
		-- uncomment this and comment below for min 2 minutes: if JCD_FIPS_players_already_extinguished[getPlayerNum] ~= 2 or JCD_FIPS_players_already_extinguished_minute_later[getPlayerNum] == 2 then
		if JCD_FIPS_players_already_extinguished[getPlayerNum] ~= 2 then
			local bodyDamage = player:getBodyDamage();
			local bodyParts = bodyDamage:getBodyParts();
			
			-- check if any bodypart is burnt
			local isAnyBodyPartBurnt = false;
			if bodyParts ~= nil then
				for i=0,bodyParts:size() -1 do
					local bodyPart = bodyParts:get(i);
					if bodyPart:isBurnt() then
						isAnyBodyPartBurnt = true;
					end
				end
			end
			
			-- if the player has been burned:
			if isAnyBodyPartBurnt then
				-- stop this player from burning
				player:StopBurning();
				
				-- remove the burned ailment from one of the player's body parts
				if bodyParts ~= nil then
					for i=0,bodyParts:size() -1 do
						local bodyPart = bodyParts:get(i);
						if bodyPart:isBurnt() then
							bodyPart:setNeedBurnWash(false);
							bodyPart:setBurnTime(0);
                            break
						end
					end
				end
				
				-- mark this player as having been extinguished recently.
				if JCD_FIPS_players_already_extinguished[getPlayerNum] == nil then
					player:Say("Yikes!");
					JCD_FIPS_players_already_extinguished[getPlayerNum] = 1;
					JCD_FIPS_players_already_extinguished_minute_later[getPlayerNum] = 1;
				elseif JCD_FIPS_players_already_extinguished[getPlayerNum] == 1 then
					if JCD_FIPS_players_already_extinguished_minute_later[getPlayerNum] ~= 1 then
						player:Say("Ahhh!!");
						JCD_FIPS_players_already_extinguished[getPlayerNum] = 2;
						JCD_FIPS_players_already_extinguished_minute_later[getPlayerNum] = 2;
					end
				end
			end
		end
	end
end

local function JCD_FIPS_resetFireExtinguish()
	JCD_FIPS_players_already_extinguished = {};
end

local function JCD_FIPS_resetFireExtinguishMinute()
	JCD_FIPS_players_already_extinguished_minute_later = {};
end

Events.OnPlayerMove.Add(JCD_FIPS_checkFireExtinguish)
Events.EveryOneMinute.Add(JCD_FIPS_resetFireExtinguishMinute)
Events.EveryTenMinutes.Add(JCD_FIPS_resetFireExtinguish)