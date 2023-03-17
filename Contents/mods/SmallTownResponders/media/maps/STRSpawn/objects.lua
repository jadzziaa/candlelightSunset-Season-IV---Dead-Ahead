-- Check if only the custom zones are enabled in sandbox options
if SandboxVars.STR.CustomZones and not SandboxVars.STR.LootZones then

	if not getActivatedMods():contains("NewEkron") then

	objects = {

		-- Zombie Spawn Zones
		-- Police Areas
		{ name = "RiversidePD", type = "ZombiesType", x = 6079, y = 5249, z = 0, width = 23, height = 27}, -- Riverside Police Station
		{ name = "WestPointPD", type = "ZombiesType", x = 11876, y = 6935, z = 0, width = 42, height = 25}, -- WestPoint Police Station
		{ name = "MeadeSO", type = "ZombiesType", x = 7252, y = 8366, z = 0, width = 12, height = 23}, -- Ekron Sheriff Station
		{ name = "MuldraughPD", type = "ZombiesType", x = 10630, y = 10400, z = 0, width = 28, height = 42}, -- Muldraugh Police Station
		{ name = "RosewoodSD", type = "ZombiesType", x = 8043, y = 11703, z = 0, width = 50, height = 62}, -- Rosewood Sheriff Station

		-- Picnic Areas
		{ name = "MeadeRangers", type = "ZombiesType", x = 12010, y = 7354, z = 0, width = 56, height = 70}, -- WestPoint Picnic Area
		{ name = "MeadeRangers", type = "ZombiesType", x = 10980, y = 9629, z = 0, width = 35, height = 35}, -- Muldraugh Picnic Area
		{ name = "MeadeRangers", type = "ZombiesType", x = 11543, y = 8851, z = 0, width = 30, height = 40}, -- Dixie Picnic Area

		-- Louisville
		{ name = "LouisvillePD", type = "ZombiesType", x = 12479, y = 1581, z = 0, width = 9, height = 63 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12466, y = 1640, z = 0, width = 25, height = 10 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12466, y = 1636, z = 0, width = 17, height = 4 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12466, y = 1587, z = 0, width = 13, height = 49 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12463, y = 1587, z = 0, width = 3, height = 29 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12450, y = 1598, z = 0, width = 12, height = 14 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12434, y = 1584, z = 0, width = 16, height = 39 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12431, y = 1606, z = 0, width = 4, height = 14 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12460, y = 1601, z = 1, width = 32, height = 46 }, -- Louisville Police Department

		{ name = "JeffersonSD", type = "ZombiesType", x = 13778, y = 2552, z = 0, width = 10, height = 20 }, -- Jefferson County Sheriff Station

		{ name = "JeffersonPD", type = "ZombiesType", x = 13203, y = 3086, z = 0, width = 35, height = 13 }, -- Jefferson County Police Department
		{ name = "JeffersonPD", type = "ZombiesType", x = 13211, y = 3083, z = 0, width = 24, height = 3 }, -- Jefferson County Police Department
		{ name = "JeffersonPD", type = "ZombiesType", x = 13212, y = 3074, z = 0, width = 23, height = 9 }, -- Jefferson County Police Department

		{ name = "LouisvilleKSP", type = "ZombiesType", x = 12970, y = 1365, z = 0, width = 18, height = 39 }, -- Louisville Unmarked Police Station (KSP)
		{ name = "LouisvilleKSP", type = "ZombiesType", x = 12960, y = 1365, z = 0, width = 13, height = 29 }, -- Louisville Unmarked Police Station (KSP)
		{ name = "LouisvilleKSP", type = "ZombiesType", x = 12944, y = 1365, z = 0, width = 13, height = 21 }, -- Louisville Unmarked Police Station (KSP)
		{ name = "LouisvilleKSP", type = "ZombiesType", x = 12943, y = 1365, z = 1, width = 21, height = 21 }, -- Louisville Unmarked Police Station (KSP)

		-- Prison/Jail Areas
		{ name = "LouisvillePDPrison", type = "ZombiesType", x = 12403, y = 1582, z = 0, width = 24, height = 40 }, -- Louisville Police Department City Jail
		{ name = "LouisvillePDPrison", type = "ZombiesType", x = 12427, y = 1582, z = 0, width = 4, height = 26 }, -- Louisville Police Department City Jail
		{ name = "LouisvillePDPrison", type = "ZombiesType", x = 12403, y = 1583, z = 1, width = 29, height = 40 }, -- Louisville Police Department City Jail

		{ name = "JeffersonPDJail", type = "ZombiesType", x = 13205, y = 3073, z = 0, width = 6, height = 10 }, -- Jefferson County Police Department Jail Area

		{ name = "JeffersonSDJail", type = "ZombiesType", x = 13778, y = 2564, z = 0, width = 6, height = 3 }, -- Jefferson County Sheriff Department Jail Area

		{ name = "LouisvilleKSPJail", type = "ZombiesType", x = 12944, y = 1386, z = 0, width = 13, height = 8 }, -- Louisville Unmarked Police Station (KSP) Jail Area

		{ name = "RosewoodPrison", type = "ZombiesType", x = 7606, y = 11781, z = 0, width = 138, height = 196 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7744, y = 11893, z = 0, width = 22, height = 30 }, -- Rosewood Prison

		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11817, z = 1, width = 21, height = 42 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11859, z = 1, width = 24, height = 4 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11863, z = 1, width = 39, height = 13 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11876, z = 1, width = 38, height = 10 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11886, z = 1, width = 39, height = 14 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11900, z = 1, width = 22, height = 45 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7700, y = 11900, z = 1, width = 17, height = 6 }, -- Rosewood Prison

		{ name = "RosewoodPrisonMax", type = "ZombiesType", x = 7678, y = 11866, z = 1, width = 17, height = 21 }, -- Rosewood Prison Maximum Security Wing
		{ name = "RosewoodPrisonMax", type = "ZombiesType", x = 7678, y = 11887, z = 1, width = 5, height = 5 }, -- Rosewood Prison Maximum Security Wing
		{ name = "RosewoodPrisonMax", type = "ZombiesType", x = 7681, y = 11892, z = 1, width = 2, height = 1 }, -- Rosewood Prison Maximum Security Wing

		{ name = "RosewoodPrison", type = "ZombiesType", x = 7734, y = 11896, z = 1, width = 19, height = 12 }, -- Rosewood Prison Admin Building

		-- Fire Departments
		{ name = "FireDeptLV", type = "ZombiesType", x = 12349, y = 1741, z = 0, width = 23, height = 41 }, -- Louisville Slums FD
		{ name = "FireDeptLV", type = "ZombiesType", x = 12349, y = 1741, z = 1, width = 23, height = 20 }, -- Louisville Slums FD
		{ name = "FireDeptLV", type = "ZombiesType", x = 13661, y = 1767, z = 0, width = 76, height = 33 }, -- Louisville Main FD
		{ name = "FireDeptRW", type = "ZombiesType", x = 8125, y = 11731, z = 0, width = 39, height = 43 }, -- Rosewood Fire Station
		{ name = "FireDeptRW", type = "ZombiesType", x = 8128, y = 11728, z = 1, width = 17, height = 23 }, -- Rosewood Fire Station
		{ name = "FireDeptRW", type = "ZombiesType", x = 8128, y = 11751, z = 1, width = 6, height = 1 }, -- Rosewood Fire Station

		-- EMS Departments
		{ name = "MeadeEMS", type = "ZombiesType", x = 8079, y = 11526, z = 0, width = 6, height = 5 }, -- Rosewood Medical
		{ name = "LouisvilleEMS", type = "ZombiesType", x = 12417, y = 1750, z = 0, width = 8, height = 5 }, -- Louisville Medical Center
		{ name = "LouisvilleEMS", type = "ZombiesType", x = 12923, y = 2073, z = 0, width = 5, height = 3 }, -- Louisville General Hospital
		{ name = "JeffersonEMS", type = "ZombiesType", x = 12388, y = 3716, z = 0, width = 7, height = 5 }, -- St. Peregin's Hospital

		-- Rangers
		{ name = "MeadeRangers", type = "ZombiesType", x = 4825, y = 6264, z = 0, width = 34, height = 33 }, -- New Ranger Station
		{ name = "MeadeRangers", type = "ZombiesType", x = 4825, y = 6264, z = 0, width = 34, height = 33 }, -- New Ranger Station
		{ name = "MeadeRangers", type = "ZombiesType", x = 4825, y = 6264, z = 0, width = 34, height = 33 }, -- New Ranger Station

		-- Louisville Postal Depo
		{ name = "USPS", type = "ZombiesType", x = 12614, y = 2067, z = 0, width = 28, height = 27 }, -- USPS Office
		{ name = "USPS", type = "ZombiesType", x = 12642, y = 2059, z = 0, width = 35, height = 35 }, -- USPS Parking And Garage

		-- Riverside Postal Office
		{ name = "USPS", type = "ZombiesType", x = 6301, y = 5244, z = 0, width = 24, height = 29 }, -- USPS Office

		-- WestPoint Postal Office
		{ name = "USPS", type = "ZombiesType", x = 11954, y = 6906, z = 0, width = 16, height = 15 }, -- USPS Office

		-- MarchRidge Postal Office
		{ name = "USPS", type = "ZombiesType", x = 10098, y = 12708, z = 0, width = 33, height = 22 }, -- USPS Office

		-- Rosewood Court House
		{ name = "CourtHouse", type = "ZombiesType", x = 8051, y = 11642, z = 0, width = 38, height = 29 }, -- Main Building

		-- Louisville Court House
		{ name = "CourtHouse", type = "ZombiesType", x = 12458, y = 1527, z = 0, width = 40, height = 39 }, -- Main Building

		-- Louisville Havisham Hotel
		{ name = "HotelHav", type = "ZombiesType", x = 12614, y = 1292, z = 0, width = 75, height = 37 },
		{ name = "HotelHav", type = "ZombiesType", x = 12614, y = 1292, z = 1, width = 74, height = 37 },
		{ name = "HotelHav", type = "ZombiesType", x = 12614, y = 1293, z = 2, width = 73, height = 47 },
		{ name = "HotelHav", type = "ZombiesType", x = 12616, y = 1294, z = 3, width = 57, height = 48 },
		{ name = "HotelHav", type = "ZombiesType", x = 12616, y = 1294, z = 4, width = 56, height = 48 },
		{ name = "HotelHav", type = "ZombiesType", x = 12616, y = 1296, z = 5, width = 56, height = 45 },

		-- Louisville Unnamed Fancy Hotel
		{ name = "HotelFancy", type = "ZombiesType", x = 13653, y = 1506, z = 0, width = 84, height = 48 },
		{ name = "HotelFancy", type = "ZombiesType", x = 13664, y = 1506, z = 1, width = 65, height = 38 },
		{ name = "HotelFancy", type = "ZombiesType", x = 13664, y = 1507, z = 2, width = 66, height = 37 },

		-- Grand Ohio Mall
		{ name = "MallOhio", type = "ZombiesType", x = 13515, y = 1261, z = 0, width = 109, height = 143 },
		{ name = "MallOhio", type = "ZombiesType", x = 13625, y = 1261, z = 0, width = 47, height = 73 },
		{ name = "MallOhio", type = "ZombiesType", x = 13515, y = 1261, z = 1, width = 109, height = 143 },
		{ name = "MallOhio", type = "ZombiesType", x = 13625, y = 1261, z = 1, width = 47, height = 73 },
		{ name = "MallOhio", type = "ZombiesType", x = 13515, y = 1261, z = 2, width = 109, height = 143 },
		{ name = "MallOhio", type = "ZombiesType", x = 13625, y = 1261, z = 2, width = 47, height = 73 },

		-- Valley Station Mall
		{ name = "MallValley", type = "ZombiesType", x = 13872, y = 5750, z = 0, width = 86, height = 141 },
		{ name = "MallValley", type = "ZombiesType", x = 13959, y = 5780, z = 0, width = 27, height = 111 },
		{ name = "MallValley", type = "ZombiesType", x = 13987, y = 5797, z = 0, width = 13, height = 94 },
		{ name = "MallValley", type = "ZombiesType", x = 13909, y = 5892, z = 0, width = 57, height = 17 },
		{ name = "MallValley", type = "ZombiesType", x = 13967, y = 5892, z = 0, width = 33, height = 7 },
		{ name = "MallValley", type = "ZombiesType", x = 13872, y = 5750, z = 1, width = 86, height = 141 },
		{ name = "MallValley", type = "ZombiesType", x = 13959, y = 5780, z = 1, width = 27, height = 111 },
		{ name = "MallValley", type = "ZombiesType", x = 13987, y = 5797, z = 1, width = 13, height = 94 },
		{ name = "MallValley", type = "ZombiesType", x = 13909, y = 5892, z = 1, width = 57, height = 17 },
		{ name = "MallValley", type = "ZombiesType", x = 13967, y = 5892, z = 1, width = 33, height = 7 },
		{ name = "MallValley", type = "ZombiesType", x = 13872, y = 5750, z = 2, width = 86, height = 141 },
		{ name = "MallValley", type = "ZombiesType", x = 13959, y = 5780, z = 2, width = 27, height = 111 },
		{ name = "MallValley", type = "ZombiesType", x = 13987, y = 5797, z = 2, width = 13, height = 94 },
		{ name = "MallValley", type = "ZombiesType", x = 13909, y = 5892, z = 2, width = 57, height = 17 },
		{ name = "MallValley", type = "ZombiesType", x = 13967, y = 5892, z = 2, width = 33, height = 7 },

		-- Louisville Mall
		{ name = "MallLV", type = "ZombiesType", x = 13300, y = 3044, z = 0, width = 101, height = 41 },
		{ name = "MallLV", type = "ZombiesType", x = 13300, y = 3044, z = 1, width = 101, height = 41 },

		-- Sky Blue Bank North Louisville
		{ name = "BankSecurity", type = "ZombiesType", x = 13116, y = 2159, z = 0, width = 20, height = 18 },
		{ name = "BankSecurity", type = "ZombiesType", x = 13114, y = 2157, z = 1, width = 22, height = 19 },

		-- Sky Blue Bank South Louisville
		{ name = "BankSecurity", type = "ZombiesType", x = 13593, y = 3013, z = 0, width = 18, height = 23 },
		{ name = "BankSecurity", type = "ZombiesType", x = 13593, y = 3012, z = 1, width = 16, height = 20 },

		-- Knox Bank Louisville
		{ name = "BankSecurity", type = "ZombiesType", x = 12531, y = 2583, z = 0, width = 19, height = 18 },

		-- Riverside Knox Bank
		{ name = "BankSecurity", type = "ZombiesType", x = 6509, y = 5298, z = 0, width = 11, height = 24 },
		{ name = "BankSecurity", type = "ZombiesType", x = 6499, y = 5298, z = 0, width = 10, height = 11 },

		-- WestPoint Knox Bank
		{ name = "BankSecurity", type = "ZombiesType", x = 11897, y = 6911, z = 0, width = 20, height = 20 },

		-- Valley Station Knox Bank
		{ name = "BankSecurity", type = "ZombiesType", x = 13652, y = 5736, z = 0, width = 16, height = 26 },

		-- Muldraugh Knox Bank
		{ name = "BankSecurity", type = "ZombiesType", x = 10626, y = 9688, z = 0, width = 10, height = 21 },

		-- Rosewood Knox Bank
		{ name = "BankSecurity", type = "ZombiesType", x = 8082, y = 11589, z = 0, width = 17, height = 16 },

		}
	end

	if getActivatedMods():contains("NewEkron") then

	objects = {
		-- Zombie Spawn Zones
		-- Police Areas
		{ name = "RiversidePD", type = "ZombiesType", x = 6079, y = 5249, z = 0, width = 23, height = 27}, --  Riverside Police Station
		{ name = "WestPointPD", type = "ZombiesType", x = 11876, y = 6935, z = 0, width = 42, height = 25}, --  WestPoint Police Station
		{ name = "MeadeSO", type = "ZombiesType", x = 7081, y = 8321, z = 0, width = 13, height = 9 }, --  Ekron Sheriff Station
		{ name = "MeadeSO", type = "ZombiesType", x = 7081, y = 8308, z = 0, width = 7, height = 13 }, --  Ekron Sheriff Station
		{ name = "MuldraughPD", type = "ZombiesType", x = 10630, y = 10400, z = 0, width = 28, height = 42}, --  Muldraugh Police Station
		{ name = "RosewoodSD", type = "ZombiesType", x = 8043, y = 11703, z = 0, width = 50, height = 62}, --  Rosewood Sheriff Station

		-- Picnic Areas
		{ name = "WestPointPicnic", type = "ZombiesType", x = 12010, y = 7354, z = 0, width = 56, height = 70}, --  WestPoint Picnic Area
		{ name = "MuldraughPicnic", type = "ZombiesType", x = 10980, y = 9629, z = 0, width = 35, height = 35}, --  Muldraugh Picnic Area
		{ name = "DixiePicnic", type = "ZombiesType", x = 11543, y = 8851, z = 0, width = 30, height = 40}, --  Dixie Picnic Area

		-- Louisville
		{ name = "LouisvillePD", type = "ZombiesType", x = 12479, y = 1581, z = 0, width = 9, height = 63 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12466, y = 1640, z = 0, width = 25, height = 10 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12466, y = 1636, z = 0, width = 17, height = 4 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12466, y = 1587, z = 0, width = 13, height = 49 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12463, y = 1587, z = 0, width = 3, height = 29 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12450, y = 1598, z = 0, width = 12, height = 14 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12434, y = 1584, z = 0, width = 16, height = 39 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12431, y = 1606, z = 0, width = 4, height = 14 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12460, y = 1601, z = 1, width = 32, height = 46 }, -- Louisville Police Department

		{ name = "JeffersonSD", type = "ZombiesType", x = 13778, y = 2552, z = 0, width = 10, height = 20 }, -- Jefferson County Sheriff Station

		{ name = "JeffersonPD", type = "ZombiesType", x = 13203, y = 3086, z = 0, width = 35, height = 13 }, -- Jefferson County Police Department
		{ name = "JeffersonPD", type = "ZombiesType", x = 13211, y = 3083, z = 0, width = 24, height = 3 }, -- Jefferson County Police Department
		{ name = "JeffersonPD", type = "ZombiesType", x = 13212, y = 3074, z = 0, width = 23, height = 9 }, -- Jefferson County Police Department

		{ name = "LouisvilleKSP", type = "ZombiesType", x = 12970, y = 1365, z = 0, width = 18, height = 39 }, -- Louisville Unmarked Police Station (KSP)
		{ name = "LouisvilleKSP", type = "ZombiesType", x = 12960, y = 1365, z = 0, width = 13, height = 29 }, -- Louisville Unmarked Police Station (KSP)
		{ name = "LouisvilleKSP", type = "ZombiesType", x = 12944, y = 1365, z = 0, width = 13, height = 21 }, -- Louisville Unmarked Police Station (KSP)
		{ name = "LouisvilleKSP", type = "ZombiesType", x = 12943, y = 1365, z = 1, width = 21, height = 21 }, -- Louisville Unmarked Police Station (KSP)

		-- Prison/Jail Areas
		{ name = "LouisvillePDPrison", type = "ZombiesType", x = 12403, y = 1582, z = 0, width = 24, height = 40 }, -- Louisville Police Department City Jail
		{ name = "LouisvillePDPrison", type = "ZombiesType", x = 12427, y = 1582, z = 0, width = 4, height = 26 }, -- Louisville Police Department City Jail
		{ name = "LouisvillePDPrison", type = "ZombiesType", x = 12403, y = 1583, z = 1, width = 29, height = 40 }, -- Louisville Police Department City Jail

		{ name = "JeffersonPDJail", type = "ZombiesType", x = 13205, y = 3073, z = 0, width = 6, height = 10 }, -- Jefferson County Police Department Jail Area

		{ name = "JeffersonSDJail", type = "ZombiesType", x = 13778, y = 2564, z = 0, width = 6, height = 3 }, -- Jefferson County Sheriff Department Jail Area

		{ name = "LouisvilleKSPJail", type = "ZombiesType", x = 12944, y = 1386, z = 0, width = 13, height = 8 }, -- Louisville Unmarked Police Station (KSP) Jail Area

		{ name = "RosewoodPrison", type = "ZombiesType", x = 7606, y = 11781, z = 0, width = 138, height = 196 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7744, y = 11893, z = 0, width = 22, height = 30 }, -- Rosewood Prison

		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11817, z = 1, width = 21, height = 42 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11859, z = 1, width = 24, height = 4 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11863, z = 1, width = 39, height = 13 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11876, z = 1, width = 38, height = 10 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11886, z = 1, width = 39, height = 14 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11900, z = 1, width = 22, height = 45 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7700, y = 11900, z = 1, width = 17, height = 6 }, -- Rosewood Prison

		{ name = "RosewoodPrisonMax", type = "ZombiesType", x = 7678, y = 11866, z = 1, width = 17, height = 21 }, -- Rosewood Prison Maximum Security Wing
		{ name = "RosewoodPrisonMax", type = "ZombiesType", x = 7678, y = 11887, z = 1, width = 5, height = 5 }, -- Rosewood Prison Maximum Security Wing
		{ name = "RosewoodPrisonMax", type = "ZombiesType", x = 7681, y = 11892, z = 1, width = 2, height = 1 }, -- Rosewood Prison Maximum Security Wing

		{ name = "RosewoodPrison", type = "ZombiesType", x = 7734, y = 11896, z = 1, width = 19, height = 12 }, -- Rosewood Prison Admin Building

		-- Fire Departments
		{ name = "FireDeptLV", type = "ZombiesType", x = 12349, y = 1741, z = 0, width = 23, height = 41 }, -- Louisville Slums FD
		{ name = "FireDeptLV", type = "ZombiesType", x = 12349, y = 1741, z = 1, width = 23, height = 20 }, -- Louisville Slums FD
		{ name = "FireDeptLV", type = "ZombiesType", x = 13661, y = 1767, z = 0, width = 76, height = 33 }, -- Louisville Main FD
		{ name = "FireDeptRW", type = "ZombiesType", x = 8125, y = 11731, z = 0, width = 39, height = 43 }, -- Rosewood Fire Station
		{ name = "FireDeptRW", type = "ZombiesType", x = 8128, y = 11728, z = 1, width = 17, height = 23 }, -- Rosewood Fire Station
		{ name = "FireDeptRW", type = "ZombiesType", x = 8128, y = 11751, z = 1, width = 6, height = 1 }, -- Rosewood Fire Station

		-- EMS Departments
		{ name = "MeadeEMS", type = "ZombiesType", x = 8079, y = 11526, z = 0, width = 6, height = 5 }, -- Rosewood Medical
		{ name = "LouisvilleEMS", type = "ZombiesType", x = 12417, y = 1750, z = 0, width = 8, height = 5 }, -- Louisville Medical Center
		{ name = "LouisvilleEMS", type = "ZombiesType", x = 12923, y = 2073, z = 0, width = 5, height = 3 }, -- Louisville General Hospital
		{ name = "JeffersonEMS", type = "ZombiesType", x = 12388, y = 3716, z = 0, width = 7, height = 5 }, -- St. Peregin's Hospital

		-- Rangers
		{ name = "FederalRanger", type = "ZombiesType", x = 4825, y = 6264, z = 0, width = 34, height = 33 }, -- New Ranger Station
		{ name = "State_LawRanger", type = "ZombiesType", x = 4825, y = 6264, z = 0, width = 34, height = 33 }, -- New Ranger Station
		{ name = "StateRanger", type = "ZombiesType", x = 4825, y = 6264, z = 0, width = 34, height = 33 }, -- New Ranger Station

		-- Louisville Postal Depo
		{ name = "USPS", type = "ZombiesType", x = 12614, y = 2067, z = 0, width = 28, height = 27 }, -- USPS Office
		{ name = "USPS", type = "ZombiesType", x = 12642, y = 2059, z = 0, width = 35, height = 35 }, -- USPS Parking And Garage

		-- Riverside Postal Office
		{ name = "USPS", type = "ZombiesType", x = 6301, y = 5244, z = 0, width = 24, height = 29 }, -- USPS Office

		-- WestPoint Postal Office
		{ name = "USPS", type = "ZombiesType", x = 11954, y = 6906, z = 0, width = 16, height = 15 }, -- USPS Office

		-- MarchRidge Postal Office
		{ name = "USPS", type = "ZombiesType", x = 10098, y = 12708, z = 0, width = 33, height = 22 }, -- USPS Office

		-- Rosewood Court House
		{ name = "CourtHouse", type = "ZombiesType", x = 8051, y = 11642, z = 0, width = 38, height = 29 }, -- Main Building

		-- Louisville Court House
		{ name = "CourtHouse", type = "ZombiesType", x = 12458, y = 1527, z = 0, width = 40, height = 39 }, -- Main Building

		-- Louisville Havisham Hotel
		{ name = "HotelHav", type = "ZombiesType", x = 12614, y = 1292, z = 0, width = 75, height = 37 },
		{ name = "HotelHav", type = "ZombiesType", x = 12614, y = 1292, z = 1, width = 74, height = 37 },
		{ name = "HotelHav", type = "ZombiesType", x = 12614, y = 1293, z = 2, width = 73, height = 47 },
		{ name = "HotelHav", type = "ZombiesType", x = 12616, y = 1294, z = 3, width = 57, height = 48 },
		{ name = "HotelHav", type = "ZombiesType", x = 12616, y = 1294, z = 4, width = 56, height = 48 },
		{ name = "HotelHav", type = "ZombiesType", x = 12616, y = 1296, z = 5, width = 56, height = 45 },

		-- Louisville Unnamed Fancy Hotel
		{ name = "HotelFancy", type = "ZombiesType", x = 13653, y = 1506, z = 0, width = 84, height = 48 },
		{ name = "HotelFancy", type = "ZombiesType", x = 13664, y = 1506, z = 1, width = 65, height = 38 },
		{ name = "HotelFancy", type = "ZombiesType", x = 13664, y = 1507, z = 2, width = 66, height = 37 },

		-- Grand Ohio Mall
		{ name = "MallOhio", type = "ZombiesType", x = 13515, y = 1261, z = 0, width = 109, height = 143 },
		{ name = "MallOhio", type = "ZombiesType", x = 13625, y = 1261, z = 0, width = 47, height = 73 },
		{ name = "MallOhio", type = "ZombiesType", x = 13515, y = 1261, z = 1, width = 109, height = 143 },
		{ name = "MallOhio", type = "ZombiesType", x = 13625, y = 1261, z = 1, width = 47, height = 73 },
		{ name = "MallOhio", type = "ZombiesType", x = 13515, y = 1261, z = 2, width = 109, height = 143 },
		{ name = "MallOhio", type = "ZombiesType", x = 13625, y = 1261, z = 2, width = 47, height = 73 },

		-- Valley Station Mall
		{ name = "MallValley", type = "ZombiesType", x = 13872, y = 5750, z = 0, width = 86, height = 141 },
		{ name = "MallValley", type = "ZombiesType", x = 13959, y = 5780, z = 0, width = 27, height = 111 },
		{ name = "MallValley", type = "ZombiesType", x = 13987, y = 5797, z = 0, width = 13, height = 94 },
		{ name = "MallValley", type = "ZombiesType", x = 13909, y = 5892, z = 0, width = 57, height = 17 },
		{ name = "MallValley", type = "ZombiesType", x = 13967, y = 5892, z = 0, width = 33, height = 7 },
		{ name = "MallValley", type = "ZombiesType", x = 13872, y = 5750, z = 1, width = 86, height = 141 },
		{ name = "MallValley", type = "ZombiesType", x = 13959, y = 5780, z = 1, width = 27, height = 111 },
		{ name = "MallValley", type = "ZombiesType", x = 13987, y = 5797, z = 1, width = 13, height = 94 },
		{ name = "MallValley", type = "ZombiesType", x = 13909, y = 5892, z = 1, width = 57, height = 17 },
		{ name = "MallValley", type = "ZombiesType", x = 13967, y = 5892, z = 1, width = 33, height = 7 },
		{ name = "MallValley", type = "ZombiesType", x = 13872, y = 5750, z = 2, width = 86, height = 141 },
		{ name = "MallValley", type = "ZombiesType", x = 13959, y = 5780, z = 2, width = 27, height = 111 },
		{ name = "MallValley", type = "ZombiesType", x = 13987, y = 5797, z = 2, width = 13, height = 94 },
		{ name = "MallValley", type = "ZombiesType", x = 13909, y = 5892, z = 2, width = 57, height = 17 },
		{ name = "MallValley", type = "ZombiesType", x = 13967, y = 5892, z = 2, width = 33, height = 7 },

		-- Louisville Mall
		{ name = "MallLV", type = "ZombiesType", x = 13300, y = 3044, z = 0, width = 101, height = 41 },
		{ name = "MallLV", type = "ZombiesType", x = 13300, y = 3044, z = 1, width = 101, height = 41 },

		-- Sky Blue Bank North Louisville
		{ name = "BankSecurity", type = "ZombiesType", x = 13116, y = 2159, z = 0, width = 20, height = 18 },
		{ name = "BankSecurity", type = "ZombiesType", x = 13114, y = 2157, z = 1, width = 22, height = 19 },

		-- Knox Bank South Louisville
		{ name = "BankSecurity", type = "ZombiesType", x = 13593, y = 3013, z = 0, width = 18, height = 23 },
		{ name = "BankSecurity", type = "ZombiesType", x = 13593, y = 3012, z = 1, width = 16, height = 20 },

		-- Knox Bank Louisville
		{ name = "BankSecurity", type = "ZombiesType", x = 12531, y = 2583, z = 0, width = 19, height = 18 },

		-- Riverside Knox Bank
		{ name = "BankSecurity", type = "ZombiesType", x = 6509, y = 5298, z = 0, width = 11, height = 24 },
		{ name = "BankSecurity", type = "ZombiesType", x = 6499, y = 5298, z = 0, width = 10, height = 11 },

		-- WestPoint Knox Bank
		{ name = "BankSecurity", type = "ZombiesType", x = 11897, y = 6911, z = 0, width = 20, height = 20 },

		-- Valley Station Knox Bank
		{ name = "BankSecurity", type = "ZombiesType", x = 13652, y = 5736, z = 0, width = 16, height = 26 },

		-- Muldraugh Knox Bank
		{ name = "BankSecurity", type = "ZombiesType", x = 10626, y = 9688, z = 0, width = 10, height = 21 },

		-- Rosewood Knox Bank
		{ name = "BankSecurity", type = "ZombiesType", x = 8082, y = 11589, z = 0, width = 17, height = 16 },

		}
	end
end

-- Check if only the custom loot zones are enabled in sandbox options
if SandboxVars.STR.LootZones and not SandboxVars.STR.CustomZones then

	if not getActivatedMods():contains("NewEkron") then

	objects = {
		-- Loot Zones
		-- Police Areas
		{ name = "RosewoodSDL", type = "LootZone", x = 8048, y = 11724, z = 0, width = 5, height = 6}, -- Rosewood Sheriff Station Lockers
		{ name = "RosewoodSDL", type = "LootZone", x = 8056, y = 11724, z = 0, width = 4, height = 1}, -- Rosewood Sheriff Station Lockers

		{ name = "MuldraughPDL", type = "LootZone", x = 10639, y = 10400, z = 0, width = 1, height = 2}, -- Muldraugh Police Station Lockers

		{ name = "MeadeSOL", type = "LootZone", x = 7251, y = 8371, z = 0, width = 1, height = 2}, -- Ekron Sheriff Station Lockers

		{ name = "WestPointPDL", type = "LootZone", x = 11894, y = 6935, z = 0, width = 4, height = 1}, -- WestPoint Police Station Lockers

		{ name = "RiversidePDL", type = "LootZone", x = 6087, y = 5265, z = 0, width = 1, height = 2}, -- Riverside Police Station Lockers

		{ name = "LouisvillePDL", type = "LootZone", x = 12472, y = 1599, z = 0, width = 1, height = 4}, -- Louisville Police Station Lockers
		{ name = "LouisvillePDL", type = "LootZone", x = 12476, y = 1601, z = 0, width = 2, height = 5}, -- Louisville Police Station Lockers
		{ name = "LouisvillePDL", type = "LootZone", x = 12481, y = 1600, z = 0, width = 1, height = 7}, -- Louisville Police Station Lockers

		{ name = "JeffersonSDL", type = "LootZone", x = 13778, y = 2558, z = 0, width = 2, height = 1}, -- Jefferson County Sheriff Station Lockers

		{ name = "JeffersonPDL", type = "LootZone", x = 13217, y = 3073, z = 0, width = 1, height = 6}, -- Jefferson County Police Department Lockers
		{ name = "JeffersonPDL", type = "LootZone", x = 13221, y = 3073, z = 0, width = 1, height = 6}, -- Jefferson County Police Department Lockers

		{ name = "LouisvilleKSPL", type = "LootZone", x = 12970, y = 1393, z = 0, width = 1, height = 6 }, -- Louisville Unmarked Police Station (KSP) Lockers
		{ name = "LouisvilleKSPL", type = "LootZone", x = 12984, y = 1396, z = 0, width = 4, height = 1 }, -- Louisville Unmarked Police Station (KSP) Lockers
		{ name = "LouisvilleKSPL", type = "LootZone", x = 12975, y = 1365, z = 0, width = 1, height = 8 }, -- Louisville Unmarked Police Station (KSP) Lockers

		-- Prison/Jail Areas
		{ name = "RosewoodPrisonL", type = "LootZone", x = 7741, y = 11908, z = 0, width = 2, height = 1 }, -- Rosewood Prison Lockers Admin Building
		{ name = "RosewoodPrisonL", type = "LootZone", x = 7744, y = 11908, z = 0, width = 2, height = 1 }, -- Rosewood Prison Lockers Admin Building
		{ name = "RosewoodPrisonL", type = "LootZone", x = 7747, y = 11908, z = 0, width = 2, height = 1 }, -- Rosewood Prison Lockers Admin Building

		-- { name = "RosewoodPrisonL", type = "LootZone", x = 7741, y = 11903, z = 0, width = 1, height = 2 }, -- Rosewood Prison Lockers Admin Building

		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7650, y = 11825, z = 0, width = 1, height = 1 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7640, y = 11814, z = 0, width = 1, height = 4 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7640, y = 11819, z = 0, width = 1, height = 4 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7641, y = 11814, z = 0, width = 1, height = 1 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7643, y = 11814, z = 0, width = 2, height = 4 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7643, y = 11819, z = 0, width = 2, height = 4 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7647, y = 11814, z = 0, width = 5, height = 1 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7645, y = 11816, z = 0, width = 1, height = 1 }, -- Rosewood Prison Inmate Laundry Room

		{ name = "RosewoodPrisonInmateCellL", type = "LootZone", x = 7678, y = 11817, z = 0, width = 1, height = 37 }, -- Rosewood Prison Inmate North Cell Block
		{ name = "RosewoodPrisonInmateCellL", type = "LootZone", x = 7698, y = 11817, z = 0, width = 1, height = 37 }, -- Rosewood Prison Inmate North Cell Block

		{ name = "RosewoodPrisonInmateCellL", type = "LootZone", x = 7678, y = 11896, z = 0, width = 1, height = 49 }, -- Rosewood Prison Inmate South Cell Block
		{ name = "RosewoodPrisonInmateCellL", type = "LootZone", x = 7699, y = 11906, z = 0, width = 1, height = 39 }, -- Rosewood Prison Inmate South Cell Block

		{ name = "RosewoodPrisonInmateMaxCellL", type = "LootZone", x = 7681, y = 11868, z = 0, width = 1, height = 9 }, -- Rosewood Prison Inmate Maximum Security Cell Block
		{ name = "RosewoodPrisonInmateMaxCellL", type = "LootZone", x = 7693, y = 11869, z = 0, width = 1, height = 13 }, -- Rosewood Prison Inmate Maximum Security Cell Block

		{ name = "LouisvillePDPrisonCellL", type = "LootZone", x = 12404, y = 1586, z = 0, width = 1, height = 37 }, -- Louisville Police Department City Jail Cell Block
		{ name = "LouisvillePDPrisonCellL", type = "LootZone", x = 12417, y = 1587, z = 0, width = 1, height = 33 }, -- Louisville Police Department City Jail Cell Block
		{ name = "LouisvillePDPrisonCellL", type = "LootZone", x = 12418, y = 1590, z = 0, width = 1, height = 33 }, -- Louisville Police Department City Jail Cell Block
		{ name = "LouisvillePDPrisonCellL", type = "LootZone", x = 12431, y = 1587, z = 0, width = 1, height = 33 }, -- Louisville Police Department City Jail Cell Block

		{ name = "LouisvillePDPrisonL", type = "LootZone", x = 12428, y = 1610, z = 0, width = 1, height = 8 }, -- Louisville Police Department City Jail Laundry Room
		{ name = "LouisvillePDPrisonL", type = "LootZone", x = 12431, y = 1610, z = 0, width = 1, height = 5 }, -- Louisville Police Department City Jail Laundry Room
		{ name = "LouisvillePDPrisonL", type = "LootZone", x = 12430, y = 1615, z = 0, width = 1, height = 1 }, -- Louisville Police Department City Jail Laundry Room
		{ name = "LouisvillePDPrisonL", type = "LootZone", x = 12432, y = 1618, z = 0, width = 1, height = 1 }, -- Louisville Police Department City Jail Laundry Room
		{ name = "LouisvillePDPrisonL", type = "LootZone", x = 12428, y = 1609, z = 0, width = 4, height = 1 }, -- Louisville Police Department City Jail Laundry Room

		-- Fire Departments
		{ name = "FireDeptRWL", type = "LootZone", x = 8128, y = 11728, z = 0, width = 2, height = 1 }, -- Rosewood Fire Station Lockers
		{ name = "FireDeptRWL", type = "LootZone", x = 8131, y = 11728, z = 0, width = 2, height = 1 }, -- Rosewood Fire Station Lockers
		{ name = "FireDeptRWL", type = "LootZone", x = 8134, y = 11728, z = 0, width = 2, height = 1 }, -- Rosewood Fire Station Lockers
		{ name = "FireDeptRWL", type = "LootZone", x = 8157, y = 11738, z = 0, width = 1, height = 3 }, -- Rosewood Fire Station Lockers
		-- { name = "FireDeptRWL", type = "LootZone", x = 8145, y = 11728, z = 0, width = 1, height = 4 }, -- Rosewood Fire Station Storage
		-- { name = "FireDeptRWL", type = "LootZone", x = 8147, y = 11728, z = 0, width = 2, height = 1 }, -- Rosewood Fire Station Storage

		{ name = "FireDeptLVL", type = "LootZone", x = 12349, y = 1745, z = 0, width = 1, height = 3 }, -- Louisville Slums FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 12349, y = 1749, z = 0, width = 1, height = 3 }, -- Louisville Slums FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 12354, y = 1746, z = 0, width = 1, height = 3 }, -- Louisville Slums FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 12350, y = 1776, z = 0, width = 3, height = 1 }, -- Louisville Slums FD Lockers

		{ name = "FireDeptLVL", type = "LootZone", x = 13660, y = 1768, z = 0, width = 4, height = 1 }, -- Louisville Main FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 13695, y = 1771, z = 0, width = 3, height = 1 }, -- Louisville Main FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 13719, y = 1767, z = 0, width = 3, height = 1 }, -- Louisville Main FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 13723, y = 1767, z = 0, width = 3, height = 1 }, -- Louisville Main FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 13722, y = 1772, z = 0, width = 3, height = 1 }, -- Louisville Main FD Lockers

		-- Meade County EMS
		{ name = "MeadeEMSL", type = "LootZone", x = 8082, y = 11531, z = 0, width = 1, height = 2 }, -- Rosewood Medical Storage
		{ name = "LouisvilleEMSL", type = "LootZone", x = 12417, y = 1753, z = 0, width = 1, height = 1 }, -- Louisville Medical Storage
		{ name = "LouisvilleEMSL", type = "LootZone", x = 12923, y = 2073, z = 0, width = 1, height = 2 }, -- Louisville General Hospital Storage
		{ name = "JeffersonEMSL", type = "LootZone", x = 12391, y = 3716, z = 0, width = 3, height = 1 }, -- St. Peregin's Hospital Storage

		-- Louisville Postal Depo
		{ name = "USPSL", type = "LootZone", x = 12673, y = 2065, z = 0, width = 4, height = 5 }, -- USPS Garage Lockers
		{ name = "USPSL", type = "LootZone", x = 12629, y = 2082, z = 0, width = 1, height = 2 }, -- USPS Office Locker Closet

		-- Riverside Postal Office
		{ name = "USPSL", type = "LootZone", x = 6309, y = 5258, z = 0, width = 2, height = 1 }, -- USPS Office Locker Closet

		-- Grand Ohio Mall
		{ name = "MallOhioL", type = "LootZone", x = 13616, y = 1333, z = 0, width = 1, height = 1 },

		-- Valley Station Mall
		{ name = "MallValleyL", type = "LootZone", x = 13897, y = 5888, z = 0, width = 1, height = 2 },

		}
	end

	if getActivatedMods():contains("NewEkron") then

	objects = {
		-- Loot Zones
		-- Police Areas
		{ name = "RosewoodSDL", type = "LootZone", x = 8048, y = 11724, z = 0, width = 5, height = 6}, -- Rosewood Sheriff Station Lockers
		{ name = "RosewoodSDL", type = "LootZone", x = 8056, y = 11724, z = 0, width = 4, height = 1}, -- Rosewood Sheriff Station Lockers

		{ name = "MuldraughPDL", type = "LootZone", x = 10639, y = 10400, z = 0, width = 1, height = 2}, -- Muldraugh Police Station Lockers

		{ name = "MeadeSOL", type = "LootZone", x = 7081, y = 8309, z = 0, width = 4, height = 1}, -- Ekron Sheriff Station Lockers

		{ name = "WestPointPDL", type = "LootZone", x = 11894, y = 6935, z = 0, width = 4, height = 1}, -- WestPoint Police Station Lockers

		{ name = "RiversidePDL", type = "LootZone", x = 6087, y = 5265, z = 0, width = 1, height = 2}, -- Riverside Police Station Lockers

		{ name = "LouisvillePDL", type = "LootZone", x = 12472, y = 1599, z = 0, width = 1, height = 4}, -- Louisville Police Station Lockers
		{ name = "LouisvillePDL", type = "LootZone", x = 12476, y = 1601, z = 0, width = 2, height = 5}, -- Louisville Police Station Lockers
		{ name = "LouisvillePDL", type = "LootZone", x = 12481, y = 1600, z = 0, width = 1, height = 7}, -- Louisville Police Station Lockers

		{ name = "JeffersonSDL", type = "LootZone", x = 13778, y = 2558, z = 0, width = 2, height = 1}, -- Jefferson County Sheriff Station Lockers

		{ name = "JeffersonPDL", type = "LootZone", x = 13217, y = 3073, z = 0, width = 1, height = 6}, -- Jefferson County Police Department Lockers
		{ name = "JeffersonPDL", type = "LootZone", x = 13221, y = 3073, z = 0, width = 1, height = 6}, -- Jefferson County Police Department Lockers

		{ name = "LouisvilleKSPL", type = "LootZone", x = 12970, y = 1393, z = 0, width = 1, height = 6 }, -- Louisville Unmarked Police Station (KSP) Lockers
		{ name = "LouisvilleKSPL", type = "LootZone", x = 12984, y = 1396, z = 0, width = 4, height = 1 }, -- Louisville Unmarked Police Station (KSP) Lockers
		{ name = "LouisvilleKSPL", type = "LootZone", x = 12975, y = 1365, z = 0, width = 1, height = 8 }, -- Louisville Unmarked Police Station (KSP) Lockers

		-- Prison/Jail Areas
		{ name = "RosewoodPrisonL", type = "LootZone", x = 7741, y = 11908, z = 0, width = 2, height = 1 }, -- Rosewood Prison Lockers Admin Building
		{ name = "RosewoodPrisonL", type = "LootZone", x = 7744, y = 11908, z = 0, width = 2, height = 1 }, -- Rosewood Prison Lockers Admin Building
		{ name = "RosewoodPrisonL", type = "LootZone", x = 7747, y = 11908, z = 0, width = 2, height = 1 }, -- Rosewood Prison Lockers Admin Building

		-- { name = "RosewoodPrisonL", type = "LootZone", x = 7741, y = 11903, z = 0, width = 1, height = 2 }, -- Rosewood Prison Lockers Admin Building

		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7650, y = 11825, z = 0, width = 1, height = 1 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7640, y = 11814, z = 0, width = 1, height = 4 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7640, y = 11819, z = 0, width = 1, height = 4 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7641, y = 11814, z = 0, width = 1, height = 1 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7643, y = 11814, z = 0, width = 2, height = 4 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7643, y = 11819, z = 0, width = 2, height = 4 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7647, y = 11814, z = 0, width = 5, height = 1 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7645, y = 11816, z = 0, width = 1, height = 1 }, -- Rosewood Prison Inmate Laundry Room

		{ name = "RosewoodPrisonInmateCellL", type = "LootZone", x = 7678, y = 11817, z = 0, width = 1, height = 37 }, -- Rosewood Prison Inmate North Cell Block
		{ name = "RosewoodPrisonInmateCellL", type = "LootZone", x = 7698, y = 11817, z = 0, width = 1, height = 37 }, -- Rosewood Prison Inmate North Cell Block

		{ name = "RosewoodPrisonInmateCellL", type = "LootZone", x = 7678, y = 11896, z = 0, width = 1, height = 49 }, -- Rosewood Prison Inmate South Cell Block
		{ name = "RosewoodPrisonInmateCellL", type = "LootZone", x = 7699, y = 11906, z = 0, width = 1, height = 39 }, -- Rosewood Prison Inmate South Cell Block

		{ name = "RosewoodPrisonInmateMaxCellL", type = "LootZone", x = 7681, y = 11868, z = 0, width = 1, height = 9 }, -- Rosewood Prison Inmate Maximum Security Cell Block
		{ name = "RosewoodPrisonInmateMaxCellL", type = "LootZone", x = 7693, y = 11869, z = 0, width = 1, height = 13 }, -- Rosewood Prison Inmate Maximum Security Cell Block

		{ name = "LouisvillePDPrisonCellL", type = "LootZone", x = 12404, y = 1586, z = 0, width = 1, height = 37 }, -- Louisville Police Department City Jail Cell Block
		{ name = "LouisvillePDPrisonCellL", type = "LootZone", x = 12417, y = 1587, z = 0, width = 1, height = 33 }, -- Louisville Police Department City Jail Cell Block
		{ name = "LouisvillePDPrisonCellL", type = "LootZone", x = 12418, y = 1590, z = 0, width = 1, height = 33 }, -- Louisville Police Department City Jail Cell Block
		{ name = "LouisvillePDPrisonCellL", type = "LootZone", x = 12431, y = 1587, z = 0, width = 1, height = 33 }, -- Louisville Police Department City Jail Cell Block

		{ name = "LouisvillePDPrisonL", type = "LootZone", x = 12428, y = 1610, z = 0, width = 1, height = 8 }, -- Louisville Police Department City Jail Laundry Room
		{ name = "LouisvillePDPrisonL", type = "LootZone", x = 12431, y = 1610, z = 0, width = 1, height = 5 }, -- Louisville Police Department City Jail Laundry Room
		{ name = "LouisvillePDPrisonL", type = "LootZone", x = 12430, y = 1615, z = 0, width = 1, height = 1 }, -- Louisville Police Department City Jail Laundry Room
		{ name = "LouisvillePDPrisonL", type = "LootZone", x = 12432, y = 1618, z = 0, width = 1, height = 1 }, -- Louisville Police Department City Jail Laundry Room
		{ name = "LouisvillePDPrisonL", type = "LootZone", x = 12428, y = 1609, z = 0, width = 4, height = 1 }, -- Louisville Police Department City Jail Laundry Room

		-- Fire Departments
		{ name = "FireDeptRWL", type = "LootZone", x = 8128, y = 11728, z = 0, width = 2, height = 1 }, -- Rosewood Fire Station Lockers
		{ name = "FireDeptRWL", type = "LootZone", x = 8131, y = 11728, z = 0, width = 2, height = 1 }, -- Rosewood Fire Station Lockers
		{ name = "FireDeptRWL", type = "LootZone", x = 8134, y = 11728, z = 0, width = 2, height = 1 }, -- Rosewood Fire Station Lockers
		{ name = "FireDeptRWL", type = "LootZone", x = 8157, y = 11738, z = 0, width = 1, height = 3 }, -- Rosewood Fire Station Lockers
		-- { name = "FireDeptRWL", type = "LootZone", x = 8145, y = 11728, z = 0, width = 1, height = 4 }, -- Rosewood Fire Station Storage
		-- { name = "FireDeptRWL", type = "LootZone", x = 8147, y = 11728, z = 0, width = 2, height = 1 }, -- Rosewood Fire Station Storage

		{ name = "FireDeptLVL", type = "LootZone", x = 12349, y = 1745, z = 0, width = 1, height = 3 }, -- Louisville Slums FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 12349, y = 1749, z = 0, width = 1, height = 3 }, -- Louisville Slums FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 12354, y = 1746, z = 0, width = 1, height = 3 }, -- Louisville Slums FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 12350, y = 1776, z = 0, width = 3, height = 1 }, -- Louisville Slums FD Lockers

		{ name = "FireDeptLVL", type = "LootZone", x = 13660, y = 1768, z = 0, width = 4, height = 1 }, -- Louisville Main FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 13695, y = 1771, z = 0, width = 3, height = 1 }, -- Louisville Main FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 13719, y = 1767, z = 0, width = 3, height = 1 }, -- Louisville Main FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 13723, y = 1767, z = 0, width = 3, height = 1 }, -- Louisville Main FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 13722, y = 1772, z = 0, width = 3, height = 1 }, -- Louisville Main FD Lockers

		{ name = "FireDeptMCL", type = "LootZone", x = 7389, y = 8359, z = 0, width = 5, height = 1 }, -- New Ekron FD Lockers

		-- Meade County EMS
		{ name = "MeadeEMSL", type = "LootZone", x = 8082, y = 11531, z = 0, width = 1, height = 2 }, -- Rosewood Medical Storage
		{ name = "LouisvilleEMSL", type = "LootZone", x = 12417, y = 1753, z = 0, width = 1, height = 1 }, -- Louisville Medical Storage
		{ name = "LouisvilleEMSL", type = "LootZone", x = 12923, y = 2073, z = 0, width = 1, height = 2 }, -- Louisville General Hospital Storage
		{ name = "JeffersonEMSL", type = "LootZone", x = 12391, y = 3716, z = 0, width = 3, height = 1 }, -- St. Peregin's Hospital Storage

		-- Louisville Postal Depo
		{ name = "USPSL", type = "LootZone", x = 12673, y = 2065, z = 0, width = 4, height = 5 }, -- Garage Lockers
		{ name = "USPSL", type = "LootZone", x = 12629, y = 2082, z = 0, width = 1, height = 2 }, -- Office Locker Closet

		-- Riverside Postal Office
		{ name = "USPSL", type = "LootZone", x = 6309, y = 5258, z = 0, width = 2, height = 1 }, -- USPS Office Locker Closet

		-- Grand Ohio Mall
		{ name = "MallOhioL", type = "LootZone", x = 13616, y = 1333, z = 0, width = 1, height = 1 },

		-- Valley Station Mall
		{ name = "MallValleyL", type = "LootZone", x = 13897, y = 5888, z = 0, width = 1, height = 2 },

		}
	end
end

-- Check if both the custom loot zones and the custom zones are enabled in sandbox options
if SandboxVars.STR.LootZones and SandboxVars.STR.CustomZones then

	if not getActivatedMods():contains("NewEkron") then

	objects = {

		-- Zombie Spawn Zones
		-- Police Areas
		{ name = "RiversidePD", type = "ZombiesType", x = 6079, y = 5249, z = 0, width = 23, height = 27}, -- Riverside Police Station
		{ name = "WestPointPD", type = "ZombiesType", x = 11876, y = 6935, z = 0, width = 42, height = 25}, -- WestPoint Police Station
		{ name = "MeadeSO", type = "ZombiesType", x = 7252, y = 8366, z = 0, width = 12, height = 23}, -- Ekron Sheriff Station
		{ name = "MuldraughPD", type = "ZombiesType", x = 10630, y = 10400, z = 0, width = 28, height = 42}, -- Muldraugh Police Station
		{ name = "RosewoodSD", type = "ZombiesType", x = 8043, y = 11703, z = 0, width = 50, height = 62}, -- Rosewood Sheriff Station

		-- Picnic Areas
		{ name = "MeadeRangers", type = "ZombiesType", x = 12010, y = 7354, z = 0, width = 56, height = 70}, -- WestPoint Picnic Area
		{ name = "MeadeRangers", type = "ZombiesType", x = 10980, y = 9629, z = 0, width = 35, height = 35}, -- Muldraugh Picnic Area
		{ name = "MeadeRangers", type = "ZombiesType", x = 11543, y = 8851, z = 0, width = 30, height = 40}, -- Dixie Picnic Area

		-- Louisville
		{ name = "LouisvillePD", type = "ZombiesType", x = 12479, y = 1581, z = 0, width = 9, height = 63 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12466, y = 1640, z = 0, width = 25, height = 10 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12466, y = 1636, z = 0, width = 17, height = 4 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12466, y = 1587, z = 0, width = 13, height = 49 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12463, y = 1587, z = 0, width = 3, height = 29 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12450, y = 1598, z = 0, width = 12, height = 14 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12434, y = 1584, z = 0, width = 16, height = 39 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12431, y = 1606, z = 0, width = 4, height = 14 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12460, y = 1601, z = 1, width = 32, height = 46 }, -- Louisville Police Department

		{ name = "JeffersonSD", type = "ZombiesType", x = 13778, y = 2552, z = 0, width = 10, height = 20 }, -- Jefferson County Sheriff Station

		{ name = "JeffersonPD", type = "ZombiesType", x = 13203, y = 3086, z = 0, width = 35, height = 13 }, -- Jefferson County Police Department
		{ name = "JeffersonPD", type = "ZombiesType", x = 13211, y = 3083, z = 0, width = 24, height = 3 }, -- Jefferson County Police Department
		{ name = "JeffersonPD", type = "ZombiesType", x = 13212, y = 3074, z = 0, width = 23, height = 9 }, -- Jefferson County Police Department

		{ name = "LouisvilleKSP", type = "ZombiesType", x = 12970, y = 1365, z = 0, width = 18, height = 39 }, -- Louisville Unmarked Police Station (KSP)
		{ name = "LouisvilleKSP", type = "ZombiesType", x = 12960, y = 1365, z = 0, width = 13, height = 29 }, -- Louisville Unmarked Police Station (KSP)
		{ name = "LouisvilleKSP", type = "ZombiesType", x = 12944, y = 1365, z = 0, width = 13, height = 21 }, -- Louisville Unmarked Police Station (KSP)
		{ name = "LouisvilleKSP", type = "ZombiesType", x = 12943, y = 1365, z = 1, width = 21, height = 21 }, -- Louisville Unmarked Police Station (KSP)

		-- Prison/Jail Areas
		{ name = "LouisvillePDPrison", type = "ZombiesType", x = 12403, y = 1582, z = 0, width = 24, height = 40 }, -- Louisville Police Department City Jail
		{ name = "LouisvillePDPrison", type = "ZombiesType", x = 12427, y = 1582, z = 0, width = 4, height = 26 }, -- Louisville Police Department City Jail
		{ name = "LouisvillePDPrison", type = "ZombiesType", x = 12403, y = 1583, z = 1, width = 29, height = 40 }, -- Louisville Police Department City Jail

		{ name = "JeffersonPDJail", type = "ZombiesType", x = 13205, y = 3073, z = 0, width = 6, height = 10 }, -- Jefferson County Police Department Jail Area

		{ name = "JeffersonSDJail", type = "ZombiesType", x = 13778, y = 2564, z = 0, width = 6, height = 3 }, -- Jefferson County Sheriff Department Jail Area

		{ name = "LouisvilleKSPJail", type = "ZombiesType", x = 12944, y = 1386, z = 0, width = 13, height = 8 }, -- Louisville Unmarked Police Station (KSP) Jail Area

		{ name = "RosewoodPrison", type = "ZombiesType", x = 7606, y = 11781, z = 0, width = 138, height = 196 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7744, y = 11893, z = 0, width = 22, height = 30 }, -- Rosewood Prison

		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11817, z = 1, width = 21, height = 42 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11859, z = 1, width = 24, height = 4 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11863, z = 1, width = 39, height = 13 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11876, z = 1, width = 38, height = 10 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11886, z = 1, width = 39, height = 14 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11900, z = 1, width = 22, height = 45 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7700, y = 11900, z = 1, width = 17, height = 6 }, -- Rosewood Prison

		{ name = "RosewoodPrisonMax", type = "ZombiesType", x = 7678, y = 11866, z = 1, width = 17, height = 21 }, -- Rosewood Prison Maximum Security Wing
		{ name = "RosewoodPrisonMax", type = "ZombiesType", x = 7678, y = 11887, z = 1, width = 5, height = 5 }, -- Rosewood Prison Maximum Security Wing
		{ name = "RosewoodPrisonMax", type = "ZombiesType", x = 7681, y = 11892, z = 1, width = 2, height = 1 }, -- Rosewood Prison Maximum Security Wing

		{ name = "RosewoodPrison", type = "ZombiesType", x = 7734, y = 11896, z = 1, width = 19, height = 12 }, -- Rosewood Prison Admin Building

		-- Fire Departments
		{ name = "FireDeptLV", type = "ZombiesType", x = 12349, y = 1741, z = 0, width = 23, height = 41 }, -- Louisville Slums FD
		{ name = "FireDeptLV", type = "ZombiesType", x = 12349, y = 1741, z = 1, width = 23, height = 20 }, -- Louisville Slums FD
		{ name = "FireDeptLV", type = "ZombiesType", x = 13661, y = 1767, z = 0, width = 76, height = 33 }, -- Louisville Main FD
		{ name = "FireDeptRW", type = "ZombiesType", x = 8125, y = 11731, z = 0, width = 39, height = 43 }, -- Rosewood Fire Station
		{ name = "FireDeptRW", type = "ZombiesType", x = 8128, y = 11728, z = 1, width = 17, height = 23 }, -- Rosewood Fire Station
		{ name = "FireDeptRW", type = "ZombiesType", x = 8128, y = 11751, z = 1, width = 6, height = 1 }, -- Rosewood Fire Station

		-- EMS Departments
		{ name = "MeadeEMS", type = "ZombiesType", x = 8079, y = 11526, z = 0, width = 6, height = 5 }, -- Rosewood Medical
		{ name = "LouisvilleEMS", type = "ZombiesType", x = 12417, y = 1750, z = 0, width = 8, height = 5 }, -- Louisville Medical Center
		{ name = "LouisvilleEMS", type = "ZombiesType", x = 12923, y = 2073, z = 0, width = 5, height = 3 }, -- Louisville General Hospital
		{ name = "JeffersonEMS", type = "ZombiesType", x = 12388, y = 3716, z = 0, width = 7, height = 5 }, -- St. Peregin's Hospital

		-- Rangers
		{ name = "MeadeRangers", type = "ZombiesType", x = 4825, y = 6264, z = 0, width = 34, height = 33 }, -- New Ranger Station
		{ name = "MeadeRangers", type = "ZombiesType", x = 4825, y = 6264, z = 0, width = 34, height = 33 }, -- New Ranger Station
		{ name = "MeadeRangers", type = "ZombiesType", x = 4825, y = 6264, z = 0, width = 34, height = 33 }, -- New Ranger Station

		-- Louisville Postal Depo
		{ name = "USPS", type = "ZombiesType", x = 12614, y = 2067, z = 0, width = 28, height = 27 }, -- USPS Office
		{ name = "USPS", type = "ZombiesType", x = 12642, y = 2059, z = 0, width = 35, height = 35 }, -- USPS Parking And Garage

		-- Riverside Postal Office
		{ name = "USPS", type = "ZombiesType", x = 6301, y = 5244, z = 0, width = 24, height = 29 }, -- USPS Office

		-- WestPoint Postal Office
		{ name = "USPS", type = "ZombiesType", x = 11954, y = 6906, z = 0, width = 16, height = 15 }, -- USPS Office

		-- MarchRidge Postal Office
		{ name = "USPS", type = "ZombiesType", x = 10098, y = 12708, z = 0, width = 33, height = 22 }, -- USPS Office

		-- Rosewood Court House
		{ name = "CourtHouse", type = "ZombiesType", x = 8051, y = 11642, z = 0, width = 38, height = 29 }, -- Main Building

		-- Louisville Court House
		{ name = "CourtHouse", type = "ZombiesType", x = 12458, y = 1527, z = 0, width = 40, height = 39 }, -- Main Building

		-- Louisville Havisham Hotel
		{ name = "HotelHav", type = "ZombiesType", x = 12614, y = 1292, z = 0, width = 75, height = 37 },
		{ name = "HotelHav", type = "ZombiesType", x = 12614, y = 1292, z = 1, width = 74, height = 37 },
		{ name = "HotelHav", type = "ZombiesType", x = 12614, y = 1293, z = 2, width = 73, height = 47 },
		{ name = "HotelHav", type = "ZombiesType", x = 12616, y = 1294, z = 3, width = 57, height = 48 },
		{ name = "HotelHav", type = "ZombiesType", x = 12616, y = 1294, z = 4, width = 56, height = 48 },
		{ name = "HotelHav", type = "ZombiesType", x = 12616, y = 1296, z = 5, width = 56, height = 45 },

		-- Louisville Unnamed Fancy Hotel
		{ name = "HotelFancy", type = "ZombiesType", x = 13653, y = 1506, z = 0, width = 84, height = 48 },
		{ name = "HotelFancy", type = "ZombiesType", x = 13664, y = 1506, z = 1, width = 65, height = 38 },
		{ name = "HotelFancy", type = "ZombiesType", x = 13664, y = 1507, z = 2, width = 66, height = 37 },

		-- Grand Ohio Mall
		{ name = "MallOhio", type = "ZombiesType", x = 13515, y = 1261, z = 0, width = 109, height = 143 },
		{ name = "MallOhio", type = "ZombiesType", x = 13625, y = 1261, z = 0, width = 47, height = 73 },
		{ name = "MallOhio", type = "ZombiesType", x = 13515, y = 1261, z = 1, width = 109, height = 143 },
		{ name = "MallOhio", type = "ZombiesType", x = 13625, y = 1261, z = 1, width = 47, height = 73 },
		{ name = "MallOhio", type = "ZombiesType", x = 13515, y = 1261, z = 2, width = 109, height = 143 },
		{ name = "MallOhio", type = "ZombiesType", x = 13625, y = 1261, z = 2, width = 47, height = 73 },

		-- Valley Station Mall
		{ name = "MallValley", type = "ZombiesType", x = 13872, y = 5750, z = 0, width = 86, height = 141 },
		{ name = "MallValley", type = "ZombiesType", x = 13959, y = 5780, z = 0, width = 27, height = 111 },
		{ name = "MallValley", type = "ZombiesType", x = 13987, y = 5797, z = 0, width = 13, height = 94 },
		{ name = "MallValley", type = "ZombiesType", x = 13909, y = 5892, z = 0, width = 57, height = 17 },
		{ name = "MallValley", type = "ZombiesType", x = 13967, y = 5892, z = 0, width = 33, height = 7 },
		{ name = "MallValley", type = "ZombiesType", x = 13872, y = 5750, z = 1, width = 86, height = 141 },
		{ name = "MallValley", type = "ZombiesType", x = 13959, y = 5780, z = 1, width = 27, height = 111 },
		{ name = "MallValley", type = "ZombiesType", x = 13987, y = 5797, z = 1, width = 13, height = 94 },
		{ name = "MallValley", type = "ZombiesType", x = 13909, y = 5892, z = 1, width = 57, height = 17 },
		{ name = "MallValley", type = "ZombiesType", x = 13967, y = 5892, z = 1, width = 33, height = 7 },
		{ name = "MallValley", type = "ZombiesType", x = 13872, y = 5750, z = 2, width = 86, height = 141 },
		{ name = "MallValley", type = "ZombiesType", x = 13959, y = 5780, z = 2, width = 27, height = 111 },
		{ name = "MallValley", type = "ZombiesType", x = 13987, y = 5797, z = 2, width = 13, height = 94 },
		{ name = "MallValley", type = "ZombiesType", x = 13909, y = 5892, z = 2, width = 57, height = 17 },
		{ name = "MallValley", type = "ZombiesType", x = 13967, y = 5892, z = 2, width = 33, height = 7 },

		-- Louisville Mall
		{ name = "MallLV", type = "ZombiesType", x = 13300, y = 3044, z = 0, width = 101, height = 41 },
		{ name = "MallLV", type = "ZombiesType", x = 13300, y = 3044, z = 1, width = 101, height = 41 },

		-- Loot Zones
		-- Police Areas
		{ name = "RosewoodSDL", type = "LootZone", x = 8048, y = 11724, z = 0, width = 5, height = 6}, --  Rosewood Sheriff Station Lockers
		{ name = "RosewoodSDL", type = "LootZone", x = 8056, y = 11724, z = 0, width = 4, height = 1}, --  Rosewood Sheriff Station Lockers

		{ name = "MuldraughPDL", type = "LootZone", x = 10639, y = 10400, z = 0, width = 1, height = 2}, --  Muldraugh Police Station Lockers

		{ name = "MeadeSOL", type = "LootZone", x = 7251, y = 8371, z = 0, width = 1, height = 2}, --  Ekron Sheriff Station Lockers

		{ name = "WestPointPDL", type = "LootZone", x = 11894, y = 6935, z = 0, width = 4, height = 1}, --  WestPoint Police Station Lockers

		{ name = "RiversidePDL", type = "LootZone", x = 6087, y = 5265, z = 0, width = 1, height = 2}, --  Riverside Police Station Lockers

		{ name = "LouisvillePDL", type = "LootZone", x = 12472, y = 1599, z = 0, width = 1, height = 4}, --  Louisville Police Station Lockers
		{ name = "LouisvillePDL", type = "LootZone", x = 12476, y = 1601, z = 0, width = 2, height = 5}, --  Louisville Police Station Lockers
		{ name = "LouisvillePDL", type = "LootZone", x = 12481, y = 1600, z = 0, width = 1, height = 7}, --  Louisville Police Station Lockers

		{ name = "JeffersonSDL", type = "LootZone", x = 13778, y = 2558, z = 0, width = 2, height = 1}, -- Jefferson County Sheriff Station Lockers

		{ name = "JeffersonPDL", type = "LootZone", x = 13217, y = 3073, z = 0, width = 1, height = 6}, -- Jefferson County Police Department Lockers
		{ name = "JeffersonPDL", type = "LootZone", x = 13221, y = 3073, z = 0, width = 1, height = 6}, -- Jefferson County Police Department Lockers

		{ name = "LouisvilleKSPL", type = "LootZone", x = 12970, y = 1393, z = 0, width = 1, height = 6 }, -- Louisville Unmarked Police Station (KSP) Lockers
		{ name = "LouisvilleKSPL", type = "LootZone", x = 12984, y = 1396, z = 0, width = 4, height = 1 }, -- Louisville Unmarked Police Station (KSP) Lockers
		{ name = "LouisvilleKSPL", type = "LootZone", x = 12975, y = 1365, z = 0, width = 1, height = 8 }, -- Louisville Unmarked Police Station (KSP) Lockers

		-- Prison/Jail Areas
		{ name = "RosewoodPrisonL", type = "LootZone", x = 7741, y = 11908, z = 0, width = 2, height = 1 }, -- Rosewood Prison Lockers Admin Building
		{ name = "RosewoodPrisonL", type = "LootZone", x = 7744, y = 11908, z = 0, width = 2, height = 1 }, -- Rosewood Prison Lockers Admin Building
		{ name = "RosewoodPrisonL", type = "LootZone", x = 7747, y = 11908, z = 0, width = 2, height = 1 }, -- Rosewood Prison Lockers Admin Building

		-- { name = "RosewoodPrisonL", type = "LootZone", x = 7741, y = 11903, z = 0, width = 1, height = 2 }, -- Rosewood Prison Lockers Admin Building

		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7650, y = 11825, z = 0, width = 1, height = 1 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7640, y = 11814, z = 0, width = 1, height = 4 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7640, y = 11819, z = 0, width = 1, height = 4 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7641, y = 11814, z = 0, width = 1, height = 1 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7643, y = 11814, z = 0, width = 2, height = 4 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7643, y = 11819, z = 0, width = 2, height = 4 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7647, y = 11814, z = 0, width = 5, height = 1 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7645, y = 11816, z = 0, width = 1, height = 1 }, -- Rosewood Prison Inmate Laundry Room

		{ name = "RosewoodPrisonInmateCellL", type = "LootZone", x = 7678, y = 11817, z = 0, width = 1, height = 37 }, -- Rosewood Prison Inmate North Cell Block
		{ name = "RosewoodPrisonInmateCellL", type = "LootZone", x = 7698, y = 11817, z = 0, width = 1, height = 37 }, -- Rosewood Prison Inmate North Cell Block

		{ name = "RosewoodPrisonInmateCellL", type = "LootZone", x = 7678, y = 11896, z = 0, width = 1, height = 49 }, -- Rosewood Prison Inmate South Cell Block
		{ name = "RosewoodPrisonInmateCellL", type = "LootZone", x = 7699, y = 11906, z = 0, width = 1, height = 39 }, -- Rosewood Prison Inmate South Cell Block

		{ name = "RosewoodPrisonInmateMaxCellL", type = "LootZone", x = 7681, y = 11868, z = 0, width = 1, height = 9 }, -- Rosewood Prison Inmate Maximum Security Cell Block
		{ name = "RosewoodPrisonInmateMaxCellL", type = "LootZone", x = 7693, y = 11869, z = 0, width = 1, height = 13 }, -- Rosewood Prison Inmate Maximum Security Cell Block

		{ name = "LouisvillePDPrisonCellL", type = "LootZone", x = 12404, y = 1586, z = 0, width = 1, height = 37 }, -- Louisville Police Department City Jail Cell Block
		{ name = "LouisvillePDPrisonCellL", type = "LootZone", x = 12417, y = 1587, z = 0, width = 1, height = 33 }, -- Louisville Police Department City Jail Cell Block
		{ name = "LouisvillePDPrisonCellL", type = "LootZone", x = 12418, y = 1590, z = 0, width = 1, height = 33 }, -- Louisville Police Department City Jail Cell Block
		{ name = "LouisvillePDPrisonCellL", type = "LootZone", x = 12431, y = 1587, z = 0, width = 1, height = 33 }, -- Louisville Police Department City Jail Cell Block

		{ name = "LouisvillePDPrisonL", type = "LootZone", x = 12428, y = 1610, z = 0, width = 1, height = 8 }, -- Louisville Police Department City Jail Laundry Room
		{ name = "LouisvillePDPrisonL", type = "LootZone", x = 12431, y = 1610, z = 0, width = 1, height = 5 }, -- Louisville Police Department City Jail Laundry Room
		{ name = "LouisvillePDPrisonL", type = "LootZone", x = 12430, y = 1615, z = 0, width = 1, height = 1 }, -- Louisville Police Department City Jail Laundry Room
		{ name = "LouisvillePDPrisonL", type = "LootZone", x = 12432, y = 1618, z = 0, width = 1, height = 1 }, -- Louisville Police Department City Jail Laundry Room
		{ name = "LouisvillePDPrisonL", type = "LootZone", x = 12428, y = 1609, z = 0, width = 4, height = 1 }, -- Louisville Police Department City Jail Laundry Room

		-- Fire Departments
		{ name = "FireDeptRWL", type = "LootZone", x = 8128, y = 11728, z = 0, width = 2, height = 1 }, -- Rosewood Fire Station Lockers
		{ name = "FireDeptRWL", type = "LootZone", x = 8131, y = 11728, z = 0, width = 2, height = 1 }, -- Rosewood Fire Station Lockers
		{ name = "FireDeptRWL", type = "LootZone", x = 8134, y = 11728, z = 0, width = 2, height = 1 }, -- Rosewood Fire Station Lockers
		{ name = "FireDeptRWL", type = "LootZone", x = 8157, y = 11738, z = 0, width = 1, height = 3 }, -- Rosewood Fire Station Lockers
		-- { name = "FireDeptRWL", type = "LootZone", x = 8145, y = 11728, z = 0, width = 1, height = 4 }, -- Rosewood Fire Station Storage
		-- { name = "FireDeptRWL", type = "LootZone", x = 8147, y = 11728, z = 0, width = 2, height = 1 }, -- Rosewood Fire Station Storage

		{ name = "FireDeptLVL", type = "LootZone", x = 12349, y = 1745, z = 0, width = 1, height = 3 }, -- Louisville Slums FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 12349, y = 1749, z = 0, width = 1, height = 3 }, -- Louisville Slums FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 12354, y = 1746, z = 0, width = 1, height = 3 }, -- Louisville Slums FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 12350, y = 1776, z = 0, width = 3, height = 1 }, -- Louisville Slums FD Lockers

		{ name = "FireDeptLVL", type = "LootZone", x = 13660, y = 1768, z = 0, width = 4, height = 1 }, -- Louisville Main FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 13695, y = 1771, z = 0, width = 3, height = 1 }, -- Louisville Main FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 13719, y = 1767, z = 0, width = 3, height = 1 }, -- Louisville Main FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 13723, y = 1767, z = 0, width = 3, height = 1 }, -- Louisville Main FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 13722, y = 1772, z = 0, width = 3, height = 1 }, -- Louisville Main FD Lockers

		-- Meade County EMS
		{ name = "MeadeEMSL", type = "LootZone", x = 8082, y = 11531, z = 0, width = 1, height = 2 }, -- Rosewood Medical Storage
		{ name = "LouisvilleEMSL", type = "LootZone", x = 12417, y = 1753, z = 0, width = 1, height = 1 }, -- Louisville Medical Storage
		{ name = "LouisvilleEMSL", type = "LootZone", x = 12923, y = 2073, z = 0, width = 1, height = 2 }, -- Louisville General Hospital Storage
		{ name = "JeffersonEMSL", type = "LootZone", x = 12391, y = 3716, z = 0, width = 3, height = 1 }, -- St. Peregin's Hospital Storage

		-- Louisville Postal Depo
		{ name = "USPSL", type = "LootZone", x = 12673, y = 2065, z = 0, width = 4, height = 5 }, -- Garage Lockers
		{ name = "USPSL", type = "LootZone", x = 12629, y = 2082, z = 0, width = 1, height = 2 }, -- Office Locker Closet

		-- Riverside Postal Office
		{ name = "USPSL", type = "LootZone", x = 6309, y = 5258, z = 0, width = 2, height = 1 }, -- USPS Office Locker Closet

		-- Grand Ohio Mall
		{ name = "MallOhioL", type = "LootZone", x = 13616, y = 1333, z = 0, width = 1, height = 1 },

		-- Valley Station Mall
		{ name = "MallValleyL", type = "LootZone", x = 13897, y = 5888, z = 0, width = 1, height = 2 },

		-- Sky Blue Bank North Louisville
		{ name = "BankSecurity", type = "ZombiesType", x = 13116, y = 2159, z = 0, width = 20, height = 18 },
		{ name = "BankSecurity", type = "ZombiesType", x = 13114, y = 2157, z = 1, width = 22, height = 19 },

		-- Sky Blue Bank South Louisville
		{ name = "BankSecurity", type = "ZombiesType", x = 13593, y = 3013, z = 0, width = 18, height = 23 },
		{ name = "BankSecurity", type = "ZombiesType", x = 13593, y = 3012, z = 1, width = 16, height = 20 },

		-- Knox Bank Louisville
		{ name = "BankSecurity", type = "ZombiesType", x = 12531, y = 2583, z = 0, width = 19, height = 18 },

		-- Riverside Knox Bank
		{ name = "BankSecurity", type = "ZombiesType", x = 6509, y = 5298, z = 0, width = 11, height = 24 },
		{ name = "BankSecurity", type = "ZombiesType", x = 6499, y = 5298, z = 0, width = 10, height = 11 },

		-- WestPoint Knox Bank
		{ name = "BankSecurity", type = "ZombiesType", x = 11897, y = 6911, z = 0, width = 20, height = 20 },

		-- Valley Station Knox Bank
		{ name = "BankSecurity", type = "ZombiesType", x = 13652, y = 5736, z = 0, width = 16, height = 26 },

		-- Muldraugh Knox Bank
		{ name = "BankSecurity", type = "ZombiesType", x = 10626, y = 9688, z = 0, width = 10, height = 21 },

		-- Rosewood Knox Bank
		{ name = "BankSecurity", type = "ZombiesType", x = 8082, y = 11589, z = 0, width = 17, height = 16 },

		}
	end

	if getActivatedMods():contains("NewEkron") then

	objects = {

		-- Zombie Spawn Zones
		-- Police Areas
		{ name = "RiversidePD", type = "ZombiesType", x = 6079, y = 5249, z = 0, width = 23, height = 27}, -- Riverside Police Station
		{ name = "WestPointPD", type = "ZombiesType", x = 11876, y = 6935, z = 0, width = 42, height = 25}, -- WestPoint Police Station
		{ name = "MeadeSO", type = "ZombiesType", x = 7081, y = 8321, z = 0, width = 13, height = 9 }, -- Ekron Sheriff Station
		{ name = "MeadeSO", type = "ZombiesType", x = 7081, y = 8308, z = 0, width = 7, height = 13 }, -- Ekron Sheriff Station
		{ name = "MuldraughPD", type = "ZombiesType", x = 10630, y = 10400, z = 0, width = 28, height = 42}, -- Muldraugh Police Station
		{ name = "RosewoodSD", type = "ZombiesType", x = 8043, y = 11703, z = 0, width = 50, height = 62}, -- Rosewood Sheriff Station

		-- Picnic Areas
		{ name = "WestPointPicnic", type = "ZombiesType", x = 12010, y = 7354, z = 0, width = 56, height = 70}, -- WestPoint Picnic Area
		{ name = "MuldraughPicnic", type = "ZombiesType", x = 10980, y = 9629, z = 0, width = 35, height = 35}, -- Muldraugh Picnic Area
		{ name = "DixiePicnic", type = "ZombiesType", x = 11543, y = 8851, z = 0, width = 30, height = 40}, -- Dixie Picnic Area

		-- Louisville
		{ name = "LouisvillePD", type = "ZombiesType", x = 12479, y = 1581, z = 0, width = 9, height = 63 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12466, y = 1640, z = 0, width = 25, height = 10 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12466, y = 1636, z = 0, width = 17, height = 4 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12466, y = 1587, z = 0, width = 13, height = 49 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12463, y = 1587, z = 0, width = 3, height = 29 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12450, y = 1598, z = 0, width = 12, height = 14 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12434, y = 1584, z = 0, width = 16, height = 39 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12431, y = 1606, z = 0, width = 4, height = 14 }, -- Louisville Police Department
		{ name = "LouisvillePD", type = "ZombiesType", x = 12460, y = 1601, z = 1, width = 32, height = 46 }, -- Louisville Police Department

		{ name = "JeffersonSD", type = "ZombiesType", x = 13778, y = 2552, z = 0, width = 10, height = 20 }, -- Jefferson County Sheriff Station

		{ name = "JeffersonPD", type = "ZombiesType", x = 13203, y = 3086, z = 0, width = 35, height = 13 }, -- Jefferson County Police Department
		{ name = "JeffersonPD", type = "ZombiesType", x = 13211, y = 3083, z = 0, width = 24, height = 3 }, -- Jefferson County Police Department
		{ name = "JeffersonPD", type = "ZombiesType", x = 13212, y = 3074, z = 0, width = 23, height = 9 }, -- Jefferson County Police Department

		{ name = "LouisvilleKSP", type = "ZombiesType", x = 12970, y = 1365, z = 0, width = 18, height = 39 }, -- Louisville Unmarked Police Station (KSP)
		{ name = "LouisvilleKSP", type = "ZombiesType", x = 12960, y = 1365, z = 0, width = 13, height = 29 }, -- Louisville Unmarked Police Station (KSP)
		{ name = "LouisvilleKSP", type = "ZombiesType", x = 12944, y = 1365, z = 0, width = 13, height = 21 }, -- Louisville Unmarked Police Station (KSP)
		{ name = "LouisvilleKSP", type = "ZombiesType", x = 12943, y = 1365, z = 1, width = 21, height = 21 }, -- Louisville Unmarked Police Station (KSP)

		-- Prison/Jail Areas
		{ name = "LouisvillePDPrison", type = "ZombiesType", x = 12403, y = 1582, z = 0, width = 24, height = 40 }, -- Louisville Police Department City Jail
		{ name = "LouisvillePDPrison", type = "ZombiesType", x = 12427, y = 1582, z = 0, width = 4, height = 26 }, -- Louisville Police Department City Jail
		{ name = "LouisvillePDPrison", type = "ZombiesType", x = 12403, y = 1583, z = 1, width = 29, height = 40 }, -- Louisville Police Department City Jail

		{ name = "JeffersonPDJail", type = "ZombiesType", x = 13205, y = 3073, z = 0, width = 6, height = 10 }, -- Jefferson County Police Department Jail Area

		{ name = "JeffersonSDJail", type = "ZombiesType", x = 13778, y = 2564, z = 0, width = 6, height = 3 }, -- Jefferson County Sheriff Department Jail Area

		{ name = "LouisvilleKSPJail", type = "ZombiesType", x = 12944, y = 1386, z = 0, width = 13, height = 8 }, -- Louisville Unmarked Police Station (KSP) Jail Area

		{ name = "RosewoodPrison", type = "ZombiesType", x = 7606, y = 11781, z = 0, width = 138, height = 196 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7744, y = 11893, z = 0, width = 22, height = 30 }, -- Rosewood Prison

		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11817, z = 1, width = 21, height = 42 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11859, z = 1, width = 24, height = 4 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11863, z = 1, width = 39, height = 13 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11876, z = 1, width = 38, height = 10 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11886, z = 1, width = 39, height = 14 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7678, y = 11900, z = 1, width = 22, height = 45 }, -- Rosewood Prison
		{ name = "RosewoodPrison", type = "ZombiesType", x = 7700, y = 11900, z = 1, width = 17, height = 6 }, -- Rosewood Prison

		{ name = "RosewoodPrisonMax", type = "ZombiesType", x = 7678, y = 11866, z = 1, width = 17, height = 21 }, -- Rosewood Prison Maximum Security Wing
		{ name = "RosewoodPrisonMax", type = "ZombiesType", x = 7678, y = 11887, z = 1, width = 5, height = 5 }, -- Rosewood Prison Maximum Security Wing
		{ name = "RosewoodPrisonMax", type = "ZombiesType", x = 7681, y = 11892, z = 1, width = 2, height = 1 }, -- Rosewood Prison Maximum Security Wing

		{ name = "RosewoodPrison", type = "ZombiesType", x = 7734, y = 11896, z = 1, width = 19, height = 12 }, -- Rosewood Prison Admin Building

		-- Fire Departments
		{ name = "FireDeptLV", type = "ZombiesType", x = 12349, y = 1741, z = 0, width = 23, height = 41 }, -- Louisville Slums FD
		{ name = "FireDeptLV", type = "ZombiesType", x = 12349, y = 1741, z = 1, width = 23, height = 20 }, -- Louisville Slums FD
		{ name = "FireDeptLV", type = "ZombiesType", x = 13661, y = 1767, z = 0, width = 76, height = 33 }, -- Louisville Main FD
		{ name = "FireDeptRW", type = "ZombiesType", x = 8125, y = 11731, z = 0, width = 39, height = 43 }, -- Rosewood Fire Station
		{ name = "FireDeptRW", type = "ZombiesType", x = 8128, y = 11728, z = 1, width = 17, height = 23 }, -- Rosewood Fire Station
		{ name = "FireDeptRW", type = "ZombiesType", x = 8128, y = 11751, z = 1, width = 6, height = 1 }, -- Rosewood Fire Station

		-- EMS Departments
		{ name = "MeadeEMS", type = "ZombiesType", x = 8079, y = 11526, z = 0, width = 6, height = 5 }, -- Rosewood Medical
		{ name = "LouisvilleEMS", type = "ZombiesType", x = 12417, y = 1750, z = 0, width = 8, height = 5 }, -- Louisville Medical Center
		{ name = "LouisvilleEMS", type = "ZombiesType", x = 12923, y = 2073, z = 0, width = 5, height = 3 }, -- Louisville General Hospital
		{ name = "JeffersonEMS", type = "ZombiesType", x = 12388, y = 3716, z = 0, width = 7, height = 5 }, -- St. Peregin's Hospital

		-- Rangers
		{ name = "FederalRanger", type = "ZombiesType", x = 4825, y = 6264, z = 0, width = 34, height = 33 }, -- New Ranger Station
		{ name = "State_LawRanger", type = "ZombiesType", x = 4825, y = 6264, z = 0, width = 34, height = 33 }, -- New Ranger Station
		{ name = "StateRanger", type = "ZombiesType", x = 4825, y = 6264, z = 0, width = 34, height = 33 }, -- New Ranger Station

		-- Louisville Postal Depo
		{ name = "USPS", type = "ZombiesType", x = 12614, y = 2067, z = 0, width = 28, height = 27 }, -- USPS Office
		{ name = "USPS", type = "ZombiesType", x = 12642, y = 2059, z = 0, width = 35, height = 35 }, -- USPS Parking And Garage

		-- Riverside Postal Office
		{ name = "USPS", type = "ZombiesType", x = 6301, y = 5244, z = 0, width = 24, height = 29 }, -- USPS Office

		-- WestPoint Postal Office
		{ name = "USPS", type = "ZombiesType", x = 11954, y = 6906, z = 0, width = 16, height = 15 }, -- USPS Office

		-- MarchRidge Postal Office
		{ name = "USPS", type = "ZombiesType", x = 10098, y = 12708, z = 0, width = 33, height = 22 }, -- USPS Office

		-- Rosewood Court House
		{ name = "CourtHouse", type = "ZombiesType", x = 8051, y = 11642, z = 0, width = 38, height = 29 }, -- Main Building

		-- Louisville Court House
		{ name = "CourtHouse", type = "ZombiesType", x = 12458, y = 1527, z = 0, width = 40, height = 39 }, -- Main Building

		-- Louisville Havisham Hotel
		{ name = "HotelHav", type = "ZombiesType", x = 12614, y = 1292, z = 0, width = 75, height = 37 },
		{ name = "HotelHav", type = "ZombiesType", x = 12614, y = 1292, z = 1, width = 74, height = 37 },
		{ name = "HotelHav", type = "ZombiesType", x = 12614, y = 1293, z = 2, width = 73, height = 47 },
		{ name = "HotelHav", type = "ZombiesType", x = 12616, y = 1294, z = 3, width = 57, height = 48 },
		{ name = "HotelHav", type = "ZombiesType", x = 12616, y = 1294, z = 4, width = 56, height = 48 },
		{ name = "HotelHav", type = "ZombiesType", x = 12616, y = 1296, z = 5, width = 56, height = 45 },

		-- Louisville Unnamed Fancy Hotel
		{ name = "HotelFancy", type = "ZombiesType", x = 13653, y = 1506, z = 0, width = 84, height = 48 },
		{ name = "HotelFancy", type = "ZombiesType", x = 13664, y = 1506, z = 1, width = 65, height = 38 },
		{ name = "HotelFancy", type = "ZombiesType", x = 13664, y = 1507, z = 2, width = 66, height = 37 },

		-- Grand Ohio Mall
		{ name = "MallOhio", type = "ZombiesType", x = 13515, y = 1261, z = 0, width = 109, height = 143 },
		{ name = "MallOhio", type = "ZombiesType", x = 13625, y = 1261, z = 0, width = 47, height = 73 },
		{ name = "MallOhio", type = "ZombiesType", x = 13515, y = 1261, z = 1, width = 109, height = 143 },
		{ name = "MallOhio", type = "ZombiesType", x = 13625, y = 1261, z = 1, width = 47, height = 73 },
		{ name = "MallOhio", type = "ZombiesType", x = 13515, y = 1261, z = 2, width = 109, height = 143 },
		{ name = "MallOhio", type = "ZombiesType", x = 13625, y = 1261, z = 2, width = 47, height = 73 },

		-- Valley Station Mall
		{ name = "MallValley", type = "ZombiesType", x = 13872, y = 5750, z = 0, width = 86, height = 141 },
		{ name = "MallValley", type = "ZombiesType", x = 13959, y = 5780, z = 0, width = 27, height = 111 },
		{ name = "MallValley", type = "ZombiesType", x = 13987, y = 5797, z = 0, width = 13, height = 94 },
		{ name = "MallValley", type = "ZombiesType", x = 13909, y = 5892, z = 0, width = 57, height = 17 },
		{ name = "MallValley", type = "ZombiesType", x = 13967, y = 5892, z = 0, width = 33, height = 7 },
		{ name = "MallValley", type = "ZombiesType", x = 13872, y = 5750, z = 1, width = 86, height = 141 },
		{ name = "MallValley", type = "ZombiesType", x = 13959, y = 5780, z = 1, width = 27, height = 111 },
		{ name = "MallValley", type = "ZombiesType", x = 13987, y = 5797, z = 1, width = 13, height = 94 },
		{ name = "MallValley", type = "ZombiesType", x = 13909, y = 5892, z = 1, width = 57, height = 17 },
		{ name = "MallValley", type = "ZombiesType", x = 13967, y = 5892, z = 1, width = 33, height = 7 },
		{ name = "MallValley", type = "ZombiesType", x = 13872, y = 5750, z = 2, width = 86, height = 141 },
		{ name = "MallValley", type = "ZombiesType", x = 13959, y = 5780, z = 2, width = 27, height = 111 },
		{ name = "MallValley", type = "ZombiesType", x = 13987, y = 5797, z = 2, width = 13, height = 94 },
		{ name = "MallValley", type = "ZombiesType", x = 13909, y = 5892, z = 2, width = 57, height = 17 },
		{ name = "MallValley", type = "ZombiesType", x = 13967, y = 5892, z = 2, width = 33, height = 7 },

		-- Louisville Mall
		{ name = "MallLV", type = "ZombiesType", x = 13300, y = 3044, z = 0, width = 101, height = 41 },
		{ name = "MallLV", type = "ZombiesType", x = 13300, y = 3044, z = 1, width = 101, height = 41 },

		-- Loot Zones
		-- Police Areas
		{ name = "RosewoodSDL", type = "LootZone", x = 8048, y = 11724, z = 0, width = 5, height = 6}, --  Rosewood Sheriff Station Lockers
		{ name = "RosewoodSDL", type = "LootZone", x = 8056, y = 11724, z = 0, width = 4, height = 1}, --  Rosewood Sheriff Station Lockers

		{ name = "MuldraughPDL", type = "LootZone", x = 10639, y = 10400, z = 0, width = 1, height = 2}, --  Muldraugh Police Station Lockers

		{ name = "MeadeSOL", type = "LootZone", x = 7081, y = 8309, z = 0, width = 4, height = 1}, --  Ekron Sheriff Station Lockers

		{ name = "WestPointPDL", type = "LootZone", x = 11894, y = 6935, z = 0, width = 4, height = 1}, --  WestPoint Police Station Lockers

		{ name = "RiversidePDL", type = "LootZone", x = 6087, y = 5265, z = 0, width = 1, height = 2}, --  Riverside Police Station Lockers

		{ name = "LouisvillePDL", type = "LootZone", x = 12472, y = 1599, z = 0, width = 1, height = 4}, --  Louisville Police Station Lockers
		{ name = "LouisvillePDL", type = "LootZone", x = 12476, y = 1601, z = 0, width = 2, height = 5}, --  Louisville Police Station Lockers
		{ name = "LouisvillePDL", type = "LootZone", x = 12481, y = 1600, z = 0, width = 1, height = 7}, --  Louisville Police Station Lockers

		{ name = "JeffersonSDL", type = "LootZone", x = 13778, y = 2558, z = 0, width = 2, height = 1}, -- Jefferson County Sheriff Station Lockers

		{ name = "JeffersonPDL", type = "LootZone", x = 13217, y = 3073, z = 0, width = 1, height = 6}, -- Jefferson County Police Department Lockers
		{ name = "JeffersonPDL", type = "LootZone", x = 13221, y = 3073, z = 0, width = 1, height = 6}, -- Jefferson County Police Department Lockers

		{ name = "LouisvilleKSPL", type = "LootZone", x = 12970, y = 1393, z = 0, width = 1, height = 6 }, -- Louisville Unmarked Police Station (KSP) Lockers
		{ name = "LouisvilleKSPL", type = "LootZone", x = 12984, y = 1396, z = 0, width = 4, height = 1 }, -- Louisville Unmarked Police Station (KSP) Lockers
		{ name = "LouisvilleKSPL", type = "LootZone", x = 12975, y = 1365, z = 0, width = 1, height = 8 }, -- Louisville Unmarked Police Station (KSP) Lockers

		-- Prison/Jail Areas
		{ name = "RosewoodPrisonL", type = "LootZone", x = 7741, y = 11908, z = 0, width = 2, height = 1 }, -- Rosewood Prison Lockers Admin Building
		{ name = "RosewoodPrisonL", type = "LootZone", x = 7744, y = 11908, z = 0, width = 2, height = 1 }, -- Rosewood Prison Lockers Admin Building
		{ name = "RosewoodPrisonL", type = "LootZone", x = 7747, y = 11908, z = 0, width = 2, height = 1 }, -- Rosewood Prison Lockers Admin Building

		-- { name = "RosewoodPrisonL", type = "LootZone", x = 7741, y = 11903, z = 0, width = 1, height = 2 }, -- Rosewood Prison Lockers Admin Building

		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7650, y = 11825, z = 0, width = 1, height = 1 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7640, y = 11814, z = 0, width = 1, height = 4 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7640, y = 11819, z = 0, width = 1, height = 4 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7641, y = 11814, z = 0, width = 1, height = 1 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7643, y = 11814, z = 0, width = 2, height = 4 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7643, y = 11819, z = 0, width = 2, height = 4 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7647, y = 11814, z = 0, width = 5, height = 1 }, -- Rosewood Prison Inmate Laundry Room
		{ name = "RosewoodPrisonInmateL", type = "LootZone", x = 7645, y = 11816, z = 0, width = 1, height = 1 }, -- Rosewood Prison Inmate Laundry Room

		{ name = "RosewoodPrisonInmateCellL", type = "LootZone", x = 7678, y = 11817, z = 0, width = 1, height = 37 }, -- Rosewood Prison Inmate North Cell Block
		{ name = "RosewoodPrisonInmateCellL", type = "LootZone", x = 7698, y = 11817, z = 0, width = 1, height = 37 }, -- Rosewood Prison Inmate North Cell Block

		{ name = "RosewoodPrisonInmateCellL", type = "LootZone", x = 7678, y = 11896, z = 0, width = 1, height = 49 }, -- Rosewood Prison Inmate South Cell Block
		{ name = "RosewoodPrisonInmateCellL", type = "LootZone", x = 7699, y = 11906, z = 0, width = 1, height = 39 }, -- Rosewood Prison Inmate South Cell Block

		{ name = "RosewoodPrisonInmateMaxCellL", type = "LootZone", x = 7681, y = 11868, z = 0, width = 1, height = 9 }, -- Rosewood Prison Inmate Maximum Security Cell Block
		{ name = "RosewoodPrisonInmateMaxCellL", type = "LootZone", x = 7693, y = 11869, z = 0, width = 1, height = 13 }, -- Rosewood Prison Inmate Maximum Security Cell Block

		{ name = "LouisvillePDPrisonCellL", type = "LootZone", x = 12404, y = 1586, z = 0, width = 1, height = 37 }, -- Louisville Police Department City Jail Cell Block
		{ name = "LouisvillePDPrisonCellL", type = "LootZone", x = 12417, y = 1587, z = 0, width = 1, height = 33 }, -- Louisville Police Department City Jail Cell Block
		{ name = "LouisvillePDPrisonCellL", type = "LootZone", x = 12418, y = 1590, z = 0, width = 1, height = 33 }, -- Louisville Police Department City Jail Cell Block
		{ name = "LouisvillePDPrisonCellL", type = "LootZone", x = 12431, y = 1587, z = 0, width = 1, height = 33 }, -- Louisville Police Department City Jail Cell Block

		{ name = "LouisvillePDPrisonL", type = "LootZone", x = 12428, y = 1610, z = 0, width = 1, height = 8 }, -- Louisville Police Department City Jail Laundry Room
		{ name = "LouisvillePDPrisonL", type = "LootZone", x = 12431, y = 1610, z = 0, width = 1, height = 5 }, -- Louisville Police Department City Jail Laundry Room
		{ name = "LouisvillePDPrisonL", type = "LootZone", x = 12430, y = 1615, z = 0, width = 1, height = 1 }, -- Louisville Police Department City Jail Laundry Room
		{ name = "LouisvillePDPrisonL", type = "LootZone", x = 12432, y = 1618, z = 0, width = 1, height = 1 }, -- Louisville Police Department City Jail Laundry Room
		{ name = "LouisvillePDPrisonL", type = "LootZone", x = 12428, y = 1609, z = 0, width = 4, height = 1 }, -- Louisville Police Department City Jail Laundry Room

		-- Fire Departments
		{ name = "FireDeptRWL", type = "LootZone", x = 8128, y = 11728, z = 0, width = 2, height = 1 }, -- Rosewood Fire Station Lockers
		{ name = "FireDeptRWL", type = "LootZone", x = 8131, y = 11728, z = 0, width = 2, height = 1 }, -- Rosewood Fire Station Lockers
		{ name = "FireDeptRWL", type = "LootZone", x = 8134, y = 11728, z = 0, width = 2, height = 1 }, -- Rosewood Fire Station Lockers
		{ name = "FireDeptRWL", type = "LootZone", x = 8157, y = 11738, z = 0, width = 1, height = 3 }, -- Rosewood Fire Station Lockers
		-- { name = "FireDeptRWL", type = "LootZone", x = 8145, y = 11728, z = 0, width = 1, height = 4 }, -- Rosewood Fire Station Storage
		-- { name = "FireDeptRWL", type = "LootZone", x = 8147, y = 11728, z = 0, width = 2, height = 1 }, -- Rosewood Fire Station Storage

		{ name = "FireDeptLVL", type = "LootZone", x = 12349, y = 1745, z = 0, width = 1, height = 3 }, -- Louisville Slums FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 12349, y = 1749, z = 0, width = 1, height = 3 }, -- Louisville Slums FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 12354, y = 1746, z = 0, width = 1, height = 3 }, -- Louisville Slums FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 12350, y = 1776, z = 0, width = 3, height = 1 }, -- Louisville Slums FD Lockers

		{ name = "FireDeptLVL", type = "LootZone", x = 13660, y = 1768, z = 0, width = 4, height = 1 }, -- Louisville Main FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 13695, y = 1771, z = 0, width = 3, height = 1 }, -- Louisville Main FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 13719, y = 1767, z = 0, width = 3, height = 1 }, -- Louisville Main FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 13723, y = 1767, z = 0, width = 3, height = 1 }, -- Louisville Main FD Lockers
		{ name = "FireDeptLVL", type = "LootZone", x = 13722, y = 1772, z = 0, width = 3, height = 1 }, -- Louisville Main FD Lockers

		{ name = "FireDeptMCL", type = "LootZone", x = 7389, y = 8359, z = 0, width = 5, height = 1 }, -- New Ekron FD Lockers

		-- Meade County EMS
		{ name = "MeadeEMSL", type = "LootZone", x = 8082, y = 11531, z = 0, width = 1, height = 2 }, -- Rosewood Medical Storage
		{ name = "LouisvilleEMSL", type = "LootZone", x = 12417, y = 1753, z = 0, width = 1, height = 1 }, -- Louisville Medical Storage
		{ name = "LouisvilleEMSL", type = "LootZone", x = 12923, y = 2073, z = 0, width = 1, height = 2 }, -- Louisville General Hospital Storage
		{ name = "JeffersonEMSL", type = "LootZone", x = 12391, y = 3716, z = 0, width = 3, height = 1 }, -- St. Peregin's Hospital Storage

		-- Louisville Postal Depo
		{ name = "USPSL", type = "LootZone", x = 12673, y = 2065, z = 0, width = 4, height = 5 }, -- USPS Garage Lockers
		{ name = "USPSL", type = "LootZone", x = 12629, y = 2082, z = 0, width = 1, height = 2 }, -- USPS Office Locker Closet

		-- Riverside Postal Office
		{ name = "USPSL", type = "LootZone", x = 6309, y = 5258, z = 0, width = 2, height = 1 }, -- USPS Office Locker Closet

		-- Grand Ohio Mall
		{ name = "MallOhioL", type = "LootZone", x = 13616, y = 1333, z = 0, width = 1, height = 1 },

		-- Valley Station Mall
		{ name = "MallValleyL", type = "LootZone", x = 13897, y = 5888, z = 0, width = 1, height = 2 },

		-- Sky Blue Bank North Louisville
		{ name = "BankSecurity", type = "ZombiesType", x = 13116, y = 2159, z = 0, width = 20, height = 18 },
		{ name = "BankSecurity", type = "ZombiesType", x = 13114, y = 2157, z = 1, width = 22, height = 19 },

		-- Sky Blue Bank South Louisville
		{ name = "BankSecurity", type = "ZombiesType", x = 13593, y = 3013, z = 0, width = 18, height = 23 },
		{ name = "BankSecurity", type = "ZombiesType", x = 13593, y = 3012, z = 1, width = 16, height = 20 },

		-- Knox Bank Louisville
		{ name = "BankSecurity", type = "ZombiesType", x = 12531, y = 2583, z = 0, width = 19, height = 18 },

		-- Riverside Knox Bank
		{ name = "BankSecurity", type = "ZombiesType", x = 6509, y = 5298, z = 0, width = 11, height = 24 },
		{ name = "BankSecurity", type = "ZombiesType", x = 6499, y = 5298, z = 0, width = 10, height = 11 },

		-- WestPoint Knox Bank
		{ name = "BankSecurity", type = "ZombiesType", x = 11897, y = 6911, z = 0, width = 20, height = 20 },

		-- Valley Station Knox Bank
		{ name = "BankSecurity", type = "ZombiesType", x = 13652, y = 5736, z = 0, width = 16, height = 26 },

		-- Muldraugh Knox Bank
		{ name = "BankSecurity", type = "ZombiesType", x = 10626, y = 9688, z = 0, width = 10, height = 21 },

		-- Rosewood Knox Bank
		{ name = "BankSecurity", type = "ZombiesType", x = 8082, y = 11589, z = 0, width = 17, height = 16 },

		}
	end
end