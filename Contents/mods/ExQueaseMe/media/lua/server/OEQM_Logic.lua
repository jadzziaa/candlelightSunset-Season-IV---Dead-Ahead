-- --------------------------------------------------------------- --
-- LOCAL "GLOBALS" ----------------------------------------------- --
--  Settings and configurations passed between functions --------- --
-- --------------------------------------------------------------- --
local activeTag = "GasMask";
local OEQM = {}
OEQM.Loading = true;                    -- Is the mod loading?
OEQM.WorkingMasks = {};                 -- Array of available gas masks
OEQM.EnableReduction = false;           -- Should dequease be enabled?
OEQM.ReduceQuease = nil;                -- How much to reduce the quease by (set on 81, used 107)
OEQM.ReduceQueaseGain = nil;            -- How much to reduce the quease gain by (set on 82, use 104)
OEQM.PreviousSickness = nil;            -- Last known sickness value

-- --------------------------------------------------------------- --
--  FUNCTIONS  --------------------------------------------------- --
-- --------------------------------------------------------------- --
ExQueaseMe = ExQueaseMe or {};          -- Our object declaration


-- --------------------------------------------------------------- --
--  ExQueaseMe.loadWorkingMasks
--      @description        Looops through all items in game that have the tag "gasmask"
--      @trigger            onLogin()
--      @params             none
--      @returns            nothing (populates OEQM.WorkingMasks)
-- --------------------------------------------------------------- --
function ExQueaseMe.loadWorkingMasks()
    masks = getScriptManager():getItemsTag(activeTag);
    if masks then
        for i=0, masks:size() -1 do
            table.insert(OEQM.WorkingMasks, masks:get(i):getFullName())
            print(masks:get(i):getFullName())
        end
    end
end


-- --------------------------------------------------------------- --
--  ExQueaseMe.isEquipped()
--      @description        Determines if a player has a mask equipped
--      @trigger            clothingUpdate() & onLogin()
--      @params             None (Uses getPlayer() and OEQM.WorkingMasks)
--      @returns            boolean
-- --------------------------------------------------------------- --
function ExQueaseMe.isEquipped()
    if getPlayer() == nil then return false; end
    inventory = getPlayer():getInventory();
    for _, type in pairs(OEQM.WorkingMasks) do
        mask = inventory:getItemFromType(type)
        if mask ~= nil then 
            if mask:isEquipped() then
                return true;
            end
        end
    end
    return false;
end


-- --------------------------------------------------------------- --
--  ExQueaseMe.clothingUpdate()
--      @description        Triggered anytime a player's clothing is updated.  Updates our equipped functionality
--      @trigger            Events.OnClothingUpdated
--      @params             ISOPlayer
--      @returns            nothing (Updates OEQM.EnableReduction)
-- --------------------------------------------------------------- --
function ExQueaseMe.clothingUpdate(player)
    if OEQM.Loading then return; end;
    OEQM.EnableReduction = ExQueaseMe.isEquipped();
end


-- --------------------------------------------------------------- --
--  ExQueaseMe.onLogin()
--      @description        Triggered when you log into the game. Enable dequease if needed
--      @trigger            Events.OnGameTimeLoaded
--      @params             none
--      @returns            nothing (Updates all OEQM settings)
-- --------------------------------------------------------------- --
function ExQueaseMe.onLogin()
    OEQM.ReduceQuease = SandboxVars.ExQueaseMe.ReduceQuease or 8;
    OEQM.ReduceQueaseGain = SandboxVars.ExQueaseMe.ReduceQueaseGain or 0.2;
    ExQueaseMe.loadWorkingMasks();
    OEQM.EnableReduction = ExQueaseMe.isEquipped();
    OEQM.Loading = false;
end


-- --------------------------------------------------------------- --
--  ExQueaseMe.reduceQuease()
--      @description        Handles the core logic for reducing Queasiness/Sickness in players
--      @trigger            Events.EveryTenMinutes
--      @params             none (uses getPlayer(), OEQM variables)
--      @returns            nothing (handles sickness reduction)
-- --------------------------------------------------------------- --
function ExQueaseMe.reduceQuease()   
    if OEQM.EnableReduction == false then return; end;
    local player = getPlayer();
    local bodyDamage = player:getBodyDamage();
    -- If you're around bodies then your sickness is reduced in gain (you can still see the gross)
    -- however if you're not around bodies, we rapidly loose queasiness
    if OEQM.PreviousSickness < bodyDamage:getFoodSicknessLevel() then
        -- Around bodies (Reduce Queasiness gain)
        bodyDamage:setFoodSicknessLevel(bodyDamage:getFoodSicknessLevel() - OEQM.ReduceQueaseGain);
    else
        -- Not around bodies (Reduce Queasiness)
        bodyDamage:setFoodSicknessLevel(bodyDamage:getFoodSicknessLevel() - OEQM.ReduceQuease);
    end
end


-- --------------------------------------------------------------- --
--  ExQueaseMe.trackSickness()
--      @description        Everytime the player updates we're just going to keep track of the previous sickness value
--                          This loosely helps us decide if you're around bodies or not.  Around bodies, sickness goes up
--                          not around bodies, sickness goes down.  Value from here used in reduceQuease
--      @triggers           Events.OnPlayerUpdate
--      @params             none
--      @returns            nothing (updates OEQM.PreviousSickness)
-- --------------------------------------------------------------- --
function ExQueaseMe.trackSickness()
    OEQM.PreviousSickness = getPlayer():getBodyDamage():getFoodSicknessLevel();
end


-- --------------------------------------------------------------- --
--  EVENTS ------------------------------------------------------- --
-- --------------------------------------------------------------- --
Events.OnPlayerUpdate.Add(ExQueaseMe.trackSickness);
Events.OnGameTimeLoaded.Add(ExQueaseMe.onLogin);
Events.OnClothingUpdated.Add(ExQueaseMe.clothingUpdate);
Events.EveryTenMinutes.Add(ExQueaseMe.reduceQuease);

-- --------------------------------------------------------------- --
--  DEBUG ------------------------------------------------------- --
-- --------------------------------------------------------------- --
-- Events.OnWeaponSwing.Add(ExQueaseMe.trackSickness);
-- Events.OnWeaponSwing.Add(ExQueaseMe.onLogin);
-- Events.OnWeaponSwing.Add(ExQueaseMe.clothingUpdate);
-- Events.OnWeaponSwing.Add(ExQueaseMe.reduceQuease);
