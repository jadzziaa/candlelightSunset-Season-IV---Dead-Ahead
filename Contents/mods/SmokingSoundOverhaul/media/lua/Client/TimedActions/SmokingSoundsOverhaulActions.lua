require "TimedActions/ISEatFoodAction"

SSO_last_match_sound = 0;
SSO_last_lighter_sound = 0;

local start_function_o = ISEatFoodAction.start

function ISEatFoodAction:start()
	--Susceptible support for removing mask before smoking/eating * Not my code! *
	if getActivatedMods():contains("Susceptible") then
		if SusceptibleMod.isPlayerSusceptible(self.character) then
			local threat = SusceptibleMod.threatByPlayer[self.character];
			if threat and threat > 0 then
				self:forceStop();
				return;
			end

			local mask = SusceptibleMod.getEquippedMaskItemAndData(self.character);
			if mask then
				self:stop();  
				self:autoManageMask(mask);
				return; 
			end
		end
	end
	
	local customEatSound = self.item:getCustomEatSound()
	
	--Run original function if not of type Cigarettes or contains a CustomEatSound, otherwise run Smoking Overhaul override
	if (self.item:getEatType() ~= "Cigarettes") or (customEatSound ~= "" and customEatSound ~= nil) and (customEatSound ~= "sm_smoking") then
		start_function_o(self)
	else
		local playerInv = self.character:getInventory()
		local lighter = playerInv:getFirstTag("Lighter") or playerInv:getFirstType("Base.Lighter");
		local matches = playerInv:getFirstTag("Matches") or playerInv:getFirstType("Base.Matches");
		
		--Smoker support
		local SM_foil_lighter = playerInv:getFirstType("SM.SMFoil_Lighter")
		local SM_Matchbox = playerInv:getFirstType("SM.Matches")
	
		local sound_rand = 0;
		local current_sound = "";
		
		--Randomly select one of the 3 sounds
		if lighter or SM_foil_lighter then
			while sound_rand == SSO_last_lighter_sound or sound_rand == 0 do 
				sound_rand = ZombRand(1,4)
			end
			
			SSO_last_lighter_sound = sound_rand

			current_sound = "Smoking_lighter" .. sound_rand
		elseif matches or SM_Matchbox then
			while sound_rand == SSO_last_match_sound or sound_rand == 0 do 
				sound_rand = ZombRand(1,4)
			end
			
			SSO_last_match_sound = sound_rand
			
			current_sound = "Smoking_matches" .. sound_rand
		end
		
		local gender = "";
				
		--Determine f or m 
		if self.character:isFemale() then
			gender = "f";
		else 
			gender = "m";
		end
		
		--Play custom sound
		self.eatAudio = self.character:getEmitter():playSound(current_sound .. gender);
				
		--Continue with the original function
		if self.item:getCustomMenuOption() then
			self.item:setJobType(self.item:getCustomMenuOption())
		else
			self.item:setJobType(getText("ContextMenu_Eat"));
		end
		
		self.item:setJobDelta(0.0);
		
		self:setAnimVariable("FoodType", self.item:getEatType());
	
		self:setOverrideHandModels(nil, self.item);
		self:setActionAnim(CharacterActionAnims.Eat);
		self.character:reportEvent("EventEating");
	end
end