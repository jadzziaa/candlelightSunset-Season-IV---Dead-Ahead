-------------------------------- Code by Tread ----- (Trealak on Steam) -------------------------------
---------------------------------- Developed For Tread's Paint Signs ----------------------------------

local PaintColor = {
	PaintBlack 		= {r=0.20,g=0.20,b=0.20};
	PaintBlue  		= {r=0.35,g=0.35,b=0.80};
	PaintBrown 		= {r=0.45,g=0.23,b=0.11};
	PaintCyan  		= {r=0.50,g=0.80,b=0.80};
	PaintGreen 		= {r=0.41,g=0.80,b=0.41};
	PaintGrey  		= {r=0.50,g=0.50,b=0.50};
	PaintLightBlue  = {r=0.55,g=0.55,b=0.87};
	PaintLightBrown = {r=0.59,g=0.44,b=0.21};
	PaintOrange		= {r=0.79,g=0.44,b=0.19};
	PaintPink  		= {r=0.81,g=0.60,b=0.60};
	PaintPurple		= {r=0.61,g=0.40,b=0.63};
	PaintRed   		= {r=0.63,g=0.10,b=0.10};
	PaintTurquoise  = {r=0.49,g=0.70,b=0.80};
	PaintWhite 		= {r=0.92,g=0.92,b=0.92};
	PaintYellow 	= {r=0.84,g=0.78,b=0.30};


}

local ISPaintCursor_render = ISPaintCursor.render
function ISPaintCursor:render(x, y, z, square)
	
	if self.action ~= "paintSign" or  self.args.sign < 400 then --- I decided ta call custom signs with >=400
		ISPaintCursor_render(self, x, y, z, square);
	else
		--------------- My version for custom signs - Tread -----------------
		if not self.floorSprite then
		self.floorSprite = IsoSprite.new()
		self.floorSprite:LoadFramesNoDirPageSimple('media/ui/FloorTileCursor.png')
		end

		if not self:isValid(square) then
			self.floorSprite:RenderGhostTileRed(x, y, z)
			return
		end
		self.floorSprite:RenderGhostTileColor(x, y, z, 0, 1, 0, 0.8)

		if self.currentSquare ~= square then
			self.objectIndex = 1
			self.currentSquare = square
		end

		self.renderX = x
		self.renderY = y
		self.renderZ = z

		local objects = self:getObjectList()
		if self.objectIndex >= 1 and self.objectIndex <= #objects then
			local object = objects[self.objectIndex]
			local color = {r=0.8, g=0.8, b=0.8}
			color = PaintColor[self.args.paintType]
			if not color then color = {r=1,g=0,b=0} end
	--		if not self.signSprite then
				local sign = self.args.sign
				if object:getProperties():Is("WallW") then
					sign = sign + 8;
				end
				self.signSprite = IsoSprite.new()
				if sign >= 400 and sign < 500 then --- assign custom sign nr the custom tilesheet
					sign = sign - 400;	--- translate custom sign nr into proper tile nr
					self.signSprite:LoadFramesNoDirPageSimple("treads_paintsymbols_01_" .. sign)
				elseif sign >= 500 and sign < 600 then --- assign custom sign nr the custom tilesheet
					sign = sign - 500;	--- translate custom sign nr into proper tile nr
					self.signSprite:LoadFramesNoDirPageSimple("treads_paintsymbols_02_" .. sign)
				elseif sign >= 600 and sign < 700 then --- assign custom sign nr the custom tilesheet
					sign = sign - 600;	--- translate custom sign nr into proper tile nr
					self.signSprite:LoadFramesNoDirPageSimple("treads_paintletters_01_" .. sign)
				elseif sign >= 700 and sign < 800 then --- assign custom sign nr the custom tilesheet
					sign = sign - 700;	--- translate custom sign nr into proper tile nr
					self.signSprite:LoadFramesNoDirPageSimple("treads_paintletters_02_" .. sign)
				end
	--		end
			self.signSprite:RenderGhostTileColor(x, y, z, color.r, color.g, color.b, 1.0)

		end
	end	
end


