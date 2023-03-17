require "BuildingObjects/ISUI/ISInventoryBuildMenu"

local function predicateTakeDirt(item)
	return not item:isBroken() and item:hasTag("TakeDirt")
end

doMakePathMenu = function(player, context, worldobjects, test)

	if test and ISWorldObjectContextMenu.Test then return true end

    local shovel = nil;

	local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory();

    shovel = playerInv:getFirstEvalRecurse(predicateTakeDirt)

    if shovel then
		local squares = {}
        for j=#worldobjects,1,-1 do
			local v = worldobjects[j]
			if v:getSquare() then
				local dup = false
				for i=1,#squares do
					if squares[i] == v:getSquare() then dup = true; break end
				end
				if not dup then table.insert(squares, v:getSquare()) end
			end
		end

		for i=1,#squares do
			local groundType,object = ISMakePathCursor.GetDirtGravelSand(squares[i])
			if groundType == "dirt" or groundType == "gravel" or groundType == "sand" then
					fillWithDirt = object
			end
        end
    end

    if fillWithDirt then
		if test then return ISWorldObjectContextMenu.setTest() end
		local option = context:addOption(getText("ContextMenu_MakePath"), playerObj, onMakePath, groundType);
    end
end

onMakePath = function(playerObj, groundType)
	local bo = ISMakePathCursor:new("floors_exterior_natural_01_13", "floors_exterior_natural_01_13", playerObj, groundType)
	getCell():setDrag(bo, playerObj:getPlayerNum());
end

Events.OnFillWorldObjectContextMenu.Add(doMakePathMenu);
