--UI for Moodle Framework
--
--add (un-)commented line below in your mod to use this
--MF.createMoodle("Proteins");


MF = MF or {}
MF.Moodles = {}--moodles map (for getPlayer only, for now)
MF.verbose = false
MF.TooLargeValue = 100000
MF.ModDataClean = false

--moodle creation for user (beware character & MF.Moodles management prohibit local coop correct handling)
function MF.createMoodle(moodleName)
    Events.OnCreatePlayer.Add(function(playerNum) MF.ISMoodle:new(moodleName,getSpecificPlayer(playerNum)) end);
end


--moodle access for user
function MF.getMoodle(moodleName)
    return MF.Moodles[moodleName];
end


MF.ISMoodle = ISUIElement:derive("ISMoodles");--Moodle UI Type


--moodle control for user
function MF.ISMoodle:setValue(value)
    if self.disable then if MF.verbose then print("MF.ISMoodle:setValue while disabled. "..self.name) end; return end--design by contract
    
    local previousLevel = self:getLevel();
    local previousGoodBadNeutral = self:getGoodBadNeutral();
    local wasWiggling = self.enableWiggle;
    
    local moodleMD = self.char:getModData().Moodles[self.name]--star optim to test
    moodleMD.Value = value;
    moodleMD.Level = self:getLevel();--auto update level
    moodleMD.GoodBadNeutral = self:getGoodBadNeutral();--auto update level
    
    if previousLevel ~= self:getLevel() or previousGoodBadNeutral ~= self:getGoodBadNeutral() then--detect upfront
        self.MoodleOscilationLevel = 1;--activate wiggle
        local sign = ""; if self:getGoodBadNeutral() == 2 then sign = "-" end
        if MF.verbose then print("Level is now "..sign..self:getLevel().." for value "..value.." and proteins="..self.char:getNutrition():getProteins()); end
    end

    if not self.addedToUIManager and self:getGoodBadNeutral() ~= 0 then
        self:addToUIManager();
        self.addedToUIManager = true;
    elseif self.addedToUIManager and self:getGoodBadNeutral() == 0 then
        self:removeFromUIManager();
        self.addedToUIManager = false;
    end
end


--moodle info for user
function MF.ISMoodle:getValue()
    if self.disable then if MF.verbose then print("MF.ISMoodle:getValue while disabled. "..self.name) end; return 0.5 end--design by contract
    
    return self.char:getModData().Moodles[self.name].Value;
end

function MF.ISMoodle:getGoodBadNeutral()
    local value = self:getValue();
    if value >= self.threasholdGood1 then return 1--good
    elseif value <= self.threasholdBad1 then return 2 --bad
    else return 0 end--neutral
end

function MF.ISMoodle:getLevel()
    local value = self:getValue();

    if value >= self.threasholdGood4 or value <= self.threasholdBad4 then
        return 4
    elseif value >= self.threasholdGood3 or value <= self.threasholdBad3 then
        return 3
    elseif value >= self.threasholdGood2 or value <= self.threasholdBad2 then
        return 2
    elseif value >= self.threasholdGood1 or value <= self.threasholdBad1 then
        return 1
    else
        return 0--neutral
    end

    return 0
end


--moodle optional overrides for user
function MF.ISMoodle:setChevronCount(chevronCount)
    self.chevronCount = chevronCount;
end

function MF.ISMoodle:setChevronIsUp(isUp)
    self.chevronIsUp = isUp;
end

function MF.ISMoodle:setThresholds(bad4, bad3, bad2, bad1, good1, good2, good3, good4)
    --handle thresholds removals with nil
    if nil == good4 then good4 = MF.TooLargeValue end
    if nil == good3 then good3 = good4 end
    if nil == good2 then good2 = good3 end
    if nil == good1 then good1 = good2 end
    if nil == bad4 then bad4 = -MF.TooLargeValue end
    if nil == bad3 then bad3 = bad4 end
    if nil == bad2 then bad2 = bad3 end
    if nil == bad1 then bad1 = bad2 end

    self.threasholdBad4 = bad4;
    self.threasholdBad3 = bad3;
    self.threasholdBad2 = bad2;
    self.threasholdBad1 = bad1;
    self.threasholdGood1 = good1;
    self.threasholdGood2 = good2;
    self.threasholdGood3 = good3;
    self.threasholdGood4 = good4;
end

function MF.ISMoodle:setTitle(goodBadNeutral,moodleLevel,text)
    if goodBadNeutral and goodBadNeutral > 0 and moodleLevel and moodleLevel > 0 and text then
        self.title[goodBadNeutral][moodleLevel] = text;
    end
end

function MF.ISMoodle:setDescritpion(goodBadNeutral,moodleLevel,text)--backward compatibility
    self:setDescription(goodBadNeutral,moodleLevel,text)
end 
function MF.ISMoodle:setDescription(goodBadNeutral,moodleLevel,text)
    if goodBadNeutral and goodBadNeutral > 0 and moodleLevel and moodleLevel > 0 and text then
        self.desc[goodBadNeutral][moodleLevel] = text;
    end
end

function MF.ISMoodle:setBackground(goodBadNeutral,moodleLevel,texture)
    if goodBadNeutral and goodBadNeutral > 0 and moodleLevel and moodleLevel > 0 and texture then
        self.bkg[goodBadNeutral][moodleLevel] = texture;
    end
end

function MF.ISMoodle:setPicture(goodBadNeutral,moodleLevel,texture)
    if goodBadNeutral and goodBadNeutral > 0 and moodleLevel and moodleLevel > 0 and texture then
        self.pics[goodBadNeutral][moodleLevel] = texture;
    end
end

function MF.ISMoodle:doWiggle()
    if self:getGoodBadNeutral() ~= 0 then
        self.MoodleOscilationLevel = 1;
    end
end

--moodle interface 2 (useless for client)
function MF.ISMoodle:getTitle(goodBadNeutral,moodleLevel)--the point here is to create on use, once
    if goodBadNeutral and goodBadNeutral > 0 and moodleLevel and moodleLevel > 0 then
        if self.title and self.title[goodBadNeutral] and self.title[goodBadNeutral][moodleLevel] then return self.title[goodBadNeutral][moodleLevel] end
        if not self.title then self.title = {} end
        
        for alignement=1, goodBadNeutral do
            if not self.title[alignement] then self.title[alignement] = {} end
        end
        for level=1, moodleLevel do
            if not self.title[goodBadNeutral][level] then self.title[goodBadNeutral][level] = false end--I hope it creates empty slots
        end
        local alignementStr = "Good"
        if goodBadNeutral == 2 then alignementStr = "Bad" end
        if not self.title[goodBadNeutral][moodleLevel] then self.title[goodBadNeutral][moodleLevel] = getText("Moodles_"..self.name.."_"..alignementStr.."_lvl"..moodleLevel) end
        return self.title[goodBadNeutral][moodleLevel];
    end
    return nil;
end

function MF.ISMoodle:getDescription(goodBadNeutral,moodleLevel)--the point here is to create on use, once
    if goodBadNeutral and goodBadNeutral > 0 and moodleLevel and moodleLevel > 0 then
        if self.desc and self.desc[goodBadNeutral] and self.desc[goodBadNeutral][moodleLevel] then return self.desc[goodBadNeutral][moodleLevel] end
        if not self.desc then self.desc = {} end
        
        for alignement=1, goodBadNeutral do
            if not self.desc[alignement] then self.desc[alignement] = {} end
        end
        for level=1, moodleLevel do
            if not self.desc[goodBadNeutral][level] then self.desc[goodBadNeutral][level] = false end--I hope it creates empty slot
        end
        local alignementStr = "Good"
        if goodBadNeutral == 2 then alignementStr = "Bad" end
        if not self.desc[goodBadNeutral][moodleLevel] then self.desc[goodBadNeutral][moodleLevel] = getText("Moodles_"..self.name.."_"..alignementStr.."_desc_lvl"..moodleLevel) end
        return self.desc[goodBadNeutral][moodleLevel];
    end
    return nil;
end

--moodle internals
function MF.ISMoodle:updateOscilatorXOffset()
    if self.MoodleOscilationLevel > 0 then
        local fpsFrac = PerformanceSettings.getLockFPS() / 30.0;
        if not fpsFrac or fpsFrac <= 0 then fpsFrac = 1 end
        
        self.MoodleOscilationLevel = self.MoodleOscilationLevel - self.MoodleOscilationLevel * (1.0 - self.OscilatorDecelerator) / fpsFrac;
        if self.MoodleOscilationLevel < 0.015 then self.MoodleOscilationLevel = 0 end--saturate like MoodlesUI.java
        if self.MoodleOscilationLevel > 0 then
            self.OscilatorStep = self.OscilatorStep + self.OscilatorRate / fpsFrac;
            local Oscilator = math.sin(self.OscilatorStep);
            self.OscilatorXOffset = Oscilator * self.OscilatorScalar * self.MoodleOscilationLevel;
        else
            self.OscilatorXOffset = 0
            self.OscilatorStep    = 0
        end
    end
end

function MF.ISMoodle:render()
    local goodBadNeutral = self:getGoodBadNeutral()
    if goodBadNeutral ~= 0 and not self.disable then

        self:updateOscilatorXOffset()
        local wiggleOffset = self.OscilatorXOffset
        
        local x, y = self:getXYPosition();
        if y ~= self:getY() then self:setY(y) end
        if x ~= self:getX() then self:setX(x) end
        
        local moodleLevel = self:getLevel();
        
        --moodle texture background
        self:drawTexture(self.bkg[goodBadNeutral][moodleLevel], wiggleOffset, 0, 1, 1, 1, 1);
        
        --moodle tooltip
        self:mouseOverMoodle(goodBadNeutral,moodleLevel);

        --moodle picture
        self:drawTexture(self:getPicture(goodBadNeutral,moodleLevel), wiggleOffset, 0, 1, 1, 1, 1);

        --moodle chevrons
        for nbChevron =1, self.chevronCount do
            local chevronYOffset = nbChevron * 4;
            if self.chevronIsUp then
                self:drawTexture(self.chevronUp,       16+wiggleOffset, 20 - chevronYOffset, 1,1,1,1);
                self:drawTexture(self.chevronUpBorder, 16+wiggleOffset, 20 - chevronYOffset, 1,1,1,1);
            else
                self:drawTexture(self.chevronDown,       16+wiggleOffset, 20 - chevronYOffset, 1,1,1,1);
                self:drawTexture(self.chevronDownBorder, 16+wiggleOffset, 20 - chevronYOffset, 1,1,1,1);
            end
        end
    end
end

function MF.ISMoodle:getPicture(goodBadNeutral,moodleLevel)
    if self.pics[goodBadNeutral][moodleLevel] ~= nil then return self.pics[goodBadNeutral][moodleLevel]; end--override
    return self.pic;--default
end

--compensates vanilla bug of missing the top or botton moodle in its java item
function MF.ISMoodle:isMouseOverMoodle()
    local estimatedX = 30
    local estimatedY = 30
    local x = getMouseX();
    if x >= self:getX() then
        if x <= self:getX() + estimatedX then--todo check size
            local y = getMouseY();
            if y >= self:getY() then
                if y <= self:getY() + estimatedY then--todo check size
                    return true;
                end
            end
        end
    end
    return false;
end

function MF.ISMoodle:mouseOverMoodle(goodBadNeutral,moodleLevel)
    if self:isMouseOver() or self:isMouseOverMoodle() then
        local title = self:getTitle(goodBadNeutral,moodleLevel);
        local description = self:getDescription(goodBadNeutral,moodleLevel);
        
        local rectWidth = 5;--TODO check it's compatible with all display settings: yes it seems
        local titleLength = getTextManager():MeasureStringX(UIFont.Small, title) + 7;
        local descriptionLength = getTextManager():MeasureStringX(UIFont.Small, description) + 7;
        local textLength = titleLength;
        if descriptionLength > textLength then textLength = descriptionLength end
        
        local titleHeight = getTextManager():MeasureStringY(UIFont.Small, title);
        local descriptionHeight = getTextManager():MeasureStringY(UIFont.Small, description);
        local heightPadding = 2
        local rectHeight = titleHeight+descriptionHeight+heightPadding*3;
        
        self:drawRect(-4 - (rectWidth + textLength), 0, rectWidth + textLength, rectHeight, 0.6, 0, 0, 0);
        self:drawTextRight(title, -10, heightPadding, 1, 1, 1, 1);
        self:drawTextRight(description, -10, titleHeight+heightPadding*2, 1, 1, 1, 0.7);
    end
end

function MF.ISMoodle:getXYPosition()
    local x = (getCore():getScreenWidth() - self:getWidth()) - 19;
    local y = 101;--y of first moodle

    if self.disable then if MF.verbose then print("MF.ISMoodle:getXYPosition while disabled. "..self.name) end; return x,y; end--design by contract
    
    if self:getLevel() ~= 0 then--bypass when not displayed (this is bad design)
        for i = 0, 23 do--vanilla moodles first
            if self.char:getMoodles():getMoodleLevel(MoodleType.FromIndex(i)) ~= 0 then
                y = y + 36;
            end
        end
        
        local aiteronMM = self.char:getModData().MoodleManager;--aiteron moodles second
        if aiteronMM and aiteronMM.moodles then
            local nbMoodlesAiteron = 0
            for _, moodleObj in pairs(aiteronMM.moodles) do
                --print("MF.ISMoodle:AiteronCompatibility MoodleManager "..tostring(_ or 'nil').." "..tostring(moodleObj or 'nil'));
                if moodleObj.getLevel then--there is a fake item (_ == 1) in moodles that has no getLevel
                    local lvl = moodleObj:getLevel()
                    if lvl > 0 then
                        nbMoodlesAiteron = nbMoodlesAiteron + 1
                        y = y + 36;
                    end
                end
            end
            --print("MF.ISMoodle:AiteronCompatibility MoodleManager "..nbMoodlesAiteron.." moodles");
        else
            --print("MF.ISMoodle:AiteronCompatibility no MoodleManager");
        end

        for k, v in pairs(self.char:getModData().Moodles) do--modded moodles then
            if k == self.name then
                break--found
            else
                if v.Level ~= 0 then--this is why we need to share level in player mod data
                    y = y + 36;
                end
            end
        end
    end

    return x, y
end

function MF.ISMoodle:new(moodleName,character)
    --init player mod data
    if not MF.ModDataClean then
        character:getModData().Moodles = {};--first moodle cleans the memory
        MF.ModDataClean = true;
    else
        character:getModData().Moodles = character:getModData().Moodles or {};--other moodles do nothing
    end
    
    if character:getModData().Moodles[moodleName] == nil then
        character:getModData().Moodles[moodleName] = {};
        character:getModData().Moodles[moodleName].Level = 0;
        character:getModData().Moodles[moodleName].GoodBadNeutral = 0;--0=Neutral, 1=Good, 2=Bad
        character:getModData().Moodles[moodleName].Value = 0.5;
    end
    
    local o = {};
    local width = 31;
    local height = 31;
    o = ISUIElement:new(0, 0, width, height);
    setmetatable(o, self);
    self.__index = self;
    
    o.name = moodleName;
    o.char = character;
    o.disable = false;
    
    o:setThresholds(0.1,0.2,0.3,0.4,   0.6,0.7,0.8,0.9)--from bad4 to good4 0 is always the worse (TODO add sign inversion option)
    
    --wiggle (oscilator)
    o.MoodleOscilationLevel = 0;--TODO modify it depending on gravity ? (to get proportional players attention)
    o.OscilatorScalar = 15.6;--must be the same as MoodleUI.java
    o.OscilatorDecelerator = 0.84;--should be the same as MoodleUI.java 0.96 but it seems too slow.
    o.OscilatorRate = 0.8;--must be the same as MoodleUI.java
    o.OscilatorStep = 0;
    o.OscilatorXOffset = 0;
    
    --main settings
    local x, y = o:getXYPosition();
    o:setX(x);
    o:setY(y);
    o.borderColor = {r=0, g=0, b=0, a=0};
    o.backgroundColor = {r=0, g=0, b=0, a=0};

    o:initialise();--required ?
    
    
    --cache (for potential override)
    o:handleCacheOverride()
    
    o.onPlayerDeathFunc = function(player) if player == o.char then o:removeFromUIManager(); o:suspend() end end
    
    --avoid multiple death event stack
    local old = MF.Moodles[self.name];
    if old and old.onPlayerDeathFunc then Events.OnPlayerDeath.Remove(old.onPlayerDeathFunc); end
    
    Events.OnPlayerDeath.Add(o.onPlayerDeathFunc)--disconnect from rendering on player death
    
    MF.Moodles[moodleName] = o;--keep track in the map for external use and for override propagation after character death
    
    return o;
end

--at character death we want the user to not bother managing the fact the moodle makes no sens until new character creation
function MF.ISMoodle:suspend()
    self.disable = true;
end
function MF.ISMoodle:activate()--in case we want to pause it
    self.disable = false;
end

function MF.ISMoodle:handleCacheOverride()
    local old = MF.Moodles[self.name];
    if not old then--initially we load default setup
        self.chevronCount = 0;
        self.chevronIsUp = true;
        self.chevronUp = getTexture("media/ui/Moodle_chevron_up.png");
        self.chevronUpBorder = getTexture("media/ui/Moodle_chevron_up_border.png");
        self.chevronDown = getTexture("media/ui/Moodle_chevron_down.png");
        self.chevronDownBorder = getTexture("media/ui/Moodle_chevron_down_border.png");
        local good = 1;
        local bad = 2;
        self.pic = getTexture("media/ui/"..self.name..".png")--moodle picture (default)
        self.title = {}; self.title[good] = {}; self.title[bad] = {};--title text
        self.desc = {}; self.desc[good] = {}; self.desc[bad] = {};--description text
        self.bkg = {}; self.bkg[good] = {}; self.bkg[bad] = {};--background textures
        self.pics = {}; self.pics[good] = {}; self.pics[bad] = {};--override pictures textures
        for moodleLevel=1, 4 do
            self.title[good][moodleLevel] = false
            self.title[bad][moodleLevel]  = false
            self.desc[good][moodleLevel]  = false
            self.desc[bad][moodleLevel]   = false
            self.bkg[good][moodleLevel]   = getTexture("media/ui/Moodle_Bkg_Good_"..moodleLevel..".png")
            self.bkg[bad][moodleLevel]    = getTexture("media/ui/Moodle_Bkg_Bad_"..moodleLevel..".png")
            self.pics[good][moodleLevel]  = getTexture("media/ui/"..self.name.."_Good_"..moodleLevel..".png")
            self.pics[bad][moodleLevel]   = getTexture("media/ui/"..self.name.."_Bad_"..moodleLevel..".png")
        end
    else--afterwards we copy the same setup in order to keep potential user overrides
        self.chevronCount = old.chevronCount;
        self.chevronIsUp = old.chevronIsUp;
        self.chevronUp = old.chevronUp;
        self.chevronUpBorder = old.chevronUpBorder;
        self.chevronDown = old.chevronDown;
        self.chevronDownBorder = old.chevronDownBorder;
        local good = 1;
        local bad = 2;
        self.pic = old.pic--moodle picture (default)
        self.title = {}; self.title[good] = {}; self.title[bad] = {};--title text
        self.desc = {}; self.desc[good] = {}; self.desc[bad] = {};--description text
        self.bkg = {}; self.bkg[good] = {}; self.bkg[bad] = {};--background textures
        self.pics = {}; self.pics[good] = {}; self.pics[bad] = {};--override pictures textures
        for moodleLevel=1, 4 do
            self.title[good][moodleLevel] = old.title[good][moodleLevel];
            self.title[bad][moodleLevel] = old.title[bad][moodleLevel];
            self.desc[good][moodleLevel] = old.desc[good][moodleLevel];
            self.desc[bad][moodleLevel] = old.desc[bad][moodleLevel];
            self.bkg[good][moodleLevel] = old.bkg[good][moodleLevel];
            self.bkg[bad][moodleLevel] = old.bkg[bad][moodleLevel];
            self.pics[good][moodleLevel] = old.pics[good][moodleLevel];
            self.pics[bad][moodleLevel] = old.pics[bad][moodleLevel];
        end
    end
end

function MF.ISMoodle:createChildren()
    ISUIElement:createChildren(self);
    
    if MF.verbose then
        local greenPanel = ISPanel:new(0,0,self.width,self.height)
        greenPanel:initialise()
        greenPanel.backgroundColor.r = 0
        greenPanel.backgroundColor.g = 1
        greenPanel.backgroundColor.b = 0
        greenPanel.backgroundColor.a = 0.5
        greenPanel.borderColor.a = 0.5
        self:addChild(greenPanel);
    end
end