require 'NATT_SupportedMods'

local attachments = {
    WaterBottleFull= "Bottle",
    WaterBottleEmpty= "Bottle",
    WaterPopBottle= "Bottle",
    PopBottleEmpty= "Bottle",
    PopBottle= "Bottle",
	Pop= "Bottle",
	Pop2= "Bottle",
	Pop3= "Bottle",
	PopEmpty= "Bottle",
	Pop2Empty= "Bottle",
	Pop3Empty= "Bottle",
	WhiskeyFull= "Bottle",
	WhiskeyEmpty= "Bottle",
	WhiskeyWaterFull= "Bottle",

	["farming.RemouladeFull"]= "Bottle",
	["farming.RemouladeEmpty"]= "Bottle",
	["farming.RemouladeWaterFull"]= "Bottle",

    ["farming.MayonnaiseFull"]= "Bottle",
	["farming.MayonnaiseEmpty"]= "Bottle",
	["farming.MayonnaiseWaterFull"]= "Bottle",

	BeerBottle= "Bottle",
	BeerFull= "Bottle",
	BeerEmpty= "Bottle",
	BeerWaterFull= "Bottle",

	Wine= "Wine",
	WineEmpty= "Wine",
	Wine2= "Bottle",
	WineEmpty2= "Bottle",
	WineWaterFull= "Wine",
	BeerEmpty= "Bottle",
	BeerWaterFull= "Bottle",

	HandTorch= "Flashlight",

	Doll= "Doll",
	Spiffo= "Plushie",
	BorisBadger= "PAWSPlushie",
	JacquesBeaver= "PAWSPlushie",
	FreddyFox= "PAWSPlushie",
	PancakeHedgehog= "PAWSPlushie",
	MoleyMole= "PAWSPlushie",
	FluffyfootBunny= "PAWSPlushie",
	FurbertSquirrel= "PAWSPlushie",

	DogChew= "DogChew",
	CatToy= "CatToy",
	Rubberducky= "RubberDucky",
	Rubberducky2= "RubberDucky",
	ToyBear= "ToyBear",
	ToyCar= "ToyCar",
	Yoyo= "Yoyo",
	Cube= "Cube",
	Hat_GasMask= "Mask",
	Hat_HockeyMask= "Mask",
	WeldingMask= "Mask",
	BlowTorch = "Wrench",

	Pills = "PillBottle",
	PillsAntiDep = "PillBottle",
	PillsBeta = "PillBottle",
	PillsSleepingTablets = "PillBottle",
	PillsVitamins = "PillBottle",

	SeedBag = "ContainerSeed",
	Lunchbox = "Container",
	Toolbox = "ContainerTool",
	Bag_JanitorToolbox = "ContainerTool",
	Cooler = "ContainerCooler",
	Garbagebag = "ContainerTrash",
	Plasticbag =  "ContainerTote",
	GroceryBag1 =  "ContainerTote",
	GroceryBag2 =  "ContainerTote",
	GroceryBag3 =  "ContainerTote",
	GroceryBag4 =  "ContainerTote",
	Tote = "ContainerTote",
	Handbag = "Container",
	FirstAidKit = "Container",
	Lunchbox = "Container",
	Lunchbox2 = "Container",
	EmptySandbag = "ContainerSack",
	SackCabbages = "ContainerSack",
	SackCarrots = "ContainerSack",
	SackPotatoes = "ContainerSack",
	SackOnions = "ContainerSack",

	ClosedUmbrellaBlue = "Nightstick",
	ClosedUmbrellaRed = "Nightstick",
	ClosedUmbrellaBlack = "Nightstick",
	ClosedUmbrellaWhite = "Nightstick",
	["SWeapons.SalvagedNightstick"] = "SNightstick",

	RedCooler = "ContainerCooler",
	OrganCooler = "ContainerCooler",

	["AliceBP.MilitaryCanteenFull"] = "Bottle",
	["AliceBP.MilitaryCanteenEmpty"] = "Bottle",
}

local staticModels = {
    Doll= "Doll",
	Spiffo= "SpiffoPlushie",

	BorisBadger= "PlushieBadger_Ground",
	JacquesBeaver= "PlushieBeaver_Ground",
	FreddyFox= "PlushieFox_Ground",
	PancakeHedgehog= "PlushieHedgehog_Ground",
	MoleyMole= "PlushieMole_Ground",
	FluffyfootBunny= "PlushieRabbit_Ground",
	FurbertSquirrel= "PlushieSquirrel_Ground",

    DogChew= "DogChewToy",
    CatToy= "CatToy",
    Rubberducky= "Rubberducky",
    Rubberducky2= "Rubberducky",
	ToyBear= "ToyBear",
	ToyCar= "ToyCar",
	Yoyo= "Yoyo",
	Hat_GasMask= "GasMask",
	Hat_HockeyMask= "HockeyMask",
	WeldingMask= "WelderMask",

	PopEmpty= "PopCanDietWorld",
	Pop2Empty= "PopCanRedWorld",
	Pop3Empty= "PopCanFizzWorld",

	PopBottleEmpty= "PopBottle",

	Lunchbox = "LunchBox_Ground",
	Toolbox = "ToolBox_Ground",
	Bag_JanitorToolbox = "ToolBox_Ground",
	Cooler = "Cooler_Ground",
	Garbagebag = "GarbageBag_Ground",
	Plasticbag =  "PlasticBag_Ground",
	GroceryBag1 =  "PlasticBag_Ground",
	GroceryBag2 =  "PlasticBag_Ground",
	GroceryBag3 =  "PlasticBag_Ground",
	GroceryBag4 =  "PlasticBag_Ground",
	Tote = "TotesBag_Ground",
	Handbag = "Handbag_Ground",
	FirstAidKit = "LunchBoxMedic_Ground",
	Lunchbox = "LunchBox_Ground",
	Lunchbox2 = "LunchBox2_Ground",
	EmptySandbag = "SandBag_Ground",
	SackCabbages = "SandBag_Ground",
	SackCarrots = "SandBag_Ground",
	SackPotatoes = "SandBag_Ground",
	SackOnions = "SandBag_Ground",
	SeedBag = "SeedBag",

	["AliceBP.MilitaryCanteenEmpty"] = "MilitaryCanteenFull",
}

local function Tweaker(item,property,value)
	local item = ScriptManager.instance:getItem(item)
	if item then 
		item:DoParam(property.." = "..value)
	end
end

for k,v in pairs(attachments) do 
	Tweaker(k,"AttachmentType",v)
end

for k,v in pairs(staticModels) do 
	Tweaker(k,"StaticModel",v)
end

Tweaker("Bag_ALICEpack_Army","IconsForTexture","AliceBag_Camo;AliceBag_Camo_Desert;AliceBag_Camo_Urban");

if isModActivated(NATTmods.PwSleepingbags) then
	Tweaker("SleepingbagRolled","StaticModel", "sleepingbag");
	Tweaker("SleepingbagGRolled","StaticModel", "sleepingbagG");
	Tweaker("SleepingbagRRolled","StaticModel", "sleepingbagR");
	Tweaker("SleepingbagORolled","StaticModel", "sleepingbagO");
	Tweaker("SleepingbagBKRolled","StaticModel", "sleepingbagBK");
	Tweaker("SleepingbagLBRolled","StaticModel", "sleepingbagLB");
	Tweaker("SleepingbagPRolled","StaticModel", "sleepingbagP");

	Tweaker("SleepingbagRolled","AttachmentType", "Bedroll");
	Tweaker("SleepingbagGRolled","AttachmentType", "Bedroll");
	Tweaker("SleepingbagRRolled","AttachmentType", "Bedroll");
	Tweaker("SleepingbagORolled","AttachmentType", "Bedroll");
	Tweaker("SleepingbagBKRolled","AttachmentType", "Bedroll");
	Tweaker("SleepingbagLBRolled","AttachmentType", "Bedroll");
	Tweaker("SleepingbagPRolled","AttachmentType", "Bedroll");

	Tweaker("Sleepingbag","AttachmentType", "Bedroll");
	Tweaker("SleepingbagG","AttachmentType", "Bedroll");
	Tweaker("SleepingbagR","AttachmentType", "Bedroll");
	Tweaker("SleepingbagO","AttachmentType", "Bedroll");
	Tweaker("SleepingbagBK","AttachmentType", "Bedroll");
	Tweaker("SleepingbagLB","AttachmentType", "Bedroll");
	Tweaker("SleepingbagP","AttachmentType", "Bedroll");
end

if isModActivated(NATTmods.UndeadSuvivor) then
	Tweaker("UndeadSurvivor.StalkerMask","StaticModel", "StalkerMask_Ground");
	Tweaker("UndeadSurvivor.StalkerMask","AttachmentType", "MaskGround");

	Tweaker("UndeadSurvivor.PrepperMask","StaticModel", "PrepperMask_Ground");
	Tweaker("UndeadSurvivor.PrepperMask","AttachmentType", "MaskGround");
end

if isModActivated(NATTmods.SMUI) then
	Tweaker("SMUIClothing.Hat_M17","StaticModel", "M17GasMask");
	Tweaker("SMUIClothing.Hat_M40","StaticModel", "M40GasMask");

	Tweaker("SMUIClothing.Hat_M17","AttachmentType", "Mask");
	Tweaker("SMUIClothing.Hat_M40","AttachmentType", "Mask");
end

if isModActivated(NATTmods.BritaArmor) then
	Tweaker("Hat_MCU_GasMask","StaticModel", "MCUGasMask");
	Tweaker("Hat_M45_GasMask","StaticModel", "M45GasMask");
	Tweaker("Hat_FM53","StaticModel", "FM53GasMask");
	Tweaker("Hat_M50","StaticModel", "M50GasMask");
	Tweaker("Hat_MSA_Gas_Mask","StaticModel", "MSAGasMask");
	Tweaker("Hat_MSA_Gas_Mask_AMP","StaticModel", "MSAGasMaskAMP");

	Tweaker("Hat_MCU_GasMask","AttachmentType", "Mask");
	Tweaker("Hat_M45_GasMask","AttachmentType", "Mask");
	Tweaker("Hat_FM53","AttachmentType", "Mask");
	Tweaker("Hat_M50","AttachmentType", "Mask");
	Tweaker("Hat_MSA_Gas_Mask","AttachmentType", "Mask");
	Tweaker("Hat_MSA_Gas_Mask_AMP","AttachmentType", "Mask");
end

if isModActivated(NATTmods.SWATPack) then
	Tweaker("Hat_SwatGasMask","StaticModel", "SwatGasMask");
	Tweaker("Hat_SwatGasMask","AttachmentType", "Mask");
end

if isModActivated(NATTmods.ScrapArmor) then
	Tweaker("Hat_WelderMask2","StaticModel", "WelderMaskScrap");
	Tweaker("Hat_WelderMask2","AttachmentType", "Mask");

	Tweaker("Hat_Rebreather","StaticModel", "Rebreather");
	Tweaker("Hat_Rebreather","AttachmentType", "Mask");
end

if isModActivated(NATTmods.DawnTime) then
	Tweaker("DawnPlushie","StaticModel", "DawnPlush");
	Tweaker("DawnPlushie","AttachmentType", "Dawn");
end

if isModActivated(NATTmods.FNAF6) then
	Tweaker("Bag_Schoolbag_II","IconsForTexture", "Backpack_Black;Backpack_Blue;Backpack_Spiffo;Backpack_Fnaf");
	Tweaker("Bag_Schoolbag_I","IconsForTexture", "Backpack_Black;Backpack_Blue;Backpack_Spiffo;Backpack_Fnaf");
end

if isModActivated(NATTmods.McPhisto2051) then
	Tweaker("McPhisto2051's_Backpacks.Bag_MilitaryBagUp01","IconsForTexture", "AliceBag_Camo;AliceBag_Camo_Desert;AliceBag_Camo_Urban");
	Tweaker("McPhisto2051's_Backpacks.Bag_MilitaryBagUp02","IconsForTexture", "AliceBag_Camo;AliceBag_Camo_Desert;AliceBag_Camo_Urban");
	Tweaker("McPhisto2051's_Backpacks.Bag_MilitaryBagUp03","IconsForTexture", "AliceBag_Camo;AliceBag_Camo_Desert;AliceBag_Camo_Urban");
	Tweaker("McPhisto2051's_Backpacks.Bag_MilitaryBagUp04","IconsForTexture", "AliceBag_Camo;AliceBag_Camo_Desert;AliceBag_Camo_Urban");
	Tweaker("McPhisto2051's_Backpacks.Bag_MilitaryBagUp05","IconsForTexture", "AliceBag_Camo;AliceBag_Camo_Desert;AliceBag_Camo_Urban");
end
