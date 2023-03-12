local function kayse_updateTimeReport()
	local gTime = getGameTime();
	local year = gTime:getYear()
	local month = gTime:getMonth()+1
	local day = gTime:getDay()+1
	local hour = gTime:getHour()
	local minute = gTime:getMinutes()
	local text = string.format("Current Time: %i/%i/%i %i:%02i", month, day, year+1, hour, minute)

	local rain = RainManager:getRainIntensity();
	local rv = 0;
	if rain > rv then
		text = text.." It is currently raining."
	end
	local clim = getClimateManager();
    local fog = clim:getFogIntensity()
	local fv = 0
	if fog > fv then
		text = text.." It is currently foggy."
	end

	print(text)
	local filename = "timeReport.txt"
	local createIfNull = true;
	local append = false
	local fw = getFileWriter(filename, createIfNull, append)
	fw:write(text)
	fw:close()
end

local function kayse_updatePlayersReport()
	local numPlayers = getNumActivePlayers()
	local text = "Number of active players: "..numPlayers
	print(text)
	local filename = "playersReport.txt"
	local createIfNull = true;
	local append = false
	local fw = getFileWriter(filename, createIfNull, append)
	fw:write(text)
	fw:close()
end

local function kayse_timeReporter()
	print("Inside of timeReporter")
	kayse_updateTimeReport()
	kayse_updatePlayersReport()
	print("End of timeReporter")
end

local function kayse_deathReporter(player)
	local username = player:getUsername();
	local timestamp = getGametimeTimestamp();
	local survived = player:getTimeSurvived();
	local text = "\n"..timestamp..": "..username.. " has died after surviving "..survived.."."
	print(text)
	local filename = "deathReport.txt"
	local createIfNull = true;
	local append = true
	local fw = getFileWriter(filename, createIfNull, append)
	fw:write(text)
	fw:close()
end

--Events.OnPlayerAttackFinished.Add(kayse_timeReporter)--My lazy way to trigger this quickly.

Events.EveryTenMinutes.Add(kayse_timeReporter)
Events.OnPlayerDeath.Add(kayse_deathReporter)
