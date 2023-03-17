-- DarkSlayerEX's Item Tweaker Core: an API for tweaking existing items without redefining them entirely.
-- Initializes the tables needed for the code to run
if not ItemTweaker then  ItemTweaker = {} end
if not TweakItem then  TweakItem = {} end
if not TweakItemData then  TweakItemData = {} end
-- Prep code to make the changes to all item in the TweakItemData table.
function ItemTweaker.tweakItems()
	local item;
	for k,v in pairs(TweakItemData) do 
		for t,y in pairs(v) do 
			item = ScriptManager.instance:getItem(k); -- 		
			if item ~= nil then
				item:DoParam(t.." = "..y); -- 
				print(k..": "..t..", "..y); -- 
			end
		end
	end
end

function TweakItem(itemName, itemProperty, propertyValue)
	if not TweakItemData[itemName] then
		TweakItemData[itemName] = {};
	end
	TweakItemData[itemName][itemProperty] = propertyValue;
end

Events.OnGameBoot.Add(ItemTweaker.tweakItems)

-- Spear Example
--[[	DisplayCategory = WeaponCrafted,
        MaxRange	=	1.4,
        WeaponSprite	=	SpearCrafted,
        MinAngle	=	0.8,
        Type	=	Weapon,
        MinimumSwingTime	=	2,
        KnockBackOnNoDeath	=	FALSE,
        SwingAmountBeforeImpact	=	0.02,
        Categories	=	Improvised;Spear,
        ConditionLowerChanceOneIn	=	2,
        Weight	=	1.6,
        SplatNumber	=	1,
        PushBackMod	=	0.3,
        SubCategory	=	Spear,
        ConditionMax	=	5,
        MaxHitCount	=	2,
        DoorDamage	=	2,
        SwingAnim	=	Spear,
        DisplayName	=	Crafted Spear,
        MinRange	=	0.98,
        SwingTime	=	2,
        KnockdownMod	=	0,
        SplatBloodOnNoDeath	=	FALSE,
        Icon	=	SpearStick,
        RunAnim	=	Run_Weapon2,
        IdleAnim	=	Idle_Weapon2,
        TreeDamage  =   0,
        TwoHandWeapon = TRUE,
        CriticalChance	=	20,
        CritDmgMultiplier = 3,
        MinDamage	=	0.8,
        MaxDamage	=	1.2,
        DamageCategory = Slash,
        DamageMakeHole = TRUE,
        BreakSound  =   SpearCraftedBreak,
        HitFloorSound	=	SpearCraftedHit,
        ImpactSound	=	SpearCraftedHit,
        DoorHitSound = SpearCraftedHit,
        HitSound	=	SpearCraftedHit,
        SwingSound	=	SpearCraftedSwing,
        SoundMap = SpearStab SpearCraftedStab,
        BaseSpeed = 1.1,		
		AttachmentType = Shovel,
        Tags = FishingSpear,]]

-- TweakItem("Base.DuctTape","UseDelta", 0.20); -- 

-- || VANILLA || --

-- Pen and Pencil
TweakItem("Base.Pen","Weight", 0.05); -- 0.1
TweakItem("Base.RedPen","Weight", 0.05); -- 0.1
TweakItem("Base.BluePen","Weight", 0.05); -- 0.1
TweakItem("Base.Pencil","Weight", 0.05); -- 0.1

-- Closed Umbrella
TweakItem("Base.ClosedUmbrellaBlue","MaxDamage", 0.3); -- 0.5
TweakItem("Base.ClosedUmbrellaBlue","MinRange", 0.6); -- 0.7
TweakItem("Base.ClosedUmbrellaBlue","CriticalChance", 0); -- 10
TweakItem("Base.ClosedUmbrellaRed","MaxDamage", 0.4); -- 0.5
TweakItem("Base.ClosedUmbrellaRed","MinRange", 0.6); -- 0.7
TweakItem("Base.ClosedUmbrellaRed","CriticalChance", 0); -- 10
TweakItem("Base.ClosedUmbrellaBlack","MaxDamage", 0.4); -- 0.5
TweakItem("Base.ClosedUmbrellaBlack","MinRange", 0.6); -- 0.7
TweakItem("Base.ClosedUmbrellaBlack","CriticalChance", 0); -- 10
TweakItem("Base.ClosedUmbrellaWhite","MaxDamage", 0.4); -- 0.5
TweakItem("Base.ClosedUmbrellaWhite","MinRange", 0.6); -- 0.7
TweakItem("Base.ClosedUmbrellaWhite","CriticalChance", 0); -- 10

-- Wooden Lance
TweakItem("Base.WoodenLance","Weight", 1.6); -- 1.7
TweakItem("Base.WoodenLance","MinDamage", 0.6); -- 1.0
TweakItem("Base.WoodenLance","MaxDamage", 1.2); -- 1.5
TweakItem("Base.WoodenLance","MinRange", 0.74); -- 0.98
TweakItem("Base.WoodenLance","MaxRange", 1.40); -- 1.40
TweakItem("Base.WoodenLance","BaseSpeed", 1.0); -- 1.0
TweakItem("Base.WoodenLance","ConditionMax", 5); -- 5
TweakItem("Base.WoodenLance","ConditionLowerChanceOneIn", 4); -- 2
TweakItem("Base.WoodenLance","CriticalChance", 10); -- 30
TweakItem("Base.WoodenLance","CritDmgMultiplier", 2); -- 10
TweakItem("Base.WoodenLance","DoorDamage", 2); -- 5
TweakItem("Base.WoodenLance","TreeDamage", 0); -- 0

-- Crafted Spear
TweakItem("Base.SpearCrafted","Weight", 1.6); -- 1.7
TweakItem("Base.SpearCrafted","MinDamage", 0.6); -- 1.0
TweakItem("Base.SpearCrafted","MaxDamage", 1.2); -- 1.5
TweakItem("Base.SpearCrafted","MinRange", 0.74); -- 0.98
TweakItem("Base.SpearCrafted","MaxRange", 1.40); -- 1.40
TweakItem("Base.SpearCrafted","BaseSpeed", 1.0); -- 1.0
TweakItem("Base.SpearCrafted","ConditionMax", 5); -- 5
TweakItem("Base.SpearCrafted","ConditionLowerChanceOneIn", 4); -- 2
TweakItem("Base.SpearCrafted","CriticalChance", 10); -- 30
TweakItem("Base.SpearCrafted","CritDmgMultiplier", 2); -- 10
TweakItem("Base.SpearCrafted","DoorDamage", 2); -- 5
TweakItem("Base.SpearCrafted","TreeDamage", 0); -- 0

-- Garden Fork
TweakItem("Base.GardenFork","Weight", 2.0); -- 1.5
TweakItem("Base.GardenFork","MinDamage", 1.0); -- 1.0
TweakItem("Base.GardenFork","MaxDamage", 2.0); -- 1.5
TweakItem("Base.GardenFork","MinRange", 0.61); -- 0.61
TweakItem("Base.GardenFork","MaxRange", 1.35); -- 1.37
TweakItem("Base.GardenFork","BaseSpeed", 0.9); -- 0.9
TweakItem("Base.GardenFork","ConditionMax", 10); -- 10
TweakItem("Base.GardenFork","ConditionLowerChanceOneIn", 30); -- 15
TweakItem("Base.GardenFork","CriticalChance", 20); -- 30
TweakItem("Base.GardenFork","CritDmgMultiplier", 2); -- 10
TweakItem("Base.GardenFork","DoorDamage", 8); -- 7
TweakItem("Base.GardenFork","TreeDamage", 0); -- 0
TweakItem("Base.GardenFork","Knockback", 0.3); -- 0.3
TweakItem("Base.GardenFork","KnockdownMod", 0); -- 0

-- Machete
TweakItem("Base.Machete","Weight", 2.0); -- 2.0
TweakItem("Base.Machete","MinDamage", 2.0); -- 2.0
TweakItem("Base.Machete","MaxDamage", 3.0); -- 3.0
TweakItem("Base.Machete","MaxRange", 1.23); -- 1.23
TweakItem("Base.Machete","BaseSpeed", 1.0); -- 1.0
TweakItem("Base.Machete","ConditionMax", 13); -- 13
TweakItem("Base.Machete","ConditionLowerChanceOneIn", 25); -- 25
TweakItem("Base.Machete","CriticalChance", 20); -- 20
TweakItem("Base.Machete","CritDmgMultiplier", 5); -- 5
TweakItem("Base.Machete","DoorDamage", 15); -- 10
TweakItem("Base.Machete","TreeDamage", 15); -- 10
TweakItem("Base.Machete","Knockback", 0.3); -- 0.3
TweakItem("Base.Machete","KnockdownMod", 2); -- 2
-- Spear with Machete
TweakItem("Base.SpearMachete","Weight", 3.6); -- 3.7
TweakItem("Base.SpearMachete","MinDamage", 1.6); -- 1.3
TweakItem("Base.SpearMachete","MaxDamage", 2.7); -- 2.0
TweakItem("Base.SpearMachete","MinRange", 0.74); -- 0.98
TweakItem("Base.SpearMachete","MaxRange", 1.55); -- 1.55
TweakItem("Base.SpearMachete","BaseSpeed", 0.85); -- 0.9
TweakItem("Base.SpearMachete","ConditionMax", 13); -- 12
TweakItem("Base.SpearMachete","ConditionLowerChanceOneIn", 25); -- 10
TweakItem("Base.SpearMachete","CriticalChance", 15); -- 30
TweakItem("Base.SpearMachete","CritDmgMultiplier", 2); -- 10
TweakItem("Base.SpearMachete","DoorDamage", 16); -- 2
TweakItem("Base.SpearMachete","TreeDamage", 15); -- 10
TweakItem("Base.SpearMachete","Knockback", 0.3); -- 0.3
TweakItem("Base.SpearMachete","KnockdownMod", 0); -- 0

-- Hunting Knife
TweakItem("Base.HuntingKnife","Weight", 0.5); -- 0.5
TweakItem("Base.HuntingKnife","MinDamage", 0.6); -- 0.6
TweakItem("Base.HuntingKnife","MaxDamage", 1.2); -- 1.2
TweakItem("Base.HuntingKnife","MaxRange", 0.94); -- 0.9
TweakItem("Base.HuntingKnife","BaseSpeed", 1.0); -- 1.0
TweakItem("Base.HuntingKnife","ConditionMax", 10); -- 10
TweakItem("Base.HuntingKnife","ConditionLowerChanceOneIn", 20); -- 15
TweakItem("Base.HuntingKnife","CriticalChance", 60); -- 50
TweakItem("Base.HuntingKnife","CritDmgMultiplier", 2); -- 10
TweakItem("Base.HuntingKnife","DoorDamage", 3); -- 1
TweakItem("Base.HuntingKnife","TreeDamage", 3); -- 2
TweakItem("Base.HuntingKnife","EnduranceMod", 1.0); -- 0.5
-- Spear with Hunting Knife 
TweakItem("Base.SpearHuntingKnife","Weight", 2.1); -- 2.2
TweakItem("Base.SpearHuntingKnife","MinDamage", 0.9); -- 1.2 
TweakItem("Base.SpearHuntingKnife","MaxDamage", 1.8); -- 1.7
TweakItem("Base.SpearHuntingKnife","MinRange", 0.74); -- 0.98
TweakItem("Base.SpearHuntingKnife","MaxRange", 1.52); -- 1.48
TweakItem("Base.SpearHuntingKnife","BaseSpeed", 0.95); -- 1.0
TweakItem("Base.SpearHuntingKnife","ConditionMax", 10); -- 9
TweakItem("Base.SpearHuntingKnife","ConditionLowerChanceOneIn", 20); -- 8 
TweakItem("Base.SpearHuntingKnife","CriticalChance", 20); -- 30
TweakItem("Base.SpearHuntingKnife","CritDmgMultiplier", 2); -- 10
TweakItem("Base.SpearHuntingKnife","DoorDamage", 4); -- 7
TweakItem("Base.SpearHuntingKnife","TreeDamage", 3); -- 0
TweakItem("Base.SpearHuntingKnife","Knockback", 0.3); -- 0.3
TweakItem("Base.SpearHuntingKnife","KnockdownMod", 0); -- 0

-- Ice Pick
TweakItem("Base.IcePick","Weight", 0.4); -- 0.4
TweakItem("Base.IcePick","MinDamage", 0.5); -- 0.6
TweakItem("Base.IcePick","MaxDamage", 1.0); -- 0.9
TweakItem("Base.IcePick","MaxRange", 0.9); -- 0.9
TweakItem("Base.IcePick","BaseSpeed", 1.0); -- 1.0
TweakItem("Base.IcePick","ConditionMax", 8); -- 10
TweakItem("Base.IcePick","ConditionLowerChanceOneIn", 18); -- 7
TweakItem("Base.IcePick","CriticalChance", 60); -- 10
TweakItem("Base.IcePick","CritDmgMultiplier", 2); -- 10
TweakItem("Base.IcePick","DoorDamage", 1); -- 1
TweakItem("Base.IcePick","TreeDamage", 1); -- 2
TweakItem("Base.IcePick","EnduranceMod", 1.0); -- 0.5
-- Spear with Ice Pick 
TweakItem("Base.SpearIcePick","Weight", 1.9); -- 2.0
TweakItem("Base.SpearIcePick","MinDamage", 0.85); -- 1.0
TweakItem("Base.SpearIcePick","MaxDamage", 1.7); -- 1.6
TweakItem("Base.SpearIcePick","MinRange", 0.74); -- 0.98
TweakItem("Base.SpearIcePick","MaxRange", 1.48); -- 1.42
TweakItem("Base.SpearIcePick","BaseSpeed", 0.95); -- 1.0
TweakItem("Base.SpearIcePick","ConditionMax", 8); -- 6
TweakItem("Base.SpearIcePick","ConditionLowerChanceOneIn", 18); -- 3
TweakItem("Base.SpearIcePick","CriticalChance", 20); -- 30
TweakItem("Base.SpearIcePick","CritDmgMultiplier", 2); -- 10
TweakItem("Base.SpearIcePick","DoorDamage", 2); -- 5
TweakItem("Base.SpearIcePick","TreeDamage", 1); -- 0
TweakItem("Base.SpearIcePick","Knockback", 0.3); -- 0.3
TweakItem("Base.SpearIcePick","KnockdownMod", 0); -- 0

-- Kitchen Knife
TweakItem("Base.KitchenKnife","Weight", 0.3); -- 0.3
TweakItem("Base.KitchenKnife","MinDamage", 0.4); -- 0.3
TweakItem("Base.KitchenKnife","MaxDamage", 0.8); -- 0.7
TweakItem("Base.KitchenKnife","MaxRange", 0.92); -- 0.9
TweakItem("Base.KitchenKnife","BaseSpeed", 1.0); -- 1.0
TweakItem("Base.KitchenKnife","ConditionMax", 8); -- 10
TweakItem("Base.KitchenKnife","ConditionLowerChanceOneIn", 10); -- 2
TweakItem("Base.KitchenKnife","CriticalChance", 40); -- 25
TweakItem("Base.KitchenKnife","CritDmgMultiplier", 2); -- 4
TweakItem("Base.KitchenKnife","DoorDamage", 2); -- 1
TweakItem("Base.KitchenKnife","TreeDamage", 2); -- 1
TweakItem("Base.KitchenKnife","EnduranceMod", 1.0); -- 0.5
-- Spear with Kitchen Knife 
TweakItem("Base.SpearKnife","Weight", 1.9); -- 2.0
TweakItem("Base.SpearKnife","MinDamage", 0.8); -- 1.0
TweakItem("Base.SpearKnife","MaxDamage", 1.6); -- 1.6
TweakItem("Base.SpearKnife","MinRange", 0.74); -- 0.98
TweakItem("Base.SpearKnife","MaxRange", 1.50); -- 1.45
TweakItem("Base.SpearKnife","BaseSpeed", 0.95); -- 1.0
TweakItem("Base.SpearKnife","ConditionMax", 8); -- 7
TweakItem("Base.SpearKnife","ConditionLowerChanceOneIn", 10); -- 4
TweakItem("Base.SpearKnife","CriticalChance", 15); -- 30
TweakItem("Base.SpearKnife","CritDmgMultiplier", 2); -- 10
TweakItem("Base.SpearKnife","DoorDamage", 3); -- 5
TweakItem("Base.SpearKnife","TreeDamage", 2); -- 0
TweakItem("Base.SpearKnife","Knockback", 0.3); -- 0.3
TweakItem("Base.SpearKnife","KnockdownMod", 0); -- 0

-- Screwdriver
TweakItem("Base.Screwdriver","Weight", 0.3); -- 0.4
TweakItem("Base.Screwdriver","MinDamage", 0.4); -- 0.3
TweakItem("Base.Screwdriver","MaxDamage", 0.85); -- 0.7
TweakItem("Base.Screwdriver","MaxRange", 0.88); -- 0.85
TweakItem("Base.Screwdriver","BaseSpeed", 1.0); -- 1.0
TweakItem("Base.Screwdriver","ConditionMax", 6); -- 10
TweakItem("Base.Screwdriver","ConditionLowerChanceOneIn", 16); -- 6
TweakItem("Base.Screwdriver","CriticalChance", 40); -- 10
TweakItem("Base.Screwdriver","CritDmgMultiplier", 2); -- 10
TweakItem("Base.Screwdriver","DoorDamage", 1); -- 1
TweakItem("Base.Screwdriver","TreeDamage", 1); -- 1
TweakItem("Base.Screwdriver","EnduranceMod", 1.0); -- 0.5
-- Spear with Screwdriver 
TweakItem("Base.SpearScrewdriver","Weight", 1.9); -- 2.1
TweakItem("Base.SpearScrewdriver","MinDamage", 0.8); -- 1.2
TweakItem("Base.SpearScrewdriver","MaxDamage", 1.6); -- 1.6
TweakItem("Base.SpearScrewdriver","MinRange", 0.74); -- 0.98
TweakItem("Base.SpearScrewdriver","MaxRange", 1.48); -- 1.45
TweakItem("Base.SpearScrewdriver","BaseSpeed", 0.95); -- 1.0
TweakItem("Base.SpearScrewdriver","ConditionMax", 6); -- 7
TweakItem("Base.SpearScrewdriver","ConditionLowerChanceOneIn", 16); -- 4
TweakItem("Base.SpearScrewdriver","CriticalChance", 15); -- 30
TweakItem("Base.SpearScrewdriver","CritDmgMultiplier", 2); -- 10
TweakItem("Base.SpearScrewdriver","DoorDamage", 2); -- 7
TweakItem("Base.SpearScrewdriver","TreeDamage", 1); -- 0
TweakItem("Base.SpearScrewdriver","Knockback", 0.3); -- 0.3
TweakItem("Base.SpearScrewdriver","KnockdownMod", 0); -- 0

-- Trowel
TweakItem("farming.HandShovel","Weight", 0.5); -- 0.5
TweakItem("farming.HandShovel","MinDamage", 0.35); -- 0.2
TweakItem("farming.HandShovel","MaxDamage", 0.7); -- 0.4
TweakItem("farming.HandShovel","MaxRange", 0.9); -- 0.9
TweakItem("farming.HandShovel","BaseSpeed", 1.0); -- 1.0
TweakItem("farming.HandShovel","ConditionMax", 10); -- 6
TweakItem("farming.HandShovel","ConditionLowerChanceOneIn", 12); -- 9
TweakItem("farming.HandShovel","CriticalChance", 40); -- 10
TweakItem("farming.HandShovel","CritDmgMultiplier", 2); -- 10
TweakItem("farming.HandShovel","DoorDamage", 5); -- 5
TweakItem("farming.HandShovel","EnduranceMod", 1.0); -- 0.5

-- Hand Fork
TweakItem("Base.HandFork","Weight", 0.5); -- 0.5
TweakItem("Base.HandFork","MinDamage", 0.35); -- 0.2
TweakItem("Base.HandFork","MaxDamage", 0.7); -- 0.4
TweakItem("Base.HandFork","MaxRange", 0.90); -- 0.9
TweakItem("Base.HandFork","BaseSpeed", 0.95); -- 1.0
TweakItem("Base.HandFork","ConditionMax", 10); -- 6
TweakItem("Base.HandFork","ConditionLowerChanceOneIn", 10); -- 9
TweakItem("Base.HandFork","CriticalChance", 40); -- 10
TweakItem("Base.HandFork","CritDmgMultiplier", 2); -- 10
TweakItem("Base.HandFork","DoorDamage", 2); -- 5
TweakItem("Base.HandFork","EnduranceMod", 1.0); -- 0.5
-- Spear with Hand Fork 
TweakItem("Base.SpearHandFork","Weight", 2.1); -- 2.2
TweakItem("Base.SpearHandFork","MinDamage", 0.8); -- 1.1
TweakItem("Base.SpearHandFork","MaxDamage", 1.55); -- 1.6
TweakItem("Base.SpearHandFork","MinRange", 0.74); -- 0.98
TweakItem("Base.SpearHandFork","MaxRange", 1.50); -- 1.45
TweakItem("Base.SpearHandFork","BaseSpeed", 0.95); -- 0.95
TweakItem("Base.SpearHandFork","ConditionMax", 10); -- 7
TweakItem("Base.SpearHandFork","ConditionLowerChanceOneIn", 10); -- 4
TweakItem("Base.SpearHandFork","CriticalChance", 15); -- 30
TweakItem("Base.SpearHandFork","CritDmgMultiplier", 2); -- 10
TweakItem("Base.SpearHandFork","DoorDamage", 3); -- 6
TweakItem("Base.SpearHandFork","TreeDamage", 0); -- 0
TweakItem("Base.SpearHandFork","Knockback", 0.3); -- 0.3
TweakItem("Base.SpearHandFork","KnockdownMod", 0); -- 0

-- Bread Knife
TweakItem("Base.BreadKnife","MinDamage", 0.35); -- 0.3
TweakItem("Base.BreadKnife","MaxDamage", 0.7); -- 0.4
TweakItem("Base.BreadKnife","MaxRange", 1.0); -- 1.0
TweakItem("Base.BreadKnife","BaseSpeed", 1.0); -- 1.0
TweakItem("Base.BreadKnife","ConditionMax", 6); -- 5
TweakItem("Base.BreadKnife","ConditionLowerChanceOneIn", 14); -- 5
TweakItem("Base.BreadKnife","CriticalChance", 40); -- 15
TweakItem("Base.BreadKnife","CritDmgMultiplier", 2); -- 10
TweakItem("Base.BreadKnife","DoorDamage", 4); -- 1
TweakItem("Base.BreadKnife","TreeDamage", 1); -- 0
TweakItem("Base.BreadKnife","EnduranceMod", 1.0); -- 0.5
-- Spear with Bread Knife 
TweakItem("Base.SpearBreadKnife","Weight", 1.9); -- 2.0
TweakItem("Base.SpearBreadKnife","MinDamage", 0.8); -- 1.0
TweakItem("Base.SpearBreadKnife","MaxDamage", 1.55); -- 1.6
TweakItem("Base.SpearBreadKnife","MinRange", 0.74); -- 0.98
TweakItem("Base.SpearBreadKnife","MaxRange", 1.55); -- 1.42
TweakItem("Base.SpearBreadKnife","BaseSpeed", 0.97); -- 1.0
TweakItem("Base.SpearBreadKnife","ConditionMax", 6); -- 6
TweakItem("Base.SpearBreadKnife","ConditionLowerChanceOneIn", 14); -- 3
TweakItem("Base.SpearBreadKnife","CriticalChance", 15); -- 30
TweakItem("Base.SpearBreadKnife","CritDmgMultiplier", 2); -- 10
TweakItem("Base.SpearBreadKnife","DoorDamage", 5); -- 5
TweakItem("Base.SpearBreadKnife","TreeDamage", 1); -- 0
TweakItem("Base.SpearBreadKnife","Knockback", 0.3); -- 0.3
TweakItem("Base.SpearBreadKnife","KnockdownMod", 0); -- 0

-- Scissors
TweakItem("Base.Scissors","Weight", 0.3); -- 0.4
TweakItem("Base.Scissors","MinDamage", 0.2); -- 0.1
TweakItem("Base.Scissors","MaxDamage", 0.4); -- 0.1
TweakItem("Base.Scissors","MaxRange", 0.85); -- 0.9
TweakItem("Base.Scissors","BaseSpeed", 1.1); -- 1.0
TweakItem("Base.Scissors","ConditionMax", 8); -- 10
TweakItem("Base.Scissors","ConditionLowerChanceOneIn", 4); -- 1
TweakItem("Base.Scissors","CriticalChance", 20); -- 5
TweakItem("Base.Scissors","CritDmgMultiplier", 2); -- 0
TweakItem("Base.Scissors","EnduranceMod", 1.0); -- 0.5
-- Spear with Scissors 
TweakItem("Base.SpearScissors","Weight", 1.9); -- 2.1
TweakItem("Base.SpearScissors","MinDamage", 0.7); -- 1.0
TweakItem("Base.SpearScissors","MaxDamage", 1.4); -- 1.6
TweakItem("Base.SpearScissors","MinRange", 0.74); -- 0.98
TweakItem("Base.SpearScissors","MaxRange", 1.45); -- 1.42
TweakItem("Base.SpearScissors","BaseSpeed", 0.95); -- 1.0
TweakItem("Base.SpearScissors","ConditionMax", 8); -- 6
TweakItem("Base.SpearScissors","ConditionLowerChanceOneIn", 6); -- 3
TweakItem("Base.SpearScissors","CriticalChance", 10); -- 30
TweakItem("Base.SpearScissors","CritDmgMultiplier", 2); -- 10
TweakItem("Base.SpearScissors","DoorDamage", 2); -- 5
TweakItem("Base.SpearScissors","TreeDamage", 0); -- 0
TweakItem("Base.SpearScissors","Knockback", 0.3); -- 0.3
TweakItem("Base.SpearScissors","KnockdownMod", 0); -- 0

-- Letter Opener
TweakItem("Base.LetterOpener","Weight", 0.2); -- 0.3
TweakItem("Base.LetterOpener","MinDamage", 0.25); -- 0.1
TweakItem("Base.LetterOpener","MaxDamage", 0.5); -- 0.1
TweakItem("Base.LetterOpener","MaxRange", 0.88); -- 0.9
TweakItem("Base.LetterOpener","BaseSpeed", 1.1); -- 1.0
TweakItem("Base.LetterOpener","ConditionMax", 6); -- 5
TweakItem("Base.LetterOpener","ConditionLowerChanceOneIn", 6); -- 1
TweakItem("Base.LetterOpener","CriticalChance", 20); -- 5
TweakItem("Base.LetterOpener","CritDmgMultiplier", 2); -- 10
TweakItem("Base.LetterOpener","DoorDamage", 2); -- 1
TweakItem("Base.LetterOpener","TreeDamage", 1); -- 2
TweakItem("Base.LetterOpener","EnduranceMod", 1.0); -- 0.5
-- Spear with Letter Opener 
TweakItem("Base.SpearLetterOpener","Weight", 1.8); -- 2.0
TweakItem("Base.SpearLetterOpener","MinDamage", 0.7); -- 1.0
TweakItem("Base.SpearLetterOpener","MaxDamage", 1.45); -- 1.6
TweakItem("Base.SpearLetterOpener","MinRange", 0.74); -- 0.98
TweakItem("Base.SpearLetterOpener","MaxRange", 1.48); -- 1.42
TweakItem("Base.SpearLetterOpener","BaseSpeed", 0.84); -- 1.0
TweakItem("Base.SpearLetterOpener","ConditionMax", 6); -- 6
TweakItem("Base.SpearLetterOpener","ConditionLowerChanceOneIn", 6); -- 3
TweakItem("Base.SpearLetterOpener","CriticalChance", 10); -- 30
TweakItem("Base.SpearLetterOpener","CritDmgMultiplier", 2); -- 10
TweakItem("Base.SpearLetterOpener","DoorDamage", 2); -- 5
TweakItem("Base.SpearLetterOpener","TreeDamage", 1); -- 0
TweakItem("Base.SpearLetterOpener","Knockback", 0.3); -- 0.3
TweakItem("Base.SpearLetterOpener","KnockdownMod", 0); -- 0

-- Scalpel
TweakItem("Base.Scalpel","Weight", 0.2); -- 0.3
TweakItem("Base.Scalpel","MinDamage", 0.1); -- 0.1
TweakItem("Base.Scalpel","MaxDamage", 0.8); -- 0.4
TweakItem("Base.Scalpel","MaxRange", 0.85); -- 0.8
TweakItem("Base.Scalpel","BaseSpeed", 1.2); -- 1.0
TweakItem("Base.Scalpel","ConditionMax", 6); -- 5
TweakItem("Base.Scalpel","ConditionLowerChanceOneIn", 3); -- 1
TweakItem("Base.Scalpel","CriticalChance", 20); -- 10
TweakItem("Base.Scalpel","CritDmgMultiplier", 2); -- 10
TweakItem("Base.Scalpel","DoorDamage", 1); -- 1
TweakItem("Base.Scalpel","TreeDamage", 0); -- 0
TweakItem("Base.Scalpel","EnduranceMod", 1.0); -- 0.5
-- Spear with Scalpel 
TweakItem("Base.SpearScalpel","Weight", 1.8); -- 2.0
TweakItem("Base.SpearScalpel","MinDamage", 0.65); -- 1.0
TweakItem("Base.SpearScalpel","MaxDamage", 1.6); -- 1.6
TweakItem("Base.SpearScalpel","MinRange", 0.74); -- 0.98
TweakItem("Base.SpearScalpel","MaxRange", 1.44); -- 1.42
TweakItem("Base.SpearScalpel","BaseSpeed", 0.95); -- 1.0
TweakItem("Base.SpearScalpel","ConditionMax", 6); -- 6
TweakItem("Base.SpearScalpel","ConditionLowerChanceOneIn", 6); -- 3
TweakItem("Base.SpearScalpel","CriticalChance", 10); -- 30
TweakItem("Base.SpearScalpel","CritDmgMultiplier", 2); -- 10
TweakItem("Base.SpearScalpel","DoorDamage", 2); -- 5
TweakItem("Base.SpearScalpel","TreeDamage", 0); -- 0
TweakItem("Base.SpearScalpel","Knockback", 0.3); -- 0.3
TweakItem("Base.SpearScalpel","KnockdownMod", 0); -- 0

-- Butter Knife
TweakItem("Base.ButterKnife","Weight", 0.2); -- 0.3
TweakItem("Base.ButterKnife","MinDamage", 0.1); -- 0.1
TweakItem("Base.ButterKnife","MaxDamage", 0.3); -- 0.4
TweakItem("Base.ButterKnife","MaxRange", 0.84); -- 0.8
TweakItem("Base.ButterKnife","BaseSpeed", 1.0); -- 1.0
TweakItem("Base.ButterKnife","ConditionMax", 5); -- 2
TweakItem("Base.ButterKnife","ConditionLowerChanceOneIn", 2); -- 1
TweakItem("Base.ButterKnife","CriticalChance", 0); -- 7
TweakItem("Base.ButterKnife","CritDmgMultiplier", 1); -- 10
TweakItem("Base.ButterKnife","EnduranceMod", 1.0); -- 0.5
-- Spear with Butter Knife 
TweakItem("Base.SpearButterKnife","Weight", 1.8); -- 2.0
TweakItem("Base.SpearButterKnife","MinDamage", 0.65); -- 1.0
TweakItem("Base.SpearButterKnife","MaxDamage", 1.35); -- 1.6
TweakItem("Base.SpearButterKnife","MinRange", 0.74); -- 0.98
TweakItem("Base.SpearButterKnife","MaxRange", 1.44); -- 1.42
TweakItem("Base.SpearButterKnife","BaseSpeed", 0.97); -- 1.0
TweakItem("Base.SpearButterKnife","ConditionMax", 5); -- 6
TweakItem("Base.SpearButterKnife","ConditionLowerChanceOneIn", 6); -- 3
TweakItem("Base.SpearButterKnife","CriticalChance", 10); -- 30
TweakItem("Base.SpearButterKnife","CritDmgMultiplier", 2); -- 10
TweakItem("Base.SpearButterKnife","DoorDamage", 2); -- 5
TweakItem("Base.SpearButterKnife","TreeDamage", 0); -- 0
TweakItem("Base.SpearButterKnife","Knockback", 0.3); -- 0.3
TweakItem("Base.SpearButterKnife","KnockdownMod", 0); -- 0

-- Spoon
TweakItem("Base.Spoon","Weight", 0.1); -- 0.3
TweakItem("Base.Spoon","MinDamage", 0.1); -- 0.1
TweakItem("Base.Spoon","MaxDamage", 0.1); -- 0.1
TweakItem("Base.Spoon","MaxRange", 0.8); -- 0.8
TweakItem("Base.Spoon","BaseSpeed", 1.1); -- 1.0
TweakItem("Base.Spoon","ConditionMax", 5); -- 3
TweakItem("Base.Spoon","ConditionLowerChanceOneIn", 2); -- 1
TweakItem("Base.Spoon","CritDmgMultiplier", 1); -- 10
TweakItem("Base.Spoon","TreeDamage", 0); -- 1
TweakItem("Base.Spoon","EnduranceMod", 1.0); -- 0.5
-- Spear with Spoon 
TweakItem("Base.SpearSpoon","Weight", 1.7); -- 2.0
TweakItem("Base.SpearSpoon","MinDamage", 0.65); -- 1.0
TweakItem("Base.SpearSpoon","MaxDamage", 1.2); -- 1.6
TweakItem("Base.SpearSpoon","MinRange", 0.74); -- 0.98
TweakItem("Base.SpearSpoon","MaxRange", 1.42); -- 1.42
TweakItem("Base.SpearSpoon","BaseSpeed", 1.0); -- 1.0
TweakItem("Base.SpearSpoon","ConditionMax", 5); -- 6
TweakItem("Base.SpearSpoon","ConditionLowerChanceOneIn", 6); -- 3
TweakItem("Base.SpearSpoon","CriticalChance", 10); -- 30
TweakItem("Base.SpearSpoon","CritDmgMultiplier", 2); -- 10
TweakItem("Base.SpearSpoon","DoorDamage", 2); -- 5
TweakItem("Base.SpearSpoon","TreeDamage", 0); -- 0
TweakItem("Base.SpearSpoon","Knockback", 0.3); -- 0.3
TweakItem("Base.SpearSpoon","KnockdownMod", 0); -- 0

-- Fork
TweakItem("Base.Fork","Weight", 0.1); -- 0.3
TweakItem("Base.Fork","MinDamage", 0.1); -- 0.1
TweakItem("Base.Fork","MaxDamage", 0.2); -- 0.1
TweakItem("Base.Fork","MaxRange", 0.8); -- 0.8
TweakItem("Base.Fork","BaseSpeed", 1.1); -- 1
TweakItem("Base.Fork","ConditionMax", 5); -- 3
TweakItem("Base.Fork","ConditionLowerChanceOneIn", 2); -- 1
TweakItem("Base.Fork","CriticalChance", 0); -- 5
TweakItem("Base.Fork","CritDmgMultiplier", 1); -- 10
TweakItem("Base.Fork","EnduranceMod", 1.0); -- 0.5
-- Spear with Fork 
TweakItem("Base.SpearFork","Weight", 1.7); -- 2.0
TweakItem("Base.SpearFork","MinDamage", 0.65); -- 1.0
TweakItem("Base.SpearFork","MaxDamage", 1.3); -- 1.6
TweakItem("Base.SpearFork","MinRange", 0.74); -- 0.98
TweakItem("Base.SpearFork","MaxRange", 1.42); -- 1.42
TweakItem("Base.SpearFork","BaseSpeed", 1.0); -- 1.0
TweakItem("Base.SpearFork","ConditionMax", 5); -- 6
TweakItem("Base.SpearFork","ConditionLowerChanceOneIn", 6); -- 3
TweakItem("Base.SpearFork","CriticalChance", 10); -- 30
TweakItem("Base.SpearFork","CritDmgMultiplier", 2); -- 10
TweakItem("Base.SpearFork","DoorDamage", 2); -- 5
TweakItem("Base.SpearFork","TreeDamage", 0); -- 0
TweakItem("Base.SpearFork","Knockback", 0.3); -- 0.3
TweakItem("Base.SpearFork","KnockdownMod", 0); -- 0

-- Meat Cleaver
TweakItem("Base.MeatCleaver","Weight", 0.8); -- 1.0
TweakItem("Base.MeatCleaver","MinDamage", 0.5); -- 0.4
TweakItem("Base.MeatCleaver","MaxDamage", 1.0); -- 0.8
TweakItem("Base.MeatCleaver","MaxRange", 1.0); -- 1.0
TweakItem("Base.MeatCleaver","BaseSpeed", 1.1); -- 1.2
TweakItem("Base.MeatCleaver","ConditionMax", 10); -- 10
TweakItem("Base.MeatCleaver","ConditionLowerChanceOneIn", 22); -- 15
TweakItem("Base.MeatCleaver","CriticalChance", 20); -- 15
TweakItem("Base.MeatCleaver","CritDmgMultiplier", 4); -- 5
TweakItem("Base.MeatCleaver","DoorDamage", 15); -- 20
TweakItem("Base.MeatCleaver","Knockback", 0.3); -- 0.30.3
TweakItem("Base.MeatCleaver","KnockdownMod", 2); -- 2
TweakItem("Base.MeatCleaver","EnduranceMod", 1.0); -- 1.0

-- Hand Scythe
TweakItem("Base.HandScythe","Weight", 0.6); -- 0.5
TweakItem("Base.HandScythe","MinDamage", 0.55); -- 0.6
TweakItem("Base.HandScythe","MaxDamage", 1.1); -- 1.2
TweakItem("Base.HandScythe","MaxRange", 1.1); -- 1.1
TweakItem("Base.HandScythe","BaseSpeed", 1.2); -- 1.1
TweakItem("Base.HandScythe","ConditionMax", 10); -- 5
TweakItem("Base.HandScythe","ConditionLowerChanceOneIn", 16); -- 5
TweakItem("Base.HandScythe","CriticalChance", 35); -- 15
TweakItem("Base.HandScythe","CritDmgMultiplier", 2.5); -- 5
TweakItem("Base.HandScythe","DoorDamage", 2); -- 5
TweakItem("Base.HandScythe","TreeDamage", 2); -- 0
TweakItem("Base.HandScythe","Knockback", 0.3); -- 0.30.3
TweakItem("Base.HandScythe","KnockdownMod", 2); -- 2
TweakItem("Base.HandScythe","EnduranceMod", 1.0); -- 1.0

-- Stone Knife
TweakItem("Base.FlintKnife","Weight", 0.6); -- 0.75
TweakItem("Base.FlintKnife","MinDamage", 0.3); -- 0.4
TweakItem("Base.FlintKnife","MaxDamage", 0.6); -- 0.6
TweakItem("Base.FlintKnife","MaxRange", 0.85); -- 0.85
TweakItem("Base.FlintKnife","BaseSpeed", 1.0); -- 1.0
TweakItem("Base.FlintKnife","ConditionMax", 6); -- 6
TweakItem("Base.FlintKnife","ConditionLowerChanceOneIn", 8); -- 7
TweakItem("Base.FlintKnife","CriticalChance", 20); -- 20
TweakItem("Base.FlintKnife","CritDmgMultiplier", 2); -- 2
TweakItem("Base.FlintKnife","EnduranceMod", 1.0); -- 0.5

-- Stake
TweakItem("Base.Stake","Weight", 0.3); -- 0.3
TweakItem("Base.Stake","MinDamage", 0.25); -- 0.25
TweakItem("Base.Stake","MaxDamage", 0.5); -- 0.53
TweakItem("Base.Stake","MaxRange", 0.85); -- 0.85
TweakItem("Base.Stake","BaseSpeed", 1.1); -- 1.0
TweakItem("Base.Stake","ConditionMax", 5); -- 5
TweakItem("Base.Stake","ConditionLowerChanceOneIn", 2); -- 1
TweakItem("Base.Stake","CriticalChance", 20); -- 10
TweakItem("Base.Stake","CritDmgMultiplier", 2); -- 10
TweakItem("Base.Stake","EnduranceMod", 1.0); -- 0.5

-- Smashed Bottle
TweakItem("Base.SmashedBottle","Weight", 0.2); -- 0.2
TweakItem("Base.SmashedBottle","MinDamage", 0.1); -- 0.2
TweakItem("Base.SmashedBottle","MaxDamage", 0.6); -- 0.5
TweakItem("Base.SmashedBottle","MaxRange", 0.84); -- 0.8
TweakItem("Base.SmashedBottle","BaseSpeed", 1.2); -- 1.4
TweakItem("Base.SmashedBottle","ConditionMax", 4); -- 3
TweakItem("Base.SmashedBottle","ConditionLowerChanceOneIn", 2); -- 1
TweakItem("Base.SmashedBottle","CriticalChance", 20); -- 5
TweakItem("Base.SmashedBottle","CritDmgMultiplier", 2); -- 5
TweakItem("Base.SmashedBottle","EnduranceMod", 1.0); -- 0.5


--||| BUSHCRAFT - TOOLS |||---
-- Cheap Survival Knife
TweakItem("BCGTools.CheapSurvivalKnife","Weight", 0.4); -- 0.4
TweakItem("BCGTools.CheapSurvivalKnife","MinDamage", 0.5); -- 0.5
TweakItem("BCGTools.CheapSurvivalKnife","MaxDamage", 1.0); -- 1.0
TweakItem("BCGTools.CheapSurvivalKnife","MaxRange", 0.9); -- 0.85
TweakItem("BCGTools.CheapSurvivalKnife","BaseSpeed", 1.0); -- 1.0
TweakItem("BCGTools.CheapSurvivalKnife","ConditionMax", 9); -- 9
TweakItem("BCGTools.CheapSurvivalKnife","ConditionLowerChanceOneIn", 20); -- 20
TweakItem("BCGTools.CheapSurvivalKnife","CriticalChance", 40); -- 30
TweakItem("BCGTools.CheapSurvivalKnife","CritDmgMultiplier", 2); -- 3
TweakItem("BCGTools.CheapSurvivalKnife","DoorDamage", 2); -- 1
TweakItem("BCGTools.CheapSurvivalKnife","TreeDamage", 2); -- 2
TweakItem("BCGTools.CheapSurvivalKnife","Knockback", 0.3); -- 0.3
TweakItem("BCGTools.CheapSurvivalKnife","KnockdownMod", 0); -- 0
TweakItem("BCGTools.CheapSurvivalKnife","EnduranceMod", 1.0); -- 
-- Spear with Cheap Survival Knife
TweakItem("BCGTools.SpearCheapSurvivalKnife","Weight", 1.9); -- 2.1
TweakItem("BCGTools.SpearCheapSurvivalKnife","MinDamage", 0.85); -- 1.2
TweakItem("BCGTools.SpearCheapSurvivalKnife","MaxDamage", 1.7); -- 1.6
TweakItem("BCGTools.SpearCheapSurvivalKnife","MaxRange", 1.48); -- 1.45
TweakItem("BCGTools.SpearCheapSurvivalKnife","BaseSpeed", 0.97); -- 1.0
TweakItem("BCGTools.SpearCheapSurvivalKnife","ConditionMax", 9); -- 8
TweakItem("BCGTools.SpearCheapSurvivalKnife","ConditionLowerChanceOneIn", 20); -- 10
TweakItem("BCGTools.SpearCheapSurvivalKnife","CriticalChance", 15); -- 30
TweakItem("BCGTools.SpearCheapSurvivalKnife","CritDmgMultiplier", 2); -- 10
TweakItem("BCGTools.SpearCheapSurvivalKnife","DoorDamage", 3); -- 8
TweakItem("BCGTools.SpearCheapSurvivalKnife","TreeDamage", 2); -- 0
TweakItem("BCGTools.SpearCheapSurvivalKnife","Knockback", 0.3); -- 0.3
TweakItem("BCGTools.SpearCheapSurvivalKnife","KnockdownMod", 0); -- 0

-- Survival Knife
TweakItem("BCGTools.SurvivalKnife","Weight", 0.7); -- 0.7
TweakItem("BCGTools.SurvivalKnife","MinDamage", 0.75); -- 0.8
TweakItem("BCGTools.SurvivalKnife","MaxDamage", 1.5); -- 1.6
TweakItem("BCGTools.SurvivalKnife","MaxRange", 0.96); -- 0.9
TweakItem("BCGTools.SurvivalKnife","BaseSpeed", 0.95); -- 0.95
TweakItem("BCGTools.SurvivalKnife","ConditionMax", 12); -- 10
TweakItem("BCGTools.SurvivalKnife","ConditionLowerChanceOneIn", 22); -- 20
TweakItem("BCGTools.SurvivalKnife","CriticalChance", 60); -- 50
TweakItem("BCGTools.SurvivalKnife","CritDmgMultiplier", 2); -- 3
TweakItem("BCGTools.SurvivalKnife","DoorDamage", 5); -- 1
TweakItem("BCGTools.SurvivalKnife","TreeDamage", 5); -- 2
TweakItem("BCGTools.SurvivalKnife","Knockback", 0.3); -- 0.3
TweakItem("BCGTools.SurvivalKnife","KnockdownMod", 0); -- 0
TweakItem("BCGTools.SurvivalKnife","EnduranceMod", 1.0); -- 0.5
-- Spear with Survival Knife
TweakItem("BCGTools.SpearSurvivalKnife","Weight", 2.3); -- 2.4
TweakItem("BCGTools.SpearSurvivalKnife","MinDamage", 1.0); -- 1.3
TweakItem("BCGTools.SpearSurvivalKnife","MaxDamage", 1.95); -- 1.9
TweakItem("BCGTools.SpearSurvivalKnife","MaxRange", 1.51); -- 1.50
TweakItem("BCGTools.SpearSurvivalKnife","BaseSpeed", 0.9); -- 1.0
TweakItem("BCGTools.SpearSurvivalKnife","ConditionMax", 12); -- 10
TweakItem("BCGTools.SpearSurvivalKnife","ConditionLowerChanceOneIn", 22); -- 12
TweakItem("BCGTools.SpearSurvivalKnife","CriticalChance", 20); -- 30
TweakItem("BCGTools.SpearSurvivalKnife","CritDmgMultiplier", 2); -- 10
TweakItem("BCGTools.SpearSurvivalKnife","DoorDamage", 2); -- 8
TweakItem("BCGTools.SpearSurvivalKnife","TreeDamage", 2); -- 0
TweakItem("BCGTools.SpearSurvivalKnife","Knockback", 0.3); -- 0.3
TweakItem("BCGTools.SpearSurvivalKnife","KnockdownMod", 0); -- 0

-- Kukri Machete
TweakItem("BCGTools.KukriMachete","Weight", 2.2); -- 2.2
TweakItem("BCGTools.KukriMachete","MinDamage", 2.4); -- 2.4
TweakItem("BCGTools.KukriMachete","MaxDamage", 3.4); -- 3.4
TweakItem("BCGTools.KukriMachete","MaxRange", 1.22); -- 1.20
TweakItem("BCGTools.KukriMachete","BaseSpeed", 0.95); -- 0.95
TweakItem("BCGTools.KukriMachete","ConditionMax", 15); -- 15
TweakItem("BCGTools.KukriMachete","ConditionLowerChanceOneIn", 25); -- 25
TweakItem("BCGTools.KukriMachete","CriticalChance", 30); -- 30
TweakItem("BCGTools.KukriMachete","CritDmgMultiplier", 5); -- 5
TweakItem("BCGTools.KukriMachete","DoorDamage", 17); -- 15
TweakItem("BCGTools.KukriMachete","TreeDamage", 17); -- 15
TweakItem("BCGTools.KukriMachete","Knockback", 0.3); -- 0.3
TweakItem("BCGTools.KukriMachete","KnockdownMod", 2); -- 2
-- Spear with Kukri Machete
TweakItem("BCGTools.SpearKukriMachete","Weight", 3.8); -- 3.7
TweakItem("BCGTools.SpearKukriMachete","MinDamage", 1.8); -- 1.7
TweakItem("BCGTools.SpearKukriMachete","MaxDamage", 2.9); -- 2.4
TweakItem("BCGTools.SpearKukriMachete","MaxRange", 1.55); -- 1.20
TweakItem("BCGTools.SpearKukriMachete","BaseSpeed", 0.85); -- 0.95
TweakItem("BCGTools.SpearKukriMachete","ConditionMax", 15); -- 10
TweakItem("BCGTools.SpearKukriMachete","ConditionLowerChanceOneIn", 25); -- 12
TweakItem("BCGTools.SpearKukriMachete","CriticalChance", 12.5); -- 30
TweakItem("BCGTools.SpearKukriMachete","CritDmgMultiplier", 2); -- 5
TweakItem("BCGTools.SpearKukriMachete","DoorDamage", 18); -- 15
TweakItem("BCGTools.SpearKukriMachete","TreeDamage", 17); -- 15
TweakItem("BCGTools.SpearKukriMachete","Knockback", 0.3); -- 0.3
TweakItem("BCGTools.SpearKukriMachete","KnockdownMod", 0); -- 0


--||| Undead Survivor |||---
-- Prepper Knife - Stab
TweakItem("UndeadSurvivor.PrepperKnifeStab","Weight", 0.4); -- 0.3
TweakItem("UndeadSurvivor.PrepperKnifeStab","MinDamage", 0.6); -- 0.7
TweakItem("UndeadSurvivor.PrepperKnifeStab","MaxDamage", 1.2); -- 1.2
TweakItem("UndeadSurvivor.PrepperKnifeStab","MaxRange", 0.85); -- 0.85
TweakItem("UndeadSurvivor.PrepperKnifeStab","BaseSpeed", 1.05); -- 1.1
TweakItem("UndeadSurvivor.PrepperKnifeStab","ConditionMax", 12); -- 25
TweakItem("UndeadSurvivor.PrepperKnifeStab","ConditionLowerChanceOneIn", 38); -- 20
TweakItem("UndeadSurvivor.PrepperKnifeStab","CriticalChance", 60); -- 60
TweakItem("UndeadSurvivor.PrepperKnifeStab","CritDmgMultiplier", 2); -- 3
TweakItem("UndeadSurvivor.PrepperKnifeStab","DoorDamage", 3); -- 2
TweakItem("UndeadSurvivor.PrepperKnifeStab","TreeDamage", 3); -- 1
TweakItem("UndeadSurvivor.PrepperKnifeStab","Knockback", 0.3); -- 0.3
TweakItem("UndeadSurvivor.PrepperKnifeStab","KnockdownMod", 0); -- 0
TweakItem("UndeadSurvivor.PrepperKnifeStab","EnduranceMod", 1.0); -- 0.5

-- Prepper Knife - Swing
TweakItem("UndeadSurvivor.PrepperKnifeSwing","Weight", 0.4); -- 0.3
TweakItem("UndeadSurvivor.PrepperKnifeSwing","MinDamage", 0.6); -- 0.7
TweakItem("UndeadSurvivor.PrepperKnifeSwing","MaxDamage", 1.2); -- 1.2
TweakItem("UndeadSurvivor.PrepperKnifeSwing","MaxRange", 0.87); -- 0.85
TweakItem("UndeadSurvivor.PrepperKnifeSwing","BaseSpeed", 1.4); -- 1.4
TweakItem("UndeadSurvivor.PrepperKnifeSwing","ConditionMax", 12); -- 25
TweakItem("UndeadSurvivor.PrepperKnifeSwing","ConditionLowerChanceOneIn", 34); -- 20
TweakItem("UndeadSurvivor.PrepperKnifeSwing","CriticalChance", 30); -- 35
TweakItem("UndeadSurvivor.PrepperKnifeSwing","CritDmgMultiplier", 4); -- 3
TweakItem("UndeadSurvivor.PrepperKnifeSwing","DoorDamage", 3); -- 2
TweakItem("UndeadSurvivor.PrepperKnifeSwing","TreeDamage", 3); -- 1
TweakItem("UndeadSurvivor.PrepperKnifeSwing","Knockback", 0.3); -- 0.3
TweakItem("UndeadSurvivor.PrepperKnifeSwing","KnockdownMod", 0); -- 0
TweakItem("UndeadSurvivor.PrepperKnifeSwing","EnduranceMod", 1.0); -- 0.5

-- Prepper Knife Knock
TweakItem("UndeadSurvivor.PrepperKnifeKnock","ConditionMax", 12); -- 25
TweakItem("UndeadSurvivor.PrepperKnifeKnock","ConditionLowerChanceOneIn", 42); -- 10

-- Stalker Knife
TweakItem("UndeadSurvivor.StalkerKnife","Weight", 1.6); -- 1.6
TweakItem("UndeadSurvivor.StalkerKnife","MinDamage", 2); -- 2
TweakItem("UndeadSurvivor.StalkerKnife","MaxDamage", 3); -- 3
TweakItem("UndeadSurvivor.StalkerKnife","MaxRange", 1.20); -- 1.23
TweakItem("UndeadSurvivor.StalkerKnife","BaseSpeed", 1.1); -- 1.1
TweakItem("UndeadSurvivor.StalkerKnife","ConditionMax", 20); -- 22
TweakItem("UndeadSurvivor.StalkerKnife","ConditionLowerChanceOneIn", 24); -- 20
TweakItem("UndeadSurvivor.StalkerKnife","CriticalChance", 20); -- 30
TweakItem("UndeadSurvivor.StalkerKnife","CritDmgMultiplier", 5); -- 5
TweakItem("UndeadSurvivor.StalkerKnife","DoorDamage", 12); -- 7
TweakItem("UndeadSurvivor.StalkerKnife","TreeDamage", 12); -- 10
TweakItem("UndeadSurvivor.StalkerKnife","Knockback", 0.3); -- 0.3
TweakItem("UndeadSurvivor.StalkerKnife","KnockdownMod", 2); -- 2

-- AmazonaSpear
TweakItem("UndeadSurvivor.AmazonaSpear","Weight", 2.0); -- 1.5
TweakItem("UndeadSurvivor.AmazonaSpear","MinDamage", 1.0); -- 1.0
TweakItem("UndeadSurvivor.AmazonaSpear","MaxDamage", 2.0); -- 1.5
TweakItem("UndeadSurvivor.AmazonaSpear","MinRange", 0.61); -- 0.61
TweakItem("UndeadSurvivor.AmazonaSpear","MaxRange", 1.48); -- 1.37
TweakItem("UndeadSurvivor.AmazonaSpear","BaseSpeed", 1.0); -- 0.9
TweakItem("UndeadSurvivor.AmazonaSpear","ConditionMax", 12); -- 10
TweakItem("UndeadSurvivor.AmazonaSpear","ConditionLowerChanceOneIn", 30); -- 15
TweakItem("UndeadSurvivor.AmazonaSpear","CriticalChance", 20); -- 30
TweakItem("UndeadSurvivor.AmazonaSpear","CritDmgMultiplier", 2); -- 10
TweakItem("UndeadSurvivor.AmazonaSpear","DoorDamage", 8); -- 7
TweakItem("UndeadSurvivor.AmazonaSpear","TreeDamage", 0); -- 0
TweakItem("UndeadSurvivor.AmazonaSpear","Knockback", 0.3); -- 0.3
TweakItem("UndeadSurvivor.AmazonaSpear","KnockdownMod", 0); -- 0


--- /// OTHER MODS COMPATIBILITY /// ---

--||| Madax Weapon Pack |||---
-- Cold Steel Spear 
TweakItem("MWPWeapons.coldsteelspear","Weight", 2.0); -- 1.7
TweakItem("MWPWeapons.coldsteelspear","MinDamage", 1.0); -- 1.3
TweakItem("MWPWeapons.coldsteelspear","MaxDamage", 2.0); -- 2.5
TweakItem("MWPWeapons.coldsteelspear","MinRange", 0.74); -- 0.61
TweakItem("MWPWeapons.coldsteelspear","MaxRange", 1.48); -- 1.37
TweakItem("MWPWeapons.coldsteelspear","BaseSpeed", 0.9); -- 0.9
TweakItem("MWPWeapons.coldsteelspear","ConditionMax", 14); -- 14
TweakItem("MWPWeapons.coldsteelspear","ConditionLowerChanceOneIn", 24); -- 10
TweakItem("MWPWeapons.coldsteelspear","CriticalChance", 15); -- 30
TweakItem("MWPWeapons.coldsteelspear","CritDmgMultiplier", 2); -- 10
TweakItem("MWPWeapons.coldsteelspear","DoorDamage", 12); -- 7
TweakItem("MWPWeapons.coldsteelspear","TreeDamage", 0); -- 0
TweakItem("MWPWeapons.coldsteelspear","Knockback", 0.3); -- 0.3
TweakItem("MWPWeapons.coldsteelspear","KnockdownMod", 0); -- 0

-- Aitormontero Bowieknife
TweakItem("MWPWeapons.aitormonterobowieknife","Weight", 0.8); -- 0.8
TweakItem("MWPWeapons.aitormonterobowieknife","MinDamage", 0.8); -- 1
TweakItem("MWPWeapons.aitormonterobowieknife","MaxDamage", 1.6); -- 2
TweakItem("MWPWeapons.aitormonterobowieknife","MaxRange", 0.9); -- 0.9
TweakItem("MWPWeapons.aitormonterobowieknife","BaseSpeed", 1.0); -- 1.0
TweakItem("MWPWeapons.aitormonterobowieknife","ConditionMax", 12); -- 12
TweakItem("MWPWeapons.aitormonterobowieknife","ConditionLowerChanceOneIn", 22); -- 15
TweakItem("MWPWeapons.aitormonterobowieknife","CriticalChance", 60); -- 50
TweakItem("MWPWeapons.aitormonterobowieknife","CritDmgMultiplier", 2); -- 3
TweakItem("MWPWeapons.aitormonterobowieknife","DoorDamage", 3); -- 1
TweakItem("MWPWeapons.aitormonterobowieknife","TreeDamage", 3); -- 2
TweakItem("MWPWeapons.aitormonterobowieknife","EnduranceMod", 1.0); -- 0.6

-- Arlia Butterfly knife
TweakItem("MWPWeapons.arliabutterflyknife","Weight", 0.4); -- 0.4
TweakItem("MWPWeapons.arliabutterflyknife","MinDamage", 0.6); -- 0.8
TweakItem("MWPWeapons.arliabutterflyknife","MaxDamage", 1.2); -- 1.7
TweakItem("MWPWeapons.arliabutterflyknife","MaxRange", 0.88); -- 0.9
TweakItem("MWPWeapons.arliabutterflyknife","BaseSpeed", 1.1); -- 1.0
TweakItem("MWPWeapons.arliabutterflyknife","ConditionMax", 10); -- 8
TweakItem("MWPWeapons.arliabutterflyknife","ConditionLowerChanceOneIn", 18); -- 15
TweakItem("MWPWeapons.arliabutterflyknife","CriticalChance", 40); -- 50
TweakItem("MWPWeapons.arliabutterflyknife","CritDmgMultiplier", 2); -- 3
TweakItem("MWPWeapons.arliabutterflyknife","DoorDamage", 2); -- 1
TweakItem("MWPWeapons.arliabutterflyknife","TreeDamage", 2); -- 2
TweakItem("MWPWeapons.arliabutterflyknife","EnduranceMod", 1.0); -- 0.6

-- Assault V.Knife
TweakItem("MWPWeapons.assaultvknife","Weight", 0.7); -- 0.7
TweakItem("MWPWeapons.assaultvknife","MinDamage", 0.75); -- 0.8
TweakItem("MWPWeapons.assaultvknife","MaxDamage", 1.5); -- 1.7
TweakItem("MWPWeapons.assaultvknife","MaxRange", 0.9); -- 0.9
TweakItem("MWPWeapons.assaultvknife","BaseSpeed", 1.0); -- 1.0
TweakItem("MWPWeapons.assaultvknife","ConditionMax", 12); -- 12
TweakItem("MWPWeapons.assaultvknife","ConditionLowerChanceOneIn", 20); -- 15
TweakItem("MWPWeapons.assaultvknife","CriticalChance", 60); -- 50
TweakItem("MWPWeapons.assaultvknife","CritDmgMultiplier", 2); -- 3
TweakItem("MWPWeapons.assaultvknife","DoorDamage", 3); -- 1
TweakItem("MWPWeapons.assaultvknife","TreeDamage", 3); -- 2
TweakItem("MWPWeapons.assaultvknife","EnduranceMod", 1.0); -- 0.6

-- Blitalian Stiletto
TweakItem("MWPWeapons.blitalianstiletto","Weight", 0.4); -- 0.4
TweakItem("MWPWeapons.blitalianstiletto","MinDamage", 0.75); -- 1.2
TweakItem("MWPWeapons.blitalianstiletto","MaxDamage", 1.5); -- 2
TweakItem("MWPWeapons.blitalianstiletto","MaxRange", 0.90); -- 0.9
TweakItem("MWPWeapons.blitalianstiletto","BaseSpeed", 1.1); -- 1.0
TweakItem("MWPWeapons.blitalianstiletto","ConditionMax", 10); -- 8
TweakItem("MWPWeapons.blitalianstiletto","ConditionLowerChanceOneIn", 18); -- 15
TweakItem("MWPWeapons.blitalianstiletto","CriticalChance", 40); -- 50
TweakItem("MWPWeapons.blitalianstiletto","CritDmgMultiplier", 2); -- 3
TweakItem("MWPWeapons.blitalianstiletto","DoorDamage", 2); -- 1
TweakItem("MWPWeapons.blitalianstiletto","TreeDamage", 2); -- 2
TweakItem("MWPWeapons.blitalianstiletto","EnduranceMod", 1.0); -- 0.6

-- C.G Combat Tanto
TweakItem("MWPWeapons.cgcombattanto","Weight", 0.8); -- 0.8
TweakItem("MWPWeapons.cgcombattanto","MinDamage", 0.75); -- 0.8
TweakItem("MWPWeapons.cgcombattanto","MaxDamage", 1.5); -- 1.4
TweakItem("MWPWeapons.cgcombattanto","MaxRange", 0.9); -- 0.9
TweakItem("MWPWeapons.cgcombattanto","BaseSpeed", 1.0); -- 1.0
TweakItem("MWPWeapons.cgcombattanto","ConditionMax", 12); -- 12
TweakItem("MWPWeapons.cgcombattanto","ConditionLowerChanceOneIn", 22); -- 15
TweakItem("MWPWeapons.cgcombattanto","CriticalChance", 60); -- 50
TweakItem("MWPWeapons.cgcombattanto","CritDmgMultiplier", 2); -- 3
TweakItem("MWPWeapons.cgcombattanto","DoorDamage", 3); -- 1
TweakItem("MWPWeapons.cgcombattanto","TreeDamage", 3); -- 2
TweakItem("MWPWeapons.cgcombattanto","EnduranceMod", 1.0); -- 0.5

-- Kabar1245 Tanto Knife
TweakItem("MWPWeapons.kabar1245tanto","Weight", 0.8); -- 0.8
TweakItem("MWPWeapons.kabar1245tanto","MinDamage", 0.75); -- 0.7
TweakItem("MWPWeapons.kabar1245tanto","MaxDamage", 1.5); -- 1.9
TweakItem("MWPWeapons.kabar1245tanto","MaxRange", 0.9); -- 0.9
TweakItem("MWPWeapons.kabar1245tanto","BaseSpeed", 1.0); -- 1.0
TweakItem("MWPWeapons.kabar1245tanto","ConditionMax", 12); -- 12
TweakItem("MWPWeapons.kabar1245tanto","ConditionLowerChanceOneIn", 22); -- 15
TweakItem("MWPWeapons.kabar1245tanto","CriticalChance", 60); -- 50
TweakItem("MWPWeapons.kabar1245tanto","CritDmgMultiplier", 2); -- 3
TweakItem("MWPWeapons.kabar1245tanto","DoorDamage", 3); -- 1
TweakItem("MWPWeapons.kabar1245tanto","TreeDamage", 3); -- 2
TweakItem("MWPWeapons.kabar1245tanto","EnduranceMod", 1.0); -- 0.5

-- Khk Combat Knife
TweakItem("MWPWeapons.khkcombatknife","Weight", 0.7); -- 0.7
TweakItem("MWPWeapons.khkcombatknife","MinDamage", 0.6); -- 0.5
TweakItem("MWPWeapons.khkcombatknife","MaxDamage", 1.2); -- 1.5
TweakItem("MWPWeapons.khkcombatknife","MaxRange", 0.9); -- 0.9
TweakItem("MWPWeapons.khkcombatknife","BaseSpeed", 1.1); -- 1.0
TweakItem("MWPWeapons.khkcombatknife","ConditionMax", 10); -- 10
TweakItem("MWPWeapons.khkcombatknife","ConditionLowerChanceOneIn", 22); -- 15
TweakItem("MWPWeapons.khkcombatknife","CriticalChance", 60); -- 50
TweakItem("MWPWeapons.khkcombatknife","CritDmgMultiplier", 2); -- 3
TweakItem("MWPWeapons.khkcombatknife","DoorDamage", 3); -- 1
TweakItem("MWPWeapons.khkcombatknife","TreeDamage", 3); -- 2
TweakItem("MWPWeapons.khkcombatknife","EnduranceMod", 1.0); -- 0.5

-- Muela Hunting Knife
TweakItem("MWPWeapons.muelahuntingknife","Weight", 0.5); -- 0.7
TweakItem("MWPWeapons.muelahuntingknife","MinDamage", 0.6); -- 0.8
TweakItem("MWPWeapons.muelahuntingknife","MaxDamage", 1.2); -- 1.0
TweakItem("MWPWeapons.muelahuntingknife","MaxRange", 0.88); -- 0.9
TweakItem("MWPWeapons.muelahuntingknife","BaseSpeed", 1.1); -- 1.0
TweakItem("MWPWeapons.muelahuntingknife","ConditionMax", 12); -- 12
TweakItem("MWPWeapons.muelahuntingknife","ConditionLowerChanceOneIn", 18); -- 15
TweakItem("MWPWeapons.muelahuntingknife","CriticalChance", 40); -- 50
TweakItem("MWPWeapons.muelahuntingknife","CritDmgMultiplier", 2); -- 3
TweakItem("MWPWeapons.muelahuntingknife","DoorDamage", 3); -- 1
TweakItem("MWPWeapons.muelahuntingknife","TreeDamage", 3); -- 2
TweakItem("MWPWeapons.muelahuntingknife","EnduranceMod", 1.0); -- 0.5

-- Ontariookc10 Bayonet
TweakItem("MWPWeapons.ontariookc10bayonet","Weight", 0.6); -- 0.6
TweakItem("MWPWeapons.ontariookc10bayonet","MinDamage", 0.75); -- 1.2
TweakItem("MWPWeapons.ontariookc10bayonet","MaxDamage", 1.5); -- 1.6
TweakItem("MWPWeapons.ontariookc10bayonet","MaxRange", 0.9); -- 0.9
TweakItem("MWPWeapons.ontariookc10bayonet","BaseSpeed", 1.0); -- 1.0
TweakItem("MWPWeapons.ontariookc10bayonet","ConditionMax", 10); -- 11
TweakItem("MWPWeapons.ontariookc10bayonet","ConditionLowerChanceOneIn", 20); -- 15
TweakItem("MWPWeapons.ontariookc10bayonet","CriticalChance", 60); -- 50
TweakItem("MWPWeapons.ontariookc10bayonet","CritDmgMultiplier", 2); -- 3
TweakItem("MWPWeapons.ontariookc10bayonet","DoorDamage", 3); -- 1
TweakItem("MWPWeapons.ontariookc10bayonet","TreeDamage", 3); -- 2
TweakItem("MWPWeapons.ontariookc10bayonet","EnduranceMod", 1.0); -- 0.5

-- Rexler Kunai
TweakItem("MWPWeapons.rexlerkunai","Weight", 0.6); -- 0.5
TweakItem("MWPWeapons.rexlerkunai","MinDamage", 0.75); -- 0.8
TweakItem("MWPWeapons.rexlerkunai","MaxDamage", 1.5); -- 1.2
TweakItem("MWPWeapons.rexlerkunai","MaxRange", 0.9); -- 0.9
TweakItem("MWPWeapons.rexlerkunai","BaseSpeed", 1.1); -- 1.0
TweakItem("MWPWeapons.rexlerkunai","ConditionMax", 10); -- 11
TweakItem("MWPWeapons.rexlerkunai","ConditionLowerChanceOneIn", 20); -- 15
TweakItem("MWPWeapons.rexlerkunai","CriticalChance", 40); -- 50
TweakItem("MWPWeapons.rexlerkunai","CritDmgMultiplier", 2); -- 3
TweakItem("MWPWeapons.rexlerkunai","DoorDamage", 3); -- 1
TweakItem("MWPWeapons.rexlerkunai","TreeDamage", 3); -- 2
TweakItem("MWPWeapons.rexlerkunai","EnduranceMod", 1.0); -- 0.5

-- Russian AKM Bayonet
TweakItem("MWPWeapons.russianakmbayonet","Weight", 0.7); -- 0.7
TweakItem("MWPWeapons.russianakmbayonet","MinDamage", 0.75); -- 1.2
TweakItem("MWPWeapons.russianakmbayonet","MaxDamage", 1.5); -- 2.0
TweakItem("MWPWeapons.russianakmbayonet","MaxRange", 0.9); -- 0.9
TweakItem("MWPWeapons.russianakmbayonet","BaseSpeed", 1.0); -- 1.0
TweakItem("MWPWeapons.russianakmbayonet","ConditionMax", 10); -- 11
TweakItem("MWPWeapons.russianakmbayonet","ConditionLowerChanceOneIn", 20); -- 15
TweakItem("MWPWeapons.russianakmbayonet","CriticalChance", 60); -- 50
TweakItem("MWPWeapons.russianakmbayonet","CritDmgMultiplier", 2); -- 3
TweakItem("MWPWeapons.russianakmbayonet","DoorDamage", 3); -- 1
TweakItem("MWPWeapons.russianakmbayonet","TreeDamage", 3); -- 2
TweakItem("MWPWeapons.russianakmbayonet","EnduranceMod", 1.0); -- 0.5

-- Sogf19 Elite
TweakItem("MWPWeapons.sogf19nelite","Weight", 1.0); -- 0.7
TweakItem("MWPWeapons.sogf19nelite","MinDamage", 0.75); -- 0.8
TweakItem("MWPWeapons.sogf19nelite","MaxDamage", 1.5); -- 1.4
TweakItem("MWPWeapons.sogf19nelite","MaxRange", 1.20); -- 0.9
TweakItem("MWPWeapons.sogf19nelite","BaseSpeed", 0.90); -- 1.0
TweakItem("MWPWeapons.sogf19nelite","ConditionMax", 12); -- 11
TweakItem("MWPWeapons.sogf19nelite","ConditionLowerChanceOneIn", 20); -- 15
TweakItem("MWPWeapons.sogf19nelite","CriticalChance", 40); -- 50
TweakItem("MWPWeapons.sogf19nelite","CritDmgMultiplier", 2); -- 3
TweakItem("MWPWeapons.sogf19nelite","DoorDamage", 5); -- 1
TweakItem("MWPWeapons.sogf19nelite","TreeDamage", 5); -- 2
TweakItem("MWPWeapons.sogf19nelite","EnduranceMod", 1.0); -- 0.5

-- Yangjang Columbia Bayonet
TweakItem("MWPWeapons.yangjangcolumbiabayonet","Weight", 0.7); -- 1.0
TweakItem("MWPWeapons.yangjangcolumbiabayonet","MinDamage", 0.75); -- 0.9
TweakItem("MWPWeapons.yangjangcolumbiabayonet","MaxDamage", 1.5); -- 1.6
TweakItem("MWPWeapons.yangjangcolumbiabayonet","MaxRange", 0.9); -- 0.9
TweakItem("MWPWeapons.yangjangcolumbiabayonet","BaseSpeed", 1.0); -- 1.0
TweakItem("MWPWeapons.yangjangcolumbiabayonet","ConditionMax", 10); -- 11
TweakItem("MWPWeapons.yangjangcolumbiabayonet","ConditionLowerChanceOneIn", 20); -- 15
TweakItem("MWPWeapons.yangjangcolumbiabayonet","CriticalChance", 60); -- 50
TweakItem("MWPWeapons.yangjangcolumbiabayonet","CritDmgMultiplier", 2); -- 3
TweakItem("MWPWeapons.yangjangcolumbiabayonet","DoorDamage", 3); -- 1
TweakItem("MWPWeapons.yangjangcolumbiabayonet","TreeDamage", 3); -- 2
TweakItem("MWPWeapons.yangjangcolumbiabayonet","EnduranceMod", 1.0); -- 0.5

-- Hand Scythe
TweakItem("MWPWeapons.reapertacsickle","Weight", 1.0); -- 0.8
TweakItem("MWPWeapons.reapertacsickle","MinDamage", 0.7); -- 1.0
TweakItem("MWPWeapons.reapertacsickle","MaxDamage", 1.4); -- 1.8
TweakItem("MWPWeapons.reapertacsickle","MaxRange", 1.0); -- 1.1
TweakItem("MWPWeapons.reapertacsickle","BaseSpeed", 1.2); -- 1.1
TweakItem("MWPWeapons.reapertacsickle","ConditionMax", 10); -- 5
TweakItem("MWPWeapons.reapertacsickle","ConditionLowerChanceOneIn", 18); -- 5
TweakItem("MWPWeapons.reapertacsickle","CriticalChance", 30); -- 15
TweakItem("MWPWeapons.reapertacsickle","CritDmgMultiplier", 3); -- 5
TweakItem("MWPWeapons.reapertacsickle","DoorDamage", 2); -- 5
TweakItem("MWPWeapons.reapertacsickle","TreeDamage", 2); -- 0
TweakItem("MWPWeapons.reapertacsickle","Knockback", 0.3); -- 0.30.3
TweakItem("MWPWeapons.reapertacsickle","KnockdownMod", 2); -- 2
TweakItem("MWPWeapons.reapertacsickle","EnduranceMod", 1.0); -- 0.5

-- Britishp1856 Pioneers
--TweakItem("MWPWeapons.britishp1856pioneers","Weight", 2.0); -- 2.0
--TweakItem("MWPWeapons.britishp1856pioneers","MinDamage", 2.0); -- 1.4
--TweakItem("MWPWeapons.britishp1856pioneers","MaxDamage", 3.0); -- 2.6
--TweakItem("MWPWeapons.britishp1856pioneers","MaxRange", 1.20); -- 1.23
TweakItem("MWPWeapons.britishp1856pioneers","BaseSpeed", 1.0); -- 1.0
--TweakItem("MWPWeapons.britishp1856pioneers","ConditionMax", 13); -- 13
--TweakItem("MWPWeapons.britishp1856pioneers","ConditionLowerChanceOneIn", 25); -- 25
--TweakItem("MWPWeapons.britishp1856pioneers","CriticalChance", 20); -- 20
--TweakItem("MWPWeapons.britishp1856pioneers","CritDmgMultiplier", 5); -- 5
--TweakItem("MWPWeapons.britishp1856pioneers","DoorDamage", 15); -- 10
--TweakItem("MWPWeapons.britishp1856pioneers","TreeDamage", 15); -- 10
--TweakItem("MWPWeapons.britishp1856pioneers","Knockback", 0.3); -- 0.3
--TweakItem("MWPWeapons.britishp1856pioneers","KnockdownMod", 2); -- 2

-- C.R.T.K Kukri Machete
TweakItem("MWPWeapons.crtkkukrimachete","Weight", 2.1); -- 1.9
--TweakItem("MWPWeapons.crtkkukrimachete","MinDamage", 2.0); -- 1.4
--TweakItem("MWPWeapons.crtkkukrimachete","MaxDamage", 3.0); -- 2.6
TweakItem("MWPWeapons.crtkkukrimachete","MaxRange", 1.20); -- 1.23
TweakItem("MWPWeapons.crtkkukrimachete","BaseSpeed", 0.95); -- 1.1
--TweakItem("MWPWeapons.crtkkukrimachete","ConditionMax", 13); -- 13
--TweakItem("MWPWeapons.crtkkukrimachete","ConditionLowerChanceOneIn", 25); -- 25
--TweakItem("MWPWeapons.crtkkukrimachete","CriticalChance", 20); -- 20
--TweakItem("MWPWeapons.crtkkukrimachete","CritDmgMultiplier", 5); -- 5
--TweakItem("MWPWeapons.crtkkukrimachete","DoorDamage", 15); -- 10
--TweakItem("MWPWeapons.crtkkukrimachete","TreeDamage", 15); -- 10
--TweakItem("MWPWeapons.crtkkukrimachete","Knockback", 0.3); -- 0.3
--TweakItem("MWPWeapons.crtkkukrimachete","KnockdownMod", 2); -- 2

-- Defender.18 Machete
--TweakItem("MWPWeapons.defender18machete","Weight", 2.0); -- 2.0
--TweakItem("MWPWeapons.defender18machete","MinDamage", 2.0); -- 1.4
--TweakItem("MWPWeapons.defender18machete","MaxDamage", 3.0); -- 2.6
TweakItem("MWPWeapons.defender18machete","MaxRange", 1.20); -- 1.23
TweakItem("MWPWeapons.defender18machete","BaseSpeed", 0.95); -- 1.2
--TweakItem("MWPWeapons.defender18machete","ConditionMax", 13); -- 13
--TweakItem("MWPWeapons.defender18machete","ConditionLowerChanceOneIn", 25); -- 25
--TweakItem("MWPWeapons.defender18machete","CriticalChance", 20); -- 20
--TweakItem("MWPWeapons.defender18machete","CritDmgMultiplier", 5); -- 5
--TweakItem("MWPWeapons.defender18machete","DoorDamage", 15); -- 10
--TweakItem("MWPWeapons.defender18machete","TreeDamage", 15); -- 10
--TweakItem("MWPWeapons.defender18machete","Knockback", 0.3); -- 0.3
--TweakItem("MWPWeapons.defender18machete","KnockdownMod", 2); -- 2

-- Fiskar Curved Machete
TweakItem("MWPWeapons.fiskarcurvedmachete","Weight", 2.0); -- 1.8
TweakItem("MWPWeapons.fiskarcurvedmachete","MinDamage", 2.2); -- 2
TweakItem("MWPWeapons.fiskarcurvedmachete","MaxDamage", 3.2); -- 3.2
TweakItem("MWPWeapons.fiskarcurvedmachete","MaxRange", 1.2); -- 1.23
TweakItem("MWPWeapons.fiskarcurvedmachete","BaseSpeed", 1.0); -- 1.2
--TweakItem("MWPWeapons.fiskarcurvedmachete","ConditionMax", 13); -- 13
--TweakItem("MWPWeapons.fiskarcurvedmachete","ConditionLowerChanceOneIn", 25); -- 25
--TweakItem("MWPWeapons.fiskarcurvedmachete","CriticalChance", 20); -- 20
--TweakItem("MWPWeapons.fiskarcurvedmachete","CritDmgMultiplier", 5); -- 5
--TweakItem("MWPWeapons.fiskarcurvedmachete","DoorDamage", 15); -- 10
--TweakItem("MWPWeapons.fiskarcurvedmachete","TreeDamage", 15); -- 10
--TweakItem("MWPWeapons.fiskarcurvedmachete","Knockback", 0.3); -- 0.3
--TweakItem("MWPWeapons.fiskarcurvedmachete","KnockdownMod", 2); -- 2

-- Korek Machete
--TweakItem("MWPWeapons.korekmachete","Weight", 2.0); -- 1.8
TweakItem("MWPWeapons.korekmachete","MinDamage", 1.8); -- 2.1
TweakItem("MWPWeapons.korekmachete","MaxDamage", 2.8); -- 3.2
TweakItem("MWPWeapons.korekmachete","MaxRange", 1.2); -- 1.23
TweakItem("MWPWeapons.korekmachete","BaseSpeed", 1.0); -- 1.2
--TweakItem("MWPWeapons.korekmachete","ConditionMax", 13); -- 13
--TweakItem("MWPWeapons.korekmachete","ConditionLowerChanceOneIn", 25); -- 25
--TweakItem("MWPWeapons.korekmachete","CriticalChance", 20); -- 20
--TweakItem("MWPWeapons.korekmachete","CritDmgMultiplier", 5); -- 5
--TweakItem("MWPWeapons.korekmachete","DoorDamage", 15); -- 10
--TweakItem("MWPWeapons.korekmachete","TreeDamage", 15); -- 10
--TweakItem("MWPWeapons.korekmachete","Knockback", 0.3); -- 0.3
--TweakItem("MWPWeapons.korekmachete","KnockdownMod", 2); -- 2

-- Sog faritanto Machete
--TweakItem("MWPWeapons.sogfaritantomachete","Weight", 2.0); -- 1.8
--TweakItem("MWPWeapons.sogfaritantomachete","MinDamage", 1.8); -- 2.1
--TweakItem("MWPWeapons.sogfaritantomachete","MaxDamage", 2.8); -- 3.2
TweakItem("MWPWeapons.sogfaritantomachete","MaxRange", 1.20); -- 1.23
--TweakItem("MWPWeapons.sogfaritantomachete","BaseSpeed", 1.00); -- 1.2
--TweakItem("MWPWeapons.sogfaritantomachete","ConditionMax", 13); -- 13
--TweakItem("MWPWeapons.sogfaritantomachete","ConditionLowerChanceOneIn", 25); -- 25
--TweakItem("MWPWeapons.sogfaritantomachete","CriticalChance", 20); -- 20
--TweakItem("MWPWeapons.sogfaritantomachete","CritDmgMultiplier", 5); -- 5
TweakItem("MWPWeapons.sogfaritantomachete","DoorDamage", 15); -- 10
TweakItem("MWPWeapons.sogfaritantomachete","TreeDamage", 15); -- 10
--TweakItem("MWPWeapons.sogfaritantomachete","Knockback", 0.3); -- 0.3
--TweakItem("MWPWeapons.sogfaritantomachete","KnockdownMod", 2); -- 2

-- US Taiga Machete
TweakItem("MWPWeapons.taigamachete","Weight", 1.6); -- 1.5
TweakItem("MWPWeapons.taigamachete","MinDamage", 1.6); -- 2.1
TweakItem("MWPWeapons.taigamachete","MaxDamage", 2.6); -- 3.2
TweakItem("MWPWeapons.taigamachete","MaxRange", 1.1); -- 1.23
--TweakItem("MWPWeapons.taigamachete","BaseSpeed", 1.00); -- 1.2
--TweakItem("MWPWeapons.taigamachete","ConditionMax", 13); -- 13
--TweakItem("MWPWeapons.taigamachete","ConditionLowerChanceOneIn", 25); -- 25
--TweakItem("MWPWeapons.taigamachete","CriticalChance", 20); -- 20
--TweakItem("MWPWeapons.taigamachete","CritDmgMultiplier", 5); -- 5
TweakItem("MWPWeapons.taigamachete","DoorDamage", 20); -- 10
TweakItem("MWPWeapons.taigamachete","TreeDamage", 20); -- 10
--TweakItem("MWPWeapons.taigamachete","Knockback", 0.3); -- 0.3
--TweakItem("MWPWeapons.taigamachete","KnockdownMod", 2); -- 2

-- Zhunter Hook Machete
TweakItem("MWPWeapons.zhunterhookmachete","Weight", 2.0); -- 1.8
TweakItem("MWPWeapons.zhunterhookmachete","MinDamage", 1.8); -- 2.1
TweakItem("MWPWeapons.zhunterhookmachete","MaxDamage", 2.8); -- 3.2
TweakItem("MWPWeapons.zhunterhookmachete","MaxRange", 1.20); -- 1.23
TweakItem("MWPWeapons.zhunterhookmachete","BaseSpeed", 1.10); -- 1.2
--TweakItem("MWPWeapons.zhunterhookmachete","ConditionMax", 13); -- 13
--TweakItem("MWPWeapons.zhunterhookmachete","ConditionLowerChanceOneIn", 25); -- 25
--TweakItem("MWPWeapons.zhunterhookmachete","CriticalChance", 20); -- 20
--TweakItem("MWPWeapons.zhunterhookmachete","CritDmgMultiplier", 5); -- 5
--TweakItem("MWPWeapons.zhunterhookmachete","DoorDamage", 15); -- 10
--TweakItem("MWPWeapons.zhunterhookmachete","TreeDamage", 15); -- 10
--TweakItem("MWPWeapons.zhunterhookmachete","Knockback", 0.3); -- 0.3
--TweakItem("MWPWeapons.zhunterhookmachete","KnockdownMod", 2); -- 2

-- Goth Samurai Sword | gothsamuraisword
-- Reaver Cleaver | reavercleaver
-- Synthetic Sword | syntheticsword

--||| Scrap Weapons |||---
-- Sharpened Screwdriver
TweakItem("SWeapons.SharpenedScrewdriver","Weight", 0.3); -- 0.4
TweakItem("SWeapons.SharpenedScrewdriver","MinDamage", 0.45); -- 0.3
TweakItem("SWeapons.SharpenedScrewdriver","MaxDamage", 0.9); -- 0.7
TweakItem("SWeapons.SharpenedScrewdriver","MinRange", 0.61); -- 0.81
TweakItem("SWeapons.SharpenedScrewdriver","MaxRange", 0.88); -- 0.85
TweakItem("SWeapons.SharpenedScrewdriver","BaseSpeed", 1.0); -- 1.0
TweakItem("SWeapons.SharpenedScrewdriver","ConditionMax", 6); -- 13
TweakItem("SWeapons.SharpenedScrewdriver","ConditionLowerChanceOneIn", 18); -- 4
TweakItem("SWeapons.SharpenedScrewdriver","CriticalChance", 40); -- 40
TweakItem("SWeapons.SharpenedScrewdriver","CritDmgMultiplier", 2); -- 4
TweakItem("SWeapons.SharpenedScrewdriver","DoorDamage", 1); -- 1
TweakItem("SWeapons.SharpenedScrewdriver","TreeDamage", 1); -- 1
TweakItem("SWeapons.SharpenedScrewdriver","EnduranceMod", 1.0); -- 0.5
-- Spear with Sharpened Screwdriver
TweakItem("SWeapons.SpearSharpenedScrewdriver","Weight", 1.9); -- 2.1
TweakItem("SWeapons.SpearSharpenedScrewdriver","MinDamage", 0.8); -- 1.2
TweakItem("SWeapons.SpearSharpenedScrewdriver","MaxDamage", 1.65); -- 1.6
TweakItem("SWeapons.SpearSharpenedScrewdriver","MinRange", 0.74); -- 0.98
TweakItem("SWeapons.SpearSharpenedScrewdriver","MaxRange", 1.48); -- 1.45
TweakItem("SWeapons.SpearSharpenedScrewdriver","BaseSpeed", 0.95); -- 1.0
TweakItem("SWeapons.SpearSharpenedScrewdriver","ConditionMax", 6); -- 7
TweakItem("SWeapons.SpearSharpenedScrewdriver","ConditionLowerChanceOneIn", 18); -- 4
TweakItem("SWeapons.SpearSharpenedScrewdriver","CriticalChance", 15); -- 30
TweakItem("SWeapons.SpearSharpenedScrewdriver","CritDmgMultiplier", 2); -- 10
TweakItem("SWeapons.SpearSharpenedScrewdriver","DoorDamage", 2); -- 7
TweakItem("SWeapons.SpearSharpenedScrewdriver","TreeDamage", 1); -- 0
TweakItem("SWeapons.SpearSharpenedScrewdriver","Knockback", 0.3); -- 0.3
TweakItem("SWeapons.SpearSharpenedScrewdriver","KnockdownMod", 0); -- 0

-- Glass Shiv
TweakItem("SWeapons.GlassShiv","Weight", 0.2); -- 0.4
TweakItem("SWeapons.GlassShiv","MinDamage", 0.2); -- 0.3
TweakItem("SWeapons.GlassShiv","MaxDamage", 0.8); -- 0.7
TweakItem("SWeapons.GlassShiv","MinRange", 0.61); -- 0.81
TweakItem("SWeapons.GlassShiv","MaxRange", 0.85); -- 0.85
TweakItem("SWeapons.GlassShiv","BaseSpeed", 1.0); -- 1.0
TweakItem("SWeapons.GlassShiv","ConditionMax", 6); -- 13
TweakItem("SWeapons.GlassShiv","ConditionLowerChanceOneIn", 4); -- 2
TweakItem("SWeapons.GlassShiv","CriticalChance", 20); -- 40
TweakItem("SWeapons.GlassShiv","CritDmgMultiplier", 2); -- 4
TweakItem("SWeapons.GlassShiv","DoorDamage", 1); -- 1
TweakItem("SWeapons.GlassShiv","TreeDamage", 1); -- 1
TweakItem("SWeapons.GlassShiv","EnduranceMod", 1.0); -- 0.5

-- Scrap Shiv
TweakItem("SWeapons.ScrapShiv","Weight", 0.4); -- 0.3
TweakItem("SWeapons.ScrapShiv","MinDamage", 0.5); -- 0.4
TweakItem("SWeapons.ScrapShiv","MaxDamage", 1.0); -- 0.8
TweakItem("SWeapons.ScrapShiv","MinRange", 0.61); -- 0.81
TweakItem("SWeapons.ScrapShiv","MaxRange", 0.88); -- 0.85
TweakItem("SWeapons.ScrapShiv","BaseSpeed", 1.0); -- 1.0
TweakItem("SWeapons.ScrapShiv","ConditionMax", 8); -- 10
TweakItem("SWeapons.ScrapShiv","ConditionLowerChanceOneIn", 12); -- 4
TweakItem("SWeapons.ScrapShiv","CriticalChance", 40); -- 40
TweakItem("SWeapons.ScrapShiv","CritDmgMultiplier", 2); -- 4
TweakItem("SWeapons.ScrapShiv","DoorDamage", 1); -- 1
TweakItem("SWeapons.ScrapShiv","TreeDamage", 1); -- 1
TweakItem("SWeapons.ScrapShiv","EnduranceMod", 1.0); -- 0.5
-- Spear with Scrap Shiv
TweakItem("SWeapons.SpearScrapShiv","Weight", 2.0); -- 2.1
TweakItem("SWeapons.SpearScrapShiv","MinDamage", 0.85); -- 1.2
TweakItem("SWeapons.SpearScrapShiv","MaxDamage", 1.7); -- 1.6
TweakItem("SWeapons.SpearScrapShiv","MinRange", 0.74); -- 0.98
TweakItem("SWeapons.SpearScrapShiv","MaxRange", 1.48); -- 1.45
TweakItem("SWeapons.SpearScrapShiv","BaseSpeed", 0.97); -- 1.0
TweakItem("SWeapons.SpearScrapShiv","ConditionMax", 8); -- 7
TweakItem("SWeapons.SpearScrapShiv","ConditionLowerChanceOneIn", 12); -- 4
TweakItem("SWeapons.SpearScrapShiv","CriticalChance", 15); -- 30
TweakItem("SWeapons.SpearScrapShiv","CritDmgMultiplier", 2); -- 10
TweakItem("SWeapons.SpearScrapShiv","DoorDamage", 2); -- 7
TweakItem("SWeapons.SpearScrapShiv","TreeDamage", 1); -- 0
TweakItem("SWeapons.SpearScrapShiv","Knockback", 0.3); -- 0.3
TweakItem("SWeapons.SpearScrapShiv","KnockdownMod", 0); -- 0

-- Salvaged Shiv
TweakItem("SWeapons.SalvagedShiv","Weight", 0.5); -- 0.3
TweakItem("SWeapons.SalvagedShiv","MinDamage", 0.6); -- 0.4
TweakItem("SWeapons.SalvagedShiv","MaxDamage", 1.2); -- 1.8
TweakItem("SWeapons.SalvagedShiv","MinRange", 0.61); -- 0.81
TweakItem("SWeapons.SalvagedShiv","MaxRange", 0.90); -- 0.9
TweakItem("SWeapons.SalvagedShiv","BaseSpeed", 1.0); -- 1.0
TweakItem("SWeapons.SalvagedShiv","ConditionMax", 10); -- 30
TweakItem("SWeapons.SalvagedShiv","ConditionLowerChanceOneIn", 18); -- 6
TweakItem("SWeapons.SalvagedShiv","CriticalChance", 60); -- 40
TweakItem("SWeapons.SalvagedShiv","CritDmgMultiplier", 2); -- 4
TweakItem("SWeapons.SalvagedShiv","DoorDamage", 3); -- 1
TweakItem("SWeapons.SalvagedShiv","TreeDamage", 3); -- 1
TweakItem("SWeapons.SalvagedShiv","EnduranceMod", 1.0); -- 0.5

-- Salvaged Shiv Swing
TweakItem("SWeapons.SalvagedShivO","Weight", 0.5); -- 0.3
TweakItem("SWeapons.SalvagedShivO","MinDamage", 0.6); -- 0.9
TweakItem("SWeapons.SalvagedShivO","MaxDamage", 1.2); -- 1.5
TweakItem("SWeapons.SalvagedShivO","MinRange", 0.61); -- 0.81
TweakItem("SWeapons.SalvagedShivO","MaxRange", 0.90); -- 0.9
TweakItem("SWeapons.SalvagedShivO","BaseSpeed", 1.2); -- 1.0
TweakItem("SWeapons.SalvagedShivO","ConditionMax", 10); -- 10
TweakItem("SWeapons.SalvagedShivO","ConditionLowerChanceOneIn", 18); -- 6
TweakItem("SWeapons.SalvagedShivO","CriticalChance", 20); -- 30
TweakItem("SWeapons.SalvagedShivO","CritDmgMultiplier", 3); -- 4
TweakItem("SWeapons.SalvagedShivO","DoorDamage", 3); -- 1
TweakItem("SWeapons.SalvagedShivO","TreeDamage", 3); -- 1
TweakItem("SWeapons.SalvagedShivO","EnduranceMod", 1.0); -- 0.5

-- Scrap Machete
TweakItem("SWeapons.ScrapMachete","Weight", 1.5); -- 1.5
TweakItem("SWeapons.ScrapMachete","MinDamage", 0.8); -- 1.0
TweakItem("SWeapons.ScrapMachete","MaxDamage", 1.8); -- 1.8
TweakItem("SWeapons.ScrapMachete","MaxRange", 1.20); -- 1.20
TweakItem("SWeapons.ScrapMachete","BaseSpeed", 0.95); -- 0.9
TweakItem("SWeapons.ScrapMachete","ConditionMax", 8); -- 12
TweakItem("SWeapons.ScrapMachete","ConditionLowerChanceOneIn", 10); -- 5
TweakItem("SWeapons.ScrapMachete","CriticalChance", 10); -- 20
TweakItem("SWeapons.ScrapMachete","CritDmgMultiplier", 4); -- 5
TweakItem("SWeapons.ScrapMachete","DoorDamage", 8); -- 10
TweakItem("SWeapons.ScrapMachete","TreeDamage", 8); -- 10
TweakItem("SWeapons.ScrapMachete","Knockback", 0.3); -- 0.3
TweakItem("SWeapons.ScrapMachete","KnockdownMod", 2); -- 2
-- Spear with Scrap Machete
TweakItem("SWeapons.SpearScrapMachete","Weight", 3.1); -- 3.7
TweakItem("SWeapons.SpearScrapMachete","MinDamage", 1.0); -- 1.3
TweakItem("SWeapons.SpearScrapMachete","MaxDamage", 2.1); -- 2.0
TweakItem("SWeapons.SpearScrapMachete","MinRange", 0.74); -- 0.98
TweakItem("SWeapons.SpearScrapMachete","MaxRange", 1.55); -- 1.55
TweakItem("SWeapons.SpearScrapMachete","BaseSpeed", 0.85); -- 0.9
TweakItem("SWeapons.SpearScrapMachete","ConditionMax", 8); -- 12
TweakItem("SWeapons.SpearScrapMachete","ConditionLowerChanceOneIn", 10); -- 10
TweakItem("SWeapons.SpearScrapMachete","CriticalChance", 7.5); -- 30
TweakItem("SWeapons.SpearScrapMachete","CritDmgMultiplier", 2); -- 10
TweakItem("SWeapons.SpearScrapMachete","DoorDamage", 9); -- 2
TweakItem("SWeapons.SpearScrapMachete","TreeDamage", 8); -- 10
TweakItem("SWeapons.SpearScrapMachete","Knockback", 0.3); -- 0.3
TweakItem("SWeapons.SpearScrapMachete","KnockdownMod", 0); -- 0

-- Salvaged Machete
TweakItem("SWeapons.SalvagedMachete","Weight", 1.8); -- 2.0
TweakItem("SWeapons.SalvagedMachete","MinDamage", 1.3); -- 1.3
TweakItem("SWeapons.SalvagedMachete","MaxDamage", 2.3); -- 2.3
TweakItem("SWeapons.SalvagedMachete","MaxRange", 1.20); -- 1.20
TweakItem("SWeapons.SalvagedMachete","BaseSpeed", 0.95); -- 0.9
TweakItem("SWeapons.SalvagedMachete","ConditionMax", 12); -- 16
TweakItem("SWeapons.SalvagedMachete","ConditionLowerChanceOneIn", 12); -- 6
TweakItem("SWeapons.SalvagedMachete","CriticalChance", 20); -- 20
TweakItem("SWeapons.SalvagedMachete","CritDmgMultiplier", 5); -- 5
TweakItem("SWeapons.SalvagedMachete","DoorDamage", 15); -- 10
TweakItem("SWeapons.SalvagedMachete","TreeDamage", 15); -- 20
TweakItem("SWeapons.SalvagedMachete","Knockback", 0.3); -- 0.3
TweakItem("SWeapons.SalvagedMachete","KnockdownMod", 2); -- 2

-- Scrap Sword
TweakItem("SWeapons.ScrapSword","Weight", 2.6); -- 2.2
TweakItem("SWeapons.ScrapSword","MinDamage", 1.4); -- 1.4
TweakItem("SWeapons.ScrapSword","MaxDamage", 2.4); -- 2.5
TweakItem("SWeapons.ScrapSword","MaxRange", 1.45); -- 1.5
TweakItem("SWeapons.ScrapSword","BaseSpeed", 0.8); -- 0.8
TweakItem("SWeapons.ScrapSword","ConditionMax", 8); -- 15
TweakItem("SWeapons.ScrapSword","ConditionLowerChanceOneIn", 10); -- 5
TweakItem("SWeapons.ScrapSword","CriticalChance", 10); -- 20
TweakItem("SWeapons.ScrapSword","CritDmgMultiplier", 5); -- 5
TweakItem("SWeapons.ScrapSword","DoorDamage", 8); -- 10
TweakItem("SWeapons.ScrapSword","TreeDamage", 8); -- 8
TweakItem("SWeapons.ScrapSword","Knockback", 0.3); -- 0.3
TweakItem("SWeapons.ScrapSword","KnockdownMod", 2); -- 2

-- Scrap Blade
TweakItem("SWeapons.ScrapBlade","Weight", 2.0); -- 2.0
TweakItem("SWeapons.ScrapBlade","MinDamage", 1.2); -- 1.2
TweakItem("SWeapons.ScrapBlade","MaxDamage", 1.8); -- 2.0
TweakItem("SWeapons.ScrapBlade","MaxRange", 1.45); -- 1.5
TweakItem("SWeapons.ScrapBlade","BaseSpeed", 0.9); -- 0.8
TweakItem("SWeapons.ScrapBlade","ConditionMax", 10); -- 10
TweakItem("SWeapons.ScrapBlade","ConditionLowerChanceOneIn", 10); -- 10
TweakItem("SWeapons.ScrapBlade","CriticalChance", 10); -- 20
TweakItem("SWeapons.ScrapBlade","CritDmgMultiplier", 5); -- 5
TweakItem("SWeapons.ScrapBlade","DoorDamage", 8); -- 10
TweakItem("SWeapons.ScrapBlade","TreeDamage", 8); -- 10
TweakItem("SWeapons.ScrapBlade","Knockback", 0.3); -- 0.3
TweakItem("SWeapons.ScrapBlade","KnockdownMod", 2); -- 2

-- Salvaged Blade
TweakItem("SWeapons.SalvagedBlade","Weight", 1.8); -- 1.7
TweakItem("SWeapons.SalvagedBlade","MinDamage", 2.0); -- 3.0
TweakItem("SWeapons.SalvagedBlade","MaxDamage", 4.0); -- 5.0
TweakItem("SWeapons.SalvagedBlade","MaxRange", 1.45); -- 1.5
TweakItem("SWeapons.SalvagedBlade","BaseSpeed", 1.1); -- 0.8
TweakItem("SWeapons.SalvagedBlade","ConditionMax", 14); -- 35
TweakItem("SWeapons.SalvagedBlade","ConditionLowerChanceOneIn", 10); -- 4
TweakItem("SWeapons.SalvagedBlade","CriticalChance", 15); -- 20
TweakItem("SWeapons.SalvagedBlade","CritDmgMultiplier", 5); -- 5
TweakItem("SWeapons.SalvagedBlade","DoorDamage", 10); -- 10
TweakItem("SWeapons.SalvagedBlade","TreeDamage", 10); -- 8
TweakItem("SWeapons.SalvagedBlade","Knockback", 0.3); -- 0.3
TweakItem("SWeapons.SalvagedBlade","KnockdownMod", 2); -- 2

-- SalvagedCleaver
TweakItem("SWeapons.SalvagedCleaver","Weight", 4.6); -- 4.0
TweakItem("SWeapons.SalvagedCleaver","MinDamage", 4.0); -- 5
TweakItem("SWeapons.SalvagedCleaver","MaxDamage", 8.0); -- 10
TweakItem("SWeapons.SalvagedCleaver","MaxRange", 1.55); -- 2.0
TweakItem("SWeapons.SalvagedCleaver","BaseSpeed", 1.0); -- 1.0
TweakItem("SWeapons.SalvagedCleaver","ConditionMax", 12); -- 20
TweakItem("SWeapons.SalvagedCleaver","ConditionLowerChanceOneIn", 10); -- 6
TweakItem("SWeapons.SalvagedCleaver","CriticalChance", 10); -- 20
TweakItem("SWeapons.SalvagedCleaver","CritDmgMultiplier", 6); -- 5
TweakItem("SWeapons.SalvagedCleaver","DoorDamage", 20); -- 10
TweakItem("SWeapons.SalvagedCleaver","TreeDamage", 20); -- 10
TweakItem("SWeapons.SalvagedCleaver","Knockback", 0.3); -- 0.3
TweakItem("SWeapons.SalvagedCleaver","KnockdownMod", 2); -- 2

-- Salvaged Nightstick
TweakItem("SWeapons.SalvagedNightstick","Weight", 1.8); -- 1.5
TweakItem("SWeapons.SalvagedNightstick","MinDamage", 0.8); -- 1.0
TweakItem("SWeapons.SalvagedNightstick","MaxDamage", 1.6); -- 1.8
TweakItem("SWeapons.SalvagedNightstick","MaxRange", 1.23); -- 1.2
TweakItem("SWeapons.SalvagedNightstick","BaseSpeed", 1.1); -- 1.2
TweakItem("SWeapons.SalvagedNightstick","ConditionMax", 10); -- 24
TweakItem("SWeapons.SalvagedNightstick","ConditionLowerChanceOneIn", 16); -- 5
TweakItem("SWeapons.SalvagedNightstick","CriticalChance", 15); -- 20
TweakItem("SWeapons.SalvagedNightstick","CritDmgMultiplier", 5); -- 5
TweakItem("SWeapons.SalvagedNightstick","DoorDamage", 8); -- 8
TweakItem("SWeapons.SalvagedNightstick","TreeDamage", 4); -- 10
TweakItem("SWeapons.SalvagedNightstick","Knockback", 0.3); -- 0.3
TweakItem("SWeapons.SalvagedNightstick","KnockdownMod", 2); -- 2

-- Scrap Spear
TweakItem("SWeapons.ScrapSpear","Weight", 2.2); -- 2.5
TweakItem("SWeapons.ScrapSpear","MinDamage", 0.75); -- 1.3
TweakItem("SWeapons.ScrapSpear","MaxDamage", 1.5); -- 2.2
TweakItem("SWeapons.ScrapSpear","MinRange", 0.74); -- 0.98
TweakItem("SWeapons.ScrapSpear","MaxRange", 1.56); -- 1.55
TweakItem("SWeapons.ScrapSpear","BaseSpeed", 0.95); -- 1.0
TweakItem("SWeapons.ScrapSpear","ConditionMax", 10); -- 10
TweakItem("SWeapons.ScrapSpear","ConditionLowerChanceOneIn", 10); -- 8
TweakItem("SWeapons.ScrapSpear","CriticalChance", 10); -- 10
TweakItem("SWeapons.ScrapSpear","CritDmgMultiplier", 2); -- 4
TweakItem("SWeapons.ScrapSpear","DoorDamage", 8); -- 10
TweakItem("SWeapons.ScrapSpear","TreeDamage", 8); -- 12
TweakItem("SWeapons.ScrapSpear","Knockback", 0.3); -- 0.3
TweakItem("SWeapons.ScrapSpear","KnockdownMod", 0); -- 0

-- Salvaged Spear
TweakItem("SWeapons.SpearSalvaged","Weight", 2.6); -- 2.5
TweakItem("SWeapons.SpearSalvaged","MinDamage", 1.0); -- 2.3
TweakItem("SWeapons.SpearSalvaged","MaxDamage", 2.0); -- 3.2
TweakItem("SWeapons.SpearSalvaged","MinRange", 0.74); -- 0.61
TweakItem("SWeapons.SpearSalvaged","MaxRange", 1.54); -- 1.55
TweakItem("SWeapons.SpearSalvaged","BaseSpeed", 0.9); -- 0.9
TweakItem("SWeapons.SpearSalvaged","ConditionMax", 12); -- 15
TweakItem("SWeapons.SpearSalvaged","ConditionLowerChanceOneIn", 12); -- 10
TweakItem("SWeapons.SpearSalvaged","CriticalChance", 15); -- 10
TweakItem("SWeapons.SpearSalvaged","CritDmgMultiplier", 2); -- 4
TweakItem("SWeapons.SpearSalvaged","DoorDamage", 10); -- 10
TweakItem("SWeapons.SpearSalvaged","TreeDamage", 10); -- 12
TweakItem("SWeapons.SpearSalvaged","Knockback", 0.3); -- 0.3
TweakItem("SWeapons.SpearSalvaged","KnockdownMod", 0); -- 0

-- SOUND EFFECTS FOR SCRAP WEAPONS --
-- Short Blade
TweakItem("SWeapons.SharpenedScrewdriver","ImpactSound", "ScrewdriverHit");
TweakItem("SWeapons.SharpenedScrewdriver","HitSound", "ScrewdriverHit");
TweakItem("SWeapons.SharpenedScrewdriver","HitFloorSound", "ScrewdriverHit");
TweakItem("SWeapons.SharpenedScrewdriver","DoorHitSound", "ScrewdriverHit");
TweakItem("SWeapons.SharpenedScrewdriver","SwingSound", "ScrewdriverSwing");

TweakItem("SWeapons.GlassShiv","ImpactSound", "SmashedBottleHit");
TweakItem("SWeapons.GlassShiv","HitSound", "SmashedBottleHit");
TweakItem("SWeapons.GlassShiv","HitFloorSound", "SmashedBottleHit");
TweakItem("SWeapons.GlassShiv","DoorHitSound", "SmashedBottleHit");
TweakItem("SWeapons.GlassShiv","SwingSound", "SmashedBottleSwing");

TweakItem("SWeapons.ScrapShiv","ImpactSound", "ScrewdriverHit");
TweakItem("SWeapons.ScrapShiv","HitSound", "ScrewdriverHit");
TweakItem("SWeapons.ScrapShiv","HitFloorSound", "ScrewdriverHit");
TweakItem("SWeapons.ScrapShiv","DoorHitSound", "ScrewdriverHit");
TweakItem("SWeapons.ScrapShiv","SwingSound", "ScrewdriverSwing");

TweakItem("SWeapons.SalvagedShiv","ImpactSound", "HuntingKnifeHit");
TweakItem("SWeapons.SalvagedShiv","HitSound", "HuntingKnifeHit");
TweakItem("SWeapons.SalvagedShiv","HitFloorSound", "HuntingKnifeHit");
TweakItem("SWeapons.SalvagedShiv","DoorHitSound", "HuntingKnifeHit");
TweakItem("SWeapons.SalvagedShiv","SwingSound", "HuntingKnifeSwing");

TweakItem("SWeapons.SalvagedShivO","ImpactSound", "MeatCleaverHit");
TweakItem("SWeapons.SalvagedShivO","HitSound", "MeatCleaverHit");
TweakItem("SWeapons.SalvagedShivO","HitFloorSound", "MeatCleaverHit");
TweakItem("SWeapons.SalvagedShivO","DoorHitSound", "MeatCleaverHit");
TweakItem("SWeapons.SalvagedShivO","SwingSound", "MeatCleaverSwing");

-- Long Blade
--TweakItem("SWeapons.SalvagedNightstick","ImpactSound", "MacheteHit");
TweakItem("SWeapons.SalvagedNightstick","HitSound", "KatanaHit");
TweakItem("SWeapons.SalvagedNightstick","HitFloorSound", "KatanaHit");
--TweakItem("SWeapons.SalvagedNightstick","DoorHitSound", "MacheteHit");
TweakItem("SWeapons.SalvagedNightstick","SwingSound", "WoodAxeSwing");
	
TweakItem("SWeapons.ScrapMachete","ImpactSound", "MacheteHit");
TweakItem("SWeapons.ScrapMachete","HitSound", "MacheteHit");
TweakItem("SWeapons.ScrapMachete","HitFloorSound", "MacheteHit");
TweakItem("SWeapons.ScrapMachete","DoorHitSound", "MacheteHit");
--TweakItem("SWeapons.ScrapMachete","SwingSound", "MacheteSwing");

TweakItem("SWeapons.SalvagedMachete","ImpactSound", "MacheteHit");
TweakItem("SWeapons.SalvagedMachete","HitSound", "MacheteHit");
TweakItem("SWeapons.SalvagedMachete","HitFloorSound", "MacheteHit");
TweakItem("SWeapons.SalvagedMachete","DoorHitSound", "MacheteHit");
--TweakItem("SWeapons.SalvagedMachete","SwingSound", "MacheteSwing");

--TweakItem("SWeapons.ScrapSword","ImpactSound", "KatanaHit");
--TweakItem("SWeapons.ScrapSword","HitSound", "WoodAxeHit");
TweakItem("SWeapons.ScrapSword","HitFloorSound", "SWLongBladeHitSounds");
--TweakItem("SWeapons.ScrapSword","DoorHitSound", "KatanaHit");
--TweakItem("SWeapons.ScrapSword","SwingSound", "WoodAxeSwing");

--TweakItem("SWeapons.ScrapBlade","ImpactSound", "KatanaHit");
--TweakItem("SWeapons.ScrapBlade","HitSound", "KatanaHit");
TweakItem("SWeapons.ScrapBlade","HitFloorSound", "SWLongBladeHitSounds");
--TweakItem("SWeapons.ScrapBlade","DoorHitSound", "KatanaHit");
--TweakItem("SWeapons.ScrapBlade","SwingSound", "KatanaSwing");

--TweakItem("SWeapons.SalvagedBlade","ImpactSound", "KatanaHit");
--TweakItem("SWeapons.SalvagedBlade","HitSound", "KatanaHit");
TweakItem("SWeapons.SalvagedBlade","HitFloorSound", "SWLongBladeHitSounds");
--TweakItem("SWeapons.SalvagedBlade","DoorHitSound", "KatanaHit");
--TweakItem("SWeapons.SalvagedBlade","SwingSound", "KatanaSwing");

--TweakItem("SWeapons.SalvagedCleaver","ImpactSound", "KatanaHit");
--TweakItem("SWeapons.SalvagedCleaver","HitSound", "KatanaHit");
--TweakItem("SWeapons.SalvagedCleaver","HitFloorSound", "KatanaHit");
--TweakItem("SWeapons.SalvagedCleaver","DoorHitSound", "KatanaHit");
--TweakItem("SWeapons.SalvagedCleaver","SwingSound", "KatanaSwing");

TweakItem("SWeapons.SalvagedCleaver","ImpactSound", "WoodAxeHit");
TweakItem("SWeapons.SalvagedCleaver","HitSound", "WoodAxeHit");
TweakItem("SWeapons.SalvagedCleaver","HitFloorSound", "WoodAxeHit");
TweakItem("SWeapons.SalvagedCleaver","DoorHitSound", "WoodAxeHit");
TweakItem("SWeapons.SalvagedCleaver","SwingSound", "WoodAxeSwing");

-- Spears
TweakItem("SWeapons.SpearSharpenedScrewdriver","ImpactSound", "SpearHuntingKnifeHit");
TweakItem("SWeapons.SpearSharpenedScrewdriver","HitSound", "SpearHuntingKnifeHit");
TweakItem("SWeapons.SpearSharpenedScrewdriver","HitFloorSound", "SpearHuntingKnifeHit");
TweakItem("SWeapons.SpearSharpenedScrewdriver","DoorHitSound", "SpearHuntingKnifeHit");
TweakItem("SWeapons.SpearSharpenedScrewdriver","SwingSound", "SpearHuntingKnifeSwing");

TweakItem("SWeapons.SpearScrapShiv","ImpactSound", "SpearHuntingKnifeHit");
TweakItem("SWeapons.SpearScrapShiv","HitSound", "SpearHuntingKnifeHit");
TweakItem("SWeapons.SpearScrapShiv","HitFloorSound", "SpearHuntingKnifeHit");
TweakItem("SWeapons.SpearScrapShiv","DoorHitSound", "SpearHuntingKnifeHit");
TweakItem("SWeapons.SpearScrapShiv","SwingSound", "SpearHuntingKnifeSwing");

TweakItem("SWeapons.ScrapSpear","ImpactSound", "SpearHuntingKnifeHit");
TweakItem("SWeapons.ScrapSpear","HitSound", "SpearHuntingKnifeHit");
TweakItem("SWeapons.ScrapSpear","HitFloorSound", "SpearHuntingKnifeHit");
TweakItem("SWeapons.ScrapSpear","DoorHitSound", "SpearHuntingKnifeHit");
TweakItem("SWeapons.ScrapSpear","SwingSound", "SpearHuntingKnifeSwing");

TweakItem("SWeapons.SpearScrapMachete","ImpactSound", "SpearMacheteHit");
TweakItem("SWeapons.SpearScrapMachete","HitSound", "SpearMacheteHit");
TweakItem("SWeapons.SpearScrapMachete","HitFloorSound", "SpearMacheteHit");
TweakItem("SWeapons.SpearScrapMachete","DoorHitSound", "SpearMacheteHit");
TweakItem("SWeapons.SpearScrapMachete","SwingSound", "SpearMacheteSwing");

TweakItem("SWeapons.SpearSalvaged","ImpactSound", "SpearMacheteHit");
TweakItem("SWeapons.SpearSalvaged","HitSound", "SpearMacheteHit");
TweakItem("SWeapons.SpearSalvaged","HitFloorSound", "SpearMacheteHit");
TweakItem("SWeapons.SpearSalvaged","DoorHitSound", "SpearMacheteHit");
TweakItem("SWeapons.SpearSalvaged","SwingSound", "SpearMacheteSwing");

--||| MetalSpear |||---
-- Metal Spear
TweakItem("Base.MetalSpearCrafted","Weight", 2.8); -- 2.5
TweakItem("Base.MetalSpearCrafted","MinDamage", 0.8); -- 1.0 
TweakItem("Base.MetalSpearCrafted","MaxDamage", 1.6); -- 1.5
TweakItem("Base.MetalSpearCrafted","MinRange", 0.74); -- 0.98
TweakItem("Base.MetalSpearCrafted","MaxRange", 1.40); -- 1.50
TweakItem("Base.MetalSpearCrafted","BaseSpeed", 0.95); -- 1.0
TweakItem("Base.MetalSpearCrafted","ConditionMax", 10); -- 9
TweakItem("Base.MetalSpearCrafted","ConditionLowerChanceOneIn", 20); -- 8 
TweakItem("Base.MetalSpearCrafted","CriticalChance", 15); -- 30
TweakItem("Base.MetalSpearCrafted","CritDmgMultiplier", 2); -- 10
TweakItem("Base.MetalSpearCrafted","DoorDamage", 8); -- 5
TweakItem("Base.MetalSpearCrafted","TreeDamage", 2); -- 0
TweakItem("Base.MetalSpearCrafted","Knockback", 0.3); -- 0.3
TweakItem("Base.MetalSpearCrafted","KnockdownMod", 0); -- 0

--||| Craftable Metal Spear |||---
-- Metal Spear
TweakItem("Base.SpearMetal","Weight", 2.8); -- 2.5
TweakItem("Base.SpearMetal","MinDamage", 0.8); -- 1.0 
TweakItem("Base.SpearMetal","MaxDamage", 1.6); -- 1.5
TweakItem("Base.SpearMetal","MinRange", 0.74); -- 0.98
TweakItem("Base.SpearMetal","MaxRange", 1.40); -- 1.50
TweakItem("Base.SpearMetal","BaseSpeed", 0.95); -- 1.0
TweakItem("Base.SpearMetal","ConditionMax", 10); -- 9
TweakItem("Base.SpearMetal","ConditionLowerChanceOneIn", 20); -- 8 
TweakItem("Base.SpearMetal","CriticalChance", 15); -- 30
TweakItem("Base.SpearMetal","CritDmgMultiplier", 2); -- 10
TweakItem("Base.SpearMetal","DoorDamage", 8); -- 5
TweakItem("Base.SpearMetal","TreeDamage", 2); -- 0
TweakItem("Base.SpearMetal","Knockback", 0.3); -- 0.3
TweakItem("Base.SpearMetal","KnockdownMod", 0); -- 0


--||| Tactical Sheaths |||---
-- Tactical Knife
TweakItem("TKS.TacticalKnife","Weight", 0.5); -- 0.5
TweakItem("TKS.TacticalKnife","MinDamage", 0.6); -- 0.6
TweakItem("TKS.TacticalKnife","MaxDamage", 1.2); -- 1.2
TweakItem("TKS.TacticalKnife","MaxRange", 0.9); -- 0.9
TweakItem("TKS.TacticalKnife","BaseSpeed", 1.0); -- 1.0
TweakItem("TKS.TacticalKnife","ConditionMax", 10); -- 10
TweakItem("TKS.TacticalKnife","ConditionLowerChanceOneIn", 24); -- 15
TweakItem("TKS.TacticalKnife","CriticalChance", 60); -- 50
TweakItem("TKS.TacticalKnife","CritDmgMultiplier", 2); -- 10
TweakItem("TKS.TacticalKnife","DoorDamage", 3); -- 1
TweakItem("TKS.TacticalKnife","TreeDamage", 3); -- 2
TweakItem("TKS.TacticalKnife","EnduranceMod", 1.0); -- 0.5

--||| Tactical Weapons |||---
-- Tactical Knife
TweakItem("TWeapons.TacticalKnife","Weight", 0.5); -- 0.5
TweakItem("TWeapons.TacticalKnife","MinDamage", 0.6); -- 0.8
TweakItem("TWeapons.TacticalKnife","MaxDamage", 1.2); -- 1.2
TweakItem("TWeapons.TacticalKnife","MaxRange", 0.9); -- 0.9
TweakItem("TWeapons.TacticalKnife","BaseSpeed", 1.0); -- 1.1
TweakItem("TWeapons.TacticalKnife","ConditionMax", 10); -- 12
TweakItem("TWeapons.TacticalKnife","ConditionLowerChanceOneIn", 24); -- 15
TweakItem("TWeapons.TacticalKnife","CriticalChance", 60); -- 50
TweakItem("TWeapons.TacticalKnife","CritDmgMultiplier", 2); -- 3
TweakItem("TWeapons.TacticalKnife","DoorDamage", 3); -- 1
TweakItem("TWeapons.TacticalKnife","TreeDamage", 3); -- 2
TweakItem("TWeapons.TacticalKnife","EnduranceMod", 1.0); -- 0.5
-- Spear with Tactical Knife
TweakItem("TWeapons.SpearTKnife","Weight", 2.1); -- 2.2
TweakItem("TWeapons.SpearTKnife","MinDamage", 0.9); -- 1.2 
TweakItem("TWeapons.SpearTKnife","MaxDamage", 1.8); -- 1.7
TweakItem("TWeapons.SpearTKnife","MinRange", 0.74); -- 0.98
TweakItem("TWeapons.SpearTKnife","MaxRange", 1.52); -- 1.48
TweakItem("TWeapons.SpearTKnife","BaseSpeed", 0.95); -- 1.0
TweakItem("TWeapons.SpearTKnife","ConditionMax", 10); -- 9
TweakItem("TWeapons.SpearTKnife","ConditionLowerChanceOneIn", 24); -- 8 
TweakItem("TWeapons.SpearTKnife","CriticalChance", 20); -- 30
TweakItem("TWeapons.SpearTKnife","CritDmgMultiplier", 2); -- 10
TweakItem("TWeapons.SpearTKnife","DoorDamage", 4); -- 7
TweakItem("TWeapons.SpearTKnife","TreeDamage", 3); -- 0
TweakItem("TWeapons.SpearTKnife","Knockback", 0.3); -- 0.3
TweakItem("TWeapons.SpearTKnife","KnockdownMod", 0); -- 0

-- Military Knife
TweakItem("TWeapons.MilitaryKnife","Weight", 0.5); -- 0.5
TweakItem("TWeapons.MilitaryKnife","MinDamage", 0.6); -- 0.8
TweakItem("TWeapons.MilitaryKnife","MaxDamage", 1.2); -- 1.2
TweakItem("TWeapons.MilitaryKnife","MaxRange", 0.9); -- 0.9
TweakItem("TWeapons.MilitaryKnife","BaseSpeed", 1.05); -- 1.1
TweakItem("TWeapons.MilitaryKnife","ConditionMax", 10); -- 12
TweakItem("TWeapons.MilitaryKnife","ConditionLowerChanceOneIn", 24); -- 15
TweakItem("TWeapons.MilitaryKnife","CriticalChance", 60); -- 50
TweakItem("TWeapons.MilitaryKnife","CritDmgMultiplier", 2); -- 3
TweakItem("TWeapons.MilitaryKnife","DoorDamage", 3); -- 1
TweakItem("TWeapons.MilitaryKnife","TreeDamage", 3); -- 2
TweakItem("TWeapons.MilitaryKnife","EnduranceMod", 1.0); -- 0.5

-- Tactical Machete
TweakItem("TWeapons.TacticalMachete","Weight", 2.0); -- 2.0
TweakItem("TWeapons.TacticalMachete","MinDamage", 2.0); -- 2.0
TweakItem("TWeapons.TacticalMachete","MaxDamage", 3.0); -- 3.0
TweakItem("TWeapons.TacticalMachete","MaxRange", 1.20); -- 1.23
TweakItem("TWeapons.TacticalMachete","BaseSpeed", 1.0); -- 1.1
TweakItem("TWeapons.TacticalMachete","ConditionMax", 14); -- 13
TweakItem("TWeapons.TacticalMachete","ConditionLowerChanceOneIn", 26); -- 25
TweakItem("TWeapons.TacticalMachete","CriticalChance", 20); -- 20
TweakItem("TWeapons.TacticalMachete","CritDmgMultiplier", 5); -- 5
TweakItem("TWeapons.TacticalMachete","DoorDamage", 15); -- 10
TweakItem("TWeapons.TacticalMachete","TreeDamage", 15); -- 10
TweakItem("TWeapons.TacticalMachete","Knockback", 0.3); -- 0.3
TweakItem("TWeapons.TacticalMachete","KnockdownMod", 2); -- 2
-- Spear with Tactical Machete
TweakItem("TWeapons.SpearTMachete","Weight", 3.6); -- 3.7
TweakItem("TWeapons.SpearTMachete","MinDamage", 1.6); -- 1.3
TweakItem("TWeapons.SpearTMachete","MaxDamage", 2.7); -- 2.0
TweakItem("TWeapons.SpearTMachete","MinRange", 0.74); -- 0.98
TweakItem("TWeapons.SpearTMachete","MaxRange", 1.55); -- 1.55
TweakItem("TWeapons.SpearTMachete","BaseSpeed", 0.85); -- 0.9
TweakItem("TWeapons.SpearTMachete","ConditionMax", 14); -- 12
TweakItem("TWeapons.SpearTMachete","ConditionLowerChanceOneIn", 26); -- 10
TweakItem("TWeapons.SpearTMachete","CriticalChance", 15); -- 30
TweakItem("TWeapons.SpearTMachete","CritDmgMultiplier", 2); -- 10
TweakItem("TWeapons.SpearTMachete","DoorDamage", 16); -- 2
TweakItem("TWeapons.SpearTMachete","TreeDamage", 15); -- 10
TweakItem("TWeapons.SpearTMachete","Knockback", 0.3); -- 0.3
TweakItem("TWeapons.SpearTMachete","KnockdownMod", 0); -- 0

-- Tactical Ninja Sword
TweakItem("TWeapons.TacticalBlade","Weight", 1.5); -- 1.5
TweakItem("TWeapons.TacticalBlade","MinDamage", 1.4); -- 2.0
TweakItem("TWeapons.TacticalBlade","MaxDamage", 2.4); -- 2.5
TweakItem("TWeapons.TacticalBlade","MaxRange", 1.30); -- 1.23
TweakItem("TWeapons.TacticalBlade","BaseSpeed", 1.1); -- 1.1
TweakItem("TWeapons.TacticalBlade","ConditionMax", 14); -- 13
TweakItem("TWeapons.TacticalBlade","ConditionLowerChanceOneIn", 26); -- 25
TweakItem("TWeapons.TacticalBlade","CriticalChance", 15); -- 20
TweakItem("TWeapons.TacticalBlade","CritDmgMultiplier", 3); -- 5
TweakItem("TWeapons.TacticalBlade","DoorDamage", 8); -- 10
TweakItem("TWeapons.TacticalBlade","TreeDamage", 8); -- 10
TweakItem("TWeapons.TacticalBlade","Knockback", 0.3); -- 0.3
TweakItem("TWeapons.TacticalBlade","KnockdownMod", 2); -- 2
-- Spear with Tactical Ninja Sword
TweakItem("TWeapons.SpearTBlade","Weight", 3.1); -- 3.7
TweakItem("TWeapons.SpearTBlade","MinDamage", 1.3); -- 1.3
TweakItem("TWeapons.SpearTBlade","MaxDamage", 2.4); -- 2.0
TweakItem("TWeapons.SpearTBlade","MinRange", 0.74); -- 0.98
TweakItem("TWeapons.SpearTBlade","MaxRange", 1.60); -- 1.55
TweakItem("TWeapons.SpearTBlade","BaseSpeed", 0.85); -- 0.9
TweakItem("TWeapons.SpearTBlade","ConditionMax", 14); -- 12
TweakItem("TWeapons.SpearTBlade","ConditionLowerChanceOneIn", 26); -- 10
TweakItem("TWeapons.SpearTBlade","CriticalChance", 8.75); -- 30
TweakItem("TWeapons.SpearTBlade","CritDmgMultiplier", 2); -- 10
TweakItem("TWeapons.SpearTBlade","DoorDamage", 9); -- 2
TweakItem("TWeapons.SpearTBlade","TreeDamage", 8); -- 10
TweakItem("TWeapons.SpearTBlade","Knockback", 0.3); -- 0.3
TweakItem("TWeapons.SpearTBlade","KnockdownMod", 0); -- 0

-- Halberd Spear
TweakItem("TWeapons.HalberdSpear","Weight", 4.5); -- 2.5
TweakItem("TWeapons.HalberdSpear","MinDamage", 1.5); -- 1.0 
TweakItem("TWeapons.HalberdSpear","MaxDamage", 3.0); -- 1.5
TweakItem("TWeapons.HalberdSpear","MinRange", 1.0); -- 0.98
TweakItem("TWeapons.HalberdSpear","MaxRange", 1.8); -- 1.50
TweakItem("TWeapons.HalberdSpear","BaseSpeed", 0.80); -- 1.1
TweakItem("TWeapons.HalberdSpear","ConditionMax", 20); -- 20
TweakItem("TWeapons.HalberdSpear","ConditionLowerChanceOneIn", 26); -- 25 
TweakItem("TWeapons.HalberdSpear","CriticalChance", 20); -- 30
TweakItem("TWeapons.HalberdSpear","CritDmgMultiplier", 2); -- 10
TweakItem("TWeapons.HalberdSpear","DoorDamage", 15); -- 5
TweakItem("TWeapons.HalberdSpear","TreeDamage", 15); -- 0
TweakItem("TWeapons.HalberdSpear","Knockback", 0.3); -- 0.3
TweakItem("TWeapons.HalberdSpear","KnockdownMod", 0); -- 0

-- HalberdAxe
TweakItem("TWeapons.HalberdAxe","Weight", 4.5); -- 2.5
TweakItem("TWeapons.HalberdAxe","MinDamage", 1.5); -- 1.0 
TweakItem("TWeapons.HalberdAxe","MaxDamage", 3.0); -- 1.5
TweakItem("TWeapons.HalberdAxe","MaxRange", 1.60); -- 1.55
TweakItem("TWeapons.HalberdAxe","BaseSpeed", 0.90); -- 1.1


--||| Sapphire's Tactical Melee Weapons |||---
-- Tactical Machete
TweakItem("Base.Tactical_Machete","Weight", 2.0); -- 2.0
TweakItem("Base.Tactical_Machete","MinDamage", 2.0); -- 2.0
TweakItem("Base.Tactical_Machete","MaxDamage", 3.0); -- 3.0
TweakItem("Base.Tactical_Machete","MaxRange", 1.20); -- 1.23
TweakItem("Base.Tactical_Machete","BaseSpeed", 1.0); -- 1.1
TweakItem("Base.Tactical_Machete","ConditionMax", 15); -- 13
TweakItem("Base.Tactical_Machete","ConditionLowerChanceOneIn", 25); -- 25
TweakItem("Base.Tactical_Machete","CriticalChance", 20); -- 20
TweakItem("Base.Tactical_Machete","CritDmgMultiplier", 5); -- 5
TweakItem("Base.Tactical_Machete","DoorDamage", 15); -- 10
TweakItem("Base.Tactical_Machete","TreeDamage", 15); -- 10
TweakItem("Base.Tactical_Machete","Knockback", 0.3); -- 0.3
TweakItem("Base.Tactical_Machete","KnockdownMod", 2); -- 2

-- Tactical Spear
TweakItem("Base.Tactical_Spear","Weight", 2.0); -- 2.5
TweakItem("Base.Tactical_Spear","MinDamage", 1.2); -- 1.8 
TweakItem("Base.Tactical_Spear","MaxDamage", 2.4); -- 2.7
TweakItem("Base.Tactical_Spear","MinRange", 0.74); -- 0.98
TweakItem("Base.Tactical_Spear","MaxRange", 1.5); -- 1.48
TweakItem("Base.Tactical_Spear","BaseSpeed", 1.0); -- 1.0
TweakItem("Base.Tactical_Spear","ConditionMax", 12); -- 9
TweakItem("Base.Tactical_Spear","ConditionLowerChanceOneIn", 16); -- 8 
TweakItem("Base.Tactical_Spear","CriticalChance", 15); -- 30
TweakItem("Base.Tactical_Spear","CritDmgMultiplier", 2); -- 10
TweakItem("Base.Tactical_Spear","DoorDamage", 8); -- 5
TweakItem("Base.Tactical_Spear","TreeDamage", 4); -- 0
TweakItem("Base.Tactical_Spear","Knockback", 0.3); -- 0.3
TweakItem("Base.Tactical_Spear","KnockdownMod", 0); -- 0

--||| Historical Weapons And Armor |||---
-- 15thSpear
TweakItem("HistoricalWeaponsAndArmor.15thSpear","CriticalChance", 10); -- 30
TweakItem("HistoricalWeaponsAndArmor.15thSpear","CritDmgMultiplier", 2); -- 6

-- Billhook
TweakItem("HistoricalWeaponsAndArmor.Billhook","CriticalChance", 10); -- 30
TweakItem("HistoricalWeaponsAndArmor.Billhook","CritDmgMultiplier", 2); -- 6

-- Halberd
TweakItem("HistoricalWeaponsAndArmor.Halberd","CriticalChance", 10); -- 30
TweakItem("HistoricalWeaponsAndArmor.Halberd","CritDmgMultiplier", 2); -- 6

-- HalberdEarly
TweakItem("HistoricalWeaponsAndArmor.HalberdEarly","CriticalChance", 10); -- 30
TweakItem("HistoricalWeaponsAndArmor.HalberdEarly","CritDmgMultiplier", 2); -- 6

-- PoleHammer
TweakItem("HistoricalWeaponsAndArmor.PoleHammer","CriticalChance", 10); -- 30
TweakItem("HistoricalWeaponsAndArmor.PoleHammer","CritDmgMultiplier", 2); -- 6

-- GreatSword
TweakItem("HistoricalWeaponsAndArmor.GreatSword","MinDamage", 5.0); -- 8 
TweakItem("HistoricalWeaponsAndArmor.GreatSword","MaxDamage", 10.0); -- 9
TweakItem("HistoricalWeaponsAndArmor.GreatSword","BaseSpeed", 0.80); -- 1.0

-- KriegMesser
TweakItem("HistoricalWeaponsAndArmor.KriegMesser","MinDamage", 4.0); -- 8 
TweakItem("HistoricalWeaponsAndArmor.KriegMesser","MaxDamage", 8.0); -- 8
TweakItem("HistoricalWeaponsAndArmor.KriegMesser","BaseSpeed", 0.95); -- 1.0

-- Falchion
TweakItem("HistoricalWeaponsAndArmor.Falchion","MinDamage", 2.0); -- 4 
TweakItem("HistoricalWeaponsAndArmor.Falchion","MaxDamage", 4.0); -- 6
TweakItem("HistoricalWeaponsAndArmor.Falchion","BaseSpeed", 0.90); -- 1.1
TweakItem("HistoricalWeaponsAndArmor.Falchion","DoorDamage", 15); -- 5
TweakItem("HistoricalWeaponsAndArmor.Falchion","TreeDamage", 15); -- 2

-- Katzbalger
TweakItem("HistoricalWeaponsAndArmor.Katzbalger","MinDamage", 2.4); -- 4 
TweakItem("HistoricalWeaponsAndArmor.Katzbalger","MaxDamage", 4.4); -- 6
TweakItem("HistoricalWeaponsAndArmor.Katzbalger","BaseSpeed", 0.90); -- 1.1
TweakItem("HistoricalWeaponsAndArmor.Katzbalger","DoorDamage", 15); -- 5
TweakItem("HistoricalWeaponsAndArmor.Katzbalger","TreeDamage", 15); -- 2

-- RondelDagger
TweakItem("HistoricalWeaponsAndArmor.RondelDagger","Weight", 0.7); -- 0.5
TweakItem("HistoricalWeaponsAndArmor.RondelDagger","MinDamage", 0.9); -- 1
TweakItem("HistoricalWeaponsAndArmor.RondelDagger","MaxDamage", 1.8); -- 3
TweakItem("HistoricalWeaponsAndArmor.RondelDagger","MaxRange", 0.98); -- 0.9
TweakItem("HistoricalWeaponsAndArmor.RondelDagger","BaseSpeed", 1.0); -- 1.0
TweakItem("HistoricalWeaponsAndArmor.RondelDagger","ConditionMax", 12); -- 13
TweakItem("HistoricalWeaponsAndArmor.RondelDagger","ConditionLowerChanceOneIn", 20); -- 25
TweakItem("HistoricalWeaponsAndArmor.RondelDagger","CriticalChance", 60); -- 50
TweakItem("HistoricalWeaponsAndArmor.RondelDagger","CritDmgMultiplier", 2); -- 10
TweakItem("HistoricalWeaponsAndArmor.RondelDagger","DoorDamage", 3); -- 1
TweakItem("HistoricalWeaponsAndArmor.RondelDagger","TreeDamage", 0); -- 2
TweakItem("HistoricalWeaponsAndArmor.RondelDagger","EnduranceMod", 1.0); -- 0.5

-- QuillonDagger
TweakItem("HistoricalWeaponsAndArmor.QuillonDagger","Weight", 0.6); -- 0.5
TweakItem("HistoricalWeaponsAndArmor.QuillonDagger","MinDamage", 0.8); -- 1
TweakItem("HistoricalWeaponsAndArmor.QuillonDagger","MaxDamage", 1.6); -- 3
TweakItem("HistoricalWeaponsAndArmor.QuillonDagger","MaxRange", 0.98); -- 0.9
TweakItem("HistoricalWeaponsAndArmor.QuillonDagger","BaseSpeed", 1.1); -- 1.0
TweakItem("HistoricalWeaponsAndArmor.QuillonDagger","ConditionMax", 10); -- 13
TweakItem("HistoricalWeaponsAndArmor.QuillonDagger","ConditionLowerChanceOneIn", 20); -- 25
TweakItem("HistoricalWeaponsAndArmor.QuillonDagger","CriticalChance", 40); -- 50
TweakItem("HistoricalWeaponsAndArmor.QuillonDagger","CritDmgMultiplier", 2); -- 10
TweakItem("HistoricalWeaponsAndArmor.QuillonDagger","DoorDamage", 3); -- 1
TweakItem("HistoricalWeaponsAndArmor.QuillonDagger","TreeDamage", 0); -- 2
TweakItem("HistoricalWeaponsAndArmor.QuillonDagger","EnduranceMod", 1.0); -- 0.5

-- BaselardDagger
TweakItem("HistoricalWeaponsAndArmor.BaselardDagger","Weight", 0.8); -- 0.5
TweakItem("HistoricalWeaponsAndArmor.BaselardDagger","MinDamage", 0.9); -- 1
TweakItem("HistoricalWeaponsAndArmor.BaselardDagger","MaxDamage", 1.8); -- 3
TweakItem("HistoricalWeaponsAndArmor.BaselardDagger","MaxRange", 0.94); -- 0.9
TweakItem("HistoricalWeaponsAndArmor.BaselardDagger","BaseSpeed", 1.0); -- 1.0
TweakItem("HistoricalWeaponsAndArmor.BaselardDagger","ConditionMax", 12); -- 13
TweakItem("HistoricalWeaponsAndArmor.BaselardDagger","ConditionLowerChanceOneIn", 20); -- 25
TweakItem("HistoricalWeaponsAndArmor.BaselardDagger","CriticalChance", 40); -- 50
TweakItem("HistoricalWeaponsAndArmor.BaselardDagger","CritDmgMultiplier", 2); -- 10
TweakItem("HistoricalWeaponsAndArmor.BaselardDagger","DoorDamage", 4); -- 1
TweakItem("HistoricalWeaponsAndArmor.BaselardDagger","TreeDamage", 4); -- 2
TweakItem("HistoricalWeaponsAndArmor.BaselardDagger","EnduranceMod", 1.0); -- 0.5


--||| Tools of The Trade |||---
-- Bush Machete
TweakItem("ToolsOfTheTrade.BushMachete","Weight", 1.5); -- 2.0
TweakItem("ToolsOfTheTrade.BushMachete","MinDamage", 1.0); -- 2.0
TweakItem("ToolsOfTheTrade.BushMachete","MaxDamage", 2.0); -- 3.0
TweakItem("ToolsOfTheTrade.BushMachete","MaxRange", 1.20); -- 1.23
TweakItem("ToolsOfTheTrade.BushMachete","BaseSpeed", 1.0); -- 1.0
TweakItem("ToolsOfTheTrade.BushMachete","ConditionMax", 10); -- 13
TweakItem("ToolsOfTheTrade.BushMachete","ConditionLowerChanceOneIn", 20); -- 25
TweakItem("ToolsOfTheTrade.BushMachete","CriticalChance", 15); -- 20
TweakItem("ToolsOfTheTrade.BushMachete","CritDmgMultiplier", 5); -- 5
TweakItem("ToolsOfTheTrade.BushMachete","DoorDamage", 10); -- 10
TweakItem("ToolsOfTheTrade.BushMachete","TreeDamage", 10); -- 10
TweakItem("ToolsOfTheTrade.BushMachete","Knockback", 0.3); -- 0.3
TweakItem("ToolsOfTheTrade.BushMachete","KnockdownMod", 2); -- 2

-- Cavalry Sabre
TweakItem("ToolsOfTheTrade.CavalrySabre","Weight", 1.7); -- 2.0
TweakItem("ToolsOfTheTrade.CavalrySabre","MinDamage", 3.0); -- 2.0
TweakItem("ToolsOfTheTrade.CavalrySabre","MaxDamage", 4.0); -- 3.0
TweakItem("ToolsOfTheTrade.CavalrySabre","MaxRange", 1.30); -- 1.23
TweakItem("ToolsOfTheTrade.CavalrySabre","BaseSpeed", 1.0); -- 1.0
TweakItem("ToolsOfTheTrade.CavalrySabre","ConditionMax", 12); -- 13
TweakItem("ToolsOfTheTrade.CavalrySabre","ConditionLowerChanceOneIn", 18); -- 25
TweakItem("ToolsOfTheTrade.CavalrySabre","CriticalChance", 20); -- 20
TweakItem("ToolsOfTheTrade.CavalrySabre","CritDmgMultiplier", 5); -- 5
TweakItem("ToolsOfTheTrade.CavalrySabre","DoorDamage", 5); -- 10
TweakItem("ToolsOfTheTrade.CavalrySabre","TreeDamage", 4); -- 10
TweakItem("ToolsOfTheTrade.CavalrySabre","Knockback", 0.3); -- 0.3
TweakItem("ToolsOfTheTrade.CavalrySabre","KnockdownMod", 2); -- 2

-- Executioners Sword
TweakItem("ToolsOfTheTrade.ExecutionersSword","BaseSpeed", 0.9); -- 1.0
TweakItem("ToolsOfTheTrade.ExecutionersSword","DoorDamage", 6); -- 5
TweakItem("ToolsOfTheTrade.ExecutionersSword","TreeDamage", 6); -- 5

-- Kukri
TweakItem("ToolsOfTheTrade.Kukri","EnduranceMod", 1.0); -- 1.2

-- Army Scissors
TweakItem("ToolsOfTheTrade.ArmyScissors","Weight", 0.3); -- 0.3
TweakItem("ToolsOfTheTrade.ArmyScissors","MinDamage", 0.1); -- 0.1
TweakItem("ToolsOfTheTrade.ArmyScissors","MaxDamage", 0.6); -- 0.1
TweakItem("ToolsOfTheTrade.ArmyScissors","MaxRange", 0.85); -- 0.9
TweakItem("ToolsOfTheTrade.ArmyScissors","BaseSpeed", 1.1); -- 1.0
TweakItem("ToolsOfTheTrade.ArmyScissors","ConditionMax", 8); -- 5
TweakItem("ToolsOfTheTrade.ArmyScissors","ConditionLowerChanceOneIn", 6); -- 1
TweakItem("ToolsOfTheTrade.ArmyScissors","CriticalChance", 20); -- 5
TweakItem("ToolsOfTheTrade.ArmyScissors","CritDmgMultiplier", 2); -- 10
TweakItem("ToolsOfTheTrade.ArmyScissors","DoorDamage", 0); -- 1
TweakItem("ToolsOfTheTrade.ArmyScissors","TreeDamage", 0); -- 2
TweakItem("ToolsOfTheTrade.ArmyScissors","EnduranceMod", 1.0); -- 0.5

-- Combat Knife
TweakItem("ToolsOfTheTrade.CombatKnife","Weight", 0.7); -- 0.5
TweakItem("ToolsOfTheTrade.CombatKnife","MinDamage", 0.75); -- 0.6
TweakItem("ToolsOfTheTrade.CombatKnife","MaxDamage", 1.5); -- 1.2
TweakItem("ToolsOfTheTrade.CombatKnife","MaxRange", 0.94); -- 0.9
TweakItem("ToolsOfTheTrade.CombatKnife","BaseSpeed", 1.0); -- 1.0
TweakItem("ToolsOfTheTrade.CombatKnife","ConditionMax", 12); -- 12
TweakItem("ToolsOfTheTrade.CombatKnife","ConditionLowerChanceOneIn", 20); -- 20
TweakItem("ToolsOfTheTrade.CombatKnife","CriticalChance", 60); -- 50
TweakItem("ToolsOfTheTrade.CombatKnife","CritDmgMultiplier", 2); -- 10
TweakItem("ToolsOfTheTrade.CombatKnife","DoorDamage", 3); -- 1
TweakItem("ToolsOfTheTrade.CombatKnife","TreeDamage", 3); -- 2
TweakItem("ToolsOfTheTrade.CombatKnife","EnduranceMod", 1.0); -- 0.5

-- Cutthroat Razor
TweakItem("ToolsOfTheTrade.CutthroatRazor","Weight", 0.4); -- 0.3
TweakItem("ToolsOfTheTrade.CutthroatRazor","MinDamage", 0.1); -- 0.1
TweakItem("ToolsOfTheTrade.CutthroatRazor","MaxDamage", 0.8); -- 0.1
TweakItem("ToolsOfTheTrade.CutthroatRazor","MaxRange", 0.85); -- 0.9
TweakItem("ToolsOfTheTrade.CutthroatRazor","BaseSpeed", 1.1); -- 1.0
TweakItem("ToolsOfTheTrade.CutthroatRazor","ConditionMax", 8); -- 5
TweakItem("ToolsOfTheTrade.CutthroatRazor","ConditionLowerChanceOneIn", 4); -- 1
TweakItem("ToolsOfTheTrade.CutthroatRazor","CriticalChance", 20); -- 5
TweakItem("ToolsOfTheTrade.CutthroatRazor","CritDmgMultiplier", 2); -- 10
TweakItem("ToolsOfTheTrade.CutthroatRazor","DoorDamage", 0); -- 1
TweakItem("ToolsOfTheTrade.CutthroatRazor","TreeDamage", 0); -- 2
TweakItem("ToolsOfTheTrade.CutthroatRazor","EnduranceMod", 1.0); -- 0.5

-- Fairbairn-Sykes Knife
TweakItem("ToolsOfTheTrade.FairbairnSykesKnife","Weight", 0.5); -- 0.5
TweakItem("ToolsOfTheTrade.FairbairnSykesKnife","MinDamage", 0.8); -- 0.6
TweakItem("ToolsOfTheTrade.FairbairnSykesKnife","MaxDamage", 1.6); -- 1.2
TweakItem("ToolsOfTheTrade.FairbairnSykesKnife","MaxRange", 0.94); -- 0.9
TweakItem("ToolsOfTheTrade.FairbairnSykesKnife","BaseSpeed", 1.0); -- 1.0
TweakItem("ToolsOfTheTrade.FairbairnSykesKnife","ConditionMax", 10); -- 10
TweakItem("ToolsOfTheTrade.FairbairnSykesKnife","ConditionLowerChanceOneIn", 18); -- 15
TweakItem("ToolsOfTheTrade.FairbairnSykesKnife","CriticalChance", 60); -- 50
TweakItem("ToolsOfTheTrade.FairbairnSykesKnife","CritDmgMultiplier", 2); -- 10
TweakItem("ToolsOfTheTrade.FairbairnSykesKnife","DoorDamage", 4); -- 1
TweakItem("ToolsOfTheTrade.FairbairnSykesKnife","TreeDamage", 4); -- 2
TweakItem("ToolsOfTheTrade.FairbairnSykesKnife","EnduranceMod", 1.0); -- 0.5

-- Gladius Stab
TweakItem("ToolsOfTheTrade.GladiusStab","Weight", 1.5); -- 0.5
TweakItem("ToolsOfTheTrade.GladiusStab","MinDamage", 1.2); -- 0.6
TweakItem("ToolsOfTheTrade.GladiusStab","MaxDamage", 2.4); -- 1.2
TweakItem("ToolsOfTheTrade.GladiusStab","MaxRange", 1.2); -- 0.9
TweakItem("ToolsOfTheTrade.GladiusStab","BaseSpeed", 0.9); -- 1.2
TweakItem("ToolsOfTheTrade.GladiusStab","ConditionMax", 10); -- 12
TweakItem("ToolsOfTheTrade.GladiusStab","ConditionLowerChanceOneIn", 20); -- 20
TweakItem("ToolsOfTheTrade.GladiusStab","CriticalChance", 40); -- 50
TweakItem("ToolsOfTheTrade.GladiusStab","CritDmgMultiplier", 2); -- 10
TweakItem("ToolsOfTheTrade.GladiusStab","DoorDamage", 3); -- 1
TweakItem("ToolsOfTheTrade.GladiusStab","TreeDamage", 3); -- 2
TweakItem("ToolsOfTheTrade.GladiusStab","EnduranceMod", 1.0); -- 0.5

-- Gladius Slash
TweakItem("ToolsOfTheTrade.GladiusSlash","Weight", 1.5); -- 0.5

-- Kebab Skewer
TweakItem("ToolsOfTheTrade.KebabSkewer","Weight", 1.2); -- 0.4
TweakItem("ToolsOfTheTrade.KebabSkewer","MinDamage", 0.2); -- 0.3
TweakItem("ToolsOfTheTrade.KebabSkewer","MaxDamage", 0.8); -- 0.7
TweakItem("ToolsOfTheTrade.KebabSkewer","MaxRange", 1.25); -- 0.85
TweakItem("ToolsOfTheTrade.KebabSkewer","BaseSpeed", 0.8); -- 1.0
TweakItem("ToolsOfTheTrade.KebabSkewer","ConditionMax", 6); -- 5
TweakItem("ToolsOfTheTrade.KebabSkewer","ConditionLowerChanceOneIn", 20); -- 20
TweakItem("ToolsOfTheTrade.KebabSkewer","CriticalChance", 20); -- 10
TweakItem("ToolsOfTheTrade.KebabSkewer","CritDmgMultiplier", 2); -- 10
TweakItem("ToolsOfTheTrade.KebabSkewer","DoorDamage", 1); -- 1
TweakItem("ToolsOfTheTrade.KebabSkewer","TreeDamage", 1); -- 1
TweakItem("ToolsOfTheTrade.KebabSkewer","EnduranceMod", 1.0); -- 0.5

-- Meat Hook
TweakItem("ToolsOfTheTrade.MeatHook","EnduranceMod", 1.0); -- 1

-- Ryoba Saw
--

-- Seax
TweakItem("ToolsOfTheTrade.Seax","Weight", 0.8); -- 0.5
TweakItem("ToolsOfTheTrade.Seax","MinDamage", 0.6); -- 0.6
TweakItem("ToolsOfTheTrade.Seax","MaxDamage", 1.2); -- 1.2
TweakItem("ToolsOfTheTrade.Seax","MaxRange", 0.95); -- 0.9
TweakItem("ToolsOfTheTrade.Seax","BaseSpeed", 0.95); -- 1.0
TweakItem("ToolsOfTheTrade.Seax","ConditionMax", 12); -- 12
TweakItem("ToolsOfTheTrade.Seax","ConditionLowerChanceOneIn", 40); -- 20
TweakItem("ToolsOfTheTrade.Seax","CriticalChance", 40); -- 50
TweakItem("ToolsOfTheTrade.Seax","CritDmgMultiplier", 2); -- 10
TweakItem("ToolsOfTheTrade.Seax","DoorDamage", 3); -- 1
TweakItem("ToolsOfTheTrade.Seax","TreeDamage", 3); -- 2
TweakItem("ToolsOfTheTrade.Seax","EnduranceMod", 1.0); -- 0.5

-- Spiff Army Knife
TweakItem("ToolsOfTheTrade.SpiffArmyKnife","Weight", 0.3); -- 0.5
TweakItem("ToolsOfTheTrade.SpiffArmyKnife","MinDamage", 0.1); -- 2
TweakItem("ToolsOfTheTrade.SpiffArmyKnife","MaxDamage", 0.4); -- 8
TweakItem("ToolsOfTheTrade.SpiffArmyKnife","MaxRange", 0.80); -- 0.9
TweakItem("ToolsOfTheTrade.SpiffArmyKnife","BaseSpeed", 1.0); -- 0.8
TweakItem("ToolsOfTheTrade.SpiffArmyKnife","ConditionMax", 10); -- 10
TweakItem("ToolsOfTheTrade.SpiffArmyKnife","ConditionLowerChanceOneIn", 16); -- 15
TweakItem("ToolsOfTheTrade.SpiffArmyKnife","CriticalChance", 20); -- 10
TweakItem("ToolsOfTheTrade.SpiffArmyKnife","CritDmgMultiplier", 2); -- 10
TweakItem("ToolsOfTheTrade.SpiffArmyKnife","DoorDamage", 1); -- 1
TweakItem("ToolsOfTheTrade.SpiffArmyKnife","TreeDamage", 1); -- 2
TweakItem("ToolsOfTheTrade.SpiffArmyKnife","EnduranceMod", 1.0); -- 0.5

-- Utensil Tool
TweakItem("ToolsOfTheTrade.UtensilTool","Weight", 0.3); -- 0.5
TweakItem("ToolsOfTheTrade.UtensilTool","MinDamage", 0.1); -- 2
TweakItem("ToolsOfTheTrade.UtensilTool","MaxDamage", 0.4); -- 8
TweakItem("ToolsOfTheTrade.UtensilTool","MaxRange", 0.80); -- 0.9
TweakItem("ToolsOfTheTrade.UtensilTool","BaseSpeed", 1.2); -- 0.8
TweakItem("ToolsOfTheTrade.UtensilTool","ConditionMax", 5); -- 3
TweakItem("ToolsOfTheTrade.UtensilTool","ConditionLowerChanceOneIn", 3); -- 1
TweakItem("ToolsOfTheTrade.UtensilTool","CriticalChance", 20); -- 10
TweakItem("ToolsOfTheTrade.UtensilTool","CritDmgMultiplier", 2); -- 10
TweakItem("ToolsOfTheTrade.UtensilTool","DoorDamage", 1); -- 1
TweakItem("ToolsOfTheTrade.UtensilTool","TreeDamage", 1); -- 2
TweakItem("ToolsOfTheTrade.UtensilTool","EnduranceMod", 1.0); -- 0.5

-- Stun Gun
TweakItem("ToolsOfTheTrade.StunGun","Weight", 1.0); -- 0.5
TweakItem("ToolsOfTheTrade.StunGun","MinDamage", 4); -- 2
TweakItem("ToolsOfTheTrade.StunGun","MaxDamage", 4); -- 8
TweakItem("ToolsOfTheTrade.StunGun","MaxRange", 0.80); -- 0.9
TweakItem("ToolsOfTheTrade.StunGun","BaseSpeed", 1.0); -- 0.8
TweakItem("ToolsOfTheTrade.StunGun","ConditionMax", 10); -- 10
TweakItem("ToolsOfTheTrade.StunGun","ConditionLowerChanceOneIn", 1); -- 1
TweakItem("ToolsOfTheTrade.StunGun","CriticalChance", 0); -- 50
TweakItem("ToolsOfTheTrade.StunGun","CritDmgMultiplier", 2); -- 10
TweakItem("ToolsOfTheTrade.StunGun","DoorDamage", 0); -- 1
TweakItem("ToolsOfTheTrade.StunGun","TreeDamage", 0); -- 2
TweakItem("ToolsOfTheTrade.StunGun","EnduranceMod", 1.0); -- 0.5

-- Pencil Eraser
TweakItem("ToolsOfTheTrade.PencilEraser","Weight", 0.05); -- 0.1


--||| Trench Knives |||---
-- Trench Knife
TweakItem("Base.PA_TrenchKnife","Weight", 0.5); -- 0.5
TweakItem("Base.PA_TrenchKnife","MinDamage", 0.6); -- 0.6
TweakItem("Base.PA_TrenchKnife","MaxDamage", 1.2); -- 1.2
TweakItem("Base.PA_TrenchKnife","MaxRange", 0.9); -- 0.9
TweakItem("Base.PA_TrenchKnife","BaseSpeed", 1.0); -- 1.0
TweakItem("Base.PA_TrenchKnife","ConditionMax", 10); -- 10
TweakItem("Base.PA_TrenchKnife","ConditionLowerChanceOneIn", 20); -- 15
TweakItem("Base.PA_TrenchKnife","CriticalChance", 60); -- 50
TweakItem("Base.PA_TrenchKnife","CritDmgMultiplier", 2); -- 10
TweakItem("Base.PA_TrenchKnife","DoorDamage", 3); -- 1
TweakItem("Base.PA_TrenchKnife","TreeDamage", 3); -- 2
TweakItem("Base.PA_TrenchKnife","EnduranceMod", 1.0); -- 0.5

TweakItem("Base.PA_TrenchKnife2","Weight", 0.5); -- 0.5

-- Trench Knife B
TweakItem("Base.PA_TrenchKnifeB","Weight", 0.5); -- 0.5
TweakItem("Base.PA_TrenchKnifeB","MinDamage", 0.6); -- 0.6
TweakItem("Base.PA_TrenchKnifeB","MaxDamage", 1.2); -- 1.2
TweakItem("Base.PA_TrenchKnifeB","MaxRange", 0.9); -- 0.9
TweakItem("Base.PA_TrenchKnifeB","BaseSpeed", 1.0); -- 1.0
TweakItem("Base.PA_TrenchKnifeB","ConditionMax", 10); -- 10
TweakItem("Base.PA_TrenchKnifeB","ConditionLowerChanceOneIn", 20); -- 15
TweakItem("Base.PA_TrenchKnifeB","CriticalChance", 60); -- 50
TweakItem("Base.PA_TrenchKnifeB","CritDmgMultiplier", 2); -- 10
TweakItem("Base.PA_TrenchKnifeB","DoorDamage", 3); -- 1
TweakItem("Base.PA_TrenchKnifeB","TreeDamage", 3); -- 2
TweakItem("Base.PA_TrenchKnifeB","EnduranceMod", 1.0); -- 0.5

TweakItem("Base.PA_TrenchKnifeB2","Weight", 0.5); -- 0.5

-- Trench Knife C
TweakItem("Base.PA_TrenchKnifeC","Weight", 0.5); -- 0.5
TweakItem("Base.PA_TrenchKnifeC","MinDamage", 0.6); -- 0.6
TweakItem("Base.PA_TrenchKnifeC","MaxDamage", 1.2); -- 1.2
TweakItem("Base.PA_TrenchKnifeC","MaxRange", 0.9); -- 0.9
TweakItem("Base.PA_TrenchKnifeC","BaseSpeed", 1.0); -- 1.0
TweakItem("Base.PA_TrenchKnifeC","ConditionMax", 10); -- 10
TweakItem("Base.PA_TrenchKnifeC","ConditionLowerChanceOneIn", 20); -- 15
TweakItem("Base.PA_TrenchKnifeC","CriticalChance", 60); -- 50
TweakItem("Base.PA_TrenchKnifeC","CritDmgMultiplier", 2); -- 10
TweakItem("Base.PA_TrenchKnifeC","DoorDamage", 3); -- 1
TweakItem("Base.PA_TrenchKnifeC","TreeDamage", 3); -- 2
TweakItem("Base.PA_TrenchKnifeC","EnduranceMod", 1.0); -- 0.5

TweakItem("Base.PA_TrenchKnifeC2","Weight", 0.5); -- 0.5


--||| Brita Weapon Pack |||---
-- Butterfly Knife
TweakItem("Base.Butterfly","Weight", 0.2); -- 0.2
TweakItem("Base.Butterfly","MinDamage", 0.3); -- 0.2
TweakItem("Base.Butterfly","MaxDamage", 0.6); -- 0.5
TweakItem("Base.Butterfly","MaxRange", 0.85); -- 0.8
TweakItem("Base.Butterfly","BaseSpeed", 1.1); -- 1.0
TweakItem("Base.Butterfly","ConditionMax", 8); -- 50
TweakItem("Base.Butterfly","ConditionLowerChanceOneIn", 12); -- 1
TweakItem("Base.Butterfly","CriticalChance", 40); -- 25
TweakItem("Base.Butterfly","CritDmgMultiplier", 2); -- 4
TweakItem("Base.Butterfly","DoorDamage", 2); -- 1
TweakItem("Base.Butterfly","TreeDamage", 2); -- 2
TweakItem("Base.Butterfly","EnduranceMod", 1.0); -- 0.5

-- Karambit
TweakItem("Base.Karambit","Weight", 0.2); -- 0.2
TweakItem("Base.Karambit","MinDamage", 0.4); -- 0.2
TweakItem("Base.Karambit","MaxDamage", 0.8); -- 0.8
TweakItem("Base.Karambit","MaxRange", 0.85); -- 0.5
TweakItem("Base.Karambit","BaseSpeed", 1.1); -- 1.0
TweakItem("Base.Karambit","ConditionMax", 9); -- 10
TweakItem("Base.Karambit","ConditionLowerChanceOneIn", 14); -- 15
TweakItem("Base.Karambit","CriticalChance", 40); -- 50
TweakItem("Base.Karambit","CritDmgMultiplier", 2); -- 10
TweakItem("Base.Karambit","DoorDamage", 2); -- 1
TweakItem("Base.Karambit","TreeDamage", 2); -- 2
TweakItem("Base.Karambit","EnduranceMod", 1.0); -- 0.5

-- PushDagger
TweakItem("Base.PushDagger","Weight", 0.2); -- 0.2
TweakItem("Base.PushDagger","MinDamage", 0.4); -- 0.2
TweakItem("Base.PushDagger","MaxDamage", 0.8); -- 0.8
TweakItem("Base.PushDagger","MaxRange", 0.85); -- 0.5
TweakItem("Base.PushDagger","BaseSpeed", 1.1); -- 1.0
TweakItem("Base.PushDagger","ConditionMax", 9); -- 10
TweakItem("Base.PushDagger","ConditionLowerChanceOneIn", 14); -- 15
TweakItem("Base.PushDagger","CriticalChance", 40); -- 50
TweakItem("Base.PushDagger","CritDmgMultiplier", 2); -- 10
TweakItem("Base.PushDagger","DoorDamage", 2); -- 1
TweakItem("Base.PushDagger","TreeDamage", 2); -- 2
TweakItem("Base.PushDagger","EnduranceMod", 1.0); -- 0.5

-- RamboKnife
TweakItem("Base.RamboKnife","Weight", 0.8); -- 1.2
TweakItem("Base.RamboKnife","MinDamage", 0.75); -- 0.6
TweakItem("Base.RamboKnife","MaxDamage", 1.5); -- 1.2
TweakItem("Base.RamboKnife","MaxRange", 0.95); -- 0.9
TweakItem("Base.RamboKnife","BaseSpeed", 1.0); -- 1.0
TweakItem("Base.RamboKnife","ConditionMax", 12); -- 10
TweakItem("Base.RamboKnife","ConditionLowerChanceOneIn", 28); -- 15
TweakItem("Base.RamboKnife","CriticalChance", 60); -- 50
TweakItem("Base.RamboKnife","CritDmgMultiplier", 2); -- 10
TweakItem("Base.RamboKnife","DoorDamage", 3); -- 1
TweakItem("Base.RamboKnife","TreeDamage", 3); -- 2
TweakItem("Base.RamboKnife","EnduranceMod", 1.0); -- 0.5


--||| Snake's Mod Pack |||---
-- Military knife
TweakItem("AliceBP.MilitaryKnife","Weight", 0.6); -- 0.5
TweakItem("AliceBP.MilitaryKnife","MinDamage", 0.75); -- 0.6
TweakItem("AliceBP.MilitaryKnife","MaxDamage", 1.5); -- 1.2
TweakItem("AliceBP.MilitaryKnife","MaxRange", 0.92); -- 0.9
TweakItem("AliceBP.MilitaryKnife","BaseSpeed", 1.0); -- 1.0
TweakItem("AliceBP.MilitaryKnife","ConditionMax", 12); -- 10
TweakItem("AliceBP.MilitaryKnife","ConditionLowerChanceOneIn", 22); -- 15
TweakItem("AliceBP.MilitaryKnife","CriticalChance", 60); -- 50
TweakItem("AliceBP.MilitaryKnife","CritDmgMultiplier", 2); -- 10
TweakItem("AliceBP.MilitaryKnife","DoorDamage", 3); -- 1
TweakItem("AliceBP.MilitaryKnife","TreeDamage", 3); -- 2
TweakItem("AliceBP.MilitaryKnife","EnduranceMod", 1.0); -- 0.5
-- Spear with Military Knife
TweakItem("AliceBP.SpearMilitaryKnife","Weight", 2.2); -- 2.2
TweakItem("AliceBP.SpearMilitaryKnife","MinDamage", 1.0); -- 1.2 
TweakItem("AliceBP.SpearMilitaryKnife","MaxDamage", 1.95); -- 1.7
TweakItem("AliceBP.SpearMilitaryKnife","MinRange", 0.74); -- 0.98
TweakItem("AliceBP.SpearMilitaryKnife","MaxRange", 1.52); -- 1.48
TweakItem("AliceBP.SpearMilitaryKnife","BaseSpeed", 0.95); -- 1.0
TweakItem("AliceBP.SpearMilitaryKnife","ConditionMax", 12); -- 9
TweakItem("AliceBP.SpearMilitaryKnife","ConditionLowerChanceOneIn", 22); -- 8 
TweakItem("AliceBP.SpearMilitaryKnife","CriticalChance", 20); -- 30
TweakItem("AliceBP.SpearMilitaryKnife","CritDmgMultiplier", 2); -- 10
TweakItem("AliceBP.SpearMilitaryKnife","DoorDamage", 4); -- 7
TweakItem("AliceBP.SpearMilitaryKnife","TreeDamage", 3); -- 0
TweakItem("AliceBP.SpearMilitaryKnife","Knockback", 0.3); -- 0.3
TweakItem("AliceBP.SpearMilitaryKnife","KnockdownMod", 0); -- 0

-- Knife Depostador
TweakItem("Base.KnifeDepostador","Weight", 0.5); -- 0.5
TweakItem("Base.KnifeDepostador","MinDamage", 0.6); -- 0.6
TweakItem("Base.KnifeDepostador","MaxDamage", 1.2); -- 1.2
TweakItem("Base.KnifeDepostador","MaxRange", 0.92); -- 0.9
TweakItem("Base.KnifeDepostador","BaseSpeed", 1.0); -- 1.0
TweakItem("Base.KnifeDepostador","ConditionMax", 10); -- 10
TweakItem("Base.KnifeDepostador","ConditionLowerChanceOneIn", 20); -- 15
TweakItem("Base.KnifeDepostador","CriticalChance", 60); -- 50
TweakItem("Base.KnifeDepostador","CritDmgMultiplier", 2); -- 10
TweakItem("Base.KnifeDepostador","DoorDamage", 3); -- 1
TweakItem("Base.KnifeDepostador","TreeDamage", 3); -- 2
TweakItem("Base.KnifeDepostador","EnduranceMod", 1.0); -- 0.5

-- SurvivalKnife2
TweakItem("Base.SurvivalKnife2","Weight", 0.5); -- 0.5
TweakItem("Base.SurvivalKnife2","MinDamage", 0.5); -- 0.6
TweakItem("Base.SurvivalKnife2","MaxDamage", 1.0); -- 1.2
TweakItem("Base.SurvivalKnife2","MaxRange", 0.92); -- 0.9
TweakItem("Base.SurvivalKnife2","BaseSpeed", 1.0); -- 1.0
TweakItem("Base.SurvivalKnife2","ConditionMax", 10); -- 10
TweakItem("Base.SurvivalKnife2","ConditionLowerChanceOneIn", 20); -- 15
TweakItem("Base.SurvivalKnife2","CriticalChance", 40); -- 50
TweakItem("Base.SurvivalKnife2","CritDmgMultiplier", 2); -- 10
TweakItem("Base.SurvivalKnife2","DoorDamage", 2); -- 1
TweakItem("Base.SurvivalKnife2","TreeDamage", 2); -- 2
TweakItem("Base.SurvivalKnife2","EnduranceMod", 1.0); -- 0.5

--|| More Pole Weapons ||--

-- Naginata
TweakItem("MorePoleWeapons.Naginata","Weight", 2.4); -- 1.5
TweakItem("MorePoleWeapons.Naginata","MinDamage", 2.0); -- 1.0
TweakItem("MorePoleWeapons.Naginata","MaxDamage", 4.0); -- 1.5
TweakItem("MorePoleWeapons.Naginata","MinRange", 0.61); -- 0.61
TweakItem("MorePoleWeapons.Naginata","MaxRange", 1.5); -- 1.5
TweakItem("MorePoleWeapons.Naginata","BaseSpeed", 0.9); -- 0.9
TweakItem("MorePoleWeapons.Naginata","ConditionMax", 12); -- 10
TweakItem("MorePoleWeapons.Naginata","ConditionLowerChanceOneIn", 20); -- 25
TweakItem("MorePoleWeapons.Naginata","CriticalChance", 15); -- 30
TweakItem("MorePoleWeapons.Naginata","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.Naginata","DoorDamage", 10); -- 7
TweakItem("MorePoleWeapons.Naginata","TreeDamage", 5); -- 0
TweakItem("MorePoleWeapons.Naginata","Knockback", 0.3); -- 0.3
TweakItem("MorePoleWeapons.Naginata","KnockdownMod", 0); -- 0

-- ClawPollaxe
TweakItem("MorePoleWeapons.ClawPollaxe","Weight", 2.0); -- 1.9
TweakItem("MorePoleWeapons.ClawPollaxe","MinDamage", 0.8); -- 0.7
TweakItem("MorePoleWeapons.ClawPollaxe","MaxDamage", 1.6); -- 1.6
TweakItem("MorePoleWeapons.ClawPollaxe","MinRange", 0.61); -- 0.61
TweakItem("MorePoleWeapons.ClawPollaxe","MaxRange", 1.35); -- 1.3
TweakItem("MorePoleWeapons.ClawPollaxe","BaseSpeed", 0.85); -- 0.82
TweakItem("MorePoleWeapons.ClawPollaxe","ConditionMax", 12); -- 10
TweakItem("MorePoleWeapons.ClawPollaxe","ConditionLowerChanceOneIn", 24); -- 25
TweakItem("MorePoleWeapons.ClawPollaxe","CriticalChance", 15); -- 30
TweakItem("MorePoleWeapons.ClawPollaxe","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.ClawPollaxe","DoorDamage", 20); -- 7
TweakItem("MorePoleWeapons.ClawPollaxe","TreeDamage", 2); -- 0
TweakItem("MorePoleWeapons.ClawPollaxe","Knockback", 0.3); -- 0.3
TweakItem("MorePoleWeapons.ClawPollaxe","KnockdownMod", 0); -- 0

-- BallPeenPollaxe
TweakItem("MorePoleWeapons.BallPeenPollaxe","Weight", 2.0); -- 1.9
TweakItem("MorePoleWeapons.BallPeenPollaxe","MinDamage", 0.8); -- 0.7
TweakItem("MorePoleWeapons.BallPeenPollaxe","MaxDamage", 1.6); -- 1.6
TweakItem("MorePoleWeapons.BallPeenPollaxe","MinRange", 0.61); -- 0.61
TweakItem("MorePoleWeapons.BallPeenPollaxe","MaxRange", 1.35); -- 1.3
TweakItem("MorePoleWeapons.BallPeenPollaxe","BaseSpeed", 0.85); -- 0.82
TweakItem("MorePoleWeapons.BallPeenPollaxe","ConditionMax", 12); -- 10
TweakItem("MorePoleWeapons.BallPeenPollaxe","ConditionLowerChanceOneIn", 24); -- 25
TweakItem("MorePoleWeapons.BallPeenPollaxe","CriticalChance", 15); -- 30
TweakItem("MorePoleWeapons.BallPeenPollaxe","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.BallPeenPollaxe","DoorDamage", 20); -- 7
TweakItem("MorePoleWeapons.BallPeenPollaxe","TreeDamage", 2); -- 0
TweakItem("MorePoleWeapons.BallPeenPollaxe","Knockback", 0.3); -- 0.3
TweakItem("MorePoleWeapons.BallPeenPollaxe","KnockdownMod", 0); -- 0

-- LongSpear
TweakItem("MorePoleWeapons.LongSpear","Weight", 2.2); -- 1.7
TweakItem("MorePoleWeapons.LongSpear","MinDamage", 0.6); -- 1.0
TweakItem("MorePoleWeapons.LongSpear","MaxDamage", 1.2); -- 1.5
TweakItem("MorePoleWeapons.LongSpear","MinRange", 1.2); -- 1.2
TweakItem("MorePoleWeapons.LongSpear","MaxRange", 2.05); -- 2.05
TweakItem("MorePoleWeapons.LongSpear","BaseSpeed", 0.9); -- 0.9
TweakItem("MorePoleWeapons.LongSpear","ConditionMax", 5); -- 5
TweakItem("MorePoleWeapons.LongSpear","ConditionLowerChanceOneIn", 4); -- 2
TweakItem("MorePoleWeapons.LongSpear","CriticalChance", 10); -- 30
TweakItem("MorePoleWeapons.LongSpear","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.LongSpear","DoorDamage", 2); -- 5
TweakItem("MorePoleWeapons.LongSpear","TreeDamage", 0); -- 0

-- LongSpearHuntingKnifeTaped
TweakItem("MorePoleWeapons.LongSpearHuntingKnifeTaped","Weight", 2.7); -- 2.2
TweakItem("MorePoleWeapons.LongSpearHuntingKnifeTaped","MinDamage", 0.9); -- 1.2 
TweakItem("MorePoleWeapons.LongSpearHuntingKnifeTaped","MaxDamage", 1.8); -- 1.7
TweakItem("MorePoleWeapons.LongSpearHuntingKnifeTaped","MinRange", 1.2); -- 0.98
TweakItem("MorePoleWeapons.LongSpearHuntingKnifeTaped","MaxRange", 1.52); -- 1.48
TweakItem("MorePoleWeapons.LongSpearHuntingKnifeTaped","BaseSpeed", 0.85); -- 1.0
TweakItem("MorePoleWeapons.LongSpearHuntingKnifeTaped","ConditionMax", 10); -- 9
TweakItem("MorePoleWeapons.LongSpearHuntingKnifeTaped","ConditionLowerChanceOneIn", 20); -- 8 
TweakItem("MorePoleWeapons.LongSpearHuntingKnifeTaped","CriticalChance", 20); -- 30
TweakItem("MorePoleWeapons.LongSpearHuntingKnifeTaped","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.LongSpearHuntingKnifeTaped","DoorDamage", 4); -- 7
TweakItem("MorePoleWeapons.LongSpearHuntingKnifeTaped","TreeDamage", 3); -- 0
TweakItem("MorePoleWeapons.LongSpearHuntingKnifeTaped","Knockback", 0.3); -- 0.3
TweakItem("MorePoleWeapons.LongSpearHuntingKnifeTaped","KnockdownMod", 0); -- 0
-- LongSpearHuntingKnife
TweakItem("MorePoleWeapons.LongSpearHuntingKnife","Weight", 2.7); -- 2.2
TweakItem("MorePoleWeapons.LongSpearHuntingKnife","MinDamage", 0.9); -- 1.2 
TweakItem("MorePoleWeapons.LongSpearHuntingKnife","MaxDamage", 1.8); -- 1.7
TweakItem("MorePoleWeapons.LongSpearHuntingKnife","MinRange", 1.2); -- 0.98
TweakItem("MorePoleWeapons.LongSpearHuntingKnife","MaxRange", 1.52); -- 1.48
TweakItem("MorePoleWeapons.LongSpearHuntingKnife","BaseSpeed", 0.85); -- 1.0
TweakItem("MorePoleWeapons.LongSpearHuntingKnife","ConditionMax", 10); -- 9
TweakItem("MorePoleWeapons.LongSpearHuntingKnife","ConditionLowerChanceOneIn", 20); -- 8 
TweakItem("MorePoleWeapons.LongSpearHuntingKnife","CriticalChance", 20); -- 30
TweakItem("MorePoleWeapons.LongSpearHuntingKnife","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.LongSpearHuntingKnife","DoorDamage", 4); -- 7
TweakItem("MorePoleWeapons.LongSpearHuntingKnife","TreeDamage", 3); -- 0
TweakItem("MorePoleWeapons.LongSpearHuntingKnife","Knockback", 0.3); -- 0.3
TweakItem("MorePoleWeapons.LongSpearHuntingKnife","KnockdownMod", 0); -- 0

-- LongSpearIcePickTaped
TweakItem("MorePoleWeapons.LongSpearIcePickTaped","Weight", 2.5); -- 2.0
TweakItem("MorePoleWeapons.LongSpearIcePickTaped","MinDamage", 0.85); -- 1.0
TweakItem("MorePoleWeapons.LongSpearIcePickTaped","MaxDamage", 1.7); -- 1.6
TweakItem("MorePoleWeapons.LongSpearIcePickTaped","MinRange", 1.2); -- 0.98
TweakItem("MorePoleWeapons.LongSpearIcePickTaped","MaxRange", 2.07); -- 1.42
TweakItem("MorePoleWeapons.LongSpearIcePickTaped","BaseSpeed", 0.85); -- 1.0
TweakItem("MorePoleWeapons.LongSpearIcePickTaped","ConditionMax", 7); -- 6
TweakItem("MorePoleWeapons.LongSpearIcePickTaped","ConditionLowerChanceOneIn", 21); -- 3
TweakItem("MorePoleWeapons.LongSpearIcePickTaped","CriticalChance", 20); -- 30
TweakItem("MorePoleWeapons.LongSpearIcePickTaped","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.LongSpearIcePickTaped","DoorDamage", 2); -- 5
TweakItem("MorePoleWeapons.LongSpearIcePickTaped","TreeDamage", 1); -- 0
TweakItem("MorePoleWeapons.LongSpearIcePickTaped","Knockback", 0.3); -- 0.3
TweakItem("MorePoleWeapons.LongSpearIcePickTaped","KnockdownMod", 0); -- 0
-- LongSpearIcePick
TweakItem("MorePoleWeapons.LongSpearIcePick","Weight", 2.5); -- 2.0
TweakItem("MorePoleWeapons.LongSpearIcePick","MinDamage", 0.85); -- 1.0
TweakItem("MorePoleWeapons.LongSpearIcePick","MaxDamage", 1.7); -- 1.6
TweakItem("MorePoleWeapons.LongSpearIcePick","MinRange", 1.2); -- 0.98
TweakItem("MorePoleWeapons.LongSpearIcePick","MaxRange", 2.07); -- 1.42
TweakItem("MorePoleWeapons.LongSpearIcePick","BaseSpeed", 0.85); -- 1.0
TweakItem("MorePoleWeapons.LongSpearIcePick","ConditionMax", 7); -- 6
TweakItem("MorePoleWeapons.LongSpearIcePick","ConditionLowerChanceOneIn", 21); -- 3
TweakItem("MorePoleWeapons.LongSpearIcePick","CriticalChance", 20); -- 30
TweakItem("MorePoleWeapons.LongSpearIcePick","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.LongSpearIcePick","DoorDamage", 2); -- 5
TweakItem("MorePoleWeapons.LongSpearIcePick","TreeDamage", 1); -- 0
TweakItem("MorePoleWeapons.LongSpearIcePick","Knockback", 0.3); -- 0.3
TweakItem("MorePoleWeapons.LongSpearIcePick","KnockdownMod", 0); -- 0

-- ClawPollaxeIcePick
TweakItem("MorePoleWeapons.ClawPollaxeIcePick","Weight", 2.3); -- 1.9
TweakItem("MorePoleWeapons.ClawPollaxeIcePick","MinDamage", 1.0); -- 0.7
TweakItem("MorePoleWeapons.ClawPollaxeIcePick","MaxDamage", 2.4); -- 1.6
TweakItem("MorePoleWeapons.ClawPollaxeIcePick","MinRange", 0.61); -- 0.61
TweakItem("MorePoleWeapons.ClawPollaxeIcePick","MaxRange", 1.36); -- 1.3
TweakItem("MorePoleWeapons.ClawPollaxeIcePick","BaseSpeed", 0.83); -- 0.82
TweakItem("MorePoleWeapons.ClawPollaxeIcePick","ConditionMax", 10); -- 10
TweakItem("MorePoleWeapons.ClawPollaxeIcePick","ConditionLowerChanceOneIn", 12); -- 25
TweakItem("MorePoleWeapons.ClawPollaxeIcePick","CriticalChance", 20); -- 30
TweakItem("MorePoleWeapons.ClawPollaxeIcePick","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.ClawPollaxeIcePick","DoorDamage", 21); -- 7
TweakItem("MorePoleWeapons.ClawPollaxeIcePick","TreeDamage", 3); -- 0
TweakItem("MorePoleWeapons.ClawPollaxeIcePick","Knockback", 0.3); -- 0.3
TweakItem("MorePoleWeapons.ClawPollaxeIcePick","KnockdownMod", 0); -- 0

-- BallPeenPollaxeIcePick
TweakItem("MorePoleWeapons.BallPeenPollaxeIcePick","Weight", 2.3); -- 1.9
TweakItem("MorePoleWeapons.BallPeenPollaxeIcePick","MinDamage", 1.0); -- 0.7
TweakItem("MorePoleWeapons.BallPeenPollaxeIcePick","MaxDamage", 2.4); -- 1.6
TweakItem("MorePoleWeapons.BallPeenPollaxeIcePick","MinRange", 0.61); -- 0.61
TweakItem("MorePoleWeapons.BallPeenPollaxeIcePick","MaxRange", 1.36); -- 1.3
TweakItem("MorePoleWeapons.BallPeenPollaxeIcePick","BaseSpeed", 0.83); -- 0.82
TweakItem("MorePoleWeapons.BallPeenPollaxeIcePick","ConditionMax", 10); -- 10
TweakItem("MorePoleWeapons.BallPeenPollaxeIcePick","ConditionLowerChanceOneIn", 12); -- 25
TweakItem("MorePoleWeapons.BallPeenPollaxeIcePick","CriticalChance", 20); -- 30
TweakItem("MorePoleWeapons.BallPeenPollaxeIcePick","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.BallPeenPollaxeIcePick","DoorDamage", 21); -- 7
TweakItem("MorePoleWeapons.BallPeenPollaxeIcePick","TreeDamage", 3); -- 0
TweakItem("MorePoleWeapons.BallPeenPollaxeIcePick","Knockback", 0.3); -- 0.3
TweakItem("MorePoleWeapons.BallPeenPollaxeIcePick","KnockdownMod", 0); -- 0

-- LongSpearKitchenKnifeTaped
TweakItem("MorePoleWeapons.LongSpearKitchenKnifeTaped","Weight", 2.5); -- 2.0
TweakItem("MorePoleWeapons.LongSpearKitchenKnifeTaped","MinDamage", 0.8); -- 1.0
TweakItem("MorePoleWeapons.LongSpearKitchenKnifeTaped","MaxDamage", 1.6); -- 1.6
TweakItem("MorePoleWeapons.LongSpearKitchenKnifeTaped","MinRange", 1.2); -- 0.98
TweakItem("MorePoleWeapons.LongSpearKitchenKnifeTaped","MaxRange", 2.07); -- 1.45
TweakItem("MorePoleWeapons.LongSpearKitchenKnifeTaped","BaseSpeed", 0.85); -- 1.0
TweakItem("MorePoleWeapons.LongSpearKitchenKnifeTaped","ConditionMax", 8); -- 7
TweakItem("MorePoleWeapons.LongSpearKitchenKnifeTaped","ConditionLowerChanceOneIn", 10); -- 4
TweakItem("MorePoleWeapons.LongSpearKitchenKnifeTaped","CriticalChance", 15); -- 30
TweakItem("MorePoleWeapons.LongSpearKitchenKnifeTaped","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.LongSpearKitchenKnifeTaped","DoorDamage", 3); -- 5
TweakItem("MorePoleWeapons.LongSpearKitchenKnifeTaped","TreeDamage", 2); -- 0
TweakItem("MorePoleWeapons.LongSpearKitchenKnifeTaped","Knockback", 0.3); -- 0.3
TweakItem("MorePoleWeapons.LongSpearKitchenKnifeTaped","KnockdownMod", 0); -- 0
-- LongSpearKitchenKnife
TweakItem("MorePoleWeapons.LongSpearKitchenKnife","Weight", 2.5); -- 2.0
TweakItem("MorePoleWeapons.LongSpearKitchenKnife","MinDamage", 0.8); -- 1.0
TweakItem("MorePoleWeapons.LongSpearKitchenKnife","MaxDamage", 1.6); -- 1.6
TweakItem("MorePoleWeapons.LongSpearKitchenKnife","MinRange", 1.2); -- 0.98
TweakItem("MorePoleWeapons.LongSpearKitchenKnife","MaxRange", 2.07); -- 1.45
TweakItem("MorePoleWeapons.LongSpearKitchenKnife","BaseSpeed", 0.85); -- 1.0
TweakItem("MorePoleWeapons.LongSpearKitchenKnife","ConditionMax", 8); -- 7
TweakItem("MorePoleWeapons.LongSpearKitchenKnife","ConditionLowerChanceOneIn", 10); -- 4
TweakItem("MorePoleWeapons.LongSpearKitchenKnife","CriticalChance", 15); -- 30
TweakItem("MorePoleWeapons.LongSpearKitchenKnife","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.LongSpearKitchenKnife","DoorDamage", 3); -- 5
TweakItem("MorePoleWeapons.LongSpearKitchenKnife","TreeDamage", 2); -- 0
TweakItem("MorePoleWeapons.LongSpearKitchenKnife","Knockback", 0.3); -- 0.3
TweakItem("MorePoleWeapons.LongSpearKitchenKnife","KnockdownMod", 0); -- 0

-- LongSpearScrewdriverTaped
TweakItem("MorePoleWeapons.LongSpearScrewdriverTaped","Weight", 2.5); -- 2.1
TweakItem("MorePoleWeapons.LongSpearScrewdriverTaped","MinDamage", 0.8); -- 1.2
TweakItem("MorePoleWeapons.LongSpearScrewdriverTaped","MaxDamage", 1.6); -- 1.6
TweakItem("MorePoleWeapons.LongSpearScrewdriverTaped","MinRange", 1.2); -- 0.98
TweakItem("MorePoleWeapons.LongSpearScrewdriverTaped","MaxRange", 2.07); -- 1.45
TweakItem("MorePoleWeapons.LongSpearScrewdriverTaped","BaseSpeed", 0.85); -- 1.0
TweakItem("MorePoleWeapons.LongSpearScrewdriverTaped","ConditionMax", 6); -- 7
TweakItem("MorePoleWeapons.LongSpearScrewdriverTaped","ConditionLowerChanceOneIn", 16); -- 4
TweakItem("MorePoleWeapons.LongSpearScrewdriverTaped","CriticalChance", 15); -- 30
TweakItem("MorePoleWeapons.LongSpearScrewdriverTaped","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.LongSpearScrewdriverTaped","DoorDamage", 2); -- 7
TweakItem("MorePoleWeapons.LongSpearScrewdriverTaped","TreeDamage", 1); -- 0
TweakItem("MorePoleWeapons.LongSpearScrewdriverTaped","Knockback", 0.3); -- 0.3
TweakItem("MorePoleWeapons.LongSpearScrewdriverTaped","KnockdownMod", 0); -- 0
-- LongSpearScrewdriver
TweakItem("MorePoleWeapons.LongSpearScrewdriver","Weight", 2.5); -- 2.1
TweakItem("MorePoleWeapons.LongSpearScrewdriver","MinDamage", 0.8); -- 1.2
TweakItem("MorePoleWeapons.LongSpearScrewdriver","MaxDamage", 1.6); -- 1.6
TweakItem("MorePoleWeapons.LongSpearScrewdriver","MinRange", 1.2); -- 0.98
TweakItem("MorePoleWeapons.LongSpearScrewdriver","MaxRange", 2.07); -- 1.45
TweakItem("MorePoleWeapons.LongSpearScrewdriver","BaseSpeed", 0.85); -- 1.0
TweakItem("MorePoleWeapons.LongSpearScrewdriver","ConditionMax", 6); -- 7
TweakItem("MorePoleWeapons.LongSpearScrewdriver","ConditionLowerChanceOneIn", 16); -- 4
TweakItem("MorePoleWeapons.LongSpearScrewdriver","CriticalChance", 15); -- 30
TweakItem("MorePoleWeapons.LongSpearScrewdriver","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.LongSpearScrewdriver","DoorDamage", 2); -- 7
TweakItem("MorePoleWeapons.LongSpearScrewdriver","TreeDamage", 1); -- 0
TweakItem("MorePoleWeapons.LongSpearScrewdriver","Knockback", 0.3); -- 0.3
TweakItem("MorePoleWeapons.LongSpearScrewdriver","KnockdownMod", 0); -- 0

-- LongSpearBreadKnifeTaped
TweakItem("MorePoleWeapons.LongSpearBreadKnifeTaped","Weight", 2.6); -- 2.0
TweakItem("MorePoleWeapons.LongSpearBreadKnifeTaped","MinDamage", 0.8); -- 1.0
TweakItem("MorePoleWeapons.LongSpearBreadKnifeTaped","MaxDamage", 1.55); -- 1.6
TweakItem("MorePoleWeapons.LongSpearBreadKnifeTaped","MinRange", 1.2); -- 0.98
TweakItem("MorePoleWeapons.LongSpearBreadKnifeTaped","MaxRange", 2.07); -- 1.42
TweakItem("MorePoleWeapons.LongSpearBreadKnifeTaped","BaseSpeed", 0.87); -- 1.0
TweakItem("MorePoleWeapons.LongSpearBreadKnifeTaped","ConditionMax", 6); -- 6
TweakItem("MorePoleWeapons.LongSpearBreadKnifeTaped","ConditionLowerChanceOneIn", 14); -- 3
TweakItem("MorePoleWeapons.LongSpearBreadKnifeTaped","CriticalChance", 15); -- 30
TweakItem("MorePoleWeapons.LongSpearBreadKnifeTaped","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.LongSpearBreadKnifeTaped","DoorDamage", 5); -- 5
TweakItem("MorePoleWeapons.LongSpearBreadKnifeTaped","TreeDamage", 1); -- 0
TweakItem("MorePoleWeapons.LongSpearBreadKnifeTaped","Knockback", 0.3); -- 0.3
TweakItem("MorePoleWeapons.LongSpearBreadKnifeTaped","KnockdownMod", 0); -- 0

-- LongSpearScissorsTaped
TweakItem("MorePoleWeapons.LongSpearScissorsTaped","Weight", 2.4); -- 2.1
TweakItem("MorePoleWeapons.LongSpearScissorsTaped","MinDamage", 0.7); -- 1.0
TweakItem("MorePoleWeapons.LongSpearScissorsTaped","MaxDamage", 1.4); -- 1.6
TweakItem("MorePoleWeapons.LongSpearScissorsTaped","MinRange", 1.2); -- 0.98
TweakItem("MorePoleWeapons.LongSpearScissorsTaped","MaxRange", 2.06); -- 1.42
TweakItem("MorePoleWeapons.LongSpearScissorsTaped","BaseSpeed", 0.85); -- 1.0
TweakItem("MorePoleWeapons.LongSpearScissorsTaped","ConditionMax", 8); -- 6
TweakItem("MorePoleWeapons.LongSpearScissorsTaped","ConditionLowerChanceOneIn", 6); -- 3
TweakItem("MorePoleWeapons.LongSpearScissorsTaped","CriticalChance", 10); -- 30
TweakItem("MorePoleWeapons.LongSpearScissorsTaped","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.LongSpearScissorsTaped","DoorDamage", 2); -- 5
TweakItem("MorePoleWeapons.LongSpearScissorsTaped","TreeDamage", 0); -- 0
TweakItem("MorePoleWeapons.LongSpearScissorsTaped","Knockback", 0.3); -- 0.3
TweakItem("MorePoleWeapons.LongSpearScissorsTaped","KnockdownMod", 0); -- 0

-- LongSpearLetterOpenerTaped
TweakItem("MorePoleWeapons.LongSpearLetterOpenerTaped","Weight", 2.4); -- 2.0
TweakItem("MorePoleWeapons.LongSpearLetterOpenerTaped","MinDamage", 0.7); -- 1.0
TweakItem("MorePoleWeapons.LongSpearLetterOpenerTaped","MaxDamage", 1.45); -- 1.6
TweakItem("MorePoleWeapons.LongSpearLetterOpenerTaped","MinRange", 1.2); -- 0.98
TweakItem("MorePoleWeapons.LongSpearLetterOpenerTaped","MaxRange", 2.06); -- 1.42
TweakItem("MorePoleWeapons.LongSpearLetterOpenerTaped","BaseSpeed", 0.87); -- 1.0
TweakItem("MorePoleWeapons.LongSpearLetterOpenerTaped","ConditionMax", 8); -- 6
TweakItem("MorePoleWeapons.LongSpearLetterOpenerTaped","ConditionLowerChanceOneIn", 6); -- 3
TweakItem("MorePoleWeapons.LongSpearLetterOpenerTaped","CriticalChance", 10); -- 30
TweakItem("MorePoleWeapons.LongSpearLetterOpenerTaped","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.LongSpearLetterOpenerTaped","DoorDamage", 2); -- 5
TweakItem("MorePoleWeapons.LongSpearLetterOpenerTaped","TreeDamage", 1); -- 0
TweakItem("MorePoleWeapons.LongSpearLetterOpenerTaped","Knockback", 0.3); -- 0.3
TweakItem("MorePoleWeapons.LongSpearLetterOpenerTaped","KnockdownMod", 0); -- 0

-- LongSpearScalpelTaped
TweakItem("MorePoleWeapons.LongSpearScalpelTaped","Weight", 2.4); -- 2.0
TweakItem("MorePoleWeapons.LongSpearScalpelTaped","MinDamage", 0.65); -- 1.0
TweakItem("MorePoleWeapons.LongSpearScalpelTaped","MaxDamage", 1.6); -- 1.6
TweakItem("MorePoleWeapons.LongSpearScalpelTaped","MinRange", 1.2); -- 0.98
TweakItem("MorePoleWeapons.LongSpearScalpelTaped","MaxRange", 2.06); -- 1.42
TweakItem("MorePoleWeapons.LongSpearScalpelTaped","BaseSpeed", 0.87); -- 1.0
TweakItem("MorePoleWeapons.LongSpearScalpelTaped","ConditionMax", 6); -- 6
TweakItem("MorePoleWeapons.LongSpearScalpelTaped","ConditionLowerChanceOneIn", 6); -- 3
TweakItem("MorePoleWeapons.LongSpearScalpelTaped","CriticalChance", 10); -- 30
TweakItem("MorePoleWeapons.LongSpearScalpelTaped","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.LongSpearScalpelTaped","DoorDamage", 2); -- 5
TweakItem("MorePoleWeapons.LongSpearScalpelTaped","TreeDamage", 0); -- 0
TweakItem("MorePoleWeapons.LongSpearScalpelTaped","Knockback", 0.3); -- 0.3
TweakItem("MorePoleWeapons.LongSpearScalpelTaped","KnockdownMod", 0); -- 0

-- LongSpearHandForkTaped
TweakItem("MorePoleWeapons.LongSpearHandForkTaped","Weight", 2.6); -- 2.2
TweakItem("MorePoleWeapons.LongSpearHandForkTaped","MinDamage", 0.8); -- 1.1
TweakItem("MorePoleWeapons.LongSpearHandForkTaped","MaxDamage", 1.55); -- 1.6
TweakItem("MorePoleWeapons.LongSpearHandForkTaped","MinRange", 1.2); -- 0.98
TweakItem("MorePoleWeapons.LongSpearHandForkTaped","MaxRange", 2.07); -- 1.45
TweakItem("MorePoleWeapons.LongSpearHandForkTaped","BaseSpeed", 0.85); -- 0.95
TweakItem("MorePoleWeapons.LongSpearHandForkTaped","ConditionMax", 10); -- 7
TweakItem("MorePoleWeapons.LongSpearHandForkTaped","ConditionLowerChanceOneIn", 12); -- 4
TweakItem("MorePoleWeapons.LongSpearHandForkTaped","CriticalChance", 15); -- 30
TweakItem("MorePoleWeapons.LongSpearHandForkTaped","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.LongSpearHandForkTaped","DoorDamage", 3); -- 6
TweakItem("MorePoleWeapons.LongSpearHandForkTaped","TreeDamage", 0); -- 0
TweakItem("MorePoleWeapons.LongSpearHandForkTaped","Knockback", 0.3); -- 0.3
TweakItem("MorePoleWeapons.LongSpearHandForkTaped","KnockdownMod", 0); -- 0

-- LongSpearButterKnifeTaped
TweakItem("MorePoleWeapons.LongSpearButterKnifeTaped","Weight", 2.4); -- 2.0
TweakItem("MorePoleWeapons.LongSpearButterKnifeTaped","MinDamage", 0.65); -- 1.0
TweakItem("MorePoleWeapons.LongSpearButterKnifeTaped","MaxDamage", 1.35); -- 1.6
TweakItem("MorePoleWeapons.LongSpearButterKnifeTaped","MinRange", 1.2); -- 0.98
TweakItem("MorePoleWeapons.LongSpearButterKnifeTaped","MaxRange", 2.06); -- 1.42
TweakItem("MorePoleWeapons.LongSpearButterKnifeTaped","BaseSpeed", 0.87); -- 1.0
TweakItem("MorePoleWeapons.LongSpearButterKnifeTaped","ConditionMax", 5); -- 6
TweakItem("MorePoleWeapons.LongSpearButterKnifeTaped","ConditionLowerChanceOneIn", 6); -- 3
TweakItem("MorePoleWeapons.LongSpearButterKnifeTaped","CriticalChance", 10); -- 30
TweakItem("MorePoleWeapons.LongSpearButterKnifeTaped","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.LongSpearButterKnifeTaped","DoorDamage", 2); -- 5
TweakItem("MorePoleWeapons.LongSpearButterKnifeTaped","TreeDamage", 0); -- 0
TweakItem("MorePoleWeapons.LongSpearButterKnifeTaped","Knockback", 0.3); -- 0.3
TweakItem("MorePoleWeapons.LongSpearButterKnifeTaped","KnockdownMod", 0); -- 0

-- LongSpearForkTaped
TweakItem("MorePoleWeapons.LongSpearForkTaped","Weight", 2.3); -- 2.0
TweakItem("MorePoleWeapons.LongSpearForkTaped","MinDamage", 0.65); -- 1.0
TweakItem("MorePoleWeapons.LongSpearForkTaped","MaxDamage", 1.3); -- 1.6
TweakItem("MorePoleWeapons.LongSpearForkTaped","MinRange", 1.02); -- 0.98
TweakItem("MorePoleWeapons.LongSpearForkTaped","MaxRange", 2.05); -- 1.42
TweakItem("MorePoleWeapons.LongSpearForkTaped","BaseSpeed", 0.9); -- 1.0
TweakItem("MorePoleWeapons.LongSpearForkTaped","ConditionMax", 5); -- 6
TweakItem("MorePoleWeapons.LongSpearForkTaped","ConditionLowerChanceOneIn", 6); -- 3
TweakItem("MorePoleWeapons.LongSpearForkTaped","CriticalChance", 10); -- 30
TweakItem("MorePoleWeapons.LongSpearForkTaped","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.LongSpearForkTaped","DoorDamage", 2); -- 5
TweakItem("MorePoleWeapons.LongSpearForkTaped","TreeDamage", 0); -- 0
TweakItem("MorePoleWeapons.LongSpearForkTaped","Knockback", 0.3); -- 0.3
TweakItem("MorePoleWeapons.LongSpearForkTaped","KnockdownMod", 0); -- 0

-- LongSpearSpoonTaped
TweakItem("MorePoleWeapons.LongSpearSpoonTaped","Weight", 2.3); -- 2.0
TweakItem("MorePoleWeapons.LongSpearSpoonTaped","MinDamage", 0.65); -- 1.0
TweakItem("MorePoleWeapons.LongSpearSpoonTaped","MaxDamage", 1.2); -- 1.6
TweakItem("MorePoleWeapons.LongSpearSpoonTaped","MinRange", 1.02); -- 0.98
TweakItem("MorePoleWeapons.LongSpearSpoonTaped","MaxRange", 2.05); -- 1.42
TweakItem("MorePoleWeapons.LongSpearSpoonTaped","BaseSpeed", 0.9); -- 1.0
TweakItem("MorePoleWeapons.LongSpearSpoonTaped","ConditionMax", 10); -- 6
TweakItem("MorePoleWeapons.LongSpearSpoonTaped","ConditionLowerChanceOneIn", 6); -- 3
TweakItem("MorePoleWeapons.LongSpearSpoonTaped","CriticalChance", 10); -- 30
TweakItem("MorePoleWeapons.LongSpearSpoonTaped","CritDmgMultiplier", 2); -- 10
TweakItem("MorePoleWeapons.LongSpearSpoonTaped","DoorDamage", 2); -- 5
TweakItem("MorePoleWeapons.LongSpearSpoonTaped","TreeDamage", 0); -- 0
TweakItem("MorePoleWeapons.LongSpearSpoonTaped","Knockback", 0.3); -- 0.3
TweakItem("MorePoleWeapons.LongSpearSpoonTaped","KnockdownMod", 0); -- 0

-- ShovelSpear
TweakItem("MorePoleWeapons.ShovelSpear","CriticalChance", 10); -- 30
TweakItem("MorePoleWeapons.ShovelSpear","CritDmgMultiplier", 2); -- 30
-- Shovel2Spear
TweakItem("MorePoleWeapons.Shovel2Spear","CriticalChance", 10); -- 30
TweakItem("MorePoleWeapons.Shovel2Spear","CritDmgMultiplier", 2); -- 30
-- SpearShovel
TweakItem("MorePoleWeapons.SpearShovel","CriticalChance", 10); -- 30
TweakItem("MorePoleWeapons.SpearShovel","CritDmgMultiplier", 2); -- 30
-- SpearShovel2
TweakItem("MorePoleWeapons.SpearShovel2","CriticalChance", 10); -- 30
TweakItem("MorePoleWeapons.SpearShovel2","CritDmgMultiplier", 2); -- 30
-- LongSpearShovel
TweakItem("MorePoleWeapons.LongSpearShovel","CriticalChance", 10); -- 30
TweakItem("MorePoleWeapons.LongSpearShovel","CritDmgMultiplier", 2); -- 30
-- LongSpearShovel2
TweakItem("MorePoleWeapons.LongSpearShovel2","CriticalChance", 10); -- 30
TweakItem("MorePoleWeapons.LongSpearShovel2","CritDmgMultiplier", 2); -- 30


--|| SilentsGlassShiv ||--

-- Glass Shiv
TweakItem("SilentsGlassShiv.GlassShiv","Weight", 0.3); -- 0.75
TweakItem("SilentsGlassShiv.GlassShiv","MinDamage", 0.3); -- 0.4
TweakItem("SilentsGlassShiv.GlassShiv","MaxDamage", 0.6); -- 0.6
TweakItem("SilentsGlassShiv.GlassShiv","MaxRange", 0.85); -- 0.85
TweakItem("SilentsGlassShiv.GlassShiv","BaseSpeed", 1.1); -- 1.0
TweakItem("SilentsGlassShiv.GlassShiv","ConditionMax", 6); -- 6
TweakItem("SilentsGlassShiv.GlassShiv","ConditionLowerChanceOneIn", 4); -- 7
TweakItem("SilentsGlassShiv.GlassShiv","CriticalChance", 20); -- 20
TweakItem("SilentsGlassShiv.GlassShiv","CritDmgMultiplier", 2); -- 2
TweakItem("SilentsGlassShiv.GlassShiv","EnduranceMod", 1.0); -- 0.5
-- Spear With Glass Shiv
TweakItem("SilentsGlassShiv.SpearGlassShiv","Weight", 1.9); -- 2.1
TweakItem("SilentsGlassShiv.SpearGlassShiv","MinDamage", 0.75); -- 1.2
TweakItem("SilentsGlassShiv.SpearGlassShiv","MaxDamage", 1.5); -- 1.6
TweakItem("SilentsGlassShiv.SpearGlassShiv","MinRange", 0.74); -- 0.98
TweakItem("SilentsGlassShiv.SpearGlassShiv","MaxRange", 1.44); -- 1.45
TweakItem("SilentsGlassShiv.SpearGlassShiv","BaseSpeed", 0.95); -- 1.0
TweakItem("SilentsGlassShiv.SpearGlassShiv","ConditionMax", 6); -- 7
TweakItem("SilentsGlassShiv.SpearGlassShiv","ConditionLowerChanceOneIn", 6); -- 4
TweakItem("SilentsGlassShiv.SpearGlassShiv","CriticalChance", 10); -- 30
TweakItem("SilentsGlassShiv.SpearGlassShiv","CritDmgMultiplier", 2); -- 10
TweakItem("SilentsGlassShiv.SpearGlassShiv","DoorDamage", 2); -- 7
TweakItem("SilentsGlassShiv.SpearGlassShiv","TreeDamage", 1); -- 0
TweakItem("SilentsGlassShiv.SpearGlassShiv","Knockback", 0.3); -- 0.3
TweakItem("SilentsGlassShiv.SpearGlassShiv","KnockdownMod", 0); -- 0


--|| Ssaulavi ||--

-- StaffCrafted
TweakItem("Ssaulavi.StaffCrafted","MaxDamage", 0.7); -- 0.6
TweakItem("Ssaulavi.StaffCrafted","MaxRange", 1.4); -- 0.85
TweakItem("Ssaulavi.StaffCrafted","CriticalChance", 5); -- 30
TweakItem("Ssaulavi.StaffCrafted","CritDmgMultiplier", 2); -- 

-- SMSpear
TweakItem("Ssaulavi.SMSpear","CriticalChance", 15); -- 30
TweakItem("Ssaulavi.SMSpear","CritDmgMultiplier", 2); -- 

-- SMSpear
TweakItem("Ssaulavi.INaginata","MaxDamage", 1.6); -- 0.6
TweakItem("Ssaulavi.INaginata","MaxRange", 3.2); -- 0.85
TweakItem("Ssaulavi.INaginata","CriticalChance", 15); -- 40
TweakItem("Ssaulavi.INaginata","CritDmgMultiplier", 2); -- 


--|| Gunrunner's Weapon Pack (A VFE Expansion) ||--

-- MoraKnife
TweakItem("GWP.MoraKnife","Weight", 0.3); -- 0.5
TweakItem("GWP.MoraKnife","MinDamage", 0.6); -- 0.6
TweakItem("GWP.MoraKnife","MaxDamage", 1.2); -- 1.2
TweakItem("GWP.MoraKnife","MaxRange", 0.85); -- 0.9
TweakItem("GWP.MoraKnife","BaseSpeed", 1.1); -- 1.0
TweakItem("GWP.MoraKnife","ConditionMax", 10); -- 10
TweakItem("GWP.MoraKnife","ConditionLowerChanceOneIn", 22); -- 15
TweakItem("GWP.MoraKnife","CriticalChance", 40); -- 50
TweakItem("GWP.MoraKnife","CritDmgMultiplier", 2); -- 10
TweakItem("GWP.MoraKnife","DoorDamage", 2); -- 1
TweakItem("GWP.MoraKnife","TreeDamage", 2); -- 2
TweakItem("GWP.MoraKnife","EnduranceMod", 1.0); -- 0.5


--|| Spears+ ||--

-- Spear with Chipped Stone
TweakItem("BTW.SpearChippedStone","Weight", 1.9); -- 2.0
TweakItem("BTW.SpearChippedStone","MinDamage", 0.7); -- 1.0
TweakItem("BTW.SpearChippedStone","MaxDamage", 1.4); -- 1.6
TweakItem("BTW.SpearChippedStone","MinRange", 0.74); -- 0.98
TweakItem("BTW.SpearChippedStone","MaxRange", 1.44); -- 1.45
TweakItem("BTW.SpearChippedStone","BaseSpeed", 0.95); -- 1.0
TweakItem("BTW.SpearChippedStone","ConditionMax", 8); -- 7
TweakItem("BTW.SpearChippedStone","ConditionLowerChanceOneIn", 6); -- 4
TweakItem("BTW.SpearChippedStone","CriticalChance", 15); -- 30
TweakItem("BTW.SpearChippedStone","CritDmgMultiplier", 2); -- 10
TweakItem("BTW.SpearChippedStone","DoorDamage", 3); -- 5
TweakItem("BTW.SpearChippedStone","TreeDamage", 2); -- 0
TweakItem("BTW.SpearChippedStone","Knockback", 0.3); -- 0.3
TweakItem("BTW.SpearChippedStone","KnockdownMod", 0); -- 0


--|| Sapph's Cooking ||--

-- Chef Knife 1
TweakItem("SapphCooking.ChefKnife1","Weight", 0.3); -- 0.4
TweakItem("SapphCooking.ChefKnife1","MinDamage", 0.45); -- 0.6
TweakItem("SapphCooking.ChefKnife1","MaxDamage", 0.9); -- 1.0
TweakItem("SapphCooking.ChefKnife1","MaxRange", 0.9); -- 0.9
TweakItem("SapphCooking.ChefKnife1","BaseSpeed", 1.0); -- 1.0
TweakItem("SapphCooking.ChefKnife1","ConditionMax", 8); -- 10
TweakItem("SapphCooking.ChefKnife1","ConditionLowerChanceOneIn", 10); -- 15
TweakItem("SapphCooking.ChefKnife1","CriticalChance", 40); -- 30
TweakItem("SapphCooking.ChefKnife1","CritDmgMultiplier", 2); -- 3
TweakItem("SapphCooking.ChefKnife1","DoorDamage", 2); -- 1
TweakItem("SapphCooking.ChefKnife1","TreeDamage", 2); -- 1
TweakItem("SapphCooking.ChefKnife1","EnduranceMod", 1.0); -- 0.5

-- Chef Knife 2
TweakItem("SapphCooking.ChefKnife2","Weight", 0.3); -- 0.4
TweakItem("SapphCooking.ChefKnife2","MinDamage", 0.45); -- 0.6
TweakItem("SapphCooking.ChefKnife2","MaxDamage", 0.9); -- 1.0
TweakItem("SapphCooking.ChefKnife2","MaxRange", 0.9); -- 0.9
TweakItem("SapphCooking.ChefKnife2","BaseSpeed", 1.0); -- 1.0
TweakItem("SapphCooking.ChefKnife2","ConditionMax", 8); -- 10
TweakItem("SapphCooking.ChefKnife2","ConditionLowerChanceOneIn", 10); -- 15
TweakItem("SapphCooking.ChefKnife2","CriticalChance", 40); -- 30
TweakItem("SapphCooking.ChefKnife2","CritDmgMultiplier", 2); -- 3
TweakItem("SapphCooking.ChefKnife2","DoorDamage", 2); -- 1
TweakItem("SapphCooking.ChefKnife2","TreeDamage", 2); -- 1
TweakItem("SapphCooking.ChefKnife2","EnduranceMod", 1.0); -- 0.5

-- Chef Knife 3
TweakItem("SapphCooking.ChefKnife3","Weight", 0.3); -- 0.4
TweakItem("SapphCooking.ChefKnife3","MinDamage", 0.45); -- 0.6
TweakItem("SapphCooking.ChefKnife3","MaxDamage", 0.9); -- 1.0
TweakItem("SapphCooking.ChefKnife3","MaxRange", 0.9); -- 0.9
TweakItem("SapphCooking.ChefKnife3","BaseSpeed", 1.0); -- 1.0
TweakItem("SapphCooking.ChefKnife3","ConditionMax", 8); -- 10
TweakItem("SapphCooking.ChefKnife3","ConditionLowerChanceOneIn", 10); -- 15
TweakItem("SapphCooking.ChefKnife3","CriticalChance", 40); -- 30
TweakItem("SapphCooking.ChefKnife3","CritDmgMultiplier", 2); -- 3
TweakItem("SapphCooking.ChefKnife3","DoorDamage", 2); -- 1
TweakItem("SapphCooking.ChefKnife3","TreeDamage", 2); -- 1
TweakItem("SapphCooking.ChefKnife3","EnduranceMod", 1.0); -- 0.5

-- PizzaCutter
TweakItem("SapphCooking.PizzaCutter","Weight", 0.3); -- 1.0
TweakItem("SapphCooking.PizzaCutter","MinDamage", 0.3); -- 0.4
TweakItem("SapphCooking.PizzaCutter","MaxDamage", 0.6); -- 0.8
TweakItem("SapphCooking.PizzaCutter","MaxRange", 0.85); -- 1.0
TweakItem("SapphCooking.PizzaCutter","BaseSpeed", 1.2); -- 1.2
TweakItem("SapphCooking.PizzaCutter","ConditionMax", 6); -- 10
TweakItem("SapphCooking.PizzaCutter","ConditionLowerChanceOneIn", 12); -- 15
TweakItem("SapphCooking.PizzaCutter","CriticalChance", 10); -- 15
TweakItem("SapphCooking.PizzaCutter","CritDmgMultiplier", 4); -- 5
TweakItem("SapphCooking.PizzaCutter","DoorDamage", 1); -- 20
TweakItem("SapphCooking.PizzaCutter","Knockback", 0.3); -- 0.3
TweakItem("SapphCooking.PizzaCutter","KnockdownMod", 2); -- 2
TweakItem("SapphCooking.PizzaCutter","EnduranceMod", 1.0); -- 1.0


--|| Shark's Kentucky Weapon Pack ||--

-- EntrenchmentTool (SMALL BLADE)
TweakItem("SWP.EntrenchmentTool","Weight", 1.2); -- 1.0
TweakItem("SWP.EntrenchmentTool","MinDamage", 0.7); -- 0.4
TweakItem("SWP.EntrenchmentTool","MaxDamage", 1.4); -- 0.8
TweakItem("SWP.EntrenchmentTool","MaxRange", 1.0); -- 1.0
TweakItem("SWP.EntrenchmentTool","BaseSpeed", 0.9); -- 1.2
TweakItem("SWP.EntrenchmentTool","ConditionMax", 10); -- 10
TweakItem("SWP.EntrenchmentTool","ConditionLowerChanceOneIn", 18); -- 15
TweakItem("SWP.EntrenchmentTool","CriticalChance", 15); -- 15
TweakItem("SWP.EntrenchmentTool","CritDmgMultiplier", 5); -- 5
TweakItem("SWP.EntrenchmentTool","DoorDamage", 5); -- 20
TweakItem("SWP.EntrenchmentTool","Knockback", 0.3); -- 0.30.3
TweakItem("SWP.EntrenchmentTool","KnockdownMod", 2); -- 2
TweakItem("SWP.EntrenchmentTool","EnduranceMod", 1.0); -- 1.0

-- CaneMachete (SMALL BLADE)
TweakItem("SWP.CaneMachete","Weight", 1.0); -- 1.0
TweakItem("SWP.CaneMachete","MinDamage", 1.0); -- 0.4
TweakItem("SWP.CaneMachete","MaxDamage", 2.0); -- 0.8
TweakItem("SWP.CaneMachete","MaxRange", 1.15); -- 1.0
TweakItem("SWP.CaneMachete","BaseSpeed", 1.0); -- 1.2
TweakItem("SWP.CaneMachete","ConditionMax", 10); -- 10
TweakItem("SWP.CaneMachete","ConditionLowerChanceOneIn", 24); -- 15
TweakItem("SWP.CaneMachete","CriticalChance", 20); -- 15
TweakItem("SWP.CaneMachete","CritDmgMultiplier", 4); -- 5
TweakItem("SWP.CaneMachete","DoorDamage", 15); -- 20
TweakItem("SWP.CaneMachete","Knockback", 0.3); -- 0.30.3
TweakItem("SWP.CaneMachete","KnockdownMod", 2); -- 2
TweakItem("SWP.CaneMachete","EnduranceMod", 1.0); -- 1.0

-- BoloKnife  (SMALL BLADE)
TweakItem("SWP.BoloKnife","Weight", 1.2); -- 1.0
TweakItem("SWP.BoloKnife","MinDamage", 0.8); -- 0.4
TweakItem("SWP.BoloKnife","MaxDamage", 1.6); -- 0.8
TweakItem("SWP.BoloKnife","MaxRange", 1.1); -- 1.0
TweakItem("SWP.BoloKnife","BaseSpeed", 1.0); -- 1.2
TweakItem("SWP.BoloKnife","ConditionMax", 10); -- 10
TweakItem("SWP.BoloKnife","ConditionLowerChanceOneIn", 22); -- 15
TweakItem("SWP.BoloKnife","CriticalChance", 20); -- 15
TweakItem("SWP.BoloKnife","CritDmgMultiplier", 4); -- 5
TweakItem("SWP.BoloKnife","DoorDamage", 15); -- 20
TweakItem("SWP.BoloKnife","Knockback", 0.3); -- 0.30.3
TweakItem("SWP.BoloKnife","KnockdownMod", 2); -- 2
TweakItem("SWP.BoloKnife","EnduranceMod", 1.0); -- 1.0

-- Billhook (SMALL BLADE)
TweakItem("SWP.Billhook","Weight", 1.5); -- 1.0
TweakItem("SWP.Billhook","MinDamage", 1.2); -- 0.4
TweakItem("SWP.Billhook","MaxDamage", 2.4); -- 0.8
TweakItem("SWP.Billhook","MaxRange", 1.1); -- 1.0
TweakItem("SWP.Billhook","BaseSpeed", 1.0); -- 1.2
TweakItem("SWP.Billhook","ConditionMax", 10); -- 10
TweakItem("SWP.Billhook","ConditionLowerChanceOneIn", 20); -- 15
TweakItem("SWP.Billhook","CriticalChance", 15); -- 15
TweakItem("SWP.Billhook","CritDmgMultiplier", 5); -- 5
TweakItem("SWP.Billhook","DoorDamage", 15); -- 20
TweakItem("SWP.Billhook","Knockback", 0.3); -- 0.30.3
TweakItem("SWP.Billhook","KnockdownMod", 2); -- 2
TweakItem("SWP.Billhook","EnduranceMod", 1.0); -- 1.0

-- IceAxe (SMALL BLADE)
TweakItem("SWP.IceAxe","Weight", 1.0); -- 1.0
TweakItem("SWP.IceAxe","MinDamage", 0.65); -- 0.4
TweakItem("SWP.IceAxe","MaxDamage", 1.3); -- 0.8
TweakItem("SWP.IceAxe","MaxRange", 1.1); -- 1.0
TweakItem("SWP.IceAxe","BaseSpeed", 1.2); -- 1.2
TweakItem("SWP.IceAxe","ConditionMax", 8); -- 10
TweakItem("SWP.IceAxe","ConditionLowerChanceOneIn", 18); -- 15
TweakItem("SWP.IceAxe","CriticalChance", 30); -- 15
TweakItem("SWP.IceAxe","CritDmgMultiplier", 3); -- 5
TweakItem("SWP.IceAxe","DoorDamage", 5); -- 20
TweakItem("SWP.IceAxe","Knockback", 0.3); -- 0.30.3
TweakItem("SWP.IceAxe","KnockdownMod", 2); -- 2
TweakItem("SWP.IceAxe","EnduranceMod", 1.0); -- 1.0

-- AntiqueBayonet (SMALL BLADE)
TweakItem("SWP.AntiqueBayonet","Weight", 1.5); -- 0.5
TweakItem("SWP.AntiqueBayonet","MinDamage", 1.0); -- 0.6
TweakItem("SWP.AntiqueBayonet","MaxDamage", 2.0); -- 1.2
TweakItem("SWP.AntiqueBayonet","MaxRange", 1.2); -- 0.9
TweakItem("SWP.AntiqueBayonet","BaseSpeed", 0.95); -- 1.0
TweakItem("SWP.AntiqueBayonet","ConditionMax", 12); -- 10
TweakItem("SWP.AntiqueBayonet","ConditionLowerChanceOneIn", 20); -- 15
TweakItem("SWP.AntiqueBayonet","CriticalChance", 20); -- 50
TweakItem("SWP.AntiqueBayonet","CritDmgMultiplier", 4); -- 10
TweakItem("SWP.AntiqueBayonet","DoorDamage", 5); -- 1
TweakItem("SWP.AntiqueBayonet","TreeDamage", 1); -- 2
TweakItem("SWP.AntiqueBayonet","EnduranceMod", 1.0); -- 0.5

-- TacticalUtilityKnife (SMALL BLADE)
TweakItem("SWP.TacticalUtilityKnife","Weight", 0.5); -- 0.5
TweakItem("SWP.TacticalUtilityKnife","MinDamage", 0.65); -- 0.6
TweakItem("SWP.TacticalUtilityKnife","MaxDamage", 1.3); -- 1.2
TweakItem("SWP.TacticalUtilityKnife","MaxRange", 0.9); -- 0.9
TweakItem("SWP.TacticalUtilityKnife","BaseSpeed", 1.0); -- 1.0
TweakItem("SWP.TacticalUtilityKnife","ConditionMax", 10); -- 10
TweakItem("SWP.TacticalUtilityKnife","ConditionLowerChanceOneIn", 20); -- 15
TweakItem("SWP.TacticalUtilityKnife","CriticalChance", 60); -- 50
TweakItem("SWP.TacticalUtilityKnife","CritDmgMultiplier", 2); -- 10
TweakItem("SWP.TacticalUtilityKnife","DoorDamage", 3); -- 1
TweakItem("SWP.TacticalUtilityKnife","TreeDamage", 3); -- 2
TweakItem("SWP.TacticalUtilityKnife","EnduranceMod", 1.0); -- 0.5

-- PikePole (SPEAR)
TweakItem("SWP.PikePole","Weight", 2.5); -- 1.5
TweakItem("SWP.PikePole","MinDamage", 1.1); -- 1.0
TweakItem("SWP.PikePole","MaxDamage", 2.2); -- 1.5
TweakItem("SWP.PikePole","MinRange", 0.61); -- 0.61
TweakItem("SWP.PikePole","MaxRange", 1.40); -- 1.37
TweakItem("SWP.PikePole","BaseSpeed", 0.85); -- 0.9
TweakItem("SWP.PikePole","ConditionMax", 10); -- 10
TweakItem("SWP.PikePole","ConditionLowerChanceOneIn", 30); -- 15
TweakItem("SWP.PikePole","CriticalChance", 20); -- 30
TweakItem("SWP.PikePole","CritDmgMultiplier", 2); -- 10
TweakItem("SWP.PikePole","DoorDamage", 5); -- 7
TweakItem("SWP.PikePole","TreeDamage", 0); -- 0
TweakItem("SWP.PikePole","Knockback", 0.3); -- 0.3
TweakItem("SWP.PikePole","KnockdownMod", 0); -- 0

-- BushAxe (SPEAR)
TweakItem("SWP.BushAxe","Weight", 3.0); -- 1.5
TweakItem("SWP.BushAxe","MinDamage", 1.2); -- 1.0
TweakItem("SWP.BushAxe","MaxDamage", 2.4); -- 1.5
TweakItem("SWP.BushAxe","MinRange", 0.61); -- 0.61
TweakItem("SWP.BushAxe","MaxRange", 1.35); -- 1.37
TweakItem("SWP.BushAxe","BaseSpeed", 0.9); -- 0.9
TweakItem("SWP.BushAxe","ConditionMax", 12); -- 10
TweakItem("SWP.BushAxe","ConditionLowerChanceOneIn", 24); -- 15
TweakItem("SWP.BushAxe","CriticalChance", 10); -- 30
TweakItem("SWP.BushAxe","CritDmgMultiplier", 2); -- 10
TweakItem("SWP.BushAxe","DoorDamage", 8); -- 7
TweakItem("SWP.BushAxe","TreeDamage", 8); -- 0
TweakItem("SWP.BushAxe","Knockback", 0.3); -- 0.3
TweakItem("SWP.BushAxe","KnockdownMod", 0); -- 0

-- CavalrySaber
TweakItem("SWP.CavalrySaber","Weight", 2.2); -- 0.5
TweakItem("SWP.CavalrySaber","MinDamage", 2.0); -- 0.6
TweakItem("SWP.CavalrySaber","MaxDamage", 3.0); -- 1.2
TweakItem("SWP.CavalrySaber","MaxRange", 1.34); -- 0.9
TweakItem("SWP.CavalrySaber","BaseSpeed", 0.95); -- 1.0
TweakItem("SWP.CavalrySaber","ConditionMax", 12); -- 10
TweakItem("SWP.CavalrySaber","ConditionLowerChanceOneIn", 26); -- 15
TweakItem("SWP.CavalrySaber","CriticalChance", 20); -- 50
TweakItem("SWP.CavalrySaber","CritDmgMultiplier", 4); -- 10
TweakItem("SWP.CavalrySaber","DoorDamage", 8); -- 1
TweakItem("SWP.CavalrySaber","TreeDamage", 8); -- 2
TweakItem("SWP.CavalrySaber","EnduranceMod", 1.0); -- 0.5