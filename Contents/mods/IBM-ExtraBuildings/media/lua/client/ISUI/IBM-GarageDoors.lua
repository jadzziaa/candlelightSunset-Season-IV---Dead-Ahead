ISBlacksmithMenu.buildGarageDoorMenu = function(subMenu, context, option, player)

	-- Garage Doors Section --
	garageOption = subMenu:addOption(getText("ContextMenu_Garages"), worldobjects, nil);
	local subMenuGarage = subMenu:getNew(subMenu);
	context:addSubMenu(garageOption, subMenuGarage);
	
	-- Garage 2 Door Section --
	local garage2DoorOption = subMenuGarage:addOption(getText("ContextMenu_Garages_2_Door"), worldobjects, nil);
	local subMenuGarage2Door = subMenuGarage:getNew(subMenuGarage);
	context:addSubMenu(garage2DoorOption, subMenuGarage2Door);
	
	-- Garage 3 Door Section --
	local garage3DoorOption = subMenuGarage:addOption(getText("ContextMenu_Garages_3_Door"), worldobjects, nil);
	local subMenuGarage3Door = subMenuGarage:getNew(subMenuGarage);
	context:addSubMenu(garage3DoorOption, subMenuGarage3Door);
	
	-- Garage 4 Door Section --
	local garage4DoorOption = subMenuGarage:addOption(getText("ContextMenu_Garages_4_Door"), worldobjects, nil);
	local subMenuGarage4Door = subMenuGarage:getNew(subMenuGarage);
	context:addSubMenu(garage4DoorOption, subMenuGarage4Door);
	
	local sprite = {};
	local spriteIndex;
	local objName = "";
	sprite.sprite = "walls_garage_01_";
	
	objName = getText("ContextMenu_Garage_Door1")
	spriteIndex = 0
	ISBlacksmithMenu.Garage2Doors(subMenuGarage2Door, objName, sprite, spriteIndex, player)
	ISBlacksmithMenu.Garage3Doors(subMenuGarage3Door, objName, sprite, spriteIndex, player)
	ISBlacksmithMenu.Garage4Doors(subMenuGarage4Door, objName, sprite, spriteIndex, player)
	
	spriteIndex = 16
	objName = getText("ContextMenu_Garage_Door2")
	ISBlacksmithMenu.Garage2Doors(subMenuGarage2Door, objName, sprite, spriteIndex, player)
	ISBlacksmithMenu.Garage3Doors(subMenuGarage3Door, objName, sprite, spriteIndex, player)
	ISBlacksmithMenu.Garage4Doors(subMenuGarage4Door, objName, sprite, spriteIndex, player)
	
	spriteIndex = 48
	objName = getText("ContextMenu_Garage_Door3")
	ISBlacksmithMenu.Garage2Doors(subMenuGarage2Door, objName, sprite, spriteIndex, player)
	ISBlacksmithMenu.Garage3Doors(subMenuGarage3Door, objName, sprite, spriteIndex, player)
	ISBlacksmithMenu.Garage4Doors(subMenuGarage4Door, objName, sprite, spriteIndex, player)
	
	sprite = {};
	sprite.sprite = "walls_garage_02_";
	
	spriteIndex = 0
	objName = getText("ContextMenu_Garage_Door4")
	ISBlacksmithMenu.Garage2Doors(subMenuGarage2Door, objName, sprite, spriteIndex, player)
	ISBlacksmithMenu.Garage3Doors(subMenuGarage3Door, objName, sprite, spriteIndex, player)
	ISBlacksmithMenu.Garage4Doors(subMenuGarage4Door, objName, sprite, spriteIndex, player)
	
	spriteIndex = 32
	objName = getText("ContextMenu_Garage_Door5")
	ISBlacksmithMenu.Garage2Doors(subMenuGarage2Door, objName, sprite, spriteIndex, player)
	ISBlacksmithMenu.Garage3Doors(subMenuGarage3Door, objName, sprite, spriteIndex, player)
	ISBlacksmithMenu.Garage4Doors(subMenuGarage4Door, objName, sprite, spriteIndex, player)
	
	spriteIndex = 48
	objName = getText("ContextMenu_Garage_Door6")
	ISBlacksmithMenu.Garage2Doors(subMenuGarage2Door, objName, sprite, spriteIndex, player)
	ISBlacksmithMenu.Garage3Doors(subMenuGarage3Door, objName, sprite, spriteIndex, player)
	ISBlacksmithMenu.Garage4Doors(subMenuGarage4Door, objName, sprite, spriteIndex, player)

	if garage2Door.notAvailable then garage2DoorOption.notAvailable = true; end
	if garage3Door.notAvailable then garage3DoorOption.notAvailable = true; end
	if garage4Door.notAvailable then garage4DoorOption.notAvailable = true; end
	
	if garage2DoorOption.notAvailable and garage3DoorOption.notAvailable and garage4DoorOption.notAvailable then garageOption.notAvailable = true; end
end

ISBlacksmithMenu.Garage2Doors = function(subMenu, objName, sprite, spriteIndex, player)
	local playerObj = getSpecificPlayer(player)
	garage2Door = subMenu:addOption(objName, worldobjects, ISBlacksmithMenu.onGarage2Door, sprite, spriteIndex, player, "6");
	local toolTip = ISBlacksmithMenu.addToolTip(garage2Door, objName, sprite.sprite .. spriteIndex);
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(2,0,2,2,0,6,5,playerObj,toolTip);
	ISBlacksmithMenu.addDoorKnob(playerObj, toolTip);
	if not canDo then garage2Door.notAvailable = true; end
end

ISBlacksmithMenu.Garage3Doors = function(subMenu, objName, sprite, spriteIndex, player)
	local playerObj = getSpecificPlayer(player)
	garage3Door = subMenu:addOption(objName, worldobjects, ISBlacksmithMenu.onGarage3Door, sprite, spriteIndex, player, "8");
	local toolTip = ISBlacksmithMenu.addToolTip(garage3Door, objName, sprite.sprite .. spriteIndex);
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(2,0,3,2,0,8,5,playerObj,toolTip);
	ISBlacksmithMenu.addDoorKnob(playerObj, toolTip);
	if not canDo then garage3Door.notAvailable = true; end
end

ISBlacksmithMenu.Garage4Doors = function(subMenu, objName, sprite, spriteIndex, player)
	local playerObj = getSpecificPlayer(player)
	garage4Door = subMenu:addOption(objName, worldobjects, ISBlacksmithMenu.onGarage4Door, sprite, spriteIndex, player, "10");
	local toolTip = ISBlacksmithMenu.addToolTip(garage4Door, objName, sprite.sprite .. spriteIndex);
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(2,0,4,2,0,10,5,playerObj,toolTip);
	ISBlacksmithMenu.addDoorKnob(playerObj, toolTip);
	if not canDo then garage4Door.notAvailable = true; end
end

-- Garage 2 Doors --
ISBlacksmithMenu.onGarage2Door = function(worldobjects, sprite, spriteIndex, player, torchUse)
    local door = ISGarage2Door:new(sprite.sprite, spriteIndex);
    door.name = "Garage 2 Door"
    door.firstItem = "BlowTorch";
    -- door.firstArg = tonumber(torchUse)
    door.secondItem = "WeldingMask";
    door.craftingBank = "BlowTorch";
	door.noNeedHammer = true;
    door.canBarricade = false;
    door.modData["xp:MetalWelding"] = 10;
	door.modData["need:Base.MetalPipe"] = "2";
	door.modData["need:Base.SheetMetal"] = "2";
    door.modData["need:Base.Hinge"] = "2";
	door.modData["need:Base.Doorknob"] = "1";
    door.modData["use:Base.BlowTorch"] = torchUse;
    door.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    door.player = player
    door.completionSound = "BuildMetalStructureMedium";
    getCell():setDrag(door, player);
end

-- Garage 3 Doors --
ISBlacksmithMenu.onGarage3Door = function(worldobjects, sprite, spriteIndex, player, torchUse)
    local door = ISGarage3Door:new(sprite.sprite, spriteIndex);
    door.name = "Garage 3 Door"
    door.firstItem = "BlowTorch";
    -- door.firstArg = tonumber(torchUse)
    door.secondItem = "WeldingMask";
    door.craftingBank = "BlowTorch";
	door.noNeedHammer = true;
    door.canBarricade = false;
    door.modData["xp:MetalWelding"] = 12;
	door.modData["need:Base.MetalPipe"] = "2";
	door.modData["need:Base.SheetMetal"] = "3";
    door.modData["need:Base.Hinge"] = "2";
	door.modData["need:Base.Doorknob"] = "1";
    door.modData["use:Base.BlowTorch"] = torchUse;
    door.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    door.player = player
    door.completionSound = "BuildMetalStructureMedium";
    getCell():setDrag(door, player);
end

-- Garage 4 Doors --
ISBlacksmithMenu.onGarage4Door = function(worldobjects, sprite, spriteIndex, player, torchUse)
    local door = ISGarage4Door:new(sprite.sprite, spriteIndex);
    door.name = "Garage 4 Door"
    door.firstItem = "BlowTorch";
    -- door.firstArg = tonumber(torchUse)
    door.secondItem = "WeldingMask";
    door.craftingBank = "BlowTorch";
	door.noNeedHammer = true;
    door.canBarricade = false;
    door.modData["xp:MetalWelding"] = 15;
	door.modData["need:Base.MetalPipe"] = "2";
	door.modData["need:Base.SheetMetal"] = "4";
    door.modData["need:Base.Hinge"] = "2";
	door.modData["need:Base.Doorknob"] = "1";
    door.modData["use:Base.BlowTorch"] = torchUse;
    door.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    door.player = player
    door.completionSound = "BuildMetalStructureMedium";
    getCell():setDrag(door, player);
end