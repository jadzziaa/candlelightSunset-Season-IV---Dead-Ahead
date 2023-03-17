--media\lua\ISUI\client\ISWorldObjectContextMenu

ISWorldObjectContextMenu.onClearAshes = function(worldobjects, player, ashes)
    local playerObj = getSpecificPlayer(player)
	local bo = CleanAshesCursor:new("", "", playerObj)
	getCell():setDrag(bo, playerObj:getPlayerNum())
end
