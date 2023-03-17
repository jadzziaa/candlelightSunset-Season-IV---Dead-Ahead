local group = AttachedLocations.getGroup("Human")
local attachments = {}
local done = {}

for _,v in pairs(NATTBackpacks) do
    if not done[v] then 
        attachments[v.."Left"] = v.."_left";
        attachments[v.."WineLeft"] = v.."_wineleft";
        attachments[v.."Right"] = v.."_right";
        attachments[v.."WineRight"] = v.."_wineright";
        attachments[v.."Bedroll"] = v.."_bedroll";
        attachments[v.."SNightstick"] = v.."_snightstick";
        attachments[v.."ulDoll"] = v.."_uldoll";
        attachments[v.."ulDogChew"] = v.."_uldogchew";
        attachments[v.."ulCatToy"] = v.."_ulcattoy";
        attachments[v.."ulToyCar"] = v.."_ultoycar";
        attachments[v.."ulRubberDucky"] = v.."_ulrubberducky";
        attachments[v.."ulToyBear"] = v.."_ultoybear";
        attachments[v.."ulYoyo"] = v.."_ulyoyo";
        attachments[v.."ulCube"] = v.."_ulcube";
        attachments[v.."ulMask"] = v.."_ulmask";
        attachments[v.."ulMaskGround"] = v.."_ulmaskground";
        attachments[v.."ulPlushie"] = v.."_ulplushie";
        attachments[v.."ulPAWSPlushie"] = v.."_ulpawsplushie";
        attachments[v.."ulBallon"] = v.."_ulballon";
        attachments[v.."ulDawn"] = v.."_uldawn";
        attachments[v.."ulWeapon"] = v.."_ulweapon";
        attachments[v.."ulSNightstick"] = v.."_ulsnightstick"; 
        attachments[v.."ulWrench"] = v.."_ulwrench";
        attachments[v.."ulWeaponPan"] = v.."_ulweaponpan";
        attachments[v.."ulWeaponSaucePan"] = v.."_ulweaponsaucepan";
        attachments[v.."ulBottle"] = v.."_ulbottle";
        attachments[v.."ulWine"] = v.."_ulwine";
        attachments[v.."Container"] = v.."_container";
        attachments[v.."ContainerSeed"] = v.."_containerseed";
        attachments[v.."ContainerTool"] = v.."_containertool";
        attachments[v.."ContainerCooler"] = v.."_containercooler";
        attachments[v.."ContainerTote"] = v.."_containertote";
        attachments[v.."ContainerTrash"] = v.."_containertrash";
        attachments[v.."ContainerSack"] = v.."_containersack";
        attachments[v.."ContainerMk"] = v.."_containermk";
        attachments[v.."ContainerSL"] = v.."_containersl";
        attachments[v.."ContainerSR"] = v.."_containersr";
        attachments[v.."ContainerSeedSL"] = v.."_containerseedsl";
        attachments[v.."ContainerSeedSR"] = v.."_containerseedsr";
        attachments[v.."ContainerSackSL"] = v.."_containersacksl";
        attachments[v.."ContainerSackSR"] = v.."_containersacksr";
        attachments[v.."urDoll"] = v.."_urdoll";
        attachments[v.."urDogChew"] = v.."_urdogchew";
        attachments[v.."urCatToy"] = v.."_urcattoy";
        attachments[v.."urToyCar"] = v.."_urtoycar";
        attachments[v.."urRubberDucky"] = v.."_urrubberducky";
        attachments[v.."urToyBear"] = v.."_urtoybear";
        attachments[v.."urYoyo"] = v.."_uryoyo";
        attachments[v.."urCube"] = v.."_urcube";
        attachments[v.."urMask"] = v.."_urmask";
        attachments[v.."urMaskGround"] = v.."_urmaskground";
        attachments[v.."urPlushie"] = v.."_urplushie";
        attachments[v.."urPAWSPlushie"] = v.."_urpawsplushie";
        attachments[v.."urBallon"] = v.."_urballon";
        attachments[v.."urDawn"] = v.."_urdawn";
        attachments[v.."urWeapon"] = v.."_urweapon";
        attachments[v.."urSNightstick"] = v.."_ursnightstick"; 
        attachments[v.."urWrench"] = v.."_urwrench";
        attachments[v.."urWeaponPan"] = v.."_urweaponpan";
        attachments[v.."urWeaponSaucePan"] = v.."_urweaponsaucepan";
        attachments[v.."urBottle"] = v.."_urbottle";
        attachments[v.."urWine"] = v.."_urwine";
        attachments[v.."Weapon"] = v.."_weapon";
        attachments[v.."Rifle"] = v.."_rifle";
        attachments[v.."WeaponBig"] = v.."_weaponbig";
        attachments[v.."WeaponShovel"] = v.."_weaponshovel";
        attachments[v.."WeaponPan"] = v.."_weaponpan";
        attachments[v.."WeaponSaucePan"] = v.."_weaponsaucepan";
        attachments[v.."Wrench"] = v.."_wrench";
        attachments[v.."Flashlight"] = v.."_flashlight";
        attachments[v.."MilitaryFlashlight"] = v.."_militaryflashlight";
        attachments[v.."PrepperFlashlight"] = v.."_prepperflashlight";
        attachments[v.."AZMilitaryFlashlight"] = v.."_azmilitaryflashlight";
        done[v] = true
    end
end

for k,v in pairs(attachments) do 
    group:getOrCreateLocation(k):setAttachmentName(v)
end