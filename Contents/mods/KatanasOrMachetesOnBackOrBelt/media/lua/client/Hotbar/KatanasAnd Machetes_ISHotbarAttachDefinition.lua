require "Hotbar/ISHotbarAttachDefinition"
if not ISHotbarAttachDefinition then
    return
end
local MOD_DATA = {
    SmallBeltLeft = {
        BigBlade = "Belt Left Upside", -- defined in AttachedLocations.lua
    },
    SmallBeltRight = {
        BigBlade = "Belt Right Upside",
    },
    Back = {        
		BigBonk = "Blade On Back",
    },
    BackReplacement = {
        BigBonk = "Big Blade On Back with Bag",
    },
}
for _,t in pairs(ISHotbarAttachDefinition) do
    if t.type and MOD_DATA[t.type] then
        for k,v in pairs(MOD_DATA[t.type]) do
            if v == 0 and t.replacement then
                t.replacement[k] = nil
            elseif t.attachments then
                t.attachments[k] = v ~= 0 and v or nil
            else
                print('ERROR: Unknown mod data option.')
            end
        end
    end
end
table.remove(ISHotbarAttachDefinition.replacements);
local BackReplacement = {
	type = "Bag",
	name = "Back",
	animset = "back",
	replacement = {
		BigWeapon = "Big Weapon On Back with Bag",
        BigBonk = "Big Blade On Back with Bag",
		BigBlade = "Big Blade On Back with Bag",
		Racket = "Racket Back with Bag",
		Shovel = "Shovel Back with Bag",
		Guitar = "null",
		GuitarAcoustic = "null",
		Pan = "Pan On Back with Bag";
		Rifle = "Rifle On Back with Bag",
		Saucepan = "Saucepan Back with Bag",
		SawnOff = "Rifle On Back with Bag",
	}
}
table.insert(ISHotbarAttachDefinition.replacements, BackReplacement);