local ChatBubble = {}
ChatBubble.lastSay = 0 --all of this will be unique to each client and we don't need to worry about saving
ChatBubble.imageNumber = 1
ChatBubble.doDelete = false

ChatBubble.say = function(specificPlayer)
	local calendarInstance = Calendar.getInstance()
	
	if (calendarInstance:getTimeInMillis() - ChatBubble.lastSay > 5000) then --overhead messages fade after 5 seconds
		local bubbleTexture = "media/textures/bubble" .. ChatBubble.imageNumber .. ".png"
		
		processSayMessage("Typing..") --Regular 'Say' function doesn't show for other players in MP
		
		if (ChatBubble.imageNumber >= 3) then --cycle through images - 1, 2, 3, 1, 2, 3, etc
			ChatBubble.imageNumber = 1
		else
			ChatBubble.imageNumber = ChatBubble.imageNumber + 1
		end
		
		ChatBubble.lastSay = calendarInstance:getTimeInMillis() --set lastSay so we cna wait 5000 milliseconds before showing the chat bubble
	end
end

ChatBubble.onAddMessage = function(message, tabId)
	local specificPlayer = getSpecificPlayer(0)
	if (specificPlayer == nil) then
		return
	end
	
	local messageText = message:getText()
	
	if (messageText == "Typing..") then --quicker to do 3 exact string matches than use string.find
		ChatBubble.doDelete = true
	elseif (messageText == "Typing..") then
		ChatBubble.doDelete = true --set doDelete to true if we find an image so we can remove it (almost) instantly in OnPlayerUpdate
	elseif (messageText == "Typing..") then
		ChatBubble.doDelete = true
	elseif (ChatBubble.doDelete) then
		ChatBubble.doDelete = false
	end
end
Events.OnAddMessage.Add(ChatBubble.onAddMessage)

ChatBubble.deleteMessage = function()
	local chatTextInstance = ISChat.instance.chatText
	if (chatTextInstance == nil) then
		return
	end
	
	local chatTextInstanceLines = chatTextInstance.chatTextLines
	local scrolledToBottom = (chatTextInstance:getScrollHeight() <= chatTextInstance:getHeight()) or (chatTextInstance.vscroll and chatTextInstance.vscroll.pos == 1) --check scroll before removing lines
	local newText = ""
	local searchText = "Typing.." --use this string to find/remove from chat
	chatTextInstance.text = ""
	
	for i, v in ipairs(chatTextInstanceLines) do --loop once to remove img lines
		if (string.find(v, searchText)) then --it is quicker to do string.find here as the chatTextLines (v) are not plain strings, it would be more expensive to calculate the exact string
			table.remove(chatTextInstanceLines, i)
		end
	end
	
	for i, v in ipairs(chatTextInstanceLines) do --loop once to display correct lines/line breaks
		if i == #chatTextInstanceLines then
			v = string.gsub(v, " <LINE> $", "") --remove <LINE> (line break) if at last line
		end
		
		newText = newText .. v
	end
	
	chatTextInstance.text = newText
	chatTextInstance:paginate()
	
	if scrolledToBottom then
		chatTextInstance:setYScroll(-10000) --vanilla code
	end
	
	ChatBubble.doDelete = false
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
	elseif (ChatBubble.imageNumber ~= 1) then
		ChatBubble.imageNumber = 1 --set imageNumber back to 1 if chat window loses focus
	end
	
	if (ChatBubble.doDelete) then
		ChatBubble.deleteMessage()
	end
end
Events.OnPlayerUpdate.Add(ChatBubble.checkChatting)
