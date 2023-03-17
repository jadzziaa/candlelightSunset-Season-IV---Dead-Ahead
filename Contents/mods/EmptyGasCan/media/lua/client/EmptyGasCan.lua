EGC = {};

----
---- ACTION: Empty PetrolCan content(fuel)
----
function EGC.actionEmptyGasCan(playerObj, item)
	ISInventoryPaneContextMenu.equipWeapon(item, true, false, playerObj:getPlayerNum())
	ISTimedActionQueue.add(EmptyGasCanActionAnim:new(playerObj, item, 50))
end

----
---- ADD CONTEXT MENU to PetrolCan/EmptyPetrolCan items
----
function EGC.AddContextMenuEmptyGasCan(player, context, items)
	local playerObj = getSpecificPlayer(player)
	items = ISInventoryPane.getActualItems(items)
	for _, item in ipairs(items) do
		if instanceof(item, "InventoryItem") then
			local pourOnGround = false
			if item:getType() == 'PetrolCan' then
				pourOnGround = true
			-- Adding the mechanism for the cans of "Tread's Fuel Types Framework" mod (2765042813)
			elseif item:getType() == 'LargePetrolCanFullwDiesel' or
				   item:getType() == 'PetrolCanFullwDiesel' or
				   item:getType() == 'DieselCanFull' or
				   item:getType() == 'LargeDieselCanFull' or
				   item:getType() == 'LargeDieselCanFullwPetrol' or
				   item:getType() == 'DieselCanFullwPetrol' then
				pourOnGround = true
			end

			if (pourOnGround) then
				--Add context menu
				local option = nil
				option = context:addOption(getText("ContextMenu_Pour_on_Ground"), playerObj, EGC.actionEmptyGasCan, item)
				-- Hide multiple context menu
				local displayedContextOption = true
				if displayedContextOption then
					return
				end
			end
		end
	end
end

Events.OnFillInventoryObjectContextMenu.Add(EGC.AddContextMenuEmptyGasCan)