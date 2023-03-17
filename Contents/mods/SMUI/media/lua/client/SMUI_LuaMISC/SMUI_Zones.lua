--Adds new Zones to the world    OnNewGame
local function OnGameStart()
	if getPlayer():getModData().a == nil then	                     --
		getWorld():registerZone("DormitoryQuarantine", "ZombiesType", 10075, 12654, 0, 75, 38)--March Ridge Dormitory	
		getWorld():registerZone("DormitoryQuarantine", "ZombiesType", 10125, 12600, 0, 25, 40)--March Ridge Dormitory		
		getWorld():registerZone("ZoneBorder", "ZombiesType", 12504, 4502, 0, 53, 250)--Northern end of Map above Valley Station (W)
		getWorld():registerZone("ZoneBorder", "ZombiesType", 14361, 4505, 0, 50, 50)--Northern end of Map above Valley Station (E)
		getWorld():registerZone("ZoneBorder", "ZombiesType", 3014, 6140, 0, 46, 50)--West end of map w/ barricade (N)
		getWorld():registerZone("ZoneBorder", "ZombiesType", 3015, 5787, 0, 50, 45)--West end of map w/ barricade (S)
		getWorld():registerZone("ZoneBorder", "ZombiesType", 10583, 13442, 0, 50, 50)--Southern end of map w/ barricade
		getWorld():registerZone("MarchRidgeNorth", "ZombiesType", 9800, 12666, 0, 60, 100)--North West section of March Ridge
		getWorld():registerZone("MarchRidgeWest", "ZombiesType", 9861, 12900, 0, 25, 70)--West-Central section of March Ridge
		getWorld():registerZone("MarchRidgeEast", "ZombiesType", 10400, 12745, 0, 100, 35)--East section of March Ridge		
		getWorld():registerZone("MarchRidgeCheckpoint", "ZombiesType", 10320, 12359, 0, 80, 80)-- North of March Ridge
		getWorld():registerZone("ArmyQuarter", "ZombiesType", 9089, 11793, 0, 35, 40)-- Farmer Quarter East of Rosewood, *Yes it is* an Army Quarter
		getWorld():registerZone("SecretBaseMisc", "ZombiesType", 5515, 12420, 0, 160, 16)-- Back Part of Secret Base
		getWorld():registerZone("SecretBaseMisc", "ZombiesType", 5530, 12421, 0, 80, 80)-- Top edge of Secret Base
		getWorld():registerZone("SecretBaseMisc", "ZombiesType", 5770, 12460, 0, 80, 70)-- Top edge of Secret Base
	end
end
Events.OnGameStart.Add(OnGameStart)