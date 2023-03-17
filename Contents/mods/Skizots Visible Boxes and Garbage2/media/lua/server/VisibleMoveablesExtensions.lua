if isServer() then return; end

require "BuildingObjects/ISMoveableCursor"
require "Moveables/ISMoveableSpriteProps"

local function predicateBlowTorch(item)
    return item:getType() == "BlowTorch" and item:getDrainableUsesInt() >= 1
end

VisibleMoveables = {}

local spriteToReplacement = { }
local replacementToPlaced = { }
local pickupToReplacement = { }
local blockCrouch = { }
local blockCrouchActive = false;
local dropOnPushList = { }

local function BlockCrouchOnTick()
	--print("Block On Tick");
	getPlayer():setSneaking(false)
end

-- Function called elsewhere to add conversion entries
function VisibleMoveables.AddConversion(spriteName, placedItemFullType, pickedUpFullType, replacementFullType, forceNoCrouch, dropOnPush)
	spriteToReplacement[spriteName] = replacementFullType;
	replacementToPlaced[replacementFullType] = placedItemFullType;
	pickupToReplacement[pickedUpFullType] = replacementFullType;
	blockCrouch[replacementFullType] = forceNoCrouch;
	dropOnPushList[replacementFullType] = dropOnPush;
end

-- This function handles swapping the replacement item back into the normal moveable item
-- Takes a given sprite name and finds the appropriate replacement item
-- Then creates the matching original moveable and removing the replacement item
local originalPlaceMoveable = ISMoveableSpriteProps.placeMoveable;
function ISMoveableSpriteProps.placeMoveable(self, _character, _square, _origSpriteName )
	if getDebug() then print("Placing item of type " .. _origSpriteName); end
	local visibleItemType = spriteToReplacement[_origSpriteName];
	if visibleItemType then
		local visibleItem = _character:getInventory():getFirstType(visibleItemType);
		if visibleItem then
			if getDebug() then print("Need item of type " .. visibleItem:getFullType()); end
			local moveableItemType = replacementToPlaced[visibleItem:getFullType()];
			if moveableItemType then
				local newItem = InventoryItemFactory.CreateItem(moveableItemType);
				if newItem then
                    _character:getInventory():AddItem(newItem)
                    local result = originalPlaceMoveable(self, _character, _square, _origSpriteName)
                    if instanceof(visibleItem, "InventoryContainer") then
                        local visible_item_items = visibleItem:getInventory():getItems();
                        local objects = _square:getObjects()
                        for obj_id = 0, objects:size() - 1 do
                            local obj = objects:get(obj_id)
                            local sprite = obj:getSprite()
                            if sprite and sprite:getName() == _origSpriteName then
                                local obj_container = obj:getContainer()
                                for item_id = visible_item_items:size() - 1, 0, -1 do
                                    local item = visible_item_items:get(item_id)
                                    obj_container:AddItem(item)
                                end
                                break
                            end
                        end
                    end
                    if visibleItem == _character:getSecondaryHandItem() then
                        _character:setSecondaryHandItem(nil);
                    end
                    if visibleItem == _character:getPrimaryHandItem() then
                        _character:setPrimaryHandItem(nil);
                    end
                    _character:getInventory():Remove(visibleItem);
					if blockCrouchActive then
						--print("Unblocking Crouch Place");
						Events.OnTick.Remove(BlockCrouchOnTick)
						blockCrouchActive = false;
					end
                    return result;
				end
			end
		end
	end
	return originalPlaceMoveable(self, _character, _square, _origSpriteName);
end

-- This funciton finds all the replacement types in the player's inventory and adds
-- the sprite name to the returning list
-- The returning list is used to show the sprite in the placement cursor and is also
-- the sprite name fed into the placement action
local originalInvFunction = ISMoveableCursor.getInventoryObjectList;
function ISMoveableCursor.getInventoryObjectList(self)	
    local objects           = originalInvFunction(self);
    local spriteBuffer	= {};
    local items 			= self.character:getInventory():getItems();
    local items_size 		= items:size();
    for i=0,items_size-1, 1 do
        local item = items:get(i);
		if getDebug() then print("Checking conversion lists for item of type " .. item:getFullType()); end
		local placeableItemType = replacementToPlaced[item:getFullType()];
		if placeableItemType then
			local placeableItem = InventoryItemFactory.CreateItem(placeableItemType);
			if placeableItem then
				if instanceof(placeableItem, "Moveable") then
					if self.character:getPrimaryHandItem() ~= placeableItem and self.character:getSecondaryHandItem() ~= placeableItem then
						local moveProps = ISMoveableSpriteProps.new( placeableItem:getWorldSprite() );
						if moveProps.isMoveable then
							local ignoreMulti = false
							if moveProps.isMultiSprite then
								local anchorSprite = moveProps.sprite:getSpriteGrid():getAnchorSprite()
								if spriteBuffer[anchorSprite] then
									ignoreMulti = true
								else
									spriteBuffer[anchorSprite] = true
									if moveProps.sprite ~= anchorSprite then
										moveProps = ISMoveableSpriteProps.new(anchorSprite)
									end
								end
							end
							if not ignoreMulti then
								table.insert(objects, { object = placeableItem, moveProps = moveProps, sourceObject = item });
								if self.cacheInvObjectSprite and self.cacheInvObjectSprite == placeableItem:getWorldSprite() then
									self.objectIndex = #objects;
								end
							end
						end
					end
				end
			end
		end
    end

    if self.tryInitialInvItem then		
		local placeableItemType = replacementToPlaced[self.tryInitialInvItem:getFullType()];
		if placeableItemType then
			local placeableItem = InventoryItemFactory.CreateItem(placeableItemType);
			if placeableItem then
				if instanceof(placeableItem, "Moveable") then
					local moveProps = ISMoveableSpriteProps.new(placeableItem:getWorldSprite());
					local sprite = moveProps.sprite;
					if moveProps.isMultiSprite then
						local spriteGrid = moveProps.sprite:getSpriteGrid();
						sprite = spriteGrid:getAnchorSprite();
					end
					local spriteName = sprite:getName();
					for index,table in ipairs(objects) do
						if table.moveProps.sprite == sprite then
							self.objectIndex = index;
							self.cacheInvObjectSprite = spriteName;
							break;
						end
					end
				else
					print("MovablesCursor Initial Item is not a Movable item");
					print(self.tryInitialInvItem);
				end
				self.tryInitialInvItem = nil;
			end
		end
    end

    return objects;
end

-- This function handles converting the normal picked up item into the replacement item type
local originalPickupFunction = ISMoveableSpriteProps.pickUpMoveableInternal;
function ISMoveableSpriteProps.pickUpMoveableInternal(self,  _character, _square, _object, _sprInstance, _spriteName, _createItem, _rotating  )
    local item = originalPickupFunction(self, _character, _square, _object, _sprInstance, _spriteName, _createItem, _rotating );
    
    if item and _createItem then
        if getDebug() then print("Received item of type " .. item:getFullType()); end
        local swapItemType = pickupToReplacement[item:getFullType()];
        if swapItemType then    
            local newItem     = InventoryItemFactory.CreateItem(swapItemType);
            if newItem then
                _character:getInventory():AddItem(newItem);
                if newItem:isRequiresEquippedBothHands() then
                    _character:setSecondaryHandItem(newItem);
                end
                _character:setPrimaryHandItem(newItem);
                _character:getInventory():Remove(item);
				if blockCrouch[swapItemType] then
					--print("Blocking Crouch Pickup");
					_character:setSneaking(false)
					blockCrouchActive = true;
					Events.OnTick.Add(BlockCrouchOnTick)
				elseif blockCrouchActive then
					blockCrouchActive = false;
				end
            else
                return item;
            end
        else
            return item;
        end
    else
        return item;
    end
end

-- Cancels equipping tools for pickup and placement
local originalWalkToAndEquip = ISMoveableSpriteProps.walkToAndEquip;
function ISMoveableSpriteProps.walkToAndEquip(self, _character, _square, _mode )
	if spriteToReplacement[self.spriteName] then
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
				if tool:getType() == "BlowTorch" then
					ISWorldObjectContextMenu.equip(_character, _character:getPrimaryHandItem(), predicateBlowTorch, true)
				else
					ISWorldObjectContextMenu.equip(_character, _character:getPrimaryHandItem(), tool:getType(), true)
				end
			end
			local tool2 = self:hasScrapTool(_character, true)
			if tool2 == false or tool2 == nil then return false end
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
			if not usesTool then
				return true;
			else
				local tool = self:hasTool( _character, _mode );

				if tool then
					--ISWorldObjectContextMenu.equip(_character, _character:getPrimaryHandItem(), tool:getType(), true);
					return true;
				end
			end
		end
		return false;
	else
		return originalWalkToAndEquip(self, _character, _square, _mode );
	end
end

local originalEquipHeavyItem = ISEquipHeavyItem.perform
function ISEquipHeavyItem.perform(self)
	if blockCrouch[self.item:getFullType()] then
		--print("Blocking Crouch Equip Heavy");
		self.character:setSneaking(false)
		blockCrouchActive = true;
		Events.OnTick.Add(BlockCrouchOnTick)
	elseif blockCrouchActive then
		--print("Unblocking Crouch Equip Heavy");
		Events.OnTick.Remove(BlockCrouchOnTick)
		blockCrouchActive = false;
	end
	originalEquipHeavyItem(self);
end

local origianlEquipWeapon = ISEquipWeaponAction.perform
function ISEquipWeaponAction.perform(self)
	if blockCrouch[self.item:getFullType()] then
		--print("Blocking Crouch Equip Weapon");
		self.character:setSneaking(false)
		blockCrouchActive = true;
		Events.OnTick.Add(BlockCrouchOnTick)
	elseif blockCrouchActive then
		print("Unblocking Crouch Equip Weapon");
		Events.OnTick.Remove(BlockCrouchOnTick)
		blockCrouchActive = false;
	end
	origianlEquipWeapon(self);
end

local originalUnequipAction = ISUnequipAction.perform
function ISUnequipAction:perform()
	if blockCrouchActive then
		--print("Unblocking Crouch Unequip");
		Events.OnTick.Remove(BlockCrouchOnTick)
		blockCrouchActive = false;
	end
	originalUnequipAction(self);
end

local function DropOnSwing(character, handWeapon)
	local heldItem = character:getPrimaryHandItem();
	if heldItem and dropOnPushList[heldItem:getFullType()] then
		local square = character:getCurrentSquare()
		local dropX,dropY,dropZ = ISInventoryTransferAction.GetDropItemOffset(character, square, heldItem)
		character:getCurrentSquare():AddWorldInventoryItem(heldItem, dropX, dropY, dropZ);
		character:setSecondaryHandItem(nil);
		character:setPrimaryHandItem(nil);
		character:getInventory():Remove(heldItem);
		ISInventoryPage.renderDirty = true
	end
end
Events.OnWeaponSwing.Add(DropOnSwing)