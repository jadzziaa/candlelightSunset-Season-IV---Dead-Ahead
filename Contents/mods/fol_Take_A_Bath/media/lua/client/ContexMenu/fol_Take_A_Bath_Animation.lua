require "TimedActions/ISBaseTimedAction"

Fol_Take_A_Bath_Action = ISBaseTimedAction:derive("Fol_Take_A_Bath_Action");
local tub_part=""
local tub
local posit_correct=0.1
local Consume_water
local Object_water
local Object_water2
local square
local square2
local WaterSprites
local WaterSprites2
local player_X
local player_Y
local old_player_X
local old_player_Y
function Fol_Take_A_Bath_Action:isValid() -- Check if the action can be done
    return true;
end
local i =0
local  number_Sprite=0
local spriteName="fol_tub_A_1"

local function setPlayerXY (player,_x,_y)
    player:setX(_x)
    player:setY(_y)
    player_X= player:getX() 
    player_Y= player:getY() 
end

function Fol_Take_A_Bath_Action:update() -- Trigger every game update when the action is perform
    local tub_X=tub:getSquare():getX()
    local tub_Y=tub:getSquare():getY()
        if tub_part=="Part1" then
            if player_Y-posit_correct~= tub_Y or player_X-posit_correct~=tub_X then
                setPlayerXY(self.character,tub_X+posit_correct,tub_Y+posit_correct)
            end
        elseif tub_part=="Part2" then
            if player_Y+1-posit_correct~= tub_Y or player_X-posit_correct~=tub_X then
                setPlayerXY(self.character,tub_X+posit_correct,tub_Y-1+posit_correct)
                end
        elseif tub_part=="Part3" then
            if player_Y-posit_correct~= tub_Y or player_X-posit_correct~=tub_X then
                setPlayerXY(self.character,tub_X+posit_correct,tub_Y+posit_correct)
                end
        elseif tub_part=="Part4" then
            if player_Y-posit_correct~= tub_Y or player_X+1-posit_correct~=tub_X then
                setPlayerXY(self.character,tub_X-1+posit_correct,tub_Y+posit_correct)
                end
        elseif tub_part=="Part5" or tub_part=="Part6" or tub_part=="Part7" or tub_part=="Part8"  then
            if player_X+0.3~=tub_X~= tub_Y or player_Y+0.4  then
                setPlayerXY(self.character,tub_X+0.3,tub_Y+0.4)
            end
            if i<4 then
                i=i+1
            elseif i>=4 then
                i=0
                number_Sprite=number_Sprite+1
            end
            if number_Sprite>5 then
                number_Sprite=1
            end
            Object_water:setSprite("fol_tub_"..tub_part.."_"..tostring(number_Sprite))
        end
        
    self.character:getBodyDamage():setBoredomLevel(self.character:getBodyDamage():getBoredomLevel()-0.02);
    self.character:getBodyDamage():setUnhappynessLevel(self.character:getBodyDamage():getUnhappynessLevel()-0.02);
end

function Fol_Take_A_Bath_Action:waitToStart() 
    local player_X , player_Y=self.character:getX(),self.character:getY()
    local tub_X , tub_Y=tub:getSquare():getX() , tub:getSquare():getY()
    old_player_X=player_X
    old_player_Y=player_Y
   if player_X-tub_X<=1 or player_X-tub_X>=-1 then
        if player_Y-tub_Y<=1 or player_Y-tub_Y>=-1 then   
            if tub_part=="Part1" then
                self.character:faceLocationF(self.character:getX() , self.character:getY()+0.5)
            elseif tub_part=="Part2" then
                self.character:faceLocationF(self.character:getX() , self.character:getY()+0.5)
            elseif tub_part=="Part3" then
                self.character:faceLocationF(self.character:getX() + 0.5, self.character:getY())
            elseif tub_part=="Part4" then
                self.character:faceLocationF(self.character:getX() + 0.5, self.character:getY())            
            end
        end
    end
    return self.character:shouldBeTurning()
end



function Fol_Take_A_Bath_Action:start() 
    self.character:setPrimaryHandItem(nil)
    self:setOverrideHandModels(nil, nil)
    local tub_X=tub:getSquare():getX()
    local tub_Y=tub:getSquare():getY()
    local tub_Z=tub:getSquare():getZ()
    local player_Z= self.character:getZ()
    if tub_part=="Part1" then
        setPlayerXY(self.character,tub_X+posit_correct,tub_Y+posit_correct)
        square = getCell():getGridSquare(player_X, player_Y, player_Z)
        WaterSprites = "fol_tub_A_1"
        square2 = getCell():getGridSquare(player_X, player_Y+1, player_Z)
        WaterSprites2 = "fol_tub_A_2"
        self:setActionAnim("fol_Bath_1")
    elseif tub_part=="Part2" then
        setPlayerXY(self.character,tub_X+posit_correct,tub_Y-1+posit_correct)
        square = getCell():getGridSquare(player_X, player_Y, player_Z)
        WaterSprites = "fol_tub_A_1"
        square2 = getCell():getGridSquare(player_X, player_Y+1, player_Z)
        WaterSprites2 = "fol_tub_A_2"
        self:setActionAnim("fol_Bath_1")
    elseif tub_part=="Part3" then
        setPlayerXY(self.character,tub_X+posit_correct,tub_Y+posit_correct)
        square = getCell():getGridSquare(player_X, player_Y, player_Z)
        WaterSprites = "fol_tub_B_1"
        square2 = getCell():getGridSquare(player_X+1, player_Y, player_Z)
        WaterSprites2 = "fol_tub_B_2"
        self:setActionAnim("fol_Bath_1")
    elseif tub_part=="Part4" then
        setPlayerXY(self.character,tub_X-1+posit_correct,tub_Y+posit_correct)
        square = getCell():getGridSquare(player_X, player_Y, player_Z)
        WaterSprites = "fol_tub_B_1"
        square2 = getCell():getGridSquare(player_X+1, player_Y, player_Z)
        WaterSprites2 = "fol_tub_B_2"
        self:setActionAnim("fol_Bath_1")
    elseif tub_part=="Part5" then
        setPlayerXY(self.character,tub_X,tub_Y)
        self.character:faceLocationF(old_player_X, old_player_Y)
        square = getCell():getGridSquare(player_X, player_Y, player_Z)
        WaterSprites = "fol_tub_Part5_1"  
        self:setActionAnim("fol_Bath_2")
    elseif tub_part=="Part6" then
        setPlayerXY(self.character,tub_X,tub_Y)
        self.character:faceLocationF(old_player_X, old_player_Y)
        square = getCell():getGridSquare(player_X, player_Y, player_Z)
        WaterSprites = "fol_tub_Part5_1"
        self:setActionAnim("fol_Bath_2")
    elseif tub_part=="Part7" then
        setPlayerXY(self.character,tub_X,tub_Y)
        self.character:faceLocationF(old_player_X, old_player_Y)
        square = getCell():getGridSquare(player_X, player_Y, player_Z)
        WaterSprites = "fol_tub_Part5_1"
        self:setActionAnim("fol_Bath_2")
    elseif tub_part=="Part8" then
        setPlayerXY(self.character,tub_X,tub_Y)
        self.character:faceLocationF(old_player_X, old_player_Y)
        square = getCell():getGridSquare(player_X, player_Y, player_Z)
        WaterSprites = "fol_tub_Part5_1"
        self:setActionAnim("fol_Bath_2")
    end
    if square~=nil  and WaterSprites ~= nil  then
        Object_water = IsoObject.new(square, WaterSprites)
        Object_water:setCustomColor(1, 1, 1, 1)
        square:AddTileObject(Object_water)
    end
    if square2~=nil  and WaterSprites2 ~= nil  then
        Object_water2 = IsoObject.new(square2, WaterSprites2)
        Object_water2:setCustomColor(1, 1, 1, 1)
        square2:AddTileObject(Object_water2)
    end
    self.character:getBodyDamage():setWetness(100);
end

function Fol_Take_A_Bath_Action:stop() -- Trigger if the action is cancel

    if square~=nil  and WaterSprites ~= nil  then
        square:RemoveTileObject(Object_water);
        square=nil
    end
    if square2~=nil  and WaterSprites2 ~= nil  then
        square2:RemoveTileObject(Object_water2);
        square2=nil
    end
    setPlayerXY(self.character,old_player_X,old_player_Y)
    ISBaseTimedAction.stop(self);
end




function Fol_Take_A_Bath_Action:perform() -- Trigger when the action is complete
    
    local visual = self.character:getHumanVisual()
    for i=1,BloodBodyPartType.MAX:index() do
        local part = BloodBodyPartType.FromIndex(i-1)
        local Blood_Value visual:getBlood(part)
        local Dirt_Value= visual:getDirt(part)
        visual:setBlood(part, 0)
        visual:setDirt(part, 0)
        setPlayerXY(self.character,old_player_X,old_player_Y)
        if i>=BloodBodyPartType.MAX:index() then
            break
        end
    end

    local ModDate_consume_water = Fol_Take_A_Bath_Config.ModOptions.options.ModDate_consume_water
    if ModDate_consume_water then
        if tub:hasWater() then     
           local waterAvailable = tub:getWaterAmount()
           tub:setWaterAmount(waterAvailable-Consume_water)
       end
    end
    self.character:getBodyDamage():decreaseBodyWetness( self.character:getBodyDamage():getWetness() /ZombRand(0,20) );
    self.character:getBodyDamage():setBoredomLevel(self.character:getBodyDamage():getBoredomLevel()-0.1);
    self.character:getBodyDamage():setUnhappynessLevel(self.character:getBodyDamage():getUnhappynessLevel()-0.1);
    self.character:getStats():setEndurance(self.character:getStats():getEndurance() + self.character:getStats():getEndurance()/ZombRand(0,5))--恢復耐力
    self.character:resetModelNextFrame();
    if square~=nil  and WaterSprites ~= nil  then
        square:RemoveTileObject(Object_water);
        square=nil
    end
    if square2~=nil  and WaterSprites2 ~= nil  then
        square2:RemoveTileObject(Object_water2);
        square2=nil
    end    
    ISBaseTimedAction.perform(self);
end

function Fol_Take_A_Bath_Action:new(character,_Object,_Part,consume_water) 
    Consume_water=consume_water
    tub_part=_Part
    tub=_Object
    local o = {};
    setmetatable(o, self);
    self.__index = self;
    o.character = character;
    o.maxTime = 500; 
    if o.character:isTimedActionInstant() then o.maxTime = 1; end
    return o;
end