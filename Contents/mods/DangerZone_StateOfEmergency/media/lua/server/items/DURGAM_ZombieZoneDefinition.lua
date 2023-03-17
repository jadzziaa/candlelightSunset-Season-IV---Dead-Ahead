require 'NPCs/ZombiesZoneDefinition'


-- Default Zone
table.insert(ZombiesZoneDefinition.Default,{name = "Police", chance=1});
table.insert(ZombiesZoneDefinition.Default,{name = "PoliceState", chance=1});
table.insert(ZombiesZoneDefinition.Default,{name = "PoliceRiot", chance=1, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "ArmyCamoGreen", chance=1, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "PrivateMilitia", chance=1, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "Bandit", chance=1});
table.insert(ZombiesZoneDefinition.Default,{name = "Ranger", chance=1, gender="male"});

-- Trailer Park
table.insert(ZombiesZoneDefinition.TrailerPark,{name = "PrivateMilitia", chance=1, gender="male"});
table.insert(ZombiesZoneDefinition.TrailerPark,{name = "Bandit", chance=1});

-- Street Poor
table.insert(ZombiesZoneDefinition.StreetPoor,{name = "PrivateMilitia", chance=1, gender="male"});

-- Survivalist
table.insert(ZombiesZoneDefinition.Survivalist,{name = "PrivateMilitia", chance=1, gender="male"});