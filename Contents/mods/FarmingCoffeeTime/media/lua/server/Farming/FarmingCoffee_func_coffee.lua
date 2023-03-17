
require "Farming/farming_vegetableconf"
require "Farming/SFarmingSystem"

--if SFFarming
require "SFFarm_FarmingSystem"

FCTrees = FCTrees or {};
FCTrees.Verbose = false

FCTrees.growCoffee = function(planting, nextGrowing, updateNbOfGrow)
    local nbOfGrow = planting.nbOfGrow;
    local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
    local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
    local prop = farming_vegetableconf.props[planting.typeOfSeed]
    if FCTrees.Verbose then print ("FCTrees.growCoffee planting="..tostring(planting or "nil").." nextGrowing="..tostring(nextGrowing or "nil").." updateNbOfGrow="..tostring(updateNbOfGrow or "nil").." nbOfGrow="..tostring(nbOfGrow or "nil").." water="..tostring(water or "nil").." diseaseLvl="..tostring(diseaseLvl or "nil")) end
    if(nbOfGrow <= 0) then -- initial
        nbOfGrow = 0;
        planting.nbOfGrow = 0;
        planting = growNext(planting, FCTrees.getTreeSpriteName(planting), FCTrees.getTreeObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
        --set conf from plant type props in order not to parse the map on each plant update afterwards
        if prop then
            planting.onPlantUpdateCode = prop.onPlantUpdateCode;
            planting.windThreshold = prop.windThreshold;
            planting.minTempThreshold = prop.minTempThreshold;
            planting.maxTempThreshold = prop.maxTempThreshold;
            if FCTrees.Verbose then print ("FCTrees.growCoffee init planting from prop") end
        end
    elseif (nbOfGrow <= 3) then -- sprout -- mature
        FCTrees.growNext(planting,nextGrowing);
    elseif (nbOfGrow == 4) then -- potential switch too blooming
        if prop and prop.monthRestriction then
            if not (SandboxVars and SandboxVars.FarmingCoffee and SandboxVars.FarmingCoffee.RemoveMonthBloomRestriction) then
                local isBloomingMonth = getGameTime():getMonth() + 1 == 5 or getGameTime():getMonth() + 1 == 11;--May or Sweet November (Colombia-like) twice a year
                if isBloomingMonth == false then planting.nbOfGrow = planting.nbOfGrow - 1; end--compensate increase done by SFarmingSystem:growPlant
            end
        end
        FCTrees.growNext(planting,nextGrowing);
    elseif (nbOfGrow == 5) then -- blooming
        if FCTrees.growNext(planting,nextGrowing) then
            planting.hasVegetable = true;
        end
    elseif (nbOfGrow == 6 ) then -- mature with fruits full grown
         if FCTrees.growNext(planting,nextGrowing) then
            planting.hasVegetable = true;
        end
    elseif nbOfGrow == 7 then
        if farming_vegetableconf.props[planting.typeOfSeed].retainOnHarvest then
            planting.nbOfGrow = farming_vegetableconf.props[planting.typeOfSeed].retainOnHarvest-- back to mature (drop rotten CoffeeFruit on Ground ? for now we'll tell birds ate them)
        end
        planting.hasVegetable = false;
        FCTrees.growNext(planting,nextGrowing)
    elseif (planting.state ~= "rotten") then -- rotten
        planting:rottenThis()
    end

    return planting;
end

FCTrees.onCoffeePlantUpdate = function(planting, prop)--SPlantGlobalObject need to save square ?
    --decrease health from windy situation in the exterior only
    if planting.health <= 0 or not planting.nbOfGrow or planting.nbOfGrow < 1 then return end

    if prop then
        planting.windThreshold = prop.windThreshold;
        planting.minTempThreshold = prop.minTempThreshold;
        planting.maxTempThreshold = prop.maxTempThreshold;
    end
    
    local square = nil
    if planting.windThreshold then
        square = square or planting:getSquare()
        if square and square:isOutside() then--there is no square in solo when far away
            local wind = getClimateManager():getWindPower()
            if wind and wind > planting.windThreshold then
                planting.health = planting.health - (wind - planting.windThreshold) * 2;--TODO gains must take into account simulated time passed since last update and interpolate between updates
                if FCTrees.Verbose then print ("FCTrees.onCoffeePlantUpdate Wind planting="..tostring(planting or "nil").." "..wind..">"..planting.windThreshold.." =>"..planting.health) end
            end
        end
    end
    --decrease health from low temperature situation 17 - 40 ok reduce health outside this range below 13 is a no go in theory
    if planting.minTempThreshold or planting.maxTempThreshold then
        square = square or planting:getSquare()
        if square then--there is no square in solo when far away
            local localTemperature = getClimateManager():getAirTemperatureForSquare(planting:getSquare());
            if planting.minTempThreshold and localTemperature and localTemperature < planting.minTempThreshold then
                planting.health = planting.health - (planting.minTempThreshold - localTemperature) * 0.02;--TODO gains must take into account simulated time passed since last update and interpolate between updates
                if FCTrees.Verbose then print ("FCTrees.onCoffeePlantUpdate Temperature planting="..tostring(planting or "nil").." "..localTemperature.."<"..planting.minTempThreshold.." =>"..planting.health) end
            end
            if planting.maxTempThreshold and localTemperature and localTemperature > planting.maxTempThreshold then
                planting.health = planting.health - (localTemperature - planting.maxTempThreshold) * 0.02;--TODO gains must take into account simulated time passed since last update and interpolate between updates
                if FCTrees.Verbose then print ("FCTrees.onCoffeePlantUpdate Temperature planting="..tostring(planting or "nil").." "..localTemperature..">"..planting.maxTempThreshold.." =>"..planting.health) end
            end
        end
    end
    
    if planting.health <= 0 then
        planting:dryThis()
    end

end


--taken from XNTrees
FCTrees.getTreeObjectName = function(plant)
    if plant.state == "plow" then return getText("Farming_Plowed_Land") end
    if plant.state == "destroy" then return getText("Farming_Destroyed") .. " " .. getText("Farming_Tree-" .. plant.typeOfSeed) end
    if plant.state == "dry" then return getText("Farming_Receding") .. " " .. getText("Farming_Tree-" .. plant.typeOfSeed) end
    if plant.state == "rotten" then return getText("Farming_Rotten") .. " " .. getText("Farming_Tree-" .. plant.typeOfSeed) end
    if farming_vegetableconf.props[plant.typeOfSeed].stages then
        if farming_vegetableconf.props[plant.typeOfSeed].stages[plant.nbOfGrow] then
            return getText(farming_vegetableconf.props[plant.typeOfSeed].stages[plant.nbOfGrow]) .. " " .. getText("Farming_Tree-" .. plant.typeOfSeed);
        end
    end
    return "Mystery Plant (FC)"
end

FCTrees.getTreeSpriteName = function(plant)
    if plant.state == "plow" then return "vegetation_farming_01_1" end
    local seed = plant.typeOfSeed;
    local maxNbOfGrow = #farming_vegetableconf.sprite[seed];
    if plant.state == "rotten" then return "" .. farming_vegetableconf.sprite[seed][maxNbOfGrow-1] end
    if plant.nbOfGrow <= 0 then
        return farming_vegetableconf.sprite[seed][1]
    elseif plant.nbOfGrow > 0 and plant.nbOfGrow < maxNbOfGrow then
        return farming_vegetableconf.sprite[seed][1 + plant.nbOfGrow]
    else -- rotten
        return farming_vegetableconf.sprite[seed][maxNbOfGrow]
    end
end

FCTrees.growNext = function(planting,nextGrowing,modifier)
    modifier = modifier or 1;
    local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
    local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
    if(water >= 0 and diseaseLvl >= 0) then
        planting.nextGrowing = calcNextGrowing(nextGrowing,modifier * farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
        planting:setObjectName(FCTrees.getTreeObjectName(planting))
        planting:setSpriteName(FCTrees.getTreeSpriteName(planting))
        return true;
    else
        badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
        return false;
    end
end

FCTrees.harvestTrees = function(luaObject, player,FarmSys)
    local props = farming_vegetableconf.props[luaObject.typeOfSeed];
    local numberOfVeg = getVegetablesNumber(props.minVeg, props.maxVeg, props.minVegAutorized, props.maxVegAutorized, luaObject);
    if player and not luaObject.isOld  then
        player:sendObjectChange('addItemOfType', { type = props.vegetableName, count = numberOfVeg });
        luaObject.hasVegetable = false
    end

    if player and luaObject.isOld then
        player:sendObjectChange('addItemOfType', { type = props.onOld, count = 1 });
        FarmSys:removePlant(luaObject);
        return;
    end

    if luaObject.hasSeed and player then
        player:sendObjectChange('addItemOfType', { type = props.seedName, count = (props.seedPerVeg * numberOfVeg) });
        luaObject.hasSeed = false
    end



    if props.retainOnHarvest ~= nil then
        luaObject.nbOfGrow = props.retainOnHarvest
        FarmSys:growPlant(luaObject, nil, true)
        luaObject:saveData()
    else
        FarmSys:removePlant(luaObject);
    end
end

local upperLayerHarvest = SFarmingSystem.harvest
function SFarmingSystem:harvest(luaObject, player)
	local props = farming_vegetableconf.props[luaObject.typeOfSeed]
	if props.harvestCode ~= nil then
			local harvestCode = props.harvestCode
			assert(loadstring('return '..harvestCode..'(...)'))(luaObject, player, self)
		return;
	else
		upperLayerHarvest(self,luaObject,player,self)
		return;
	end
end

--remove disease for trees
local upperLayerHarvest = SFarmingSystem.diseaseThis
function SFarmingSystem:diseaseThis(luaObject, doPropagate)
    local props = farming_vegetableconf.props[luaObject.typeOfSeed]
    if props.immuneToDisease then return end
    upperLayerHarvest(self, luaObject, doPropagate)
end

----debug
local function predicateDrainableUsesInt(item, count)
	return item:getDrainableUsesInt() >= count
end

local function predicateNotBroken(item)
	return not item:isBroken()
end

local function predicateDigPlow(item)
	return not item:isBroken() and item:hasTag("DigPlow")
end

ISFarmingMenu.doFarmingMenu2 = function(player, context, worldobjects, test)
	local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory()

	ISFarmingMenu.GardeningSprayMilk = nil;
	ISFarmingMenu.GardeningSprayCigarettes = nil;

	local fertilizer = false;
	local shovel = ISFarmingMenu.getShovel(playerObj)
	local handItem = playerObj:getPrimaryHandItem();
	local canSeed = false;
	local canWater = false;
	local cureMildew = false;
	local cureFlies = false;
	local info = false;
	local canHarvest = false;
    local sq = nil;
    local player = playerObj;
	local currentPlant = nil;
	for i,v in ipairs(worldobjects) do
		local plant = CFarmingSystem.instance:getLuaObjectOnSquare(v:getSquare())
		if plant then
			if playerInv:containsTypeRecurse("Fertilizer") or playerInv:containsTypeRecurse("CompostBag") then -- fertilizer
				fertilizer = true;
			end
			if plant.state == "plow" then -- sow seed
				canSeed = true;
			end
			if plant.state == "seeded" then -- water the plant
				canWater = true;
			end
			if plant.state ~= "plow" then -- info
				info = true;
			end
			-- disease
			if plant.mildewLvl > 0 then -- mildew
				cureMildew = true;
			end
			if plant.fliesLvl > 0 then -- flies
				cureFlies = true;
			end
			-- harvest
			if plant:canHarvest() then
				canHarvest = true;
			end
			currentPlant = plant
			sq = v:getSquare();
			break
		end
	end

    if not JoypadState.players[player:getPlayerNum()+1] and ISFarmingMenu.canDigHere(worldobjects) and not player:getVehicle() then
        if shovel then
            if test then return ISWorldObjectContextMenu.setTest() end
            context:addOption(getText("ContextMenu_Dig"), worldobjects, ISFarmingMenu.onPlow, player, shovel);
        else
            if(not player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):HasInjury() and not player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):HasInjury()) then
                if test then return ISWorldObjectContextMenu.setTest() end
                local option = context:addOption(getText("ContextMenu_DigWithHands"), worldobjects, ISFarmingMenu.onPlow, player, nil)
                local tooltip = ISWorldObjectContextMenu.addToolTip();
                tooltip.description = getText("ContextMenu_DigWithHandsTT");
                option.toolTip = tooltip;
            else
                if test then return ISWorldObjectContextMenu.setTest() end
                local option = context:addOption(getText("ContextMenu_DigWithHands"), worldobjects, ISFarmingMenu.onPlow, player, nil)
                option.notAvailable = true;
                local tooltip = ISWorldObjectContextMenu.addToolTip();
                tooltip.description = getText("ContextMenu_DamagedHands");
                option.toolTip = tooltip;
            end
        end
    end

	if fertilizer then
		if test then return ISWorldObjectContextMenu.setTest() end
		context:addOption(getText("ContextMenu_Fertilize"), worldobjects, ISFarmingMenu.onFertilize, handItem, currentPlant, sq, player);
	end
	if shovel and currentPlant then
		if test then return ISWorldObjectContextMenu.setTest() end
        context:addOption(getText("ContextMenu_Remove"), worldobjects, ISFarmingMenu.onShovel, currentPlant, player, sq);
    end
	if info then
		if test then return ISWorldObjectContextMenu.setTest() end
		context:addOption(getText("ContextMenu_Info"), worldobjects, ISFarmingMenu.onInfo, currentPlant, sq, player);
	end
	if canHarvest then
		if test then return ISWorldObjectContextMenu.setTest() end
		context:addOption(getText("ContextMenu_Harvest"), worldobjects, ISFarmingMenu.onHarvest, currentPlant, sq, player);
	end
	-- plant seed subMenu
	if canSeed then
		if test then return ISWorldObjectContextMenu.setTest() end
		ISFarmingMenu:doSeedMenu(context, currentPlant, sq, player)
	end
	-- water your plant
	if canWater and currentPlant.waterLvl < 100 then
		local waterSources = {}
		if handItem and handItem:isWaterSource() and math.floor(handItem:getUsedDelta()/handItem:getUseDelta()) > 0 then
			table.insert(waterSources, handItem)
		else
			for i = 0, playerInv:getItems():size() - 1 do
				local item = playerInv:getItems():get(i);
				if item:isWaterSource() and math.floor(item:getUsedDelta()/item:getUseDelta()) > 0 then
					table.insert(waterSources, item)
				end
			end
		end
		-- we get how many use we can do on our item
		if #waterSources > 0 then
			if test then return ISWorldObjectContextMenu.setTest() end
			local waterOption = context:addOption(getText("ContextMenu_Water"), worldobjects, nil);
			local subMenuWater = context
			if #waterSources > 1 then
				subMenuWater = context:getNew(context);
				context:addSubMenu(waterOption, subMenuWater);
				table.sort(waterSources, ISFarmingMenu.itemSortByName)
			end
			for index,handItem in ipairs(waterSources) do
				local use = math.floor(handItem:getUsedDelta()/handItem:getUseDelta());
				-- prepare subMenu for water (we make a submenu for every lvl 5 by 5)
				local subMenu = context:getNew(subMenuWater);
				-- if waterLvl missing is below the max use of the water plant (so we can't have the option for 40 water if the plant have 80)
				local missingWaterUse = math.ceil((100 - currentPlant.waterLvl) / 5);
				if missingWaterUse < use then
					use = missingWaterUse;
				end
				subMenu:addOption(getText("ContextMenu_Full", use * 5), worldobjects, ISFarmingMenu.onWater, use, handItem, player, currentPlant, sq);
				if use > 10 then
					use = 10
				else
					use = use - 1
				end
				for i=use,1,-1 do
					subMenu:addOption(tostring(i * 5), worldobjects, ISFarmingMenu.onWater, i, handItem, player, currentPlant, sq);
				end
				if #waterSources > 1 then
					waterOption = subMenuWater:addOption(handItem:getName(), worldobjects, nil);
				end
				-- we add the subMenu to our current option (Water)
				context:addSubMenu(waterOption, subMenu);
			end
		end
	end
	-- disease
	if cureMildew or cureFlies then
		-- we try to get the cure for mildew
		if not handItem or handItem:getType() ~= "GardeningSprayMilk" or (handItem:getDrainableUsesInt() == 0) then
			ISFarmingMenu.GardeningSprayMilk = playerInv:getFirstTypeEvalArgRecurse("GardeningSprayMilk", predicateDrainableUsesInt, 1)
		else
			ISFarmingMenu.GardeningSprayMilk = handItem;
		end
		-- we try to get the cure for flies
		if not handItem or handItem:getType() ~= "GardeningSprayCigarettes" or (handItem:getDrainableUsesInt() == 0) then
			ISFarmingMenu.GardeningSprayCigarettes = playerInv:getFirstTypeEvalArgRecurse("GardeningSprayCigarettes", predicateDrainableUsesInt, 1)
		else
			ISFarmingMenu.GardeningSprayCigarettes = handItem;
		end
--		if ISFarmingMenu.GardeningSprayMilk or ISFarmingMenu.GardeningSprayCigarettes then
		if test then return ISWorldObjectContextMenu.setTest() end
		local diseaseOption = context:addOption(getText("ContextMenu_Treat_Problem"), worldobjects, nil);
		local subMenuCure = context:getNew(context);
		context:addSubMenu(diseaseOption, subMenuCure);
		if currentPlant.mildewLvl > 0 then
			if ISFarmingMenu.GardeningSprayMilk then
				-- we get how many use we can do on our item
				local use = ISFarmingMenu.GardeningSprayMilk:getDrainableUsesInt()
				if use > 0 then
					-- prepare subMenu for mildew
					local mildewMenu = subMenuCure:addOption(getText("Farming_Mildew"), worldobjects, nil);
					-- now submenu for lvl of mildew you want to cure (5 by 5)
					local subMenuMildew = context:getNew(subMenuCure);
					if use > 10 then
						use = 10;
					end
					local mildewLvl = 0;
					for i=1, use do
						mildewLvl = i * 5;
						subMenuMildew:addOption(mildewLvl .. "", worldobjects, ISFarmingMenu.onMildewCure, i, sq, player);
					end
					context:addSubMenu(mildewMenu, subMenuMildew);
				else
					local flieMenu = subMenuCure:addOption(getText("Farming_Mildew"), worldobjects, nil);
					flieMenu.notAvailable = true;
					local tooltip = ISWorldObjectContextMenu.addToolTip();
					local spray = InventoryItemFactory.CreateItem("GardeningSprayMilk"):getDisplayName();
					tooltip.description = getText("Farming_MissingItem", spray);
					flieMenu.toolTip = tooltip;
				end
			end
		end
		if currentPlant.fliesLvl > 0  then
			if ISFarmingMenu.GardeningSprayCigarettes then
				-- we get how many use we can do on our item
				local use = ISFarmingMenu.GardeningSprayCigarettes:getDrainableUsesInt()
				if use > 0 then
					-- prepare subMenu for mildew
					local flieMenu = subMenuCure:addOption(getText("Farming_Pest_Flies"), worldobjects, nil);
					-- now submenu for lvl of flies you want to cure (5 by 5)
					local subMenuFlie = context:getNew(subMenuCure);
					if use > 10 then
						use = 10;
					end
					local fliesLvl = 0;
					for i=1, use do
						fliesLvl = i * 5;
						subMenuFlie:addOption(fliesLvl .. "", worldobjects, ISFarmingMenu.onFliesCure, i, sq, player);
					end
					context:addSubMenu(flieMenu, subMenuFlie);
				end
			else
				local flieMenu = subMenuCure:addOption(getText("Farming_Pest_Flies"), worldobjects, nil);
				flieMenu.notAvailable = true;
				local tooltip = ISWorldObjectContextMenu.addToolTip();
				local spray = getScriptManager():FindItem("farming.GardeningSprayCigarettes"):getDisplayName();
				tooltip.description = getText("Farming_MissingItem", spray);
				flieMenu.toolTip = tooltip;
			end
		end
--		end
	end
	if ISFarmingMenu.cheat and currentPlant then
		if test then return ISWorldObjectContextMenu.setTest() end
		local option = context:addOption("Cheat", worldobjects, nil);
		local subMenu = context:getNew(context);
		context:addSubMenu(option, subMenu);
		subMenu:addOption("Grow", worldobjects, ISFarmingMenu.onCheatGrow, currentPlant);
		subMenu:addOption("Water To Max", worldobjects, ISFarmingMenu.onCheatWater, currentPlant);
		subMenu:addOption("Zero Water", worldobjects, ISFarmingMenu.onCheat, currentPlant, { var = 'waterLvl', count = -currentPlant.waterLvl });
		subMenu:addOption("Flies +5", worldobjects, ISFarmingMenu.onCheat, currentPlant, { var = 'fliesLvl', count = 5 });
		subMenu:addOption("Flies -100", worldobjects, ISFarmingMenu.onCheat, currentPlant, { var = 'fliesLvl', count = -100 });
		subMenu:addOption("Mildew +5", worldobjects, ISFarmingMenu.onCheat, currentPlant, { var = 'mildewLvl', count = 5 });
		subMenu:addOption("Mildew -100", worldobjects, ISFarmingMenu.onCheat, currentPlant, { var = 'mildewLvl', count = -100 });
		subMenu:addOption("Aphids +5", worldobjects, ISFarmingMenu.onCheat, currentPlant, { var = 'aphidLvl', count = 5 });
		subMenu:addOption("Aphids -100", worldobjects, ISFarmingMenu.onCheat, currentPlant, { var = 'aphidLvl', count = -100 });
	end
end
