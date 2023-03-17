if not ISHotbarAttachDefinition then return end

local slotsName = {
	Weapon = getText("IGUI_HotbarAttachment_NATTWeapon"),
	ShortWeapon = getText("IGUI_HotbarAttachment_NATTShortWeapon"),
	UtilityLeft = getText("IGUI_HotbarAttachment_NATTUtilityLeft"),
	UtilityRight = getText("IGUI_HotbarAttachment_NATTUtilityRight"),
	Left = getText("IGUI_HotbarAttachment_NATTLeft"),
	Right = getText("IGUI_HotbarAttachment_NATTRight"),
	Container = getText("IGUI_HotbarAttachment_NATTContainer"),
	ContainerSmallLeft = getText("IGUI_HotbarAttachment_NATTContainerSmallLeft"),
	ContainerSmallRight = getText("IGUI_HotbarAttachment_NATTContainerSmallRight"),
	Flashlight = getText("IGUI_HotbarAttachment_NATTFlashlight"),
	Bedroll = getText("IGUI_HotbarAttachment_NATTBedroll"),
}

NATTSlotsName = {}
local done = {}
for _,v in pairs(NATTBackpacks) do
	if not done[v] then
		local slot = {
			type = v.."Weapon",
			name = slotsName.Weapon,
			animset = "back",
			attachments = {
				Hammer = v.."Weapon",
				Nightstick = v.."Weapon",
				SNightstick = v.."SNightstick",
				MeatCleaver = v.."Weapon",
				Knife = v.."Weapon",
				Screwdriver = v.."Weapon",
				Wrench = v.."Wrench",
				BigBlade = v.."Weapon",
				BigBonk = v.."Weapon",
				BigWeapon = v.."WeaponBig",
				Shovel = v.."WeaponShovel",
				Rifle = v.."Rifle",
				Pan = v.."WeaponPan",
				Saucepan = v.."WeaponSaucePan",
			},
		}
		NATTSlotsName[slot.type] = slot.name
		table.insert(ISHotbarAttachDefinition, slot);

		slot = {
			type = v.."ShortWeapon",
			name = slotsName.ShortWeapon,
			animset = "back",
			attachments = {
				Hammer = v.."Weapon",
				Nightstick = v.."Weapon",
				SNightstick = v.."SNightstick",
				MeatCleaver = v.."Weapon",
				Knife = v.."Weapon",
				Screwdriver = v.."Weapon",
				Wrench = v.."Wrench",
				Pan = v.."WeaponPan",
				Saucepan = v.."WeaponSaucePan",
			},
		}
		NATTSlotsName[slot.type] = slot.name
		table.insert(ISHotbarAttachDefinition, slot);

		slot = {
			type = v.."UtilityLeft",
			name = slotsName.UtilityLeft, 
			animset = "back",
			attachments = {
				Doll = v.."ulDoll",
				DogChew  = v.."ulDogChew",
				CatToy  = v.."ulCatToy",
				RubberDucky  = v.."ulRubberDucky",
				ToyBear  = v.."ulToyBear",
				ToyCar  = v.."ulToyCar",
				Yoyo  = v.."ulYoyo",
				Cube  = v.."ulCube",
				Mask  = v.."ulMask",
				MaskGround  = v.."ulMaskGround",
				Plushie  = v.."ulPlushie",
				SpiffoPlushie = v.."ulPlushie",
				PAWSPlushie  = v.."ulPAWSPlushie",
				BalloonSlot = v.."ulBallon",
				RubberDuck = v.."ulRubberDucky",
				TeddyBear = v.."ulToyBear",
				Dawn  = v.."ulDawn",
				Hammer = v.."ulWeapon",
				MeatCleaver = v.."ulWeapon",
				Knife = v.."ulWeapon",
				Screwdriver = v.."ulWeapon",
				Nightstick = v.."ulWeapon",
				SNightstick = v.."ulSNightstick",
				Wrench = v.."ulWrench",
				Pan = v.."ulWeaponPan",
				Saucepan = v.."ulWeaponSaucePan",
				Bottle = v.."ulBottle",
				Wine = v.."ulWine",
				Canteen = v.."ulBottle",
				WaterBottle = v.."ulBottle",
				Sodacan = v.."ulBottle",
				PillBottle = v.."ulBottle",
			},
		}
		NATTSlotsName[slot.type] = slot.name
		table.insert(ISHotbarAttachDefinition, slot);

		slot = {
			type = v.."UtilityRight",
			name = slotsName.UtilityRight,
			animset = "back",
			attachments = {
				Doll = v.."urDoll",
				DogChew  = v.."urDogChew",
				CatToy  = v.."urCatToy",
				RubberDucky  = v.."urRubberDucky",
				ToyBear  = v.."urToyBear",
				ToyCar  = v.."urToyCar",
				Yoyo  = v.."urYoyo",
				Cube  = v.."urCube",
				Mask  = v.."urMask",
				MaskGround  = v.."urMaskGround",
				Plushie  = v.."urPlushie",
				SpiffoPlushie = v.."urPlushie",
				PAWSPlushie  = v.."urPAWSPlushie",
				BalloonSlot = v.."urBallon",
				RubberDuck = v.."urRubberDucky",
				TeddyBear = v.."urToyBear",
				Dawn  = v.."urDawn",
				Hammer = v.."urWeapon",
				MeatCleaver = v.."urWeapon",
				Knife = v.."urWeapon",
				Screwdriver = v.."urWeapon",
				Nightstick = v.."urWeapon",
				SNightstick = v.."urSNightstick",
				Wrench = v.."urWrench",
				Pan = v.."urWeaponPan",
				Saucepan = v.."urWeaponSaucePan",
				Bottle = v.."urBottle",
				Wine = v.."urWine",
				Canteen = v.."urBottle",
				WaterBottle = v.."urBottle",
				Sodacan = v.."urBottle",
				PillBottle = v.."urBottle",
			},
		}
		NATTSlotsName[slot.type] = slot.name
		table.insert(ISHotbarAttachDefinition, slot);

		slot = {
			type = v.."Left",
			name = slotsName.Left,
			animset = "back",
			attachments = {
				Bottle = v.."Left",
				Wine = v.."WineLeft",
				Canteen = v.."Left",
				WaterBottle = v.."Left",
				Sodacan = v.."Left",
				PillBottle = v.."Left",
			},
		}
		NATTSlotsName[slot.type] = slot.name
		table.insert(ISHotbarAttachDefinition, slot);

		slot = {
			type = v.."Right",
			name = slotsName.Right,
			animset = "back",
			attachments = {
				Bottle = v.."Right",
				Wine = v.."WineRight",
				Canteen = v.."Right",
				WaterBottle = v.."Right",
				Sodacan = v.."Right",
				PillBottle = v.."Right",
			},
		}
		NATTSlotsName[slot.type] = slot.name
		table.insert(ISHotbarAttachDefinition, slot);

		slot = {
			type = v.."Container",
			name = slotsName.Container,
			animset = "back",
			attachments = {
				Container = v.."Container",
				ContainerSeed = v.."ContainerSeed",
				ContainerTool = v.."ContainerTool",
				ContainerCooler = v.."ContainerCooler",
				ContainerTote = v.."ContainerTote",
				ContainerTrash = v.."ContainerTrash",
				ContainerSack = v.."ContainerSack",
				Bag_L4DeadMedkit = v.."ContainerMk"
			},
		}
		NATTSlotsName[slot.type] = slot.name
		table.insert(ISHotbarAttachDefinition, slot);

		slot = {
			type = v.."ContainerSmallLeft",
			name = slotsName.ContainerSmallLeft,
			animset = "back",
			attachments = {
				Container = v.."ContainerSL",
				ContainerSeed = v.."ContainerSeedSL",
				ContainerSack = v.."ContainerSackSL",
			},
		}
		NATTSlotsName[slot.type] = slot.name
		table.insert(ISHotbarAttachDefinition, slot);

		slot = {
			type = v.."ContainerSmallRight",
			name = slotsName.ContainerSmallRight,
			animset = "back",
			attachments = {
				Container = v.."ContainerSR",
				ContainerSeed = v.."ContainerSeedSR",
				ContainerSack = v.."ContainerSackSR",
			},
		}
		NATTSlotsName[slot.type] = slot.name
		table.insert(ISHotbarAttachDefinition, slot);
		
		slot = {
			type = v.."Flashlight",
			name = slotsName.Flashlight, 
			animset = "back",
			attachments = {
				Flashlight = v.."Flashlight",
				HandTorchSmall = v.."Flashlight",
				HandTorch = v.."Flashlight",
				Torchb = v.."Flashlight",
				ChestLight = v.."MilitaryFlashlight",
				PrepperFlashlight = v.."PrepperFlashlight",
				MilitaryFlashlight = v.."AZMilitaryFlashlight",
			},
		}
		NATTSlotsName[slot.type] = slot.name
		table.insert(ISHotbarAttachDefinition, slot);

		slot = {
			type = v.."Bedroll",
			name = slotsName.Bedroll, 
			animset = "back",
			attachments = {
				Bedroll = v.."Bedroll",
			},
		}
		NATTSlotsName[slot.type] = slot.name
		table.insert(ISHotbarAttachDefinition, slot);
		done[v] = true
	end
end