ISBlacksmithMenu = {};
ISBlacksmithMenu.canDoSomething = false

if getActivatedMods():contains("IBM-EB") then require("ISUI/IBM-GarageDoors"); end

local function predicateDrainableUsesInt(item, count)
	return item:getDrainableUsesInt() >= count
end

local function predicateWeldingMask(item)
	return item:hasTag("WeldingMask") or item:getType() == "WeldingMask"
end

local function predicatePetrol(item)
	return (item:hasTag("Petrol") or item:getType() == "PetrolCan") and item:getUsedDelta() > 0
end

function ISBlacksmithMenu.weldingRodUses(torchUses)
    return math.floor((torchUses + 0.1) / 2)
end

ISBlacksmithMenu.doBuildMenu = function(player, context, worldobjects, test)

    if test and ISWorldObjectContextMenu.Test then return true end

    if getCore():getGameMode()=="LastStand" then
        return;
    end

    if test then return ISWorldObjectContextMenu.setTest() end
    local playerObj = getSpecificPlayer(player)
    local playerInv = playerObj:getInventory()

    if playerObj:getVehicle() then return; end

    local itemMap = buildUtil.getMaterialOnGround(playerObj:getCurrentSquare())
    ISBlacksmithMenu.groundItems = itemMap
    ISBlacksmithMenu.groundItemCounts = buildUtil.getMaterialOnGroundCounts(itemMap)
    ISBlacksmithMenu.groundItemUses = buildUtil.getMaterialOnGroundUses(itemMap)

    local disableFurnaceAnvil = true;
    if not disableFurnaceAnvil then
        local buildOption = context:addOption(getText("ContextMenu_Blacksmith"), worldobjects, nil);
        local subMenu = ISContextMenu:getNew(context);
        context:addSubMenu(buildOption, subMenu);

        local furnaceOption = subMenu:addOption(getText("ContextMenu_Stone_Furnace"), worldobjects, ISBlacksmithMenu.onStoneFurnace, player);
        local toolTip = ISToolTip:new();
        toolTip:initialise();
        toolTip:setVisible(false);
        -- add it to our current option
        furnaceOption.toolTip = toolTip;
        toolTip:setName(getText("ContextMenu_Stone_Furnace"));
        toolTip.description = getText("Tooltip_craft_stoneFurnaceDesc") .. " <LINE> ";
        toolTip:setTexture("crafted_01_16");
        if playerInv:getItemCount("Base.Stone") < 1 then
            toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.Stone") .. " " .. playerInv:getItemCount("Base.Stone") .. "/50" ;
            furnaceOption.notAvailable = true;
        else
            toolTip.description = toolTip.description .. " <LINE> <RGB:0,1,0> " .. getItemNameFromFullType("Base.Stone") .. " " .. playerInv:getItemCount("Base.Stone") .. "/50" ;
        end

        local anvilOption = subMenu:addOption(getText("ContextMenu_Anvil"), worldobjects, ISBlacksmithMenu.onAnvil, player);
        local toolTip = ISToolTip:new();
        toolTip:initialise();
        toolTip:setVisible(false);
        -- add it to our current option
        anvilOption.toolTip = toolTip;
        toolTip:setName(getText("ContextMenu_Anvil"));
        toolTip.description = getText("Tooltip_craft_anvilDesc") .. " <LINE> ";
        toolTip:setTexture("crafted_01_19");
        -- check if the player have enough metal to make the anvil
        local canBeCrafted = playerInv:contains("Hammer") and playerInv:contains("Log");
        if not playerInv:contains("Hammer") then
            toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.Hammer") .. " 0/1" ;
            anvilOption.notAvailable = true;
        else
            toolTip.description = toolTip.description .. " <LINE> <RGB:0,1,0> " .. getItemNameFromFullType("Base.Hammer") .. " 1/1" ;
        end
        if not playerInv:contains("Log") then
            toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.Log") .. " 0/1" ;
            anvilOption.notAvailable = true;
        else
            toolTip.description = toolTip.description .. " <LINE> <RGB:0,1,0> " .. getItemNameFromFullType("Base.Log") .. " 1/1" ;
        end
        local ingots = nil;
        local metalAmount = nil;
        if canBeCrafted then
            ingots, metalAmount = ISBlacksmithMenu.getMetal(playerObj, ISBlacksmithMenu.metalForAnvil);
            if not ingots then
                toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.IronIngot") .. " " .. (metalAmount/100) .. " / " .. (ISBlacksmithMenu.metalForAnvil/100);
                anvilOption.notAvailable = true;
            else
                toolTip.description = toolTip.description .. " <LINE> <RGB:0,1,0> " .. getItemNameFromFullType("Base.IronIngot") .. " " .. (metalAmount/100) .. " / " .. (ISBlacksmithMenu.metalForAnvil/100);
            end
        else
            anvilOption.notAvailable = true;
        end

        -- local drumOption = subMenu:addOption(getText("ContextMenu_Metal_Drum"), worldobjects, ISBlacksmithMenu.onMetalDrum, player, "crafted_01_24");
        -- local toolTip = ISToolTip:new();
        -- toolTip:initialise();
        -- toolTip:setVisible(false);
        -- -- add it to our current option
        -- drumOption.toolTip = toolTip;
        -- toolTip:setName(getText("ContextMenu_Metal_Drum"));
        -- toolTip.description = getText("Tooltip_craft_metalDrumDesc") .. " <LINE> ";
        -- toolTip:setTexture("crafted_01_24");
        -- if not playerInv:contains("MetalDrum") then
            -- toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.MetalDrum") .. " 0/1" ;
            -- drumOption.notAvailable = true;
        -- else
            -- toolTip.description = toolTip.description .. " <LINE> <RGB:0,1,0> " .. getItemNameFromFullType("Base.MetalDrum") .. " 1/1" ;
        -- end

        if anvilOption.notAvailable and furnaceOption.notAvailable and drumOption.notAvailable then
--        if drumOption.notAvailable then
            context:removeLastOption();
        end
    end

    -- *********************************************** --
    -- **************** METAL WELDING **************** --
    -- *********************************************** --

    -- show menu if we have a blowtorch and welding mask
    if (playerInv:containsTypeRecurse("BlowTorch") and playerInv:containsEvalRecurse(predicateWeldingMask)) or ISBuildMenu.cheat then

        local buildMWOption = context:addOption(getText("ContextMenu_MetalWelding"), worldobjects, nil);
        local subMenuMW = ISContextMenu:getNew(context);
        context:addSubMenu(buildMWOption, subMenuMW);
		
		-- -- ** Legacy Support ** --
		-- -- Containers --
		-- local containerOption = subMenuMW:addOption(getText("ContextMenu_Container"), worldobjects, nil);
		-- local subMenuContainer = subMenuMW:getNew(subMenuMW);
		-- context:addSubMenu(containerOption, subMenuContainer);
		-- -- Doors --
		-- local doorOption = subMenuMW:addOption(getText("ContextMenu_Door"), worldobjects, nil);
		-- local subMenuDoor = subMenuMW:getNew(subMenuMW);
		-- context:addSubMenu(doorOption, subMenuDoor);
		
		-- **************** CONTEXT MENUS **************** --
		-- Walls
		if playerObj:isRecipeKnown("Make Metal Walls") or ISBuildMenu.cheat then
			local wallOption = subMenuMW:addOption(getText("ContextMenu_Wall"), worldobjects, nil);
			local subMenuWall = subMenuMW:getNew(subMenuMW);
			context:addSubMenu(wallOption, subMenuWall);
			ISBlacksmithMenu.buildWallMenu(subMenuWall, wallOption, player);
			
		-- Door / Gates
			local doorGateOption = subMenuMW:addOption(getText("ContextMenu_DoorGates"), worldobjects, nil);
			local subMenuDoorGate = subMenuMW:getNew(subMenuMW);
			context:addSubMenu(doorGateOption, subMenuDoorGate);
			ISBlacksmithMenu.buildDoorGateMenu(subMenuDoorGate, context, doorGateOption, player);
		end
		
		-- Floor/Roof
		if playerObj:isRecipeKnown("Make Metal Roof") or ISBuildMenu.cheat then
			local floorRoofOption = subMenuMW:addOption(getText("ContextMenu_FloorRoof"), worldobjects, nil);
			local subMenuFloorRoof = subMenuMW:getNew(subMenuMW);
			context:addSubMenu(floorRoofOption, subMenuFloorRoof);
			ISBlacksmithMenu.buildFloorRoofMenu(subMenuFloorRoof, floorRoofOption, player);
		end
		
		-- Furniture -> Storage
		if playerObj:isRecipeKnown("Make Metal Containers") or ISBuildMenu.cheat then
			local furnitureOption = subMenuMW:addOption(getText("ContextMenu_Furniture"), worldobjects, nil);
			local subMenuFurniture = subMenuMW:getNew(subMenuMW);
			context:addSubMenu(furnitureOption, subMenuFurniture);
			ISBlacksmithMenu.buildFurnitureMenu(subMenuFurniture, context, furnitureOption, player);
		end
		
		-- Outdoor -> Fence
		if playerObj:isRecipeKnown("Make Metal Fences") or ISBuildMenu.cheat then
			local outdoorOption = subMenuMW:addOption(getText("ContextMenu_Outdoor"), worldobjects, nil);
			local subMenuOutdoor = subMenuMW:getNew(subMenuMW);
			context:addSubMenu(outdoorOption, subMenuOutdoor);
			ISBlacksmithMenu.buildOutdoorMenu(subMenuOutdoor, context, outdoorOption, player);
		end
    end

	local startFire = nil
    local lighter = nil
    local matches = nil
    local petrol = nil
    local percedWood = nil
    local branch = nil
    local stick = nil
    local lightFireList = {}
    local lightFromPetrol = nil;
    local lightFromKindle = nil
    local lightFromLiterature = nil
    local lightDrumFromPetrol = nil;
    local lightDrumFromKindle = nil
    local lightDrumFromLiterature = nil
    local metalFence;
    local bellows;
    local coal = nil;
    local containers = ISInventoryPaneContextMenu.getContainers(playerObj)
    for i=1,containers:size() do
        local container = containers:get(i-1)
        for j=1,container:getItems():size() do
            local item = container:getItems():get(j-1)
            local type = item:getType()
            if type == "Lighter" then
                lighter = item
            elseif type == "Matches" then
                matches = item
            elseif predicatePetrol(item) then
                petrol = item
            elseif type == "PercedWood" then
                percedWood = item
            elseif type == "TreeBranch" then
                branch = item
            elseif type == "WoodenStick" then
                stick = item
            elseif type == "MetalFence" then
                metalFence = item
            elseif type == "Coal" or type == "Charcoal" then
                coal = item
            elseif type == "Bellows" then
                bellows = item
            elseif item:hasTag("StartFire") then
                startFire = item
            end

            if campingLightFireType[type] then
                if campingLightFireType[type] > 0 then
                    table.insert(lightFireList, item)
                end
            elseif campingLightFireCategory[item:getCategory()] then
                table.insert(lightFireList, item)
            end
        end
    end

    local furnace;
    local metalDrumIsoObj = nil
    local metalDrumLuaObj = nil
    local sq;
    for i,v in ipairs(worldobjects) do
        sq = v:getSquare();
        if instanceof(v, "BSFurnace") then
            furnace = v;
        end
        if CMetalDrumSystem.instance:isValidIsoObject(v) then
            metalDrumIsoObj = v
            metalDrumLuaObj = CMetalDrumSystem.instance:getLuaObjectOnSquare(v:getSquare())
        end

        if (startFire or lighter or matches) and petrol and furnace and furnace:getFuelAmount() > 0 and not furnace:isFireStarted() then
            lightFromPetrol = furnace;
        end

        if (startFire or lighter or matches) and petrol and metalDrumLuaObj and metalDrumLuaObj.haveLogs and not metalDrumLuaObj.isLit and not metalDrumLuaObj.haveCharcoal then
            lightDrumFromPetrol = metalDrumLuaObj;
        end

        if percedWood and (stick or branch) and furnace and furnace:getFuelAmount() > 0 and not furnace:isFireStarted() and playerObj:getStats():getEndurance() > 0 then
            lightFromKindle = furnace
        end
        if percedWood and (stick or branch) and metalDrumLuaObj and metalDrumLuaObj.haveLogs and not metalDrumLuaObj.isLit and not metalDrumLuaObj.haveCharcoal and playerObj:getStats():getEndurance() > 0 then
            lightDrumFromKindle = metalDrumLuaObj
        end
        if (startFire or lighter or matches) and furnace ~= nil and furnace:getFuelAmount() > 0 and not furnace:isFireStarted() then
            lightFromLiterature = furnace
        end
        if (startFire or lighter or matches) and metalDrumLuaObj and metalDrumLuaObj.haveLogs and not metalDrumLuaObj.isLit and not metalDrumLuaObj.haveCharcoal then
            lightDrumFromLiterature = metalDrumLuaObj
        end
    end

    if lightFromPetrol or lightFromKindle or (lightFromLiterature and #lightFireList > 0) then
        if test then return ISWorldObjectContextMenu.setTest() end
        local lightOption = context:addOption(getText("ContextMenu_LitStoneFurnace"), worldobjects, nil);
        local subMenuLight = ISContextMenu:getNew(context);
        context:addSubMenu(lightOption, subMenuLight);
        if lightFromPetrol then
            if lighter then
                subMenuLight:addOption(petrol:getName()..' + '..lighter:getName(), worldobjects, ISBlacksmithMenu.onLightFromPetrol, player, lighter, petrol, lightFromPetrol)
            end
            if matches then
                subMenuLight:addOption(petrol:getName()..' + '..matches:getName(), worldobjects, ISBlacksmithMenu.onLightFromPetrol, player, matches, petrol, lightFromPetrol)
            end
            if startFire then
                subMenuLight:addOption(petrol:getName()..' + '..startFire:getName(), worldobjects, ISBlacksmithMenu.onLightFromPetrol, player, startFire, petrol, lightFromPetrol)
            end
        end
        for i,v in pairs(lightFireList) do
            local label = v:getName()
            if lighter then
                subMenuLight:addOption(label..' + '..lighter:getName(), worldobjects, ISBlacksmithMenu.onLightFromLiterature, player, v, lighter, lightFromLiterature, coal)
            end
            if matches then
                subMenuLight:addOption(label..' + '..matches:getName(), worldobjects, ISBlacksmithMenu.onLightFromLiterature, player, v, matches, lightFromLiterature, coal)
            end
            if startFire then
                subMenuLight:addOption(label..' + '..startFire:getName(), worldobjects, ISBlacksmithMenu.onLightFromLiterature, player, v, startFire, lightFromLiterature, coal)
            end
        end
        if lightFromKindle then
            if stick then
                subMenuLight:addOption(percedWood:getName()..' + '..stick:getName(), worldobjects, ISBlacksmithMenu.onLightFromKindle, player, percedWood, stick, lightFromKindle);
            elseif branch then
                subMenuLight:addOption(percedWood:getName()..' + '..branch:getName(), worldobjects, ISBlacksmithMenu.onLightFromKindle, player, percedWood, branch, lightFromKindle);
            end
        end
    end

    if lightDrumFromPetrol or lightDrumFromKindle or (lightDrumFromLiterature and #lightFireList > 0) then
        if test then return ISWorldObjectContextMenu.setTest() end
        local lightOption = context:addOption(getText("ContextMenu_LitDrum"), worldobjects, nil);
        local subMenuLight = ISContextMenu:getNew(context);
        context:addSubMenu(lightOption, subMenuLight);
        if lightDrumFromPetrol then
            if lighter then
                local LitOption = subMenuLight:addOption(petrol:getName()..' + '..lighter:getName(), worldobjects, ISBlacksmithMenu.onLightDrumFromPetrol, player, lighter, petrol, lightDrumFromPetrol)
                local tooltip = ISWorldObjectContextMenu.addToolTip()
                tooltip:setName(getText("ContextMenu_LitDrum"))
                tooltip.description = getText("Tooltip_Charcoal");
                LitOption.toolTip = tooltip
            end
            if matches then
                local LitOption = subMenuLight:addOption(petrol:getName()..' + '..matches:getName(), worldobjects, ISBlacksmithMenu.onLightDrumFromPetrol, player, matches, petrol, lightDrumFromPetrol)
                local tooltip = ISWorldObjectContextMenu.addToolTip()
                tooltip:setName(getText("ContextMenu_LitDrum"))
                tooltip.description = getText("Tooltip_Charcoal");
                LitOption.toolTip = tooltip
            end
            if startFire then
                local LitOption = subMenuLight:addOption(petrol:getName()..' + '..startFire:getName(), worldobjects, ISBlacksmithMenu.onLightDrumFromPetrol, player, startFire, petrol, lightDrumFromPetrol)
                local tooltip = ISWorldObjectContextMenu.addToolTip()
                tooltip:setName(getText("ContextMenu_LitDrum"))
                tooltip.description = getText("Tooltip_Charcoal");
                LitOption.toolTip = tooltip
            end
        end
        for i,v in pairs(lightFireList) do
            local label = v:getName()
            if lighter then
                local LitOption = subMenuLight:addOption(label..' + '..lighter:getName(), worldobjects, ISBlacksmithMenu.onLightDrumFromLiterature, player, v, lighter, lightDrumFromLiterature, coal)
                local tooltip = ISWorldObjectContextMenu.addToolTip()
                tooltip:setName(getText("ContextMenu_LitDrum"))
                tooltip.description = getText("Tooltip_Charcoal");
                LitOption.toolTip = tooltip
            end
            if matches then
                local LitOption = subMenuLight:addOption(label..' + '..matches:getName(), worldobjects, ISBlacksmithMenu.onLightDrumFromLiterature, player, v, matches, lightDrumFromLiterature, coal)
                local tooltip = ISWorldObjectContextMenu.addToolTip()
                tooltip:setName(getText("ContextMenu_LitDrum"))
                tooltip.description = getText("Tooltip_Charcoal");
                LitOption.toolTip = tooltip
            end
            if startFire then
                local LitOption = subMenuLight:addOption(label..' + '..startFire:getName(), worldobjects, ISBlacksmithMenu.onLightDrumFromLiterature, player, v, startFire, lightDrumFromLiterature, coal)
                local tooltip = ISWorldObjectContextMenu.addToolTip()
                tooltip:setName(getText("ContextMenu_LitDrum"))
                tooltip.description = getText("Tooltip_Charcoal");
                LitOption.toolTip = tooltip
            end
        end
        if lightDrumFromKindle then
            if stick then
                local LitOption = subMenuLight:addOption(percedWood:getName()..' + '..stick:getName(), worldobjects, ISBlacksmithMenu.onLightDrumFromKindle, player, percedWood, stick, lightDrumFromKindle);
                local tooltip = ISWorldObjectContextMenu.addToolTip()
                tooltip:setName(getText("ContextMenu_LitDrum"))
                tooltip.description = getText("Tooltip_Charcoal");
                LitOption.toolTip = tooltip
            elseif branch then
                local LitOption = subMenuLight:addOption(percedWood:getName()..' + '..branch:getName(), worldobjects, ISBlacksmithMenu.onLightDrumFromKindle, player, percedWood, branch, lightDrumFromKindle);
                local tooltip = ISWorldObjectContextMenu.addToolTip()
                tooltip:setName(getText("ContextMenu_LitDrum"))
                tooltip.description = getText("Tooltip_Charcoal");
                LitOption.toolTip = tooltip
            end
        end
    end

    if furnace then
        context:addOption(getText("ContextMenu_Furnace_Info"), worldobjects, ISBlacksmithMenu.onInfo, furnace, playerObj);
       if coal and furnace:getFuelAmount() < 100 then
           context:addOption(getText("ContextMenu_Add_fuel_to_fire"), worldobjects, ISBlacksmithMenu.onAddFuel, furnace, coal, playerObj);
       end
       if furnace:isFireStarted() then
           if furnace:getHeat() < 100 and bellows then
               context:addOption(getText("ContextMenu_UseBellows"), worldobjects, ISBlacksmithMenu.onUseBellows, furnace, bellows, playerObj);
           end
           context:addOption(getText("ContextMenu_Put_out_fire"), worldobjects, ISBlacksmithMenu.onStopFire, furnace);
       end
    end

    if metalDrumLuaObj and playerObj:DistToSquared(metalDrumIsoObj:getX() + 0.5, metalDrumIsoObj:getY() + 0.5) < 2 * 2 then
        local option = context:addOption(getText("ContextMenu_Metal_Drum"), worldobjects, nil)
        local subMenuDrum = ISContextMenu:getNew(context);
        context:addSubMenu(option, subMenuDrum);
        local tooltip = ISWorldObjectContextMenu.addToolTip()
        tooltip:setName(getText("ContextMenu_Metal_Drum"))
        if metalDrumIsoObj:getWaterAmount() > 0 then
            local tx = getTextManager():MeasureStringX(tooltip.font, getText("ContextMenu_WaterName") .. ":") + 20
            --tooltip.description = getText("Water Percent ", round((metalDrumIsoObj:getWaterAmount() / metalDrumLuaObj.waterMax) * 100))
            tooltip.description = string.format("%s: <SETX:%d> %d / %d", getText("ContextMenu_WaterName"), tx, metalDrumIsoObj:getWaterAmount(), metalDrumIsoObj:getWaterMax());
        elseif metalDrumLuaObj.haveLogs and metalDrumLuaObj.isLit then
            if not metalDrumLuaObj.charcoalTick then
                tooltip.description = getText("Tooltip_Charcoal_Progression") .. " 0%";
            else
                tooltip.description = getText("Tooltip_Charcoal_Progression") .. " " .. (round((metalDrumLuaObj.charcoalTick / 12) * 100)) .. "%";
            end
        end
        if metalDrumIsoObj:getWaterAmount() > 0 or (metalDrumLuaObj.haveLogs and metalDrumLuaObj.isLit) then
            option.toolTip = tooltip
        end
        if metalDrumIsoObj:getWaterAmount() > 0 then
            subMenuDrum:addOption(getText("ContextMenu_Empty"), worldobjects, ISBlacksmithMenu.onEmptyDrum, metalDrumLuaObj, playerObj);
        else
            if not metalDrumLuaObj.haveLogs and not metalDrumLuaObj.haveCharcoal then
--                subMenuDrum:addOption("Remove", worldobjects, ISBlacksmithMenu.onRemoveDrum, metalDrumLuaObj, playerObj);
                local addWoodOption = subMenuDrum:addOption(getText("ContextMenu_Add_Logs"), worldobjects, ISBlacksmithMenu.onAddLogs, metalDrumLuaObj, playerObj);
                local tooltip = ISWorldObjectContextMenu.addToolTip()
                tooltip:setName(getText("ContextMenu_Add_Logs"))
                tooltip.description = getText("Tooltip_Charcoal_Logs");
                addWoodOption.toolTip = tooltip
                if playerInv:getItemCount("Base.Log") < 5 then
                   addWoodOption.notAvailable = true;
                end
            else
                if metalDrumLuaObj.isLit then
                    subMenuDrum:addOption(getText("ContextMenu_Put_out_fire"), worldobjects, ISBlacksmithMenu.onPutOutFireDrum, metalDrumLuaObj, playerObj);
                elseif not metalDrumLuaObj.isLit and not metalDrumLuaObj.haveCharcoal then
--                    subMenuDrum:addOption("Remove", worldobjects, ISBlacksmithMenu.onRemoveDrum, metalDrumLuaObj, playerObj);
                    subMenuDrum:addOption(getText("ContextMenu_Remove_Logs"), worldobjects, ISBlacksmithMenu.onRemoveLogs, metalDrumLuaObj, playerObj);
                end
            end
            if metalDrumLuaObj.haveCharcoal then
                subMenuDrum:addOption(getText("ContextMenu_RemoveCharcoal"), worldobjects, ISBlacksmithMenu.onRemoveCharcoal, metalDrumLuaObj, playerObj);
            end
        end
    end
end

-- WALLS --
ISBlacksmithMenu.buildWallMenu = function(subMenu, option, player)
	local playerObj = getSpecificPlayer(player)
	
	local frameMetalWall = subMenu:addOption(getText("ContextMenu_MetalWallFrame"), worldobjects, ISBlacksmithMenu.onFrameMetalWall, player,"8");
	local toolTip2 = ISBlacksmithMenu.addToolTip(frameMetalWall, getText("ContextMenu_MetalWallFrame"), "constructedobjects_01_68");
	local canDo, toolTip2 = ISBlacksmithMenu.checkMetalWeldingFurnitures(0,0,0,0,0,8,3,playerObj,toolTip2, 3);
	if not canDo then frameMetalWall.notAvailable = true; end
	
	local frameJailWall = subMenu:addOption(getText("ContextMenu_JailWallFrame"), worldobjects, ISBlacksmithMenu.onFrameJailWall, player,"8");
	local toolTip = ISBlacksmithMenu.addToolTip(frameJailWall, getText("ContextMenu_JailWallFrame"), "location_community_police_01_0");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(8,0,0,0,5,16,8,playerObj,toolTip, 3);
	if not canDo then frameJailWall.notAvailable = true; end
	
	if frameMetalWall.notAvailable and frameJailWall.notAvailable then
		option.notAvailable = true;
	end
	
end

ISBlacksmithMenu.onFrameMetalWall = function(worldobjects, player, torchUse)
    local frame = ISWoodenWall:new("constructedobjects_01_68","constructedobjects_01_69", "constructedobjects_01_51");
    frame.firstItem = "BlowTorch";
    frame.secondItem = "WeldingMask";
    frame.craftingBank = "BlowTorch";
    frame.canBarricade = false
    frame.noNeedHammer = true;
    frame.health = 120;
    frame.name = "MetalWallFrame";
    frame.modData["xp:MetalWelding"] = 20;
    frame.modData["need:Base.MetalBar"]= "3";
    frame.modData["use:Base.BlowTorch"] = torchUse;
    frame.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    frame.player = player
    -- frame.corner = "constructedobjects_01_51";
    frame.completionSound = "BuildMetalStructureWallFrame";
    getCell():setDrag(frame, player);
end

ISBlacksmithMenu.onFrameJailWall = function(worldobjects, player, torchUse)
    local frame = ISWoodenWall:new("location_community_police_01_0","location_community_police_01_1", "location_community_police_01_3");
    frame.firstItem = "BlowTorch";
    frame.secondItem = "WeldingMask";
    frame.craftingBank = "BlowTorch";
    frame.canBarricade = false
    frame.noNeedHammer = true;
    frame.health = 240;
    frame.name = "MetalWallFrame";
    frame.modData["xp:MetalWelding"] = 30;
    frame.modData["need:Base.MetalPipe"]= "8";
    frame.modData["need:Base.ScrapMetal"]= "3";
    frame.modData["need:Base.MetalBar"]= "3";
    frame.modData["use:Base.BlowTorch"] = torchUse;
    frame.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    frame.player = player
    -- frame.corner = "location_community_police_01_3";
    frame.completionSound = "BuildMetalStructureWallFrame";
    getCell():setDrag(frame, player);
end

ISBlacksmithMenu.addDoorKnob = function(player, toolTip)
	local count = ISBlacksmithMenu.getMaterialCount(player, "Doorknob")
	if count < 1 then
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.Doorknob") .. " " .. count .. "/" .. 1;
		isOk = false;
	else
		toolTip.description = toolTip.description .. " <LINE> <RGB:0,1,0> " .. getItemNameFromFullType("Base.Doorknob") .. " " .. count .. "/" .. 1 ;
	end
end

-- DOORS/GATES
ISBlacksmithMenu.buildDoorGateMenu = function(subMenu, context, option, player)
	local playerObj = getSpecificPlayer(player)
	
	-- Doors Section -- 
	local doorOption = subMenu:addOption(getText("ContextMenu_Door"), worldobjects, nil);
	local subMenuDoor = subMenu:getNew(subMenu);
	context:addSubMenu(doorOption, subMenuDoor);
	
	-- Doors
	local doorFrameMetalSprite = ISBlacksmithMenu.getDoorFrameMetalSprite(player);
	local doorFrameMetalOption = subMenuDoor:addOption(getText("ContextMenu_DoorFrameMetal"), worldobjects, ISBlacksmithMenu.onDoorFrameMetal, doorFrameMetalSprite, player,"6");
	local toolTip = ISBlacksmithMenu.addToolTip(doorFrameMetalOption, getText("ContextMenu_DoorFrameMetal"), doorFrameMetalSprite.sprite);
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(0,2,2,0,0,6,3,playerObj,toolTip, 2);
	if not canDo then doorFrameMetalOption.notAvailable = true; end
	
	local doorMetalOption = subMenuDoor:addOption(getText("ContextMenu_MetalDoor"), worldobjects, ISBlacksmithMenu.onMetalDoor, player,"6");
	local toolTip = ISBlacksmithMenu.addToolTip(doorMetalOption, getText("ContextMenu_MetalDoor"), "fixtures_doors_01_52");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(0,0,4,2,2,6,3,playerObj,toolTip, 2);
	ISBlacksmithMenu.addDoorKnob(playerObj, toolTip);
	if not canDo then doorMetalOption.notAvailable = true; end
	
	local doorFrameJailOption = subMenuDoor:addOption(getText("ContextMenu_DoorFrameJail"), worldobjects, ISBlacksmithMenu.onDoorFrameJail, player, "10");
	local toolTip = ISBlacksmithMenu.addToolTip(doorFrameJailOption, getText("ContextMenu_DoorFrameJail"), "location_community_police_01_10");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(2,0,4,0,0,10,8,playerObj,toolTip, 4);
	if not canDo then doorFrameJailOption.notAvailable = true; end
	
	local doorJailOption = subMenuDoor:addOption(getText("ContextMenu_JailDoor"), worldobjects, ISBlacksmithMenu.onJailDoor, player,"10");
	local toolTip = ISBlacksmithMenu.addToolTip(doorJailOption, getText("ContextMenu_JailDoor"), "location_community_police_01_4");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(6,0,0,2,4,10,8,playerObj,toolTip, 4);
	ISBlacksmithMenu.addDoorKnob(playerObj, toolTip);
	if not canDo then doorJailOption.notAvailable = true; end

	-- Gates Section --
	local gateOption = subMenu:addOption(getText("ContextMenu_Gates"), worldobjects, nil);
	local subMenuGate = subMenu:getNew(subMenu);
	context:addSubMenu(gateOption, subMenuGate);
	
	-- Gates
	local fenceGateOption = subMenuGate:addOption(getText("ContextMenu_MetalFenceGate"), worldobjects, ISBlacksmithMenu.onFenceGate, player,"7");
	local toolTip = ISBlacksmithMenu.addToolTip(fenceGateOption, getText("ContextMenu_MetalFenceGate"), "fixtures_doors_fences_01_28");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(3,0,0,2,2,7,4,playerObj,toolTip);
	if not canDo then fenceGateOption.notAvailable = true; end
	
	local bigFenceGateOption = subMenuGate:addOption(getText("ContextMenu_BigMetalFenceGate"), worldobjects, ISBlacksmithMenu.onBigMetalFenceGate, player,"8");
	local toolTip = ISBlacksmithMenu.addToolTip(bigFenceGateOption, getText("ContextMenu_BigMetalFenceGate"), "fixtures_doors_fences_01_24");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(5,0,0,2,4,8,7,playerObj,toolTip);
	if not canDo then bigFenceGateOption.notAvailable = true; end

	local doubleDoorOption = subMenuGate:addOption(getText("ContextMenu_Double_Metal_Door"), worldobjects, ISBlacksmithMenu.onDoubleMetalDoor, player,"8");
	local toolTip = ISBlacksmithMenu.addToolTip(doubleDoorOption, getText("ContextMenu_Double_Metal_Door"), "fixtures_doors_fences_01_64");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(8,0,0,2,4,10,7,playerObj,toolTip,0,4);
	if not canDo then doubleDoorOption.notAvailable = true; end
	
	local doubleDoorOption2 = subMenuGate:addOption(getText("ContextMenu_BigMetalDoubleDoor"), worldobjects, ISBlacksmithMenu.onDoublePoleDoor, player,"8");
	local toolTip = ISBlacksmithMenu.addToolTip(doubleDoorOption2, getText("ContextMenu_BigMetalDoubleDoor"), "fixtures_doors_fences_01_80");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(10,0,0,2,4,10,8,playerObj,toolTip);
	if not canDo then doubleDoorOption2.notAvailable = true; end
	
	if getActivatedMods():contains("IBM-EB") then ISBlacksmithMenu.buildGarageDoorMenu(subMenu, context, option, player) end
	
	if doorFrameMetalOption.notAvailable and doorMetalOption.notAvailable and doorFrameJailOption.notAvailable and doorJailOption.notAvailable then
		doorOption.notAvailable = true;
	end
	if fenceGateOption.notAvailable and bigFenceGateOption.notAvailable and doubleDoorOption.notAvailable and doubleDoorOption2.notAvailable then
		gateOption.notAvailable = true;
	end
	if doorOption.notAvailable and gateOption.notAvailable then
		if getActivatedMods():contains("IBM-EB") then
			if garageOption.notAvailable then option.notAvailable = true; end
		end
		option.notAvailable = true;
	end
end

-- Doors
ISBlacksmithMenu.onDoorFrameMetal = function(worldobjects, sprite, player, torchUse)
    local doorFrame = ISWoodenDoorFrame:new(sprite.sprite, sprite.northSprite, nil);
    doorFrame.name = "DoorFrameMetalLvl" .. ISBlacksmithMenu.getSpriteLvl(player);
	doorFrame.firstItem = "BlowTorch";
    doorFrame.secondItem = "WeldingMask";
    doorFrame.craftingBank = "BlowTorch";
    doorFrame.noNeedHammer = true;
    doorFrame.actionAnim = "BlowTorchMid";
    doorFrame.health = 250;
    doorFrame.modData["xp:MetalWelding"] = 20;
    doorFrame.modData["need:Base.SmallSheetMetal"]= "2";
    doorFrame.modData["need:Base.SheetMetal"]= "2";
	doorFrame.modData["need:Base.MetalBar"]= "2";
    doorFrame.modData["use:Base.BlowTorch"] = torchUse;
    doorFrame.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    doorFrame.player = player
	doorFrame.completionSound = "BuildMetalStructureWallFrame";
    getCell():setDrag(doorFrame, player);
end

ISBlacksmithMenu.onMetalDoor = function(worldobjects, player, torchUse)
	local door = ISWoodenDoor:new("fixtures_doors_01_52","fixtures_doors_01_53", "fixtures_doors_01_54", "fixtures_doors_01_55");
    door.name = "Metal Door"
    door.firstItem = "BlowTorch";
    door.secondItem = "WeldingMask";
    door.craftingBank = "BlowTorch";
    door.noNeedHammer = true;
    door.canBarricade = true;
    door.modData["xp:MetalWelding"] = 20;
    door.modData["need:Base.SheetMetal"] = "4";
	door.modData["need:Base.Hinge"] = "2";
    door.modData["need:Base.Doorknob"] = "1";
    door.modData["need:Base.ScrapMetal"] = "2";
    door.modData["use:Base.BlowTorch"] = torchUse;
    door.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    door.player = player
    door.ignoreNorth = true;
    door.completionSound = "BuildMetalStructureWallFrame";
    getCell():setDrag(door, player);
end

ISBlacksmithMenu.onDoorFrameJail = function(worldobjects, player, torchUse)
    local doorFrame = ISWoodenDoorFrame:new("location_community_police_01_10", "location_community_police_01_11", nil);
    doorFrame.name = "DoorFrameJail";
	doorFrame.firstItem = "BlowTorch";
    doorFrame.secondItem = "WeldingMask";
    doorFrame.craftingBank = "BlowTorch";
    doorFrame.noNeedHammer = true;
    doorFrame.actionAnim = "BlowTorchMid";
    doorFrame.health = 750;
    doorFrame.modData["xp:MetalWelding"] = 40;
    doorFrame.modData["need:Base.MetalPipe"]= "2";
    doorFrame.modData["need:Base.SheetMetal"]= "4";
    doorFrame.modData["need:Base.MetalBar"]= "4";
    doorFrame.modData["use:Base.BlowTorch"] = torchUse;
    doorFrame.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    doorFrame.player = player
	doorFrame.completionSound = "BuildMetalStructureWallFrame";
    getCell():setDrag(doorFrame, player);
end

ISBlacksmithMenu.onJailDoor = function(worldobjects, player, torchUse)
	local door = ISWoodenDoor:new("location_community_police_01_4", "location_community_police_01_5", "location_community_police_01_6", "location_community_police_01_7");
    door.name = "Jail Door"
    door.firstItem = "BlowTorch";
    door.secondItem = "WeldingMask";
    door.craftingBank = "BlowTorch";
    door.noNeedHammer = true;
    door.canBarricade = true;
    door.modData["xp:MetalWelding"] = 40;
	door.modData["need:Base.MetalPipe"] = "6";
	door.modData["need:Base.Hinge"] = "2";
    door.modData["need:Base.Doorknob"] = "1";
    door.modData["need:Base.MetalBar"] = "4";
	door.modData["need:Base.ScrapMetal"] = "4";
    door.modData["use:Base.BlowTorch"] = torchUse;
    door.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    door.player = player
    door.ignoreNorth = true;
    door.completionSound = "BuildMetalStructureWallFrame";
    getCell():setDrag(door, player);
end

-- Gates
ISBlacksmithMenu.onFenceGate = function(worldobjects, player, torchUse)
    local fence = ISWoodenDoor:new("fixtures_doors_fences_01_28","fixtures_doors_fences_01_29", "fixtures_doors_fences_01_30", "fixtures_doors_fences_01_31");
    fence.name = "Small Metal Pole Gate"
    fence.firstItem = "BlowTorch";
--    fence.firstPredicate = predicateDrainableUsesInt
--    fence.firstArg = tonumber(torchUse)
    fence.secondItem = "WeldingMask";
    fence.craftingBank = "BlowTorch";
    fence.noNeedHammer = true;
    fence.actionAnim = "BlowTorchMid";
    fence.dontNeedFrame = true;
    fence.canBarricade = false
    fence.isThumpable = false
    fence.modData["xp:MetalWelding"] = 25;
    fence.modData["need:Base.MetalPipe"]= "3";
    fence.modData["need:Base.Hinge"]= "2";
    fence.modData["need:Base.ScrapMetal"]= "2";
    fence.modData["use:Base.BlowTorch"] = torchUse;
    fence.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    fence.player = player
    fence.completionSound = "BuildMetalStructureSmallPoleFence";
    getCell():setDrag(fence, player);
end

ISBlacksmithMenu.onBigMetalFenceGate = function(worldobjects, player, torchUse) --called "Big Pole Fence Gate" in game
    local fence = ISWoodenDoor:new("fixtures_doors_fences_01_24","fixtures_doors_fences_01_25", "fixtures_doors_fences_01_26", "fixtures_doors_fences_01_27");
    fence.name = "Big Metal Pole Gate"
    fence.firstItem = "BlowTorch";
--    fence.firstPredicate = predicateDrainableUsesInt
--    fence.firstArg = tonumber(torchUse)
    fence.secondItem = "WeldingMask";
    fence.craftingBank = "BlowTorch";
    fence.noNeedHammer = true;
    fence.dontNeedFrame = true;
    fence.canBarricade = false
    fence.modData["xp:MetalWelding"] = 30;
    fence.modData["need:Base.MetalPipe"] = "5";
    fence.modData["need:Base.Hinge"]= "2";
    fence.modData["need:Base.ScrapMetal"]= "4";
    fence.modData["use:Base.BlowTorch"] = torchUse;
    fence.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    fence.player = player
    fence.completionSound = "BuildMetalStructureLargePoleFence";
    getCell():setDrag(fence, player);
end

ISBlacksmithMenu.onDoubleMetalDoor = function(worldobjects, player, torchUse) --Called "Double Fence Gate" in game
    local door = ISDoubleDoor:new("fixtures_doors_fences_01_", 72);
    door.name = "Double Metal Wire Gate"
    door.firstItem = "BlowTorch";
    door.secondItem = "WeldingMask";
    door.craftingBank = "BlowTorch";
    door.noNeedHammer = true;
    door.canBarricade = false;
    door.modData["xp:MetalWelding"] = 30;
    door.modData["need:Base.Hinge"] = "2";
    door.modData["need:Base.ScrapMetal"] = "2";
    door.modData["need:Base.MetalPipe"] = "8";
    door.modData["use:Base.Wire"] = "4";
    door.modData["use:Base.BlowTorch"] = torchUse;
    door.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    door.player = player
    door.ignoreNorth = true;
    door.completionSound = "BuildMetalStructureLargeWiredFence";
    getCell():setDrag(door, player);
end

ISBlacksmithMenu.onDoublePoleDoor = function(worldobjects, player, torchUse) --called "Big Double Pole Gate" in game
    local door = ISDoubleDoor:new("fixtures_doors_fences_01_", 88);
    door.name = "Double Metal Pole Gate"
    door.firstItem = "BlowTorch";
    door.firstArg = tonumber(torchUse)
    door.secondItem = "WeldingMask";
    door.secondItem = "WeldingMask";
    door.craftingBank = "BlowTorch";
    door.noNeedHammer = true;
    door.canBarricade = false;
    door.modData["xp:MetalWelding"] = 35;
    door.modData["need:Base.MetalPipe"] = "10";
    door.modData["need:Base.Hinge"] = "2";
    door.modData["need:Base.ScrapMetal"] = "4";
    door.modData["use:Base.BlowTorch"] = torchUse;
    door.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    door.player = player
    door.ignoreNorth = true;
    door.completionSound = "BuildMetalStructureLargePoleFence";
    getCell():setDrag(door, player);
end

-- FLOORS/ROOF
ISBlacksmithMenu.buildFloorRoofMenu = function(subMenu, option, player)
	local playerObj = getSpecificPlayer(player)
	
	local metalFloorOption = subMenu:addOption(getText("ContextMenu_MetalFloor"), worldobjects, ISBlacksmithMenu.onMetalFloor, player,"2");
	local toolTip = ISBlacksmithMenu.addToolTip(metalFloorOption, getText("ContextMenu_MetalFloor"), "industry_01_7");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(0,1,0,0,1,2,1,playerObj,toolTip);
	if not canDo then metalFloorOption.notAvailable = true; end
	
	local metalRoofOption = subMenu:addOption(getText("ContextMenu_MetalRoof"), worldobjects, ISBlacksmithMenu.onMetalRoof, player,"2");
	local toolTip = ISBlacksmithMenu.addToolTip(metalRoofOption, getText("ContextMenu_MetalRoof"), "constructedobjects_01_86");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(0,1,0,0,1,2,1,playerObj,toolTip);
	if not canDo then metalRoofOption.notAvailable = true; end
	
	if metalFloorOption.notAvailable and metalRoofOption.notAvailable then
		option.notAvailable = true;
	end
end

ISBlacksmithMenu.onMetalFloor = function(worldobjects, player, torchUse)
    local fence = ISWoodenFloor:new("industry_01_7","industry_01_7");
    fence.firstItem = "BlowTorch";
--    fence.firstPredicate = predicateDrainableUsesInt
--    fence.firstArg = tonumber(torchUse)
    fence.secondItem = "WeldingMask";
    fence.craftingBank = "BlowTorch";
    fence.noNeedHammer = true;
    fence.modData["xp:MetalWelding"] = 5;
    fence.modData["need:Base.SmallSheetMetal"] = "1";
    fence.modData["need:Base.ScrapMetal"] = "1";
    fence.modData["use:Base.BlowTorch"] = torchUse;
    fence.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    fence.player = player
    fence.completionSound = "BuildMetalStructureSmallScrap";
    getCell():setDrag(fence, player);
end

ISBlacksmithMenu.onMetalRoof = function(worldobjects, player, torchUse)
    local fence = ISWoodenFloor:new("constructedobjects_01_86","constructedobjects_01_86");
    fence.firstItem = "BlowTorch";
--    fence.firstPredicate = predicateDrainableUsesInt
--    fence.firstArg = tonumber(torchUse)
    fence.secondItem = "WeldingMask";
    fence.craftingBank = "BlowTorch";
    fence.noNeedHammer = true;
    fence.modData["xp:MetalWelding"] = 5;
    fence.modData["need:Base.SmallSheetMetal"] = "1";
    fence.modData["need:Base.ScrapMetal"] = "1";
    fence.modData["use:Base.BlowTorch"] = torchUse;
    fence.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    fence.player = player
    fence.completionSound = "BuildMetalStructureSmallScrap";
    getCell():setDrag(fence, player);
end

-- FURNITURE
ISBlacksmithMenu.buildFurnitureMenu = function(subMenu, context, option, player)
	local playerObj = getSpecificPlayer(player)
	
	-- Storage
	local storageOption = subMenu:addOption(getText("ContextMenu_Storage"), worldobjects, nil);
	local subMenuStorage = subMenu:getNew(subMenu);
	context:addSubMenu(storageOption, subMenuStorage);
	
	local bigLockerOption = subMenuStorage:addOption(getText("ContextMenu_BigLocker"), worldobjects, ISBlacksmithMenu.onBigLocker, player,"15");
	local toolTip = ISBlacksmithMenu.addToolTip(bigLockerOption, getText("ContextMenu_BigLocker"), "furniture_storage_02_12");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(8,4,0,2,0,15,9,playerObj,toolTip);
	if not canDo then bigLockerOption.notAvailable = true; end
	
	local crateOption = subMenuStorage:addOption(getText("ContextMenu_MetalCrate"), worldobjects, ISBlacksmithMenu.onMetalCrate, player,"8");
	local toolTip = ISBlacksmithMenu.addToolTip(crateOption, getText("ContextMenu_MetalCrate"), "constructedobjects_01_44");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(2,2,4,0,2,8,6,playerObj,toolTip);
	if not canDo then crateOption.notAvailable = true; end
	
	local metalCounterOption = subMenuStorage:addOption(getText("ContextMenu_MetalCounter"), worldobjects, ISBlacksmithMenu.onMetalCounter, player,"12");
	local toolTip = ISBlacksmithMenu.addToolTip(metalCounterOption, getText("ContextMenu_MetalCounter"), "fixtures_counters_01_35");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(2,4,0,2,0,12,5,playerObj,toolTip);
	if not canDo then metalCounterOption.notAvailable = true; end

	local metalCounterCornerOption = subMenuStorage:addOption(getText("ContextMenu_MetalCounterCorner"), worldobjects, ISBlacksmithMenu.onMetalCounterCorner, player,"12");
	local toolTip = ISBlacksmithMenu.addToolTip(metalCounterCornerOption, getText("ContextMenu_MetalCounterCorner"), "fixtures_counters_01_36");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(2,4,0,2,0,12,5,playerObj,toolTip);
	if not canDo then metalCounterCornerOption.notAvailable = true; end
		
	local shelvesOption = subMenuStorage:addOption(getText("ContextMenu_MetalShelves"), worldobjects, ISBlacksmithMenu.onMetalShelves, player,"7");
	local toolTip = ISBlacksmithMenu.addToolTip(shelvesOption, getText("ContextMenu_MetalShelves"), "furniture_shelving_01_28");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(2,1,0,0,1,7,2,playerObj,toolTip);
	if not canDo then shelvesOption.notAvailable = true; end

	local smallLockerOption = subMenuStorage:addOption(getText("ContextMenu_SmallLocker"), worldobjects, ISBlacksmithMenu.onSmallLocker, player,"12");
	local toolTip = ISBlacksmithMenu.addToolTip(smallLockerOption, getText("ContextMenu_SmallLocker"), "furniture_storage_02_8");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(3,4,0,2,0,12,6,playerObj,toolTip);
	if not canDo then smallLockerOption.notAvailable = true; end
	
	if shelvesOption.notAvailable and crateOption.notAvailable and metalCounterOption.notAvailable and metalCounterCornerOption.notAvailable and smallLockerOption.notAvailable and bigLockerOption.notAvailable then
		storageOption.notAvailable = true;
	end
	if storageOption.notAvailable then
		option.notAvailable = true;
	end
end

ISBlacksmithMenu.onBigLocker = function(worldobjects, player, torchUse)
    local fence = ISWoodenContainer:new("furniture_storage_02_12","furniture_storage_02_13", nil);
    fence.name = "Big Metal Locker"
    fence.firstItem = "BlowTorch";
--    fence.firstPredicate = predicateDrainableUsesInt
--    fence.firstArg = tonumber(torchUse)
    fence.secondItem = "WeldingMask";
    fence.craftingBank = "BlowTorch";
    fence:setEastSprite("furniture_storage_02_14");
    fence:setSouthSprite("furniture_storage_02_15");
    fence.noNeedHammer = true;
    fence.buildLow = false;
    fence.containerType = "locker";
    fence.modData["xp:MetalWelding"] = 35;
    fence.modData["need:Base.MetalPipe"]= "8";
    fence.modData["need:Base.SmallSheetMetal"]= "4";
    fence.modData["need:Base.Hinge"]= "2";
    fence.modData["use:Base.BlowTorch"] = torchUse;
    fence.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    fence.player = player
    fence.completionSound = "BuildMetalStructureMedium";
    getCell():setDrag(fence, player);
end

ISBlacksmithMenu.onMetalCrate = function(worldobjects, player, torchUse)
-- sprite, northSprite
    local crate = ISWoodenContainer:new("constructedobjects_01_45", "constructedobjects_01_44");
    crate.name = "Metal Crate"
    crate.firstItem = "BlowTorch";
--    crate.firstPredicate = predicateDrainableUsesInt
--    crate.firstArg = tonumber(torchUse)
    crate.secondItem = "WeldingMask";
    crate.craftingBank = "BlowTorch";
    crate.canBeAlwaysPlaced = true;
    crate.noNeedHammer = true;
    crate.actionAnim = "BlowTorchMid";
    crate.containerType = "crate";
    crate.modData["xp:MetalWelding"] = 20;
    crate.modData["need:Base.MetalPipe"]= "2";
    crate.modData["need:Base.SmallSheetMetal"]= "2";
    crate.modData["need:Base.SheetMetal"]= "4";
    crate.modData["need:Base.ScrapMetal"]= "2";
    crate.modData["use:Base.BlowTorch"] = torchUse;
    crate.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    crate:setEastSprite("constructedobjects_01_47");
    crate:setSouthSprite("constructedobjects_01_46");
    crate.player = player
    crate.completionSound = "BuildMetalStructureMedium";
    getCell():setDrag(crate, player);
end

ISBlacksmithMenu.onMetalCounter = function(worldobjects, player, torchUse)
    local fence = ISWoodenContainer:new("fixtures_counters_01_35","fixtures_counters_01_37", nil);
    fence.name = "Metal Counter"
    fence.firstItem = "BlowTorch";
--    fence.firstPredicate = predicateDrainableUsesInt
--    fence.firstArg = tonumber(torchUse)
    fence.secondItem = "WeldingMask";
    fence.craftingBank = "BlowTorch";
    fence.containerType = "counter";
    fence:setEastSprite("fixtures_counters_01_39");
    fence:setSouthSprite("fixtures_counters_01_33");
    fence.noNeedHammer = true;
    fence.actionAnim = "BlowTorchMid";
    fence.modData["xp:MetalWelding"] = 25;
    fence.modData["need:Base.MetalPipe"]= "2";
    fence.modData["need:Base.SmallSheetMetal"]= "4";
    fence.modData["need:Base.Hinge"]= "2";
    fence.modData["use:Base.BlowTorch"] = torchUse;
    fence.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    fence.player = player
    fence.completionSound = "BuildMetalStructureMedium";
    getCell():setDrag(fence, player);
end

ISBlacksmithMenu.onMetalCounterCorner = function(worldobjects, player, torchUse)
    local fence = ISWoodenContainer:new("fixtures_counters_01_34","fixtures_counters_01_36", nil);
    fence.firstItem = "BlowTorch";
--    fence.firstPredicate = predicateDrainableUsesInt
--    fence.firstArg = tonumber(torchUse)
    fence.secondItem = "WeldingMask";
    fence.craftingBank = "BlowTorch";
    fence.containerType = "counter";
    fence:setEastSprite("fixtures_counters_01_38");
    fence:setSouthSprite("fixtures_counters_01_32");
    fence.noNeedHammer = true;
    fence.actionAnim = "BlowTorchMid";
    fence.modData["xp:MetalWelding"] = 25;
    fence.modData["need:Base.MetalPipe"]= "2";
    fence.modData["need:Base.SmallSheetMetal"]= "4";
    fence.modData["need:Base.Hinge"]= "2";
    fence.modData["use:Base.BlowTorch"] = torchUse;
    fence.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    fence.player = player
    fence.completionSound = "BuildMetalStructureMedium";
    getCell():setDrag(fence, player);
end

ISBlacksmithMenu.onMetalShelves = function(worldobjects, player, torchUse)
    local fence = ISSimpleFurniture:new("shelves", "furniture_shelving_01_29","furniture_shelving_01_28");
    fence.noNeedHammer = true;
    fence.needToBeAgainstWall = true;
    fence.buildLow = false;
    fence.isWallLike = true;
    fence.isContainer = true;
    fence.containerType = "shelves";
    fence.firstItem = "BlowTorch";
--    fence.firstPredicate = predicateDrainableUsesInt
--    fence.firstArg = tonumber(torchUse)
    fence.secondItem = "WeldingMask";
    fence.craftingBank = "BlowTorch";
    fence.modData["xp:MetalWelding"] = 15;
    fence.modData["need:Base.MetalPipe"]= "2";
    fence.modData["need:Base.SmallSheetMetal"]= "1";
    fence.modData["need:Base.ScrapMetal"]= "1";
    fence.modData["use:Base.BlowTorch"] = torchUse;
    fence.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    fence.player = player
    fence.completionSound = "BuildMetalStructureSmall";
    getCell():setDrag(fence, player);
end

ISBlacksmithMenu.onSmallLocker = function(worldobjects, player, torchUse)
    local fence = ISWoodenContainer:new("furniture_storage_02_8","furniture_storage_02_9", nil);
    fence.name = "Small Metal Locker"
    fence.firstItem = "BlowTorch";
--    fence.firstPredicate = predicateDrainableUsesInt
--    fence.firstArg = tonumber(torchUse)
    fence.secondItem = "WeldingMask";
    fence.craftingBank = "BlowTorch";
    fence:setEastSprite("furniture_storage_02_10");
    fence:setSouthSprite("furniture_storage_02_11");
    fence.noNeedHammer = true;
    fence.containerType = "locker";
    fence.actionAnim = "BlowTorchMid";
    fence.modData["xp:MetalWelding"] = 30;
    fence.modData["need:Base.MetalPipe"]= "3";
    fence.modData["need:Base.SmallSheetMetal"]= "4";
    fence.modData["need:Base.Hinge"]= "2";
    fence.modData["use:Base.BlowTorch"] = torchUse;
    fence.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    fence.player = player
    fence.completionSound = "BuildMetalStructureMedium";
    getCell():setDrag(fence, player);
end

-- OUTDOOR
ISBlacksmithMenu.buildOutdoorMenu = function(subMenu, context, option, player)
	local playerObj = getSpecificPlayer(player)
	
	-- Collectors
	local collectorsOption = subMenu:addOption(getText("ContextMenu_Collector"), worldobjects, nil);
	local subMenuCollectors = subMenu:getNew(subMenu);
	context:addSubMenu(collectorsOption, subMenuCollectors);
	
	local metalDrumOption = subMenuCollectors:addOption(getText("ContextMenu_Metal_Drum"), worldobjects, ISBlacksmithMenu.onCreateonMetalDrum, "crafted_01_24", player, "10");
	local toolTip = ISBlacksmithMenu.addToolTip(metalDrumOption, getText("ContextMenu_Metal_Drum"), "crafted_01_24");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(4,4,6,0,4,10,7,playerObj,toolTip, 4);
	if not canDo then metalDrumOption.notAvailable = true; end
	
	local metalDrumOption2 = subMenuCollectors:addOption(getText("ContextMenu_Metal_Drum"), worldobjects, ISBlacksmithMenu.onCreateonMetalDrum, "crafted_01_28", player, "10");
	local toolTip = ISBlacksmithMenu.addToolTip(metalDrumOption2, getText("ContextMenu_Metal_Drum"), "crafted_01_28");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(4,4,6,0,4,10,7,playerObj,toolTip, 4);
	if not canDo then metalDrumOption2.notAvailable = true; end
	
	-- Fence 
	local fenceMWOption = subMenu:addOption(getText("ContextMenu_Fence"), worldobjects, nil);
	local subMenuMWFence = subMenu:getNew(subMenu);
	context:addSubMenu(fenceMWOption, subMenuMWFence);
		
	local fenceSprite = ISBlacksmithMenu.getFenceSprite(player);
	local fenceMetalOption = subMenuMWFence:addOption(getText("ContextMenu_MetalFence"), worldobjects, ISBlacksmithMenu.onMetalFence, fenceSprite, player,"5");
	local toolTip = ISBlacksmithMenu.addToolTip(fenceMetalOption, getText("ContextMenu_MetalFence"), fenceSprite.sprite);
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(1,2,0,0,3,5,3,playerObj,toolTip);
	if not canDo then fenceMetalOption.notAvailable = true; end

	local fencePoleOption = subMenuMWFence:addOption(getText("ContextMenu_MetalPoleFence"), worldobjects, ISBlacksmithMenu.onMetalPoleFence, player,"4");
	local toolTip = ISBlacksmithMenu.addToolTip(fencePoleOption, getText("ContextMenu_MetalPoleFence"), "constructedobjects_01_62");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(3,0,0,0,0,4,3,playerObj,toolTip);
	if not canDo then fencePoleOption.notAvailable = true; end

	local wiredfenceOption = subMenuMWFence:addOption(getText("ContextMenu_WiredFence"), worldobjects, ISBlacksmithMenu.onWiredFence, player,"4");
	local toolTip = ISBlacksmithMenu.addToolTip(wiredfenceOption, getText("ContextMenu_WiredFence"), "fencing_01_26");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(2,0,0,0,1,4,4,playerObj,toolTip,0,1);
	if not canDo then wiredfenceOption.notAvailable = true; end

	local bigWiredFenceOption = subMenuMWFence:addOption(getText("ContextMenu_BigWiredFence"), worldobjects, ISBlacksmithMenu.onBigWiredFence, player,"6");
	local toolTip = ISBlacksmithMenu.addToolTip(bigWiredFenceOption, getText("ContextMenu_BigWiredFence"), "fencing_01_58");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(3,0,0,0,4,6,5,playerObj,toolTip,0,3);
	if not canDo then bigWiredFenceOption.notAvailable = true; end

	local bigFenceOption = subMenuMWFence:addOption(getText("ContextMenu_BigMetalFence"), worldobjects, ISBlacksmithMenu.onBigMetalFence, player,"8");
	local toolTip = ISBlacksmithMenu.addToolTip(bigFenceOption, getText("ContextMenu_BigMetalFence"), "constructedobjects_01_78");
	local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(5,0,0,0,2,8,7,playerObj,toolTip);
	if not canDo then bigFenceOption.notAvailable = true; end
	
	if metalDrumOption.notAvailable and metalDrumOption2.notAvailable then
		collectorsOption.notAvailable = true;
	end
	if fenceMetalOption.notAvailable and fencePoleOption.notAvailable and wiredfenceOption.notAvailable and bigWiredFenceOption.notAvailable and bigFenceOption.notAvailable then
		fenceMWOption.notAvailable = true;
	end;
	if collectorsOption.notAvailable and fenceMWOption.notAvailable then
		option.notAvailable = true;
	end
end

-- create a new barrel to drag a ghost render of the barrel under the mouse
ISBlacksmithMenu.onCreateonMetalDrum = function(worldobjects, sprite, player, torchUse)
	local drum = ISMetalDrum:new(player, sprite);
	drum.firstItem = "BlowTorch";
    drum.secondItem = "WeldingMask";
    drum.craftingBank = "BlowTorch";
    drum.actionAnim = "BlowTorchMid";
	drum.modData["xp:MetalWelding"] = 25;
	drum.modData["need:Base.MetalPipe"] = "4";
	drum.modData["need:Base.SmallSheetMetal"]= "4";
	drum.modData["need:Base.SheetMetal"] = "6";
	drum.modData["need:Base.ScrapMetal"]= "4";
	drum.modData["need:Base.MetalBar"] = "4";
	drum.modData["use:Base.BlowTorch"] = torchUse;
    drum.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
	drum.player = player
	drum.completionSound = "BuildMetalStructureMedium";
	getCell():setDrag(drum, player);
end

ISBlacksmithMenu.onMetalFence = function(worldobjects, sprite, player, torchUse)
    local fence = ISWoodenWall:new(sprite.sprite,sprite.northSprite, nil);
    fence.name = "MetalPanelFence" .. ISBlacksmithMenu.getSpriteLvl(player);
    fence.firstItem = "BlowTorch";
--    fence.firstPredicate = predicateDrainableUsesInt
--    fence.firstArg = tonumber(torchUse)
    fence.secondItem = "WeldingMask";
    fence.craftingBank = "BlowTorch";
    fence.noNeedHammer = true;
    fence.actionAnim = "BlowTorchMid";
    fence.hoppable = true;
    fence.isThumpable = false;
    fence.canBarricade = false;
    fence.modData["xp:MetalWelding"] = 20;
    fence.modData["need:Base.MetalPipe"]= "1";
    fence.modData["need:Base.SmallSheetMetal"]= "2";
    fence.modData["need:Base.ScrapMetal"]= "3";
    fence.modData["use:Base.BlowTorch"] = torchUse;
    fence.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    fence.player = player
    fence.corner = "constructedobjects_01_85"
    fence.completionSound = "BuildMetalStructureSmallScrap";
    getCell():setDrag(fence, player);
end

ISBlacksmithMenu.onMetalPoleFence = function(worldobjects, player, torchUse)
    local fence = ISWoodenWall:new("constructedobjects_01_62","constructedobjects_01_61", nil);
    fence.name = "Small Metal Pole Fence"
    fence.firstItem = "BlowTorch";
--    fence.firstPredicate = predicateDrainableUsesInt
--    fence.firstArg = tonumber(torchUse)
    fence.secondItem = "WeldingMask";
    fence.craftingBank = "BlowTorch";
    fence.noNeedHammer = true;
    fence.actionAnim = "BlowTorchMid";
    fence.canBarricade = false
    fence.isThumpable = false
    fence.modData["xp:MetalWelding"] = 20;
    fence.modData["need:Base.MetalPipe"]= "3";
    fence.modData["use:Base.BlowTorch"] = torchUse;
    fence.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    fence.player = player
    fence.corner = "constructedobjects_01_60";
    fence.completionSound = "BuildMetalStructureSmallPoleFence";
    getCell():setDrag(fence, player);
end

ISBlacksmithMenu.onWiredFence = function(worldobjects, player, torchUse)
    local fence = ISWoodenWall:new("fencing_01_26","fencing_01_25", nil);
    fence.name = "Small Metal Wire Fence"
    fence.firstItem = "BlowTorch";
--    fence.firstPredicate = predicateDrainableUsesInt
--    fence.firstArg = tonumber(torchUse)
    fence.secondItem = "WeldingMask";
    fence.craftingBank = "BlowTorch";
    fence.noNeedHammer = true;
    fence.actionAnim = "BlowTorchMid";
    fence.hoppable = true;
    fence.isThumpable = false;
    fence.canBarricade = false
    fence.modData["xp:MetalWelding"] = 15;
    fence.modData["need:Base.MetalPipe"] = "2";
    fence.modData["need:Base.ScrapMetal"]= "1";
    fence.modData["use:Base.Wire"] = "1";
    fence.modData["use:Base.BlowTorch"] = torchUse;
    fence.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    fence.player = player
    fence.corner = "fencing_01_29";
    fence.completionSound = "BuildMetalStructureSmallWiredFence";
    getCell():setDrag(fence, player);
end

ISBlacksmithMenu.onBigWiredFence = function(worldobjects, player, torchUse)
    local fence = ISWoodenWall:new("fencing_01_58","fencing_01_57", nil);
    fence.name = "Big Metal Wire Fence"
    fence.firstItem = "BlowTorch";
--    fence.firstPredicate = predicateDrainableUsesInt
--    fence.firstArg = tonumber(torchUse)
    fence.secondItem = "WeldingMask";
    fence.craftingBank = "BlowTorch";
    fence.noNeedHammer = true;
    fence.canBarricade = false
    fence.modData["xp:MetalWelding"] = 20;
    fence.modData["use:Base.Wire"] = "3";
    fence.modData["need:Base.MetalPipe"] = "3";
    fence.modData["need:Base.ScrapMetal"]= "4";
    fence.modData["use:Base.BlowTorch"] = torchUse;
    fence.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    fence.player = player
    fence.corner = "fencing_01_61";
    fence.completionSound = "BuildMetalStructureLargeWiredFence";
    getCell():setDrag(fence, player);
end

ISBlacksmithMenu.onBigMetalFence = function(worldobjects, player, torchUse) --called "Big Pole Fence" in game
    local fence = ISWoodenWall:new("constructedobjects_01_78","constructedobjects_01_77", nil);
    fence.name = "Big Metal Pole Fence"
    fence.firstItem = "BlowTorch";
--    fence.firstPredicate = predicateDrainableUsesInt
--    fence.firstArg = tonumber(torchUse)
    fence.secondItem = "WeldingMask";
    fence.craftingBank = "BlowTorch";
    fence.noNeedHammer = true;
    fence.canBarricade = false
    fence.modData["xp:MetalWelding"] = 25;
    fence.modData["need:Base.MetalPipe"] = "5";
    fence.modData["need:Base.ScrapMetal"]= "2";
    fence.modData["use:Base.BlowTorch"] = torchUse;
    fence.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    fence.player = player
    fence.corner = "constructedobjects_01_76";
    fence.completionSound = "BuildMetalStructureLargePoleFence";
    getCell():setDrag(fence, player);
end

ISBlacksmithMenu.onRemoveCharcoal = function(worldobjects, metalDrum, player)
    if luautils.walkAdj(player, metalDrum:getSquare()) then
        ISTimedActionQueue.add(ISRemoveCharcoal:new(player, metalDrum))
    end
end

ISBlacksmithMenu.onPutOutFireDrum = function(worldobjects, metalDrum, player)
    if luautils.walkAdj(player, metalDrum:getSquare()) then
        ISTimedActionQueue.add(ISPutOutFireDrum:new(player, metalDrum))
    end
end

ISBlacksmithMenu.onRemoveLogs = function(worldobjects, metalDrum, player)
    if luautils.walkAdj(player, metalDrum:getSquare()) then
        ISTimedActionQueue.add(ISAddLogsInDrum:new(player, metalDrum, false))
    end
end

ISBlacksmithMenu.onAddLogs = function(worldobjects, metalDrum, player)
    if luautils.walkAdj(player, metalDrum:getSquare()) then
        ISTimedActionQueue.add(ISAddLogsInDrum:new(player, metalDrum, true))
    end
end

ISBlacksmithMenu.onRemoveDrum = function(worldobjects, metalDrum, player)
    if luautils.walkAdj(player, metalDrum:getSquare()) then
        ISTimedActionQueue.add(ISRemoveDrum:new(player, metalDrum))
    end
end

ISBlacksmithMenu.checkWire = function(wireUses, player, toolTip)
    if ISBuildMenu.cheat or wireUses == 0 then
        return true, toolTip;
    end
    local canDo = true;
    local totalUse = ISBlacksmithMenu.getMaterialUses(player, "Wire");
    if totalUse > wireUses then
        toolTip.description = toolTip.description .. " <LINE> <RGB:0,1,0> " .. getItemNameFromFullType("Base.Wire") .. " " .. totalUse .. "/" .. wireUses .. " " .. getText("ContextMenu_Uses");
    else
        toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.Wire") .. " " .. totalUse .. "/" .. wireUses .. " " .. getText("ContextMenu_Uses");
        canDo = false;
    end
    if ISBuildMenu.cheat then
        return true, toolTip;
    end
    return canDo, toolTip;
end

local function comparatorDrainableUsesInt(item1, item2)
    return item1:getDrainableUsesInt() - item2:getDrainableUsesInt()
end

function ISBlacksmithMenu.getBlowTorchWithMostUses(container)
    return container:getBestTypeEvalRecurse("Base.BlowTorch", comparatorDrainableUsesInt)
end

function ISBlacksmithMenu.getFirstBlowTorchWithUses(container, uses)
    return container:getFirstTypeEvalArgRecurse("Base.BlowTorch", predicateDrainableUsesInt, uses)
end

function ISBlacksmithMenu.getMaterialCount(playerObj, type)
    local playerInv = playerObj:getInventory()
    local count = playerInv:getCountTypeRecurse(type)
    if ISBlacksmithMenu.groundItemCounts[type] then
        count = count + ISBlacksmithMenu.groundItemCounts[type]
    end
    return count
end

function ISBlacksmithMenu.getMaterialUses(playerObj, type)
    local playerInv = playerObj:getInventory()
    local count = playerInv:getUsesTypeRecurse(type)
    if ISBlacksmithMenu.groundItemUses[type] then
        count = count + ISBlacksmithMenu.groundItemUses[type]
    end
    return count
end

ISBlacksmithMenu.checkMetalWeldingFurnitures = function(metalPipes, smallMetalSheet, metalSheet, hinge, scrapMetal, torchUse, skill, player, toolTip, metalBar, wire)
    local inv = player:getInventory();
    local isOk = true;
    local blowTorch = inv:getFirstTypeRecurse("Base.BlowTorch")
    local blowTorchUseLeft = inv:getUsesTypeRecurse("Base.BlowTorch")
    if ISBlacksmithMenu.groundItemUses["Base.BlowTorch"] then
        blowTorchUseLeft = blowTorchUseLeft + ISBlacksmithMenu.groundItemUses["Base.BlowTorch"]
        local maxUses = 0
        local blowTorchGround = nil
        for _,item2 in ipairs(ISBlacksmithMenu.groundItems["Base.BlowTorch"]) do
            if item2:getDrainableUsesInt() > maxUses then
                blowTorchGround = item2
                maxUses = item2:getDrainableUsesInt()
            end
        end
        blowTorch = blowTorch or blowTorchGround
    end
    if skill > 0 then
        if player:getPerkLevel(Perks.MetalWelding) < skill then
            toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getText("IGUI_perks_MetalWelding") .. " " .. player:getPerkLevel(Perks.MetalWelding) .. "/" .. skill;
            isOk = false;
        else
            toolTip.description = toolTip.description .. " <LINE> <RGB:0,1,0> " .. getText("IGUI_perks_MetalWelding") .. " " .. player:getPerkLevel(Perks.MetalWelding) .. "/" .. skill ;
        end
    end
	toolTip.description = toolTip.description .. " <LINE> ";
    if blowTorch then
        if torchUse > 0 then
            if blowTorchUseLeft < torchUse then
                toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.BlowTorch") .. " " .. getText("ContextMenu_Uses") .. " " .. blowTorchUseLeft .. "/" .. torchUse;
                isOk = false;
            else
                toolTip.description = toolTip.description .. " <LINE> <RGB:0,1,0> " .. getItemNameFromFullType("Base.BlowTorch") .. " " .. getText("ContextMenu_Uses") .. " " .. blowTorchUseLeft .. "/" .. torchUse;
            end
        end
    else
        toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.BlowTorch") .. " 0" .. "/" .. torchUse;
        isOk = false;
    end
    local rodUse = ISBlacksmithMenu.weldingRodUses(torchUse)
    local weldingRods = ISBlacksmithMenu.getMaterialUses(player, "Base.WeldingRods")
    if rodUse > 0 then
        if weldingRods < rodUse then
            toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.WeldingRods") .. " " .. getText("ContextMenu_Uses") .. " " .. weldingRods .. "/" .. rodUse;
            isOk = false;
        else
            toolTip.description = toolTip.description .. " <LINE> <RGB:0,1,0> " .. getItemNameFromFullType("Base.WeldingRods") .. " " .. getText("ContextMenu_Uses") .. " " .. weldingRods .. "/" .. rodUse;
        end
    end
    -- local weldingMask = ISBlacksmithMenu.getMaterialCount(player, "WeldingMask")
    if not inv:containsEvalRecurse(predicateWeldingMask) then
        local weldingMask = 0
        toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.WeldingMask") .. " " .. weldingMask .. "/1" ;
        isOk = false;
    else
        local weldingMask = 1
        toolTip.description = toolTip.description .. " <LINE> <RGB:0,1,0> " .. getItemNameFromFullType("Base.WeldingMask") .. " " .. weldingMask .. "/1" ;
    end
    if metalBar and metalBar > 0 then
        local count = ISBlacksmithMenu.getMaterialCount(player, "MetalBar")
        if count < metalBar then
            toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.MetalBar") .. " " .. count .. "/" .. metalBar;
            isOk = false;
        else
            toolTip.description = toolTip.description .. " <LINE> <RGB:0,1,0> " .. getItemNameFromFullType("Base.MetalBar") .. " " .. count .. "/" .. metalBar ;
        end
    end
    if metalPipes > 0 then
        local count = ISBlacksmithMenu.getMaterialCount(player, "MetalPipe")
        if count < metalPipes then
            toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.MetalPipe") .. " " .. count .. "/" .. metalPipes;
            isOk = false;
        else
            toolTip.description = toolTip.description .. " <LINE> <RGB:0,1,0> " .. getItemNameFromFullType("Base.MetalPipe") .. " " .. count .. "/" .. metalPipes ;
        end
    end
    if smallMetalSheet > 0 then
        local count = ISBlacksmithMenu.getMaterialCount(player, "SmallSheetMetal")
        if count < smallMetalSheet then
            toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.SmallSheetMetal") .. " " .. count .. "/" .. smallMetalSheet;
            isOk = false;
        else
            toolTip.description = toolTip.description .. " <LINE> <RGB:0,1,0> " .. getItemNameFromFullType("Base.SmallSheetMetal") .. " " .. count .. "/" .. smallMetalSheet ;
        end
    end
    if metalSheet > 0 then
        local count = ISBlacksmithMenu.getMaterialCount(player, "SheetMetal")
        if count < metalSheet then
            toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.SheetMetal") .. " " .. count .. "/" .. metalSheet;
            isOk = false;
        else
            toolTip.description = toolTip.description .. " <LINE> <RGB:0,1,0> " .. getItemNameFromFullType("Base.SheetMetal") .. " " .. count .. "/" .. metalSheet ;
        end
    end
    if hinge > 0 then
        local count = ISBlacksmithMenu.getMaterialCount(player, "Hinge")
        if count < hinge then
            toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.Hinge") .. " " .. count .. "/" .. hinge;
            isOk = false;
        else
            toolTip.description = toolTip.description .. " <LINE> <RGB:0,1,0> " .. getItemNameFromFullType("Base.Hinge") .. " " .. count .. "/" .. hinge ;
        end
    end
    if scrapMetal > 0 then
        local count = ISBlacksmithMenu.getMaterialCount(player, "ScrapMetal")
        if count < scrapMetal then
            toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.ScrapMetal") .. " " .. count .. "/" .. scrapMetal;
            isOk = false;
        else
            toolTip.description = toolTip.description .. " <LINE> <RGB:0,1,0> " .. getItemNameFromFullType("Base.ScrapMetal") .. " " .. count .. "/" .. scrapMetal ;
        end
    end
    if wire ~= nil and wire > 0 then
        local count = ISBlacksmithMenu.getMaterialUses(player, "Wire");
        if count < wire then
            toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.Wire") .. " " .. getText("ContextMenu_Uses") .. " " .. count .. "/" .. wire;
            isOk = false;
        else
            toolTip.description = toolTip.description .. " <LINE> <RGB:0,1,0> " .. getItemNameFromFullType("Base.Wire") .. " " .. getText("ContextMenu_Uses") .. " " .. count .. "/" .. wire;
        end
    end
    if ISBuildMenu.cheat then
        return true, toolTip;
    end
    if isOk then
        ISBlacksmithMenu.canDoSomething = true;
    end
    return isOk, toolTip;
end

ISBlacksmithMenu.onEmptyDrum = function(worldobjects, metalDrum, playerObj)
    if luautils.walkAdj(playerObj, metalDrum:getSquare()) then
        ISTimedActionQueue.add(ISEmptyDrum:new(playerObj, metalDrum))
    end
end

ISBlacksmithMenu.addToolTip = function(option, name, texture)
    local toolTip = ISWorldObjectContextMenu.addToolTip();
    option.toolTip = toolTip;
    toolTip:setName(name);
    toolTip.description = getText("Tooltip_craft_Needs") .. ": ";
    toolTip:setTexture(texture);
    toolTip.footNote = getText("Tooltip_craft_pressToRotate", Keyboard.getKeyName(getCore():getKey("Rotate building")))
    return toolTip;
end

ISBlacksmithMenu.getMetal = function(player, amount)
    local totalMetal = 0;
    local ingots = {};
    local containers = ISInventoryPaneContextMenu.getContainers(player)
    for i=1,containers:size() do
        local container = containers:get(i-1)
        for j=1,container:getItems():size() do
            local item = container:getItems():get(j-1);
            if item:getType() == "IronIngot" then
                totalMetal = totalMetal + item:getUsedDelta() / item:getUseDelta();
                table.insert(ingots, item);
                if totalMetal >= amount then
                    return ingots, round(amount,0);
                end
            end
        end
    end
    return nil, round(totalMetal,0);
end

ISBlacksmithMenu.onInfo = function(worldobjects, furnace, player)
    if luautils.walkAdj(player, furnace:getSquare()) then
        ISTimedActionQueue.add(ISFurnaceInfoAction:new(player, furnace))
    end
end

ISBlacksmithMenu.onUseBellows = function(worldobjects, furnace, bellows, player)
    if luautils.walkAdj(player, furnace:getSquare()) then
        ISTimedActionQueue.add(ISUseBellows:new(furnace, bellows, player))
    end
end

ISBlacksmithMenu.onStopFire = function(worldobjects, furnace, player)
    if luautils.walkAdj(player, furnace:getSquare()) then
        ISTimedActionQueue.add(ISStopFurnaceFire:new(furnace, player))
    end
end

ISBlacksmithMenu.onAddFuel = function(worldobjects, furnace, coal, player)
    if luautils.walkAdj(player, furnace:getSquare()) then
        ISTimedActionQueue.add(ISAddCoalInFurnace:new(furnace, coal, player))
    end
end

ISBlacksmithMenu.onStoneFurnace = function(worldobjects, player)
    local furniture = ISBSFurnace:new("Stone Furnace", "crafted_01_42", "crafted_01_43");
--    furniture.modData["need:Base.Stone"] = "5";
    furniture.player = player
    getCell():setDrag(furniture, player);
end

ISBlacksmithMenu.onAnvil = function(worldobjects, player)
    local furniture = ISAnvil:new("Anvil", getSpecificPlayer(player), "crafted_01_19", "crafted_01_19");
    furniture.player = player
    getCell():setDrag(furniture, player);
end

-- ISBlacksmithMenu.onMetalDrum = function(worldobjects, player, sprite)
    -- local barrel = ISMetalDrum:new(player, sprite);
-- --    barrel.modData["need:Base.MetalDrum"] = "1";
    -- barrel.player = player
    -- getCell():setDrag(barrel, player);
-- end

ISBlacksmithMenu.onLightFromPetrol = function(worldobjects, player, lighter, petrol, furnace)
    local playerObj = getSpecificPlayer(player)
    ISCampingMenu.toPlayerInventory(playerObj, lighter)
    ISCampingMenu.toPlayerInventory(playerObj, petrol)
    if luautils.walkAdj(playerObj, furnace:getSquare(), true) then
        ISTimedActionQueue.add(ISFurnaceLightFromPetrol:new(playerObj, furnace, lighter, petrol, 20));
    end
end

ISBlacksmithMenu.onLightFromLiterature = function(worldobjects, player, literature, lighter, furnace, fuelAmt)
    local playerObj = getSpecificPlayer(player)
    ISCampingMenu.toPlayerInventory(playerObj, literature)
    ISCampingMenu.toPlayerInventory(playerObj, lighter)
    if luautils.walkAdj(playerObj, furnace:getSquare(), true) then
        if playerObj:isEquipped(literature) then
            ISTimedActionQueue.add(ISUnequipAction:new(playerObj, literature, 50));
        end
        ISTimedActionQueue.add(ISFurnaceLightFromLiterature:new(playerObj, literature, lighter, furnace, fuelAmt, 100));
    end
end

ISBlacksmithMenu.onLightFromKindle = function(worldobjects, player, percedWood, stickOrBranch, furnace)
    local playerObj = getSpecificPlayer(player)
    ISCampingMenu.toPlayerInventory(playerObj, percedWood)
    ISCampingMenu.toPlayerInventory(playerObj, stickOrBranch)
    if luautils.walkAdj(playerObj, furnace:getSquare(), true) then
        ISTimedActionQueue.add(ISFurnaceLightFromKindle:new(playerObj, percedWood, stickOrBranch, furnace, 1500));
    end
end

ISBlacksmithMenu.onLightDrumFromPetrol = function(worldobjects, player, lighter, petrol, metalDrum)
    local playerObj = getSpecificPlayer(player)
    ISCampingMenu.toPlayerInventory(playerObj, lighter)
    ISCampingMenu.toPlayerInventory(playerObj, petrol)
    if luautils.walkAdj(playerObj, metalDrum:getSquare(), true) then
        ISTimedActionQueue.add(ISDrumLightFromPetrol:new(playerObj, metalDrum, lighter, petrol, 20));
    end
end

ISBlacksmithMenu.onLightDrumFromLiterature = function(worldobjects, player, literature, lighter, metalDrum, fuelAmt)
    local playerObj = getSpecificPlayer(player)
    ISCampingMenu.toPlayerInventory(playerObj, literature)
    ISCampingMenu.toPlayerInventory(playerObj, lighter)
    if luautils.walkAdj(playerObj, metalDrum:getSquare(), true) then
        if playerObj:isEquipped(literature) then
            ISTimedActionQueue.add(ISUnequipAction:new(playerObj, literature, 50));
        end
        ISTimedActionQueue.add(ISDrumLightFromLiterature:new(playerObj, literature, lighter, metalDrum, fuelAmt, 100));
    end
end

ISBlacksmithMenu.onLightDrumFromKindle = function(worldobjects, player, percedWood, stickOrBranch, metalDrum)
    local playerObj = getSpecificPlayer(player)
    ISCampingMenu.toPlayerInventory(playerObj, percedWood)
    ISCampingMenu.toPlayerInventory(playerObj, stickOrBranch)
    if luautils.walkAdj(playerObj, metalDrum:getSquare(), true) then
        ISTimedActionQueue.add(ISDrumLightFromKindle:new(playerObj, percedWood, stickOrBranch, metalDrum, 1500));
    end
end

ISBlacksmithMenu.getSpriteLvl = function(player)
	local player = getSpecificPlayer(player)
	-- 0 to 1 wood work xp mean lvl 1 sprite
	if player:getPerkLevel(Perks.MetalWelding) <= 5 then
		return 1;
	else
		return 2;
	end
end

ISBlacksmithMenu.getFenceSprite = function(player)
	local spriteLvl = ISBlacksmithMenu.getSpriteLvl(player);
    local sprite = {};
    if spriteLvl == 1 then
        sprite.sprite = "constructedobjects_01_82";
        sprite.northSprite = "constructedobjects_01_81";
    else
        sprite.sprite = "constructedobjects_01_83";
        sprite.northSprite = "constructedobjects_01_80";
    end
    return sprite;
end

ISBlacksmithMenu.getDoorFrameMetalSprite = function(player)
	local spriteLvl = ISBlacksmithMenu.getSpriteLvl(player);
    local sprite = {};
    if spriteLvl == 1 then
        sprite.sprite = "constructedobjects_01_74";
        sprite.northSprite = "constructedobjects_01_75";
    else
        sprite.sprite = "constructedobjects_01_58";
        sprite.northSprite = "constructedobjects_01_59";
    end
	sprite.corner = nil;
    return sprite;
end

Events.OnFillWorldObjectContextMenu.Add(ISBlacksmithMenu.doBuildMenu);
ISBlacksmithMenu.metalForAnvil = 500;
