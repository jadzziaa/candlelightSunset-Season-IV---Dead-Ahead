require "Farming/farming_vegetableconf"

SFFarmNewVeggies = {}
-- Beets
-- Need 6 seeds
-- Need water lvl between 45 and 75
-- Need 2 weeks (56h per phase)
SFFarmNewVeggies.growBeets = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local waterMax = farming_vegetableconf.calcWater(planting.waterLvl, planting.waterNeededMax);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if(nbOfGrow == 0) then -- young
		planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
		planting.waterNeeded = 70;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and waterMax >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
			planting.waterNeededMax = farming_vegetableconf.props[planting.typeOfSeed].waterLvlMax;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and waterMax >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0 and waterMax >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 224);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

-- Corn
-- Need 4 seeds
-- Water lvl over 85
-- Need 4 weeks to grow (112h per phase)
SFFarmNewVeggies.growCorn = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if(nbOfGrow == 0) then -- young
		planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
		planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- bloom (don't have vegetable)
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 248);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

-- Cauliflowers
-- Need 9 seeds
-- Water lvl over 85
-- Need 4 weeks to grow (112h per phase)
SFFarmNewVeggies.growCauliflowers = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if(nbOfGrow <= 0) then -- young
		nbOfGrow = 0;
		planting.nbOfGrow = 0;
		planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
		planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 248);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

-- Lemon Grass
-- Need 4 seeds
-- Water lvl 70
-- Need 4 weeks to grow (112h per phase)
SFFarmNewVeggies.growLemongrass = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if(nbOfGrow <= 0) then -- young
		nbOfGrow = 0;
		planting.nbOfGrow = 0;
		planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
		planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 248);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

-- Lettuce
-- Need 9 seeds
-- Water lvl over 85
-- Need 4 weeks to grow (112h per phase)
SFFarmNewVeggies.growLettuce = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if(nbOfGrow <= 0) then -- young
		nbOfGrow = 0;
		planting.nbOfGrow = 0;
		planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
		planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 248);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

--Tea
SFFarmNewVeggies.growTea = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if(nbOfGrow <= 0) then -- young
		nbOfGrow = 0;
		planting.nbOfGrow = 0;
		planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
		planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 248);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

-- Wheat
-- Need 9 seeds
-- Need water lvl between 35 and 85
-- Need 2 weeks (56h per phase)
SFFarmNewVeggies.growWheat = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local waterMax = farming_vegetableconf.calcWater(planting.waterLvl, planting.waterNeededMax);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if(nbOfGrow == 0) then -- young
		planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
		planting.waterNeeded = 50;
	elseif (nbOfGrow <= 4) then -- young
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
			planting.waterNeededMax = farming_vegetableconf.props[planting.typeOfSeed].waterLvlMax;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 224);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

--Icons
farming_vegetableconf.icons["Radishes"] = "Item_Radish";
farming_vegetableconf.icons["Strawberry plant"] = "Item_BerryStraw";
farming_vegetableconf.icons["Tomato"] = "Item_Tomato";
farming_vegetableconf.icons["Potatoes"] = "Item_Potato";
farming_vegetableconf.icons["Cabbages"] = "Item_Cabbage";
farming_vegetableconf.icons["Beets"] = "media/textures/Item_SFBeetroot.png";
farming_vegetableconf.icons["Corn"] = "Item_Corn";
farming_vegetableconf.icons["Cauliflowers"] = "media/textures/Item_SFCauliflower.png";
farming_vegetableconf.icons["Lemongrass"] = "Item_LemonGrass";
farming_vegetableconf.icons["Lettuce"] = "Item_Lettuce";
farming_vegetableconf.icons["Tea"] = "media/textures/Item_TeaLeaves.png";
farming_vegetableconf.icons["Wheat"] = "media/textures/Item_SFWheat.png";

--props
-- Beets
farming_vegetableconf.props["Beets"] = {};
farming_vegetableconf.props["Beets"].seedsRequired = 6;
farming_vegetableconf.props["Beets"].texture = "vegetation_farming_01_54";
farming_vegetableconf.props["Beets"].waterLvl = 60;
farming_vegetableconf.props["Beets"].waterLvlMax = 95;
farming_vegetableconf.props["Beets"].timeToGrow = ZombRand(89, 103);
farming_vegetableconf.props["Beets"].minVeg = 4;
farming_vegetableconf.props["Beets"].maxVeg = 9;
farming_vegetableconf.props["Beets"].minVegAutorized = 11;
farming_vegetableconf.props["Beets"].maxVegAutorized = 15;
farming_vegetableconf.props["Beets"].vegetableName = "filcher.Beetroot";
farming_vegetableconf.props["Beets"].seedName = "filcher.BeetSeed";
farming_vegetableconf.props["Beets"].growCode = "SFFarmNewVeggies.growBeets";
farming_vegetableconf.props["Beets"].seedPerVeg = 4;

-- Corn
farming_vegetableconf.props["Corn"] = farming_vegetableconf.props["Corn"] or {};
farming_vegetableconf.props["Corn"].seedsRequired = 4;
farming_vegetableconf.props["Corn"].texture = "vegetation_farming_01_77";
farming_vegetableconf.props["Corn"].waterLvl = 75;
farming_vegetableconf.props["Corn"].timeToGrow = ZombRand(62, 103);
farming_vegetableconf.props["Corn"].vegetableName = "Base.Corn";
farming_vegetableconf.props["Corn"].seedName = "filcher.CornSeed";
farming_vegetableconf.props["Corn"].growCode = "SFFarmNewVeggies.growCorn";
farming_vegetableconf.props["Corn"].seedPerVeg = 4;
farming_vegetableconf.props["Corn"].minVeg = 4;
farming_vegetableconf.props["Corn"].maxVeg = 6;
farming_vegetableconf.props["Corn"].minVegAutorized = 9;
farming_vegetableconf.props["Corn"].maxVegAutorized = 11;
farming_vegetableconf.props["Corn"].phaseName5 = "Farming_In_bloom";
farming_vegetableconf.props["Corn"].phaseName6 = "Farming_Ready_for_Harvest";

-- Cauliflower
farming_vegetableconf.props["Cauliflowers"] = {};
farming_vegetableconf.props["Cauliflowers"].seedsRequired = 9;
farming_vegetableconf.props["Cauliflowers"].texture = "vegetation_farming_01_21";
farming_vegetableconf.props["Cauliflowers"].waterLvl = 70;
farming_vegetableconf.props["Cauliflowers"].timeToGrow = ZombRand(50,55);
farming_vegetableconf.props["Cauliflowers"].vegetableName = "filcher.Cauliflower";
farming_vegetableconf.props["Cauliflowers"].seedName = "filcher.CauliflowerSeed";
farming_vegetableconf.props["Cauliflowers"].growCode = "SFFarmNewVeggies.growCauliflowers";
farming_vegetableconf.props["Cauliflowers"].seedPerVeg = 3;
farming_vegetableconf.props["Cauliflowers"].minVeg = 4;
farming_vegetableconf.props["Cauliflowers"].maxVeg = 6;
farming_vegetableconf.props["Cauliflowers"].minVegAutorized = 9;
farming_vegetableconf.props["Cauliflowers"].maxVegAutorized = 11;

-- Lemongrass
farming_vegetableconf.props["Lemongrass"] = {};
farming_vegetableconf.props["Lemongrass"].seedsRequired = 4;
farming_vegetableconf.props["Lemongrass"].texture = "sffarming_01_09";
farming_vegetableconf.props["Lemongrass"].waterLvl = 70;
farming_vegetableconf.props["Lemongrass"].timeToGrow = ZombRand(40,45);
farming_vegetableconf.props["Lemongrass"].vegetableName = "Base.LemonGrass";
farming_vegetableconf.props["Lemongrass"].seedName = "filcher.SFLemonGrassSeed";
farming_vegetableconf.props["Lemongrass"].growCode = "SFFarmNewVeggies.growLemongrass";
farming_vegetableconf.props["Lemongrass"].seedPerVeg = 2;
farming_vegetableconf.props["Lemongrass"].minVeg = 1;
farming_vegetableconf.props["Lemongrass"].maxVeg = 3;
farming_vegetableconf.props["Lemongrass"].minVegAutorized = 2;
farming_vegetableconf.props["Lemongrass"].maxVegAutorized = 5;
farming_vegetableconf.props["Lemongrass"].retainOnHarvest = 2;

-- Lettuce
farming_vegetableconf.props["Lettuce"] = farming_vegetableconf.props["Lettuce"] or {};
farming_vegetableconf.props["Lettuce"].seedsRequired = 9;
farming_vegetableconf.props["Lettuce"].texture = "vegetation_farming_01_21";
farming_vegetableconf.props["Lettuce"].waterLvl = 65;
farming_vegetableconf.props["Lettuce"].timeToGrow = ZombRand(45,50);
farming_vegetableconf.props["Lettuce"].vegetableName = "Base.Lettuce";
farming_vegetableconf.props["Lettuce"].seedName = "filcher.LettuceSeed";
farming_vegetableconf.props["Lettuce"].growCode = "SFFarmNewVeggies.growLettuce";
farming_vegetableconf.props["Lettuce"].seedPerVeg = 3;
farming_vegetableconf.props["Lettuce"].minVeg = 4;
farming_vegetableconf.props["Lettuce"].maxVeg = 6;
farming_vegetableconf.props["Lettuce"].minVegAutorized = 9;
farming_vegetableconf.props["Lettuce"].maxVegAutorized = 11;

-- Tea
farming_vegetableconf.props["Tea"] = {};
farming_vegetableconf.props["Tea"].seedsRequired = 4;
farming_vegetableconf.props["Tea"].texture = "sffarming_01_17";
farming_vegetableconf.props["Tea"].waterLvl = 55;
farming_vegetableconf.props["Tea"].timeToGrow = ZombRand(103, 125);
farming_vegetableconf.props["Tea"].minVeg = 4;
farming_vegetableconf.props["Tea"].maxVeg = 9;
farming_vegetableconf.props["Tea"].minVegAutorized = 11;
farming_vegetableconf.props["Tea"].maxVegAutorized = 15;
farming_vegetableconf.props["Tea"].vegetableName = "filcher.TeaLeaves";
farming_vegetableconf.props["Tea"].seedName = "filcher.TeaSeed";
farming_vegetableconf.props["Tea"].growCode = "SFFarmNewVeggies.growTea";
farming_vegetableconf.props["Tea"].seedPerVeg = 4;
farming_vegetableconf.props["Tea"].retainOnHarvest = 4;

-- Wheat
farming_vegetableconf.props["Wheat"] = {};
farming_vegetableconf.props["Wheat"].seedsRequired = 9;
farming_vegetableconf.props["Wheat"].texture = "sffarming_01_05";
farming_vegetableconf.props["Wheat"].waterLvl = 35;
farming_vegetableconf.props["Wheat"].waterLvlMax = 85;
farming_vegetableconf.props["Wheat"].timeToGrow = ZombRand(60, 80);
farming_vegetableconf.props["Wheat"].vegetableName = "filcher.SFWheat";
farming_vegetableconf.props["Wheat"].seedName = "filcher.SFWheatSeed";
farming_vegetableconf.props["Wheat"].growCode = "SFFarmNewVeggies.growWheat";
farming_vegetableconf.props["Wheat"].seedPerVeg = 3;
farming_vegetableconf.props["Wheat"].minVeg = 4;
farming_vegetableconf.props["Wheat"].maxVeg = 6;
farming_vegetableconf.props["Wheat"].minVegAutorized = 8;
farming_vegetableconf.props["Wheat"].maxVegAutorized = 10;
farming_vegetableconf.props["Wheat"].phaseName6 = "Farming_Ready_for_Harvest";

--Sprites
farming_vegetableconf.sprite["Beets"] = {
"vegetation_farming_01_48",
"vegetation_farming_01_49",
"vegetation_farming_01_50",
"vegetation_farming_01_51",
"vegetation_farming_01_52",
"vegetation_farming_01_54",
"vegetation_farming_01_53",
"vegetation_farming_01_55"
}
farming_vegetableconf.sprite["Corn"] = {
"vegetation_farming_01_72",
"vegetation_farming_01_73",
"vegetation_farming_01_74",
"vegetation_farming_01_75",
"vegetation_farming_01_76",
"vegetation_farming_01_77",
"vegetation_farming_01_78",
"vegetation_farming_01_79"
}
farming_vegetableconf.sprite["Cauliflowers"] = {
"vegetation_farming_01_16",
"vegetation_farming_01_17",
"vegetation_farming_01_18",
"vegetation_farming_01_19",
"vegetation_farming_01_20",
"vegetation_farming_01_21",
"vegetation_farming_01_22",
"vegetation_farming_01_23"
}
farming_vegetableconf.sprite["Lemongrass"] = {
"vegetation_farming_01_40",
"vegetation_farming_01_41",
"sffarming_01_07",
"sffarming_01_07",
"sffarming_01_08",
"sffarming_01_09",
"sffarming_01_10",
"sffarming_01_11",
}
farming_vegetableconf.sprite["Lettuce"] = {
"vegetation_farming_01_16",
"vegetation_farming_01_17",
"vegetation_farming_01_18",
"vegetation_farming_01_19",
"vegetation_farming_01_20",
"vegetation_farming_01_21",
"vegetation_farming_01_22",
"vegetation_farming_01_23"
}
farming_vegetableconf.sprite["Tea"] = {
"sffarming_01_18",
"sffarming_01_12",
"sffarming_01_13",
"sffarming_01_14",
"sffarming_01_15",
"sffarming_01_16",
"sffarming_01_17",
"sffarming_01_17",
}
farming_vegetableconf.sprite["Wheat"] = {
"vegetation_farming_01_17",
"sffarming_01_01",
"sffarming_01_02",
"sffarming_01_03",
"sffarming_01_04",
"sffarming_01_05",
"sffarming_01_06",
"sffarming_01_06",
}