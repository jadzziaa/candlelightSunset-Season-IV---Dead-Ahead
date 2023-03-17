-------------------------------- Code by Tread ----- (Trealak on Steam) -------------------------------
---------------------------------- Developed For Tread's Paint Signs ----------------------------------

require "BuildingObjects\ISUI\ISPaintMenu"

function ISPaintMenu.addSignOption(subMenuPaint, name, wall, painting, r,g,b)
    local blueOption = subMenuPaint:addOption(name, nil, nil);
    local subMenuBlue = ISContextMenu:getNew(subMenuPaint);
    subMenuPaint:addSubMenu(blueOption, subMenuBlue);
	
	----------------------------- Add new submenu ----------------------------
	local subMenuVanilla = ISContextMenu:getNew(subMenuPaint);
    local vanillaSigns = subMenuBlue:addOption(getText("ContextMenu_RSSigns_Vanilla"))
	subMenuPaint:addSubMenu(vanillaSigns, subMenuVanilla);
	--------------------------------------------------------------------------
		---------- Vanilla Signs ----------
		subMenuVanilla:addOption(getText("ContextMenu_SignSkull"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 36, r,g,b);
		subMenuVanilla:addOption(getText("ContextMenu_SignRightArrow"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 32, r,g,b);
		subMenuVanilla:addOption(getText("ContextMenu_SignLeftArrow"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 33, r,g,b);
		subMenuVanilla:addOption(getText("ContextMenu_SignDownArrow"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 34, r,g,b);
		subMenuVanilla:addOption(getText("ContextMenu_SignUpArrow"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 35, r,g,b);
		-----------------------------------
		
	-------------------------------------------------------------------------	
	--------------------------- Add custom submenu --------------------------
	----- Letters & Digits ----
	local subMenuLetters = ISContextMenu:getNew(subMenuPaint);
	local lettersSigns = subMenuBlue:addOption(getText("ContextMenu_RSSigns_Letters"))
	subMenuPaint:addSubMenu(lettersSigns, subMenuLetters);
		--Digits
			local subSubMenuDigits = ISContextMenu:getNew(subMenuPaint);
			local digitsSigns = subMenuLetters:addOption('0-9')
			subMenuLetters:addSubMenu(digitsSigns, subSubMenuDigits);
				subSubMenuDigits:addOption('0', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 700, r,g,b);
				subSubMenuDigits:addOption('1', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 701, r,g,b);
				subSubMenuDigits:addOption('2', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 702, r,g,b);
				subSubMenuDigits:addOption('3', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 703, r,g,b);
				subSubMenuDigits:addOption('4', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 704, r,g,b);
				subSubMenuDigits:addOption('5', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 705, r,g,b);
				subSubMenuDigits:addOption('6', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 706, r,g,b);
				subSubMenuDigits:addOption('7', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 707, r,g,b);
				subSubMenuDigits:addOption('8', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 716, r,g,b);
				subSubMenuDigits:addOption('9', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 717, r,g,b);
		-- A - M
			local subSubMenuAM = ISContextMenu:getNew(subMenuPaint);
			local amSigns = subMenuLetters:addOption('A-M')
			subMenuLetters:addSubMenu(amSigns, subSubMenuAM);
				subSubMenuAM:addOption('A', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 600, r,g,b);
				subSubMenuAM:addOption('B', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 601, r,g,b);
				subSubMenuAM:addOption('C', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 602, r,g,b);
				subSubMenuAM:addOption('D', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 603, r,g,b);
				subSubMenuAM:addOption('E', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 604, r,g,b);
				subSubMenuAM:addOption('F', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 605, r,g,b);
				subSubMenuAM:addOption('G', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 606, r,g,b);
				subSubMenuAM:addOption('H', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 607, r,g,b);
				subSubMenuAM:addOption('I', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 616, r,g,b);
				subSubMenuAM:addOption('J', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 617, r,g,b);
				subSubMenuAM:addOption('K', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 618, r,g,b);
				subSubMenuAM:addOption('L', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 619, r,g,b);
				subSubMenuAM:addOption('M', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 620, r,g,b);
		-- N - Z
			local subSubMenuNZ = ISContextMenu:getNew(subMenuPaint);
			local nzSigns = subMenuLetters:addOption('N-Z')
			subMenuLetters:addSubMenu(nzSigns, subSubMenuNZ);
				subSubMenuNZ:addOption('N', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 621, r,g,b);
				subSubMenuNZ:addOption('O', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 622, r,g,b);
				subSubMenuNZ:addOption('P', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 623, r,g,b);
				subSubMenuNZ:addOption('Q', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 632, r,g,b);
				subSubMenuNZ:addOption('R', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 633, r,g,b);
				subSubMenuNZ:addOption('S', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 634, r,g,b);
				subSubMenuNZ:addOption('T', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 635, r,g,b);
				subSubMenuNZ:addOption('U', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 636, r,g,b);
				subSubMenuNZ:addOption('V', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 637, r,g,b);
				subSubMenuNZ:addOption('W', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 638, r,g,b);
				subSubMenuNZ:addOption('X', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 639, r,g,b);
				subSubMenuNZ:addOption('Y', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 648, r,g,b);
				subSubMenuNZ:addOption('Z', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 649, r,g,b);
		-- Special Signs (writing)
			local subSubMenuspecial = ISContextMenu:getNew(subMenuPaint);
			local specialSigns = subMenuLetters:addOption('% # ? ...')
			subMenuLetters:addSubMenu(specialSigns, subSubMenuspecial);
				subSubMenuspecial:addOption('.', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 650, r,g,b);
				subSubMenuspecial:addOption(',', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 651, r,g,b);
				subSubMenuspecial:addOption('!', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 652, r,g,b);
				subSubMenuspecial:addOption('?', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 653, r,g,b);
				subSubMenuspecial:addOption(':', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 654, r,g,b);
				subSubMenuspecial:addOption('/', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 655, r,g,b);
				subSubMenuspecial:addOption('-', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 718, r,g,b);
				subSubMenuspecial:addOption('+', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 719, r,g,b);
				subSubMenuspecial:addOption('(', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 720, r,g,b);
				subSubMenuspecial:addOption(')', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 721, r,g,b);
				subSubMenuspecial:addOption('=', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 722, r,g,b);
				subSubMenuspecial:addOption('%', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 723, r,g,b);
				subSubMenuspecial:addOption('$', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 732, r,g,b);
				subSubMenuspecial:addOption('#', wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 733, r,g,b);
	
	----- Crafting ----
	local subMenuCrafting = ISContextMenu:getNew(subMenuPaint);
    local craftingSigns = subMenuBlue:addOption(getText("IGUI_perks_Crafting"))
	subMenuPaint:addSubMenu(craftingSigns, subMenuCrafting);
		----- Custom Crafting Signs -----
		subMenuCrafting:addOption(getText("IGUI_ItemCat_Tool"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 400, r,g,b);
		subMenuCrafting:addOption(getText("ContextMenu_RSSigns_Parts"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 401, r,g,b);
		subMenuCrafting:addOption(getText("ContextMenu_RSSigns_Metal"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 402, r,g,b);
		subMenuCrafting:addOption(getText("ContextMenu_RSSigns_Wood"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 403, r,g,b);
		subMenuCrafting:addOption(getText("IGUI_CraftCategory_Electrical"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 404, r,g,b);
		subMenuCrafting:addOption(getText("IGUI_perks_Tailoring"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 405, r,g,b);
		subMenuCrafting:addOption(getText("ContextMenu_RSSigns_Clean"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 406, r,g,b);
		subMenuCrafting:addOption(getText("IGUI_ItemCat_Gardening"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 407, r,g,b);
		subMenuCrafting:addOption(getText("IGUI_ItemCat_Paint"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 416, r,g,b);
	----- Cars ----
	local subMenuCars = ISContextMenu:getNew(subMenuPaint);
    local carsSigns = subMenuBlue:addOption(getText("ContextMenu_RSSigns_Cars"))
	subMenuPaint:addSubMenu(carsSigns, subMenuCars);
		----- Car Signs -----
		subMenuCars:addOption(getText("ContextMenu_RSSigns_Fuel"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 417, r,g,b);
		subMenuCars:addOption(getText("ContextMenu_RSSigns_RegularCar"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 418, r,g,b);
		subMenuCars:addOption(getText("ContextMenu_RSSigns_Truck"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 419, r,g,b);
		subMenuCars:addOption(getText("ContextMenu_RSSigns_SportsCar"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 420, r,g,b);
	----- Food ----
	local subMenuFood = ISContextMenu:getNew(subMenuPaint);
    local foodSigns = subMenuBlue:addOption(getText("IGUI_ItemCat_Food"))
	subMenuPaint:addSubMenu(foodSigns, subMenuFood);
		----- Food Signs -----
		subMenuFood:addOption(getText("IGUI_CraftCategory_Cooking"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 422, r,g,b);
		subMenuFood:addOption(getText("IGUI_ItemCat_Food"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 423, r,g,b);
		subMenuFood:addOption(getText("ContextMenu_RSSigns_FoodFresh"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 432, r,g,b);
		subMenuFood:addOption(getText("ContextMenu_RSSigns_FoodCanned"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 433, r,g,b);
		subMenuFood:addOption(getText("ContextMenu_RSSigns_IceCream"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 434, r,g,b);
		subMenuFood:addOption(getText("ContextMenu_RSSigns_Fish"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 435, r,g,b);
		subMenuFood:addOption(getText("ContextMenu_RSSigns_Meat"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 436, r,g,b);
		subMenuFood:addOption(getText("ContextMenu_RSSigns_Drink"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 437, r,g,b);
		subMenuFood:addOption(getText("IGUI_ItemCat_Water"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 438, r,g,b);
	----- Weapons ----
	local subMenuWeapon = ISContextMenu:getNew(subMenuPaint);
    local weaponSigns = subMenuBlue:addOption(getText("IGUI_ItemCat_Weapon"))
	subMenuPaint:addSubMenu(weaponSigns, subMenuWeapon);
		----- Weapons Signs -----
		subMenuWeapon:addOption(getText("ContextMenu_RSSigns_Bash"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 449, r,g,b);
		subMenuWeapon:addOption(getText("ContextMenu_RSSigns_Cut"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 450, r,g,b);
		subMenuWeapon:addOption(getText("ContextMenu_RSSigns_Ranged"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 451, r,g,b);
		subMenuWeapon:addOption(getText("IGUI_ItemCat_Ammo"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 452, r,g,b);
		subMenuWeapon:addOption(getText("IGUI_ItemCat_Accessory"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 453, r,g,b);
	----- Clothes ----
	local subMenuClothes = ISContextMenu:getNew(subMenuPaint);
    local clothesSigns = subMenuBlue:addOption(getText("IGUI_ItemCat_Clothing"))
	subMenuPaint:addSubMenu(clothesSigns, subMenuClothes);
		----- Clothes Signs -----
		subMenuClothes:addOption(getText("IGUI_ItemCat_Clothing"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 439, r,g,b);
		subMenuClothes:addOption(getText("IGUI_ItemCat_Security"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 448, r,g,b);
	----- Other Items ----
	local subMenuOtherItems = ISContextMenu:getNew(subMenuPaint);
    local otheritemsSigns = subMenuBlue:addOption(getText("ContextMenu_RSSigns_OtherItems"))
	subMenuPaint:addSubMenu(otheritemsSigns, subMenuOtherItems);
		----- Other Items Signs -----
		subMenuOtherItems:addOption(getText("IGUI_ItemCat_Furniture"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 421, r,g,b);
		subMenuOtherItems:addOption(getText("IGUI_ItemCat_FirstAid"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 454, r,g,b);
		subMenuOtherItems:addOption(getText("ContextMenu_RSSigns_Books"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 455, r,g,b);
		subMenuOtherItems:addOption(getText("IGUI_LiteratureUI_RecordedMedia_Retail-VHS"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 500, r,g,b);
		

end