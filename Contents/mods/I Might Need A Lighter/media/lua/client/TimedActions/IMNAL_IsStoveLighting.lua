--I Might Need A Lighter Mod by Fingbel

require "TimedActions/ISBaseTimedAction"
IsStoveLighting = ISBaseTimedAction:derive('IsStoveLighting')

function IsStoveLighting:isValid()
	return self.character:getInventory():contains(self.item);
end


function IsStoveLighting:waitToStart()
	--Face the correct direction
	self.character:faceThisObject(self.stove)
	return self.character:shouldBeTurning()
end

function IsStoveLighting:start()
	self:setActionAnim("Craft");
	--This bypass the lighter durability drainage
	
	self.item:setRequireInHandOrInventory(nil)
	if instanceof(self.stove,'IsoStove') then
		if self.initialState == false then
			self.stove:Toggle() 
		end
	end
end

function IsStoveLighting:update()
	--print (self:getJobDelta())
	
	if self:getJobDelta() > 0.30 and self:getJobDelta() < 0.60 then
		if (self.riskCounter > 1) then
			local rand = ZombRand(100)
			if self.highrisk == true then
				if rand>self.failureRate then
					--print("highrisk event triggered ",rand)
					self.character:getBodyDamage():getBodyPart(BodyPartType.Head):setBurned()				
					self.character:getBodyDamage():getBodyPart(BodyPartType.Hand_L):setBurned()
					self.character:getBodyDamage():getBodyPart(BodyPartType.Hand_R):setBurned()
					self.riskCounter = self.riskCounter -10
					self:forceStop()
					return
				else 
					self.riskCounter = self.riskCounter -10
					--print("highrisk event avoided",rand)	
					return
				end
			end
			if self.medrisk == true then
				if rand>self.failureRate then
					--print("medrisk event triggered",rand)
					self.character:getBodyDamage():getBodyPart(BodyPartType.Hand_L):setBurned()
					self.character:getBodyDamage():getBodyPart(BodyPartType.Hand_R):setBurned()					
					self.riskCounter = self.riskCounter -10
					self:forceStop()
					return
				else  
					self.riskCounter = self.riskCounter -10
					--print("medrisk event avoided",rand)
					return
				end
			end
			if self.lowrisk == true then
				if rand>self.failureRate then
					--print("lowrisk event triggered",rand)
					local rerand = ZombRand(100)
					--print("Rerand : ", rerand)
					if (rerand >=50) then
						self.character:getBodyDamage():getBodyPart(BodyPartType.Hand_L):setBurned()
					elseif (rerand <50) then
						self.character:getBodyDamage():getBodyPart(BodyPartType.Hand_R):setBurned()
					end
					self.riskCounter = self.riskCounter -10
					return
				else  
					self.riskCounter = self.riskCounter -10
					--print("lowrisk event avoided",rand)
					return
				end
			end
			
			
			
		end
	end
end

function IsStoveLighting:stop()
	--StopTimeBasedAction
	if instanceof(self.stove,'IsoStove') then
		if self.initialState == false then
			self.stove:Toggle()
		end
	end
	ISBaseTimedAction.stop(self);	
end


function IsStoveLighting:perform()
	if instanceof(self.stove,'IsoStove') then
		if self.initialState == false then
			self.stove:Toggle() 
		end
	end
	--FinishTimeBasedAction
	ISBaseTimedAction.perform(self)

end

function IsStoveLighting:new (character, stove, item, outcome, time)
	local o = {}
	o.riskCounter = (time/outcome)/time
	o.failureRate = 70
	time = time/outcome
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.stove = stove
	o.item = item
	o.outcome = outcome
	o.maxTime = time
	o.lowrisk = false
	o.medrisk = false
	o.highrisk = false
	if instanceof(stove,'IsoStove') then
		o.initialState = stove:Activated()
	end
	if character:isTimedActionInstant() then
		o.maxTime = 1;
	end
	if outcome <0.85 and outcome >= 0.50 then
		o.lowrisk = true
	elseif outcome <0.50 and outcome > 0.30 then
		o.lowrisk = true
		o.medrisk = true
	elseif outcome <0.30 then
		o.lowrisk = true
		o.medrisk = true
		o.highrisk = true	
	end
	if(SandboxVars.IMNAL.noStoveRisk == true) then
		o.lowrisk = false
		o.medrisk = false
		o.highrisk = false	
	end
	return o
end