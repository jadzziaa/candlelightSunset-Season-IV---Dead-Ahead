require 'NATT_SupportedMods'

NATTModsBackpacks = {
    [NATTmods.Pitstop] = {
        KleanBackPack = "Alicepack",
        FluxBackPack = "Alicepack",
        AlienBackPack = "Schoolbag",
    },
    [NATTmods.PitstopLegacy] = {
        KleanBackPack = "Alicepack",
    },
    [NATTmods.ClothesBoxRedux] = {
        CBX_HR = "HR",
        CBX_RUKSAK1 = "RUKSAK1",
        CBX_RUKSAK2 = "RUKSAK2",
        CBX_ANAT = "ANAT",
    },
    [NATTmods.ClothesBox] = {
        HR = "HR",
        RUKSAK1 = "RUKSAK1",
        RUKSAK2 = "RUKSAK2",
        ANAT = "ANAT",
    },
    [NATTmods.UndeadSuvivor] = {
        ["UndeadSurvivor.NomadBackpack"] = "NomadBackpack",
        ["UndeadSurvivor.PrepperVestPacked"] = "PrepperVestPacked",
    },
    [NATTmods.SLEO] = {
        ["SLEOClothing.Bag_PoliceUtilityBag"] = "PoliceUtilityBag",
        ["SLEOClothing.Bag_PoliceUtilityBagGreen"] = "PoliceUtilityBag",
        ["SLEOClothing.Bag_Bag_DuffelPolice"] = "Duffelbag",
    },
    [NATTmods.SMUI] = {
        ["SMUIClothing.Bag_CFP90PatrolPack"] = "CFP90PatrolPack",
        ["SMUIClothing.Bag_MilitaryMedicalBag"] = "MilitaryMedicalBag",
    },
    [NATTmods.MoreTraits] = {
        ["MoreTraits.PackerBag"] = "BigHikingbag",
        ["MoreTraits.Bag_SmallHikingBag"] = "Hikingbag",
    },
    [NATTmods.SWATPack] = {
        Bag_BigSwatBag = "BigHikingbag",
        Bag_PoliceBag = "Alicepack",
    },
    [NATTmods.DeluxeHikingBag] = {
        DeluxeHikingBag = "BigHikingbag",
    },
    [NATTmods.SnakeAlice] = {
        ["AliceBP.AlicePack"] = "Alicepack",
        ["AliceBP.UpgradedAlicePack1"] = "Alicepack",
        ["AliceBP.UpgradedAlicePack2"] = "Alicepack",
        ["AliceBP.UpgradedAlicePack2b"] = "Alicepack",
        ["AliceBP.UpgradedAlicePack3"] = "Alicepack",
        ["AliceBP.UpgradedAlicePack3b"] = "Alicepack",
    },
    [NATTmods.SnakeClothing] = {
        AlicePackDito = "Alicepack",
        AlicePackSnake = "Alicepack",
        AlicePackUnicorn = "Alicepack",
    },
    [NATTmods.TacticalBags] = {
        ["tctlBags.SmallTctlBag"] = "Alicepack",
        ["tctlBags.TctlBag"] = "Alicepack",
        ["tctlBags.LargeTctlBag"] = "Alicepack",
    },
    [NATTmods.McPhisto2051] = {
        ["McPhisto2051's_Backpacks.Bag_MilitaryBagUp01"] = "Alicepack",
        ["McPhisto2051's_Backpacks.Bag_MilitaryBagUp02"] = "Alicepack",
        ["McPhisto2051's_Backpacks.Bag_MilitaryBagUp03"] = "Alicepack",
        ["McPhisto2051's_Backpacks.Bag_MilitaryBagUp04"] = "Alicepack",
        ["McPhisto2051's_Backpacks.Bag_MilitaryBagUp05"] = "Alicepack",
    },
    [NATTmods.AuthenticZLite] = {
        ["AuthenticZLite.Bag_ALICEpack_UrbanCamo"] = "AlicepackAZ",
        ["AuthenticZLite.Bag_SchoolBagCEDA"] = "Schoolbag",
        ["AuthenticZLite.Bag_SchoolBagCEDABlack"] = "Schoolbag",
        ["AuthenticZLite.Bag_SchoolBagCEDABlue"] = "Schoolbag",
        ["AuthenticZLite.Bag_SchoolBagCEDARed"] = "Schoolbag",
        ["AuthenticZLite.Bag_SchoolBagNBH"] = "Schoolbag",
        ["AuthenticZLite.Bag_B4BEvangelo"] = "Evangelo",
        ["AuthenticZLite.Bag_B4BHoffman"] = "Hoffman",
        ["AuthenticZLite.Bag_B4BHolly"] = "Holly",
        ["AuthenticZLite.Bag_B4BMom"] = "Mom",
        ["AuthenticZLite.Bag_B4BWalker"] = "Hoffman",
    },
    [NATTmods.BritaArmor] = {
        Bag_Sniper_Pack = "BagSniperPack",
        Bag_ARVN_Rucksack = "ARVNRucksack",
        Bag_ST53_Set = "BagST53Set",
        Bag_SCBA = "BagSCBA",
        Bag_ZIP = "BagZIP",
        Bag_SSO = "BagSSO",
        Bag_Savotta = "BagSavotta",
        Bag_Bush = "BagBush",
        Bag_Hunting = "BagHunting",
        Bag_Radio_Pack = "BagRadioPack",
        Bag_Tactical_Alice = "BagTacticalAlice",
        Bag_Robbie_Pack = "BagCatPack",
        Bag_Cat_Pack = "BagCatPack",
        Bag_M2A1_Pack = "BagM2A1Pack",
    },
    [NATTmods.SurvivalTailor] = {
        ["stSurvTlr.Bag_DenimBackpack2"] = "Hikingbag",
        ["stSurvTlr.Bag_DenimBackpack1"] = "Hikingbag",
        ["stSurvTlr.Bag_DenimBackpack"] = "Schoolbag",
        ["stSurvTlr.Bag_CrudeBackpack"] = "Schoolbag",
    },
    [NATTmods.SurvivalTailorRB] = {
        ["stSurvTlrRB.Bag_DenimBackpack2"] = "Hikingbag",
        ["stSurvTlrRB.Bag_DenimBackpack1"] = "Hikingbag",
        ["stSurvTlrRB.Bag_DenimBackpack"] = "Schoolbag",
        ["stSurvTlrRB.Bag_CrudeBackpack"] = "Schoolbag",
    },
    [NATTmods.UltimateBag] = {
        InfiniteBag = "Alicepack",
    },
}

NATTBackpacks = {
    Bag_Schoolbag = "Schoolbag",
    Bag_ALICEpack = "Alicepack",
    Bag_ALICEpack_Army = "Alicepack",
    Bag_ALICEpack_Pink = "Alicepack",
    Bag_SurvivorBag = "Alicepack",
    Bag_BigHikingBag = "BigHikingbag",
    Bag_NormalHikingBag = "Hikingbag",
    Bag_WeaponBag = "Duffelbag",
    Bag_InmateEscapedBag = "Duffelbag",
    Bag_MoneyBag = "Duffelbag",
    Bag_WorkerBag = "Duffelbag",
    Bag_DuffelBag = "Duffelbag",
    Bag_DuffelBagTINT = "Duffelbag",

    Bag_ShotgunBag = "Duffelbag",
    Bag_ShotgunSawnoffBag = "Duffelbag",
    Bag_ShotgunDblBag = "Duffelbag",
    Bag_ShotgunDblSawnoffBag = "Duffelbag",
}

NATTBackpacksBlacklistSlots = {
	Weapon = {
		Schoolbag = true,
		BagBush = true,
        BagCatPack = true,
        BagRadioPack = true,
		PrepperVestPacked = true,
		PoliceUtilityBag = true,
        CFP90PatrolPack = true,
        MilitaryMedicalBag = true,
        Duffelbag = true,
        Hoffman = true,
        Mom = true,
	},
	Right = {
		BagBush = true,
		PrepperVestPacked = true,
		PoliceUtilityBag = true,
	},
    Left = {
        BagBush = true,
    },
	Bedroll = {
		BagBush = true,
		PrepperVestPacked = true,
		PoliceUtilityBag = true,
        Duffelbag = true,
	},
    UtilityRight = {
		BagBush = true,
        BagCatPack = true,
        BagRadioPack = true,
        BagSSO = true,
		PrepperVestPacked = true,
		PoliceUtilityBag = true,
	},
	UtilityLeft = {
		BagBush = true,
		PrepperVestPacked = true,
		PoliceUtilityBag = true,
	},
	Flashlight = {
		PrepperVestPacked = true,
	},
    Container = {
        Schoolbag = true,
        BagBush = true,
        BagRadioPack = true,
        PrepperVestPacked = true,
        PoliceUtilityBag = true,
        Hoffman = true,
        Mom = true,
	},
    SmallContainerLeft = {
		Schoolbag = true,
        BigHikingbag = true,
        Hikingbag = true,
        HR = true,
        BagBush = true,
        BagCatPack = true,
        BagRadioPack = true,
        BagSavotta = true,
        BagST53Set = true,
        BagSCBA = true,
        BagSSO = true,
        BagZIP = true,
        PrepperVestPacked = true,
        PoliceUtilityBag = true,
        CFP90PatrolPack = true,
        MilitaryMedicalBag = true,
        Duffelbag = true,
        Evangelo = true,
        Hoffman = true,
        Holly = true,
        Mom = true,
	},
    SmallContainerRight = {
		Schoolbag = true,
        BigHikingbag = true,
        Hikingbag = true,
        HR = true,
        BagBush = true,
        BagCatPack = true,
        BagRadioPack = true,
        BagSavotta = true,
        BagST53Set = true,
        BagSCBA = true,
        BagSSO = true,
        BagZIP = true,
        PrepperVestPacked = true,
        PoliceUtilityBag = true,
        CFP90PatrolPack = true,
        MilitaryMedicalBag = true,
        Duffelbag = true,
        Evangelo = true,
        Hoffman = true,
        Holly = true,
        Mom = true,
	},
}

activatedModsCache = nil
function isModActivated(modName)
	if not activatedModsCache then
		activatedModsCache = getActivatedMods()
	end
	return activatedModsCache:contains(modName)
end

local function loadBackpacks(bps)
	for backpack,attachmentPrefix in pairs(bps) do
		NATTBackpacks[backpack]= attachmentPrefix
	end
end

local function checkBackpacks()
	for k,_ in pairs(NATTModsBackpacks) do
		if isModActivated(k) then
			loadBackpacks(NATTModsBackpacks[k])
		end
	end
end

checkBackpacks()