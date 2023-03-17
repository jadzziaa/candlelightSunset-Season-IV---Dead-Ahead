-------------------------------- Code by Tread ----- (Trealak on Steam) -------------------------------
---------------------------------- Developed For Tread's Paint Signs ----------------------------------

local ISPaintSignAction_perform = ISPaintSignAction.perform
function ISPaintSignAction:perform()
	if self.sign < 400 then --- I decided ta call custom signs with >=400
		ISPaintSignAction_perform(self);
	else
		if self.sound then self.character:stopOrTriggerSound(self.sound) end
		if self.wall:getProperties():Is("WallW") then
			self.sign = self.sign + 8;
		end
		
		if self.sign >= 400 and self.sign < 500 then --- assign custom sign nr the custom tilesheet
			self.sign = self.sign - 400;	--- translate custom sign nr into proper tile nr
			self.wall:setOverlaySprite("treads_paintsymbols_01_" .. self.sign, self.r,self.g,self.b,1);
		elseif self.sign >= 500 and self.sign < 600 then --- assign custom sign nr the custom tilesheet
			self.sign = self.sign - 500;	--- translate custom sign nr into proper tile nr
			self.wall:setOverlaySprite("treads_paintsymbols_02_" .. self.sign, self.r,self.g,self.b,1);
		elseif self.sign >= 600 and self.sign < 700 then --- assign custom sign nr the custom tilesheet
			self.sign = self.sign - 600;	--- translate custom sign nr into proper tile nr
			self.wall:setOverlaySprite("treads_paintletters_01_" .. self.sign, self.r,self.g,self.b,1);
		elseif self.sign >= 700 and self.sign < 800 then --- assign custom sign nr the custom tilesheet
			self.sign = self.sign - 700;	--- translate custom sign nr into proper tile nr
			self.wall:setOverlaySprite("treads_paintletters_02_" .. self.sign, self.r,self.g,self.b,1);
		end
		
		
		if not ISBuildMenu.cheat then
			self.paintPot:Use();
		end
		-- needed to remove from queue / start next.
		ISBaseTimedAction.perform(self);
	end
end

