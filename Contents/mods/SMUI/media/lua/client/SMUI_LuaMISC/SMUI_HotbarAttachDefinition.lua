require "Hotbar/ISHotbarAttachDefinition"
if not ISHotbarAttachDefinition then
    return
end
----------------------------------------------------------------------------
------------------- Chest-Rig -------------------
----------------------------------------------------------------------------
local SMUIWebbingLeft = {
	type = "SMUIWebbingLeft",
	name = "Webbing Left", -- Name shown in the slot icon
	animset = "back", -- Animation name 
	attachments = {
		Rope 				= "Webbing Rope Left",
		SheetRope 			= "Webbing SheetRope Left",				
		FlareGun 			= "Webbing FlareGun Left",
		Explosive 			= "Webbing Explosive Left",
		AuthenticExplosive  = "Webbing AuthenticExplosive Left",		
		GasMask 			= "Webbing GasMask Left",		
		Walkie				= "Webbing Walkie Left",
		Hammer 				= "Webbing Hammer Left",
		Screwdriver 		= "Webbing Screwdriver Left",
		Knife			 	= "Webbing Knife Left",	
		Saucepan 			= "Webbing Saucepan Left",	
		Pan 				= "Webbing Pan Left",	
		Wrench 				= "Webbing Wrench Left",		
		MeatCleaver 		= "Webbing MeatCleaver Left",
		WaterBottle 		= "Webbing Waterbottle Left",
		Canteen 			= "Webbing Canteen Left",	
		MilitaryFlashlight 	= "Webbing Military Flashlight Left",				
		Holster 			= "Webbing Holster Left",	


 		Gear 				= "Webbing Walkie Left",
		ChestLight  		= "Webbing Military Flashlight Left",	
		Mag   				= "Webbing Hammer Left",
		Tool   				= "Webbing Hammer Left",
		Gas   				= "Webbing GasMask Left",
		Saw   				= "Webbing Hammer Left",
		Bottle    			= "Webbing Waterbottle Left",		
	},
}
table.insert(ISHotbarAttachDefinition, SMUIWebbingLeft);

local SMUIWebbingRight = {
	type = "SMUIWebbingRight",
	name = "Webbing Right", -- Name shown in the slot icon
	animset = "back", -- Animation name 
	attachments = {
		Rope 				= "Webbing Rope Right",
		SheetRope 			= "Webbing SheetRope Right",				
		FlareGun 			= "Webbing FlareGun Right",
		Explosive 			= "Webbing Explosive Right",
		AuthenticExplosive  = "Webbing AuthenticExplosive Right",		
		GasMask 			= "Webbing GasMask Right",		
		Walkie				= "Webbing Walkie Right",
		Hammer 				= "Webbing Hammer Right",
		Screwdriver 		= "Webbing Screwdriver Right",
		Knife			 	= "Webbing Knife Right",	
		Saucepan 			= "Webbing Saucepan Right",	
		Pan 				= "Webbing Pan Right",	
		Wrench 				= "Webbing Wrench Right",		
		MeatCleaver 		= "Webbing MeatCleaver Right",
		WaterBottle 		= "Webbing Waterbottle Right",
		Canteen 			= "Webbing Canteen Right",	
		MilitaryFlashlight 	= "Webbing Military Flashlight Right",				
		Holster 			= "Webbing Holster Right",	


		Gear 				= "Webbing Walkie Right",
		ChestLight  		= "Webbing Military Flashlight Right",	
		Mag   				= "Webbing Hammer Right",
		Tool   				= "Webbing Hammer Right",
		Gas   				= "Webbing GasMask Right",
		Saw   				= "Webbing Hammer Right",		
		Bottle    			= "Webbing Waterbottle Right",		
	},
}
table.insert(ISHotbarAttachDefinition, SMUIWebbingRight);
