
require 'NPCs/ZombiesZoneDefinition'

-- Code to add sandbox settings for spawnchances

local function DoIt() --It does the thing
	local StalkerSpawnrate = SandboxVars.UndeadSurvivor.StalkerChance;
	local NomadSpawnrate = SandboxVars.UndeadSurvivor.NomadChance;
	local PrepperSpawnrate = SandboxVars.UndeadSurvivor.PrepperChance;
	local HeadhunterSpawnrate = SandboxVars.UndeadSurvivor.HeadhunterChance;
	local AmazonaSpawnrate = SandboxVars.UndeadSurvivor.AmazonaChance;

	table.insert(ZombiesZoneDefinition.Default,{name = "Stalker", chance = StalkerSpawnrate});

	table.insert(ZombiesZoneDefinition.Default,{name = "Nomad", chance = NomadSpawnrate});

	table.insert(ZombiesZoneDefinition.Default,{name = "OminousNomad", chance = 0.01}); -- If Normal Outfit is set to 0% also do not let secret variation spawn
	if NomadSpawnrate == 0.00 then
		table.insert(ZombiesZoneDefinition.Default,{name = "OminousNomad", chance = 0});
	end

	table.insert(ZombiesZoneDefinition.Default,{name = "Prepper", chance = PrepperSpawnrate});

	table.insert(ZombiesZoneDefinition.Default,{name = "Headhunter", chance = HeadhunterSpawnrate});

	table.insert(ZombiesZoneDefinition.Default,{name = "DeadlyHeadhunter", chance = 0.01}); -- If Normal Outfit is set to 0% also do not let secret variation spawn
	if HeadhunterSpawnrate == 0.00 then
		table.insert(ZombiesZoneDefinition.Default,{name = "DeadlyHeadhunter", chance = 0});
	end

	table.insert(ZombiesZoneDefinition.Default,{name = "Amazona", chance = AmazonaSpawnrate});

end
Events.OnPostDistributionMerge.Add(DoIt);