require "recipecode"

TCR = TCR or {};

TCR.TarotCardOptions = {
"TCR.0TheFoolFlipped",
"TCR.ITheMagicianFlipped",
"TCR.IITheHighPriestessFlipped",
"TCR.IIITheEmpressFlipped",
"TCR.IVTheEmperorFlipped",
"TCR.VTheHierophantFlipped",
"TCR.VITheLoversFlipped",
"TCR.VIITheChariotFlipped",
"TCR.VIIIStrengthFlipped",
"TCR.IXTheHermitFlipped",
"TCR.XWheelofFortuneFlipped",
"TCR.XIJusticeFlipped",
"TCR.XIITheHangedManFlipped",
"TCR.XIIIDeathFlipped",
"TCR.XIVTemperanceFlipped",
"TCR.XVTheDevilFlipped",
"TCR.XVITheTowerFlipped",
"TCR.XVIITheStarFlipped",
"TCR.XVIIITheMoonFlipped",
"TCR.XIXTheSunFlipped",
"TCR.XXJudgementFlipped",
"TCR.XXITheWorldFlipped",
"TCR.AceofCupsFlipped",
"TCR.KingofCupsFlipped",
"TCR.QueenofCupsFlipped",
"TCR.KnightofCupsFlipped",
"TCR.PageofCupsFlipped",
"TCR.CupsIIFlipped",
"TCR.CupsIIIFlipped",
"TCR.CupsIVFlipped",
"TCR.CupsVFlipped",
"TCR.CupsVIFlipped",
"TCR.CupsVIIFlipped",
"TCR.CupsVIIIFlipped",
"TCR.CupsIXFlipped",
"TCR.CupsXFlipped",
"TCR.AceofPentaclesFlipped",
"TCR.KingofPentaclesFlipped",
"TCR.QueenofPentaclesFlipped",
"TCR.KnightofPentaclesFlipped",
"TCR.PageofPentaclesFlipped",
"TCR.PentaclesIIFlipped",
"TCR.PentaclesIIIFlipped",
"TCR.PentaclesIVFlipped",
"TCR.PentaclesVFlipped",
"TCR.PentaclesVIFlipped",
"TCR.PentaclesVIIFlipped",
"TCR.PentaclesVIIIFlipped",
"TCR.PentaclesIXFlipped",
"TCR.PentaclesXFlipped",
"TCR.AceofSwordsFlipped",
"TCR.KingofSwordsFlipped",
"TCR.QueenofSwordsFlipped",
"TCR.KnightofSwordsFlipped",
"TCR.PageofSwordsFlipped",
"TCR.SwordsIIFlipped",
"TCR.SwordsIIIFlipped",
"TCR.SwordsIVFlipped",
"TCR.SwordsVFlipped",
"TCR.SwordsVIFlipped",
"TCR.SwordsVIIFlipped",
"TCR.SwordsVIIIFlipped",
"TCR.SwordsIXFlipped",
"TCR.SwordsXFlipped",
"TCR.AceofWandsFlipped",
"TCR.KingofWandsFlipped",
"TCR.QueenofWandsFlipped",
"TCR.KnightofWandsFlipped",
"TCR.PageofWandsFlipped",
"TCR.WandsIIFlipped",
"TCR.WandsIIIFlipped",
"TCR.WandsIVFlipped",
"TCR.WandsVFlipped",
"TCR.WandsVIFlipped",
"TCR.WandsVIIFlipped",
"TCR.WandsVIIIFlipped",
"TCR.WandsIXFlipped",
"TCR.WandsXFlipped"
}

function Recipe.OnCreate.Tarot1Card(items, result, player)
    local roll=ZombRand(0,#TCR.TarotCardOptions);
    player:getInventory():AddItem(TCR.TarotCardOptions[roll+1]);
end

function Recipe.OnCreate.Tarot3Card(items, result, player)
    local cardOptions = TCR.TarotCardOptions;
    local function shuffle(t)
        local n = #t
        while n > 1 do
            local k = ZombRand(1, n)
            t[n], t[k] = t[k], t[n]
            n = n - 1
        end
        return t
    end
    shuffle(cardOptions);
    player:getInventory():AddItem(cardOptions[1]);
    player:getInventory():AddItem(cardOptions[2]);
    player:getInventory():AddItem(cardOptions[3]);
end

function Recipe.OnCreate.Tarot5Card(items, result, player)
    local cardOptions = TCR.TarotCardOptions;
    local function shuffle(t)
        local n = #t
        while n > 1 do
            local k = ZombRand(1, n)
            t[n], t[k] = t[k], t[n]
            n = n - 1
        end
        return t
    end
    shuffle(cardOptions);
    player:getInventory():AddItem(cardOptions[1]);
    player:getInventory():AddItem(cardOptions[2]);
    player:getInventory():AddItem(cardOptions[3]);
    player:getInventory():AddItem(cardOptions[4]);
    player:getInventory():AddItem(cardOptions[5]);
end

function Recipe.OnCreate.Tarot7Card(items, result, player)
    local cardOptions = TCR.TarotCardOptions;
    local function shuffle(t)
        local n = #t
        while n > 1 do
            local k = ZombRand(1, n)
            t[n], t[k] = t[k], t[n]
            n = n - 1
        end
        return t
    end
    shuffle(cardOptions);
    player:getInventory():AddItem(cardOptions[1]);
    player:getInventory():AddItem(cardOptions[2]);
    player:getInventory():AddItem(cardOptions[3]);
    player:getInventory():AddItem(cardOptions[4]);
    player:getInventory():AddItem(cardOptions[5]);
    player:getInventory():AddItem(cardOptions[6]);
    player:getInventory():AddItem(cardOptions[7]);
end

function Recipe.OnCreate.Tarot10Card(items, result, player)
    local cardOptions = TCR.TarotCardOptions;
    local function shuffle(t)
        local n = #t
        while n > 1 do
            local k = ZombRand(1, n)
            t[n], t[k] = t[k], t[n]
            n = n - 1
        end
        return t
    end
    shuffle(cardOptions);
    player:getInventory():AddItem(cardOptions[1]);
    player:getInventory():AddItem(cardOptions[2]);
    player:getInventory():AddItem(cardOptions[3]);
    player:getInventory():AddItem(cardOptions[4]);
    player:getInventory():AddItem(cardOptions[5]);
    player:getInventory():AddItem(cardOptions[6]);
    player:getInventory():AddItem(cardOptions[7]);
    player:getInventory():AddItem(cardOptions[8]);
    player:getInventory():AddItem(cardOptions[9]);
    player:getInventory():AddItem(cardOptions[10]);
end

function Recipe.OnCreate.Tarot12Card(items, result, player)
    local cardOptions = TCR.TarotCardOptions;
    local function shuffle(t)
        local n = #t
        while n > 1 do
            local k = ZombRand(1, n)
            t[n], t[k] = t[k], t[n]
            n = n - 1
        end
        return t
    end
    shuffle(cardOptions);
    player:getInventory():AddItem(cardOptions[1]);
    player:getInventory():AddItem(cardOptions[2]);
    player:getInventory():AddItem(cardOptions[3]);
    player:getInventory():AddItem(cardOptions[4]);
    player:getInventory():AddItem(cardOptions[5]);
    player:getInventory():AddItem(cardOptions[6]);
    player:getInventory():AddItem(cardOptions[7]);
    player:getInventory():AddItem(cardOptions[8]);
    player:getInventory():AddItem(cardOptions[9]);
    player:getInventory():AddItem(cardOptions[10]);
    player:getInventory():AddItem(cardOptions[11]);
    player:getInventory():AddItem(cardOptions[12]);
end

function Recipe.GetItemTypes.TarotCards(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("TarotCards"));
end

function Recipe.OnCreate.FlipTarotCard(items, result, player)
    Reversed = ZombRand(2);
    if Reversed == 0 then
        player:Say("Reversed");
    end
end