ZombiesZoneDefinition = ZombiesZoneDefinition or {};

-- name of the zone for the zone type ZombiesType (in worldzed)
ZombiesZoneDefinition.Wedding = {
	-- you have a 50% chance of having this zone spawning, to bring more randomness to the world
	chanceToSpawn = 0,
	-- max 1 wedding per map
	toSpawn = 0,
	-- Mandatory zed
	WeddingDress = {
		-- name of the outfit
		name="WeddingDress",
		-- number to spawn
		toSpawn=0,
		-- The wedding dress is only on female
		gender="female",
		-- we will be forced to spawn this one
		mandatory="true",
		-- need to be in that exact room
		room="church",
	},
	Groom = {
		name="Groom",
		toSpawn=0,
		gender="male",
		mandatory="true",
		room="church",
	},
	Priest = {
		name="Priest",
		toSpawn=0,
		gender="male",
		mandatory="true",
		room="church",
	},
	-- Others
	Classy = {
		name="Classy",
		-- Chance at 75 means 75% of the zombies spawning (except mandatory) will have this outfit, the other 10% will have generic, the total chance of them all should be <= 100
		chance=0,
		-- no gender selected because we have Classy outfit for both gender
	},
	Waiter = {
		name="Waiter_Classy",
		chance=0,
	}
};

ZombiesZoneDefinition.TrailerPark = {
	Veteran = {
		name="Veteran",
		chance=0,
		gender="male",
		maleHairStyles="CrewCut:20",
		beardStyles="Long:15;Chops:17;Goatee:17;Moustache:17",
	},
	Redneck = {
		name="Redneck",
		chance=0,
		maleHairStyles="Mullet:30;Metal:15;Cornrows:5;MohawkShort:5",
		femaleHairStyles="CrewCut:10;Cornrows:5;MohawkShort:5",
		beardStyles="Long:13;Chops:13;Goatee:13;Moustache:13",
	},
	Thug = {
		name="Thug",
		chance=0,
		gender="male",
		maleHairStyles="Mullet:30;Metal:15",
		beardStyles="Long:13;Chops:13;Goatee:13;Moustache:13",
	},
}

ZombiesZoneDefinition.Pharmacist = {
	-- We ensure we have at least one pharmacist
	PharmacistM = {
		name="Pharmacist",
		toSpawn=0,
		mandatory="true",
	},
	Pharmacist = {
		name="Pharmacist",
		chance=0,
	},
}

ZombiesZoneDefinition.Bowling = {
	Bowling = {
		name="Bowling",
		chance=0,
	},
}

ZombiesZoneDefinition.Doctor = {
	DoctorM = {
		name="Doctor",
		toSpawn=0,
		mandatory="true",
	},
	Doctor = {
		name="Doctor",
		chance=0,
	},
	Nurse = {
		name="Nurse",
		chance=0,
	},
}

ZombiesZoneDefinition.Spiffo = {
	Spiffo = {
		name="Spiffo",
		chance=0,
	},
	Waiter_SpiffoM = {
		name="Waiter_Spiffo",
		toSpawn=0,
		mandatory="true",
	},
	Waiter_Spiffo = {
		name="Waiter_Spiffo",
		chance=0,
	},
	Cook_SpiffosM = {
		name="Cook_Spiffos",
		toSpawn=0,
		mandatory="true",
		room="spiffoskitchen",
	},
	Cook_Spiffos = {
		name="Cook_Spiffos",
		chance=0,
		room="spiffoskitchen",
	},
}

ZombiesZoneDefinition.Gigamart = {
	GigaMart_EmployeeM = {
		name="GigaMart_Employee",
		toSpawn=0,
		mandatory="true",
	},
	GigaMart_Employee = {
		name="GigaMart_Employee",
		chance=0,
	},
	Cook_GenericM = {
		name="Cook_Generic",
		toSpawn=0,
		mandatory="true",
		room="gigamartkitchen",
	},
	Cook_Generic = {
		name="Cook_Generic",
		chance=0,
		room="gigamartkitchen",
	},
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		gender="female",
		chance=0,
		room="office",
	},
	OfficeWorker = {
		name="OfficeWorker",
		gender="male",
		chance=0,
		room="office",
		beardStyles="null:80",
	},
}

ZombiesZoneDefinition.PizzaWhirled = {
	Waiter_PizzaWhirledM = {
		name="Waiter_PizzaWhirled",
		toSpawn=0,
		mandatory="true",
	},
	Waiter_PizzaWhirled = {
		name="Waiter_PizzaWhirled",
		chance=0,
	},
	Cook_GenericM = {
		name="Cook_Generic",
		toSpawn=0,
		mandatory="true",
		room="restaurantkitchen",
	},
	Cook_Generic = {
		name="Cook_Generic",
		chance=0,
		room="restaurantkitchen",
	},
}

ZombiesZoneDefinition.Dinner = {
	Waiter_DinerM = {
		name="Waiter_Diner",
		toSpawn=0,
		mandatory="true",
	},
	Waiter_Diner = {
		name="Waiter_Diner",
		chance=0,
	},
	Cook_GenericM = {
		name="Cook_Generic",
		toSpawn=0,
		mandatory="true",
		room="restaurantkitchen",
	},
	Cook_Generic = {
		name="Cook_Generic",
		chance=0,
		room="restaurantkitchen",
	},
}

ZombiesZoneDefinition.PileOCrepe = {
	Waiter_PileOCrepeM = {
		name="Waiter_PileOCrepe",
		toSpawn=0,
		mandatory="true",
	},
	Waiter_PileOCrepe = {
		name="Waiter_PileOCrepe",
		chance=0,
	},
	ChefM = {
		name="Chef",
		toSpawn=0,
		mandatory="true",
		room="restaurantkitchen",
	},
	Chef = {
		name="Chef",
		chance=0,
		room="restaurantkitchen",
	},
}

ZombiesZoneDefinition.Coffeeshop = {
	Waiter_RestaurantM = {
		name="Waiter_Restaurant",
		toSpawn=0,
		mandatory="true",
	},
	Waiter_Restaurant = {
		name="Waiter_Restaurant",
		chance=0,
	},
	ChefM = {
		name="Chef",
		toSpawn=0,
		mandatory="true",
		room="restaurantkitchen",
	},
	Chef = {
		name="Chef",
		chance=0,
		room="restaurantkitchen",
	},
}

ZombiesZoneDefinition.SeaHorse = {
	Waiter_RestaurantM = {
		name="Waiter_Restaurant",
		toSpawn=0,
		mandatory="true",
	},
	Waiter_Restaurant = {
		name="Waiter_Restaurant",
		chance=0,
	},
	ChefM = {
		name="Chef",
		toSpawn=0,
		mandatory="true",
		room="restaurantkitchen",
	},
	Chef = {
		name="Chef",
		chance=0,
		room="restaurantkitchen",
	},
}

ZombiesZoneDefinition.Restaurant = {
	Waiter_RestaurantM = {
		name="Waiter_Restaurant",
		toSpawn=0,
		mandatory="true",
	},
	Waiter_Restaurant = {
		name="Waiter_Restaurant",
		chance=0,
	},
	ChefM = {
		name="Chef",
		toSpawn=0,
		mandatory="true",
		room="restaurantkitchen",
	},
	Chef = {
		name="Chef",
		chance=0,
		room="restaurantkitchen",
	},
}

ZombiesZoneDefinition.Survivalist = {
	Survivalist = {
		name="Survivalist",
		chance=0,
	},
	Hunter = {
		name="Hunter",
		chance=0,
		beardStyles="Long:10;Chops:10;Goatee:10;Moustache:10;Full:10;BeardOnly:10",
	},
}

ZombiesZoneDefinition.StreetPoor = {
	Hobbo = {
		name="Hobbo",
		chance=0,
		beardStyles="Long:15;Moustache:15;Full:15;BeardOnly:15",
	},
	Punk = {
		name="Punk",
		chance=0,
		beardStyles="null:90",
	},
	Biker = {
		name="Biker",
		chance=0,
		beardStyles="Long:10;Chops:10;Goatee:10;Moustache:10;Full:10;BeardOnly:10",
	},
	Bandit = {
		name="Bandit",
		chance=0,
	},
}

ZombiesZoneDefinition.Rocker = {
	Student = {
		name="Student",
		chance=0,
	},
	Punk = {
		name="Punk",
		chance=0,
		beardStyles="null:90",
	},
}

-- TODO: Not sure yet
ZombiesZoneDefinition.Theatre = {

}

ZombiesZoneDefinition.Shelter = {
	Hobbo = {
		name="Hobbo",
		chance=0,
	},
	Punk = {
		name="Punk",
		chance=0,
		beardStyles="null:90",
	},
}

-- TODO: 2 team (blue/red?)
ZombiesZoneDefinition.LaserTag = {

}

--[[ FIXME: Defined above, was this for something else?
ZombiesZoneDefinition.StreetPoor = {
	Tourist = {
		name="Tourist",
		chance=0,
	},
	Golfer = {
		name="Golfer",
		chance=0,
	},
	Classy = {
		name="Classy",
		chance=0,
	},
}
--]]

ZombiesZoneDefinition.Rich = {
	Tourist = {
		name="Tourist",
		chance=0,
	},
	Golfer = {
		name="Golfer",
		chance=0,
	},
	Classy = {
		name="Classy",
		chance=0,
	},
}

ZombiesZoneDefinition.HotelRich = {
	Tourist = {
		name="Tourist",
		chance=0,
	},
	Golfer = {
		name="Golfer",
		chance=0,
	},
	Classy = {
		name="Classy",
		chance=0,
	},
}

ZombiesZoneDefinition.BaseballFan = {
	BaseballFan_Z = {
		name="BaseballFan_Z",
		chance=0,
	},
	BaseballFan_Rangers = {
		name="BaseballFan_Z",
		chance=0,
	},
	BaseballFan_KY = {
		name="BaseballFan_Z",
		chance=0,
	},
}

-- TODO: how bad can i do an "old zombies" outfit?
ZombiesZoneDefinition.NursingHome = {

}

-- TODO: gonna need bit more clothing, but should be kinda like the nightclub
ZombiesZoneDefinition.Young = {

}

-- TODO: checkout screenshot mb
ZombiesZoneDefinition.Tennis = {

}


ZombiesZoneDefinition.VariousFoodMarket = {
	Waiter_MarketM = {
		name="Waiter_Market",
		toSpawn=0,
		mandatory="true",
	},
	Waiter_Market = {
		name="Waiter_Market",
		chance=0,
	},
}

ZombiesZoneDefinition.FarmingStore = {
	Waiter_MarketM = {
		name="Waiter_Market",
		toSpawn=0,
		mandatory="true",
	},
	Waiter_Market = {
		name="Waiter_Market",
		chance=0,
	},
	Farmer = {
		name="Farmer",
		chance=0,
	},
}

ZombiesZoneDefinition.Athletic = {
	FitnessInstructor = {
		name="FitnessInstructor",
		chance=0,
	},
}

ZombiesZoneDefinition.StreetSports = {
	StreetSports = {
		name="StreetSports",
		chance=0,
	},
}

-- not used yet
ZombiesZoneDefinition.Pony = {
	Jockey01 = {
		name="Jockey01",
		chance=0,
		gender="male",
	},
	Jockey02 = {
		name="Jockey02",
		chance=0,
		gender="male",
	},
	Jockey03 = {
		name="Jockey03",
		chance=0,
		gender="male",
	},
	Jockey06 = {
		name="Jockey06",
		chance=0,
		gender="male",
	},
	Jockey04 = {
		name="Jockey04",
		chance=0,
		gender="female",
	},
	Jockey05 = {
		name="Jockey05",
		chance=0,
		gender="female",
	},
}

ZombiesZoneDefinition.Baseball = {
	BaseballPlayer_KY = {
		name="BaseballPlayer_KY",
		chance=0,
	},
	BaseballPlayer_Z = {
		name="BaseballPlayer_Z",
		chance=0,
	},
	BaseballPlayer_Rangers = {
		name="BaseballPlayer_Rangers",
		chance=0,
	},
}

ZombiesZoneDefinition.Farm = {
	Farmer = {
		name="Farmer",
		chance=0,
		beardStyles="Long:15;Moustache:15;Full:15;BeardOnly:15",
	},
}

ZombiesZoneDefinition.CarRepair = {
	Mechanic = {
		name="Mechanic",
		chance=0,
		gender="male",
		beardStyles="Chops:10;Goatee:10;Moustache:10;Full:10;BeardOnly:10",
	},
	MetalWorker = {
		name="MetalWorker",
		chance=0,
		gender="male",
		beardStyles="Chops:10;Goatee:10;Moustache:10;Full:10;BeardOnly:10",
	},
}

ZombiesZoneDefinition.Fossoil = {
	Fossoil = {
		name="Fossoil",
		chance=0,
	},
}

ZombiesZoneDefinition.Gas2Go = {
	Gas2Go = {
		name="Gas2Go",
		chance=0,
	},
}

ZombiesZoneDefinition.ThunderGas = {
	ThunderGas = {
		name="ThunderGas",
		chance=0,
	},
}

ZombiesZoneDefinition.McCoys = {
	maleChance = 0,
	McCoys = {
		name="McCoys",
		chance=0,
		gender="male",
		beardStyles="Long:20;Chops:10;Goatee:10;Moustache:10;Full:10;BeardOnly:10",
	},
	Foreman = {
		name="Foreman",
		chance=0,
		gender="male",
	},
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		gender="female",
		chance=0,
	},
	OfficeWorker = {
		name="OfficeWorker",
		gender="male",
		chance=0,
		beardStyles="null:80",
	},
}

ZombiesZoneDefinition.Factory = {
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		gender="female",
		toSpawn=0,
		mandatory="true",
	},
	OfficeWorker = {
		name="OfficeWorker",
		gender="male",
		toSpawn=0,
		mandatory="true",
		beardStyles="null:80",
	},
	ConstructionWorker = {
		name="ConstructionWorker",
		chance=0,
		gender="male",
		beardStyles="Long:10;Chops:10;Goatee:10;Moustache:10;Full:10;BeardOnly:10",
	},
	Foreman = {
		name="Foreman",
		chance=0,
		gender="male",
	},
	Mechanic = {
		name="Mechanic",
		chance=0,
		gender="male",
		beardStyles="Chops:10;Goatee:10;Moustache:10;Full:10;BeardOnly:10",
	},
	MetalWorker = {
		name="MetalWorker",
		chance=0,
		gender="male",
		beardStyles="Chops:10;Goatee:10;Moustache:10;Full:10;BeardOnly:10",
	},
}

ZombiesZoneDefinition.ConstructionSite = {
	ConstructionWorker = {
		name="ConstructionWorker",
		chance=0,
		gender="male",
		beardStyles="Long:10;Chops:10;Goatee:10;Moustache:10;Full:10;BeardOnly:10",
	},
	Foreman = {
		name="Foreman",
		chance=0,
		gender="male",
	},
	MetalWorker = {
		name="MetalWorker",
		chance=0,
		gender="male",
		beardStyles="Chops:10;Goatee:10;Moustache:10;Full:10;BeardOnly:10",
	},
}

ZombiesZoneDefinition.Offices = {
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		chance=0,
		gender="female",
	},
	OfficeWorker = {
		name="OfficeWorker",
		chance=0,
		gender="male",
		beardStyles="null:80",
	},
	Trader = {
		name="Trader",
		chance=0,
		beardStyles="null:80",
	},
}

ZombiesZoneDefinition.Bank = {
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		chance=0,
		gender="female",
	},
	OfficeWorker = {
		name="OfficeWorker",
		chance=0,
		gender="male",
		beardStyles="null:80",
	},
	Trader = {
		name="Trader",
		chance=0,
		beardStyles="null:80",
	},
}

ZombiesZoneDefinition.SwimmingPool = {
	Swimmer = {
		name="Swimmer",
		chance=0,
	}
}

ZombiesZoneDefinition.FancyHotel = {
	Tourist = {
		name="Tourist",
		chance=0,
	},
	Bathrobe = {
		name="Bathrobe",
		chance=0,
	},
	Swimmer = {
		name="Swimmer",
		chance=0,
	},
	Waiter_Restaurant = {
		name="Waiter_Restaurant",
		chance=0,
	},
}

ZombiesZoneDefinition.CountryClub = {
	Tourist = {
		name="Tourist",
		chance=0,
	},
	Waiter_Restaurant = {
		name="Waiter_Restaurant",
		chance=0,
	},
	Golfer = {
		name="Golfer",
		chance=0,
	},
	Classy = {
		name="Classy",
		chance=0,
	},
	Gym = {
		name="FitnessInstructor",
		chance=0,
		room="gym",
	},
	Ballroom = {
		name="Classy",
		chance=0,
		room="ballroom",
	},
	Classy = {
		name="Classy",
		chance=0,
		room="ballroom",
	},
}

ZombiesZoneDefinition.Spa = {
	Tourist = {
		name="Tourist",
		chance=0,
	},
	Bathrobe = {
		name="Bathrobe",
		chance=0,
	},
	Swimmer = {
		name="Swimmer",
		chance=0,
	},
	Waiter_Restaurant = {
		name="Waiter_Restaurant",
		chance=0,
	},
}

ZombiesZoneDefinition.Golf = {
	Golfer = {
		name="Golfer",
		chance=0,
	},
	Tourist = {
		name="Tourist",
		chance=0,
	},
	Waiter_Restaurant = {
		name="Waiter_Restaurant",
		chance=0,
	},
}

ZombiesZoneDefinition.Police = {
	Police = {
		name="Police",
		chance=0,
	},
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		chance=0,
		gender="female",
	},
	OfficeWorker = {
		name="OfficeWorker",
		chance=0,
		gender="male",
		beardStyles="null:80",
	},
}

ZombiesZoneDefinition.PoliceState = {
	Police = {
		name="PoliceState",
		chance=0,
	},
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		chance=0,
		gender="female",
	},
	OfficeWorker = {
		name="OfficeWorker",
		chance=0,
		gender="male",
		beardStyles="null:80",
	},
}

ZombiesZoneDefinition.Prison = {
	-- Gonna force male zombies in prison
	maleChance = 0,
	Doctor = {
		name="Doctor",
		chance=0,
	},
	Priest = {
		name="Priest",
		toSpawn=0,
		gender="male",
		mandatory="true",
	},
	Doctor2 = {
		name="Doctor",
		chance=0,
		room="medicalstorage",
	},
	Nurse = {
		name="Nurse",
		chance=0,
		room="medicalstorage",
	},
	Priest = {
		name="Priest",
		mandatory="true",
		toSpawn=0,
		gender="male",
	},
	Waiter_Diner = {
		name="Waiter_Diner",
		chance=0,
	},
	PrisonGuard = {
		name="PrisonGuard",
		chance=0,
		gender="male",
	},
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		gender="female",
		chance=0,
		room="office",
	},
	OfficeWorker = {
		name="OfficeWorker",
		gender="male",
		chance=0,
		room="office",
		beardStyles="null:80",
	},
	Security = {
		name="PrisonGuard",
		gender="male",
		chance=0,
		room="security",
	},
	Inmate = {
		name="Inmate",
		chance=0,
		gender="male",
		room="prisoncells;hall;cafeteria;classroom;laundry;janitor",
	},
	-- this one is used for lower chance of inmate in some rooms
	InmateLowerZone = {
		name="Inmate",
		chance=0,
		gender="male",
		room="bathroom;kitchen;medicalstorage;library",
	},
	Naked = {
		name="Naked",
		chance=0,
		gender="male",
		room="bathroom",
	},
	Cook_Generic = {
		name="Cook_Generic",
		chance=0,
		gender="male",
		room="kitchen",
	},
}

ZombiesZoneDefinition.FireDept = {
	Fireman = {
		name="Fireman",
		chance=0,
	},
}

ZombiesZoneDefinition.Army = {
	ArmyInstructorM = {
		name="ArmyInstructor",
		toSpawn=0,
		mandatory="true",
		gender="male",
	},
	ArmyInstructor = {
		name="ArmyInstructor",
		chance=0,
		gender="male",
	},
	Ghillie = {
		name="Ghillie",
		chance=0,
		gender="male",
	},
	ArmyCamoDesert = {
		name="ArmyCamoDesert",
		chance=0
	},
	ArmyCamoGreen = {
		name="ArmyCamoGreen",
		chance=0,
	},
}

ZombiesZoneDefinition.SecretBase = {
	Priest = {
		name="Priest",
		toSpawn=0,
		gender="male",
		mandatory="true",
	},
	ArmyInstructor = {
		name="ArmyInstructor",
		chance=0,
		gender="male",
	},
	ArmyCamoGreen = {
		name="ArmyCamoGreen",
		chance=0,
	},
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		chance=0,
		gender="female",
	},
	OfficeWorker = {
		name="OfficeWorker",
		chance=0,
		gender="male",
		beardStyles="null:80",
	},
	Doctor = {
		name="Doctor",
		chance=0,
	},
}

ZombiesZoneDefinition.Bar = {
	Biker = {
		name="Biker",
		chance=0,
		beardStyles="Long:10;Chops:10;Goatee:10;Moustache:10;Full:10;BeardOnly:10",
	},
	Veteran = {
		name="Veteran",
		chance=0,
		gender="male",
		maleHairStyles="CrewCut:20",
		beardStyles="Long:10;Chops:17;Goatee:17;Moustache:17",
	},
	Redneck = {
		name="Redneck",
		chance=0,
		maleHairStyles="Mullet:30;Metal:15",
		femaleHairStyles="CrewCut:10",
		beardStyles="Long:15;Chops:13;Goatee:13;Moustache:13",
	},
}

ZombiesZoneDefinition.Beach = {
	Tourist = {
		name="Tourist",
		chance=0,
	},
	Swimmer = {
		name="Swimmer",
		chance=0,
	},
}

ZombiesZoneDefinition.School = {
	ShellSuit_Black = {
		name="ShellSuit_Black",
		chance=0,
	},
	ShellSuit_Blue = {
		name="ShellSuit_Blue",
		chance=0,
	},
	ShellSuit_Green = {
		name="ShellSuit_Green",
		chance=0,
	},
	ShellSuit_Pink = {
		name="ShellSuit_Pink",
		chance=0,
	},
	ShellSuit_Teal = {
		name="ShellSuit_Teal",
		chance=0,
	},
	Young = {
		name="Young",
		chance=0,
	},
	Student = {
		name="Student",
		chance=0,
	},
	Teacher = {
		name="Teacher",
		chance=0,
	},
}

ZombiesZoneDefinition.Boxing = {
	chanceToSpawn = 0,
	RedBoxer = {
		name="BoxingRed",
		toSpawn=0,
		gender="male",
		mandatory="true",
	},
	BlueBoxer = {
		name="BoxingBlue",
		toSpawn=0,
		gender="male",
		mandatory="true",
	},
	Classy = {
		name="Classy",
		chance=0,
	},
};

-- total chance can be over 100% we don't care as we'll roll on the totalChance and not a 100 (unlike the specific outfits on top of this)
ZombiesZoneDefinition.Default = {};

--table.insert(ZombiesZoneDefinition.Default,{name = "FitnessInstructor", chance=20000});
table.insert(ZombiesZoneDefinition.Default,{name = "TatteredF", chance=2000, gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "TatteredM", chance=2000, gender="male"});