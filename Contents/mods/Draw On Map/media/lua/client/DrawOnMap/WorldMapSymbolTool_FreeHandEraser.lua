WorldMapSymbolTool_FreeHandEraser = ISWorldMapSymbolTool:derive("WorldMapSymbolTool_FreeHandEraser")

local soundCap = false;

function WorldMapSymbolTool_FreeHandEraser:activate()
end

function WorldMapSymbolTool_FreeHandEraser:deactivate()
end

function WorldMapSymbolTool_FreeHandEraser:onMouseDown(x, y)
	if self.rightDown then
		return false;
	end

	self.mouseHeld = true;
	return true;
end

function WorldMapSymbolTool_FreeHandEraser:onMouseUp(x, y)
	self.mouseHeld = false;
	return false
end

function WorldMapSymbolTool_FreeHandEraser:onMouseMove(dx, dy)
	if self.mouseHeld then
		local x = self.symbolsUI.mapUI:getMouseX()
		local y = self.symbolsUI.mapUI:getMouseY()
		soundCap = false;

		-- Check around the mouse to erase easier
		local spread = 5;
		self:eraseAnnotation(x, y)
		self:eraseAnnotation(x+spread, y)
		self:eraseAnnotation(x-spread, y)
		self:eraseAnnotation(x, y+spread)
		self:eraseAnnotation(x, y-spread)
		self:eraseAnnotation(x-spread, y-spread)
		self:eraseAnnotation(x+spread, y+spread)
		self:eraseAnnotation(x-spread, y+spread)
		self:eraseAnnotation(x+spread, y-spread)
	end
	return false
end

function WorldMapSymbolTool_FreeHandEraser:onRightMouseDown(x, y)
	self.rightDown = true;
	return true;
end

function WorldMapSymbolTool_FreeHandEraser:onRightMouseUp(x, y)
	self.rightDown = false;
	return true;
end

function WorldMapSymbolTool_FreeHandEraser:render()
	--self.symbolsUI:checkAnnotationForRemoveMouse()
	--self.symbolsUI:checkAnnotationForRemoveJoypad()
end

function WorldMapSymbolTool_FreeHandEraser:onJoypadDownInMap(button, joypadData)
	if button == Joypad.AButton then
	end
end

function WorldMapSymbolTool_FreeHandEraser:getJoypadAButtonText()
	if self.symbolsUI.mouseOverNote or self.symbolsUI.mouseOverSymbol then
		return getText("IGUI_Map_RemoveElement")
	end
	return nil
end

function WorldMapSymbolTool_FreeHandEraser:eraseAnnotation(x, y)
	local index = self.symbolsAPI:hitTest(x, y)
	if index ~= -1 then
		self.symbolsAPI:removeSymbolByIndex(index)
		if self.symbolsUI.character and not soundCap then
			soundCap = true
			self.symbolsUI.character:playSoundLocal("MapRemoveMarking")
		end
	end
end

function WorldMapSymbolTool_FreeHandEraser:new(symbolsUI)
	local o = ISWorldMapSymbolTool.new(self, symbolsUI)
	return o
end