function VGC_PlayGB(items, result, player)
	local bodyDamage = player:getBodyDamage()
	bodyDamage:setUnhappynessLevel(bodyDamage:getUnhappynessLevel() - 10)
	bodyDamage:setBoredomLevel(bodyDamage:getBoredomLevel() - 40)
	
	-- Set base chance for unhappiness level increase to 10%
	local chance = 10
	
	-- Generate a random number between 1 and 100
	local roll = ZombRand(1, 100)
	
	-- If the random number is less than or equal to the chance, increase the unhappiness level
	if roll <= chance then
		bodyDamage:setUnhappynessLevel(bodyDamage:getUnhappynessLevel() + 30)
	end
end

--------------------------------------------------

function VGC_BatteryOut(items, result, player)
	for i=0, items:size()-1 do
		if items:get(i):getType() == "GameBoy" then
			result:setUsedDelta(items:get(i):getUsedDelta());
			player:getInventory():AddItem("Video_Game_Consoles.GameBoy_nobat");
			break
		end
	end
end

function VGC_BatteryOut_g(items, result, player)
	for i=0, items:size()-1 do
		if items:get(i):getType() == "Game_Gear" then
			result:setUsedDelta(items:get(i):getUsedDelta());
			player:getInventory():AddItem("Video_Game_Consoles.Game_Gear_nobat");
			break
		end
	end
end

function VGC_BatteryIn(items, result, player)
	for i=0, items:size()-1 do
		if items:get(i):getType() == "Battery" then
			result:setUsedDelta(items:get(i):getUsedDelta());
			break
		end
	end
end

--------------------------------------------------

local function playerIsOnPoweredSquare(player)
    return ((SandboxVars.AllowExteriorGenerator and player:getSquare():haveElectricity()) or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier and not player:getSquare():isOutside()))
end

VGC_Scripts = VGC_Scripts or {};
VGC_Scripts.OnCanPerform = VGC_Scripts.OnCanPerform or {};

function VGC_Scripts.OnCanPerform.RequireElectricityToPerform(recipe, player, item)
    return playerIsOnPoweredSquare(player)
end