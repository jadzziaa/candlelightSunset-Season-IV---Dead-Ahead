require "ISUI/ISCollapsableWindow";
json = require "libs/myjson";
local config = require "config";

local UI
local pbs = {false, false, false, false, false};

local stringList = {"", "", "", "", "", "", "", ""};
local valueList = {0, 0, 0, 0, 0};
local minValueList = {0, 0, 0, 0, 0};
local maxValueList = {6600, 5400, 6600, 6600, 36000};
local toggleButton = {};
-- default positions are overriden with loaded values
local savedPositions = {96, 78, 500, 600};
local uiX = 96;
local uiY = 78;

local isVisible = false;

local showBorders = true;

local function onCreateUI()

    loadPositionSettings();
    uiX = savedPositions[3];
    uiY = savedPositions[4];

    -- place toggle button on the main screen
    toggleButton = ISPanel:new(savedPositions[1], savedPositions[2], 50, 50);
    toggleButton.moveWithMouse = true;
    toggleButton.mybutton = ISButton:new(9, 9, 32, 32, "", toggleButton.mybutton, togglePillWindow);
    toggleButton.mybutton:setBorderRGBA(0,0,0,0);
    toggleButton.mybutton:forceImageSize(32,32); 
    toggleButton.mybutton:setImage(getTexture("media/textures/images/PDIcon32.png")); 
    toggleButton:addChild(toggleButton.mybutton);
    toggleButton:addToUIManager();

    -- redefine arrays because the values are somehow not loaded
    stringList[1] = getText("IGUI_PillInfoOpen");
    stringList[2] = getText("IGUI_PillInfoTitle");
    stringList[3] = getText("IGUI_NoneActiveInfo");
    stringList[4] = getText("IGUI_PillBeta");
    stringList[5] = getText("IGUI_PillPain");
    stringList[6] = getText("IGUI_PillDepr");
    stringList[7] = getText("IGUI_PillSleep");
    stringList[8] = getText("IGUI_Antibiotics");
    
    minValueList[1] = -4;
    minValueList[2] = -14;
    minValueList[3] = 0;
    minValueList[4] = -11;
    minValueList[5] = 0;

    maxValueList[1] = 6600;
    maxValueList[2] = 5400;
    maxValueList[3] = 6600;
    maxValueList[4] = 6600;
    maxValueList[5] = 36000;

    -- load settings from mod options
    showBorders = PillDuration_OPTIONS.showBorders;
    pbs[1] = PillDuration_OPTIONS.showBetaBlockerValue;
    pbs[2] = PillDuration_OPTIONS.showPainkillerValue;
    pbs[3] = PillDuration_OPTIONS.showAntiDepressantsValue;
    pbs[4] = PillDuration_OPTIONS.showSleepingTabletsValue;
    pbs[5] = PillDuration_OPTIONS.showAntibioticsValue;

    isVisible = false;
    
    if UI then
        UI:close();
        isVisible = false;
    end

    local c = getDisplayCount();
    createWindow(c);
end

function setShowBorders(val)
    showBorders = val;
    UI:closeAndRemove();
    isVisible = false;
    local c = getDisplayCount();
    createWindow(c);
    updatePillInfoWindow();
end

function togglePillWindow()
    if isVisible == false then
        updatePillInfoWindow();
        UI:open();
        isVisible = true
    else
        UI:close();
        isVisible = false;
    end
end

function createWindow(rowCount)
    UI = NewUI();
    UI:setTitle(stringList[2]);

    if rowCount == 0 then
        UI:addText("t1", stringList[3], _, "Center");
    else
        for i=1,rowCount do
            local tName = "t" .. tostring(i);
            local pbName = "pb" .. tostring(i);
            UI:addText(tName, tName, _, "Center");
            UI:addProgressBar(pbName, 0, 50, 1000);
            if i ~= rowCount then
                UI:nextLine(); 
            end
        end
    end
    if showBorders then
        UI:setBorderToAllElements(true); 
    end
    UI:saveLayout();
    UI:setPositionPixel(uiX, uiY);
    UI:close();      
    isVisible = false;
end

function everyMinute()
    updatePillInfoWindow()
end

function changePBsValue(index, val)
    UI:closeAndRemove();
    isVisible = false;
    pbs[index] = val;
    local c = getDisplayCount();
    createWindow(c);
    updatePillInfoWindow();
end

function updatePillInfoWindow()    
    local playerObject = getSpecificPlayer(0); 

    if not playerObject then
        return false
    end  

    local count = getDisplayCount();
    
    if count == 0 then
        return
    end

    valueList[1] = playerObject:getBetaEffect();
    valueList[2] = playerObject:getPainEffect();
    valueList[3] = playerObject:getDepressEffect();
    valueList[4] = playerObject:getSleepingTabletEffect();
    valueList[5] = playerObject:getReduceInfectionPower() * 720;

    local index = 1;

    for i=1,5 do
        if pbs[i] then
            local val = valueList[i];
			if val < 0 then
				val = 0;
			end
            local valMin = minValueList[i];
            local valMax = maxValueList[i];
            local mappedVal = mapRange(val, valMin, valMax, 0, 1000);
            local tName = "t" .. tostring(index);
            local pbName = "pb" .. tostring(index);
            local m = math.floor(val / 60);
            local col = mappedVal / 1000;
            UI[tName]:setText(stringList[i + 3] .. " (" .. tostring(m) .. " min)");
            UI[pbName]:setColor(1, 1 - col, col, 0);
            UI[pbName]:setValue(mappedVal);
            index = index + 1;
        end
    end
    uiX = UI:getPositionX();
    uiY = UI:getPositionY();

end

function savePositionSettings()
    -- Check if the game window instance is created, if not it means that 
    -- save was not triggered from the loaded game (new game route).
    -- get file
    print("PillDuation:  Writing button location parameters to file");
    local writer = getFileWriter("pillduration.ini", true, false)

    -- write button and window locations parameters
    local savedParameters = {};
    savedParameters["PillDurationButton"] = {
        x = toggleButton.x,
        y = toggleButton.y
    };
    savedParameters["PillDurationWindow"] = {
        x = uiX,
        y = uiY,
    };

    writer:write(json.stringify(savedParameters));
    writer:close();
end

function loadPositionSettings()
    print("PillDuation: try to read .ini file");
    local reader = getFileReader("pillduration.ini", false);
    local parameters = {};

    local loadDefaults = false;

    -- file found parse the json
    if reader then
        local line = reader:readLine();
        reader:close();

        -- we need a protection against empty file or other malformed files
        if not line or line == nil or line == "" then

            -- load default values from string 
            print("PillDuation: No .ini file found or no content");

            loadDefaults = true
        else
            parameters = json.parse(line);
            -- parsed OK but key doesnt exists
            if not parameters["PillDurationButton"] or not parameters["PillDurationWindow"] then
                loadDefaults = true;
                -- both keys exists but any member is missing
            elseif not (parameters["PillDurationButton"].x and parameters["PillDurationButton"].y and parameters["PillDurationWindow"].x and
                parameters["PillDurationWindow"].y) then
                loadDefaults = true;
            end
        end
    else
        -- no file found, load default parameters
        loadDefaults = true;
        print("PillDuation: No parameters file found");
    end

    if loadDefaults == true then
        print("PillDuation: Loading default parameters");
        savedPositions[1] = 96;
        savedPositions[2] = 78;
        savedPositions[3] = 600;
        savedPositions[4] = 500;
    else 
        savedPositions[1] = parameters["PillDurationButton"].x;
        savedPositions[2] = parameters["PillDurationButton"].y;
        savedPositions[3] = parameters["PillDurationWindow"].x;
        savedPositions[4] = parameters["PillDurationWindow"].y;

        -- check if values are within screenspace
        local xres = getCore():getScreenWidth()
        local yres = getCore():getScreenHeight()

        -- override if invalid
        if savedPositions[1] < 0 or savedPositions[1] > xres then
            savedPositions[1] = 96;
        end;

        if savedPositions[2] < 0 or savedPositions[2] > yres then
            savedPositions[2] = 78;
        end;

        if savedPositions[3] < 0 or savedPositions[3] > xres then
            savedPositions[3] = 600;
        end;

        if savedPositions[4] < 0 or savedPositions[4] > yres then
            savedPositions[4] = 500;
        end;

        print("PillDuation: Successfully loaded stored parameters");
    end
end

function updateAndShow()
    updatePillInfoWindow();
    UI:open();
    isVisible = true;
end

function getDisplayCount()
    local count = 0;
    for i=1,5 do
        if  pbs[i] == true then
            count = count + 1;
        end
    end
    return count
end

function getPillInfoUI()  
    return UI
end

pillToggleButton = ISCollapsableWindow:derive("pillToggleButton");

Events.OnCreateUI.Add(onCreateUI)
Events.OnSave.Add(savePositionSettings);
Events.EveryOneMinute.Add(everyMinute)