local function STEVSpawns()

	local KSP = {};
	KSP[1] = 1; -- vanilla police car
	KSP[2] = 1; -- vanilla police truck
	KSP[3] = 2; -- 92 vic
	KSP[4] = 2; -- 87 caprice
	KSP[5] = 3; -- 85 vic
	KSP[6] = 3; -- 91 blazer

	local MCSO = {};
	MCSO[1] = 2; -- vanilla police car
	MCSO[2] = 2; -- vanilla police truck
	MCSO[3] = 3; -- 92 vic
	MCSO[4] = 3; -- 87 caprice
	MCSO[5] = 4; -- 85 vic
	MCSO[6] = 4; -- 91 blazer

	local RWSD = {};
	RWSD[1] = 3; -- vanilla police car
	RWSD[2] = 3; -- vanilla police truck
	RWSD[3] = 4; -- 92 vic
	RWSD[4] = 4; -- 87 caprice
	RWSD[5] = 5; -- 85 vic
	RWSD[6] = 5; -- 91 blazer

	local WPPD = {};
	WPPD[1] = 4; -- vanilla police car
	WPPD[2] = 4; -- vanilla police truck
	WPPD[3] = 5; -- 92 vic
	WPPD[4] = 5; -- 87 caprice
	WPPD[5] = 6; -- 85 vic
	WPPD[6] = 6; -- 91 blazer

	local MDPD = {};
	MDPD[1] = 5; -- vanilla police car
	MDPD[2] = 5; -- vanilla police truck
	MDPD[3] = 6; -- 92 vic
	MDPD[4] = 6; -- 87 caprice
	MDPD[5] = 7; -- 85 vic
	MDPD[6] = 7; -- 91 blazer

	local RSPD = {};
	RSPD[1] = 6; -- vanilla police car
	RSPD[2] = 6; -- vanilla police truck
	RSPD[3] = 7; -- 92 vic
	RSPD[4] = 7; -- 87 caprice
	RSPD[5] = 8; -- 85 vic
	RSPD[6] = 8; -- 91 blazer

	local LVPD = {};
	LVPD[1] = 7; -- vanilla police car
	LVPD[2] = 7; -- vanilla police truck
	LVPD[3] = 8; -- 92 vic
	LVPD[4] = 8; -- 87 caprice
	LVPD[5] = 9; -- 85 vic
	LVPD[6] = 9; -- 91 blazer

	local JCPD = {};
	JCPD[1] = 8; -- vanilla police car
	JCPD[2] = 8; -- vanilla police truck
	JCPD[3] = 9; -- 92 vic
	JCPD[4] = 9; -- 87 caprice
	JCPD[5] = 10; -- 85 vic
	JCPD[6] = 10; -- 91 blazer

	local JCSD = {};
	JCSD[1] = 9; -- vanilla police car
	JCSD[2] = 9; -- vanilla police truck
	JCSD[3] = 10; -- 92 vic
	JCSD[4] = 10; -- 87 caprice
	JCSD[5] = 11; -- 85 vic
	JCSD[6] = 11; -- 91 blazer

	local RGR = {};
	RGR[0] = 0; -- Vanilla Rangers
	RGR[1] = 1; -- State Park Rangers
	RGR[2] = 2; -- Fish And Wildlife
	RGR[3] = 3; -- National Park Service
	RGR[4] = 2; -- State Park Rangers Pickup
	RGR[5] = 3; -- Fish And Wildlife Pickup
	RGR[6] = 4; -- National Park Service Pickup

	local Fire = {};
	Fire[1] = 1; -- Rosewood
	Fire[2] = 2; -- Meade
	Fire[3] = 3; -- Louisville

	local EMS = {};
	EMS[1] = 1; -- Meade
	EMS[2] = 2; -- Louisville
	EMS[3] = 3; -- Jefferson

	local MAIL = {};
	MAIL[1] = 0; -- Jeep
	MAIL[2] = 3; -- CargoVan

	if getActivatedMods():contains("ProperPoliceSkins") then

		KSP[1] = 2; -- vanilla police car
		KSP[2] = 2; -- vanilla police truck

		MCSO[1] = 3; -- vanilla police car
		MCSO[2] = 3; -- vanilla police truck

		RWSD[1] = 4; -- vanilla police car
		RWSD[2] = 4; -- vanilla police truck

		WPPD[1] = 5; -- vanilla police car
		WPPD[2] = 5; -- vanilla police truck

		MDPD[1] = 6; -- vanilla police car
		MDPD[2] = 6; -- vanilla police truck

		RSPD[1] = 7; -- vanilla police car
		RSPD[2] = 7; -- vanilla police truck

		LVPD[1] = 8; -- vanilla police car
		LVPD[2] = 8; -- vanilla police truck

		JCPD[1] = 9; -- vanilla police car
		JCPD[2] = 9; -- vanilla police truck

		JCSD[1] = 10; -- vanilla police car
		JCSD[2] = 10; -- vanilla police truck

	end

	if getActivatedMods():contains("KSPOPack") then

		KSP[3] = 1; -- 92 vic
		KSP[5] = 2; -- 85 vic

		MCSO[3] = 2; -- 92 vic
		MCSO[5] = 3; -- 85 vic

		RWSD[3] = 3; -- 92 vic
		RWSD[5] = 4; -- 85 vic

		WPPD[3] = 4; -- 92 vic
		WPPD[5] = 5; -- 85 vic

		MDPD[3] = 5; -- 92 vic
		MDPD[5] = 6; -- 85 vic

		RSPD[3] = 6; -- 92 vic
		RSPD[5] = 7; -- 85 vic

		LVPD[3] = 7; -- 92 vic
		LVPD[5] = 8; -- 85 vic

		JCPD[3] = 8; -- 92 vic
		JCPD[5] = 9; -- 85 vic

		JCSD[3] = 9; -- 92 vic
		JCSD[5] = 10; -- 85 vic

	end

	if getActivatedMods():contains("VVehicleEnhancer") then

		KSP[1] = 1; -- vanilla police car
		KSP[2] = 2; -- vanilla police truck

		MCSO[1] = 2; -- vanilla police car
		MCSO[2] = 3; -- vanilla police truck

		RWSD[1] = 3; -- vanilla police car
		RWSD[2] = 4; -- vanilla police truck

		WPPD[1] = 4; -- vanilla police car
		WPPD[2] = 5; -- vanilla police truck

		MDPD[1] = 5; -- vanilla police car
		MDPD[2] = 6; -- vanilla police truck

		RSPD[1] = 6; -- vanilla police car
		RSPD[2] = 7; -- vanilla police truck

		LVPD[1] = 7; -- vanilla police car
		LVPD[2] = 8; -- vanilla police truck

		JCPD[1] = 8; -- vanilla police car
		JCPD[2] = 9; -- vanilla police truck

		JCSD[1] = 9; -- vanilla police car
		JCSD[2] = 10; -- vanilla police truck

		RGR[0] = 2; -- Vanilla Rangers
		RGR[4] = 4; -- vve State Park Rangers
		RGR[5] = 5; -- vve Fish And Wildlife
		RGR[6] = 6; -- vve National Park Service

	end

	if VehicleZoneDistribution then

		-- Meade County Sheriff
		VehicleZoneDistribution.policemeade = {}
		VehicleZoneDistribution.policemeade.vehicles = {}
		VehicleZoneDistribution.policemeade.chanceToSpawnNormal = SandboxVars.STEV.NChance;
		VehicleZoneDistribution.policemeade.chanceToSpawnSpecial = 0;
		VehicleZoneDistribution.policemeade.spawnRate = SandboxVars.STEV.SRate;

		-- Riverside Police
		VehicleZoneDistribution.policeriversidepd = {}
		VehicleZoneDistribution.policeriversidepd.vehicles = {}
		VehicleZoneDistribution.policeriversidepd.chanceToSpawnNormal = SandboxVars.STEV.NChance;
		VehicleZoneDistribution.policeriversidepd.chanceToSpawnSpecial = 0;
		VehicleZoneDistribution.policeriversidepd.spawnRate = SandboxVars.STEV.SRate;

		-- Rosewood Police
		VehicleZoneDistribution.policerosewoodsd = {}
		VehicleZoneDistribution.policerosewoodsd.vehicles = {}
		VehicleZoneDistribution.policerosewoodsd.chanceToSpawnNormal = SandboxVars.STEV.NChance;
		VehicleZoneDistribution.policerosewoodsd.chanceToSpawnSpecial = 0;
		VehicleZoneDistribution.policerosewoodsd.spawnRate = SandboxVars.STEV.SRate;

		-- WestPoint Police
		VehicleZoneDistribution.policewestpointpd = {}
		VehicleZoneDistribution.policewestpointpd.vehicles = {}
		VehicleZoneDistribution.policewestpointpd.chanceToSpawnNormal = SandboxVars.STEV.NChance;
		VehicleZoneDistribution.policewestpointpd.chanceToSpawnSpecial = 0;
		VehicleZoneDistribution.policewestpointpd.spawnRate = SandboxVars.STEV.SRate;

		-- Muldraugh Police
		VehicleZoneDistribution.policemuldraughpd = {}
		VehicleZoneDistribution.policemuldraughpd.vehicles = {}
		VehicleZoneDistribution.policemuldraughpd.chanceToSpawnNormal = SandboxVars.STEV.NChance;
		VehicleZoneDistribution.policemuldraughpd.chanceToSpawnSpecial = 0;
		VehicleZoneDistribution.policemuldraughpd.spawnRate = SandboxVars.STEV.SRate;

		-- Jefferson County Sheriff
		VehicleZoneDistribution.policejeffersonsd = {}
		VehicleZoneDistribution.policejeffersonsd.vehicles = {}
		VehicleZoneDistribution.policejeffersonsd.chanceToSpawnNormal = SandboxVars.STEV.NChance;
		VehicleZoneDistribution.policejeffersonsd.chanceToSpawnSpecial = 0;
		VehicleZoneDistribution.policejeffersonsd.spawnRate = SandboxVars.STEV.SRate;

		-- Jefferson County Police
		VehicleZoneDistribution.policejeffersonpd = {}
		VehicleZoneDistribution.policejeffersonpd.vehicles = {}
		VehicleZoneDistribution.policejeffersonpd.chanceToSpawnNormal = SandboxVars.STEV.NChance;
		VehicleZoneDistribution.policejeffersonpd.chanceToSpawnSpecial = 0;
		VehicleZoneDistribution.policejeffersonpd.spawnRate = SandboxVars.STEV.SRate;

		-- Kentucky State Police
		VehicleZoneDistribution.policeksp = {}
		VehicleZoneDistribution.policeksp.vehicles = {}
		VehicleZoneDistribution.policeksp.chanceToSpawnNormal = SandboxVars.STEV.NChance;
		VehicleZoneDistribution.policeksp.chanceToSpawnSpecial = 0;
		VehicleZoneDistribution.policeksp.spawnRate = SandboxVars.STEV.SRate;

		-- Louisville Police
		VehicleZoneDistribution.policelouisvillepd = {}
		VehicleZoneDistribution.policelouisvillepd.vehicles = {}
		VehicleZoneDistribution.policelouisvillepd.chanceToSpawnNormal = SandboxVars.STEV.NChance;
		VehicleZoneDistribution.policelouisvillepd.chanceToSpawnSpecial = 0;
		VehicleZoneDistribution.policelouisvillepd.spawnRate = SandboxVars.STEV.SRate;
		
		-- Rosewood DOC
		VehicleZoneDistribution.policerosewooddoc = {}
		VehicleZoneDistribution.policerosewooddoc.vehicles = {}
		VehicleZoneDistribution.policerosewooddoc.chanceToSpawnNormal = SandboxVars.STEV.NChance;
		VehicleZoneDistribution.policerosewooddoc.chanceToSpawnSpecial = 0;
		VehicleZoneDistribution.policerosewooddoc.spawnRate = SandboxVars.STEV.SRate;

		-- Jefferson County DOC
		VehicleZoneDistribution.policejeffersondoc = {}
		VehicleZoneDistribution.policejeffersondoc.vehicles = {}
		VehicleZoneDistribution.policejeffersondoc.chanceToSpawnNormal = SandboxVars.STEV.NChance;
		VehicleZoneDistribution.policejeffersondoc.chanceToSpawnSpecial = 0;
		VehicleZoneDistribution.policejeffersondoc.spawnRate = SandboxVars.STEV.SRate;

		-- Park Rangers
		VehicleZoneDistribution.rangermeade = {}
		VehicleZoneDistribution.rangermeade.vehicles = {}
		VehicleZoneDistribution.rangermeade.chanceToSpawnNormal = SandboxVars.STEV.NChance;
		VehicleZoneDistribution.rangermeade.chanceToSpawnSpecial = 0;
		VehicleZoneDistribution.rangermeade.spawnRate = SandboxVars.STEV.SRate;

		-- Rosewood Fire Departments
		VehicleZoneDistribution.firerosewood = {}
		VehicleZoneDistribution.firerosewood.vehicles = {}
		VehicleZoneDistribution.firerosewood.chanceToSpawnNormal = SandboxVars.STEV.NChance;
		VehicleZoneDistribution.firerosewood.chanceToSpawnSpecial = 0;
		VehicleZoneDistribution.firerosewood.spawnRate = SandboxVars.STEV.SRate;

		-- Louisville Fire Departments
		VehicleZoneDistribution.firelouisville = {}
		VehicleZoneDistribution.firelouisville.vehicles = {}
		VehicleZoneDistribution.firelouisville.chanceToSpawnNormal = SandboxVars.STEV.NChance;
		VehicleZoneDistribution.firelouisville.chanceToSpawnSpecial = 0;
		VehicleZoneDistribution.firelouisville.spawnRate = SandboxVars.STEV.SRate;

		-- Louisville USPS HQ
		VehicleZoneDistribution.usps = {}
		VehicleZoneDistribution.usps.vehicles = {}
		VehicleZoneDistribution.usps.chanceToSpawnNormal = SandboxVars.STEV.NChance;
		VehicleZoneDistribution.usps.chanceToSpawnSpecial = 0;
		VehicleZoneDistribution.usps.spawnRate = SandboxVars.STEV.SRate;

		-- Bank Trucks
		VehicleZoneDistribution.banksecurity = {}
		VehicleZoneDistribution.banksecurity.vehicles = {}
		VehicleZoneDistribution.banksecurity.chanceToSpawnNormal = SandboxVars.STEV.NChance;
		VehicleZoneDistribution.banksecurity.chanceToSpawnSpecial = 0;
		VehicleZoneDistribution.banksecurity.spawnRate = SandboxVars.STEV.SRate;

		if SandboxVars.STR.STEVOnly then

		-- police
		VehicleZoneDistribution.police.vehicles["Base.PickUpVanLightsPolice"] = nil;
		VehicleZoneDistribution.police.vehicles["Base.CarLightsPolice"] = nil;

		VehicleZoneDistribution.police.vehicles["Base.85vicsheriff"] = nil;
		VehicleZoneDistribution.police.vehicles["Base.87capricePD"] = nil;
		VehicleZoneDistribution.police.vehicles["Base.91blazerpd"] = nil;
		VehicleZoneDistribution.police.vehicles["Base.92crownvicPD"] = nil;
		VehicleZoneDistribution.police.vehicles["Base.chevystepvanswat"] = nil;
		VehicleZoneDistribution.police.vehicles["Base.hmmwvpolice"] = nil;
		VehicleZoneDistribution.police.vehicles["Base.hmmwvblackopps"] = nil;
		VehicleZoneDistribution.police.vehicles["Base.blazerblackops"] = nil;
		VehicleZoneDistribution.police.vehicles["Base.m35a2blackopps"] = nil;
		VehicleZoneDistribution.police.vehicles["Base.m151blackopps"] = nil;

		-- ranger
		VehicleZoneDistribution.ranger.vehicles["Base.CarLights"] = nil;
		VehicleZoneDistribution.ranger.vehicles["Base.PickUpVanLights"] = nil;
		VehicleZoneDistribution.ranger.vehicles["Base.PickUpTruckLights"] = nil;

		VehicleZoneDistribution.ranger.vehicles["Base.85vicranger"] = nil;
		VehicleZoneDistribution.ranger.vehicles["Base.92wranglerranger"] = nil;

		-- ambulance
		VehicleZoneDistribution.ambulance.vehicles["Base.VanAmbulance"] = nil;

		VehicleZoneDistribution.ambulance.vehicles["Base.80f350ambulance"] = nil;
		VehicleZoneDistribution.ambulance.vehicles["Base.86econolineambulance"] = nil;

		-- fire
		VehicleZoneDistribution.fire.vehicles["Base.PickUpVanLightsFire"] = nil;
		VehicleZoneDistribution.fire.vehicles["Base.PickUpTruckLightsFire"] = nil;

		VehicleZoneDistribution.fire.vehicles["Base.87c10fire"] = nil;
		VehicleZoneDistribution.fire.vehicles["Base.firepumper"] = nil;

		end

		if SandboxVars.STR.CustomVehicleZones then

			if getActivatedMods():contains("FRUsedCars") then

				if SandboxVars.STR.TrueSTEV then

					-- Meade County Sheriff
					VehicleZoneDistribution.policemeade.vehicles["Base.85vicsheriff"] = {index = MCSO[5], spawnChance = SandboxVars.STEV.Meade};
					VehicleZoneDistribution.policemeade.vehicles["Base.87capricePD"] = {index = MCSO[4], spawnChance = SandboxVars.STEV.Meade};

					-- Riverside Police
					VehicleZoneDistribution.policeriversidepd.vehicles["Base.85vicsheriff"] = {index = RSPD[5], spawnChance = SandboxVars.STEV.Riverside};
					VehicleZoneDistribution.policeriversidepd.vehicles["Base.87capricePD"] = {index = RSPD[4], spawnChance = SandboxVars.STEV.Riverside};

					-- Rosewood Police
					VehicleZoneDistribution.policerosewoodsd.vehicles["Base.85vicsheriff"] = {index = RWSD[5], spawnChance = SandboxVars.STEV.Rosewood};
					VehicleZoneDistribution.policerosewoodsd.vehicles["Base.87capricePD"] = {index = RWSD[4], spawnChance = SandboxVars.STEV.Rosewood};
					VehicleZoneDistribution.policerosewoodsd.vehicles["Base.91blazerpd"] = {index = RWSD[6], spawnChance = SandboxVars.STEV.Rosewood};
					VehicleZoneDistribution.policerosewoodsd.vehicles["Base.chevystepvanswat"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};

					if getActivatedMods():contains("MilitaryUsedCarSkins") then
						VehicleZoneDistribution.policerosewoodsd.vehicles["Base.hmmwvpolice"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.policerosewoodsd.vehicles["Base.hmmwvblackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.policerosewoodsd.vehicles["Base.blazerblackops"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.policerosewoodsd.vehicles["Base.m35a2blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.policerosewoodsd.vehicles["Base.m151blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
					end

					-- WestPoint Police
					VehicleZoneDistribution.policewestpointpd.vehicles["Base.85vicsheriff"] = {index = WPPD[5], spawnChance = SandboxVars.STEV.WestPoint};
					VehicleZoneDistribution.policewestpointpd.vehicles["Base.87capricePD"] = {index = WPPD[4], spawnChance = SandboxVars.STEV.WestPoint};
					VehicleZoneDistribution.policewestpointpd.vehicles["Base.chevystepvanswat"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};

					if getActivatedMods():contains("MilitaryUsedCarSkins") then
						VehicleZoneDistribution.policewestpointpd.vehicles["Base.hmmwvpolice"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.policewestpointpd.vehicles["Base.hmmwvblackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.policewestpointpd.vehicles["Base.blazerblackops"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.policewestpointpd.vehicles["Base.m35a2blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.policewestpointpd.vehicles["Base.m151blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
					end

					-- Muldraugh Police
					VehicleZoneDistribution.policemuldraughpd.vehicles["Base.85vicsheriff"] = {index = MDPD[5], spawnChance = SandboxVars.STEV.Muldraugh};
					VehicleZoneDistribution.policemuldraughpd.vehicles["Base.87capricePD"] = {index = MDPD[4], spawnChance = SandboxVars.STEV.Muldraugh};

					-- Jefferson County Sheriff
					VehicleZoneDistribution.policejeffersonsd.vehicles["Base.85vicsheriff"] = {index = JCSD[5], spawnChance = SandboxVars.STEV.JCSD};
					VehicleZoneDistribution.policejeffersonsd.vehicles["Base.87capricePD"] = {index = JCSD[4], spawnChance = SandboxVars.STEV.JCSD};

					-- Jefferson County Police
					VehicleZoneDistribution.policejeffersonpd.vehicles["Base.85vicsheriff"] = {index = JCPD[5], spawnChance = SandboxVars.STEV.JCPD};
					VehicleZoneDistribution.policejeffersonpd.vehicles["Base.87capricePD"] = {index = JCPD[4], spawnChance = SandboxVars.STEV.JCPD};
					VehicleZoneDistribution.policejeffersonpd.vehicles["Base.chevystepvanswat"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};

					if getActivatedMods():contains("MilitaryUsedCarSkins") then
						VehicleZoneDistribution.policejeffersonpd.vehicles["Base.hmmwvpolice"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.policejeffersonpd.vehicles["Base.hmmwvblackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.policejeffersonpd.vehicles["Base.blazerblackops"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.policejeffersonpd.vehicles["Base.m35a2blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.policejeffersonpd.vehicles["Base.m151blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
					end

					-- Kentucky State Police
					VehicleZoneDistribution.policeksp.vehicles["Base.85vicsheriff"] = {index = KSP[5], spawnChance = SandboxVars.STEV.KSP};
					VehicleZoneDistribution.policeksp.vehicles["Base.92crownvicPD"] = {index = KSP[3], spawnChance = SandboxVars.STEV.KSP};

					-- Louisville Police
					VehicleZoneDistribution.policelouisvillepd.vehicles["Base.92crownvicPD"] = {index = LVPD[3], spawnChance = SandboxVars.STEV.Louisville};

					-- Rangers
					VehicleZoneDistribution.rangermeade.vehicles["Base.92wranglerranger"] = {index = RGR[1], spawnChance = SandboxVars.STEV.Rangers};

				elseif not SandboxVars.STR.TrueSTEV then

					-- Meade County Sheriff
					VehicleZoneDistribution.policemeade.vehicles["Base.85vicsheriff"] = {index = MCSO[5], spawnChance = SandboxVars.STEV.Meade};
					VehicleZoneDistribution.policemeade.vehicles["Base.87capricePD"] = {index = MCSO[4], spawnChance = SandboxVars.STEV.Meade};
					VehicleZoneDistribution.policemeade.vehicles["Base.91blazerpd"] = {index = MCSO[6], spawnChance = SandboxVars.STEV.Meade};
					VehicleZoneDistribution.policemeade.vehicles["Base.92crownvicPD"] = {index = MCSO[3], spawnChance = SandboxVars.STEV.Meade};

					-- Riverside Police
					VehicleZoneDistribution.policeriversidepd.vehicles["Base.85vicsheriff"] = {index = RSPD[5], spawnChance = SandboxVars.STEV.Riverside};
					VehicleZoneDistribution.policeriversidepd.vehicles["Base.87capricePD"] = {index = RSPD[4], spawnChance = SandboxVars.STEV.Riverside};
					VehicleZoneDistribution.policeriversidepd.vehicles["Base.91blazerpd"] = {index = RSPD[6], spawnChance = SandboxVars.STEV.Riverside};
					VehicleZoneDistribution.policeriversidepd.vehicles["Base.92crownvicPD"] = {index = RSPD[3], spawnChance = SandboxVars.STEV.Riverside};

					-- Rosewood Police
					VehicleZoneDistribution.policerosewoodsd.vehicles["Base.85vicsheriff"] = {index = MCSO[5], spawnChance = SandboxVars.STEV.Rosewood};
					VehicleZoneDistribution.policerosewoodsd.vehicles["Base.87capricePD"] = {index = RWSD[4], spawnChance = SandboxVars.STEV.Rosewood};
					VehicleZoneDistribution.policerosewoodsd.vehicles["Base.91blazerpd"] = {index = RWSD[6], spawnChance = SandboxVars.STEV.Rosewood};
					VehicleZoneDistribution.policerosewoodsd.vehicles["Base.92crownvicPD"] = {index = RWSD[3], spawnChance = SandboxVars.STEV.Rosewood};
					VehicleZoneDistribution.policerosewoodsd.vehicles["Base.chevystepvanswat"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};

					-- WestPoint Police
					VehicleZoneDistribution.policewestpointpd.vehicles["Base.85vicsheriff"] = {index = WPPD[5], spawnChance = SandboxVars.STEV.WestPoint};
					VehicleZoneDistribution.policewestpointpd.vehicles["Base.87capricePD"] = {index = WPPD[4], spawnChance = SandboxVars.STEV.WestPoint};
					VehicleZoneDistribution.policewestpointpd.vehicles["Base.91blazerpd"] = {index = WPPD[6], spawnChance = SandboxVars.STEV.WestPoint};
					VehicleZoneDistribution.policewestpointpd.vehicles["Base.92crownvicPD"] = {index = WPPD[3], spawnChance = SandboxVars.STEV.WestPoint};
					VehicleZoneDistribution.policewestpointpd.vehicles["Base.chevystepvanswat"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};

					if getActivatedMods():contains("MilitaryUsedCarSkins") then
						VehicleZoneDistribution.policewestpointpd.vehicles["Base.hmmwvpolice"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.policewestpointpd.vehicles["Base.hmmwvblackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.policewestpointpd.vehicles["Base.blazerblackops"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.policewestpointpd.vehicles["Base.m35a2blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.policewestpointpd.vehicles["Base.m151blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
					end

					-- Muldraugh Police
					VehicleZoneDistribution.policemuldraughpd.vehicles["Base.85vicsheriff"] = {index = MDPD[5], spawnChance = SandboxVars.STEV.Muldraugh};
					VehicleZoneDistribution.policemuldraughpd.vehicles["Base.87capricePD"] = {index = MDPD[4], spawnChance = SandboxVars.STEV.Muldraugh};
					VehicleZoneDistribution.policemuldraughpd.vehicles["Base.91blazerpd"] = {index = MDPD[6], spawnChance = SandboxVars.STEV.Muldraugh};
					VehicleZoneDistribution.policemuldraughpd.vehicles["Base.92crownvicPD"] = {index = MDPD[3], spawnChance = SandboxVars.STEV.Muldraugh};

					-- Jefferson County Sheriff
					VehicleZoneDistribution.policejeffersonsd.vehicles["Base.85vicsheriff"] = {index = JCSD[5], spawnChance = SandboxVars.STEV.JCSD};
					VehicleZoneDistribution.policejeffersonsd.vehicles["Base.87capricePD"] = {index = JCSD[4], spawnChance = SandboxVars.STEV.JCSD};
					VehicleZoneDistribution.policejeffersonsd.vehicles["Base.91blazerpd"] = {index = JCSD[6], spawnChance = SandboxVars.STEV.JCSD};
					VehicleZoneDistribution.policejeffersonsd.vehicles["Base.92crownvicPD"] = {index = JCSD[3], spawnChance = SandboxVars.STEV.JCSD};

					-- Jefferson County Police
					VehicleZoneDistribution.policejeffersonpd.vehicles["Base.85vicsheriff"] = {index = JCPD[5], spawnChance = SandboxVars.STEV.JCPD};
					VehicleZoneDistribution.policejeffersonpd.vehicles["Base.87capricePD"] = {index = JCPD[4], spawnChance = SandboxVars.STEV.JCPD};
					VehicleZoneDistribution.policejeffersonpd.vehicles["Base.91blazerpd"] = {index = JCPD[6], spawnChance = SandboxVars.STEV.JCPD};
					VehicleZoneDistribution.policejeffersonpd.vehicles["Base.92crownvicPD"] = {index = JCPD[3], spawnChance = SandboxVars.STEV.JCPD};
					VehicleZoneDistribution.policejeffersonpd.vehicles["Base.chevystepvanswat"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};

					if getActivatedMods():contains("MilitaryUsedCarSkins") then
						VehicleZoneDistribution.policejeffersonpd.vehicles["Base.hmmwvpolice"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.policejeffersonpd.vehicles["Base.hmmwvblackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.policejeffersonpd.vehicles["Base.blazerblackops"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.policejeffersonpd.vehicles["Base.m35a2blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.policejeffersonpd.vehicles["Base.m151blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
					end

					-- Kentucky State Police
					VehicleZoneDistribution.policeksp.vehicles["Base.85vicsheriff"] = {index = KSP[5], spawnChance = SandboxVars.STEV.KSP};
					VehicleZoneDistribution.policeksp.vehicles["Base.87capricePD"] = {index = KSP[4], spawnChance = SandboxVars.STEV.KSP};
					VehicleZoneDistribution.policeksp.vehicles["Base.91blazerpd"] = {index = KSP[6], spawnChance = SandboxVars.STEV.KSP};
					VehicleZoneDistribution.policeksp.vehicles["Base.92crownvicPD"] = {index = KSP[3], spawnChance = SandboxVars.STEV.KSP};

					-- Louisville Police
					VehicleZoneDistribution.policelouisvillepd.vehicles["Base.85vicsheriff"] = {index = LVPD[5], spawnChance = SandboxVars.STEV.Louisville};
					VehicleZoneDistribution.policelouisvillepd.vehicles["Base.87capricePD"] = {index = LVPD[4], spawnChance = SandboxVars.STEV.Louisville};
					VehicleZoneDistribution.policelouisvillepd.vehicles["Base.91blazerpd"] = {index = LVPD[6], spawnChance = SandboxVars.STEV.Louisville};
					VehicleZoneDistribution.policelouisvillepd.vehicles["Base.92crownvicPD"] = {index = LVPD[3], spawnChance = SandboxVars.STEV.Louisville};

					-- Rangers
					VehicleZoneDistribution.rangermeade.vehicles["Base.91blazerranger"] = {index = 0, spawnChance = SandboxVars.STEV.Rangers};
					VehicleZoneDistribution.rangermeade.vehicles["Base.91blazerranger"] = {index = 2, spawnChance = SandboxVars.STEV.Rangers};
					VehicleZoneDistribution.rangermeade.vehicles["Base.92wranglerranger"] = {index = RGR[2], spawnChance = SandboxVars.STEV.Rangers};
					VehicleZoneDistribution.rangermeade.vehicles["Base.92wranglerranger"] = {index = RGR[3], spawnChance = SandboxVars.STEV.Rangers};

				end

				-- Rosewood DOC
				VehicleZoneDistribution.policerosewooddoc.vehicles["Base.86econoline_meade"] = {index = -1, spawnChance = SandboxVars.STEV.MCDOC};
				VehicleZoneDistribution.policerosewooddoc.vehicles["Base.prisonbus_meade"] = {index = -1, spawnChance = SandboxVars.STEV.MCDOC};

				-- Jefferson County DOC
				VehicleZoneDistribution.policejeffersondoc.vehicles["Base.86econoline_jefferson"] = {index = -1, spawnChance = JCDOC};
				VehicleZoneDistribution.policejeffersondoc.vehicles["Base.prisonbus_jefferson"] = {index = -1, spawnChance = JCDOC};

				-- Park Rangers
				VehicleZoneDistribution.rangermeade.vehicles["Base.91blazerranger"] = {index = 1, spawnChance = SandboxVars.STEV.Rangers};
				VehicleZoneDistribution.rangermeade.vehicles["Base.85vicranger"] = {index = RGR[1], spawnChance = SandboxVars.STEV.Rangers};
				VehicleZoneDistribution.rangermeade.vehicles["Base.85vicranger"] = {index = RGR[2], spawnChance = SandboxVars.STEV.Rangers};
				VehicleZoneDistribution.rangermeade.vehicles["Base.85vicranger"] = {index = RGR[3], spawnChance = SandboxVars.STEV.Rangers};

				-- Rosewood Fire Departments
				VehicleZoneDistribution.firerosewood.vehicles["Base.firepumper"] = {index = Fire[1], spawnChance = SandboxVars.STEV.RosewoodFire};
				VehicleZoneDistribution.firerosewood.vehicles["Base.firepumper"] = {index = Fire[2], spawnChance = SandboxVars.STEV.MeadeFire};
				VehicleZoneDistribution.firerosewood.vehicles["Base.87c10fire"] = {index = Fire[1], spawnChance = SandboxVars.STEV.RosewoodFire};
				VehicleZoneDistribution.firerosewood.vehicles["Base.87c10fire"] = {index = Fire[2], spawnChance = SandboxVars.STEV.MeadeFire};

				-- Louisville Fire Departments
				VehicleZoneDistribution.firelouisville.vehicles["Base.firepumper"] = {index = Fire[3], spawnChance = SandboxVars.STEV.LouisvilleFire};
				VehicleZoneDistribution.firelouisville.vehicles["Base.87c10fire"] = {index = Fire[3], spawnChance = SandboxVars.STEV.LouisvilleFire};

				-- Louisville USPS HQ
				VehicleZoneDistribution.usps.vehicles["Base.92wrangler_USPS"] = {index = MAIL[1], spawnChance = SandboxVars.STEV.USPS};

			end

			if SandboxVars.STEV.VCars then

				-- Meade County Sheriff
				VehicleZoneDistribution.policemeade.vehicles["Base.CarLightsPolice"] = {index = MCSO[1], spawnChance = SandboxVars.STEV.Meade};
				VehicleZoneDistribution.policemeade.vehicles["Base.PickUpVanLightsPolice"] = {index = MCSO[2], spawnChance = SandboxVars.STEV.Meade};

				-- Riverside Police
				VehicleZoneDistribution.policeriversidepd.vehicles["Base.CarLightsPolice"] = {index = RSPD[1], spawnChance = SandboxVars.STEV.Riverside};
				VehicleZoneDistribution.policeriversidepd.vehicles["Base.PickUpVanLightsPolice"] = {index = RSPD[2], spawnChance = SandboxVars.STEV.Riverside};

				-- Rosewood Police
				VehicleZoneDistribution.policerosewoodsd.vehicles["Base.CarLightsPolice"] = {index = RWSD[1], spawnChance = SandboxVars.STEV.Rosewood};
				VehicleZoneDistribution.policerosewoodsd.vehicles["Base.PickUpVanLightsPolice"] = {index = RWSD[2], spawnChance = SandboxVars.STEV.Rosewood};

				-- WestPoint Police
				VehicleZoneDistribution.policewestpointpd.vehicles["Base.CarLightsPolice"] = {index = WPPD[1], spawnChance = SandboxVars.STEV.WestPoint};
				VehicleZoneDistribution.policewestpointpd.vehicles["Base.PickUpVanLightsPolice"] = {index = WPPD[2], spawnChance = SandboxVars.STEV.WestPoint};

				-- Muldraugh Police
				VehicleZoneDistribution.policemuldraughpd.vehicles["Base.CarLightsPolice"] = {index = MDPD[1], spawnChance = SandboxVars.STEV.Muldraugh};
				VehicleZoneDistribution.policemuldraughpd.vehicles["Base.PickUpVanLightsPolice"] = {index = MDPD[2], spawnChance = SandboxVars.STEV.Muldraugh};

				-- Jefferson County Sheriff
				VehicleZoneDistribution.policejeffersonsd.vehicles["Base.CarLightsPolice"] = {index = JCSD[1], spawnChance = SandboxVars.STEV.JCSD};
				VehicleZoneDistribution.policejeffersonsd.vehicles["Base.PickUpVanLightsPolice"] = {index = JCSD[2], spawnChance = SandboxVars.STEV.JCSD};

				-- Jefferson County Police
				VehicleZoneDistribution.policejeffersonpd.vehicles["Base.CarLightsPolice"] = {index = JCPD[1], spawnChance = SandboxVars.STEV.JCPD};
				VehicleZoneDistribution.policejeffersonpd.vehicles["Base.PickUpVanLightsPolice"] = {index = JCPD[2], spawnChance = SandboxVars.STEV.JCPD};

				-- Kentucky State Police
				VehicleZoneDistribution.policeksp.vehicles["Base.CarLightsPolice"] = {index = KSP[1], spawnChance = SandboxVars.STEV.KSP};
				VehicleZoneDistribution.policeksp.vehicles["Base.PickUpVanLightsPolice"] = {index = KSP[2], spawnChance = SandboxVars.STEV.KSP};

				-- Louisville Police
				VehicleZoneDistribution.policelouisvillepd.vehicles["Base.CarLightsPolice"] = {index = LVPD[1], spawnChance = SandboxVars.STEV.Louisville};
				VehicleZoneDistribution.policelouisvillepd.vehicles["Base.PickUpVanLightsPolice"] = {index = LVPD[2], spawnChance = SandboxVars.STEV.Louisville};

				-- Rosewood DOC
				VehicleZoneDistribution.policerosewooddoc.vehicles["Base.Van_meadedoc"] = {index = -1, spawnChance = SandboxVars.STEV.MCDOC};
				VehicleZoneDistribution.policerosewooddoc.vehicles["Base.CarLightsPolice"] = {index = 2, spawnChance = SandboxVars.STEV.MCDOC};
				VehicleZoneDistribution.policerosewooddoc.vehicles["Base.PickUpVanLightsPolice"] = {index = 2, spawnChance = SandboxVars.STEV.MCDOC};

				-- Jefferson County DOC
				VehicleZoneDistribution.policejeffersondoc.vehicles["Base.Van_jeffersondoc"] = {index = -1, spawnChance = JCDOC};

				-- Park Rangers
				VehicleZoneDistribution.rangermeade.vehicles["Base.CarLights"] = {index = RGR[1], spawnChance = SandboxVars.STEV.Rangers};
				VehicleZoneDistribution.rangermeade.vehicles["Base.CarLights"] = {index = RGR[2], spawnChance = SandboxVars.STEV.Rangers};
				VehicleZoneDistribution.rangermeade.vehicles["Base.CarLights"] = {index = RGR[3], spawnChance = SandboxVars.STEV.Rangers};

				VehicleZoneDistribution.rangermeade.vehicles["Base.PickUpTruckLights"] = {index = RGR[4], spawnChance = SandboxVars.STEV.Rangers};
				VehicleZoneDistribution.rangermeade.vehicles["Base.PickUpTruckLights"] = {index = RGR[5], spawnChance = SandboxVars.STEV.Rangers};
				VehicleZoneDistribution.rangermeade.vehicles["Base.PickUpTruckLights"] = {index = RGR[6], spawnChance = SandboxVars.STEV.Rangers};

				VehicleZoneDistribution.rangermeade.vehicles["Base.PickUpVanLights"] = {index = RGR[4], spawnChance = SandboxVars.STEV.Rangers};
				VehicleZoneDistribution.rangermeade.vehicles["Base.PickUpVanLights"] = {index = RGR[5], spawnChance = SandboxVars.STEV.Rangers};
				VehicleZoneDistribution.rangermeade.vehicles["Base.PickUpVanLights"] = {index = RGR[6], spawnChance = SandboxVars.STEV.Rangers};

				-- Fire Departments
				VehicleZoneDistribution.firerosewood.vehicles["Base.PickUpTruckLightsFire"] = {index = Fire[2], spawnChance = SandboxVars.STEV.MeadeFire};
				VehicleZoneDistribution.firerosewood.vehicles["Base.PickUpVanLightsFire"] = {index = Fire[2], spawnChance = SandboxVars.STEV.MeadeFire};
				VehicleZoneDistribution.firerosewood.vehicles["Base.PickUpTruckLightsFire"] = {index = Fire[1], spawnChance = SandboxVars.STEV.RosewoodFire};
				VehicleZoneDistribution.firerosewood.vehicles["Base.PickUpVanLightsFire"] = {index = Fire[1], spawnChance = SandboxVars.STEV.RosewoodFire};

				VehicleZoneDistribution.firelouisville.vehicles["Base.PickUpTruckLightsFire"] = {index = Fire[3], spawnChance = SandboxVars.STEV.LouisvilleFire};
				VehicleZoneDistribution.firelouisville.vehicles["Base.PickUpVanLightsFire"] = {index = Fire[3], spawnChance = SandboxVars.STEV.LouisvilleFire};

				VehicleZoneDistribution.usps.vehicles["Base.VanSpecial"] = {index = MAIL[2], spawnChance = SandboxVars.STEV.USPS};

			end

			VehicleZoneDistribution.banksecurity.vehicles["Base.87gmcarmouredcar"] = {index = -1, spawnChance = SandboxVars.STEV.BankTruck};

		end

		if not SandboxVars.STR.CustomVehicleZones then

			if getActivatedMods():contains("FRUsedCars") then

				-- Vanilla Police Zones
				if SandboxVars.STR.TrueSTEV then

					-- Meade County Sheriff
					VehicleZoneDistribution.police.vehicles["Base.85vicsheriff"] = {index = MCSO[5], spawnChance = SandboxVars.STEV.Meade};
					VehicleZoneDistribution.police.vehicles["Base.87capricePD"] = {index = MCSO[4], spawnChance = SandboxVars.STEV.Meade};

					-- Riverside Police
					VehicleZoneDistribution.police.vehicles["Base.85vicsheriff"] = {index = RSPD[5], spawnChance = SandboxVars.STEV.Riverside};
					VehicleZoneDistribution.police.vehicles["Base.87capricePD"] = {index = RSPD[4], spawnChance = SandboxVars.STEV.Riverside};

					-- Rosewood Police
					VehicleZoneDistribution.police.vehicles["Base.85vicsheriff"] = {index = RWSD[5], spawnChance = SandboxVars.STEV.Rosewood};
					VehicleZoneDistribution.police.vehicles["Base.87capricePD"] = {index = RWSD[4], spawnChance = SandboxVars.STEV.Rosewood};
					VehicleZoneDistribution.police.vehicles["Base.91blazerpd"] = {index = RWSD[6], spawnChance = SandboxVars.STEV.Rosewood};
					VehicleZoneDistribution.police.vehicles["Base.chevystepvanswat"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};

					if getActivatedMods():contains("MilitaryUsedCarSkins") then
						VehicleZoneDistribution.police.vehicles["Base.hmmwvpolice"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.hmmwvblackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.blazerblackops"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.m35a2blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.m151blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
					end

					-- WestPoint Police
					VehicleZoneDistribution.police.vehicles["Base.85vicsheriff"] = {index = WPPD[5], spawnChance = SandboxVars.STEV.WestPoint};
					VehicleZoneDistribution.police.vehicles["Base.87capricePD"] = {index = WPPD[4], spawnChance = SandboxVars.STEV.WestPoint};
					VehicleZoneDistribution.police.vehicles["Base.chevystepvanswat"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};

					if getActivatedMods():contains("MilitaryUsedCarSkins") then
						VehicleZoneDistribution.police.vehicles["Base.hmmwvpolice"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.hmmwvblackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.blazerblackops"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.m35a2blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.m151blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
					end

					-- Muldraugh Police
					VehicleZoneDistribution.police.vehicles["Base.85vicsheriff"] = {index = MDPD[5], spawnChance = SandboxVars.STEV.Muldraugh};
					VehicleZoneDistribution.police.vehicles["Base.87capricePD"] = {index = MDPD[4], spawnChance = SandboxVars.STEV.Muldraugh};

					-- Jefferson County Sheriff
					VehicleZoneDistribution.police.vehicles["Base.85vicsheriff"] = {index = JCSD[5], spawnChance = SandboxVars.STEV.JCSD};
					VehicleZoneDistribution.police.vehicles["Base.87capricePD"] = {index = JCSD[4], spawnChance = SandboxVars.STEV.JCSD};

					-- Jefferson County Police
					VehicleZoneDistribution.police.vehicles["Base.85vicsheriff"] = {index = JCPD[5], spawnChance = SandboxVars.STEV.JCPD};
					VehicleZoneDistribution.police.vehicles["Base.87capricePD"] = {index = JCPD[4], spawnChance = SandboxVars.STEV.JCPD};
					VehicleZoneDistribution.police.vehicles["Base.chevystepvanswat"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};

					if getActivatedMods():contains("MilitaryUsedCarSkins") then
						VehicleZoneDistribution.police.vehicles["Base.hmmwvpolice"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.hmmwvblackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.blazerblackops"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.m35a2blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.m151blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
					end

					-- Kentucky State Police
					VehicleZoneDistribution.police.vehicles["Base.85vicsheriff"] = {index = KSP[5], spawnChance = SandboxVars.STEV.KSP};
					VehicleZoneDistribution.police.vehicles["Base.92crownvicPD"] = {index = KSP[3], spawnChance = SandboxVars.STEV.KSP};

					-- Louisville Police
					VehicleZoneDistribution.police.vehicles["Base.92crownvicPD"] = {index = LVPD[3], spawnChance = SandboxVars.STEV.Louisville};
					VehicleZoneDistribution.police.spawnRate = SandboxVars.STEV.SRate;

				elseif not SandboxVars.STR.TrueSTEV then

					-- Meade County Sheriff
					VehicleZoneDistribution.police.vehicles["Base.85vicsheriff"] = {index = MCSO[5], spawnChance = SandboxVars.STEV.Meade};
					VehicleZoneDistribution.police.vehicles["Base.87capricePD"] = {index = MCSO[4], spawnChance = SandboxVars.STEV.Meade};
					VehicleZoneDistribution.police.vehicles["Base.91blazerpd"] = {index = MCSO[6], spawnChance = SandboxVars.STEV.Meade};
					VehicleZoneDistribution.police.vehicles["Base.92crownvicPD"] = {index = MCSO[3], spawnChance = SandboxVars.STEV.Meade};

					-- Riverside Police
					VehicleZoneDistribution.police.vehicles["Base.85vicsheriff"] = {index = RSPD[5], spawnChance = SandboxVars.STEV.Riverside};
					VehicleZoneDistribution.police.vehicles["Base.87capricePD"] = {index = RSPD[4], spawnChance = SandboxVars.STEV.Riverside};
					VehicleZoneDistribution.police.vehicles["Base.91blazerpd"] = {index = RSPD[6], spawnChance = SandboxVars.STEV.Riverside};
					VehicleZoneDistribution.police.vehicles["Base.92crownvicPD"] = {index = RSPD[3], spawnChance = SandboxVars.STEV.Riverside};

					-- Rosewood Police
					VehicleZoneDistribution.police.vehicles["Base.85vicsheriff"] = {index = RWSD[5], spawnChance = SandboxVars.STEV.Rosewood};
					VehicleZoneDistribution.police.vehicles["Base.87capricePD"] = {index = RWSD[4], spawnChance = SandboxVars.STEV.Rosewood};
					VehicleZoneDistribution.police.vehicles["Base.91blazerpd"] = {index = RWSD[6], spawnChance = SandboxVars.STEV.Rosewood};
					VehicleZoneDistribution.police.vehicles["Base.92crownvicPD"] = {index = RWSD[3], spawnChance = SandboxVars.STEV.Rosewood};
					VehicleZoneDistribution.police.vehicles["Base.chevystepvanswat"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};

					if getActivatedMods():contains("MilitaryUsedCarSkins") then
						VehicleZoneDistribution.police.vehicles["Base.hmmwvpolice"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.hmmwvblackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.blazerblackops"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.m35a2blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.m151blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
					end

					-- WestPoint Police
					VehicleZoneDistribution.police.vehicles["Base.85vicsheriff"] = {index = WPPD[5], spawnChance = SandboxVars.STEV.WestPoint};
					VehicleZoneDistribution.police.vehicles["Base.87capricePD"] = {index = WPPD[4], spawnChance = SandboxVars.STEV.WestPoint};
					VehicleZoneDistribution.police.vehicles["Base.91blazerpd"] = {index = WPPD[6], spawnChance = SandboxVars.STEV.WestPoint};
					VehicleZoneDistribution.police.vehicles["Base.92crownvicPD"] = {index = WPPD[3], spawnChance = SandboxVars.STEV.WestPoint};
					VehicleZoneDistribution.police.vehicles["Base.chevystepvanswat"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};

					if getActivatedMods():contains("MilitaryUsedCarSkins") then
						VehicleZoneDistribution.police.vehicles["Base.hmmwvpolice"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.hmmwvblackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.blazerblackops"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.m35a2blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.m151blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
					end

					-- Muldraugh Police
					VehicleZoneDistribution.police.vehicles["Base.85vicsheriff"] = {index = MDPD[5], spawnChance = SandboxVars.STEV.Muldraugh};
					VehicleZoneDistribution.police.vehicles["Base.87capricePD"] = {index = MDPD[4], spawnChance = SandboxVars.STEV.Muldraugh};
					VehicleZoneDistribution.police.vehicles["Base.91blazerpd"] = {index = MDPD[6], spawnChance = SandboxVars.STEV.Muldraugh};
					VehicleZoneDistribution.police.vehicles["Base.92crownvicPD"] = {index = MDPD[3], spawnChance = SandboxVars.STEV.Muldraugh};

					-- Jefferson County Sheriff
					VehicleZoneDistribution.police.vehicles["Base.85vicsheriff"] = {index = JCSD[5], spawnChance = SandboxVars.STEV.JCSD};
					VehicleZoneDistribution.police.vehicles["Base.87capricePD"] = {index = JCSD[4], spawnChance = SandboxVars.STEV.JCSD};
					VehicleZoneDistribution.police.vehicles["Base.91blazerpd"] = {index = JCSD[6], spawnChance = SandboxVars.STEV.JCSD};
					VehicleZoneDistribution.police.vehicles["Base.92crownvicPD"] = {index = JCSD[3], spawnChance = SandboxVars.STEV.JCSD};

					-- Jefferson County Police
					VehicleZoneDistribution.police.vehicles["Base.85vicsheriff"] = {index = JCPD[5], spawnChance = SandboxVars.STEV.JCPD};
					VehicleZoneDistribution.police.vehicles["Base.87capricePD"] = {index = JCPD[4], spawnChance = SandboxVars.STEV.JCPD};
					VehicleZoneDistribution.police.vehicles["Base.91blazerpd"] = {index = JCPD[6], spawnChance = SandboxVars.STEV.JCPD};
					VehicleZoneDistribution.police.vehicles["Base.92crownvicPD"] = {index = JCPD[3], spawnChance = SandboxVars.STEV.JCPD};
					VehicleZoneDistribution.police.vehicles["Base.chevystepvanswat"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};

					if getActivatedMods():contains("MilitaryUsedCarSkins") then
						VehicleZoneDistribution.police.vehicles["Base.hmmwvpolice"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.hmmwvblackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.blazerblackops"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.m35a2blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
						VehicleZoneDistribution.police.vehicles["Base.m151blackopps"] = {index = -1, spawnChance = SandboxVars.STEV.FSwat};
					end

					-- Kentucky State Police
					VehicleZoneDistribution.police.vehicles["Base.85vicsheriff"] = {index = KSP[5], spawnChance = SandboxVars.STEV.KSP};
					VehicleZoneDistribution.police.vehicles["Base.87capricePD"] = {index = KSP[4], spawnChance = SandboxVars.STEV.KSP};
					VehicleZoneDistribution.police.vehicles["Base.91blazerpd"] = {index = KSP[6], spawnChance = SandboxVars.STEV.KSP};
					VehicleZoneDistribution.police.vehicles["Base.92crownvicPD"] = {index = KSP[3], spawnChance = SandboxVars.STEV.KSP};

					-- Louisville Police
					VehicleZoneDistribution.police.vehicles["Base.85vicsheriff"] = {index = LVPD[5], spawnChance = SandboxVars.STEV.Louisville};
					VehicleZoneDistribution.police.vehicles["Base.87capricePD"] = {index = LVPD[4], spawnChance = SandboxVars.STEV.Louisville};
					VehicleZoneDistribution.police.vehicles["Base.91blazerpd"] = {index = LVPD[6], spawnChance = SandboxVars.STEV.Louisville};
					VehicleZoneDistribution.police.vehicles["Base.92crownvicPD"] = {index = LVPD[3], spawnChance = SandboxVars.STEV.Louisville};
					VehicleZoneDistribution.police.spawnRate = SandboxVars.STEV.SRate;

					-- Vanilla Ranger Zones
					VehicleZoneDistribution.ranger.vehicles["Base.91blazerranger"] = {index = 0, spawnChance = SandboxVars.STEV.Rangers};
					VehicleZoneDistribution.ranger.vehicles["Base.91blazerranger"] = {index = 2, spawnChance = SandboxVars.STEV.Rangers};
					VehicleZoneDistribution.ranger.vehicles["Base.92wranglerranger"] = {index = RGR[1], spawnChance = SandboxVars.STEV.Rangers};
					VehicleZoneDistribution.ranger.spawnRate = SandboxVars.STEV.SRate;

				end

				-- Vanilla Ranger Zones
				VehicleZoneDistribution.ranger.vehicles["Base.91blazerranger"] = {index = 1, spawnChance = SandboxVars.STEV.Rangers};
				VehicleZoneDistribution.ranger.vehicles["Base.92wranglerranger"] = {index = RGR[2], spawnChance = SandboxVars.STEV.Rangers};
				VehicleZoneDistribution.ranger.vehicles["Base.92wranglerranger"] = {index = RGR[3], spawnChance = SandboxVars.STEV.Rangers};
				VehicleZoneDistribution.ranger.vehicles["Base.85vicranger"] = {index = RGR[1], spawnChance = SandboxVars.STEV.Rangers};
				VehicleZoneDistribution.ranger.vehicles["Base.85vicranger"] = {index = RGR[2], spawnChance = SandboxVars.STEV.Rangers};
				VehicleZoneDistribution.ranger.vehicles["Base.85vicranger"] = {index = RGR[3], spawnChance = SandboxVars.STEV.Rangers};
				VehicleZoneDistribution.ranger.spawnRate = SandboxVars.STEV.SRate;

				-- Rosewood Fire Departments
				VehicleZoneDistribution.fire.vehicles["Base.firepumper"] = {index = Fire[1], spawnChance = SandboxVars.STEV.RosewoodFire};
				VehicleZoneDistribution.fire.vehicles["Base.firepumper"] = {index = Fire[2], spawnChance = SandboxVars.STEV.MeadeFire};
				VehicleZoneDistribution.fire.vehicles["Base.87c10fire"] = {index = Fire[1], spawnChance = SandboxVars.STEV.RosewoodFire};
				VehicleZoneDistribution.fire.vehicles["Base.87c10fire"] = {index = Fire[2], spawnChance = SandboxVars.STEV.MeadeFire};
				VehicleZoneDistribution.fire.vehicles["Base.firepumper"] = {index = Fire[3], spawnChance = SandboxVars.STEV.LouisvilleFire};
				VehicleZoneDistribution.fire.vehicles["Base.87c10fire"] = {index = Fire[3], spawnChance = SandboxVars.STEV.LouisvilleFire};

				-- Vanilla Ambulance Zones
				VehicleZoneDistribution.ambulance.vehicles["Base.86econolineambulance"] = {index = EMS[1], spawnChance = SandboxVars.STEV.EMS};
				VehicleZoneDistribution.ambulance.vehicles["Base.80f350ambulance"] = {index = EMS[1], spawnChance = SandboxVars.STEV.EMS};
				VehicleZoneDistribution.ambulance.vehicles["Base.86econolineambulance"] = {index = EMS[2], spawnChance = SandboxVars.STEV.EMS};
				VehicleZoneDistribution.ambulance.vehicles["Base.80f350ambulance"] = {index = EMS[2], spawnChance = SandboxVars.STEV.EMS};
				VehicleZoneDistribution.ambulance.vehicles["Base.86econolineambulance"] = {index = EMS[3], spawnChance = SandboxVars.STEV.EMS};
				VehicleZoneDistribution.ambulance.vehicles["Base.80f350ambulance"] = {index = EMS[3], spawnChance = SandboxVars.STEV.EMS};
				VehicleZoneDistribution.ambulance.spawnRate = SandboxVars.STEV.SRate;

			end

			if SandboxVars.STEV.VCars then

				-- Vanilla Police Zones
				VehicleZoneDistribution.police.vehicles["Base.CarLightsPolice"] = {index = MCSO[1], spawnChance = SandboxVars.STEV.Meade};
				VehicleZoneDistribution.police.vehicles["Base.CarLightsPolice"] = {index = RSPD[1], spawnChance = SandboxVars.STEV.Riverside};
				VehicleZoneDistribution.police.vehicles["Base.CarLightsPolice"] = {index = RWSD[1], spawnChance = SandboxVars.STEV.Rosewood};
				VehicleZoneDistribution.police.vehicles["Base.CarLightsPolice"] = {index = WPPD[1], spawnChance = SandboxVars.STEV.WestPoint};
				VehicleZoneDistribution.police.vehicles["Base.CarLightsPolice"] = {index = MDPD[1], spawnChance = SandboxVars.STEV.Muldraugh};
				VehicleZoneDistribution.police.vehicles["Base.CarLightsPolice"] = {index = JCSD[1], spawnChance = SandboxVars.STEV.JCSD};
				VehicleZoneDistribution.police.vehicles["Base.CarLightsPolice"] = {index = JCPD[1], spawnChance = SandboxVars.STEV.JCPD};
				VehicleZoneDistribution.police.vehicles["Base.CarLightsPolice"] = {index = KSP[1], spawnChance = SandboxVars.STEV.KSP};
				VehicleZoneDistribution.police.vehicles["Base.CarLightsPolice"] = {index = LVPD[1], spawnChance = SandboxVars.STEV.Louisville};
				VehicleZoneDistribution.police.vehicles["Base.PickUpVanLightsPolice"] = {index = MCSO[2], spawnChance = SandboxVars.STEV.Meade};
				VehicleZoneDistribution.police.vehicles["Base.PickUpVanLightsPolice"] = {index = RSPD[2], spawnChance = SandboxVars.STEV.Riverside};
				VehicleZoneDistribution.police.vehicles["Base.PickUpVanLightsPolice"] = {index = RWSD[2], spawnChance = SandboxVars.STEV.Rosewood};
				VehicleZoneDistribution.police.vehicles["Base.PickUpVanLightsPolice"] = {index = WPPD[2], spawnChance = SandboxVars.STEV.WestPoint};
				VehicleZoneDistribution.police.vehicles["Base.PickUpVanLightsPolice"] = {index = MDPD[2], spawnChance = SandboxVars.STEV.Muldraugh};
				VehicleZoneDistribution.police.vehicles["Base.PickUpVanLightsPolice"] = {index = JCSD[2], spawnChance = SandboxVars.STEV.JCSD};
				VehicleZoneDistribution.police.vehicles["Base.PickUpVanLightsPolice"] = {index = JCPD[2], spawnChance = SandboxVars.STEV.JCPD};
				VehicleZoneDistribution.police.vehicles["Base.PickUpVanLightsPolice"] = {index = KSP[2], spawnChance = SandboxVars.STEV.KSP};
				VehicleZoneDistribution.police.vehicles["Base.PickUpVanLightsPolice"] = {index = LVPD[2], spawnChance = SandboxVars.STEV.Louisville};
				VehicleZoneDistribution.police.vehicles["Base.Van_meadedoc"] = {index = -1, spawnChance = SandboxVars.STEV.MCDOC};
				VehicleZoneDistribution.police.vehicles["Base.Van_jeffersondoc"] = {index = -1, spawnChance = JCDOC};

				-- Vanilla Ranger Zones
				VehicleZoneDistribution.ranger.vehicles["Base.CarLights"] = {index = RGR[1], spawnChance = SandboxVars.STEV.Rangers};
				VehicleZoneDistribution.ranger.vehicles["Base.CarLights"] = {index = RGR[2], spawnChance = SandboxVars.STEV.Rangers};
				VehicleZoneDistribution.ranger.vehicles["Base.CarLights"] = {index = RGR[3], spawnChance = SandboxVars.STEV.Rangers};
				VehicleZoneDistribution.ranger.spawnRate = SandboxVars.STEV.SRate;

				-- Vanilla Ambulance Zones
				VehicleZoneDistribution.ambulance.vehicles["Base.VanAmbulance"] = {index = EMS[3], spawnChance = SandboxVars.STEV.EMS};
				VehicleZoneDistribution.ambulance.vehicles["Base.VanAmbulance"] = {index = EMS[1], spawnChance = SandboxVars.STEV.EMS};
				VehicleZoneDistribution.ambulance.vehicles["Base.VanAmbulance"] = {index = EMS[2], spawnChance = SandboxVars.STEV.EMS};
				VehicleZoneDistribution.ambulance.spawnRate = SandboxVars.STEV.SRate;

				-- Vanilla Fire Zones
				VehicleZoneDistribution.fire.vehicles["Base.PickUpTruckLightsFire"] = {index = Fire[2], spawnChance = SandboxVars.STEV.MeadeFire};
				VehicleZoneDistribution.fire.vehicles["Base.PickUpVanLightsFire"] = {index = Fire[2], spawnChance = SandboxVars.STEV.MeadeFire};
				VehicleZoneDistribution.fire.vehicles["Base.PickUpTruckLightsFire"] = {index = Fire[1], spawnChance = SandboxVars.STEV.RosewoodFire};
				VehicleZoneDistribution.fire.vehicles["Base.PickUpVanLightsFire"] = {index = Fire[1], spawnChance = SandboxVars.STEV.RosewoodFire};
				VehicleZoneDistribution.fire.vehicles["Base.PickUpTruckLightsFire"] = {index = Fire[3], spawnChance = SandboxVars.STEV.LouisvilleFire};
				VehicleZoneDistribution.fire.vehicles["Base.PickUpVanLightsFire"] = {index = Fire[3], spawnChance = SandboxVars.STEV.LouisvilleFire};
				VehicleZoneDistribution.fire.spawnRate = SandboxVars.STEV.SRate;

			end

			VehicleZoneDistribution.police.vehicles["Base.87gmcarmouredcar"] = {index = -1, spawnChance = SandboxVars.STEV.BankTruck};
			VehicleZoneDistribution.police.spawnRate = SandboxVars.STEV.SRate;

		end
	end
end

Events.OnInitGlobalModData.Add(STEVSpawns);