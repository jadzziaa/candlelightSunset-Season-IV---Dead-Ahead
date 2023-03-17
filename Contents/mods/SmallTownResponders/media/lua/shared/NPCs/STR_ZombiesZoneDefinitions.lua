require 'NPCs/ZombiesZoneDefinition'

local function STRSpawns()

	local MeadeInmateRed = SandboxVars.STRS.MeadeInmateRed
	local MeadeInmateYellow = SandboxVars.STRS.MeadeInmateYellow
	local MeadeInmateOrange = SandboxVars.STRS.MeadeInmateOrange
	local JeffersonInmate = SandboxVars.STRS.JeffersonInmate
	local DOC = SandboxVars.STRS.DOC
	local KSP_Trooper = SandboxVars.STRS.KSP_Trooper
	local JeffersonSD = SandboxVars.STRS.JeffersonSD
	local JeffersonPD = SandboxVars.STRS.JeffersonPD
	local LouisvillePD = SandboxVars.STRS.LouisvillePD
	local RosewoodSD = SandboxVars.STRS.RosewoodSD
	local RiversidePD = SandboxVars.STRS.RiversidePD
	local MeadeSO = SandboxVars.STRS.MeadeSO
	local WestPointPD = SandboxVars.STRS.WestPointPD
	local MuldraughPD = SandboxVars.STRS.MuldraughPD
	local EMS = SandboxVars.STRS.EMS
	local Dress = SandboxVars.STRS.Dress
	local Riot = SandboxVars.STRS.Riot
	local Ranger = SandboxVars.STRS.Ranger
	local FireFormal = SandboxVars.STRS.FireFormal
	local Fireman = SandboxVars.STRS.Fireman
	local FiremanFull = SandboxVars.STRS.FiremanFull
	local USPS = SandboxVars.STRS.USPS
	local Other = SandboxVars.STRS.Other
	local Duffel = SandboxVars.STRS.Duffel
	local Security = SandboxVars.STRS.Security
	local RavenCreekPD = SandboxVars.STRS.RavenCreekPD
	local RavenCreekInmate = SandboxVars.STRS.RavenCreekInmate

	-- Check if the custom zones are enabled in sandbox options
	if SandboxVars.STR.CustomZones then

	ZombiesZoneDefinition = ZombiesZoneDefinition or {};

		if getActivatedMods():contains("RavenCreek") then

			if SandboxVars.STR.VestRavenCreek then

				ZombiesZoneDefinition.PoliceRavenCreek = {
					PoliceRavenCreek = {
						name="PoliceRavenCreek",
						chance=RavenCreekPD,
					},
					PoliceRavenCreekRiot = {
						name="PoliceRavenCreekRiot",
						chance=Riot,
					},
					PoliceRavenCreekDress = {
						name="PoliceRavenCreekDress",
						chance=Dress,
					},
					OfficeWorkerSkirt = {
						name="OfficeWorkerSkirt",
						chance=20,
						gender="female",
					},
					OfficeWorker = {
						name="OfficeWorker",
						chance=20,
						gender="male",
						beardStyles="null:80",
					},
				}

			elseif not SandboxVars.STR.VestRavenCreek then

				ZombiesZoneDefinition.PoliceRavenCreek = {
					PoliceRavenCreekNoVest = {
						name="PoliceRavenCreekNoVest",
						chance=RavenCreekPD,
					},
					PoliceRavenCreekRiotNoVest = {
						name="PoliceRavenCreekRiotNoVest",
						chance=Riot,
					},
					PoliceRavenCreekDress = {
						name="PoliceRavenCreekDress",
						chance=Dress,
					},
					OfficeWorkerSkirt = {
						name="OfficeWorkerSkirt",
						chance=20,
						gender="female",
					},
					OfficeWorker = {
						name="OfficeWorker",
						chance=20,
						gender="male",
						beardStyles="null:80",
					},
				}

			end

			ZombiesZoneDefinition.FireDeptRavenCreek = {
				EMSRavenCreek = {
					name="EMSRavenCreek",
					chance=EMS,
				},
				EMSRavenCreekDress = {
					name="EMSRavenCreekDress",
					chance=Dress,
				},
				EMSRavenCreekSupervisor = {
					name="EMSRavenCreekSupervisor",
					chance=EMS,
				},
				EMSRavenCreekDressSupervisor = {
					name="EMSRavenCreekDressSupervisor",
					chance=Dress,
				},
				Fireman_RavenCreek_Formal = {
					name="Fireman_RavenCreek_Formal",
					chance=FireFormal,
				},
				Fireman_RavenCreek_Formal_Supervisor = {
					name="Fireman_RavenCreek_Formal_Supervisor",
					chance=FireFormal,
				},
				Fireman_RavenCreek_Dress = {
					name="Fireman_RavenCreek_Dress",
					chance=Dress,
				},
				Fireman_RavenCreek_Dress_Supervisor = {
					name="Fireman_RavenCreek_Dress_Supervisor",
					chance=Dress,
				},
				Fireman_RavenCreek_Black = {
					name="Fireman_RavenCreek_Black",
					chance=Fireman,
				},
				FiremanFullSuit_RavenCreek_Black = {
					name="FiremanFullSuit_RavenCreek_Black",
					chance=FiremanFull,
				},
				Fireman_RavenCreek_Khaki = {
					name="Fireman_RavenCreek_Khaki",
					chance=Fireman,
				},
				FiremanFullSuit_RavenCreek_Khaki = {
					name="FiremanFullSuit_RavenCreek_Khaki",
					chance=FiremanFull,
				},
			}

			ZombiesZoneDefinition.RavenCreekPrison = {
				-- Gonna force male zombies in prison
				maleChance = 80,
				Doctor = {
					name="Doctor",
					chance=2,
				},
				Priest = {
					name="Priest",
					toSpawn=1,
					gender="male",
					mandatory="true",
				},
				Doctor2 = {
					name="Doctor",
					chance=20,
					room="medicalstorage",
				},
				Nurse = {
					name="Nurse",
					chance=30,
					room="medicalstorage",
				},
				Priest = {
					name="Priest",
					mandatory="true",
					toSpawn=1,
					gender="male",
				},
				Waiter_Diner = {
					name="Waiter_Diner",
					chance=2,
				},
				PrisonGuard = {
					name="DOC_RavenCreek",
					chance=DOC,
					gender="male",
				},
				OfficeWorkerSkirt = {
					name="OfficeWorkerSkirt",
					gender="female",
					chance=30,
					room="office",
				},
				OfficeWorker = {
					name="OfficeWorker",
					gender="male",
					chance=30,
					room="office",
					beardStyles="null:80",
				},
				Security = {
					name="DOC_RavenCreek",
					gender="male",
					chance=DOC,
					room="security",
				},
				Inmate = {
					name="InmateRavenCreek",
					chance=RavenCreekInmate,
					gender="male",
					room="prisoncells;hall;cafeteria;classroom;laundry;janitor",
				},
				-- this one is used for lower chance of inmate in some rooms
				InmateLowerZone = {
					name="InmateRavenCreek",
					chance=RavenCreekInmate,
					gender="male",
					room="bathroom;kitchen;medicalstorage;library",
				},
				Naked = {
					name="Naked",
					chance=50,
					gender="male",
					room="bathroom",
				},
				Cook_Generic = {
					name="Cook_Generic",
					chance=30,
					gender="male",
					room="kitchen",
				},
			}

		end

	ZombiesZoneDefinition.BankSecurity = {
		OfficeWorkerSkirt = {
			name="OfficeWorkerSkirt",
			chance=25,
			gender="female",
		},
		OfficeWorker = {
			name="OfficeWorker",
			chance=25,
			gender="male",
			beardStyles="null:80",
		},
		Trader = {
			name="Trader",
			chance=10,
			beardStyles="null:80",
		},
		SecurityBank = {
			name="SecurityBank",
			chance=Security,
		},
	}

	ZombiesZoneDefinition.MallOhio = {
		SecurityMallOhio = {
			name="SecurityMallOhio",
			chance=Security,
		},
		Generic01 = {
			name="Generic01",
			chance=20,
		},
		Generic02 = {
			name="Generic02",
			chance=20,
		},
		Generic03 = {
			name="Generic03",
			chance=20,
		},
		Generic04 = {
			name="Generic04",
			chance=20,
		},
		Generic05 = {
			name="Generic05",
			chance=20,
		},
		Generic_Skirt = {
			name="Generic_Skirt",
			chance=20,
			gender="female",
		},
		DressLong = {
			name="DressLong",
			chance=10,
			gender="female",
		},
		DressNormal = {
			name="DressNormal",
			chance=10,
			gender="female",
		},
		DressShort = {
			name="DressShort",
			chance=10,
			gender="female",
		},
	}

	ZombiesZoneDefinition.MallValley = {
		SecurityMallValley = {
			name="SecurityMallValley",
			chance=Security,
		},
		Generic01 = {
			name="Generic01",
			chance=20,
		},
		Generic02 = {
			name="Generic02",
			chance=20,
		},
		Generic03 = {
			name="Generic03",
			chance=20,
		},
		Generic04 = {
			name="Generic04",
			chance=20,
		},
		Generic05 = {
			name="Generic05",
			chance=20,
		},
		Generic_Skirt = {
			name="Generic_Skirt",
			chance=20,
			gender="female",
		},
		DressLong = {
			name="DressLong",
			chance=10,
			gender="female",
		},
		DressNormal = {
			name="DressNormal",
			chance=10,
			gender="female",
		},
		DressShort = {
			name="DressShort",
			chance=10,
			gender="female",
		},
	}

	ZombiesZoneDefinition.MallLV = {
		SecurityMallLV = {
			name="SecurityMallLV",
			chance=Security,
		},
		Generic01 = {
			name="Generic01",
			chance=20,
		},
		Generic02 = {
			name="Generic02",
			chance=20,
		},
		Generic03 = {
			name="Generic03",
			chance=20,
		},
		Generic04 = {
			name="Generic04",
			chance=20,
		},
		Generic05 = {
			name="Generic05",
			chance=20,
		},
		Generic_Skirt = {
			name="Generic_Skirt",
			chance=20,
			gender="female",
		},
		DressLong = {
			name="DressLong",
			chance=10,
			gender="female",
		},
		DressNormal = {
			name="DressNormal",
			chance=10,
			gender="female",
		},
		DressShort = {
			name="DressShort",
			chance=10,
			gender="female",
		},
	}

	ZombiesZoneDefinition.HotelHav = {
		SecurityHotelHavisham = {
			name="SecurityHotelHavisham",
			chance=Security,
		},
		Tourist = {
			name="Tourist",
			chance=20,
		},
		Golfer = {
			name="Golfer",
			chance=15,
		},
		Classy = {
			name="Classy",
			chance=20,
		},
	}

	ZombiesZoneDefinition.HotelFancy = {
		SecurityHotelFancy = {
			name="SecurityHotelFancy",
			chance=Security,
		},
		Tourist = {
			name="Tourist",
			chance=20,
		},
		Golfer = {
			name="Golfer",
			chance=15,
		},
		Classy = {
			name="Classy",
			chance=20,
		},
	}

	if SandboxVars.STR.VestRosewood then

		ZombiesZoneDefinition.RosewoodSD = {
			PoliceRosewood = {
				name="PoliceRosewood",
				chance=RosewoodSD,
			},
			PoliceRosewoodRiot = {
				name="PoliceRosewoodRiot",
				chance=Riot,
			},
			PoliceRosewoodDress = {
				name="PoliceRosewoodDress",
				chance=Dress,
			},
			OfficeWorkerSkirt = {
				name="OfficeWorkerSkirt",
				chance=20,
				gender="female",
			},
			OfficeWorker = {
				name="OfficeWorker",
				chance=20,
				gender="male",
				beardStyles="null:80",
			},
		}

	elseif not SandboxVars.STR.VestRosewood then

		ZombiesZoneDefinition.RosewoodSD = {
			PoliceRosewoodNoVest = {
				name="PoliceRosewoodNoVest",
				chance=RosewoodSD,
			},
			PoliceRosewoodRiotNoVest = {
				name="PoliceRosewoodRiotNoVest",
				chance=Riot,
			},
			PoliceRosewoodDress = {
				name="PoliceRosewoodDress",
				chance=Dress,
			},
			OfficeWorkerSkirt = {
				name="OfficeWorkerSkirt",
				chance=20,
				gender="female",
			},
			OfficeWorker = {
				name="OfficeWorker",
				chance=20,
				gender="male",
				beardStyles="null:80",
			},
		}

	end

	if SandboxVars.STR.VestRiverside then

		ZombiesZoneDefinition.RiversidePD = {
			PoliceRiverside = {
				name="PoliceRiverside",
				chance=RiversidePD,
			},
			PoliceRiversideRiot = {
				name="PoliceRiversideRiot",
				chance=Riot,
			},
			PoliceRiversideDress = {
				name="PoliceRiversideDress",
				chance=Dress,
			},
			OfficeWorkerSkirt = {
				name="OfficeWorkerSkirt",
				chance=20,
				gender="female",
			},
			OfficeWorker = {
				name="OfficeWorker",
				chance=20,
				gender="male",
				beardStyles="null:80",
			},
		}

	elseif not SandboxVars.STR.VestRiverside then

		ZombiesZoneDefinition.RiversidePD = {
			PoliceRiversideNoVest = {
				name="PoliceRiversideNoVest",
				chance=RiversidePD,
			},
			PoliceRiversideRiotNoVest = {
				name="PoliceRiversideRiotNoVest",
				chance=Riot,
			},
			PoliceRiversideDress = {
				name="PoliceRiversideDress",
				chance=Dress,
			},
			OfficeWorkerSkirt = {
				name="OfficeWorkerSkirt",
				chance=20,
				gender="female",
			},
			OfficeWorker = {
				name="OfficeWorker",
				chance=20,
				gender="male",
				beardStyles="null:80",
			},
		}

	end

	if SandboxVars.STR.VestMuldraugh then

		ZombiesZoneDefinition.MuldraughPD = {
			PoliceMuldraugh = {
				name="PoliceMuldraugh",
				chance=MuldraughPD,
			},
			PoliceMuldraughRiot = {
				name="PoliceMuldraughRiot",
				chance=Riot,
			},
			PoliceMuldraughDress = {
				name="PoliceMuldraughDress",
				chance=Dress,
			},
			OfficeWorkerSkirt = {
				name="OfficeWorkerSkirt",
				chance=20,
				gender="female",
			},
			OfficeWorker = {
				name="OfficeWorker",
				chance=20,
				gender="male",
				beardStyles="null:80",
			},
		}

	elseif not SandboxVars.STR.VestMuldraugh then

		ZombiesZoneDefinition.MuldraughPD = {
			PoliceMuldraughNoVest = {
				name="PoliceMuldraughNoVest",
				chance=MuldraughPD,
			},
			PoliceMuldraughRiotNoVest = {
				name="PoliceMuldraughRiotNoVest",
				chance=Riot,
			},
			PoliceMuldraughDress = {
				name="PoliceMuldraughDress",
				chance=Dress,
			},
			OfficeWorkerSkirt = {
				name="OfficeWorkerSkirt",
				chance=20,
				gender="female",
			},
			OfficeWorker = {
				name="OfficeWorker",
				chance=20,
				gender="male",
				beardStyles="null:80",
			},
		}

	end

	if SandboxVars.STR.VestWestPoint then

		ZombiesZoneDefinition.WestPointPD = {
			PoliceWestPoint = {
				name="PoliceWestPoint",
				chance=WestPointPD,
			},
			PoliceWestPointRiot = {
				name="PoliceWestPointRiot",
				chance=Riot,
			},
			PoliceWestPointDress = {
				name="PoliceWestPointDress",
				chance=Dress,
			},
			OfficeWorkerSkirt = {
				name="OfficeWorkerSkirt",
				chance=20,
				gender="female",
			},
			OfficeWorker = {
				name="OfficeWorker",
				chance=20,
				gender="male",
				beardStyles="null:80",
			},
		}

	elseif not SandboxVars.STR.VestWestPoint then

		ZombiesZoneDefinition.WestPointPD = {
			PoliceWestPointNoVest = {
				name="PoliceWestPointNoVest",
				chance=WestPointPD,
			},
			PoliceWestPointRiotNoVest = {
				name="PoliceWestPointRiotNoVest",
				chance=Riot,
			},
			PoliceWestPointDress = {
				name="PoliceWestPointDress",
				chance=Dress,
			},
			OfficeWorkerSkirt = {
				name="OfficeWorkerSkirt",
				chance=20,
				gender="female",
			},
			OfficeWorker = {
				name="OfficeWorker",
				chance=20,
				gender="male",
				beardStyles="null:80",
			},
		}

	end

	if SandboxVars.STR.VestJeffersonSD then

		ZombiesZoneDefinition.JeffersonSD = {
			PoliceJeffersonSD = {
				name="PoliceJeffersonSD",
				chance=JeffersonSD,
			},
			PoliceJeffersonSDRiot = {
				name="PoliceJeffersonSDRiot",
				chance=Riot,
			},
			PoliceJeffersonSDDress = {
				name="PoliceJeffersonSDDress",
				chance=Dress,
			},
			OfficeWorkerSkirt = {
				name="OfficeWorkerSkirt",
				chance=20,
				gender="female",
			},
			OfficeWorker = {
				name="OfficeWorker",
				chance=20,
				gender="male",
				beardStyles="null:80",
			},
		}

	elseif not SandboxVars.STR.VestJeffersonSD then

		ZombiesZoneDefinition.JeffersonSD = {
			PoliceJeffersonSDNoVest = {
				name="PoliceJeffersonSDNoVest",
				chance=JeffersonSD,
			},
			PoliceJeffersonSDRiotNoVest = {
				name="PoliceJeffersonSDRiotNoVest",
				chance=Riot,
			},
			PoliceJeffersonSDDress = {
				name="PoliceJeffersonSDDress",
				chance=Dress,
			},
			OfficeWorkerSkirt = {
				name="OfficeWorkerSkirt",
				chance=20,
				gender="female",
			},
			OfficeWorker = {
				name="OfficeWorker",
				chance=20,
				gender="male",
				beardStyles="null:80",
			},
		}

	end

	if SandboxVars.STR.VestJeffersonPD then

		ZombiesZoneDefinition.JeffersonPD = {
			PoliceJeffersonPD = {
				name="PoliceJeffersonPD",
				chance=JeffersonPD,
			},
			PoliceJeffersonPDRiot = {
				name="PoliceJeffersonPDRiot",
				chance=Riot,
			},
			PoliceJeffersonPDDress = {
				name="PoliceJeffersonPDDress",
				chance=Dress,
			},
			OfficeWorkerSkirt = {
				name="OfficeWorkerSkirt",
				chance=20,
				gender="female",
			},
			OfficeWorker = {
				name="OfficeWorker",
				chance=20,
				gender="male",
				beardStyles="null:80",
			},
		}

	elseif not SandboxVars.STR.VestJeffersonPD then

		ZombiesZoneDefinition.JeffersonPD = {
			PoliceJeffersonPDNoVest = {
				name="PoliceJeffersonPDNoVest",
				chance=JeffersonPD,
			},
			PoliceJeffersonPDRiotNoVest = {
				name="PoliceJeffersonPDRiotNoVest",
				chance=Riot,
			},
			PoliceJeffersonPDDress = {
				name="PoliceJeffersonPDDress",
				chance=Dress,
			},
			OfficeWorkerSkirt = {
				name="OfficeWorkerSkirt",
				chance=20,
				gender="female",
			},
			OfficeWorker = {
				name="OfficeWorker",
				chance=20,
				gender="male",
				beardStyles="null:80",
			},
		}

	end

	if SandboxVars.STR.VestLouisville then

		ZombiesZoneDefinition.LouisvillePD = {
			PoliceLouisville = {
				name="PoliceLouisville",
				chance=LouisvillePD,
			},
			PoliceLouisvilleRiot = {
				name="PoliceLouisvilleRiot",
				chance=Riot,
			},
			PoliceLouisvilleDress = {
				name="PoliceLouisvilleDress",
				chance=Dress,
			},
			OfficeWorkerSkirt = {
				name="OfficeWorkerSkirt",
				chance=20,
				gender="female",
			},
			OfficeWorker = {
				name="OfficeWorker",
				chance=20,
				gender="male",
				beardStyles="null:80",
			},
		}

	elseif not SandboxVars.STR.VestLouisville then

		ZombiesZoneDefinition.LouisvillePD = {
			PoliceLouisvilleNoVest = {
				name="PoliceLouisvilleNoVest",
				chance=LouisvillePD,
			},
			PoliceLouisvilleRiotNoVest = {
				name="PoliceLouisvilleRiotNoVest",
				chance=Riot,
			},
			PoliceLouisvilleDress = {
				name="PoliceLouisvilleDress",
				chance=Dress,
			},
			OfficeWorkerSkirt = {
				name="OfficeWorkerSkirt",
				chance=20,
				gender="female",
			},
			OfficeWorker = {
				name="OfficeWorker",
				chance=20,
				gender="male",
				beardStyles="null:80",
			},
		}

	end

	if SandboxVars.STR.VestMeade then

		ZombiesZoneDefinition.MeadeSO = {
			PoliceMeade = {
				name="PoliceMeade",
				chance=MeadeSO,
			},
			PoliceMeadeRiot = {
				name="PoliceMeadeRiot",
				chance=Riot,
			},
			PoliceMeadeDress = {
				name="PoliceMeadeDress",
				chance=Dress,
			},
			OfficeWorkerSkirt = {
				name="OfficeWorkerSkirt",
				chance=20,
				gender="female",
			},
			OfficeWorker = {
				name="OfficeWorker",
				chance=20,
				gender="male",
				beardStyles="null:80",
			},
		}

	elseif not SandboxVars.STR.VestMeade then

		ZombiesZoneDefinition.MeadeSO = {
			PoliceMeadeNoVest = {
				name="PoliceMeadeNoVest",
				chance=MeadeSO,
			},
			PoliceMeadeRiotNoVest = {
				name="PoliceMeadeRiotNoVest",
				chance=Riot,
			},
			PoliceMeadeDress = {
				name="PoliceMeadeDress",
				chance=Dress,
			},
			OfficeWorkerSkirt = {
				name="OfficeWorkerSkirt",
				chance=20,
				gender="female",
			},
			OfficeWorker = {
				name="OfficeWorker",
				chance=20,
				gender="male",
				beardStyles="null:80",
			},
		}

	end

	ZombiesZoneDefinition.LouisvilleKSP = {
		KSP_Trooper = {
			name="KSP_Trooper",
			chance=KSP_Trooper,
		},
		KSP_TrooperRiot = {
			name="KSP_TrooperRiot",
			chance=Riot,
		},
		KSP_TrooperDress = {
			name="KSP_TrooperDress",
			chance=Dress,
		},
		OfficeWorkerSkirt = {
			name="OfficeWorkerSkirt",
			chance=20,
			gender="female",
		},
		OfficeWorker = {
			name="OfficeWorker",
			chance=20,
			gender="male",
			beardStyles="null:80",
		},
	}

	ZombiesZoneDefinition.LouisvilleKSPJail = {
		-- Gonna force male zombies
		maleChance = 80,
		PrisonGuard = {
			name="KSP_Trooper",
			chance=KSP_Trooper,
			gender="male",
		},
		Security = {
			name="KSP_Trooper",
			gender="male",
			chance=KSP_Trooper,
			room="security",
		},
		Inmate = {
			name="Inmate",
			chance=JeffersonInmate,
			gender="male",
			room="prisoncells;hall;cafeteria;classroom;laundry;janitor",
		},
		-- this one is used for lower chance of inmate in some rooms
		InmateLowerZone = {
			name="Inmate",
			chance=JeffersonInmate,
			gender="male",
			room="bathroom;kitchen;medicalstorage;library",
		},
	}

	ZombiesZoneDefinition.RosewoodPrison = {
		-- Gonna force male zombies in prison
		maleChance = 80,
		Doctor = {
			name="Doctor",
			chance=2,
		},
		Priest = {
			name="Priest",
			toSpawn=1,
			gender="male",
			mandatory="true",
		},
		Doctor2 = {
			name="Doctor",
			chance=20,
			room="medicalstorage",
		},
		Nurse = {
			name="Nurse",
			chance=30,
			room="medicalstorage",
		},
		Priest = {
			name="Priest",
			mandatory="true",
			toSpawn=1,
			gender="male",
		},
		Waiter_Diner = {
			name="Waiter_Diner",
			chance=2,
		},
		PrisonGuard = {
			name="DOC_Meade",
			chance=DOC,
			gender="male",
		},
		OfficeWorkerSkirt = {
			name="OfficeWorkerSkirt",
			gender="female",
			chance=30,
			room="office",
		},
		OfficeWorker = {
			name="OfficeWorker",
			gender="male",
			chance=30,
			room="office",
			beardStyles="null:80",
		},
		Security = {
			name="DOC_Meade",
			gender="male",
			chance=DOC,
			room="security",
		},
		InmateMeadeOrange = {
			name="InmateMeadeOrange",
			chance=MeadeInmateOrange,
			gender="male",
			room="prisoncells;hall;cafeteria;classroom;laundry;janitor",
		},
		-- this one is used for lower chance of inmate in some rooms
		InmateMeadeOrangeLowerZone = {
			name="InmateMeadeOrange",
			chance=MeadeInmateOrangeLower,
			gender="male",
			room="bathroom;kitchen;medicalstorage;library",
		},
		InmateMeadeYellow = {
			name="InmateMeadeYellow",
			chance=MeadeInmateYellow,
			gender="male",
			room="prisoncells;hall;cafeteria;classroom;laundry;janitor",
		},
		-- this one is used for lower chance of inmate in some rooms
		InmateMeadeYellowLowerZone = {
			name="InmateMeadeYellow",
			chance=MeadeInmateYellow,
			gender="male",
			room="bathroom;kitchen;medicalstorage;library",
		},
		Naked = {
			name="Naked",
			chance=50,
			gender="male",
			room="bathroom",
		},
		Cook_Generic = {
			name="Cook_Generic",
			chance=30,
			gender="male",
			room="kitchen",
		},
	}

	ZombiesZoneDefinition.RosewoodPrisonMax = {
		-- Gonna force male zombies in prison
		maleChance = 80,
		Doctor = {
			name="Doctor",
			chance=2,
		},
		Priest = {
			name="Priest",
			toSpawn=1,
			gender="male",
			mandatory="true",
		},
		Doctor2 = {
			name="Doctor",
			chance=20,
			room="medicalstorage",
		},
		Nurse = {
			name="Nurse",
			chance=30,
			room="medicalstorage",
		},
		Priest = {
			name="Priest",
			mandatory="true",
			toSpawn=1,
			gender="male",
		},
		Waiter_Diner = {
			name="Waiter_Diner",
			chance=2,
		},
		PrisonGuard = {
			name="DOC_Meade",
			chance=DOC,
			gender="male",
		},
		OfficeWorkerSkirt = {
			name="OfficeWorkerSkirt",
			gender="female",
			chance=30,
			room="office",
		},
		OfficeWorker = {
			name="OfficeWorker",
			gender="male",
			chance=30,
			room="office",
			beardStyles="null:80",
		},
		Security = {
			name="DOC_Meade",
			gender="male",
			chance=DOC,
			room="security",
		},
		InmateMeadeRed = {
			name="InmateMeadeRed",
			chance=MeadeInmateRed,
			gender="male",
			room="prisoncells;hall;cafeteria;classroom;laundry;janitor",
		},
		-- this one is used for lower chance of inmate in some rooms
		InmateMeadeRedLowerZone = {
			name="InmateMeadeRed",
			chance=MeadeInmateRed,
			gender="male",
			room="bathroom;kitchen;medicalstorage;library",
		},
		Naked = {
			name="Naked",
			chance=50,
			gender="male",
			room="bathroom",
		},
		Cook_Generic = {
			name="Cook_Generic",
			chance=30,
			gender="male",
			room="kitchen",
		},
	}

	ZombiesZoneDefinition.LouisvillePDPrison = {
		-- Gonna force male zombies in prison
		maleChance = 80,
		Doctor = {
			name="Doctor",
			chance=2,
		},
		Priest = {
			name="Priest",
			toSpawn=1,
			gender="male",
			mandatory="true",
		},
		Doctor2 = {
			name="Doctor",
			chance=20,
			room="medicalstorage",
		},
		Nurse = {
			name="Nurse",
			chance=30,
			room="medicalstorage",
		},
		Priest = {
			name="Priest",
			mandatory="true",
			toSpawn=1,
			gender="male",
		},
		Waiter_Diner = {
			name="Waiter_Diner",
			chance=2,
		},
		PrisonGuard = {
			name="DOC_Jefferson",
			chance=DOC,
			gender="male",
		},
		OfficeWorkerSkirt = {
			name="OfficeWorkerSkirt",
			gender="female",
			chance=30,
			room="office",
		},
		OfficeWorker = {
			name="OfficeWorker",
			gender="male",
			chance=30,
			room="office",
			beardStyles="null:80",
		},
		Security = {
			name="DOC_Jefferson",
			gender="male",
			chance=DOC,
			room="security",
		},
		Inmate = {
			name="InmateJefferson",
			chance=JeffersonInmate,
			gender="male",
			room="prisoncells;hall;cafeteria;classroom;laundry;janitor",
		},
		-- this one is used for lower chance of inmate in some rooms
		InmateLowerZone = {
			name="InmateJefferson",
			chance=JeffersonInmate,
			gender="male",
			room="bathroom;kitchen;medicalstorage;library",
		},
		Naked = {
			name="Naked",
			chance=50,
			gender="male",
			room="bathroom",
		},
		Cook_Generic = {
			name="Cook_Generic",
			chance=30,
			gender="male",
			room="kitchen",
		},
	}

	ZombiesZoneDefinition.JeffersonPDJail = {
		-- Gonna force male zombies
		maleChance = 80,
		PrisonGuard = {
			name="PoliceJeffersonPD",
			chance=JeffersonPD,
			gender="male",
		},
		Security = {
			name="PoliceJeffersonPD",
			gender="male",
			chance=JeffersonPD,
			room="security",
		},
		Inmate = {
			name="Inmate",
			chance=JeffersonInmate,
			gender="male",
			room="prisoncells;hall;cafeteria;classroom;laundry;janitor",
		},
		-- this one is used for lower chance of inmate in some rooms
		InmateLowerZone = {
			name="Inmate",
			chance=JeffersonInmate,
			gender="male",
			room="bathroom;kitchen;medicalstorage;library",
		},
	}

	ZombiesZoneDefinition.JeffersonSDJail = {
		-- Gonna force male zombies
		maleChance = 80,
		PrisonGuard = {
			name="PoliceJeffersonSD",
			chance=JeffersonSD,
			gender="male",
		},
		Security = {
			name="PoliceJeffersonSD",
			gender="male",
			chance=JeffersonSD,
			room="security",
		},
		Inmate = {
			name="Inmate",
			chance=JeffersonInmate,
			gender="male",
			room="prisoncells;hall;cafeteria;classroom;laundry;janitor",
		},
		-- this one is used for lower chance of inmate in some rooms
		InmateLowerZone = {
			name="Inmate",
			chance=JeffersonInmate,
			gender="male",
			room="bathroom;kitchen;medicalstorage;library",
		},
	}

	ZombiesZoneDefinition.MeadeRangers = {
		FederalRanger = {
			name="FederalRanger",
			chance=Ranger,
		},
		FederalRangerDress = {
			name="FederalRangerDress",
			chance=Dress,
		},
		State_LawRanger = {
			name="State_LawRanger",
			chance=Ranger,
		},
		State_LawRangerDress = {
			name="State_LawRangerDress",
			chance=Dress,
		},
		StateRanger = {
			name="StateRanger",
			chance=Ranger,
		},
		StateRangerDress = {
			name="StateRangerDress",
			chance=Dress,
		},
	}

	ZombiesZoneDefinition.MeadeEMS = {
		EMSMeade = {
			name="EMSMeade",
			chance=EMS,
		},
		EMSMeadeDress = {
			name="EMSMeadeDress",
			chance=Dress,
		},
		Doctor = {
			name="Doctor",
			chance=3,
		},
		Nurse = {
			name="Nurse",
			chance=5,
		},
	}

	ZombiesZoneDefinition.LouisvilleEMS = {
		EMSLouisville = {
			name="EMSLouisville",
			chance=EMS,
		},
		EMSLouisvilleDress = {
			name="EMSLouisvilleDress",
			chance=Dress,
		},
		Doctor = {
			name="Doctor",
			chance=3,
		},
		Nurse = {
			name="Nurse",
			chance=5,
		},
	}

	ZombiesZoneDefinition.JeffersonEMS = {
		EMSJefferson = {
			name="EMSJefferson",
			chance=EMS,
		},
		EMSJeffersonDress = {
			name="EMSJeffersonDress",
			chance=Dress,
		},
		Doctor = {
			name="Doctor",
			chance=3,
		},
		Nurse = {
			name="Nurse",
			chance=5,
		},
	}

	ZombiesZoneDefinition.FireDeptRW = {
		Fireman_Meade_Formal = {
			name="Fireman_Meade_Formal",
			chance=FireFormal,
		},
		Fireman_Meade_Formal_Supervisor = {
			name="Fireman_Meade_Formal_Supervisor",
			chance=FireFormal,
		},
		Fireman_Rosewood_Formal = {
			name="Fireman_Rosewood_Formal",
			chance=FireFormal,
		},
		Fireman_Rosewood_Formal_Supervisor = {
			name="Fireman_Rosewood_Formal_Supervisor",
			chance=FireFormal,
		},
		Fireman_Meade_Black = {
			name="Fireman_Meade_Black",
			chance=Fireman,
		},
		FiremanFullSuit_Meade_Black = {
			name="FiremanFullSuit_Meade_Black",
			chance=FiremanFull,
		},
		Fireman_Meade_Khaki = {
			name="Fireman_Meade_Khaki",
			chance=Fireman,
		},
		FiremanFullSuit_Meade_Khaki = {
			name="FiremanFullSuit_Meade_Khaki",
			chance=FiremanFull,
		},
		Fireman_Rosewood_Black = {
			name="Fireman_Rosewood_Black",
			chance=Fireman,
		},
		FiremanFullSuit_Rosewood_Black = {
			name="FiremanFullSuit_Rosewood_Black",
			chance=FiremanFull,
		},
		Fireman_Rosewood_Khaki = {
			name="Fireman_Rosewood_Khaki",
			chance=Fireman,
		},
		FiremanFullSuit_Rosewood_Khaki = {
			name="FiremanFullSuit_Rosewood_Khaki",
			chance=FiremanFull,
		},
	}

	ZombiesZoneDefinition.FireDeptLV = {
		Fireman_Louisville_Formal = {
			name="Fireman_Louisville_Formal",
			chance=FireFormal,
		},
		Fireman_Louisville_Formal_Supervisor = {
			name="Fireman_Louisville_Formal_Supervisor",
			chance=FireFormal,
		},
		Fireman_Louisville_Dress_Supervisor = {
			name="Fireman_Louisville_Dress_Supervisor",
			chance=Dress,
		},
		Fireman_Louisville_Black = {
			name="Fireman_Louisville_Black",
			chance=Fireman,
		},
		FiremanFullSuit_Louisville_Black = {
			name="FiremanFullSuit_Louisville_Black",
			chance=FiremanFull,
		},
		Fireman_Louisville_Khaki = {
			name="Fireman_Louisville_Khaki",
			chance=Fireman,
		},
		FiremanFullSuit_Louisville_Khaki = {
			name="FiremanFullSuit_Louisville_Khaki",
			chance=FiremanFull,
		},
	}

	ZombiesZoneDefinition.USPS = {
		USPS_Mail = {
			name="USPS_Mail",
			chance=USPS,
		},
		OfficeWorkerSkirt = {
			name="OfficeWorkerSkirt",
			chance=20,
			gender="female",
		},
		OfficeWorker = {
			name="OfficeWorker",
			chance=20,
			gender="male",
			beardStyles="null:80",
		},
	}

	ZombiesZoneDefinition.CourtHouse = {
		Judge = {
			name="Judge",
			chance=Other,
		},
		OfficeWorkerSkirt = {
			name="OfficeWorkerSkirt",
			chance=35,
			gender="female",
		},
		OfficeWorker = {
			name="OfficeWorker",
			chance=35,
			gender="male",
			beardStyles="null:80",
		},
		Trader = {
			name="Trader",
			chance=15,
			beardStyles="null:80",
		},
	}

		if SandboxVars.STR.DuffelLoot then

			table.insert(ZombiesZoneDefinition.USPS,{name = "USPS_Mail_Bag", chance=Duffel});
			table.insert(ZombiesZoneDefinition.LouisvilleKSP,{name = "KSP_Trooper_Bag", chance=Duffel});
			table.insert(ZombiesZoneDefinition.MeadeRangers,{name = "FederalRanger_Bag", chance=Duffel});
			table.insert(ZombiesZoneDefinition.MeadeRangers,{name = "StateRanger_Bag", chance=Duffel});
			table.insert(ZombiesZoneDefinition.MeadeRangers,{name = "State_LawRanger_Bag", chance=Duffel});

			if SandboxVars.STR.VestRosewood then
				table.insert(ZombiesZoneDefinition.RosewoodSD,{name = "PoliceRosewood_Bag", chance=Duffel});
			elseif not SandboxVars.STR.VestRosewood then
				table.insert(ZombiesZoneDefinition.RosewoodSD,{name = "PoliceRosewoodNoVest_Bag", chance=Duffel});
			end
			if SandboxVars.STR.VestRiverside then
				table.insert(ZombiesZoneDefinition.RiversidePD,{name = "PoliceRiverside_Bag", chance=Duffel});
			elseif not SandboxVars.STR.VestRiverside then
				table.insert(ZombiesZoneDefinition.RiversidePD,{name = "PoliceRiversideNoVest_Bag", chance=Duffel});
			end
			if SandboxVars.STR.VestMuldraugh then
				table.insert(ZombiesZoneDefinition.MuldraughPD,{name = "PoliceMuldraugh_Bag", chance=Duffel});
			elseif not SandboxVars.STR.VestMuldraugh then
				table.insert(ZombiesZoneDefinition.MuldraughPD,{name = "PoliceMuldraughNoVest_Bag", chance=Duffel});
			end
			if SandboxVars.STR.VestWestPoint then
				table.insert(ZombiesZoneDefinition.WestPointPD,{name = "PoliceWestPoint_Bag", chance=Duffel});
			elseif not SandboxVars.STR.VestWestPoint then
				table.insert(ZombiesZoneDefinition.WestPointPD,{name = "PoliceWestPointNoVest_Bag", chance=Duffel});
			end
			if SandboxVars.STR.VestJeffersonSD then
				table.insert(ZombiesZoneDefinition.JeffersonSD,{name = "PoliceJeffersonSD_Bag", chance=Duffel});
			elseif not SandboxVars.STR.VestJeffersonSD then
				table.insert(ZombiesZoneDefinition.JeffersonSD,{name = "PoliceJeffersonSDNoVest_Bag", chance=Duffel});
			end
			if SandboxVars.STR.VestJeffersonPD then
				table.insert(ZombiesZoneDefinition.JeffersonPD,{name = "PoliceJeffersonPD_Bag", chance=Duffel});
			elseif not SandboxVars.STR.VestJeffersonPD then
				table.insert(ZombiesZoneDefinition.JeffersonPD,{name = "PoliceJeffersonPDNoVest_Bag", chance=Duffel});
			end
			if SandboxVars.STR.VestLouisville then
				table.insert(ZombiesZoneDefinition.LouisvillePD,{name = "PoliceLouisville_Bag", chance=Duffel});
			elseif not SandboxVars.STR.VestLouisville then
				table.insert(ZombiesZoneDefinition.LouisvillePD,{name = "PoliceLouisvilleNoVest_Bag", chance=Duffel});
			end
			if SandboxVars.STR.VestMeade then
				table.insert(ZombiesZoneDefinition.MeadeSO,{name = "PoliceMeade_Bag", chance=Duffel});
			elseif not SandboxVars.STR.VestMeade then
				table.insert(ZombiesZoneDefinition.MeadeSO,{name = "PoliceMeadeNoVest_Bag", chance=Duffel});
			end
			if getActivatedMods():contains("RavenCreek") then
				if SandboxVars.STR.VestRavenCreek then
					table.insert(ZombiesZoneDefinition.PoliceRavenCreek,{name = "PoliceRavenCreek_Bag", chance=Duffel});
				elseif not SandboxVars.STR.VestRavenCreek then
					table.insert(ZombiesZoneDefinition.PoliceRavenCreek,{name = "PoliceRavenCreekNoVest_Bag", chance=Duffel});
				end
			end
		end

		if getActivatedMods():contains("TWDRG") then

			table.insert(ZombiesZoneDefinition.MuldraughPD,{name = "PoliceSheriff", chance=35});
			table.insert(ZombiesZoneDefinition.WestPointPD,{name = "PoliceSheriff", chance=35});
			table.insert(ZombiesZoneDefinition.MeadeSO,{name = "PoliceSheriff", chance=35});
			table.insert(ZombiesZoneDefinition.RiversidePD,{name = "PoliceSheriff", chance=35});
			table.insert(ZombiesZoneDefinition.RosewoodSD,{name = "PoliceSheriff", chance=35});
			table.insert(ZombiesZoneDefinition.LouisvillePD,{name = "PoliceSheriff", chance=35});
			table.insert(ZombiesZoneDefinition.JeffersonPD,{name = "PoliceSheriff", chance=35});
			table.insert(ZombiesZoneDefinition.JeffersonSD,{name = "PoliceSheriff", chance=35});

		end

		if getActivatedMods():contains("SLEO") then

			table.insert(ZombiesZoneDefinition.MuldraughPD,{name = "SharkBlueSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.MuldraughPD,{name = "SharkBlueSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.MuldraughPD,{name = "SharkBlueSWATGasMask", chance=5});
			table.insert(ZombiesZoneDefinition.MuldraughPD,{name = "SharkBlueSWATRiot", chance=5});
			table.insert(ZombiesZoneDefinition.MuldraughPD,{name = "SharkBlackSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.MuldraughPD,{name = "SharkBlackSWATRiot", chance=5});
			table.insert(ZombiesZoneDefinition.MuldraughPD,{name = "SharkBlackSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.MuldraughPD,{name = "SharkGreenSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.MuldraughPD,{name = "SharkGreenSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.MuldraughPD,{name = "SharkGreenSWATGasMask", chance=5});
			table.insert(ZombiesZoneDefinition.MuldraughPD,{name = "SharkGreenSWATRiot", chance=5});

			table.insert(ZombiesZoneDefinition.WestPointPD,{name = "SharkBlueSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.WestPointPD,{name = "SharkBlueSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.WestPointPD,{name = "SharkBlueSWATGasMask", chance=5});
			table.insert(ZombiesZoneDefinition.WestPointPD,{name = "SharkBlueSWATRiot", chance=5});
			table.insert(ZombiesZoneDefinition.WestPointPD,{name = "SharkBlackSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.WestPointPD,{name = "SharkBlackSWATRiot", chance=5});
			table.insert(ZombiesZoneDefinition.WestPointPD,{name = "SharkBlackSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.WestPointPD,{name = "SharkGreenSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.WestPointPD,{name = "SharkGreenSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.WestPointPD,{name = "SharkGreenSWATGasMask", chance=5});
			table.insert(ZombiesZoneDefinition.WestPointPD,{name = "SharkGreenSWATRiot", chance=5});

			table.insert(ZombiesZoneDefinition.MeadeSO,{name = "SharkBlueSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.MeadeSO,{name = "SharkBlueSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.MeadeSO,{name = "SharkBlueSWATGasMask", chance=5});
			table.insert(ZombiesZoneDefinition.MeadeSO,{name = "SharkBlueSWATRiot", chance=5});
			table.insert(ZombiesZoneDefinition.MeadeSO,{name = "SharkBlackSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.MeadeSO,{name = "SharkBlackSWATRiot", chance=5});
			table.insert(ZombiesZoneDefinition.MeadeSO,{name = "SharkBlackSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.MeadeSO,{name = "SharkGreenSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.MeadeSO,{name = "SharkGreenSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.MeadeSO,{name = "SharkGreenSWATGasMask", chance=5});
			table.insert(ZombiesZoneDefinition.MeadeSO,{name = "SharkGreenSWATRiot", chance=5});

			table.insert(ZombiesZoneDefinition.RiversidePD,{name = "SharkBlueSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.RiversidePD,{name = "SharkBlueSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.RiversidePD,{name = "SharkBlueSWATGasMask", chance=5});
			table.insert(ZombiesZoneDefinition.RiversidePD,{name = "SharkBlueSWATRiot", chance=5});
			table.insert(ZombiesZoneDefinition.RiversidePD,{name = "SharkBlackSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.RiversidePD,{name = "SharkBlackSWATRiot", chance=5});
			table.insert(ZombiesZoneDefinition.RiversidePD,{name = "SharkBlackSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.RiversidePD,{name = "SharkGreenSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.RiversidePD,{name = "SharkGreenSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.RiversidePD,{name = "SharkGreenSWATGasMask", chance=5});
			table.insert(ZombiesZoneDefinition.RiversidePD,{name = "SharkGreenSWATRiot", chance=5});

			table.insert(ZombiesZoneDefinition.RosewoodSD,{name = "SharkBlueSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.RosewoodSD,{name = "SharkBlueSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.RosewoodSD,{name = "SharkBlueSWATGasMask", chance=5});
			table.insert(ZombiesZoneDefinition.RosewoodSD,{name = "SharkBlueSWATRiot", chance=5});
			table.insert(ZombiesZoneDefinition.RosewoodSD,{name = "SharkBlackSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.RosewoodSD,{name = "SharkBlackSWATRiot", chance=5});
			table.insert(ZombiesZoneDefinition.RosewoodSD,{name = "SharkBlackSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.RosewoodSD,{name = "SharkGreenSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.RosewoodSD,{name = "SharkGreenSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.RosewoodSD,{name = "SharkGreenSWATGasMask", chance=5});
			table.insert(ZombiesZoneDefinition.RosewoodSD,{name = "SharkGreenSWATRiot", chance=5});

			table.insert(ZombiesZoneDefinition.LouisvillePD,{name = "SharkBlueSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvillePD,{name = "SharkBlueSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvillePD,{name = "SharkBlueSWATGasMask", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvillePD,{name = "SharkBlueSWATRiot", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvillePD,{name = "SharkBlackSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvillePD,{name = "SharkBlackSWATRiot", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvillePD,{name = "SharkBlackSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvillePD,{name = "SharkGreenSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvillePD,{name = "SharkGreenSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvillePD,{name = "SharkGreenSWATGasMask", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvillePD,{name = "SharkGreenSWATRiot", chance=5});

			table.insert(ZombiesZoneDefinition.JeffersonPD,{name = "SharkBlueSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonPD,{name = "SharkBlueSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonPD,{name = "SharkBlueSWATGasMask", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonPD,{name = "SharkBlueSWATRiot", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonPD,{name = "SharkBlackSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonPD,{name = "SharkBlackSWATRiot", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonPD,{name = "SharkBlackSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonPD,{name = "SharkGreenSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonPD,{name = "SharkGreenSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonPD,{name = "SharkGreenSWATGasMask", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonPD,{name = "SharkGreenSWATRiot", chance=5});

			table.insert(ZombiesZoneDefinition.JeffersonSD,{name = "SharkBlueSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonSD,{name = "SharkBlueSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonSD,{name = "SharkBlueSWATGasMask", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonSD,{name = "SharkBlueSWATRiot", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonSD,{name = "SharkBlackSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonSD,{name = "SharkBlackSWATRiot", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonSD,{name = "SharkBlackSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonSD,{name = "SharkGreenSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonSD,{name = "SharkGreenSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonSD,{name = "SharkGreenSWATGasMask", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonSD,{name = "SharkGreenSWATRiot", chance=5});

			table.insert(ZombiesZoneDefinition.LouisvilleKSP,{name = "SharkBlueSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvilleKSP,{name = "SharkBlueSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvilleKSP,{name = "SharkBlueSWATGasMask", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvilleKSP,{name = "SharkBlueSWATRiot", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvilleKSP,{name = "SharkBlackSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvilleKSP,{name = "SharkBlackSWATRiot", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvilleKSP,{name = "SharkBlackSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvilleKSP,{name = "SharkGreenSWATBelt", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvilleKSP,{name = "SharkGreenSWAT", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvilleKSP,{name = "SharkGreenSWATGasMask", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvilleKSP,{name = "SharkGreenSWATRiot", chance=5});

		end

		if getActivatedMods():contains("Susceptible") then

			table.insert(ZombiesZoneDefinition.MuldraughPD,{name = "SusceptiblePoliceMuldraugh", chance=5});

			table.insert(ZombiesZoneDefinition.WestPointPD,{name = "SusceptiblePoliceWestPoint", chance=5});

			table.insert(ZombiesZoneDefinition.MeadeSO,{name = "SusceptiblePoliceMeade", chance=5});

			table.insert(ZombiesZoneDefinition.RiversidePD,{name = "SusceptiblePoliceRiverside", chance=5});

			table.insert(ZombiesZoneDefinition.RosewoodSD,{name = "SusceptiblePoliceRosewood", chance=5});

			table.insert(ZombiesZoneDefinition.LouisvillePD,{name = "SusceptiblePoliceLouisville", chance=5});

			table.insert(ZombiesZoneDefinition.JeffersonPD,{name = "SusceptiblePoliceJeffersonPD", chance=5});

			table.insert(ZombiesZoneDefinition.JeffersonSD,{name = "SusceptiblePoliceJeffersonSD", chance=5});

			table.insert(ZombiesZoneDefinition.LouisvilleKSP,{name = "SusceptibleKSP_Trooper", chance=5});

			table.insert(ZombiesZoneDefinition.MeadeEMS,{name = "SusceptibleEMSMeade", chance=5});

			table.insert(ZombiesZoneDefinition.LouisvilleEMS,{name = "SusceptibleEMSLouisville", chance=5});

			table.insert(ZombiesZoneDefinition.JeffersonEMS,{name = "SusceptibleEMSJefferson", chance=5});

			table.insert(ZombiesZoneDefinition.FireDeptRW,{name = "SusceptibleFireman_Meade_Black", chance=5});
			table.insert(ZombiesZoneDefinition.FireDeptRW,{name = "SusceptibleFiremanFullSuit_Meade_Black", chance=5});
			table.insert(ZombiesZoneDefinition.FireDeptRW,{name = "SusceptibleFireman_Meade_Khaki", chance=5});
			table.insert(ZombiesZoneDefinition.FireDeptRW,{name = "SusceptibleFiremanFullSuit_Meade_Khaki", chance=5});
			table.insert(ZombiesZoneDefinition.FireDeptRW,{name = "SusceptibleFireman_Rosewood_Black", chance=5});
			table.insert(ZombiesZoneDefinition.FireDeptRW,{name = "SusceptibleFiremanFullSuit_Rosewood_Black", chance=5});
			table.insert(ZombiesZoneDefinition.FireDeptRW,{name = "SusceptibleFireman_Rosewood_Khaki", chance=5});
			table.insert(ZombiesZoneDefinition.FireDeptRW,{name = "SusceptibleFiremanFullSuit_Rosewood_Khaki", chance=5});

			table.insert(ZombiesZoneDefinition.FireDeptLV,{name = "SusceptibleFireman_Louisville_Black", chance=5});
			table.insert(ZombiesZoneDefinition.FireDeptLV,{name = "SusceptibleFiremanFullSuit_Louisville_Black", chance=5});
			table.insert(ZombiesZoneDefinition.FireDeptLV,{name = "SusceptibleFireman_Louisville_Khaki", chance=5});
			table.insert(ZombiesZoneDefinition.FireDeptLV,{name = "SusceptibleFiremanFullSuit_Louisville_Khaki", chance=5});

			table.insert(ZombiesZoneDefinition.MeadeRangers,{name = "SusceptibleFederalRanger", chance=5});
			table.insert(ZombiesZoneDefinition.MeadeRangers,{name = "SusceptibleState_LawRanger", chance=5});
			table.insert(ZombiesZoneDefinition.MeadeRangers,{name = "SusceptibleStateRanger", chance=5});

			table.insert(ZombiesZoneDefinition.LouisvilleKSPJail,{name = "SusceptibleKSP_Trooper", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvilleKSPJail,{name = "SusceptibleInmateJefferson", chance=5, gender="male"});

			table.insert(ZombiesZoneDefinition.RosewoodPrison,{name = "SusceptibleDOC_Meade", chance=5});
			table.insert(ZombiesZoneDefinition.RosewoodPrison,{name = "SusceptibleInmateMeadeOrange", chance=5, gender="male"});
			table.insert(ZombiesZoneDefinition.RosewoodPrison,{name = "SusceptibleInmateMeadeYellow", chance=5, gender="male"});

			table.insert(ZombiesZoneDefinition.RosewoodPrisonMax,{name = "SusceptibleDOC_Meade", chance=5});
			table.insert(ZombiesZoneDefinition.RosewoodPrisonMax,{name = "SusceptibleInmateMeadeRed", chance=5, gender="male"});

			table.insert(ZombiesZoneDefinition.LouisvillePDPrison,{name = "SusceptibleDOC_Jefferson", chance=5});
			table.insert(ZombiesZoneDefinition.LouisvillePDPrison,{name = "SusceptibleInmateJefferson", chance=5, gender="male"});

			table.insert(ZombiesZoneDefinition.JeffersonPDJail,{name = "SusceptiblePoliceJeffersonPD", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonPDJail,{name = "SusceptibleInmateJefferson", chance=5, gender="male"});

			table.insert(ZombiesZoneDefinition.JeffersonSDJail,{name = "SusceptiblePoliceJeffersonSD", chance=5});
			table.insert(ZombiesZoneDefinition.JeffersonSDJail,{name = "SusceptibleInmateJefferson", chance=5, gender="male"});

			if getActivatedMods():contains("RavenCreek") then
				table.insert(ZombiesZoneDefinition.PoliceRavenCreek,{name = "SusceptiblePoliceRavenCreek", chance=5});
			end
		end
	end
end

Events.OnInitGlobalModData.Add(STRSpawns);
