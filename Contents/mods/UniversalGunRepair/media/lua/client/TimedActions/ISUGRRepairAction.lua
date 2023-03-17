require "TimedActions/ISBaseTimedAction"

ISUGRRepairAction = ISBaseTimedAction:derive("ISUGRRepairAction");

function ISUGRRepairAction:isValid()
	return self.character:getInventory():contains(self.gunParts) 
		and self.character:getInventory():contains(self.tool) 
		and self.character:getInventory():contains(self.scrap);
end

function ISUGRRepairAction:update()
	self.gunParts:setJobDelta(self:getJobDelta());	
	self.tool:setJobDelta(self:getJobDelta());
end

function ISUGRRepairAction:start()	
	self.gunParts:setJobType(getText("IGUI_JobType_UGRRepair"));
	self.gunParts:setJobDelta(0.0);
	self.tool:setJobType(getText("IGUI_JobType_UGRRepair"));
	self.tool:setJobDelta(0.0);
	self:setActionAnim("Loot");
	self:setOverrideHandModels(nil, nil);
end

function ISUGRRepairAction:stop()
	self.gunParts:setJobDelta(0.0);
	self.tool:setJobDelta(0.0);
	ISBaseTimedAction.stop(self)
end

function ISUGRRepairAction:perform()	
	self.gunParts:setJobDelta(0.0);
	self.tool:setJobDelta(0.0);
	
	local modData = self.gunParts:getModData();
	if modData.UGR then
		local weaponFullType = modData.UGR[1];
		local weaponName = modData.UGR[2];
		local weaponCond = modData.UGR[3];
		local weaponCondMax = modData.UGR[4];
		
		local repairEfficacy = 1;
		if SandboxVars.UniversalGunRepair.MinimumCleanThreshold and SandboxVars.UniversalGunRepair.MinimumCleanThreshold > 5 then
			repairEfficacy = math.floor(SandboxVars.UniversalGunRepair.MinimumCleanThreshold / 5)
		end
		
		if (weaponCond < weaponCondMax) then
			weaponCond = weaponCond + repairEfficacy;
			if (weaponCond > weaponCondMax) then
				weaponCond = weaponCondMax;
			end
			self.character:getInventory():Remove(self.scrap);	
			modData.UGR[3] = weaponCond;
			self.character:getXp():AddXP(Perks.Maintenance, 1)
		end
		
		self.gunParts:setName(weaponName .. " " .. getText("IGUI_UGRParts") .. " [" .. modData.UGR[3] .. "/" .. weaponCondMax .. "]");
		self.gunParts:setCustomName(true);
	end
	
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function ISUGRRepairAction:new(character, gunParts, tool, scrap)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.gunParts = gunParts;
	o.tool = tool;
	o.scrap = scrap;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 300;
	return o
end