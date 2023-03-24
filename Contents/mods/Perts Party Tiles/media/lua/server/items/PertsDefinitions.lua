local PertsRoomDef = {
-- use all for specific containers that occur once or outside
    all = {
        PaperTray = {
            rolls = 20,
            items = {
                "Base.CrazedRamblings", 100,
        "Base.CrazedRamblings2", 75,
        "Base.CrazedRamblings3", 50,
        "Base.CrazedRamblings4", 75,
                   }
            },
			
		EmergencyAxe = {
			rolls = 2,
			items = {
			"Base.OverlookFireAxe", 100,
			}
		},
		
		spongeshelf = {
			rolls = 20,
			items = {
					"Base.Sponge", 5,
			}
		},
	
    },
	
	-- internal room name
	spongefactory = {
		 metal_shelves = {
            rolls = 20,
            items = {
                "Base.Sponge", 5,
            }
        },
		shelves = {
			rolls = 20,
			items = {
				"Base.Sponge", 10,
			}
		},
		crate = {
			rolls = 20,
			items = {
				"Base.Sponge", 10,
			}
		},
	},
	
	moo = {
		fridge = {
			rolls = 10,
			items = {
				"Base.Milk", 2,
				"Base.Yoghurt",1,
			}
		},
		
		shelves = {
			rolls = 5,
			items = {
				"Base.CannedMilk", 2,
				"Base.Chocolate", 1,
			}
		},
		crate = {
			rolls = 10,
			items = {
				"Base.CannedMilk", 2,
				"Base.Chocolate", 1,
			}
		},
		
	},
	
	oofbrick = {
		 shelves = {
            rolls = 20,
            items = {
                "Base.Bricktoys", 15,
            }
        },
		crate = {
			rolls = 20,
			items = {
				"Base.Bricktoys", 15,
			}
		},
		metal_shelves = {
			rolls = 20,
			items = {
				"Base.Bricktoys", 15,
			}
		},
	},
	
}

table.insert(Distributions, 2, PertsRoomDef);