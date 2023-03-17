local OPTIONS = {
	removevanilladrinks = true,
	recyclecanoption = true,
	spawnbudlight = true,
	spawnbudweiser = true,
	spawncoorslight = true,
	spawncoronaextra = true,
	spawnheineken = true,
	spawnmillerlite = true,
	spawnmodelo = true,
	spawnblueribbon = true,
	spawnbluemoon = true,
	spawncocacola = true,
	spawnpepsi = true,
	spawndietcoke = true,
	spawndrpepper = true,
	spawnmountaindew = true,
	spawnsprite = true,
	spawndietpepsi = true,
	spawnfanta = true,
	spawnmugrootbeer = true,
}

if ModOptions and ModOptions.getInstance then
  local settings = ModOptions:getInstance(OPTIONS, "vacsdrinks", "Vac's Drinks")

  settings.names = {
  	removevanilladrinks = "Remove Base Game Pops/Beers",
  	spawnbudlight = "Spawn Budlight",
  	spawnbudweiser = "Spawn Budweiser",
  	spawncoorslight = "Spawn Coors Light",
  	spawncoronaextra = "Spawn Corona Extra",
  	spawnheineken = "Spawn Heineken",
  	spawnmillerlite = "Spawn Miller Lite",
  	spawnmodelo = "Spawn Modelo",
  	spawnblueribbon = "Spawn Blue Ribbon",
  	spawnbluemoon = "Spawn Blue Moon",
  	spawncocacola = "Spawn Coca-Cola",
  	spawnpepsi = "Spawn Pepsi",
  	spawndietcoke = "Spawn Diet Coke",
  	spawndietpepsi = "Spawn Diet Pepsi",
  	spawndrpepper = "Spawn Dr. Pepper",
  	spawnmountaindew = "Spawn Mountain Dew",
  	spawnsprite = "Spawn Sprite",
  	spawnfanta = "Spawn Fanta",
  	spawnmugrootbeer = "Spawn Mug Root Beer",
  }
end

VACS_DRINKS = {} -- global variable (pick another name!)
VACS_DRINKS.OPTIONS = OPTIONS