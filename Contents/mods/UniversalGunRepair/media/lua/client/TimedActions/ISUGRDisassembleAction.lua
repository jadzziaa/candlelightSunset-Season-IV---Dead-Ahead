require "TimedActions/ISBaseTimedAction"

ISUGRDisassembleAction = ISBaseTimedAction:derive("ISUGRDisassembleAction");

function ISUGRDisassembleAction:isValid()
	return self.character:getInventory():contains(self.gun) and self.character:getInventory():contains(self.screwdriver);
end

function ISUGRDisassembleAction:update()
	self.gun:setJobDelta(self:getJobDelta());	
	self.screwdriver:setJobDelta(self:getJobDelta());
end

function ISUGRDisassembleAction:start()	
	self.gun:setJobType(getText("IGUI_JobType_UGRDisassemble"));
	self.gun:setJobDelta(0.0);
	self.screwdriver:setJobType(getText("IGUI_JobType_UGRDisassemble"));
	self.screwdriver:setJobDelta(0.0);
	
	self:setActionAnim("Loot");
	self:setOverrideHandModels(nil, nil);
end

function ISUGRDisassembleAction:stop()
	self.gun:setJobDelta(0.0);
	self.screwdriver:setJobDelta(0.0);
	ISBaseTimedAction.stop(self)
end

function ISUGRDisassembleAction:perform()	
	self.gun:setJobDelta(0.0);
	self.screwdriver:setJobDelta(0.0);
	
	local weaponFullType = self.gun:getFullType();
	local weaponName = self.gun:getDisplayName();
	local weaponCond = self.gun:getCondition();
	local weaponCondMax = self.gun:getConditionMax();
	local weaponWeight = self.gun:getWeight();
	
	local gunParts = nil;
	if (weaponWeight < 3.0) then
		gunParts = InventoryItemFactory.CreateItem("DisassembledGunPartsSmall");
	else
		gunParts = InventoryItemFactory.CreateItem("DisassembledGunPartsLarge");
	end
	gunParts:copyModData(self.gun:getModData());
	local modData = gunParts:getModData();
	modData.UGR = { weaponFullType, weaponName, weaponCond, weaponCondMax };
	
	gunParts:setName(weaponName .. " " .. getText("IGUI_UGRParts") .. " [" .. weaponCond .. "/" .. weaponCondMax .. "]");
	gunParts:setCustomName(true);
	gunParts:setActualWeight(weaponWeight * 1.2);
	gunParts:setWeight(weaponWeight * 1.2);
	gunParts:setCustomWeight(true);
	
	self.character:getInventory():AddItem(gunParts);
	if (self.gun:isTwoHandWeapon() or self.gun:isRequiresEquippedBothHands()) and self.gun == self.character:getSecondaryHandItem() then
		self.character:setSecondaryHandItem(nil);
	end
    self.character:setPrimaryHandItem(nil);
	self.character:getInventory():Remove(self.gun);	
	
	self.character:getXp():AddXP(Perks.Reloading, 5);
	
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function ISUGRDisassembleAction:new(character, gun, screwdriver)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.gun = gun;
	o.screwdriver = screwdriver;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 200 - (15 * character:getPerkLevel(Perks.Reloading));
	return o
end