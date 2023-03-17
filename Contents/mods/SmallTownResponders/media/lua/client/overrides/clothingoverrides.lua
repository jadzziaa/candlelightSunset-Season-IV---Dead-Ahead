-- by albion #0123
-- seriously, thanks Albion!
local Overrides = require 'overrides/overrides'
local ClothingOverrides = {}

ClothingOverrides.outfitsToSwap = {
    Police = 'Police',
    PoliceState = 'Police',
    PoliceRiot = 'PoliceRiot',
    Fireman = 'Fireman',
    FiremanFullSuit = 'Fireman',
    Ranger = 'Ranger',
    Postal = 'Postal',
    AmbulanceDriver = 'EMS',
    PrisonGuard = 'PrisonGuard',
    Inmate = 'Inmate',
    InmateEscaped = 'InmateEscaped',
    -- susceptible
    SusceptiblePoliceGasmask = 'PoliceSusceptible',
    SusceptibleFirefighter = 'FiremanSusceptible',
}

ClothingOverrides.zonesToOutfit = {
    Rosewood = {
        --Police = 'PoliceRosewood',
        Fireman = {'Fireman_Rosewood_Black', 'FiremanFullSuit_Rosewood_Black', 'Fireman_Rosewood_Khaki', 'FiremanFullSuit_Rosewood_Khaki'},
		PoliceSusceptible = 'SusceptiblePoliceRosewood',
		FiremanSusceptible = {'SusceptibleFireman_Rosewood_Black', 'SusceptibleFiremanFullSuit_Rosewood_Black', 'SusceptibleFireman_Rosewood_Khaki', 'SusceptibleFiremanFullSuit_Rosewood_Khaki'},},
    Louisville = {
        Fireman = {'Fireman_Louisville_Black', 'FiremanFullSuit_Louisville_Black', 'Fireman_Louisville_Khaki', 'FiremanFullSuit_Louisville_Khaki'},
        EMS = 'EMSLouisville',
        PrisonGuard = 'DOC_Jefferson',
        Inmate = 'InmateJefferson',
        InmateEscaped = 'InmateEscapedJefferson',
		FiremanSusceptible = {'SusceptibleFireman_Louisville_Black', 'SusceptibleFiremanFullSuit_Louisville_Black', 'SusceptibleFireman_Louisville_Khaki', 'SusceptibleFiremanFullSuit_Louisville_Khaki'},},
    Jefferson = {
        Fireman = {'Fireman_Louisville_Black', 'FiremanFullSuit_Louisville_Black', 'Fireman_Louisville_Khaki', 'FiremanFullSuit_Louisville_Khaki'},
        EMS = 'EMSJefferson',
		FiremanSusceptible = {'SusceptibleFireman_Louisville_Black', 'SusceptibleFiremanFullSuit_Louisville_Black', 'SusceptibleFireman_Louisville_Khaki', 'SusceptibleFiremanFullSuit_Louisville_Khaki'},},
    RavenCreek = {
        --Police = 'PoliceRavenCreek',
        Fireman = {'Fireman_RavenCreek_Black', 'FiremanFullSuit_RavenCreek_Black', 'Fireman_RavenCreek_Khaki', 'FiremanFullSuit_RavenCreek_Khaki'},
        EMS = 'EMSRavenCreek',
        PrisonGuard = 'DOC_RavenCreek',
        Inmate = {'InmateRavenCreek'},
        InmateEscaped = 'InmateEscapedRavenCreek',
		PoliceSusceptible = 'SusceptiblePoliceRavenCreek',
		FiremanSusceptible = {'SusceptibleFireman_RavenCreek_Black', 'SusceptibleFiremanFullSuit_RavenCreek_Black', 'SusceptibleFireman_RavenCreek_Khaki', 'SusceptibleFiremanFullSuit_RavenCreek_Khaki'},},
    -- police only zones
    Riverside = {
        --Police = 'PoliceRiverside',
		PoliceSusceptible = 'SusceptiblePoliceRiverside',},
    Muldraugh = {
        --Police = 'PoliceMuldraugh',
		PoliceSusceptible = 'SusceptiblePoliceMuldraugh',},
    WestPoint = {
        --Police = 'PoliceWestPoint',
		PoliceSusceptible = 'SusceptiblePoliceWestPoint',},
    JeffersonSD = {
        --Police = 'PoliceJeffersonSD',
		PoliceSusceptible = 'SusceptiblePoliceJeffersonSD',},
    JeffersonPD = {
        --Police = 'PoliceJeffersonPD',
		PoliceSusceptible = 'SusceptiblePoliceJeffersonPD',},
    LouisvillePD = {
        --Police = 'PoliceLouisville',
		PoliceSusceptible = 'SusceptiblePoliceLouisville',},
    KSP = {
        --Police = 'KSP_Trooper',
        PoliceRiot = 'KSP_TrooperRiot',
		PoliceSusceptible = 'SusceptibleKSP_Trooper',},
    -- default
    Meade = {
        --Ranger = {'FederalRanger', 'State_LawRanger', 'StateRanger'},
        --Police = 'PoliceMeade',
        Fireman = {'Fireman_Meade_Black', 'FiremanFullSuit_Meade_Black', 'Fireman_Meade_Khaki', 'FiremanFullSuit_Meade_Khaki'},
        EMS = 'EMSMeade',
        PrisonGuard = 'DOC_Meade',
        Inmate = {'InmateMeadeOrange', 'InmateMeadeYellow', 'InmateMeadeRed'},
        InmateEscaped = 'InmateEscapedMeade',
		PoliceSusceptible = 'SusceptiblePoliceMeade',
		FiremanSusceptible = {'SusceptibleFireman_Meade_Black', 'SusceptibleFiremanFullSuit_Meade_Black', 'SusceptibleFireman_Meade_Khaki', 'SusceptibleFiremanFullSuit_Meade_Khaki'},},
		--Postal = 'USPS_Mail',},
}

ClothingOverrides.overrideOutfit = function(zombie)
    local outfitType = ClothingOverrides.outfitsToSwap[zombie:getOutfitName()]
    if not outfitType then return end

    local x = zombie:getX()
    local y = zombie:getY()
    local zone
    if luautils.stringStarts(outfitType, 'Police') then
        zone = Overrides.getZone(x,y,Overrides.zonesPolice)
    else
        zone = Overrides.getZone(x,y)
    end
    
    local outfit = ClothingOverrides.zonesToOutfit[zone][outfitType] or ClothingOverrides.zonesToOutfit.Meade[outfitType]

    if type(outfit) == 'table' then
        outfit = outfit[ZombRand(1, #outfit+1)]
    end

    zombie:dressInNamedOutfit(outfit)
    zombie:resetModel()
end

ClothingOverrides.zeroTick = 0
local zombieList

function ClothingOverrides.OnTick(tick)
    local zombieIndex = tick - ClothingOverrides.zeroTick
    if zombieList:size() > zombieIndex then
        ClothingOverrides.overrideOutfit(zombieList:get(zombieIndex))
    else
        ClothingOverrides.zeroTick = tick + 1
    end
end

Events.OnGameStart.Add(function(check)
    zombieList = getCell():getZombieList()
	if SandboxVars.STR.ZombieOverrides and getWorld():getMap():contains("Muldraugh, KY") then
		Events.OnTick.Add(ClothingOverrides.OnTick)
	else
		Events.OnTick.Remove(ClothingOverrides.OnTick)
	end
end)

Events.OnInitGlobalModData.Add(function()
	if SandboxVars.STR.DuffelLoot then
		ClothingOverrides.zonesToOutfit.Meade.Ranger = {"FederalRanger_Bag", "StateRanger_Bag", "State_LawRanger_Bag", "FederalRanger", "State_LawRanger", "StateRanger", "FederalRanger", "State_LawRanger", "StateRanger", "FederalRanger", "State_LawRanger", "StateRanger", "FederalRanger", "State_LawRanger", "StateRanger"}
		ClothingOverrides.zonesToOutfit.Meade.Postal = {"USPS_Mail_Bag", "USPS_Mail", "USPS_Mail", "USPS_Mail", "USPS_Mail"}
		ClothingOverrides.zonesToOutfit.KSP.Police = {"KSP_Trooper_Bag", "KSP_Trooper", "KSP_Trooper", "KSP_Trooper", "KSP_Trooper"}
		if SandboxVars.STR.VestRosewood then
			ClothingOverrides.zonesToOutfit.Rosewood.Police = {"PoliceRosewood_Bag", "PoliceRosewood", "PoliceRosewood", "PoliceRosewood", "PoliceRosewood"}
			ClothingOverrides.zonesToOutfit.Rosewood.PoliceRiot = "PoliceRosewoodRiot"
		elseif not SandboxVars.STR.VestRosewood then
			ClothingOverrides.zonesToOutfit.Rosewood.Police = {"PoliceRosewoodNoVest_Bag", "PoliceRosewoodNoVest", "PoliceRosewoodNoVest", "PoliceRosewoodNoVest", "PoliceRosewoodNoVest"}
			ClothingOverrides.zonesToOutfit.Rosewood.PoliceRiot = "PoliceRosewoodRiotNoVest"
		end
		if SandboxVars.STR.VestRavenCreek then
			ClothingOverrides.zonesToOutfit.RavenCreek.Police = {"PoliceRavenCreek_Bag", "PoliceRavenCreek", "PoliceRavenCreek", "PoliceRavenCreek", "PoliceRavenCreek"}
			ClothingOverrides.zonesToOutfit.RavenCreek.PoliceRiot = "PoliceRavenCreekRiot"
		elseif not SandboxVars.STR.VestRavenCreek then
			ClothingOverrides.zonesToOutfit.RavenCreek.Police = {"PoliceRavenCreekNoVest_Bag", "PoliceRavenCreekNoVest", "PoliceRavenCreekNoVest", "PoliceRavenCreekNoVest", "PoliceRavenCreekNoVest"}
			ClothingOverrides.zonesToOutfit.RavenCreek.PoliceRiot = "PoliceRavenCreekRiotNoVest"
		end
		if SandboxVars.STR.VestRiverside then
			ClothingOverrides.zonesToOutfit.Riverside.Police = {"PoliceRiverside_Bag", "PoliceRiverside", "PoliceRiverside", "PoliceRiverside", "PoliceRiverside"}
			ClothingOverrides.zonesToOutfit.Riverside.PoliceRiot = "PoliceRiversideRiot"
		elseif not SandboxVars.STR.VestRiverside then
			ClothingOverrides.zonesToOutfit.Riverside.Police = {"PoliceRiversideNoVest_Bag", "PoliceRiversideNoVest", "PoliceRiversideNoVest", "PoliceRiversideNoVest", "PoliceRiversideNoVest"}
			ClothingOverrides.zonesToOutfit.Riverside.PoliceRiot = "PoliceRiversideRiotNoVest"
		end
		if SandboxVars.STR.VestMuldraugh then
			ClothingOverrides.zonesToOutfit.Muldraugh.Police = {"PoliceMuldraugh_Bag", "PoliceMuldraugh", "PoliceMuldraugh", "PoliceMuldraugh", "PoliceMuldraugh"}
			ClothingOverrides.zonesToOutfit.Muldraugh.PoliceRiot = "PoliceMuldraughRiot"
		elseif not SandboxVars.STR.VestMuldraugh then
			ClothingOverrides.zonesToOutfit.Muldraugh.Police = {"PoliceMuldraughNoVest_Bag", "PoliceMuldraughNoVest", "PoliceMuldraughNoVest", "PoliceMuldraughNoVest", "PoliceMuldraughNoVest"}
			ClothingOverrides.zonesToOutfit.Muldraugh.PoliceRiot = "PoliceMuldraughRiotNoVest"
		end
		if SandboxVars.STR.VestWestPoint then
			ClothingOverrides.zonesToOutfit.WestPoint.Police = {"PoliceWestPoint_Bag", "PoliceWestPoint", "PoliceWestPoint", "PoliceWestPoint", "PoliceWestPoint"}
			ClothingOverrides.zonesToOutfit.WestPoint.PoliceRiot = "PoliceWestPointRiot"
		elseif not SandboxVars.STR.VestWestPoint then
			ClothingOverrides.zonesToOutfit.WestPoint.Police = {"PoliceWestPointNoVest_Bag", "PoliceWestPointNoVest", "PoliceWestPointNoVest", "PoliceWestPointNoVest", "PoliceWestPointNoVest"}
			ClothingOverrides.zonesToOutfit.WestPoint.PoliceRiot = "PoliceWestPointRiotNoVest"
		end
		if SandboxVars.STR.VestJeffersonSD then
			ClothingOverrides.zonesToOutfit.JeffersonSD.Police = {"PoliceJeffersonSD_Bag", "PoliceJeffersonSD", "PoliceJeffersonSD", "PoliceJeffersonSD", "PoliceJeffersonSD"}
			ClothingOverrides.zonesToOutfit.JeffersonSD.PoliceRiot = {"PoliceJeffersonSDRiot"}
		elseif not SandboxVars.STR.VestJeffersonSD then
			ClothingOverrides.zonesToOutfit.JeffersonSD.Police = {"PoliceJeffersonSDNoVest_Bag", "PoliceJeffersonSDNoVest", "PoliceJeffersonSDNoVest", "PoliceJeffersonSDNoVest", "PoliceJeffersonSDNoVest"}
			ClothingOverrides.zonesToOutfit.JeffersonSD.PoliceRiot = {"PoliceJeffersonSDRiotNoVest"}
		end
		if SandboxVars.STR.VestJeffersonPD then
			ClothingOverrides.zonesToOutfit.JeffersonPD.Police = {"PoliceJeffersonPD_Bag", "PoliceJeffersonPD", "PoliceJeffersonPD", "PoliceJeffersonPD", "PoliceJeffersonPD"}
			ClothingOverrides.zonesToOutfit.JeffersonPD.PoliceRiot = {"PoliceJeffersonPDRiot"}
		elseif not SandboxVars.STR.VestJeffersonPD then
			ClothingOverrides.zonesToOutfit.JeffersonPD.Police = {"PoliceJeffersonPDNoVest_Bag", "PoliceJeffersonPDNoVest", "PoliceJeffersonPDNoVest", "PoliceJeffersonPDNoVest", "PoliceJeffersonPDNoVest"}
			ClothingOverrides.zonesToOutfit.JeffersonPD.PoliceRiot = {"PoliceJeffersonPDRiotNoVest"}
		end
		if SandboxVars.STR.VestLouisville then
			ClothingOverrides.zonesToOutfit.LouisvillePD.Police = {"PoliceLouisville_Bag", "PoliceLouisville", "PoliceLouisville", "PoliceLouisville", "PoliceLouisville"}
			ClothingOverrides.zonesToOutfit.LouisvillePD.PoliceRiot = {"PoliceLouisvilleRiot"}
		elseif not SandboxVars.STR.VestLouisville then
			ClothingOverrides.zonesToOutfit.LouisvillePD.Police = {"PoliceLouisvilleNoVest_Bag", "PoliceLouisvilleNoVest", "PoliceLouisvilleNoVest", "PoliceLouisvilleNoVest", "PoliceLouisvilleNoVest"}
			ClothingOverrides.zonesToOutfit.LouisvillePD.PoliceRiot = {"PoliceLouisvilleRiotNoVest"}
		end
		if SandboxVars.STR.VestMeade then
			ClothingOverrides.zonesToOutfit.Meade.Police = {"PoliceMeade_Bag", "PoliceMeade", "PoliceMeade", "PoliceMeade", "PoliceMeade"}
			ClothingOverrides.zonesToOutfit.Meade.PoliceRiot = {"PoliceMeadeRiot"}
		elseif not SandboxVars.STR.VestMeade then
			ClothingOverrides.zonesToOutfit.Meade.Police = {"PoliceMeadeNoVest_Bag", "PoliceMeadeNoVest", "PoliceMeadeNoVest", "PoliceMeadeNoVest", "PoliceMeadeNoVest"}
			ClothingOverrides.zonesToOutfit.Meade.PoliceRiot = {"PoliceMeadeRiotNoVest"}
		end
	elseif not SandboxVars.STR.DuffelLoot then
		ClothingOverrides.zonesToOutfit.Meade.Ranger = {"FederalRanger", "State_LawRanger", "StateRanger"}
		ClothingOverrides.zonesToOutfit.Meade.Postal = "USPS_Mail"
		ClothingOverrides.zonesToOutfit.KSP.Police = "KSP_Trooper"
		if SandboxVars.STR.VestRosewood then
			ClothingOverrides.zonesToOutfit.Rosewood.Police = "PoliceRosewood"
			ClothingOverrides.zonesToOutfit.Rosewood.PoliceRiot = "PoliceRosewoodRiot"
		elseif not SandboxVars.STR.VestRosewood then
			ClothingOverrides.zonesToOutfit.Rosewood.Police = "PoliceRosewoodNoVest"
			ClothingOverrides.zonesToOutfit.Rosewood.PoliceRiot = "PoliceRosewoodRiotNoVest"
		end
		if SandboxVars.STR.VestRavenCreek then
			ClothingOverrides.zonesToOutfit.RavenCreek.Police = "PoliceRavenCreek"
			ClothingOverrides.zonesToOutfit.RavenCreek.PoliceRiot = "PoliceRavenCreekRiot"
		elseif not SandboxVars.STR.VestRavenCreek then
			ClothingOverrides.zonesToOutfit.RavenCreek.Police = "PoliceRavenCreekNoVest"
			ClothingOverrides.zonesToOutfit.RavenCreek.PoliceRiot = "PoliceRavenCreekRiotNoVest"
		end
		if SandboxVars.STR.VestRiverside then
			ClothingOverrides.zonesToOutfit.Riverside.Police = "PoliceRiverside"
			ClothingOverrides.zonesToOutfit.Riverside.PoliceRiot = "PoliceRiversideRiot"
		elseif not SandboxVars.STR.VestRiverside then
			ClothingOverrides.zonesToOutfit.Riverside.Police = "PoliceRiversideNoVest"
			ClothingOverrides.zonesToOutfit.Riverside.PoliceRiot = "PoliceRiversideRiotNoVest"
		end
		if SandboxVars.STR.VestMuldraugh then
			ClothingOverrides.zonesToOutfit.Muldraugh.Police = "PoliceMuldraugh"
			ClothingOverrides.zonesToOutfit.Muldraugh.PoliceRiot = "PoliceMuldraughRiot"
		elseif not SandboxVars.STR.VestMuldraugh then
			ClothingOverrides.zonesToOutfit.Muldraugh.Police = "PoliceMuldraughNoVest"
			ClothingOverrides.zonesToOutfit.Muldraugh.PoliceRiot = "PoliceMuldraughRiotNoVest"
		end
		if SandboxVars.STR.VestWestPoint then
			ClothingOverrides.zonesToOutfit.WestPoint.Police = "PoliceWestPoint"
			ClothingOverrides.zonesToOutfit.WestPoint.PoliceRiot = "PoliceWestPointRiot"
		elseif not SandboxVars.STR.VestWestPoint then
			ClothingOverrides.zonesToOutfit.WestPoint.Police = "PoliceWestPointNoVest"
			ClothingOverrides.zonesToOutfit.WestPoint.PoliceRiot = "PoliceWestPointRiotNoVest"
		end
		if SandboxVars.STR.VestJeffersonSD then
			ClothingOverrides.zonesToOutfit.JeffersonSD.Police = "PoliceJeffersonSD"
			ClothingOverrides.zonesToOutfit.JeffersonSD.PoliceRiot = "PoliceJeffersonSDRiot"
		elseif not SandboxVars.STR.VestJeffersonSD then
			ClothingOverrides.zonesToOutfit.JeffersonSD.Police = "PoliceJeffersonSDNoVest"
			ClothingOverrides.zonesToOutfit.JeffersonSD.PoliceRiot = "PoliceJeffersonSDRiotNoVest"
		end
		if SandboxVars.STR.VestJeffersonPD then
			ClothingOverrides.zonesToOutfit.JeffersonPD.Police = "PoliceJeffersonPD"
			ClothingOverrides.zonesToOutfit.JeffersonPD.PoliceRiot = "PoliceJeffersonPDRiot"
		elseif not SandboxVars.STR.VestJeffersonPD then
			ClothingOverrides.zonesToOutfit.JeffersonPD.Police = "PoliceJeffersonPDNoVest"
			ClothingOverrides.zonesToOutfit.JeffersonPD.PoliceRiot = "PoliceJeffersonPDRiotNoVest"
		end
		if SandboxVars.STR.VestLouisville then
			ClothingOverrides.zonesToOutfit.LouisvillePD.Police = "PoliceLouisville"
			ClothingOverrides.zonesToOutfit.LouisvillePD.PoliceRiot = "PoliceLouisvilleRiot"
		elseif not SandboxVars.STR.VestLouisville then
			ClothingOverrides.zonesToOutfit.LouisvillePD.Police = "PoliceLouisvilleNoVest"
			ClothingOverrides.zonesToOutfit.LouisvillePD.PoliceRiot = "PoliceLouisvilleRiotNoVest"
		end
		if SandboxVars.STR.VestMeade then
			ClothingOverrides.zonesToOutfit.Meade.Police = "PoliceMeade"
			ClothingOverrides.zonesToOutfit.Meade.PoliceRiot = "PoliceMeadeRiot"
		elseif not SandboxVars.STR.VestMeade then
			ClothingOverrides.zonesToOutfit.Meade.Police = "PoliceMeadeNoVest"
			ClothingOverrides.zonesToOutfit.Meade.PoliceRiot = "PoliceMeadeRiotNoVest"
		end
	end
	if not SandboxVars.STR.WantSusceptibleOutfits then
		ClothingOverrides.outfitsToSwap.SusceptiblePoliceGasmask = "Police"
		ClothingOverrides.outfitsToSwap.SusceptibleFirefighter = "Fireman"
	end
end)

return ClothingOverrides