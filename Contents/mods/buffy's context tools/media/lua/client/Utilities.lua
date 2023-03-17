--***********************************************************
--**                    NECROPOLISRP.NET                   **
--**				  Author: github.com/buffyuwu		   **
--**                  Advanced context menu tools          **
--***********************************************************
require "ISUI/ISPanel"
local NecropolisUtilities = {};

NecropolisUtilities.knockMenu = function(player, context, worldobjects, test, items)
	local playerObj = getSpecificPlayer(player)
	for _,obj in ipairs(worldobjects) do --filter for what we find when we right click
		local dx = obj:getSquare():getX() - playerObj:getSquare():getX()
		local dy = obj:getSquare():getY() - playerObj:getSquare():getY()
		local zGood = math.abs(obj:getSquare():getZ() - playerObj:getSquare():getZ()) < 2
		local dist = math.sqrt(dx*dx + dy*dy)
		if instanceof(obj, "IsoThumpable") and obj:isDoor() then --since most constructed objects are thumpable aka zombies can bump into them, we want to only let people knock on doors. not random walls or sandbags or whatever
			if not zGood or dist > 2 then
				return
			else
				context:addOption("Knock", worldobjects, NecropolisUtilities.knockdoor, player);
			end
			return
		elseif instanceof(obj, "IsoDoor") then
			if not zGood or dist > 2 then
				return
			else
				context:addOption("Knock", worldobjects, NecropolisUtilities.knockdoor, player);
			end
			return
		elseif instanceof(obj, "IsoWindow") then
			if not zGood or dist > 2 then
				return
			else
				context:addOption("Knock", worldobjects, NecropolisUtilities.knockdoor, player);
			end
			return
		end
	end
end
-- i had to repeat the dx dy check above because with it in one place, 
-- it would allow users to knock from 500ft away because the location didnt update anywhere but in a filter within the for loop



NecropolisUtilities.knockdoor = function(playerObj, worldobject, obj, door)
	local range = 10
	local sound = {"Knocking","KnockingLow"}
	getPlayer():getSquare():playSound(sound[ZombRand(1,3)])
	addSound(getPlayer(), getPlayer():getX(),getPlayer():getY(),getPlayer():getZ(), range, 1)
end



--depreciated
-- pulled from the default debug mode map teleporting
-- function ISWorldMap:onRightMouseUp(x, y)
-- 	if self.symbolsUI:onRightMouseUpMap(x, y) then
-- 		return true
-- 	end
-- 	if getAccessLevel() == "" then
-- 		return false
-- 	end
-- 	local playerNum = 0
-- 	local playerObj = getSpecificPlayer(0)
-- 	if not playerObj then return end -- Debug in main menu
-- 	local context = ISContextMenu.get(playerNum, x + self:getAbsoluteX(), y + self:getAbsoluteY())

-- 	local option = context:addOption("Show Cell Grid", self, function(self) self:setShowCellGrid(not self.showCellGrid) end)
-- 	context:setOptionChecked(option, self.showCellGrid)

-- 	option = context:addOption("Show Tile Grid", self, function(self) self:setShowTileGrid(not self.showTileGrid) end)
-- 	context:setOptionChecked(option, self.showTileGrid)

-- 	self.hideUnvisitedAreas = self.mapAPI:getBoolean("HideUnvisited")
-- 	option = context:addOption("Hide Unvisited Areas", self, function(self) self:setHideUnvisitedAreas(not self.hideUnvisitedAreas) end)
-- 	context:setOptionChecked(option, self.hideUnvisitedAreas)

-- 	option = context:addOption("Isometric", self, function(self) self:setIsometric(not self.isometric) end)
-- 	context:setOptionChecked(option, self.isometric)

-- 	-- DEV: Apply the style again after reloading ISMapDefinitions.lua
-- 	option = context:addOption("Reapply Style", self,
-- 		function(self)
-- 			MapUtils.initDefaultStyleV1(self)
-- 			MapUtils.overlayPaper(self)
-- 		end)

-- 	local worldX = self.mapAPI:uiToWorldX(x, y)
-- 	local worldY = self.mapAPI:uiToWorldY(x, y)
-- 	if getWorld():getMetaGrid():isValidChunk(worldX / 10, worldY / 10) then
-- 		option = context:addOption("Teleport Here", self, self.onTeleport, worldX, worldY)
-- 	end

-- 	return true
-- end

Events.OnFillWorldObjectContextMenu.Add(NecropolisUtilities.knockMenu);
