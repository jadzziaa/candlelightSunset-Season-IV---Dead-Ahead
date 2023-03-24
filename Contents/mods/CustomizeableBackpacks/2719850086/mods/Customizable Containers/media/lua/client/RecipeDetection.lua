

function RecipeDetection()
	if SandboxVars.CustomizableRecipes.Recipes == true then

		
		getPlayer():getKnownRecipes():add("Craft Respawn Token")
		
		getPlayer():getKnownRecipes():add("RESPAWN")

		function RecipesBrita()
				if getActivatedMods():contains("Brita_2") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN Brita")
				end	
			
			
		function RecipesAuthenticZ()
				if getActivatedMods():contains("Authentic Z - Current") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN AuthZ")
				end	
				
				
		function RecipesBetterBelts()
				if getActivatedMods():contains("Better Belts") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN BBelts")
				end	
				
				
		function RecipesClothesBOX()
				if getActivatedMods():contains("2507488373") then -- ClothesBOX
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN CBOX")
				end	
				
				
		function RecipesGEAR()
				if getActivatedMods():contains("ADVANCEDGEAR") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN G.E.A.R")
				end	
				
				
		function RecipesMilitaryClothingChange()
				if getActivatedMods():contains("MilitaryClothingChange") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN MCC")
				end	
				
				
		function RecipesPLLoot()
				if getActivatedMods():contains("PLLoot") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN PawLow")
				end	
				
				
		function RecipesScrapArmor()
				if getActivatedMods():contains("ScrapArmor(new version)") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN ScrapArmor")
				end	
				
				
		function RecipesSLEO()
				if getActivatedMods():contains("SLEO") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN SLEO")
				end	
				
				
		function RecipesSMUI()
				if getActivatedMods():contains("SMUI") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN SMUI")
				end	
				
				
		function RecipesSWAT()
				if getActivatedMods():contains("Swatpack") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN SWAT")
				end	
				
				
		function RecipesPawLowPatch()
				if getActivatedMods():contains("PLLoot_Patch") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN PawLowPatch")
				end
				
				
		function RecipesFilibuster()
				if getActivatedMods():contains("FRUsedCars") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN Filibuster")
				end
				
				
		function RecipesREMOD()
				if getActivatedMods():contains("REMOD") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN REMOD")
				end
				
				
		function RecipesSBDC()
				if getActivatedMods():contains("SameBagDifferentColor") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN SBDC")
				end
				
				
		function RecipesHydrocraft()
				if getActivatedMods():contains("Hydrocraft") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN Hydrocraft")
				end
				
				
		function RecipesUndeadS()
				if getActivatedMods():contains("UndeadSuvivor") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN UndeadS")
				end
				
				
		function RecipesUSMC()
				if getActivatedMods():contains("DRK_1") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN USMC")
				end
				
		
		function RecipesMoreTraits()
				if getActivatedMods():contains("ToadTraits") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN MoreTraits")
				end
				
				
		function RecipesRewardKills()
				if getActivatedMods():contains("ToadTraits") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN RewardKills")
				end
				
				
		function RecipesSleepAttach()
				if getActivatedMods():contains("sleepingbagsandattachments") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN SleepAttach")
				end
				
				
		function RecipesNoir()
				if getActivatedMods():contains("noirbackpacksattachments") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN Noir")
				end
				
				
		function RecipesEHE()
				if getActivatedMods():contains("ExpandedHelicopterEvents") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN EHE")
				end
				
		function RecipesImprovB()
				if getActivatedMods():contains("ImprovisedBackpacks") then
				else return end
				
					getPlayer():getKnownRecipes():add("RESPAWN ImprovB")
				end
	
	
		Events.OnLoad.Add(RecipesBrita)
		Events.OnLoad.Add(RecipesAuthenticZ)
		Events.OnLoad.Add(RecipesBetterBelts)
		Events.OnLoad.Add(RecipesClothesBOX)
		Events.OnLoad.Add(RecipesGEAR)
		Events.OnLoad.Add(RecipesMilitaryClothingChange)
		Events.OnLoad.Add(RecipesPLLoot)
		Events.OnLoad.Add(RecipesScrapArmor)
		Events.OnLoad.Add(RecipesSLEO)
		Events.OnLoad.Add(RecipesSMUI)
		Events.OnLoad.Add(RecipesSWAT)
		Events.OnLoad.Add(RecipesFilibuster)
		Events.OnLoad.Add(RecipesPawLowPatch)
		Events.OnLoad.Add(RecipesREMOD)
		Events.OnLoad.Add(RecipesSBDC)
		Events.OnLoad.Add(RecipesHydrocraft)
		Events.OnLoad.Add(RecipesUndeadS)
		Events.OnLoad.Add(RecipesUSMC)
		Events.OnLoad.Add(RecipesMoreTraits)
		Events.OnLoad.Add(RecipesRewardKills)
		Events.OnLoad.Add(RecipesSleepAttach)
		Events.OnLoad.Add(RecipesNoir)
		Events.OnLoad.Add(RecipesEHE)
		Events.OnLoad.Add(RecipesImprovB)
		
		
	elseif SandboxVars.CustomizableRecipes.Recipes == false then

	
		getPlayer():getKnownRecipes():remove("Craft Respawn Token")
	
		getPlayer():getKnownRecipes():remove("RESPAWN")
		
		getPlayer():getKnownRecipes():remove("RESPAWN Brita")
		
		getPlayer():getKnownRecipes():remove("RESPAWN AuthZ")
		
		getPlayer():getKnownRecipes():remove("RESPAWN BBelts")
		
		getPlayer():getKnownRecipes():remove("RESPAWN CBOX")
		
		getPlayer():getKnownRecipes():remove("RESPAWN G.E.A.R")
		
		getPlayer():getKnownRecipes():remove("RESPAWN MCC")
		
		getPlayer():getKnownRecipes():remove("RESPAWN PawLow")
		
		getPlayer():getKnownRecipes():remove("RESPAWN ScrapArmor")
		
		getPlayer():getKnownRecipes():remove("RESPAWN SLEO")
		
		getPlayer():getKnownRecipes():remove("RESPAWN SMUI")
		
		getPlayer():getKnownRecipes():remove("RESPAWN SWAT")
		
		getPlayer():getKnownRecipes():remove("RESPAWN Filibuster")
		
		getPlayer():getKnownRecipes():remove("RESPAWN PawLowPatch")
		
		getPlayer():getKnownRecipes():remove("RESPAWN REMOD")
		
		getPlayer():getKnownRecipes():remove("RESPAWN SBDC")
		
		getPlayer():getKnownRecipes():remove("RESPAWN Hydrocraft")
		
		getPlayer():getKnownRecipes():remove("RESPAWN UndeadS")
		
		getPlayer():getKnownRecipes():remove("RESPAWN USMC")
		
		getPlayer():getKnownRecipes():remove("RESPAWN MoreTraits")
		
		getPlayer():getKnownRecipes():remove("RESPAWN RewardKills")
		
		getPlayer():getKnownRecipes():remove("RESPAWN SleepAttach")
		
		getPlayer():getKnownRecipes():remove("RESPAWN Noir")
		
		getPlayer():getKnownRecipes():remove("RESPAWN EHE")
		
		getPlayer():getKnownRecipes():remove("RESPAWN ImprovB")


	end	
end


Events.OnLoad.Add(RecipeDetection)
