-- if debugScenarios == nil then
    -- debugScenarios = {}
-- end

require "TrueActionsSetting"

local playerX = 8579
local playerY = 5900

debugScenarios.IBrRusScenario_TrueActionsScen = {
    name = "True Actions Scenario",
    isCustom = true,
    -- forceLaunch = true, -- use this to force the launch of THIS scenario right after main menu was loaded, save more clicks! Don't do multiple scenarii with this options
    startLoc = {x=playerX, y=playerY, z=0 }, 
    
    setSandbox = function()
        SandboxVars.MaxFogIntensity = 0;
        SandboxVars.VehicleStoryChance = 6;
        SandboxVars.Helicopter = 1;    -- never helicopter
        SandboxVars.Zombies = 0; -- 5 = no zombies, 1 = insane (then 2 = low, 3 normal, 4 high..)
        SandboxVars.StarterKit = false;
        -- SandboxVars.WaterShutModifier = -1;
        -- SandboxVars.ElecShutModifier = -1;
        SandboxVars.DayLength = 24;
        SandboxVars.StartYear = 1;
        SandboxVars.StartMonth = 7;
        SandboxVars.StartDay = 9;
        SandboxVars.StartTime = 11;
    end,

    onStart = function()
        -- climate
        -- local clim = getClimateManager();
        -- local w = clim:getWeatherPeriod();
        -- if w:isRunning() then
            -- clim:stopWeatherAndThunder();
        -- end
        -- remove fog
        -- local var = clim:getClimateFloat(5);
        -- var:setEnableOverride(true);
        -- var:setOverride(0, 1);
        --------------------------------

        -- Player
        local playerObj = getPlayer();
        local inv = playerObj:getInventory();
        local visual = playerObj:getHumanVisual();

        playerObj:setGhostMode(true);
        -- playerObj:setGodMod(true)
        
        playerObj:clearWornItems();
        playerObj:getInventory():clear();

        -- Visual
        playerObj:setFemale(false);
        playerObj:getDescriptor():setFemale(false);
        playerObj:getDescriptor():setForename("IBrRus")
        playerObj:getDescriptor():setSurname("")
        visual:setBeardModel("Full");
        visual:setHairModel("Messy");
        local immutableColor = ImmutableColor.new(0.105, 0.09, 0.086, 1)
        visual:setHairColor(immutableColor)
        visual:setBeardColor(immutableColor)
        visual:setSkinTextureIndex(2);
        playerObj:resetModel();

        clothe = inv:AddItem("Base.Tshirt_DefaultTEXTURE_TINT");
        local color = ImmutableColor.new(0.25, 0.36, 0.36, 1)
        clothe:getVisual():setTint(color);
        playerObj:setWornItem(clothe:getBodyLocation(), clothe);
        clothe = inv:AddItem("Base.Trousers_Denim");
        clothe:getVisual():setTextureChoice(1);
        playerObj:setWornItem(clothe:getBodyLocation(), clothe);
        clothe = inv:AddItem("Base.Socks_Ankle");
        playerObj:setWornItem(clothe:getBodyLocation(), clothe);
        clothe = inv:AddItem("Base.Shoes_Black");
        playerObj:setWornItem(clothe:getBodyLocation(), clothe);
        --------------------------------------

        -- Skills
        for i=1, 10 do
            playerObj:LevelPerk(Perks.Mechanics);
        end
        

        local x = 1;
        local xmax = 30;
        local y = 1
        local ymax = 30;
        local sq = ""
        -- Sit
        -- for tileName,_ in pairs(TrueActions.WorldSeatObject) do 
            -- if x <= xmax then
                -- sq = getCell():getGridSquare(playerX+x, playerY+y, 0);
                -- x = x + 1
            -- else
                -- x = 1
                -- y = y + 2
                -- if y <= ymax then
                    -- sq = getCell():getGridSquare(playerX+x, playerY+y, 0);
                -- else 
                    -- print ("LIMIT!")
                    -- break
                -- end
                -- x = x + 1
            -- end
            
            -- obj = IsoThumpable.new(getCell(), sq, tileName, false, {}); --IsoObject.new( 
            -- -- obj:setMaxHealth(self:getObjectHealth());
            -- -- obj:setHealth(obj:getMaxHealth());
            -- -- obj:setThumpDmg(1); --zeds needed to hurt obj
            -- obj:setIsThumpable(true);
            -- obj:setBlockAllTheSquare(true);
            -- obj:setCanPassThrough(true);
            -- obj:setHoppable(false);
            -- obj:setBreakSound("BreakObject");
    
            -- sq:AddSpecialObject(obj);
            -- if isClient() then 
            -- print ("transmitCompleteItemToServer")
            -- item:transmitCompleteItemToServer(); 
            -- end
        -- end
        
        
        for tileName, data in pairs(TrueActions.WorldLieObject) do 
            if data[1].dir == "E" or data[1].dir == "W" then
                sq = getCell():getGridSquare(playerX+x, playerY-1, 0);
                x = x + 1
                obj = IsoThumpable.new(getCell(), sq, tileName, false, {}); --IsoObject.new( 
                -- obj:setIsThumpable(true);
                -- obj:setBlockAllTheSquare(true);
                -- obj:setCanPassThrough(true);
                -- obj:setHoppable(false);
                -- obj:setBreakSound("BreakObject");
                sq:AddSpecialObject(obj);
                sq = getCell():getGridSquare(playerX+x-1, playerY, 0);
                obj = IsoThumpable.new(getCell(), sq, tileName, false, {}); --IsoObject.new( 
                -- obj:setIsThumpable(true);
                -- obj:setBlockAllTheSquare(true);
                -- obj:setCanPassThrough(true);
                -- obj:setHoppable(false);
                -- obj:setBreakSound("BreakObject");
                sq:AddSpecialObject(obj);
            elseif data[1].dir == "S" or data[1].dir == "N" then
                sq = getCell():getGridSquare(playerX-1, playerY+y, 0);
                y = y + 1
                obj = IsoThumpable.new(getCell(), sq, tileName, false, {}); --IsoObject.new( 
                -- obj:setIsThumpable(true);
                -- obj:setBlockAllTheSquare(true);
                -- obj:setCanPassThrough(true);
                -- obj:setHoppable(false);
                -- obj:setBreakSound("BreakObject");
                sq:AddSpecialObject(obj);
                sq = getCell():getGridSquare(playerX, playerY+y-1, 0);
                obj = IsoThumpable.new(getCell(), sq, tileName, false, {}); --IsoObject.new( 
                -- obj:setIsThumpable(true);
                -- obj:setBlockAllTheSquare(true);
                -- obj:setCanPassThrough(true);
                -- obj:setHoppable(false);
                -- obj:setBreakSound("BreakObject");
                sq:AddSpecialObject(obj);
            end
        end
        
        -- all the perks are: Agility, Cooking, Melee, Crafting, Fitness, Strength, Blunt, Axe, Sprinting, Lightfoot, 
        --Nimble, Sneak, Woodwork, Aiming, Reloading, Farming, Survivalist, Fishing, Trapping, Passiv, Firearm, PlantScavenging, 
        --Doctor, Electricity, Blacksmith, MetalWelding, Melting, Mechanics, Spear, Maintenance, SmallBlade, LongBlade, SmallBlunt, Combat,

        -- getPlayer():getKnownRecipes():add("Basic Mechanics");
        -- getPlayer():getKnownRecipes():add("Intermediate Mechanics");
        -- getPlayer():getKnownRecipes():add("Advanced Mechanics");
        -- getPlayer():getKnownRecipes():add("Generator");

        -- Items
        playerObj:getInventory():AddItem("Base.Apple");
        playerObj:getInventory():AddItem("Base.BeerBottle");
        playerObj:getInventory():AddItem("Base.GriddlePanFriedVegetables");
        -- playerObj:getInventory():AddItem("Base.CannedChiliOpen");
        -- playerObj:getInventory():AddItem("Base.Onion");
        -- playerObj:getInventory():AddItem("Base.Lettuce");
        -- playerObj:getInventory():AddItem("Base.Pancakes");
        -- playerObj:getInventory():AddItem("Base.WineWaterFull");
        -- playerObj:getInventory():AddItem("Base.Wine2");
        playerObj:getInventory():AddItem("Base.Cigarettes");
        playerObj:getInventory():AddItem("Base.Matches");
        -- playerObj:getInventory():AddItem("Base.Hotdog");
        -- playerObj:getInventory():AddItem("Base.Lollipop");
        playerObj:getInventory():AddItem("Base.BurgerRecipe");
        playerObj:getInventory():AddItem("Base.Pop3");
        playerObj:getInventory():AddItem("Base.TVDinner");
        -- playerObj:getInventory():AddItem("Base.Watermelon");
        
        
        -- itemB = playerObj:getInventory():AddItem("Base.Battery");
        -- itemB:setUsedDelta(0)
        -- itemB = playerObj:getInventory():AddItem("Base.Battery");
        -- itemB:setUsedDelta(0)
        -- itemB = playerObj:getInventory():AddItem("Base.Battery");
        -- itemB:setUsedDelta(0)

        -- Trailers
        -- local vehY = 5785.5
        -- local vehX = 3671
        -- local yShift = 3.2
        
        -- addVehicleDebug("Base.TrailerGenerator", IsoDirections.E, nil, getCell():getGridSquare(vehX, vehY-yShift*1, 0));
        -- addVehicleDebug("Base.TrailerFirst", IsoDirections.E, nil, getCell():getGridSquare(vehX, vehY, 0));
        -- addVehicleDebug("Base.TrailerSecond", IsoDirections.E, nil, getCell():getGridSquare(vehX, vehY + yShift*1, 0));
        -- local car = addVehicleDebug("Base.TrailerHome", IsoDirections.E, nil, getCell():getGridSquare(vehX, vehY + yShift*2, 0));
        -- inv:AddItem(car:createVehicleKey());
        -- addVehicleDebug("Base.TrailerKbac", IsoDirections.E, nil, getCell():getGridSquare(vehX, vehY + yShift*3, 0));
        -- addVehicleDebug("Base.Trailer", IsoDirections.E, nil, getCell():getGridSquare(vehX, vehY + yShift*4, 0));
        -- addVehicleDebug("Base.TrailerCover", IsoDirections.E, nil, getCell():getGridSquare(vehX, vehY + yShift*5, 0));
        -- addVehicleDebug("Base.TrailerAdvert", IsoDirections.E, nil, getCell():getGridSquare(vehX, vehY + yShift*6, 0));
    
        -- Cars
        -- car = addVehicleDebug("Base.PickUpTruckMccoy", IsoDirections.E, nil, getCell():getGridSquare(3685.5, 5789, 0));
        -- car:repair();
        -- inv:AddItem(car:createVehicleKey());            
    end
}
