MagnetFishing = MagnetFishing or {}

local dataDictionary = {} -- Used for setting up.

-- Final results.
MagnetFishing.Tier1Items = {}
MagnetFishing.Tier2Items = {}
MagnetFishing.Tier3Items = {}

MagnetFishing.tiersToValues = {
    1,
    {2, 1},
    {3, 2, 1}
}

MagnetFishing.Tier1Magnets = {
    "Base.SmallFishingMagnet"
}

MagnetFishing.Tier2Magnets = {
    "Base.MediumFishingMagnet"
}

MagnetFishing.Tier3Magnets = {
    "Base.LargeFishingMagnet"
}

-- Data is formatted as such. Tier:Rarity:MinAmount:MaxAmount:MinCondition:MaxCondition

-- TIER 1 ITEMS
dataDictionary["Base.223Bullets"] = {1, 10, 1, 3}
dataDictionary["Base.308Bullets"] = {1, 10, 1, 3}
dataDictionary["Base.556Bullets"] = {1, 10, 1, 3}
dataDictionary["Base.Bullets38"] = {1, 10, 1, 3}
dataDictionary["Base.Bullets44"] = {1, 10, 1, 3}
dataDictionary["Base.Bullets45"] = {1, 10, 1, 3}
dataDictionary["Base.Bullets9mm"] = {1, 10, 1, 3}
dataDictionary["Base.ShotgunShells"] = {1, 10, 1, 3}
dataDictionary["Base.Battery"] = {1, 60, 1, 2, 0, 35}
dataDictionary["Base.CarvingFork"] = {1, 10, 1, 1}
dataDictionary["Base.WristWatch_Left_DigitalBlack"] = {1, 10, 1, 1}
dataDictionary["Base.WristWatch_Left_ClassicBlack"] = {1, 10, 1, 1}
dataDictionary["Base.WristWatch_Left_ClassicBrown"] = {1, 10, 1, 1}
dataDictionary["Base.WristWatch_Left_ClassicGold"] = {1, 10, 1, 1}
dataDictionary["Base.WristWatch_Left_DigitalDress"] = {1, 10, 1, 1}
dataDictionary["Base.WristWatch_Left_DigitalRed"] = {1, 10, 1, 1}
dataDictionary["Base.WristWatch_Left_ClassicMilitary"] = {1, 10, 1, 1}
dataDictionary["Radio.ElectricWire"] = {1, 5, 1, 1}
dataDictionary["Base.TinCanEmpty"] = {1, 40, 1, 1}
dataDictionary["Base.Fork"] = {1, 10, 1, 1, 1, 10}
dataDictionary["Base.GrillBrush"] = {1, 10, 1, 1}
dataDictionary["Base.HuntingKnife"] = {1, 20, 1, 1}
dataDictionary["Base.IcePick"] = {1, 10, 1, 1}
dataDictionary["Base.KitchenKnife"] = {1, 20, 1, 1}
dataDictionary["Base.BreadKnife"] = {1, 20, 1, 1}
dataDictionary["Base.ButterKnife"] = {1, 20, 1, 1}
dataDictionary["Base.MeatCleaver"] = {1, 20, 1, 1}
dataDictionary["Base.Needle"] = {1, 30, 1, 7}
dataDictionary["Base.Paperclip"] = {1, 80, 1, 7}
dataDictionary["Base.Razor"] = {1, 40, 1, 1}
dataDictionary["Base.Scissors"] = {1, 20, 1, 1}
dataDictionary["Base.ScrapMetal"] = {1, 30, 1, 1}
dataDictionary["Base.Screws"] = {1, 80, 1, 7}
dataDictionary["Base.Nails"] = {1, 80, 1, 7}
dataDictionary["Base.Staples"] = {1, 20, 1, 2}
dataDictionary["Base.Tweezers"] = {1, 40, 1, 1}
dataDictionary["Base.SutureNeedleHolder"] = {1, 10, 1, 2}
dataDictionary["Base.SmallFishingMagnet"] = {1, 20, 1, 1}
dataDictionary["Base.BellyButton_RingGold"] = {1, 10, 1, 1}
dataDictionary["Base.BellyButton_RingGoldDiamond"] = {1, 10, 1, 1}
dataDictionary["Base.BellyButton_RingGoldRuby"] = {1, 10, 1, 1}
dataDictionary["Base.BellyButton_RingSilver"] = {1, 10, 1, 1}
dataDictionary["Base.BellyButton_RingSilverAmethyst"] = {1, 10, 1, 1}
dataDictionary["Base.BellyButton_RingSilverDiamond"] = {1, 10, 1, 1}
dataDictionary["Base.BellyButton_RingSilverRuby"] = {1, 10, 1, 1}
dataDictionary["Base.Earring_Dangly_Diamond"] = {1, 10, 1, 1}
dataDictionary["Base.Earring_Dangly_Emerald"] = {1, 10, 1, 1}
dataDictionary["Base.Earring_Dangly_Pearl"] = {1, 10, 1, 1}
dataDictionary["Base.Earring_Dangly_Ruby"] = {1, 10, 1, 1}
dataDictionary["Base.Earring_Dangly_Sapphire"] = {1, 10, 1, 1}
dataDictionary["Base.Ring_Left_RingFinger_GoldDiamond"] = {1, 10, 1, 1}
dataDictionary["Base.Ring_Left_RingFinger_SilverDiamond"] = {1, 10, 1, 1}
dataDictionary["Base.Earring_Stone_Emerald"] = {1, 10, 1, 1}
dataDictionary["Base.NoseRing_Gold"] = {1, 10, 1, 1}
dataDictionary["Base.Ring_Left_RingFinger_Gold"] = {1, 10, 1, 1}
dataDictionary["Base.Earring_Stud_Gold"] = {1, 10, 1, 1}
dataDictionary["Base.Earring_LoopLrg_Gold"] = {1, 10, 1, 1}
dataDictionary["Base.Earring_LoopLrg_Silver"] = {1, 10, 1, 1}
dataDictionary["Base.Earring_LoopMed_Gold"] = {1, 10, 1, 1}
dataDictionary["Base.Earring_LoopMed_Silver"] = {1, 10, 1, 1}
dataDictionary["Base.Earring_Pearl"] = {1, 10, 1, 1}
dataDictionary["Base.Ring_Left_RingFinger_GoldRuby"] = {1, 10, 1, 1}
dataDictionary["Base.Earring_Stone_Sapphire"] = {1, 10, 1, 1}
dataDictionary["Base.NoseRing_Silver"] = {1, 10, 1, 1}
dataDictionary["Base.Ring_Left_RingFinger_Silver"] = {1, 10, 1, 1}
dataDictionary["Base.Earring_Stud_Silver"] = {1, 10, 1, 1}
dataDictionary["Base.Earring_LoopSmall_Gold_Both"] = {1, 10, 1, 1}
dataDictionary["Base.Earring_LoopSmall_Silver_Both"] = {1, 10, 1, 1}
dataDictionary["Base.KeyRing"] = {1, 15, 1, 1}
dataDictionary["Base.LightBulbBlue"] = {1, 10, 1, 1}
dataDictionary["Base.LightBulbCyan"] = {1, 10, 1, 1}
dataDictionary["Base.LightBulbGreen"] = {1, 10, 1, 1}
dataDictionary["Base.LightBulb"] = {1, 20, 1, 1}
dataDictionary["Base.LightBulbMagenta"] = {1, 10, 1, 1}
dataDictionary["Base.LightBulbOrange"] = {1, 10, 1, 1}
dataDictionary["Base.LightBulbPink"] = {1, 10, 1, 1}
dataDictionary["Base.LightBulbPurple"] = {1, 10, 1, 1}
dataDictionary["Base.LightBulbRed"] = {1, 10, 1, 1}
dataDictionary["Base.LightBulbYellow"] = {1, 10, 1, 1}


-- TIER 2 ITEMS
dataDictionary["Base.MuffinTray"] = {2, 20, 1, 1}
dataDictionary["Base.HandFork"] = {2, 20, 1, 1}
dataDictionary["Base.AlarmClock2"] = {2, 15, 1, 1}
dataDictionary["Base.BallPeenHammer"] = {2, 10, 1, 1}
dataDictionary["Base.BakingPan"] = {2, 20, 1, 1}
dataDictionary["Base.BakingTray"] = {2, 20, 1, 1}
dataDictionary["Base.Belt"] = {2, 20, 1, 1}
dataDictionary["Base.CannedCarrots2"] = {2, 5, 1, 1}
dataDictionary["Base.CannedChili"] = {2, 5, 1, 1}
dataDictionary["Base.CannedCorn"] = {2, 5, 1, 1}
dataDictionary["Base.CannedCornedBeef"] = {2, 5, 1, 1}
dataDictionary["Base.CannedMilk"] = {2, 5, 1, 1}
dataDictionary["Base.CannedFruitBeverage"] = {2, 5, 1, 1}
dataDictionary["Base.CannedFruitCocktail"] = {2, 5, 1, 1}
dataDictionary["Base.CannedMushroomSoup"] = {2, 5, 1, 1}
dataDictionary["Base.CannedPeaches"] = {2, 5, 1, 1}
dataDictionary["Base.CannedPeas"] = {2, 5, 1, 1}
dataDictionary["Base.CannedPineapple"] = {2, 5, 1, 1}
dataDictionary["Base.CannedPotato2"] = {2, 5, 1, 1}
dataDictionary["Base.CannedSardines"] = {2, 5, 1, 1}
dataDictionary["Base.CannedBolognese"] = {2, 5, 1, 1}
dataDictionary["Base.CannedTomato2"] = {2, 5, 1, 1}
dataDictionary["Base.Dogfood"] = {2, 5, 1, 1}
dataDictionary["Base.WaterPot"] = {2, 25, 1, 1}
dataDictionary["Base.FullKettle"] = {2, 25, 1, 1}
dataDictionary["Base.FishingTackle"] = {2, 15, 1, 1}
dataDictionary["Base.FishingTackle2"] = {2, 15, 1, 1}
dataDictionary["Base.Pan"] = {2, 20, 1, 1}
dataDictionary["Base.Golfclub"] = {2, 10, 1, 1}
dataDictionary["Base.GridlePan"] = {2, 20, 1, 1} --Yes it's typo'd in the game files. Don't fix this even if you want to.
dataDictionary["Base.Hammer"] = {2, 10, 1, 1}
dataDictionary["Base.HandScythe"] = {2, 10, 1, 1}
dataDictionary["Base.HandTorch"] = {2, 10, 1, 1, 0, 35}
dataDictionary["Base.LugWrench"] = {2, 5, 1, 1}
dataDictionary["Base.MetalBar"] = {2, 10, 1, 1}
dataDictionary["Base.MetalPipe"] = {2, 10, 1, 1}
dataDictionary["Base.GardenHoe"] = {2, 10, 1, 1}
dataDictionary["Base.Nightstick"] = {2, 5, 1, 1}
dataDictionary["Base.Padlock"] = {2, 40, 1, 1}
dataDictionary["Base.PipeWrench"] = {2, 10, 1, 1}
dataDictionary["Base.RoastingPan"] = {2, 20, 1, 1}
dataDictionary["Base.WaterSaucepan"] = {2, 25, 1, 1}
dataDictionary["Base.Screwdriver"] = {2, 20, 1, 1}
dataDictionary["Base.Stapler"] = {2, 10, 1, 1}
dataDictionary["Base.Wrench"] = {2, 10, 1, 1}
dataDictionary["Base.Wire"] = {2, 15, 1, 1}
dataDictionary["Base.SmallSheetMetal"] = {2, 10, 1, 1}
dataDictionary["Base.UnusableMetal"] = {2, 35, 1, 1}
dataDictionary["farming.HandShovel"] = {2, 25, 1, 1}
dataDictionary["camping.TentPeg"] = {2, 10, 1, 1}
dataDictionary["Base.MediumFishingMagnet"] = {2, 10, 1, 1}
dataDictionary["Base.Pistol3"] = {2, 5, 1, 1, 0, 10}
dataDictionary["Base.Pistol2"] = {2, 5, 1, 1, 0, 10}
dataDictionary["Base.Pistol"] = {2, 5, 1, 1, 0, 10}
dataDictionary["Base.Revolver_Short"] = {2, 5, 1, 1, 0, 10}
dataDictionary["Base.Revolver"] = {2, 5, 1, 1, 0, 10}
dataDictionary["Base.Revolver_Long"] = {2, 5, 1, 1, 0, 10}
dataDictionary["Base.44Clip"] = {2, 10, 1, 1}
dataDictionary["Base.M14Clip"] = {2, 10, 1, 1}
dataDictionary["Base.556Clip"] = {2, 10, 1, 1}
dataDictionary["Base.45Clip"] = {2, 10, 1, 1}
dataDictionary["Base.9mmClip"] = {2, 10, 1, 1}
dataDictionary["Base.223Clip"] = {2, 10, 1, 1}
dataDictionary["Base.308Clip"] = {2, 10, 1, 1}
dataDictionary["Base.Toolbox"] = {2, 20, 1, 1}
dataDictionary["Base.TinOpener"] = {2, 30, 1, 1}
dataDictionary["Base.IronSight"] = {2, 3, 1, 1}
dataDictionary["Base.RedDot"] = {2, 3, 1, 1}
dataDictionary["Base.Laser"] = {2, 3, 1, 1}
dataDictionary["Base.Sling"] = {2, 3, 1, 1}
dataDictionary["Base.x2Scope"] = {2, 3, 1, 1}
dataDictionary["Base.x4Scope"] = {2, 3, 1, 1}
dataDictionary["Base.x8Scope"] = {2, 3, 1, 1}
dataDictionary["Base.RecoilPad"] = {2, 3, 1, 1}
dataDictionary["Base.ChokeTubeFull"] = {2, 3, 1, 1}
dataDictionary["Base.ChokeTubeImproved"] = {2, 3, 1, 1}
dataDictionary["Base.FiberglassStock"] = {2, 3, 1, 1}
dataDictionary["Base.AmmoStrap_Shells"] = {2, 3, 1, 1}
dataDictionary["Base.AmmoStrap_Bullets"] = {2, 3, 1, 1}
dataDictionary["Base.AmmoStraps"] = {2, 3, 1, 1}
dataDictionary["Base.GunLight"] = {2, 3, 1, 1}
dataDictionary["Base.RadioRed"] = {2, 10, 1, 1}
dataDictionary["Base.RadioBlack"] = {2, 10, 1, 1}
dataDictionary["Base.WalkieTalkie1"] = {2, 10, 1, 1}
dataDictionary["Base.WalkieTalkie2"] = {2, 10, 1, 1}
dataDictionary["Base.WalkieTalkie3"] = {2, 10, 1, 1}
dataDictionary["Base.WalkieTalkie4"] = {2, 10, 1, 1}
dataDictionary["Base.WalkieTalkie5"] = {2, 10, 1, 1}

-- TIER 3 ITEMS
dataDictionary["Base.Axe"] = {3, 5, 1, 1}
dataDictionary["Base.BarbedWire"] = {3, 15, 1, 4}
dataDictionary["Base.BarBell"] = {3, 20, 1, 2}
dataDictionary["Base.Katana"] = {3, 5, 1, 1}
dataDictionary["Base.Crowbar"] = {3, 15, 1, 1}
dataDictionary["Base.DumbBell"] = {3, 20, 1, 1}
dataDictionary["Base.HandAxe"] = {3, 15, 1, 1}
dataDictionary["Base.Machete"] = {3, 5, 1, 1}
dataDictionary["Base.SheetMetal"] = {3, 10, 1, 1}
dataDictionary["Base.PickAxe"] = {3, 5, 1, 1}
dataDictionary["Base.PipeBomb"] = {3, 5, 1, 1}
dataDictionary["Base.PropaneTank"] = {3, 10, 1, 1}
dataDictionary["Base.Sledgehammer"] = {3, 5, 1, 1}
dataDictionary["Base.Sledgehammer2"] = {3, 5, 1, 1}
dataDictionary["Base.Shovel"] = {3, 20, 1, 1}
dataDictionary["Base.Shovel2"] = {3, 20, 1, 1}
dataDictionary["Base.WoodAxe"] = {3, 20, 1, 1}
dataDictionary["Base.BlowTorch"] = {3, 5, 1, 1}
dataDictionary["Base.WeldingMask"] = {3, 10, 1, 1}
dataDictionary["Base.WeldingRods"] = {3, 10, 1, 1}
dataDictionary["Base.TirePump"] = {3, 15, 1, 1}
dataDictionary["Base.LargeFishingMagnet"] = {3, 5, 1, 1}
dataDictionary["Base.AssaultRifle"] = {3, 5, 1, 1, 0, 10}
dataDictionary["Base.AssaultRifle2"] = {3, 5, 1, 1, 0, 10}
dataDictionary["Base.VarmintRifle"] = {3, 5, 1, 1, 0, 10}
dataDictionary["Base.HuntingRifle"] = {3, 5, 1, 1, 0, 10}
dataDictionary["Base.DoubleBarrelShotgun"] = {3, 5, 1, 1, 0, 10}
dataDictionary["Base.Shotgun"] = {3, 5, 1, 1, 0, 10}
dataDictionary["Base.DoubleBarrelShotgunSawnoff"] = {3, 5, 1, 1, 0, 10}
dataDictionary["Base.ShotgunSawnoff"] = {3, 5, 1, 1, 0, 10}
dataDictionary["Base.OldTire1"] = {3, 5, 1, 1, 0, 100}
dataDictionary["Base.OldTire2"] = {3, 5, 1, 1, 0, 100}
dataDictionary["Base.OldTire3"] = {3, 5, 1, 1, 0, 100}
dataDictionary["Base.OldTire1"] = {3, 3, 1, 1, 0, 100}
dataDictionary["Base.OldTire2"] = {3, 3, 1, 1, 0, 100}
dataDictionary["Base.OldTire3"] = {3, 3, 1, 1, 0, 100}
dataDictionary["Base.EngineParts"] = {3, 3, 1, 1}
dataDictionary["Base.HamRadio1"] = {3, 7, 1, 1}
dataDictionary["Base.HamRadio2"] = {3, 7, 1, 1}

-- MODDED ITEMS
local activatedMods = getActivatedMods()
if activatedMods:contains("TheWorkshop(new version)") then
    -- TIER 1 ITEMS
    dataDictionary["TW.MeatCleaverHead"] = {1, 25, 1, 1}
    dataDictionary["TW.SmallBlade"] = {1, 30, 1, 1}
    dataDictionary["TW.Spring"] = {1, 80, 1, 3}
    dataDictionary["TW.File"] = {1, 40, 1, 3}
    dataDictionary["TW.LargeBolt"] = {1, 80, 1, 2}
    dataDictionary["TW.Chain"] = {1, 40, 1, 1}

    -- TIER 2 ITEMS
    dataDictionary["TW.HammerHead"] = {2, 15, 1, 1}
    dataDictionary["TW.HoeHead"] = {2, 15, 1, 1}
    dataDictionary["TW.ScytheHead"] = {2, 15, 1, 1}
    dataDictionary["TW.ForkHead"] = {2, 25, 1, 1}
    dataDictionary["TW.HoeHead"] = {2, 15, 1, 1}
    dataDictionary["TW.GolfClubHead"] = {2, 15, 1, 1}
    dataDictionary["TW.SmallMetalBar"] = {2, 25, 1, 1}
    dataDictionary["TW.AirTank"] = {2, 15, 1, 1}
    dataDictionary["TW.MetalCutter"] = {2, 20, 1, 1}
    dataDictionary["TW.Pliers"] = {2, 20, 1, 1}

    -- TIER 3 ITEMS
    dataDictionary["TW.ShovelHead"] = {3, 25, 1, 1}
    dataDictionary["TW.SledgeHammerHead"] = {3, 10, 1, 1}
    dataDictionary["TW.AxeHead"] = {3, 10, 1, 1}
    dataDictionary["TW.PickaxeHead"] = {3, 10, 1, 1}
    dataDictionary["TW.LongBlade"] = {3, 10, 1, 1}
    dataDictionary["TW.Motor"] = {3, 10, 1, 1}
end

if activatedMods:contains("firearmmod") then
    -- TIER 1 ITEMS
    dataDictionary["Base.Bullets4440"] = {1, 10, 1, 3}
    dataDictionary["Base.Bullets357"] = {1, 10, 1, 3}
    dataDictionary["Base.762x51Bullets"] = {1, 10, 1, 3}
    dataDictionary["Base.762x39Bullets"] = {1, 10, 1, 3}
    dataDictionary["Base.Bullets22"] = {1, 10, 1, 3}
    dataDictionary["Base.Bullets3006"] = {1, 10, 1, 3}

    -- TIER 2 ITEMS
    dataDictionary["Base.ImprovisedSilencer"] = {2, 7, 1, 1}
    dataDictionary["Base.9mmCompensator"] = {2, 3, 1, 1}
    dataDictionary["Base.Rifle_Bipod"] = {2, 3, 1, 1}
    dataDictionary["Base.AmmoStock"] = {2, 3, 1, 1}
    dataDictionary["Base.TacticalStock"] = {2, 3, 1, 1}
    dataDictionary["Base.ShotgunStock"] = {2, 5, 1, 1}
    dataDictionary["Base.LightShotgunStock"] = {2, 3, 1, 1}
    dataDictionary["Base.MP5_Stock_Extended"] = {2, 3, 1, 1}
    dataDictionary["Base.MP5_Stock_Detracted"] = {2, 3, 1, 1}
    dataDictionary["Base.UZI_Stock_Extended"] = {2, 3, 1, 1}
    dataDictionary["Base.UZI_Stock_Detracted"] = {2, 3, 1, 1}
    dataDictionary["Base.Mac10_Stock_Extended"] = {2, 3, 1, 1}
    dataDictionary["Base.Mac10_Stock_Detracted"] = {2, 3, 1, 1}
    dataDictionary["Base.SPAS12_Stock_Extended"] = {2, 3, 1, 1}
    dataDictionary["Base.SPAS12_Stock_Detracted"] = {2, 3, 1, 1}
    dataDictionary["Base.Sling_Leather"] = {2, 3, 1, 1}
    dataDictionary["Base.Sling_Olive"] = {2, 3, 1, 1}
    dataDictionary["Base.Sling_Camo"] = {2, 3, 1, 1}
    dataDictionary["Base.x2LeupoldScope"] = {2, 3, 1, 1}
    dataDictionary["Base.x4-x12Scope"] = {2, 3, 1, 1}
    dataDictionary["Base.ImprovisedSilencer_Broken"] = {2, 15, 1, 1}
    dataDictionary["Base.M60Mag"] = {2, 10, 1, 1}
    dataDictionary["Base.Glock17"] = {2, 5, 1, 1, 0, 10}
    dataDictionary["Base.ColtAce"] = {2, 5, 1, 1, 0, 10}
    dataDictionary["Base.ColtPython"] = {2, 5, 1, 1, 0, 10}
    dataDictionary["Base.ColtPythonHunter"] = {2, 5, 1, 1, 0, 10}
    dataDictionary["Base.ColtAnaconda"] = {2, 5, 1, 1, 0, 10}
    dataDictionary["Base.ColtPeacemaker"] = {2, 5, 1, 1, 0, 10}
    dataDictionary["Base.ColtSingleAction22"] = {2, 5, 1, 1, 0, 10}
    dataDictionary["Base.22Clip"] = {2, 10, 1, 1}
    dataDictionary["Base.Glock17Mag"] = {2, 10, 1, 1}
    dataDictionary["Base.MP5Mag"] = {2, 10, 1, 1}
    dataDictionary["Base.UZIMag"] = {2, 10, 1, 1}
    dataDictionary["Base.Mac10Mag"] = {2, 10, 1, 1}
    dataDictionary["Base.AK_Mag"] = {2, 10, 1, 1}
    dataDictionary["Base.M14Clip"] = {2, 10, 1, 1}
    dataDictionary["Base.FN_FAL_Mag"] = {2, 10, 1, 1}
    dataDictionary["Base.M1GarandClip"] = {2, 10, 1, 1}

    -- Check if suppressors are enabled
    if SandboxVars.Firearms.SpawnSuppressors then
        if SandboxVars.Firearms.SpawnHandgunSuppressors then
            dataDictionary["Base.9mmSilencer"] = {2, 3, 1, 1}
            dataDictionary["Base.45Silencer"] = {2, 3, 1, 1}
        end

        if SandboxVars.Firearms.SpawnRifleSuppressors then
            dataDictionary["Base.223Silencer"] = {2, 3, 1, 1}
            dataDictionary["Base.308Silencer"] = {2, 3, 1, 1}
            dataDictionary["Base.22Silencer"] = {2, 3, 1, 1}
        end

        if SandboxVars.Firearms.SpawnShotgunSuppressors then
            dataDictionary["Base.ShotgunSilencer"] = {2, 3, 1, 1}
        end

        if SandboxVars.Firearms.SpawnRevolverSuppressors then
            dataDictionary["Base.38Silencer"] = {2, 3, 1, 1}
        end
    end

    -- TIER 3 ITEMS
    dataDictionary["Base.M60"] = {3, 1, 1, 1, 0, 10}
    dataDictionary["Base.AmmoCan762"] = {3, 5, 1, 1}
    dataDictionary["Base.AmmoCan762x39"] = {3, 5, 1, 1}
    dataDictionary["Base.AmmoCan556"] = {3, 5, 1, 1}
    dataDictionary["Base.AmmoCan223"] = {3, 5, 1, 1}
    dataDictionary["Base.AmmoCan308"] = {3, 5, 1, 1}
    dataDictionary["Base.AmmoCan9mm"] = {3, 5, 1, 1}
    dataDictionary["Base.FN_FAL"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.M16A2"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.M733"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.AR15"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.AK47"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.Winchester94"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.Winchester73"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.Rossi92"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.HuntingRifle_Sawn"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.Rugerm7722"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.SKS"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.M24Rifle"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.M1Garand"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.Mossberg500"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.Mossberg500Tactical"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.Remington870Wood"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.Remington870Sawnoff"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.M37"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.M37Sawnoff"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.SPAS12"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.LAW12"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.MP5"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.UZI"] = {3, 5, 1, 1, 0, 10}
    dataDictionary["Base.Mac10"] = {3, 5, 1, 1, 0, 10}
end

-- Thanks Udderly <3
local function split(s, sep)
    if not sep then
        sep = "%s"
    end

    local t = {}
    for str in string.gmatch(s, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

local function getTotalWeightOfTier(tier)
    local totalWeight = 0
    for _, data in pairs(tier) do
        totalWeight = totalWeight + data[2]
    end

    tier.totalWeight = totalWeight
end

function Setup()
    MagnetFishing.totalTierChances = SandboxVars.MagnetFishing.Tier1Chance + SandboxVars.MagnetFishing.Tier2Chance + SandboxVars.MagnetFishing.Tier3Chance
    
    local itemConfig = SandboxVars.MagnetFishing.ItemEdits
    for i, item in ipairs(split(itemConfig, ";")) do
        local vars = split(item, ":")
        dataDictionary[vars[1]] = {vars[2], vars[3], vars[4], vars[5], vars[6]}
    end

    for item, data in pairs(dataDictionary) do
        local trueItem = getScriptManager():getItem(item)
        if trueItem then
            local tier = data[1]
            if tier then
                tier = MagnetFishing["Tier"..tier.."Items"]
            end

            if not tier then
                tier = MagnetFishing.Tier1Items
            end

            local rarity = data[2]
            rarity = tonumber(rarity) or 50

            local minAmount = data[3]
            minAmount = tonumber(minAmount) or 1

            local maxAmount = data[4]
            maxAmount = maxAmount or minAmount

            local minCondition = data[5]
            minCondition = math.min((tonumber(minCondition) or 0)/100, 1) -- assume 0 if no float exists, otherwise assume 100 if float is too large.

            local maxCondition = data[6]
            maxCondition = math.min(math.max((tonumber(maxCondition) or 50)/100, minCondition), 1) -- not even gonna bother with explaining this im too tired lol

            table.insert(tier, {item, rarity, minAmount, maxAmount, minCondition, maxCondition})
        else
            print("MagnetFishing: Item "..item.." does not exist. Aborting..")
        end
    end

    getTotalWeightOfTier(MagnetFishing.Tier1Items)
    getTotalWeightOfTier(MagnetFishing.Tier2Items)
    getTotalWeightOfTier(MagnetFishing.Tier3Items)
end

Events.OnGameStart.Add(Setup)