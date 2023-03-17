require "TimedActions/ISBaseTimedAction"

ISUGRReassembleAction = ISBaseTimedAction:derive("ISUGRReassembleAction");

function ISUGRReassembleAction:isValid()
	return self.character:getInventory():contains(self.gunParts)
		and self.character:getInventory():contains(self.screwdriver)
		and self.character:getInventory():contains(self.lubricant);
end

function ISUGRReassembleAction:update()
	self.gunParts:setJobDelta(self:getJobDelta());	
	self.screwdriver:setJobDelta(self:getJobDelta());
	self.lubricant:setJobDelta(self:getJobDelta());
end

function ISUGRReassembleAction:start()	
	self.gunParts:setJobType(getText("IGUI_JobType_UGRReassemble"));
	self.gunParts:setJobDelta(0.0);
	self.screwdriver:setJobType(getText("IGUI_JobType_UGRReassemble"));
	self.screwdriver:setJobDelta(0.0);
	self.lubricant:setJobType(getText("IGUI_JobType_UGRReassemble"));
	self.lubricant:setJobDelta(0.0);
	
	self:setActionAnim("Loot");
	self:setOverrideHandModels(nil, nil);
end

function ISUGRReassembleAction:stop()
	self.gunParts:setJobDelta(0.0);
	self.screwdriver:setJobDelta(0.0);
	self.lubricant:setJobDelta(0.0);
	ISBaseTimedAction.stop(self)
end

function ISUGRReassembleAction:perform()	
	self.gunParts:setJobDelta(0.0);
	self.screwdriver:setJobDelta(0.0);
	self.lubricant:setJobDelta(0.0);
	
	local modData = self.gunParts:getModData();
	if modData.UGR then
		local weaponFullType = modData.UGR[1];
		local weaponName = modData.UGR[2];
		local weaponCond = modData.UGR[3];
		local weaponMaxCond = modData.UGR[4];

		if self.lubricant:IsDrainable() then
			self.lubricant:Use()
		else
			self.character:getInventory():Remove(self.lubricant)
		end
		
		local gun = InventoryItemFactory.CreateItem(weaponFullType);
		gun:setName(weaponName);
		gun:setCustomName(true);
		gun:setCondition(weaponCond);
		gun:copyModData(modData);
		self.character:getInventory():AddItem(gun);
		if (gun:isTwoHandWeapon() or gun:isRequiresEquippedBothHands()) then
			self.character:setSecondaryHandItem(gun);
		else
			self.character:setSecondaryHandItem(nil);
		end
		self.character:setPrimaryHandItem(gun);
	else
		-- No mod data. 
		self:forceComplete();
	end
	
	self.character:getInventory():Remove(self.gunParts);	
	
	self.character:getXp():AddXP(Perks.Reloading, 5);
	
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function ISUGRReassembleAction:new(character, gunParts, screwdriver, lubricant)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.gunParts = gunParts;
	o.screwdriver = screwdriver;
	o.lubricant = lubricant;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 200 - (15 * character:getPerkLevel(Perks.Reloading));
	return o
end