require('NPCs/MainCreationMethods');

MoreSmokes = MoreSmokes or {}; 

local function initMoreSmokesTrait()

	local Stoner = TraitFactory.addTrait("Stoner", getText("UI_trait_stoner"), 2, getText("UI_trait_stonerinfo"), false, false);
	Stoner:addXPBoost(Perks.Cultivation, 1);
    Stoner:getFreeRecipes():add("Begin Curing Northern Lights Cannabis");
	Stoner:getFreeRecipes():add("Begin Curing Purple Haze Cannabis");
	Stoner:getFreeRecipes():add("Begin Curing Sour Diesel Cannabis");
	Stoner:getFreeRecipes():add("Process Northern Lights by Hand");
	Stoner:getFreeRecipes():add("Process Purple Haze by Hand");
	Stoner:getFreeRecipes():add("Process Sour Diesel by Hand");
	Stoner:getFreeRecipes():add("Process Northern Lights with Grinder");
	Stoner:getFreeRecipes():add("Process Purple Haze with Grinder");
	Stoner:getFreeRecipes():add("Process Sour Diesel with Grinder");
	Stoner:getFreeRecipes():add("Roll Joint Northern Lights");
	Stoner:getFreeRecipes():add("Roll Joint Purple Haze");
	Stoner:getFreeRecipes():add("Roll Joint Sour Diesel");

    local ParanoidToker = TraitFactory.addTrait("ParanoidToker", getText("UI_trait_paranoid_toker"), -4, getText("UI_trait_paranoid_tokerinfo"), false, false);

    --Exclusives
	TraitFactory.setMutualExclusive("Stoner", "ParanoidToker");
	TraitFactory.setMutualExclusive("AdrenalineJunkie", "ParanoidToker");
	TraitFactory.setMutualExclusive("Desensitized", "ParanoidToker");
	TraitFactory.setMutualExclusive("Brave", "ParanoidToker");

    TraitFactory.sortList();
end

local function MoreSmokesStarterKit(char, square)
	if SandboxVars.StarterKit then
		local bag = char:getInventory():FindAndReturn("Base.Bag_Schoolbag");
		if not bag then
			bag = char:getInventory():AddItem("Base.Bag_Schoolbag");
		end
		if char:HasTrait("Stoner") then
			bag:getItemContainer():AddItem("MoreSmokes.SmokesKit");
		end
	end
	return
end

Events.OnGameBoot.Add(initMoreSmokesTrait);
Events.OnNewGame.Add(MoreSmokesStarterKit);