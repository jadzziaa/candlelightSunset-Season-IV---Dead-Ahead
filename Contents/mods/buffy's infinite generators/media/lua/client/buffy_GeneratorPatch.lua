
-- ** 
-- ** Simple Infinite Generators
-- ** Mod Author: github.com/buffyuwu
-- ** If you are using this work, please don't remove credit. Doing so fragments the modding community and makes it harder for newbies to learn.
-- ** 
function ISTakeGenerator:isValid()
	if self.generator:getFuel() > 100 and isClient() and not isAdmin() then
		print("disallowing nonadmin to pick up infinite generator"); 
		getPlayer():addLineChatElement("Only Admins may take infinite generators.", 1, 0, 0);
		return false;
	end
	return self.generator:getObjectIndex() ~= -1 and
		not self.generator:isConnected()
end
local function ReplaceExistingObject(object, fuel, condition)
	local cell = getWorld():getCell()
	local square = object:getSquare()

	local item = InventoryItemFactory.CreateItem("Base.Generator")
	if item == nil then
		return
	end
	item:setCondition(condition)
	item:getModData().fuel = fuel
	item:getModData()['_isFuelInfinite'] = true; --if you want to display the infinite status somewhere, check for this
	square:transmitRemoveItemFromSquare(object)
	local javaObject = IsoGenerator.new(item, cell, square)
	javaObject:transmitCompleteItemToClients()
end
Events.OnFillWorldObjectContextMenu.Add(function(player, context, worldObjects, test)
	
	for _,obj in ipairs(worldObjects) do --filter for what we find when we right click
		if not isAdmin() and isClient() then return; end
		local function _toggleInfiniteFuel()
			ReplaceExistingObject(obj, 99999999, 99999999)
			getPlayer():addLineChatElement("Generator Now Has Infinite Fuel and Condition", 1, 0, 0);
		end
		local objTextureName = obj:getTextureName() or ""
        if not objTextureName then return end
        if luautils.stringStarts(objTextureName, "appliances_misc_01_0") then
            context:addOption("[Admin] Set Infinite Fuel", obj, _toggleInfiniteFuel)
			getPlayer():addLineChatElement("fuel: "..tostring(obj:getFuel()), 1, 0, 0);
            return
        end
    end
  
  end)
