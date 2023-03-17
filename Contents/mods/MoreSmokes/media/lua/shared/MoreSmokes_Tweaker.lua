MoreSmokes = MoreSmokes or {};

local sVars = SandboxVars.MoreSmokes;
sVars.DryCureChange = sVars.DryCureChange or 10;

Events.OnGameStart.Add(function()
    local rotSpeed = 1;

    if SandboxVars.FoodRotSpeed == 1 then -- very fast
        rotSpeed = 1.7;
    elseif SandboxVars.FoodRotSpeed == 2 then -- fast
        rotSpeed = -1.4;
    elseif SandboxVars.FoodRotSpeed == 4 then -- slow
        rotSpeed = 0.7;
    elseif SandboxVars.FoodRotSpeed == 5 then -- very slow
        rotSpeed = 0.4;    
    end
    --this is to keep the drying and curing time close to the intended length of 7, 14, and 21 days no matter the in game settings selected

    local dryTobacco = math.ceil((2.1 * sVars.DryCureChange) * rotSpeed);
    local dryCannabis = math.ceil((0.7 * sVars.DryCureChange) * rotSpeed);
    local cureCannabis = math.ceil((1.4 * sVars.DryCureChange) * rotSpeed);

    local item1 = ScriptManager.instance:getItem("MoreSmokes.TobaccoLeaves")
    local item2 = ScriptManager.instance:getItem("MoreSmokes.BudNorthernLights")
    local item3 = ScriptManager.instance:getItem("MoreSmokes.BudPurpleHaze")
    local item4 = ScriptManager.instance:getItem("MoreSmokes.BudSourDiesel")
    local item5 = ScriptManager.instance:getItem("MoreSmokes.BudNorthernLightsCuring")
    local item6 = ScriptManager.instance:getItem("MoreSmokes.BudPurpleHazeCuring")
    local item7 = ScriptManager.instance:getItem("MoreSmokes.BudSourDieselCuring")

    if item1 then 
        item1:DoParam("DaysTotallyRotten = "  .. dryTobacco)
        item1:DoParam("DaysFresh = "  .. dryTobacco)
    end

    if item2 then
        item2:DoParam("DaysTotallyRotten = "  .. dryCannabis)
        item2:DoParam("DaysFresh = " .. dryCannabis)
    end

    if item3 then
        item3:DoParam("DaysTotallyRotten = " .. dryCannabis)
        item3:DoParam("DaysFresh = " .. dryCannabis)
    end

    if item4 then
        item4:DoParam("DaysTotallyRotten = " .. dryCannabis)
        item4:DoParam("DaysFresh = " .. dryCannabis)
    end

    if item5 then
        item5:DoParam("DaysTotallyRotten = " .. cureCannabis)
        item5:DoParam("DaysFresh = " .. cureCannabis)
    end

    if item6 then
        item6:DoParam("DaysTotallyRotten = " .. cureCannabis)
        item6:DoParam("DaysFresh = " .. cureCannabis)
    end

    if item7 then
        item7:DoParam("DaysTotallyRotten = " .. cureCannabis)
        item7:DoParam("DaysFresh = " .. cureCannabis)
    end
end);