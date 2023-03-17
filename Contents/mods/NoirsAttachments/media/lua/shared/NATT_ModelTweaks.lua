require 'NATT_SupportedMods'

local sleepingbags = {
	sleepingbag = 0.65,
	sleepingbagG = 0.65,
	sleepingbagR = 0.65,
	sleepingbagO = 0.65,
	sleepingbagBK = 0.65,
	sleepingbagLB = 0.65,
	sleepingbagP = 0.65,	
}

local vanillaModels = {
	ToyBear = 0.35,
	Rubberducky = 0.5,
	HandTorch = 0.7,
	HandTorchGround = 0.25,
	TotesBag_Ground = 0.35,
	ToolBox_Ground = 0.35,
	Cooler_Ground = 0.35,
	PlasticBag_Ground = 0.35,
	GarbageBag_Ground = 0.35,
	WhiteWineBottle = 0.8,
	RedWineBottle = 0.85,
}

local function Tweaker(model,property,value)
	local modelScript = ScriptManager.instance:getModelScript(model)
	if modelScript  then 
		local name = modelScript:getName();
		modelScript:Load(name, "{".. property .. " = " .. value .. ",}");
	end
end

for k,v in pairs(vanillaModels) do 
	Tweaker(k,"scale",v)
end

if isModActivated(NATTmods.PwSleepingbags) then
	for k,v in pairs(sleepingbags) do 
		Tweaker(k,"scale",v)
	end
end