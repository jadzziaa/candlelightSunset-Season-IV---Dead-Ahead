
function Recipe.OnCreate.WPHaveAGoodTime(items, result, player)
	local stats = player:getStats();
	local bodyDamage = player:getBodyDamage();

	stats:setStress(stats:getStress() - 0.5);
	if stats:getStress() < 0 then
		stats:setStress(0);
	end

	stats:setFatigue(stats:getFatigue() + 0.33);
	if stats:getFatigue() > 100 then
		stats:setFatigue(100);
	end

	bodyDamage:setBoredomLevel(0);

	stats:setThirst(stats:getThirst() + 0.15);
	if stats:getThirst() > 100 then
		stats:setThirst(100);
	end

	stats:setHunger(stats:getHunger() + 0.09);
	if stats:getHunger() > 100 then
		stats:setHunger(100);
	end

	bodyDamage:setUnhappynessLevel(bodyDamage:getUnhappynessLevel() - 75);
	if bodyDamage:getUnhappynessLevel() < 0 then
		bodyDamage:setUnhappynessLevel(0);
	end

	stats:setEndurance(stats:getEndurance() - 0.25);
	if stats:getEndurance() < 0 then
		stats:setEndurance(0);
	end

    player:getXp():AddXP(Perks.Strength, 100);
    player:getXp():AddXP(Perks.Fitness, 100);
end

function Recipe.OnCreate.WPNoItem(items, result, player, selectedItem)
	local stats = player:getStats();
	stats:setStress(stats:getStress() - 0.07);
	if stats:getStress() < 0 then
		stats:setStress(0);
	end
    for i=0,items:size() - 1 do
        if items:get(i):getDisplayName() == "WPLotionResult" then
            player:getInventory():Remove(items:get(i))
        end
    end
end

function Recipe.OnCreate.WPFoldOrigami(items, result, player, selectedItem)
	local stats = player:getStats();
	local bodyDamage = player:getBodyDamage();
	stats:setStress(stats:getStress() - 0.10);
	if stats:getStress() < 0 then
		stats:setStress(0);
	end
	bodyDamage:setBoredomLevel(bodyDamage:getBoredomLevel() - 7);
	if bodyDamage:getBoredomLevel() < 0 then
		bodyDamage:setBoredomLevel(0);
	end
	bodyDamage:setUnhappynessLevel(bodyDamage:getUnhappynessLevel() - 5);
	if bodyDamage:getUnhappynessLevel() < 0 then
		bodyDamage:setUnhappynessLevel(0);
	end
	player:getXp():AddXP(Perks.Nimble, 15);
end

function Recipe.OnCreate.WPRipJournal(items, result, player)
    player:getInventory():AddItem("Base.Wire"):setUsedDelta(0.2);
end



