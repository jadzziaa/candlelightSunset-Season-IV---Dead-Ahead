function VGC_PlayGB(items, result, player)
	player:getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() - 10);
	player:getBodyDamage():setBoredomLevel(player:getBodyDamage():getBoredomLevel() - 50);
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
    return playerIsOnPoweredSquare(player);
end