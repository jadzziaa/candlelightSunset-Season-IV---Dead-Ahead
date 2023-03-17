require "ISUI/Maps/ISWorldMapSymbols"
require "DrawOnMap/WorldMapSymbolTool_SplineTool"

ISWorldMapSymbols.initTools_prepatch_drawonmap = ISWorldMapSymbols.initTools;

ISWorldMapSymbols.initTools = function(self)
	self:initTools_prepatch_drawonmap();
	self.tools.SplineTool = WorldMapSymbolTool_SplineTool:new(self);
	self.tools.FreeHandEraseTool = WorldMapSymbolTool_FreeHandEraser:new(self);
end


ISWorldMapSymbols.onButtonClick_prepatch_drawonmap = ISWorldMapSymbols.onButtonClick;

ISWorldMapSymbols.onButtonClick = function(self, button)
	local originalTool = self.currentTool;
	
	self:onButtonClick_prepatch_drawonmap(button)

	 -- Allow symbol selection with the free hand tool selected
	if button.symbol and originalTool == self.tools.SplineTool then
		local symbol = self.selectedSymbol;
		self:setCurrentTool(self.tools.SplineTool);
		self.selectedSymbol = symbol;
	end
end
