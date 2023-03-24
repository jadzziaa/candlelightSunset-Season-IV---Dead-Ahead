local consoleItems = {
	"Video_Game_Consoles.SNES",
	"Video_Game_Consoles.GameBoy",
	"Video_Game_Consoles.GameBoy_nobat",
	"Video_Game_Consoles.Genesis",
	"Video_Game_Consoles.Atari",
	"Video_Game_Consoles.NES",
	"Video_Game_Consoles.Game_Gear",
	"Video_Game_Consoles.Game_Gear_nobat",
	"Video_Game_Consoles.SNES_Cartridge_Mario",
	"Video_Game_Consoles.SNES_Cartridge_Mana",
	"Video_Game_Consoles.SNES_Cartridge_Fox",
	"Video_Game_Consoles.SNES_Cartridge_MK2",
	"Video_Game_Consoles.SNES_Cartridge_NBA",
	"Video_Game_Consoles.GB_Cartridge_Zelda",
	"Video_Game_Consoles.GB_Cartridge_Kirby",
	"Video_Game_Consoles.GB_Cartridge_Fantasy",
	"Video_Game_Consoles.GB_Cartridge_Mario",
	"Video_Game_Consoles.GB_Cartridge_Tetris",
	"Video_Game_Consoles.Genesis_Cartridge_aladdin",
	"Video_Game_Consoles.Genesis_Cartridge_gaxe",
	"Video_Game_Consoles.Genesis_Cartridge_ghouls",
	"Video_Game_Consoles.Genesis_Cartridge_sonic",
	"Video_Game_Consoles.Genesis_Cartridge_street",
	"Video_Game_Consoles.Atari_Cartridge_Combat",
	"Video_Game_Consoles.Atari_Cartridge_Asteroids",
	"Video_Game_Consoles.Atari_Cartridge_MSPacman",
	"Video_Game_Consoles.Atari_Cartridge_Pitfall",
	"Video_Game_Consoles.Atari_Cartridge_Spaceinvaders",
	"Video_Game_Consoles.NES_Cartridge_Contra",
	"Video_Game_Consoles.NES_Cartridge_Mario3",
	"Video_Game_Consoles.NES_Cartridge_Megaman",
	"Video_Game_Consoles.NES_Cartridge_Metroid",
	"Video_Game_Consoles.NES_Cartridge_Zelda",
	"Video_Game_Consoles.GG_Cartridge_sor2",
	"Video_Game_Consoles.GG_Cartridge_AxBattler",
	"Video_Game_Consoles.GG_Cartridge_Shinobi",
	"Video_Game_Consoles.GG_Cartridge_Sonic",
	"Video_Game_Consoles.GG_Cartridge_Vampire",
  }
  
  local function addConsoleLoot(proc_name, chance)
	local data = ProceduralDistributions.list
	if not data then
	  return print('VGC ERROR: procedure distributions not found!')
	end
	
	local c = data[proc_name];
	if not c then
	  return print('VGC ERROR: cant add console items to procedure '..proc_name)
	end
	
	for _, console in ipairs(consoleItems) do
	  table.insert(c.items, console);
	  table.insert(c.items, chance);
	end
  end
  
  -- ProceduralDistributions
  addConsoleLoot("BreakRoomShelves", 0.04)
  addConsoleLoot("ClassroomShelves", 0.04)
  addConsoleLoot("MusicStoreCDs", 0.04)
  addConsoleLoot("CrateElectronics", 0.1)
  addConsoleLoot("ElectronicStoreMisc", 0.1)
  addConsoleLoot("ElectronicStoreMusic", 0.04)
  addConsoleLoot("MusicStoreCDs", 0.04)
  addConsoleLoot("GigamartHouseElectronics", 0.1)
  addConsoleLoot("LivingRoomShelf", 0.1)
  addConsoleLoot("LivingRoomShelfNoTapes", 0.04)
  addConsoleLoot("SchoolLockers", 0.04)
  addConsoleLoot("OfficeDeskHome", 0.04)
  addConsoleLoot("WardrobeChild", 0.1)
  addConsoleLoot("WardrobeMan", 0.04)
  addConsoleLoot("MechanicShelfElectric", 0.04)
  addConsoleLoot("CrateCompactDiscs", 0.04)
  addConsoleLoot("DeskGeneric", 0.04)
  addConsoleLoot("ShelfGeneric", 0.04)
  addConsoleLoot("MusicStoreCases", 0.04)