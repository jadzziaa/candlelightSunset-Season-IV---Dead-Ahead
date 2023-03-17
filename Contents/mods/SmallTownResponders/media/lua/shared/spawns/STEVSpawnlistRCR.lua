local function STEVRCRSpawns()

	local RCRPD = {};
	RCRPD[1] = 10; -- vanilla police car
	RCRPD[2] = 10; -- vanilla police truck
	RCRPD[3] = 11; -- 92 vic
	RCRPD[4] = 11; -- 87 caprice
	RCRPD[5] = 12; -- 85 vic
	RCRPD[6] = 12; -- 91 blazer

	local RCRFD = {};
	RCRFD[1] = 4; -- RavenCreek

	local RCREMS = {};
	RCREMS[1] = 4; -- RavenCreek

	if getActivatedMods():contains("ProperPoliceSkins") then

		RCRPD[1] = 11; -- vanilla police car
		RCRPD[2] = 11; -- vanilla police truck

	end

	if getActivatedMods():contains("KSPOPack") then

		RCRPD[3] = 10; -- 92 vic
		RCRPD[5] = 11; -- 85 vic

	end

	if getActivatedMods():contains("VVehicleEnhancer") then

		RCRPD[1] = 10; -- vanilla police car
		RCRPD[2] = 11; -- vanilla police truck

	end

	if VehicleZoneDistribution then

		-- RavenCreek Police
		VehicleZoneDistribution.policeravencreek = {}
		VehicleZoneDistribution.policeravencreek.vehicles = {}
		VehicleZoneDistribution.policeravencreek.chanceToSpawnNormal = SandboxVars.STEV.NChance;
		VehicleZoneDistribution.policeravencreek.chanceToSpawnSpecial = 0;
		VehicleZoneDistribution.policeravencreek.spawnRate = SandboxVars.STEV.SRate;

		-- RavenCreek DOC
		VehicleZoneDistribution.policeravencreekdoc = {}
		VehicleZoneDistribution.policeravencreekdoc.vehicles = {}
		VehicleZoneDistribution.policeravencreekdoc.chanceToSpawnNormal = SandboxVars.STEV.NChance;
		VehicleZoneDistribution.policeravencreekdoc.chanceToSpawnSpecial = 0;
		VehicleZoneDistribution.policeravencreekdoc.spawnRate = SandboxVars.STEV.SRate;

		-- RavenCreek FD
		VehicleZoneDistribution.fireravencreek = {}
		VehicleZoneDistribution.fireravencreek.vehicles = {}
		VehicleZoneDistribution.fireravencreek.chanceToSpawnNormal = SandboxVars.STEV.NChance;
		VehicleZoneDistribution.fireravencreek.chanceToSpawnSpecial = 0;
		VehicleZoneDistribution.fireravencreek.spawnRate = SandboxVars.STEV.SRate;

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

		if SandboxVars.STR.CustomVehicleZones and getActivatedMods():contains("RavenCreek") then

			if getActivatedMods():contains("FRUsedCars") then

				-- RavenCreek Police
				VehicleZoneDistribution.policeravencreek.vehicles["Base.85vicsheriff"] = {index = RCRPD[5], spawnChance = SandboxVars.STEV.RCRPD};
				VehicleZoneDistribution.policeravencreek.vehicles["Base.87capricePD"] = {index = RCRPD[4], spawnChance = SandboxVars.STEV.RCRPD};
				VehicleZoneDistribution.policeravencreek.vehicles["Base.92crownvicPD"] = {index = RCRPD[3], spawnChance = SandboxVars.STEV.RCRPD};
				VehicleZoneDistribution.policeravencreek.vehicles["Base.91blazerpd"] = {index = RCRPD[6], spawnChance = SandboxVars.STEV.RCRPD};

				-- RavenCreek DOC
				VehicleZoneDistribution.policeravencreekdoc.vehicles["Base.86econoline_ravencreek"] = {index = -1, spawnChance = SandboxVars.STEV.RCRDOC};
				VehicleZoneDistribution.policeravencreekdoc.vehicles["Base.prisonbus_ravencreek"] = {index = -1, spawnChance = SandboxVars.STEV.RCRDOC};

				-- RavenCreek FD/EMS
				VehicleZoneDistribution.fireravencreek.vehicles["Base.80f350ambulance"] = {index = RCREMS[4], spawnChance = SandboxVars.STEV.EMS};
				VehicleZoneDistribution.fireravencreek.vehicles["Base.86econolineambulance"] = {index = RCREMS[4], spawnChance = SandboxVars.STEV.EMS};

				VehicleZoneDistribution.fireravencreek.vehicles["Base.firepumper"] = {index = RCREMS[4], spawnChance = SandboxVars.STEV.RCRFD};
				VehicleZoneDistribution.fireravencreek.vehicles["Base.87c10fire"] = {index = RCREMS[4], spawnChance = SandboxVars.STEV.RCRFD};

			end

			if SandboxVars.STEV.VCars then

				-- RavenCreek Police
				VehicleZoneDistribution.policeravencreek.vehicles["Base.CarLightsPolice"] = {index = RCRPD[1], spawnChance = SandboxVars.STEV.RCRPD};
				VehicleZoneDistribution.policeravencreek.vehicles["Base.PickUpVanLightsPolice"] = {index = RCRPD[2], spawnChance = SandboxVars.STEV.RCRPD};

				-- RavenCreek DOC
				VehicleZoneDistribution.policeravencreekdoc.vehicles["Base.Van_ravencreekdoc"] = {index = -1, spawnChance = SandboxVars.STEV.RCRDOC};

				-- RavenCreek FD/EMS
				VehicleZoneDistribution.fireravencreek.vehicles["Base.VanAmbulance"] = {index = RCREMS[4], spawnChance = SandboxVars.STEV.EMS};

				VehicleZoneDistribution.fireravencreek.vehicles["Base.PickUpTruckLightsFire"] = {index = RCREMS[4], spawnChance = SandboxVars.STEV.RCRFD};
				VehicleZoneDistribution.fireravencreek.vehicles["Base.PickUpVanLightsFire"] = {index = RCREMS[4], spawnChance = SandboxVars.STEV.RCRFD};

			end
		end

		if not SandboxVars.STR.CustomVehicleZones and getActivatedMods():contains("RavenCreek") then

			if getActivatedMods():contains("FRUsedCars") then

				-- Vanilla Police Zones

				-- RavenCreek Police
				VehicleZoneDistribution.police.vehicles["Base.85vicsheriff"] = {index = RCRPD[5], spawnChance = SandboxVars.STEV.RCRPD};
				VehicleZoneDistribution.police.vehicles["Base.87capricePD"] = {index = RCRPD[4], spawnChance = SandboxVars.STEV.RCRPD};
				VehicleZoneDistribution.police.vehicles["Base.92crownvicPD"] = {index = RCRPD[3], spawnChance = SandboxVars.STEV.RCRPD};
				VehicleZoneDistribution.police.vehicles["Base.91blazerpd"] = {index = RCRPD[6], spawnChance = SandboxVars.STEV.RCRPD};
				VehicleZoneDistribution.police.vehicles["Base.86econoline_ravencreek"] = {index = -1, spawnChance = SandboxVars.STEV.RCRDOC};
				VehicleZoneDistribution.police.vehicles["Base.prisonbus_ravencreek"] = {index = -1, spawnChance = SandboxVars.STEV.RCRDOC};

				-- RavenCreek FD/EMS
				VehicleZoneDistribution.ambulance.vehicles["Base.80f350ambulance"] = {index = RCREMS[4], spawnChance = SandboxVars.STEV.EMS};
				VehicleZoneDistribution.ambulance.vehicles["Base.86econolineambulance"] = {index = RCREMS[4], spawnChance = SandboxVars.STEV.EMS};

				VehicleZoneDistribution.fire.vehicles["Base.firepumper"] = {index = RCREMS[4], spawnChance = SandboxVars.STEV.RCRFD};
				VehicleZoneDistribution.fire.vehicles["Base.87c10fire"] = {index = RCREMS[4], spawnChance = SandboxVars.STEV.RCRFD};

			end

			if SandboxVars.STEV.VCars then

				-- RavenCreek Police
				VehicleZoneDistribution.police.vehicles["Base.Van_ravencreekdoc"] = {index = -1, spawnChance = SandboxVars.STEV.RCRDOC};
				VehicleZoneDistribution.police.vehicles["Base.CarLightsPolice"] = {index = RCRPD[1], spawnChance = SandboxVars.STEV.RCRPD};
				VehicleZoneDistribution.police.vehicles["Base.PickUpVanLightsPolice"] = {index = RCRPD[2], spawnChance = SandboxVars.STEV.RCRPD};
				VehicleZoneDistribution.police.spawnRate = SandboxVars.STEV.SRate;

				-- RavenCreek FD/EMS
				VehicleZoneDistribution.ambulance.vehicles["Base.VanAmbulance"] = {index = RCREMS[4], spawnChance = SandboxVars.STEV.EMS};
				VehicleZoneDistribution.ambulance.spawnRate = SandboxVars.STEV.SRate;

				VehicleZoneDistribution.fire.vehicles["Base.PickUpTruckLightsFire"] = {index = RCREMS[4], spawnChance = SandboxVars.STEV.RCRFD};
				VehicleZoneDistribution.fire.vehicles["Base.PickUpVanLightsFire"] = {index = RCREMS[4], spawnChance = SandboxVars.STEV.RCRFD};
				VehicleZoneDistribution.fire.spawnRate = SandboxVars.STEV.SRate;

			end
		end
	end
end

Events.OnInitGlobalModData.Add(STEVRCRSpawns);