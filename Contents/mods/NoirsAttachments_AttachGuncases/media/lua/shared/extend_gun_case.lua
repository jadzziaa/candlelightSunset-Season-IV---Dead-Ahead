local attachments = {
	PistolCase1 = "Container",
	PistolCase2 = "Container",
	PistolCase3 = "Container",
	RevolverCase1 = "Container",
	RevolverCase2 = "Container",
	RevolverCase3 = "Container",
}

local staticModels = {
	PistolCase1 = "GunCase_Ground",
	PistolCase2 = "GunCase_Ground",
	PistolCase3 = "GunCase_Ground",
	RevolverCase1 = "GunCase_Ground",
	RevolverCase2 = "GunCase_Ground",
	RevolverCase3 = "GunCase_Ground",
}

local function Tweaker(item,property,value)
	local item = ScriptManager.instance:getItem(item)
	if item then 
		item:DoParam(property.." = "..value)
	end
end

for k,v in pairs(attachments) do 
	Tweaker(k,"AttachmentType",v)
end

for k,v in pairs(staticModels) do 
	Tweaker(k,"StaticModel",v)
end