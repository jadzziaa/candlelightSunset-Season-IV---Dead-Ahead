
ISObjectClickHandler = ISObjectClickHandler or {}

ISObjectClickHandler.doClickWindow = function(object, playerNum, playerObj)

	if isKeyDown(Keyboard.KEY_LSHIFT) then
		local curtain = object:HasCurtains()
		if curtain and curtain:canInteractWith(playerObj) then
		curtain:ToggleDoor(playerObj)
		end
		return true
	end

	if object:isInvincible() then return true end

	--If the window is broken, with glass in the frame, and the player has something equipped - walk up to the window and remove the glass
	if object:isDestroyed() then
		if not object:isGlassRemoved() and playerObj:getPrimaryHandItem() then
			if luautils.walkAdjWindowOrDoor(playerObj, object:getSquare(), object) then
				ISTimedActionQueue.add(ISRemoveBrokenGlass:new(playerObj, object, 100));
			end
		end
		return true
	end
	
	local playerSq = playerObj:getCurrentSquare()
	if (playerSq ~= object:getSquare()) and (playerSq ~= object:getOppositeSquare()) then return true end
	if object:getBarricadeForCharacter(playerObj) then return true end

	if object:IsOpen() then
		playerObj:closeWindow(object)
	else
		playerObj:openWindow(object)
	end
	return true
end
