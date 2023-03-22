--Patched version of nater's Chat Bubble v0.6. Removes the 'go back and delete the typing messages from chat log' portion, handling in patch to buffy's roleplay chat by filtering those messages when received.
local ChatBubble = {}
ChatBubble.lastSay = 0 --all of this will be unique to each client and we don't need to worry about saving
ChatBubble.imageNumber = 1
ChatBubble.doDelete = false

ChatBubble.say = function(specificPlayer)
	local calendarInstance = Calendar.getInstance()
	
	if (calendarInstance:getTimeInMillis() - ChatBubble.lastSay > 5000) then --overhead messages fade after 5 seconds
		processSayMessage("Typing...") --Regular 'Say' function doesn't show for other players in MP
		ChatBubble.lastSay = calendarInstance:getTimeInMillis() --set lastSay so we cna wait 5000 milliseconds before showing the chat bubble
	end
end

ChatBubble.checkChatting = function(specificPlayer)
	if (getWorld():getGameMode() ~= "Multiplayer") then
		Events.OnPlayerUpdate.Remove(ChatBubble.checkChatting)  --remove function if this is being ran in single player for some reason
		return
	end
	
	local chatInstance = ISChat.instance
	local textEntryTextLength = chatInstance.textEntry:getText():len()
	
	if (ISChat.focused and textEntryTextLength > 0) then --Window gains focus when clicking the 'lock/unlock' button so we need to check text length too
		if (chatInstance.currentTabID == 2) then
			return --don't show if on 'Admin' tab
		end
		
		ChatBubble.say(specificPlayer)
	end

end
Events.OnPlayerUpdate.Add(ChatBubble.checkChatting)
