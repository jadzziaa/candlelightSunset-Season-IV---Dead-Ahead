local OPTIONS = {
	spawn5hourenergy = true,
	spawnburn = true,
	spawnmonster = true,
	spawnnos = true,
	spawnredbull = true,
	spawnrockstar = true,
	spawnkarhu = true,
	spawnlongdrink = true,
}

if ModOptions and ModOptions.getInstance then
  	local settings = ModOptions:getInstance(OPTIONS, "vacsdrinks", "Vac's Drinks")

  	settings.names = {
  		spawn5hourenergy = "Spawn 5-hour Energy Drink",
		spawnburn = "Spawn Burn",
		spawnmonster = "Spawn Monster",
		spawnnos = "Spawn Nos",
		spawnredbull = "Spawn Redbull",
		spawnrockstar = "Spawn Rockstar",
		spawnkarhu = "Spawn Karhu",
		spawnlongdrink = "Spawn Long Drink",
  	}
end

VACS_DRINKS_ADDON = {} -- global variable (pick another name!)
VACS_DRINKS_ADDON.OPTIONS = OPTIONS