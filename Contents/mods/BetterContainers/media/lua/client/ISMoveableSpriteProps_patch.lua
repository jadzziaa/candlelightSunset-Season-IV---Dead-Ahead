function ISMoveableSpriteProps:isWhitelisted( _mode )
   -- Whitelist certain sprites from the tool and skill requirements
   -- for pickup and placement (not scrap)
   -- print("Checking sprite named '"..tostring(self.spriteName).."'")
   return (_mode == "pickup" or _mode == "place") and ( -- Only modifying pickup and place, scrap has normal reqs
          (self.spriteName:find("^appliances_") ~= nil) or
	  (self.spriteName:find("^furniture_") ~= nil and self.spriteName:find("furniture_shelving_01_2") == nil) or -- Allow furniture, but not wall shelves
	  (self.name == "Crate") or
	  (self.spriteName:find("^carpentry") ~= nil and self.spriteName:find("^carpentry_02_68") == nil)); -- Allow all carpentry except specific wall shelves
end

function ISMoveableSpriteProps:getBreakChance( _player )
	if ISMoveableDefinitions.cheat or self:isWhitelisted("pickup") then
        return 0;
    end

	if _player and self.isMoveable and self.canBreak and self.pickUpTool then
        local toolDef = ISMoveableDefinitions:getInstance().getToolDefinition( self.pickUpTool ); --ISMoveableSpriteProps.toolDefinitions[self.pickUpTool];
        if toolDef then
	        if not toolDef.perk then
	            return 0;
            end

            local perkLevel = _player:getPerkLevel(toolDef.perk);
	        if perkLevel >= 3 then
	            return 0;
	        end

            return (3-perkLevel)*10;
        else
            print("Missing tool definition for: "..tostring(self.pickUpTool));
        end
	end
	return 0;
end

function ISMoveableSpriteProps:hasRequiredSkill( _player, _mode )
	if ISMoveableDefinitions.cheat then return true; end
    if _mode == "scrap" then
        if not _player then return false end
        if not self.canScrap then return false end
        if not self.scrapUseSkill then return false end
        local scrapDef = ISMoveableDefinitions:getInstance().getScrapDefinition(self.material)
        if scrapDef and scrapDef.perk then
            local perkLevel = _player:getPerkLevel(scrapDef.perk)
            return true, scrapDef.perkName, scrapDef.perk
        end
        return false
    end
    if _player and self.isMoveable and _mode then
        if self:isWhitelisted(_mode) then return true; end
        local tool = (_mode=="pickup" and self.pickUpTool) or (_mode=="place" and self.placeTool);
        local toolDef = ISMoveableDefinitions:getInstance().getToolDefinition( tool ); -- ISMoveableSpriteProps.toolDefinitions[self.pickUpTool];
        if toolDef then
            local perkLevel = _player:getPerkLevel(toolDef.perk);
            if self.pickUpLevel > 0 then
                return (perkLevel>=self.pickUpLevel), toolDef.perkName, toolDef.perk;
            end
            return true, toolDef.perkName;
        end
    end
    return true;
end

local oldHasToolFunction = ISMoveableSpriteProps.hasTool
function ISMoveableSpriteProps:hasTool( _player, _mode )
	if self:isWhitelisted(_mode) then
        return true
    end

    return oldHasToolFunction(self, _player, _mode)
end

local function resetInfoPanelFlags()
    InfoPanelFlags.debug = nil;
    InfoPanelFlags.name = nil;
    InfoPanelFlags.weight = nil;
    InfoPanelFlags.hasItems = nil;
    InfoPanelFlags.canRotate = nil;
    InfoPanelFlags.hasSkill = nil;
    InfoPanelFlags.nameSkill = nil;
    InfoPanelFlags.perk = nil
    InfoPanelFlags.levelSkill = nil
    InfoPanelFlags.tool = nil;
    InfoPanelFlags.hasTool = nil;
    InfoPanelFlags.toolString = {}; --contains tools, possibly multiple lines (note to self: only first line tool had prefix)
    InfoPanelFlags.tool2 = nil;
    InfoPanelFlags.hasTool2 = nil;
    InfoPanelFlags.tool2String = {};
    InfoPanelFlags.scrapChance = nil;
    InfoPanelFlags.breakChance = nil;
    InfoPanelFlags.hasCompost = nil;
    InfoPanelFlags.tooHeavy = nil;
    InfoPanelFlags.tooHot = nil;
    InfoPanelFlags.itemsOnSurface = nil;
    InfoPanelFlags.hasWater = nil;
    InfoPanelFlags.notEmpty = nil;
    InfoPanelFlags.doorBarricaded = nil;
    InfoPanelFlags.doorInFrame = nil;
    InfoPanelFlags.floorAtTopOfStairs = nil;
    InfoPanelFlags.windowOpen = nil;
    InfoPanelFlags.windowBarricaded = nil;
    InfoPanelFlags.windowInFrame = nil;
    InfoPanelFlags.needStandingInside = nil;
    InfoPanelFlags.mustPlaceRoomRoof = nil;
    InfoPanelFlags.isOperational = nil; -- for stuff that cant be moved due it being operated (like bbq)
    InfoPanelFlags.removePropane = nil;
end

local function getColorValues( _bool )
    if _bool then
        return 0,255,0;
    end
    return 255,0,0;
end

function ISMoveableSpriteProps:getInfoPanelDescription( _square, _object, _player, _mode )
    local infoTable = {};
    if _mode == "scrap" and not self.canScrap then
        return ISMoveableSpriteProps.addLineToInfoTable( infoTable, getText("IGUI_NoCanScrap"), 255, 0, 0 );
    elseif _mode ~= "scrap" and not self.isMoveable then
        return ISMoveableSpriteProps.addLineToInfoTable( infoTable, getText("IGUI_NoMovable"), 255, 0, 0 );
    else
        -- debug print
        if ISMoveableSpriteProps.debug then
            infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, "DEBUG", 128, 128, 128 );
            for i=0, self.spriteProps:getPropertyNames():size()-1 do
                local name = self.spriteProps:getPropertyNames():get(i);
                infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, name, 255, 255, 255, tostring(self.spriteProps:Val(name)), 0, 255, 0 );
            end
            infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, "END DEBUG", 128, 128, 128 );
        end

        resetInfoPanelFlags();
        self:getInfoPanelFlagsGeneral( _square, _object, _player, _mode );
        if self.isMoveable and self.isMultiSprite then
            local sgrid = self:getSpriteGridInfo(_square, _mode == "pickup" or _mode == "scrap");
            if sgrid then
                for _,gridMember in ipairs(sgrid) do
                    self:getInfoPanelFlagsPerTile( gridMember.square, not gridMember.sprInstance and gridMember.object or nil, _player, _mode );
                end
            end
        else
            self:getInfoPanelFlagsPerTile( _square, _object, _player, _mode );
        end

        --##########################################
        local whitelist = self:isWhitelisted(_mode);
        if InfoPanelFlags.name then infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, getText("IGUI_Name")..":", 255, 255, 255, Translator.getMoveableDisplayName(InfoPanelFlags.name), 0, 255, 0 ); end
        if InfoPanelFlags.weight then infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, getText("Tooltip_item_Weight")..":", 255, 255, 255, tostring(InfoPanelFlags.weight), 0, 255, 0 ); end
        if InfoPanelFlags.nameSkill and not whitelist then
            local skillText = InfoPanelFlags.nameSkill
            if InfoPanelFlags.levelSkill ~= nil and InfoPanelFlags.levelSkill > 0 then
                skillText = skillText .. " " .. _player:getPerkLevel(InfoPanelFlags.perk) .. "/" .. InfoPanelFlags.levelSkill
            end
            infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, getText("IGUI_Skill")..":", 255, 255, 255, skillText, getColorValues(InfoPanelFlags.hasSkill) );
        end
        if #InfoPanelFlags.toolString > 0 and not whitelist then
            local first = true;
            for _,s in ipairs(InfoPanelFlags.toolString) do
                if first then
                    infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, getText("IGUI_Tool")..":", 255, 255, 255, s, getColorValues(InfoPanelFlags.hasTool) );
                else
                    infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, "", 255, 255, 255, s, getColorValues(InfoPanelFlags.hasTool) );
                end
                first = false;
            end
        else
            infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, getText("IGUI_Tool")..":", 255, 255, 255, getText("IGUI_None"), getColorValues(true) );
        end
        if #InfoPanelFlags.tool2String > 0 and not whitelist then
            local first = true;
            for _,s in ipairs(InfoPanelFlags.tool2String) do
                if first then
                    infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, getText("IGUI_Tool")..":", 255, 255, 255, s, getColorValues(InfoPanelFlags.hasTool2) );
                else
                    infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, "", 255, 255, 255, s, getColorValues(InfoPanelFlags.hasTool2) );
                end
                first = false;
            end
        end
        if InfoPanelFlags.scrapChance then
            local r,g,b = 255,0,0;
            if InfoPanelFlags.scrapChance > 15 and InfoPanelFlags.scrapChance <= 40 then
                r,g,b = 255,255,0;
            elseif InfoPanelFlags.scrapChance > 40 then
                r,g,b = 0,255,0;
            end
            infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, getText("Tooltip_Chance"), 255, 255, 255, tostring(InfoPanelFlags.scrapChance), r, g, b );
        end
        if InfoPanelFlags.breakChance then
            local r,g,b = 0,255,0;
            if InfoPanelFlags.breakChance > 75 then
                r,g,b = 255,0,0;
            elseif InfoPanelFlags.breakChance > 25 then
                r,g,b = 255,255,0;
            end
            infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, getText("IGUI_ChanceToBreak")..":", 255, 255, 255, tostring(InfoPanelFlags.breakChance), r, g, b );
        end
        if InfoPanelFlags.hasItems and _mode ~= "scrap" then
            infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, "- "..getText("IGUI_ItemsInContainer"), 255, 0, 0 );
        end
        if InfoPanelFlags.canRotate~=nil then
            if InfoPanelFlags.canRotate then infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, getText("IGUI_CanRotate"), 0, 255, 0 );
            else infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, getText("IGUI_CanNotRotate"), 255, 0, 0 ); end
        end
        if InfoPanelFlags.hasCompost then infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, "- "..getText("IGUI_ComposterHasCompost"), 255, 0, 0 ); end
        if InfoPanelFlags.tooHeavy then infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, "- "..getText("IGUI_ToHeavy"), 255, 0, 0 ); end
        if InfoPanelFlags.tooHot then infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, "- "..getText("IGUI_TooHot"), 255, 0, 0 ); end
        if InfoPanelFlags.itemsOnSurface then infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, "- "..getText("IGUI_ItemsSurface"), 255, 0, 0 ); end
        if InfoPanelFlags.hasWater then infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, "- "..getText("IGUI_RainCollectorHasWater"), 255, 0, 0 ); end
        if InfoPanelFlags.notEmpty then infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, "- "..getText("IGUI_MovableHasMaterial"), 255, 0, 0 ); end
        if InfoPanelFlags.doorBarricaded then infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, "- "..getText("IGUI_Moveables_DoorBarricaded"), 255, 0, 0 ); end
        if InfoPanelFlags.doorInFrame then infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, "- "..getText("IGUI_Moveables_DoorInFrame"), 255, 0, 0 ); end
        if InfoPanelFlags.floorAtTopOfStairs then infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, "- "..getText("IGUI_Moveables_FloorAtTopOfStairs"), 255, 0, 0 ); end
        if InfoPanelFlags.windowOpen then infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, "- "..getText("IGUI_WindowOpen"), 255, 0, 0 ); end
        if InfoPanelFlags.windowBarricaded then infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, "- "..getText("IGUI_WindowBarricaded"), 255, 0, 0 ); end
        if InfoPanelFlags.windowInFrame then infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, "- "..getText("IGUI_Moveables_WindowInFrame"), 255, 0, 0 ); end
        if InfoPanelFlags.needStandingInside then infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, "- "..getText("IGUI_NeedToBeStandingInside"), 255, 0, 0 ); end
        if InfoPanelFlags.mustPlaceRoomRoof then infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, "- "..getText("IGUI_MustPlaceRoomRoof"), 255, 0, 0 ); end
        if InfoPanelFlags.isOperational then infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, "- "..getText("IGUI_IsOperational"), 255, 0, 0 ); end
        if InfoPanelFlags.removePropane then infoTable = ISMoveableSpriteProps.addLineToInfoTable( infoTable, "- "..getText("IGUI_RemovePropane"), 255, 0, 0 ); end
        --##########################################
        return infoTable;
    end
end

function ISMoveableSpriteProps:walkToAndEquip( _character, _square, _mode )
    local dowalk = false;
    if self.type == "Window" or self.type == "WindowObject" then
        local dir = self.facing;
        if self.type == "Window" then
            local isNorth = self.facing and (self.facing == "N" or self.facing == "S") or false;
            dir = isNorth and "S" or "E";
        end
        local windowFrame = self:getWallForFacing( _square, dir, "WindowFrame" );
        dowalk = windowFrame and luautils.walkAdjWindowOrDoor( _character, _square, windowFrame, false);
    else
        dowalk = luautils.walkAdj( _character, _square, false );
    end

    if dowalk and _mode == "scrap" then
        local tool = self:hasScrapTool(_character, false)
        if tool == false or tool == nil then return false end
        if tool ~= true then
            ISWorldObjectContextMenu.equip(_character, _character:getPrimaryHandItem(), tool:getType(), true)
        end

        local tool2 = self:hasScrapTool(_character, true)
        if tool2 == false or tool2 == nil then 
            return false
        end

        if tool2 ~= true then
            if instanceof(tool2, "Clothing") then
                -- WeldingMask
                if not _character:isEquippedClothing(tool2) then
                    ISInventoryPaneContextMenu.wearItem(tool2, _character:getPlayerNum())
                end
            else
                ISWorldObjectContextMenu.equip(_character, _character:getSecondaryHandItem(), tool2:getType(), false)
            end
        end
        return true
    end

    if dowalk and _mode ~= "scrap" then
        local usesTool = (_mode == "pickup" and self.pickUpTool) or (_mode == "place" and self.placeTool);
        if not usesTool or self:isWhitelisted(_mode) then
            return true;
        end

        local tool = self:hasTool( _character, _mode );
        if tool then
            ISWorldObjectContextMenu.equip(_character, _character:getPrimaryHandItem(), tool:getType(), true);
            return true;
        end
    end
    return false;
end

function ISMoveableSpriteProps:canScrapObjectInternal(_result, _object)
    self.yOffsetCursor = _object and _object:getRenderYOffset() or 0;
    if not _result.containerFull then
        _result.containerFull = not self:objectNoContainerOrEmpty( self.object );
    end

    local canScrap = true
    if self.isTable then
        canScrap = not _object:getSquare():Is("IsTableTop") and _object == self:getTopTable(_object:getSquare());
    end

    if canScrap then
        if self:isFloorAtTopOfStairs(_object) then
            canScrap = false
        elseif self.isWaterCollector and _object and _object:hasWater() then
            canScrap = false
        elseif instanceof(_object, "IsoDoor") and _object:isBarricaded() then
            canScrap = false
        elseif instanceof(_object, "IsoThumpable") then
            if _object:isDoor() and _object:isBarricaded() or _object:isDoorFrame() and _object:getSquare():getDoor(_object:getNorth()) or _object:isWindow() and _object:getSquare():getWindow(_object:getNorth()) then
                canScrap = false
            end
        end
    end

    return canScrap;
end

function ISMoveableSpriteProps:scrapObjectInternal( _character, _scrapDef, _square, _object, _scrapResult, _chance, _perkName )
    local added = 0;
    local scrapResult, chance, perkName = _scrapResult, _chance, _perkName;
    local scrapDef = _scrapDef;
    local object = _object;
    local square = _square;
    if scrapDef and object and square then
        self.keyId = nil
        if instanceof(object, "IsoDoor") then
            self.keyId = object:checkKeyId()
        elseif instanceof(object, "IsoThumpable") then
            self.keyId = object:getKeyId()
        end

        -- Carpentry objects should return items from modData "need:", not MaterialN tile properties.
        -- i.e., Log Walls should give back sheets/rope/twine used to build it, not nails.
        if instanceof(object, "IsoThumpable") and object:hasModData() then
            scrapDef = copyTable(_scrapDef)
            scrapDef.returnItems = {}
            scrapDef.returnItemsStatic = {}
            for k,v in pairs(self.object:getModData()) do
                if luautils.stringStarts(k, "need:") then
                    local type = luautils.split(k, ":")[2]
                    local count = tonumber(v)
                    local item = { returnItem = type, maxAmount = count, chancePerRoll = 80 }
                    table.insert(scrapDef.returnItemsStatic, item)
                end
            end
--            self.scrapSize = nil
            self.material2 = nil
            self.material3 = nil
        end

        local deviceData = object.getDeviceData and object:getDeviceData();

        if object:isFloor() and (_square:getZ() == 0) then
            local floor = _square:getFloor();
            if floor then
                floor:setSpriteFromName("blends_natural_01_64");
                if isClient() then floor:transmitUpdatedSpriteToServer(); end
            end
        else
            if isClient() then square:transmitRemoveItemFromSquare(object) end
            square:RemoveTileObject(object);
            
            for i=1,object:getContainerCount() do
                local container = object:getContainerByIndex(i-1)
                for j=1,container:getItems():size() do
                    object:getSquare():AddWorldInventoryItem(container:getItems():get(j-1), 0.0, 0.0, 0.0)
                end
            end

            square:RecalcProperties();
            square:RecalcAllWithNeighbours(true);
        end

        if self.customItem then
            -- if the moveable object returns a custom item, check if the item can be dismantled
            -- if so, use the dismantle recipes/xp so they are similar.
            local recipe = RecipeManager.getDismantleRecipeFor(self.customItem);
            if recipe then
                local item = instanceItem(self.customItem);
                if item then
                    if deviceData and item.setDeviceData then
                        item:setDeviceData(deviceData);
                        --add item to inventory for the makeItem code for function:
                        _character:getInventory():AddItem(item);
                        RecipeManager.PerformMakeItem(recipe, item, _character, nil);
                        return 1;
                    end
                end
            end
        end

        local items = self:getScrapItemsList(_character);
        if scrapDef.addToInventory then
            added = self:addAllScrapItemsToInventory( _character, items );
        else
            added = self:addAllScrapItemsToSquare( _square, items );
        end

        self:scrapGiveXp(_character, scrapDef);
    end
    return added;
end