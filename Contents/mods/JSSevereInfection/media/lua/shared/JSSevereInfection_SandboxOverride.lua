-- ! Event Functions ! --

-- Just need to set mortality to never so we get fake infections instead of real ones
function JSSevereInfectionSandboxOverride()

	getSandboxOptions():set("ZombieLore.Mortality", 7);

end
	
Events.OnGameStart.Add(JSSevereInfectionSandboxOverride)
Events.OnGameBoot.Add(JSSevereInfectionSandboxOverride)
Events.OnLoad.Add(JSSevereInfectionSandboxOverride)