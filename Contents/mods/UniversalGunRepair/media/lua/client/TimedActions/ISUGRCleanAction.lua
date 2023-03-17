require "TimedActions/ISBaseTimedAction"

ISUGRCleanAction = ISBaseTimedAction:derive("ISUGRCleanAction");

function ISUGRCleanAction:isValid()
	return self.character:getInventory():contains(self.gunParts)
		and self.character:getInventory():contains(self.tool)
		and self.character:getInventory():contains(self.solvent)
		and self.character:getInventory():contains(self.rag);
end

function ISUGRCleanAction:update()
	self.gunParts:setJobDelta(self:getJobDelta());	
	self.tool:setJobDelta(self:getJobDelta());
	self.solvent:setJobDelta(self:getJobDelta());
	self.rag:setJobDelta(self:getJobDelta());
end

function ISUGRCleanAction:start()	
	self.gunParts:setJobType(getText("IGUI_JobType_UGRClean"));
	self.gunParts:setJobDelta(0.0);
	self.tool:setJobType(getText("IGUI_JobType_UGRClean"));
	self.tool:setJobDelta(0.0);
	self.solvent:setJobType(getText("IGUI_JobType_UGRClean"));
	self.solvent:setJobDelta(0.0);
	self.rag:setJobType(getText("IGUI_JobType_UGRClean"));
	self.rag:setJobDelta(0.0);
	self:setActionAnim("Loot");
	self:setOverrideHandModels(nil, nil);
end

function ISUGRCleanAction:stop()
	self.gunParts:setJobDelta(0.0);
	self.tool:setJobDelta(0.0);
	self.solvent:setJobDelta(0.0);
	self.rag:setJobDelta(0.0);
	ISBaseTimedAction.stop(self)
end

function ISUGRCleanAction:perform()	
	self.gunParts:setJobDelta(0.0);
	self.tool:setJobDelta(0.0);
	self.solvent:setJobDelta(0.0);
	self.rag:setJobDelta(0.0);
	
	local modData = self.gunParts:getModData();
	if modData.UGR then
		local weaponFullType = modData.UGR[1];
		local weaponName = modData.UGR[2];
		local weaponCond = modData.UGR[3];
		local weaponCondMax = modData.UGR[4];

		local solventEfficacy = 1;
		if SandboxVars.UniversalGunRepair.NormalCleaningEfficacy and SandboxVars.UniversalGunRepair.NormalCleaningEfficacy > 0 then
			solventEfficacy = SandboxVars.UniversalGunRepair.NormalCleaningEfficacy
		end
				
		if self.solvent:IsDrainable() then
			if self.fullRestore then
				modData.UGR[3] = weaponCondMax;
				self.solvent:Use();
				self.character:getXp():AddXP(Perks.Maintenance, 3)
			else
				local solventUseDelta = math.floor(self.solvent:getUseDelta() * 1000) / 1000;
				local solventUses = math.floor(self.solvent:getUsedDelta()/solventUseDelta);
				local solventNeeded = math.ceil((weaponCondMax - weaponCond) / solventEfficacy);
				if (solventUses > solventNeeded) then
					modData.UGR[3] = weaponCondMax;
					self.solvent:setUsedDelta((solventUses - solventNeeded) * solventUseDelta);
					local xpGained = solventUses - solventNeeded;
					if xpGained > 3 then xpGained = 3 end
					self.character:getXp():AddXP(Perks.Maintenance, xpGained)
				else
					modData.UGR[3] = weaponCond + (solventUses * solventEfficacy);
					self.character:getInventory():Remove(self.solvent);	
					local xpGained = solventUses;
					if xpGained > 3 then xpGained = 3 end
					self.character:getXp():AddXP(Perks.Maintenance, xpGained)
				end
			end
		else
			if self.fullRestore then
				modData.UGR[3] = weaponCondMax;
				self.character:getXp():AddXP(Perks.Maintenance, 3)
			else
				modData.UGR[3] = weaponCond + solventEfficacy;
				self.character:getXp():AddXP(Perks.Maintenance, 1)
			end
			self.character:getInventory():Remove(self.solvent)
		end
		
		self.character:getInventory():AddItem(moduleDotType(self.rag:getModule(), self.rag:getReplaceOnUse()));
		self.character:getInventory():Remove(self.rag);
		
		self.gunParts:setName(weaponName .. " " .. getText("IGUI_UGRParts") .. " [" .. modData.UGR[3] .. "/" .. weaponCondMax .. "]");
		self.gunParts:setCustomName(true);
	end
	
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function ISUGRCleanAction:new(character, gunParts, tool, solvent, rag, fullRestore)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.gunParts = gunParts;
	o.tool = tool;
	o.solvent = solvent;
	o.rag = rag;
	o.fullRestore = fullRestore
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 300;
	return o
end