ISMakeUpUI.originalOnApplyMakeUp = ISMakeUpUI.onApplyMakeUp;
function ISMakeUpUI:onApplyMakeUp()
	local uses = 0;
	if self.item and self.item:getFullType() == "ElliesTattooParlor.FilledTattooNeedle" then
		uses = self.item:getRemainingUses()
    self.item:Use()
  end

  local ret = self:originalOnApplyMakeUp()

	if uses == 1 then
		self:close();
		return ret;
	end
end

ISMakeUpUI.originalDisplayBodyPart = ISMakeUpUI.displayBodyPart;
function ISMakeUpUI:displayBodyPart(cat)
	if not cat then
		self.avatarPanel:setDirection(IsoDirections.S)
	else
		if cat.avatarDirection then
			self.avatarPanel:setDirection(cat.avatarDirection)
		else
			self.avatarPanel:setDirection(IsoDirections.S)
		end
	end
	return self:originalDisplayBodyPart(cat)
end

ISMakeUpUI.originalOnRemoveMakeUp = ISMakeUpUI.onRemoveMakeUp;
function ISMakeUpUI:onRemoveMakeUp()
	local ret = self:originalOnRemoveMakeUp();
	if self.item and self.item:getFullType() == "ElliesTattooParlor.AcidBrush" then
		if self.item:getRemainingUses() == 1 then
			self.item:Use();
			self:close();
		else
			self.item:Use();
		end
	end
	return ret;
end

ISMakeUpUI.originalInitRemoveMakeUpCombo = ISMakeUpUI.initRemoveMakeUpCombo;
function ISMakeUpUI:initRemoveMakeUpCombo()
	self.removeMakeupCombo:clear();
	self.removeMakeupCombo.selected = 1;
	self.removeMakeupCombo.disabled = true;
	self.removeMakeupCombo:addOptionWithData(getText("IGUI_SelectMakeUp"), nil);

	local ret = nil;
	if self.item and self.item:getFullType() == "ElliesTattooParlor.AcidBrush" then
		self.remove.enable = false;
		self.location.disabled = true;
		for i=0, self.character:getWornItems():size()-1 do
			local item = self.character:getWornItems():get(i):getItem();
			if luautils.stringEnds(item:getBodyLocation(),"_Tattoo") then
				-- we found tattoo, take the corresponding definition
				for _,makeup in ipairs(MakeUpDefinitions.makeup) do
					if makeup.item == item:getFullType() then
						local name = getText("MakeUpType_" .. makeup.name);
						self.removeMakeupCombo:addOptionWithData(name, {item=item, makeup=makeup});
						break;
					end
				end
			end
		end
	elseif self.item and self.item:getFullType() == "ElliesTattooParlor.FilledTattooNeedle" then
		self.removeMakeupCombo.disabled = true;
	else
		ret = self:originalInitRemoveMakeUpCombo();
	end
	if #self.removeMakeupCombo.options > 1 then
		self.removeMakeupCombo.disabled = false;
	end
	return ret;
end
