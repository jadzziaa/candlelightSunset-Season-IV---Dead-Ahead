if getActivatedMods():contains("RavenCreek") then

	objects = {

		-- Vehicle Zones
		-- Small FD
		  { name = "fireravencreek", type = "ParkingStall", x = 3803, y = 12463, z = 0, width = 12, height = 4 },
		  { name = "fireravencreek", type = "ParkingStall", x = 3804, y = 12481, z = 0, width = 4, height = 6 },

		-- Suburban FD
		  { name = "fireravencreek", type = "ParkingStall", x = 4105, y = 13234, z = 0, width = 3, height = 4 },
		  { name = "fireravencreek", type = "ParkingStall", x = 4111, y = 13234, z = 0, width = 3, height = 4 },
		  { name = "fireravencreek", type = "ParkingStall", x = 4128, y = 13234, z = 0, width = 3, height = 4 },

		-- Downtown FD
		  { name = "fireravencreek", type = "ParkingStall", x = 3927, y = 11179, z = 0, width = 3, height = 4 },
		  { name = "fireravencreek", type = "ParkingStall", x = 3932, y = 11179, z = 0, width = 3, height = 4 },

		-- Small Laundromat
		  { name = "policeravencreek", type = "ParkingStall", x = 3419, y = 11166, z = 0, width = 4, height = 3 },
		  { name = "policeravencreek", type = "ParkingStall", x = 3419, y = 11170, z = 0, width = 4, height = 3 },
		  { name = "policeravencreek", type = "ParkingStall", x = 3419, y = 11174, z = 0, width = 4, height = 3 },

		-- Starplex Movie Theatre
		  { name = "policeravencreek", type = "ParkingStall", x = 4178, y = 11394, z = 0, width = 4, height = 6 },
		  { name = "policeravencreek", type = "ParkingStall", x = 4147, y = 11372, z = 0, width = 6, height = 4 },
		  { name = "policeravencreek", type = "ParkingStall", x = 4147, y = 11386, z = 0, width = 6, height = 4 },

		-- Large Police Parking
		  { name = "policeravencreek", type = "ParkingStall", x = 3537, y = 11529, z = 0, width = 12, height = 4 },
		  { name = "policeravencreek", type = "ParkingStall", x = 3552, y = 11536, z = 0, width = 39, height = 4 },

		-- Secure Police Station
		  { name = "policeravencreek", type = "ParkingStall", x = 3987, y = 11446, z = 0, width = 4, height = 27 },
		  { name = "policeravencreek", type = "ParkingStall", x = 3994, y = 11446, z = 0, width = 4, height = 27 },

		-- Main Prison
		  { name = "policeravencreekdoc", type = "ParkingStall", x = 4038, y = 12818, z = 0, width = 3, height = 4 },
		  { name = "policeravencreekdoc", type = "ParkingStall", x = 4043, y = 12818, z = 0, width = 3, height = 4 },
		  { name = "policeravencreekdoc", type = "ParkingStall", x = 4058, y = 12820, z = 0, width = 18, height = 4 },

		-- Downtown "Modern" Knox Bank
		  { name = "banksecurity", type = "ParkingStall", x = 3515, y = 11234, z = 0, width = 4, height = 3 },

		-- Uptown "Older" Knox Bank
		  { name = "banksecurity", type = "ParkingStall", x = 3331, y = 11238, z = 0, width = 3, height = 4 },

		-- Suburban Knox Bank
		  { name = "banksecurity", type = "ParkingStall", x = 3993, y = 13173, z = 0, width = 4, height = 3 },

		-- Zombie Zones
		-- Small FD
		  { name = "FireDeptRavenCreek", type = "ZombiesType", x = 3790, y = 12462, z = 0, width = 30, height = 27 },

		-- Suburban FD
		  { name = "FireDeptRavenCreek", type = "ZombiesType", x = 4097, y = 13215, z = 0, width = 42, height = 19 },

		-- Downtown FD
		  { name = "FireDeptRavenCreek", type = "ZombiesType", x = 3913, y = 11162, z = 0, width = 28, height = 28 },

		-- Main Prison
		  { name = "RavenCreekPrison", type = "ZombiesType", x = 3984, y = 12708, z = 0, width = 124, height = 129 },

		-- Main Cell Block Floor 2
		  { name = "RavenCreekPrison", type = "ZombiesType", x = 4029, y = 12739, z = 1, width = 40, height = 52 },

		-- Main Cell Block Floor 3
		  { name = "RavenCreekPrison", type = "ZombiesType", x = 4057, y = 12744, z = 2, width = 12, height = 48 },

		-- Small Laundromat
		  { name = "PoliceRavenCreek", type = "ZombiesType", x = 3417, y = 11152, z = 0, width = 17, height = 28 },

		-- City Entrance
		  { name = "PoliceRavenCreek", type = "ZombiesType", x = 4005, y = 11215, z = 0, width = 26, height = 37 },

		-- Large Police Station
		  { name = "PoliceRavenCreek", type = "ZombiesType", x = 3533, y = 11472, z = 0, width = 19, height = 71 },
		  { name = "PoliceRavenCreek", type = "ZombiesType", x = 3552, y = 11515, z = 0, width = 48, height = 28 },
		  { name = "PoliceRavenCreek", type = "ZombiesType", x = 3552, y = 11471, z = 0, width = 44, height = 44 },

		-- Secure Police Station
		  { name = "PoliceRavenCreek", type = "ZombiesType", x = 3983, y = 11444, z = 0, width = 24, height = 45 },
		  { name = "PoliceRavenCreek", type = "ZombiesType", x = 3952, y = 11444, z = 0, width = 31, height = 46 },

		-- RPD Style Police Station
		  { name = "PoliceRavenCreek", type = "ZombiesType", x = 3804, y = 11774, z = 0, width = 16, height = 50 },
		  { name = "PoliceRavenCreek", type = "ZombiesType", x = 3767, y = 11818, z = 0, width = 37, height = 6 },
		  { name = "PoliceRavenCreek", type = "ZombiesType", x = 3767, y = 11774, z = 0, width = 37, height = 44 },

		-- Suburban PD
		  { name = "PoliceRavenCreek", type = "ZombiesType", x = 4157, y = 13452, z = 0, width = 32, height = 28 },
		  { name = "PoliceRavenCreek", type = "ZombiesType", x = 4157, y = 13480, z = 0, width = 32, height = 7 },
		  { name = "PoliceRavenCreek", type = "ParkingStall", x = 4177, y = 13471, z = 0, width = 9, height = 4 },

		-- Downtown "Modern" Knox Bank
		  { name = "BankSecurity", type = "ZombiesType", x = 3481, y = 11220, z = 0, width = 29, height = 33 },

		-- Uptown "Older" Knox Bank
		  { name = "BankSecurity", type = "ZombiesType", x = 3327, y = 11239, z = 0, width = 22, height = 15 },

		-- Suburban Knox Bank
		  { name = "BankSecurity", type = "ZombiesType", x = 3971, y = 13172, z = 0, width = 36, height = 27 },

		-- Unused
		  --{ name = "BankSecurity", type = "ZombiesType", x = 3417, y = 11154, z = 0, width = 15, height = 24 },

		-- Loot Zones
		-- Suburban FD
		  { name = "FireDeptRavenCreekL", type = "LootZone", x = 4113, y = 13217, z = 0, width = 10, height = 6 },

		-- Small FD
		  { name = "FireDeptRavenCreekL", type = "LootZone", x = 3793, y = 12478, z = 0, width = 5, height = 1 },

		-- Large Police Station
		  { name = "PoliceRavenCreekL2", type = "LootZone", x = 3583, y = 11485, z = 0, width = 2, height = 1 },

		-- Secure Police Station
		  { name = "PoliceRavenCreekL", type = "LootZone", x = 3964, y = 11453, z = 0, width = 5, height = 15 },

		-- RPD Style Police Station
		  { name = "PoliceRavenCreekL2", type = "LootZone", x = 3792, y = 11808, z = 0, width = 10, height = 4 },

		-- Suburban PD
		  { name = "PoliceRavenCreekL3", type = "LootZone", x = 4166, y = 13462, z = 0, width = 2, height = 1 },
		  { name = "PoliceRavenCreekL", type = "LootZone", x = 4165, y = 13471, z = 0, width = 5, height = 1 },

		-- Main Prison
		  { name = "RavenCreekPrisonL", type = "LootZone", x = 3984, y = 12708, z = 0, width = 124, height = 129 },

	}

end