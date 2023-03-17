----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
-- eris_uiBattery
--
--
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

local versionNumber = 1.4;

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------versionCheck

if eris_uiBattery then
	if eris_uiBattery.versionNumber >= versionNumber then
		return;
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

eris_uiBattery = ISUIElement:derive("eris_uiBattery");

eris_uiBattery.versionNumber = versionNumber;

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------activate

function eris_uiBattery:activate()
	if not self.itemObj:getModData()["uiBattery_active"] then
		self.itemObj:getModData()["uiBattery_active"] = true;
		self.itemObj:getModData()["uiBattery_activeTime"] = getGameTime():getWorldAgeHours();
		self.onActivate(self.target, self.plObj, self.itemObj, self);
		self:addToUIManager();
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------deactivate

function eris_uiBattery:deactivate()
	if self.itemObj:getModData()["uiBattery_active"] == true then
		self.itemObj:getModData()["uiBattery_active"] = false;
		self.onDeactivate(self.target, self.plObj, self.itemObj, self);
		self:removeFromUIManager();
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------doAction

function eris_uiBattery:doAction(_action, _itemObj, _itemObj2, _itemObj3, _itemObj4, _arg1, _arg2, _arg3, _arg4)
	local action = eris_uiBatteryAction:new(self.plObj, self, _action, _itemObj, _itemObj2, _itemObj3, _itemObj4, _arg1, _arg2, _arg3, _arg4);
	ISTimedActionQueue.add(action);
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------doActionMenu

function eris_uiBattery:doActionMenu(_context)
	local contextOption;
	local isActive = self:updateActiveState();
	local isValid = self.isValid(self.target, self.plObj, self.itemObj);
	if not isActive and self:hasBattery() and self:hasPower() then
		contextOption = _context:addOption(getTextOrNull("ContextMenu_Turn_On") or "Activate", self, eris_uiBattery.doAction, "Activate");
	elseif isActive then
		contextOption = _context:addOption(getTextOrNull("ContextMenu_Turn_Off") or "Deactivate", self, eris_uiBattery.doAction, "Deactivate");
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------doBatteryMenu

function eris_uiBattery:doBatteryMenu(_context)
	if self:hasBattery() then
		local contextRemoveBattery = _context:addOption(getTextOrNull("ContextMenu_Remove_Battery") or "Remove Battery", self, eris_uiBattery.doAction, "RemoveBattery");
	else
		local playerBatteryList = self.plObj:getInventory():getItemsFromType("Battery");
		if not playerBatteryList:isEmpty() then
			local battery, batteryLevel;
			local addedSubmenu = false;
			local contextAdd = _context:addOption(getTextOrNull("ContextMenu_AddBattery") or "Add Battery", self.itemObj);
			local subcontextAdd = _context:getNew(_context);
			_context:addSubMenu(contextAdd, subcontextAdd);
			for i = 0, playerBatteryList:size() - 1 do
				battery = playerBatteryList:get(i);
				batteryLevel = math.floor(battery:getUsedDelta() * 100);
				if batteryLevel > 0 then
					subcontextAdd:addOption(battery:getName() .. " (" .. batteryLevel .. "%)", self, eris_uiBattery.doAction, "AddBattery", battery);
					addedSubmenu = true;
				end;
			end;
			if not addedSubmenu then _context:removeLastOption(); end;
		end;
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------getPlayer

function eris_uiBattery:doPowerLevelMenu(_context)
	if self.adjustablePower then
		local powerLevel;
		local contextAdd = _context:addOption(getTextOrNull("IGUI_RadioPower") or "Power", self.itemObj);
		local subcontextAdd = _context:getNew(_context);
		_context:addSubMenu(contextAdd, subcontextAdd);
		for i = 1, 10 do
			powerLevel = i / 10;
			if self.itemObj:getModData()["uiBattery_powerLevel"] == powerLevel then
				subcontextAdd:addOption("["..(i * 10).."%]", self, eris_uiBattery.doAction, "SetPowerLevel", nil, nil, nil, nil, powerLevel);
			else
				subcontextAdd:addOption((i * 10).."%", self, eris_uiBattery.doAction, "SetPowerLevel", nil, nil, nil, nil, powerLevel);
			end;
		end;
	end;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------getPlayer

function eris_uiBattery:getPlayer()
	return self.plObj;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------getItem

function eris_uiBattery:getItem()
	return self.itemObj;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------hasAlternatePower

function eris_uiBattery:hasAlternatePower()
	return self.itemObj:getModData()["uiBattery_canUseGeneratorPower"] or false;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------hasPower

function eris_uiBattery:hasPower()
	return self.itemObj:getModData()["uiBattery_batteryLevel"] > 0 or false;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------hasBattery

function eris_uiBattery:hasBattery()
	return self.itemObj:getModData()["uiBattery_battery"] or false;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------addBattery

function eris_uiBattery:addBattery(_battery)
	self.itemObj:getModData()["uiBattery_battery"] = true;
	self.itemObj:getModData()["uiBattery_batteryLevel"] = _battery:getUsedDelta();
	self.itemObj:setActualWeight(self.itemWeightWithBattery);
	self.itemObj:setCustomWeight(true);
	self.plObj:getInventory():DoRemoveItem(_battery);
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------updateActiveState

function eris_uiBattery:updateActiveState()
	local isActive = self.isActive(self.target, self.plObj, self.itemObj);
	if self.itemObj:getModData()["uiBattery_active"] == true and not isActive then self:deactivate(); isActive = false; end;
	self.itemObj:getModData()["uiBattery_active"] = isActive;
	return isActive;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------removeBattery

function eris_uiBattery:removeBattery()
	local batteryObj = InventoryItemFactory.CreateItem("Base.Battery");
	batteryObj:setUsedDelta(self.itemObj:getModData()["uiBattery_batteryLevel"]);
	self.plObj:getInventory():AddItem(batteryObj);
	self.itemObj:getModData()["uiBattery_battery"] = false;
	self.itemObj:getModData()["uiBattery_batteryLevel"] = 0;
	self.itemObj:setActualWeight(self.itemWeightNoBattery);
	self.itemObj:setCustomWeight(true);
	self:deactivate();
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------getPowerLevel

function eris_uiBattery:getPowerLevel()
	return self.itemObj:getModData()["uiBattery_powerLevel"];
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------setPowerLevel

function eris_uiBattery:setPowerLevel(_powerLevel)
	self.itemObj:getModData()["uiBattery_powerLevel"] = _powerLevel;
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------prerender

function eris_uiBattery:prerender()
	--TODO: HUD battery meter?
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------render

function eris_uiBattery:render()
	--TODO: HUD battery meter?
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------update

LuaEventManager.AddEvent("UI_Update");

function eris_uiBattery:update()
	local isValid = self.isValid(self.target, self.plObj, self.itemObj);
	if not isValid then self:deactivate(isValid == nil); return; end;
	local active = self:updateActiveState();
	local powerLevel = self.itemObj:getModData()["uiBattery_powerLevel"] or 1;
	local batterylevel = self.itemObj:getModData()["uiBattery_batteryLevel"] or 0;
	local reductionThisFrame = 0;
	if active then
		local isPaused = UIManager.getSpeedControls() and UIManager.getSpeedControls():getCurrentGameSpeed() == 0;
		if isPaused then return; end;
		if batterylevel > 0 then
			local worldTime = getGameTime():getWorldAgeHours();
			local activeTime = self.itemObj:getModData()["uiBattery_activeTime"];
			reductionThisFrame = powerLevel * ((worldTime - activeTime) / self.runtime);
			batterylevel = batterylevel - reductionThisFrame;
			if batterylevel < 0 then batterylevel = 0; end;
			if batterylevel == 0 then 
				self.itemObj:getModData()["uiBattery_active"] = false;
				self.onBatteryDead(self.target, self.plObj, self.itemObj, self);
			end;
			self.itemObj:getModData()["uiBattery_batteryLevel"] = batterylevel;
			self.itemObj:getModData()["uiBattery_activeTime"] = worldTime;
			-- print("activeTime " ..activeTime);
			-- print("worldTime " ..worldTime);
			-- print("powerLevel = "..powerLevel);
			-- print("batterylevel = "..batterylevel);
			-- print("reductionThisFrame = "..reductionThisFrame);
		end;
	end;
	triggerEvent("UI_Update");
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------initialise

function eris_uiBattery:initialise()
	ISUIElement.initialise(self);
	local initialiseItem = (not self.itemObj:getModData()["uiBattery_initialised"]);
	local upgradeVersion = (not self.itemObj:getModData()["uiBattery_versionNumber"]) or (self.itemObj:getModData()["uiBattery_versionNumber"] < versionNumber);
	if initialiseItem or upgradeVersion then
		local hadBattery = self.itemObj:getModData()["uiBattery_battery"];
		local hasBattery = (initialiseItem and ZombRandBetween(0, 10) < 5 and true) or hadBattery or false;
		self.itemObj:getModData()["uiBattery_versionNumber"] = versionNumber;
		self.itemObj:getModData()["uiBattery_active"] = false;
		self.itemObj:getModData()["uiBattery_battery"] = hasBattery;
		self.itemObj:getModData()["uiBattery_batteryLevel"] = (hadBattery and 1) or (hasBattery and (ZombRandBetween(0, 10) / 10));
		self.itemObj:getModData()["uiBattery_powerLevel"] = 1;
		self.itemObj:getModData()["uiBattery_initialised"] = true;
	end;
	if self:hasBattery() then
		self.itemObj:setActualWeight(self.itemWeightWithBattery);
	else
		self.itemObj:setActualWeight(self.itemWeightNoBattery);
	end;
	self.itemObj:setCustomWeight(true);
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------new

function eris_uiBattery:new(_obj)

	local o = ISUIElement:new(0,0,0,0);

	setmetatable(o, self);

	self.__index = self;

	for k, v in pairs(_obj) do o[k] = v; end;

	o.target = o.target or {};

	return o;

end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
