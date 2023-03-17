
local MOD_NAME_TEMPERATURE = "MonthlyClimate_Temperature"
local MOD_NAME_RAIN = "MonthlyClimate_Rain"

local MONTH_NAMES = {
	"January",
	"February",
	"March",
	"April",
	"May",
	"June",
	"July",
	"August",
	"September",
	"October",
	"November",
	"December"
}

local SETTING_NAMES = {
	"Cryogenic",
	"Arctic",
	"VeryCold",
	"Cold",
	"Normal",
	"Hot",
	"VeryHot",
	"Sweltering",
	"Scorching"
}

local SETTINGS = {
	Cryogenic = {
		min = -155,
		max = -45,
	},
	Arctic = {
		min = -100,
		max = -45,
	},
	VeryCold = {
		min = -10,
		max = 15,
	},
	Cold = {
		min = -5,
		max = 20,
	},
	Normal = {
		min = 0,
		max = 25,
	},
	Hot = {
		min = 7,
		max = 29,
	},
	VeryHot = {
		min = 15,
		max = 33,
	},
	Sweltering = {
		min = 25,
		max = 45,
	},
	Scorching = {
		min = 50,
		max = 75,
	}
}

--[[
Set the vanilla sandbox values, so anywhere the base game uses these they will be correct.
As there are now more temperature settings, we set the value to the closest vanilla setting, e.g. Cryogenic sets vanilla to Very Cold etc.
]]--
local function setSandboxValues(month_name)
	
	local sandbox = getSandboxOptions()

	local rain = SandboxVars[MOD_NAME_RAIN][month_name] or 3 --5 options, 3 is default
	sandbox:set("Rain", rain)
	SandboxVars.Rain = rain

	local new_temp = SandboxVars[MOD_NAME_TEMPERATURE][month_name] or 5 --9 options, 5 is default
	local temp = 3
	if new_temp <= 3 then
		temmp = 1
	elseif new_temp == 4 then
		temp = 2
	elseif new_temp == 5 then
		temp = 3
	elseif new_temp == 6 then
		temp = 4
	else
		temp = 5
	end
	sandbox:set("Temperature", temp)
	SandboxVars.Temperature = temp
end

local function OnInitSeasons(season)

	local month_name = MONTH_NAMES[getGameTime():getMonth()+1]
	setSandboxValues(month_name)
	
	local setting = SETTING_NAMES[ SandboxVars[MOD_NAME_TEMPERATURE][month_name] ]

	local min = SETTINGS[setting].min
	local max = SETTINGS[setting].max

	print("Monthly Climate: ", month_name, min, max)

	season:init(
        season:getLat(),
		max,
		min,
		season:getTempDiff(),
		season:getSeasonLag(),
		season:getHighNoon(),
		season:getSeedA(),
		season:getSeedB(),
		season:getSeedC()		
	)
	
end

local function updateWeather()
	--Other parts of the game, or mods, might be hooked into this event
	--So trigger this, rather than just calling OnInitSeasons( getClimateManager():getSeason() )
	LuaEventManager.triggerEvent("OnInitSeasons", getClimateManager():getSeason())	
end

local function midnight()
	local day = getGameTime():getDay()
	if day == 0 then --1st day of the month
		updateWeather()
	end
end

Events.OnLoad.Add(updateWeather)
Events.EveryDays.Add(midnight)
Events.OnInitSeasons.Add(OnInitSeasons)
--Events.EveryHours.Add(updateWeather)  --Removed, updating the weather every hour does not work; the temperature only changes at midnight
