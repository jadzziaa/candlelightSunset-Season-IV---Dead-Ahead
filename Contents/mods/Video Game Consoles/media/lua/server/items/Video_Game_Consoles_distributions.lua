Distributions = Distributions or {};

-- Function made by star -- 
local function AddProcLoot(proc_name, item_name, chance)
	local data = ProceduralDistributions.list
	if not data then
		 return print('VGC ERROR: procedure distributions not found!')
	end
	local c = data[proc_name];
	if not c then
		 return print('VGC ERROR: cant add '..item_name..' to procedure '..proc_name)
	end
	table.insert(c.items, item_name);
	table.insert(c.items, chance);

end

-- ProceduralDistributions

--                        ------- **SNES** -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.SNES", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.SNES", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.SNES", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.SNES", 0.1);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.SNES", 0.1);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.SNES", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.SNES", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.SNES", 0.1);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.SNES", 0.1);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.SNES", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.SNES", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.SNES", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.SNES", 0.1);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.SNES", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.SNES", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.SNES", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.SNES", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.SNES", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.SNES", 0.04);

--                        ------- SNES_Cartridge_Mario -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.SNES_Cartridge_Mario", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.SNES_Cartridge_Mario", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.SNES_Cartridge_Mario", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.SNES_Cartridge_Mario", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.SNES_Cartridge_Mario", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.SNES_Cartridge_Mario", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.SNES_Cartridge_Mario", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.SNES_Cartridge_Mario", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.SNES_Cartridge_Mario", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.SNES_Cartridge_Mario", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.SNES_Cartridge_Mario", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.SNES_Cartridge_Mario", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.SNES_Cartridge_Mario", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.SNES_Cartridge_Mario", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.SNES_Cartridge_Mario", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.SNES_Cartridge_Mario", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.SNES_Cartridge_Mario", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.SNES_Cartridge_Mario", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.SNES_Cartridge_Mario", 0.04);

--                     ------- SNES_Cartridge_Mana -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.SNES_Cartridge_Mana", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.SNES_Cartridge_Mana", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.SNES_Cartridge_Mana", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.SNES_Cartridge_Mana", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.SNES_Cartridge_Mana", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.SNES_Cartridge_Mana", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.SNES_Cartridge_Mana", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.SNES_Cartridge_Mana", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.SNES_Cartridge_Mana", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.SNES_Cartridge_Mana", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.SNES_Cartridge_Mana", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.SNES_Cartridge_Mana", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.SNES_Cartridge_Mana", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.SNES_Cartridge_Mana", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.SNES_Cartridge_Mana", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.SNES_Cartridge_Mana", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.SNES_Cartridge_Mana", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.SNES_Cartridge_Mana", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.SNES_Cartridge_Mana", 0.04);

--                     ------- SNES_Cartridge_Fox -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.SNES_Cartridge_Fox", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.SNES_Cartridge_Fox", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.SNES_Cartridge_Fox", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.SNES_Cartridge_Fox", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.SNES_Cartridge_Fox", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.SNES_Cartridge_Fox", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.SNES_Cartridge_Fox", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.SNES_Cartridge_Fox", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.SNES_Cartridge_Fox", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.SNES_Cartridge_Fox", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.SNES_Cartridge_Fox", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.SNES_Cartridge_Fox", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.SNES_Cartridge_Fox", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.SNES_Cartridge_Fox", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.SNES_Cartridge_Fox", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.SNES_Cartridge_Fox", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.SNES_Cartridge_Fox", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.SNES_Cartridge_Fox", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.SNES_Cartridge_Fox", 0.04);

--                     ------- SNES_Cartridge_MK2 -------


AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.SNES_Cartridge_MK2", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.SNES_Cartridge_MK2", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.SNES_Cartridge_MK2", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.SNES_Cartridge_MK2", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.SNES_Cartridge_MK2", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.SNES_Cartridge_MK2", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.SNES_Cartridge_MK2", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.SNES_Cartridge_MK2", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.SNES_Cartridge_MK2", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.SNES_Cartridge_MK2", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.SNES_Cartridge_MK2", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.SNES_Cartridge_MK2", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.SNES_Cartridge_MK2", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.SNES_Cartridge_MK2", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.SNES_Cartridge_MK2", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.SNES_Cartridge_MK2", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.SNES_Cartridge_MK2", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.SNES_Cartridge_MK2", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.SNES_Cartridge_MK2", 0.04);

--                     ------- SNES_Cartridge_NBA -------


AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.SNES_Cartridge_NBA", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.SNES_Cartridge_NBA", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.SNES_Cartridge_NBA", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.SNES_Cartridge_NBA", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.SNES_Cartridge_NBA", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.SNES_Cartridge_NBA", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.SNES_Cartridge_NBA", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.SNES_Cartridge_NBA", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.SNES_Cartridge_NBA", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.SNES_Cartridge_NBA", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.SNES_Cartridge_NBA", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.SNES_Cartridge_NBA", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.SNES_Cartridge_NBA", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.SNES_Cartridge_NBA", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.SNES_Cartridge_NBA", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.SNES_Cartridge_NBA", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.SNES_Cartridge_NBA", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.SNES_Cartridge_NBA", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.SNES_Cartridge_NBA", 0.04);


--                          -------** GameBoy **-------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.GameBoy", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.GameBoy", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.GameBoy", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.GameBoy", 0.1);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.GameBoy", 0.1);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.GameBoy", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.GameBoy", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.GameBoy", 0.1);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.GameBoy", 0.1);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.GameBoy", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.GameBoy", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.GameBoy", 0.1);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.GameBoy", 0.1);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.GameBoy", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.GameBoy", 0.1);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.GameBoy", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.GameBoy", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.GameBoy", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.GameBoy", 0.04);

--                        ------- GB_Cartridge_Zelda -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.GB_Cartridge_Zelda", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.GB_Cartridge_Zelda", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.GB_Cartridge_Zelda", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.GB_Cartridge_Zelda", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.GB_Cartridge_Zelda", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.GB_Cartridge_Zelda", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.GB_Cartridge_Zelda", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.GB_Cartridge_Zelda", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.GB_Cartridge_Zelda", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.GB_Cartridge_Zelda", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.GB_Cartridge_Zelda", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.GB_Cartridge_Zelda", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.GB_Cartridge_Zelda", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.GB_Cartridge_Zelda", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.GB_Cartridge_Zelda", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.GB_Cartridge_Zelda", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.GB_Cartridge_Zelda", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.GB_Cartridge_Zelda", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.GB_Cartridge_Zelda", 0.04);

--                     ------- GB_Cartridge_Kirby -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.GB_Cartridge_Kirby", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.GB_Cartridge_Kirby", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.GB_Cartridge_Kirby", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.GB_Cartridge_Kirby", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.GB_Cartridge_Kirby", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.GB_Cartridge_Kirby", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.GB_Cartridge_Kirby", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.GB_Cartridge_Kirby", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.GB_Cartridge_Kirby", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.GB_Cartridge_Kirby", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.GB_Cartridge_Kirby", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.GB_Cartridge_Kirby", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.GB_Cartridge_Kirby", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.GB_Cartridge_Kirby", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.GB_Cartridge_Kirby", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.GB_Cartridge_Kirby", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.GB_Cartridge_Kirby", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.GB_Cartridge_Kirby", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.GB_Cartridge_Kirby", 0.04);

--                     ------- GB_Cartridge_Fantasy -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.GB_Cartridge_Fantasy", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.GB_Cartridge_Fantasy", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.GB_Cartridge_Fantasy", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.GB_Cartridge_Fantasy", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.GB_Cartridge_Fantasy", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.GB_Cartridge_Fantasy", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.GB_Cartridge_Fantasy", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.GB_Cartridge_Fantasy", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.GB_Cartridge_Fantasy", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.GB_Cartridge_Fantasy", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.GB_Cartridge_Fantasy", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.GB_Cartridge_Fantasy", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.GB_Cartridge_Fantasy", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.GB_Cartridge_Fantasy", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.GB_Cartridge_Fantasy", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.GB_Cartridge_Fantasy", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.GB_Cartridge_Fantasy", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.GB_Cartridge_Fantasy", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.GB_Cartridge_Fantasy", 0.04);

--                     ------- GB_Cartridge_Mario -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.GB_Cartridge_Mario", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.GB_Cartridge_Mario", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.GB_Cartridge_Mario", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.GB_Cartridge_Mario", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.GB_Cartridge_Mario", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.GB_Cartridge_Mario", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.GB_Cartridge_Mario", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.GB_Cartridge_Mario", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.GB_Cartridge_Mario", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.GB_Cartridge_Mario", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.GB_Cartridge_Mario", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.GB_Cartridge_Mario", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.GB_Cartridge_Mario", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.GB_Cartridge_Mario", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.GB_Cartridge_Mario", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.GB_Cartridge_Mario", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.GB_Cartridge_Mario", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.GB_Cartridge_Mario", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.GB_Cartridge_Mario", 0.04);

--                     ------- GB_Cartridge_Tetris -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.GB_Cartridge_Tetris", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.GB_Cartridge_Tetris", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.GB_Cartridge_Tetris", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.GB_Cartridge_Tetris", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.GB_Cartridge_Tetris", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.GB_Cartridge_Tetris", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.GB_Cartridge_Tetris", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.GB_Cartridge_Tetris", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.GB_Cartridge_Tetris", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.GB_Cartridge_Tetris", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.GB_Cartridge_Tetris", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.GB_Cartridge_Tetris", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.GB_Cartridge_Tetris", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.GB_Cartridge_Tetris", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.GB_Cartridge_Tetris", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.GB_Cartridge_Tetris", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.GB_Cartridge_Tetris", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.GB_Cartridge_Tetris", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.GB_Cartridge_Tetris", 0.04);


--                        ------- **Genesis** -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.Genesis", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.Genesis", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Genesis", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.Genesis", 0.1);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.Genesis", 0.1);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.Genesis", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Genesis", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.Genesis", 0.1);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.Genesis", 0.1);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.Genesis", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.Genesis", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.Genesis", 0.1);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.Genesis", 0.1);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.Genesis", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.Genesis", 0.1);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.Genesis", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.Genesis", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.Genesis", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.Genesis", 0.04);

--                     ------- Genesis_Cartridge_Aladdin -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.Genesis_Cartridge_aladdin", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.Genesis_Cartridge_aladdin", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Genesis_Cartridge_aladdin", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.Genesis_Cartridge_aladdin", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.Genesis_Cartridge_aladdin", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.Genesis_Cartridge_aladdin", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Genesis_Cartridge_aladdin", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.Genesis_Cartridge_aladdin", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.Genesis_Cartridge_aladdin", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.Genesis_Cartridge_aladdin", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.Genesis_Cartridge_aladdin", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.Genesis_Cartridge_aladdin", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.Genesis_Cartridge_aladdin", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.Genesis_Cartridge_aladdin", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.Genesis_Cartridge_aladdin", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.Genesis_Cartridge_aladdin", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.Genesis_Cartridge_aladdin", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.Genesis_Cartridge_aladdin", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.Genesis_Cartridge_aladdin", 0.04);

--                     ------- Genesis_Cartridge_GoldenAxe -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.Genesis_Cartridge_gaxe", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.Genesis_Cartridge_gaxe", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Genesis_Cartridge_gaxe", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.Genesis_Cartridge_gaxe", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.Genesis_Cartridge_gaxe", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.Genesis_Cartridge_gaxe", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Genesis_Cartridge_gaxe", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.Genesis_Cartridge_gaxe", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.Genesis_Cartridge_gaxe", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.Genesis_Cartridge_gaxe", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.Genesis_Cartridge_gaxe", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.Genesis_Cartridge_gaxe", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.Genesis_Cartridge_gaxe", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.Genesis_Cartridge_gaxe", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.Genesis_Cartridge_gaxe", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.Genesis_Cartridge_gaxe", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.Genesis_Cartridge_gaxe", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.Genesis_Cartridge_gaxe", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.Genesis_Cartridge_gaxe", 0.04);

--                     ------- Genesis_Cartridge_GhoulsAndGoblins -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.Genesis_Cartridge_ghouls", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.Genesis_Cartridge_ghouls", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Genesis_Cartridge_ghouls", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.Genesis_Cartridge_ghouls", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.Genesis_Cartridge_ghouls", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.Genesis_Cartridge_ghouls", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Genesis_Cartridge_ghouls", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.Genesis_Cartridge_ghouls", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.Genesis_Cartridge_ghouls", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.Genesis_Cartridge_ghouls", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.Genesis_Cartridge_ghouls", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.Genesis_Cartridge_ghouls", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.Genesis_Cartridge_ghouls", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.Genesis_Cartridge_ghouls", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.Genesis_Cartridge_ghouls", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.Genesis_Cartridge_ghouls", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.Genesis_Cartridge_ghouls", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.Genesis_Cartridge_ghouls", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.Genesis_Cartridge_ghouls", 0.04);

--                     ------- Genesis_Cartridge_Sonic -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.Genesis_Cartridge_sonic", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.Genesis_Cartridge_sonic", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Genesis_Cartridge_sonic", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.Genesis_Cartridge_sonic", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.Genesis_Cartridge_sonic", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.Genesis_Cartridge_sonic", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Genesis_Cartridge_sonic", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.Genesis_Cartridge_sonic", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.Genesis_Cartridge_sonic", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.Genesis_Cartridge_sonic", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.Genesis_Cartridge_sonic", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.Genesis_Cartridge_sonic", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.Genesis_Cartridge_sonic", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.Genesis_Cartridge_sonic", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.Genesis_Cartridge_sonic", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.Genesis_Cartridge_sonic", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.Genesis_Cartridge_sonic", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.Genesis_Cartridge_sonic", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.Genesis_Cartridge_sonic", 0.04);

--                     ------- Genesis_Cartridge_StreetsOfRage -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.Genesis_Cartridge_street", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.Genesis_Cartridge_street", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Genesis_Cartridge_street", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.Genesis_Cartridge_street", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.Genesis_Cartridge_street", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.Genesis_Cartridge_street", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Genesis_Cartridge_street", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.Genesis_Cartridge_street", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.Genesis_Cartridge_street", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.Genesis_Cartridge_street", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.Genesis_Cartridge_street", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.Genesis_Cartridge_street", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.Genesis_Cartridge_street", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.Genesis_Cartridge_street", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.Genesis_Cartridge_street", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.Genesis_Cartridge_street", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.Genesis_Cartridge_street", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.Genesis_Cartridge_street", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.Genesis_Cartridge_street", 0.04);

--                        ------- **Atari** -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.Atari", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.Atari", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Atari", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.Atari", 0.1);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.Atari", 0.1);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.Atari", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Atari", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.Atari", 0.1);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.Atari", 0.1);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.Atari", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.Atari", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.Atari", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.Atari", 0.1);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.Atari", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.Atari", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.Atari", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.Atari", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.Atari", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.Atari", 0.04);

--                     ------- Atari_Cartridge_Combat -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.Atari_Cartridge_Combat", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.Atari_Cartridge_Combat", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Atari_Cartridge_Combat", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.Atari_Cartridge_Combat", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.Atari_Cartridge_Combat", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.Atari_Cartridge_Combat", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Atari_Cartridge_Combat", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.Atari_Cartridge_Combat", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.Atari_Cartridge_Combat", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.Atari_Cartridge_Combat", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.Atari_Cartridge_Combat", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.Atari_Cartridge_Combat", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.Atari_Cartridge_Combat", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.Atari_Cartridge_Combat", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.Atari_Cartridge_Combat", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.Atari_Cartridge_Combat", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.Atari_Cartridge_Combat", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.Atari_Cartridge_Combat", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.Atari_Cartridge_Combat", 0.04);

--                     ------- Atari_Cartridge_Asteroids -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.Atari_Cartridge_Asteroids", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.Atari_Cartridge_Asteroids", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Atari_Cartridge_Asteroids", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.Atari_Cartridge_Asteroids", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.Atari_Cartridge_Asteroids", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.Atari_Cartridge_Asteroids", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Atari_Cartridge_Asteroids", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.Atari_Cartridge_Asteroids", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.Atari_Cartridge_Asteroids", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.Atari_Cartridge_Asteroids", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.Atari_Cartridge_Asteroids", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.Atari_Cartridge_Asteroids", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.Atari_Cartridge_Asteroids", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.Atari_Cartridge_Asteroids", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.Atari_Cartridge_Asteroids", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.Atari_Cartridge_Asteroids", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.Atari_Cartridge_Asteroids", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.Atari_Cartridge_Asteroids", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.Atari_Cartridge_Asteroids", 0.04);

--                     ------- Atari_Cartridge_MSPacman -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.Atari_Cartridge_MSPacman", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.Atari_Cartridge_MSPacman", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Atari_Cartridge_MSPacman", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.Atari_Cartridge_MSPacman", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.Atari_Cartridge_MSPacman", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.Atari_Cartridge_MSPacman", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Atari_Cartridge_MSPacman", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.Atari_Cartridge_MSPacman", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.Atari_Cartridge_MSPacman", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.Atari_Cartridge_MSPacman", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.Atari_Cartridge_MSPacman", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.Atari_Cartridge_MSPacman", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.Atari_Cartridge_MSPacman", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.Atari_Cartridge_MSPacman", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.Atari_Cartridge_MSPacman", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.Atari_Cartridge_MSPacman", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.Atari_Cartridge_MSPacman", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.Atari_Cartridge_MSPacman", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.Atari_Cartridge_MSPacman", 0.04);

--                     ------- Atari_Cartridge_Pitfall -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.Atari_Cartridge_Pitfall", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.Atari_Cartridge_Pitfall", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Atari_Cartridge_Pitfall", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.Atari_Cartridge_Pitfall", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.Atari_Cartridge_Pitfall", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.Atari_Cartridge_Pitfall", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Atari_Cartridge_Pitfall", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.Atari_Cartridge_Pitfall", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.Atari_Cartridge_Pitfall", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.Atari_Cartridge_Pitfall", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.Atari_Cartridge_Pitfall", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.Atari_Cartridge_Pitfall", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.Atari_Cartridge_Pitfall", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.Atari_Cartridge_Pitfall", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.Atari_Cartridge_Pitfall", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.Atari_Cartridge_Pitfall", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.Atari_Cartridge_Pitfall", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.Atari_Cartridge_Pitfall", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.Atari_Cartridge_Pitfall", 0.04);

--                     ------- Atari_Cartridge_Spaceinvaders -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.Atari_Cartridge_Spaceinvaders", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.Atari_Cartridge_Spaceinvaders", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Atari_Cartridge_Spaceinvaders", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.Atari_Cartridge_Spaceinvaders", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.Atari_Cartridge_Spaceinvaders", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.Atari_Cartridge_Spaceinvaders", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.Atari_Cartridge_Spaceinvaders", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.Atari_Cartridge_Spaceinvaders", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.Atari_Cartridge_Spaceinvaders", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.Atari_Cartridge_Spaceinvaders", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.Atari_Cartridge_Spaceinvaders", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.Atari_Cartridge_Spaceinvaders", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.Atari_Cartridge_Spaceinvaders", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.Atari_Cartridge_Spaceinvaders", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.Atari_Cartridge_Spaceinvaders", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.Atari_Cartridge_Spaceinvaders", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.Atari_Cartridge_Spaceinvaders", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.Atari_Cartridge_Spaceinvaders", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.Atari_Cartridge_Spaceinvaders", 0.04);


--                        ------- **NES** -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.NES", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.NES", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.NES", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.NES", 0.1);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.NES", 0.1);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.NES", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.NES", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.NES", 0.1);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.NES", 0.1);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.NES", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.NES", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.NES", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.NES", 0.1);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.NES", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.NES", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.NES", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.NES", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.NES", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.NES", 0.04);

--                     ------- NES_Cartridge_Contra -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.NES_Cartridge_Contra", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.NES_Cartridge_Contra", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.NES_Cartridge_Contra", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.NES_Cartridge_Contra", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.NES_Cartridge_Contra", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.NES_Cartridge_Contra", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.NES_Cartridge_Contra", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.NES_Cartridge_Contra", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.NES_Cartridge_Contra", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.NES_Cartridge_Contra", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.NES_Cartridge_Contra", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.NES_Cartridge_Contra", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.NES_Cartridge_Contra", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.NES_Cartridge_Contra", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.NES_Cartridge_Contra", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.NES_Cartridge_Contra", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.NES_Cartridge_Contra", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.NES_Cartridge_Contra", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.NES_Cartridge_Contra", 0.04);

--                     ------- NES_Cartridge_Mario3 -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.NES_Cartridge_Mario3", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.NES_Cartridge_Mario3", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.NES_Cartridge_Mario3", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.NES_Cartridge_Mario3", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.NES_Cartridge_Mario3", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.NES_Cartridge_Mario3", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.NES_Cartridge_Mario3", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.NES_Cartridge_Mario3", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.NES_Cartridge_Mario3", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.NES_Cartridge_Mario3", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.NES_Cartridge_Mario3", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.NES_Cartridge_Mario3", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.NES_Cartridge_Mario3", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.NES_Cartridge_Mario3", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.NES_Cartridge_Mario3", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.NES_Cartridge_Mario3", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.NES_Cartridge_Mario3", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.NES_Cartridge_Mario3", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.NES_Cartridge_Mario3", 0.04);

--                     ------- NES_Cartridge_Megaman -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.NES_Cartridge_Megaman", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.NES_Cartridge_Megaman", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.NES_Cartridge_Megaman", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.NES_Cartridge_Megaman", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.NES_Cartridge_Megaman", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.NES_Cartridge_Megaman", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.NES_Cartridge_Megaman", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.NES_Cartridge_Megaman", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.NES_Cartridge_Megaman", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.NES_Cartridge_Megaman", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.NES_Cartridge_Megaman", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.NES_Cartridge_Megaman", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.NES_Cartridge_Megaman", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.NES_Cartridge_Megaman", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.NES_Cartridge_Megaman", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.NES_Cartridge_Megaman", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.NES_Cartridge_Megaman", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.NES_Cartridge_Megaman", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.NES_Cartridge_Megaman", 0.04);

--                     ------- NES_Cartridge_Metroid -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.NES_Cartridge_Metroid", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.NES_Cartridge_Metroid", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.NES_Cartridge_Metroid", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.NES_Cartridge_Metroid", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.NES_Cartridge_Metroid", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.NES_Cartridge_Metroid", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.NES_Cartridge_Metroid", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.NES_Cartridge_Metroid", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.NES_Cartridge_Metroid", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.NES_Cartridge_Metroid", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.NES_Cartridge_Metroid", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.NES_Cartridge_Metroid", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.NES_Cartridge_Metroid", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.NES_Cartridge_Metroid", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.NES_Cartridge_Metroid", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.NES_Cartridge_Metroid", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.NES_Cartridge_Metroid", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.NES_Cartridge_Metroid", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.NES_Cartridge_Metroid", 0.04);

--                     ------- NES_Cartridge_Zelda -------

AddProcLoot("BreakRoomShelves",		        "Video_Game_Consoles.NES_Cartridge_Zelda", 0.04);
AddProcLoot("ClassroomShelves",		        "Video_Game_Consoles.NES_Cartridge_Zelda", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.NES_Cartridge_Zelda", 0.04);
AddProcLoot("CrateElectronics",		        "Video_Game_Consoles.NES_Cartridge_Zelda", 0.04);
AddProcLoot("ElectronicStoreMisc",  	    "Video_Game_Consoles.NES_Cartridge_Zelda", 0.04);
AddProcLoot("ElectronicStoreMusic",	        "Video_Game_Consoles.NES_Cartridge_Zelda", 0.04);
AddProcLoot("MusicStoreCDs",		        "Video_Game_Consoles.NES_Cartridge_Zelda", 0.04);
AddProcLoot("GigamartHouseElectronics",	    "Video_Game_Consoles.NES_Cartridge_Zelda", 0.04);
AddProcLoot("LivingRoomShelf",		        "Video_Game_Consoles.NES_Cartridge_Zelda", 0.04);
AddProcLoot("LivingRoomShelfNoTapes",		"Video_Game_Consoles.NES_Cartridge_Zelda", 0.04);
AddProcLoot("SchoolLockers",		        "Video_Game_Consoles.NES_Cartridge_Zelda", 0.04);
AddProcLoot("OfficeDeskHome",		        "Video_Game_Consoles.NES_Cartridge_Zelda", 0.04);
AddProcLoot("WardrobeChild",  	            "Video_Game_Consoles.NES_Cartridge_Zelda", 0.04);
AddProcLoot("WardrobeMan",	                "Video_Game_Consoles.NES_Cartridge_Zelda", 0.04);
AddProcLoot("MechanicShelfElectric",		"Video_Game_Consoles.NES_Cartridge_Zelda", 0.04);
AddProcLoot("CrateCompactDiscs",	        "Video_Game_Consoles.NES_Cartridge_Zelda", 0.04);
AddProcLoot("DeskGeneric",	                "Video_Game_Consoles.NES_Cartridge_Zelda", 0.04);
AddProcLoot("ShelfGeneric",		            "Video_Game_Consoles.NES_Cartridge_Zelda", 0.04);
AddProcLoot("MusicStoreCases",	            "Video_Game_Consoles.NES_Cartridge_Zelda", 0.04);