require "Hotbar/ISHotbarAttachDefinition"

if not ISHotbarAttachDefinition then
    return
end

local getActivatedMods = getActivatedMods
local size = size
local get = get

local function isMod(mod_Name)
    local mods = getActivatedMods();
    for i=0, mods:size()-1, 1 do
        if mods:get(i) == mod_Name then
            return true;
        end
    end
    return false;
end

if isMod("Better Belts") and (isMod("Authentic Z - Backpacks+") or isMod("Authentic Z - Current")) then

	print("BetterFlashlights: Better Belts and AuthenicZ installed")

	local MOD_DATA = {
		SmallBeltLeft = {
			Torch 				= "BeltTorchLeft",
			Torchb 				= "BeltTorchLeftSmall",
			TorchSmall			= "BeltTorchLeftSmall",
			HandTorchSmall 		= "BeltTorchLeftVerySmall",
			HandTorchBig 		= "BeltTorchLeftSmall",
			OldFlashlight 		= "BeltOldFlashlightLeft",
			MilitaryFlashlight 	= "Military Flashlight Left",
		},
		SmallBeltRight = {
			Torch 				= "BeltTorchRight",
			Torchb				= "BeltTorchRightSmall",
			TorchSmall			= "BeltTorchRightSmall",
			HandTorchSmall 		= "BeltTorchRightVerySmall",
			HandTorchBig 		= "BeltTorchRightSmall",
			OldFlashlight 		= "BeltOldFlashlightRight",
			MilitaryFlashlight 	= "Military Flashlight Right",
		},
		SchoolbagFlashlight = {
			--Torch 				= "Schoolbag Military Flashlight",
			Torchb				= "Schoolbag Military Flashlight",
			TorchSmall			= "Schoolbag Military Flashlight",
			HandTorchSmall 		= "Schoolbag Military Flashlight",
			HandTorchBig 		= "Schoolbag Military Flashlight",
			OldFlashlight 		= "OldFlashlightOnChest",
			MilitaryFlashlight 	= "Schoolbag Military Flashlight",
		},
		DufflebagFlashlight = {
			--Torch 				= "Dufflebag Military Flashlight",
			Torchb				= "Dufflebag Military Flashlight",
			TorchSmall			= "Dufflebag Military Flashlight",
			HandTorchSmall 		= "Dufflebag Military Flashlight",
			HandTorchBig 		= "Dufflebag Military Flashlight",
			OldFlashlight 		= "OldFlashlightOnChest",
			MilitaryFlashlight 	= "Dufflebag Military Flashlight",
		},
		HikingBagFlashlight = {
			--Torch 				= "HikingBag Military Flashlight",
			Torchb				= "HikingBag Military Flashlight",
			TorchSmall			= "HikingBag Military Flashlight",
			HandTorchSmall 		= "HikingBag Military Flashlight",
			HandTorchBig 		= "HikingBag Military Flashlight",
			OldFlashlight 		= "OldFlashlightOnChest",
			MilitaryFlashlight 	= "HikingBag Military Flashlight",
		},
		BigHikingbagFlashlight = {
			--Torch 				= "BigHikingBag Military Flashlight",
			Torchb				= "BigHikingBag Military Flashlight",
			TorchSmall			= "BigHikingBag Military Flashlight",
			HandTorchSmall 		= "BigHikingBag Military Flashlight",
			HandTorchBig 		= "BigHikingBag Military Flashlight",
			OldFlashlight 		= "OldFlashlightOnChest",
			MilitaryFlashlight 	= "BigHikingBag Military Flashlight",
		},
		AlicepackFlashlight = {
			--Torch 				= "Alicepack Military Flashlight",
			Torchb				= "Alicepack Military Flashlight",
			TorchSmall			= "Alicepack Military Flashlight",
			HandTorchSmall 		= "Alicepack Military Flashlight",
			HandTorchBig 		= "Alicepack Military Flashlight",
			OldFlashlight 		= "OldFlashlightOnChest",
			MilitaryFlashlight 	= "Alicepack Military Flashlight",
		},
		ARVNFlashlight = {
			--Torch 				= "Alicepack Military Flashlight",
			Torchb				= "Alicepack Military Flashlight",
			TorchSmall			= "Alicepack Military Flashlight",
			HandTorchSmall 		= "Alicepack Military Flashlight",
			HandTorchBig 		= "Alicepack Military Flashlight",
			OldFlashlight 		= "OldFlashlightOnChest",
			MilitaryFlashlight 	= "Alicepack Military Flashlight",
		},
		FrontBeltL = {
			Torch 				= "Belt TorchL",
			TorchSmall			= "Belt TorchL",
			HandTorchSmall 		= "Belt TorchL",
			HandTorchBig 		= "Belt TorchL",
			OldFlashlight		= "Belt TorchL",
			MilitaryFlashlight 	= "Military Flashlight Left",
		},
		FrontBeltR = {
			Torch 				= "Belt TorchR",
			TorchSmall			= "Belt TorchR",
			HandTorchSmall 		= "Belt TorchR",
			HandTorchBig 		= "Belt TorchR",
			OldFlashlight		= "Belt TorchR",
			MilitaryFlashlight 	= "Military Flashlight Right",
		},
	}
	for _,t in pairs(ISHotbarAttachDefinition) do
		if t.type and MOD_DATA[t.type] then
			for k,v in pairs(MOD_DATA[t.type]) do
				if v == 0 and t.replacement then
					t.replacement[k] = nil
				elseif t.attachments then
					t.attachments[k] = v ~= 0 and v or nil
				else
					print('ERROR: Unknown mod data option.')
				end
			end
		end
	end
	
elseif isMod("Better Belts") then

	print("BetterFlashlights: Better Belts installed")
	
	local MOD_DATA = {
		SmallBeltLeft = {
			Torch 			= "BeltTorchLeft",
			Torchb 			= "BeltTorchLeftSmall",
			TorchSmall		= "BeltTorchLeftSmall",
			HandTorchSmall 	= "BeltTorchLeftVerySmall",
			HandTorchBig 	= "BeltTorchLeftSmall",
			OldFlashlight 	= "BeltOldFlashlightLeft",
		},
		SmallBeltRight = {
			Torch 			= "BeltTorchRight",
			Torchb			= "BeltTorchRightSmall",
			TorchSmall		= "BeltTorchRightSmall",
			HandTorchSmall 	= "BeltTorchRightVerySmall",
			HandTorchBig 	= "BeltTorchRightSmall",
			OldFlashlight 	= "BeltOldFlashlightRight",
		},
		FrontBeltL = {
			Torch 			= "Belt TorchL",
			TorchSmall		= "Belt TorchL",
			HandTorchSmall 	= "Belt TorchL",
			HandTorchBig 	= "Belt TorchL",
			OldFlashlight	= "Belt TorchL",
		},
		FrontBeltR = {
			Torch 			= "Belt TorchR",
			TorchSmall		= "Belt TorchR",
			HandTorchSmall 	= "Belt TorchR",
			HandTorchBig 	= "Belt TorchR",
			OldFlashlight	= "Belt TorchR",
		},
	}
	for _,t in pairs(ISHotbarAttachDefinition) do
		if t.type and MOD_DATA[t.type] then
			for k,v in pairs(MOD_DATA[t.type]) do
				if v == 0 and t.replacement then
					t.replacement[k] = nil
				elseif t.attachments then
					t.attachments[k] = v ~= 0 and v or nil
				else
					print('ERROR: Unknown mod data option.')
				end
			end
		end
	end
	
elseif isMod("Authentic Z - Backpacks+") or isMod("Authentic Z - Current") then

	print("BetterFlashlights: AuthenicZ installed")

	local MOD_DATA = {
		SmallBeltLeft = {
			Torch 				= "BeltTorchLeft",
			Torchb 				= "BeltTorchLeftSmall",
			TorchSmall			= "BeltTorchLeftSmall",
			HandTorchSmall 		= "BeltTorchLeftVerySmall",
			HandTorchBig 		= "BeltTorchLeftSmall",
			OldFlashlight 		= "BeltOldFlashlightLeft",
			MilitaryFlashlight 	= "Military Flashlight Left",
		},
		SmallBeltRight = {
			Torch 				= "BeltTorchRight",
			Torchb				= "BeltTorchRightSmall",
			TorchSmall			= "BeltTorchRightSmall",
			HandTorchSmall 		= "BeltTorchRightVerySmall",
			HandTorchBig 		= "BeltTorchRightSmall",
			OldFlashlight 		= "BeltOldFlashlightRight",
			MilitaryFlashlight 	= "Military Flashlight Right",
		},
		SchoolbagFlashlight = {
			--Torch 				= "Schoolbag Military Flashlight",
			Torchb				= "Schoolbag Military Flashlight",
			TorchSmall			= "Schoolbag Military Flashlight",
			HandTorchSmall 		= "Schoolbag Military Flashlight",
			HandTorchBig 		= "Schoolbag Military Flashlight",
			OldFlashlight 		= "OldFlashlightOnChest",
			MilitaryFlashlight 	= "Schoolbag Military Flashlight",
		},
		DufflebagFlashlight = {
			--Torch 				= "Dufflebag Military Flashlight",
			Torchb				= "Dufflebag Military Flashlight",
			TorchSmall			= "Dufflebag Military Flashlight",
			HandTorchSmall 		= "Dufflebag Military Flashlight",
			HandTorchBig 		= "Dufflebag Military Flashlight",
			OldFlashlight 		= "OldFlashlightOnChest",
			MilitaryFlashlight 	= "Dufflebag Military Flashlight",
		},
		HikingBagFlashlight = {
			--Torch 				= "HikingBag Military Flashlight",
			Torchb				= "HikingBag Military Flashlight",
			TorchSmall			= "HikingBag Military Flashlight",
			HandTorchSmall 		= "HikingBag Military Flashlight",
			HandTorchBig 		= "HikingBag Military Flashlight",
			OldFlashlight 		= "OldFlashlightOnChest",
			MilitaryFlashlight 	= "HikingBag Military Flashlight",
		},
		BigHikingbagFlashlight = {
			--Torch 				= "BigHikingBag Military Flashlight",
			Torchb				= "BigHikingBag Military Flashlight",
			TorchSmall			= "BigHikingBag Military Flashlight",
			HandTorchSmall 		= "BigHikingBag Military Flashlight",
			HandTorchBig 		= "BigHikingBag Military Flashlight",
			OldFlashlight 		= "OldFlashlightOnChest",
			MilitaryFlashlight 	= "BigHikingBag Military Flashlight",
		},
		AlicepackFlashlight = {
			--Torch 				= "Alicepack Military Flashlight",
			Torchb				= "Alicepack Military Flashlight",
			TorchSmall			= "Alicepack Military Flashlight",
			HandTorchSmall 		= "Alicepack Military Flashlight",
			HandTorchBig 		= "Alicepack Military Flashlight",
			OldFlashlight 		= "OldFlashlightOnChest",
			MilitaryFlashlight 	= "Alicepack Military Flashlight",
		},
		ARVNFlashlight = {
			--Torch 				= "Alicepack Military Flashlight",
			Torchb				= "Alicepack Military Flashlight",
			TorchSmall			= "Alicepack Military Flashlight",
			HandTorchSmall 		= "Alicepack Military Flashlight",
			HandTorchBig 		= "Alicepack Military Flashlight",
			OldFlashlight 		= "OldFlashlightOnChest",
			MilitaryFlashlight 	= "Alicepack Military Flashlight",
		},
	}
	for _,t in pairs(ISHotbarAttachDefinition) do
		if t.type and MOD_DATA[t.type] then
			for k,v in pairs(MOD_DATA[t.type]) do
				if v == 0 and t.replacement then
					t.replacement[k] = nil
				elseif t.attachments then
					t.attachments[k] = v ~= 0 and v or nil
				else
					print('ERROR: Unknown mod data option.')
				end
			end
		end
	end

else

	print("BetterFlashlights: No Mods installed")
	
	local MOD_DATA = {
		SmallBeltLeft = {
			Torch 			= "BeltTorchLeft",
			Torchb 			= "BeltTorchLeftSmall",
			TorchSmall		= "BeltTorchLeftSmall",
			HandTorchSmall 	= "BeltTorchLeftVerySmall",
			HandTorchBig 	= "BeltTorchLeftSmall",
			OldFlashlight 	= "BeltOldFlashlightLeft",
		},
		SmallBeltRight = {
			Torch 			= "BeltTorchRight",
			Torchb			= "BeltTorchRightSmall",
			TorchSmall		= "BeltTorchRightSmall",
			HandTorchSmall 	= "BeltTorchRightVerySmall",
			HandTorchBig 	= "BeltTorchRightSmall",
			OldFlashlight 	= "BeltOldFlashlightRight",
		},
	}
	for _,t in pairs(ISHotbarAttachDefinition) do
		if t.type and MOD_DATA[t.type] then
			for k,v in pairs(MOD_DATA[t.type]) do
				if v == 0 and t.replacement then
					t.replacement[k] = nil
				elseif t.attachments then
					t.attachments[k] = v ~= 0 and v or nil
				else
					print('ERROR: Unknown mod data option.')
				end
			end
		end
	end
end

local MiningHelmet = {
	type = "MiningHelmet",
	name = "Mining Helmet with Mount",
	animset = "back",
	attachments = {
		TorchSmall			= "OnMiningHelmetTorchSmall",
		Torchb				= "OnMiningHelmetTorchSmall",
		HandTorchSmall 		= "OnMiningHelmetHandTorchSmall",
		HandTorchBig 		= "OnMiningHelmetHandTorchBig",
		HeadLight			= "OnMiningHelmetHeadLight",
	},
}
table.insert(ISHotbarAttachDefinition, MiningHelmet);