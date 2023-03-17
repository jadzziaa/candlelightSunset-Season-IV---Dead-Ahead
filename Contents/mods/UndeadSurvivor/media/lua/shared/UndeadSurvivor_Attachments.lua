--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

-- Adds attachment positions on Items

local group = AttachedLocations.getGroup("Human")
group:getOrCreateLocation("PrepperKnife"):setAttachmentName("Prepper_Vest_Knife")
group:getOrCreateLocation("PrepperFlashlight"):setAttachmentName("Prepper_Vest_Flashlight")
group:getOrCreateLocation("PrepperHolster"):setAttachmentName("Prepper_Trousers_Pistol")
group:getOrCreateLocation("GunMagazine1"):setAttachmentName("Prepper_Vest_Mag1")
group:getOrCreateLocation("GunMagazine2"):setAttachmentName("Prepper_Vest_Mag2")
group:getOrCreateLocation("GunMagazine3"):setAttachmentName("Prepper_Vest_Mag3")
group:getOrCreateLocation("GunMagazine4"):setAttachmentName("Prepper_Vest_Mag4")
group:getOrCreateLocation("Bounty Letter"):setAttachmentName("bounty_letter")

-- Add Headhunter Scope model to Vanilla and FireamsB41 Weapons

local item = ScriptManager.instance:getItem("Base.VarmintRifle")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.HuntingRifle")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.AssaultRifle")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.AssaultRifle2")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.HuntingRifle_Sawn")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.Rugerm7722")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.M24Rifle")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.M1Garand")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.FN_FAL")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.M16A2")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.AR15")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.M60")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

local item = ScriptManager.instance:getItem("Base.AK47")    
if item then 
    item:DoParam("ModelWeaponPart = HeadhunterScope Base.HeadhunterScope scope scope")
end

-- Add Attachment Type to Vanilla and FirearmsB41 Magazines (For Prepper Vest)

local item = ScriptManager.instance:getItem("Base.9mmClip")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.45Clip")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.44Clip")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.223Clip")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.308Clip")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.556Clip")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.M14Clip")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.Glock17Mag")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.MP5Mag")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.UZIMag")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.AK_Mag")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.M60Mag")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.FN_FAL_Mag")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end

local item = ScriptManager.instance:getItem("Base.Mac10Mag")    
if item then 
    item:DoParam("AttachmentType = GunMagazine")
end


-- Add Vanilla and FirearmsB41 Attachments to Headhunter Rifle

local item = ScriptManager.instance:getItem("Base.308Silencer")    
if item then 
    item:DoParam("MountOn = AssaultRifle2; M24Rifle; FN_FAL; SKS; AK47; DeadlyHeadhunterRifle; HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.ImprovisedSilencer")    
if item then 
    item:DoParam("MountOn = Pistol; Pistol2; Glock17; AR15; AssaultRifle2; M24Rifle; FN_FAL; SKS; AK47; VarmintRifle; HuntingRifle; HuntingRifle_Sawn  ; AssaultRifle; M16A2; M733; MP5; UZI; Mac10; Revolver_Short; Revolver; Revolver_Long; ColtPeacemaker; Shotgun; Mossberg500; Mossberg500Tactical; Remington870Wood; M37; SPAS12; LAW12; Winchester73; Winchester94;  Rossi92; ColtSingleAction22; ColtAnaconda; ColtPython; ColtPythonHunter; ColtAce; M1Garand; DeadlyHeadhunterRifle; HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.Silencer_PopBottle")    
if item then 
    item:DoParam("MountOn = Pistol; Pistol2; Glock17; AR15; AssaultRifle2; M24Rifle; FN_FAL; SKS; AK47; VarmintRifle; HuntingRifle; HuntingRifle_Sawn; AssaultRifle; M16A2; M733; MP5; UZI; Mac10; Revolver_Short; Revolver; Revolver_Long; ColtPeacemaker; Shotgun; Mossberg500; Mossberg500Tactical; Remington870Wood; M37; SPAS12; LAW12; Winchester73; Winchester94; Rossi92; ColtSingleAction22; ColtAnaconda; ColtPython; ColtPythonHunter; ColtAce; M1Garand; DeadlyHeadhunterRifle; HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.RecoilPad")    
if item then 
    item:DoParam("MountOn = HuntingRifle; VarmintRifle; AssaultRifle; AssaultRifle2; Base.Winchester94; Base.M24Rifle ; Shotgun; Base.Mossberg500; Base.Remington870Wood; Rugerm7722; DeadlyHeadhunterRifle; HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.ExtendedRecoilPad")    
if item then 
    item:DoParam("MountOn = HuntingRifle; VarmintRifle; M24Rifle; DeadlyHeadhunterRifle; HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.Rifle_Bipod")    
if item then 
    item:DoParam("MountOn = HuntingRifle; VarmintRifle; M24Rifle; HuntingRifle_Sawn; AssaultRifle2; FN_FAL; DeadlyHeadhunterRifle; HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.Sling")    
if item then 
    item:DoParam("MountOn = HuntingRifle; VarmintRifle; ShotgunSawnoff; AR15; AK47; SKS; Base.Winchester94; Winchester73; Base.M60; Base.HuntingRifle_Sawn; Base.Remington870Sawnoff; Shotgun; Base.Mossberg500; AssaultRifle; Base.M16A2; M733; AssaultRifle2; Base.M24Rifle; Base.Remington870Wood; Mossberg500Tactical; SPAS12; LAW12; Base.MP5; Base.UZI; Rugerm7722; FN_FAL; M1Garand; DeadlyHeadhunterRifle; HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.Sling_Leather")    
if item then 
    item:DoParam("MountOn = HuntingRifle; VarmintRifle; ShotgunSawnoff; AR15; AK47; SKS; Base.Winchester94; Winchester73; Base.M60; Base.HuntingRifle_Sawn; Base.Remington870Sawnoff; Shotgun; Base.Mossberg500; AssaultRifle; Base.M16A2; M733; AssaultRifle2; Base.M24Rifle; Base.Remington870Wood; Mossberg500Tactical; SPAS12; LAW12; Base.MP5; Base.UZI; Rugerm7722; FN_FAL; M1Garand; DeadlyHeadhunterRifle; HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.Sling_Olive")    
if item then 
    item:DoParam("MountOn = HuntingRifle; VarmintRifle; ShotgunSawnoff; AR15; AK47; SKS; Base.Winchester94; Winchester73; Base.M60; Base.HuntingRifle_Sawn; Base.Remington870Sawnoff; Shotgun; Base.Mossberg500; AssaultRifle; Base.M16A2; M733; AssaultRifle2; Base.M24Rifle; Base.Remington870Wood; Mossberg500Tactical; SPAS12; LAW12; Base.MP5; Base.UZI; Rugerm7722; FN_FAL; M1Garand; DeadlyHeadhunterRifle; HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.Sling_Camo")    
if item then 
    item:DoParam("MountOn = HuntingRifle; VarmintRifle; ShotgunSawnoff; AR15; AK47; SKS; Base.Winchester94; Winchester73; Base.M60; Base.HuntingRifle_Sawn; Base.Remington870Sawnoff; Shotgun; Base.Mossberg500; AssaultRifle; Base.M16A2; M733; AssaultRifle2; Base.M24Rifle; Base.Remington870Wood; Mossberg500Tactical; SPAS12; LAW12; Base.MP5; Base.UZI; Rugerm7722; FN_FAL; M1Garand; DeadlyHeadhunterRifle; HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.AmmoStraps")    
if item then 
    item:DoParam("MountOn = HuntingRifle; VarmintRifle; ShotgunSawnoff; AR15; AK47; SKS; Base.Winchester94; Winchester73; Base.M60; Base.HuntingRifle_Sawn; Base.Remington870Sawnoff; Shotgun; Base.Mossberg500; AssaultRifle; Base.M16A2; M733; AssaultRifle2; Base.M24Rifle; Base.Remington870Wood; Mossberg500Tactical; SPAS12; LAW12; Base.MP5; Base.UZI; Rugerm7722; FN_FAL; M1Garand; DeadlyHeadhunterRifle; HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.Laser")    
if item then 
    item:DoParam("MountOn = Pistol; Base.Glock17; Pistol2; Pistol3; AssaultRifle; AssaultRifle2; FN_FAL; M16A2; M733; AR15; M24Rifle; DeadlyHeadhunterRifle; HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.IronSight")    
if item then 
    item:DoParam("MountOn = HuntingRifle; Base.HuntingRifle_Sawn ; VarmintRifle; Pistol; Pistol2; Pistol3; Revolver; Revolver_Long; AssaultRifle; AssaultRifle2; Base.M24Rifle; Rugerm7722; DeadlyHeadhunterRifle; HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.RedDot")    
if item then 
    item:DoParam("MountOn = Pistol; Pistol2; Pistol3; Revolver; Revolver_Long; AssaultRifle; AssaultRifle2; HuntingRifle; VarmintRifle; Base.Glock17; Base.HuntingRifle_Sawn; Shotgun; ShotgunSawnoff; Base.Remington870Sawnoff; Base.Mossberg500; Mossberg500Tactical; LAW12; Base.Remington870Wood; Base.MP5; Base.UZI; Base.M24Rifle; Base.M16A2; M733; Rugerm7722; FN_FAL; DeadlyHeadhunterRifle; HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.x2Scope")    
if item then 
    item:DoParam("MountOn = HuntingRifle; VarmintRifle; Base.HuntingRifle_Sawn; AssaultRifle; Base.M60; Base.M16A2; M733; AssaultRifle2; Base.M24Rifle; Base.MP5; Base.UZI; Mossberg500Tactical; LAW12; Base.Mossberg500; Shotgun; ShotgunSawnoff; Base.Remington870Sawnoff; Base.Remington870Wood; Rugerm7722; FN_FAL; DeadlyHeadhunterRifle; HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.x4Scope")    
if item then 
    item:DoParam("MountOn = HuntingRifle; VarmintRifle; Base.HuntingRifle_Sawn; AssaultRifle; AssaultRifle2; Base.M16A2; M733; AssaultRifle2; Base.M24Rifle; Base.MP5; Mossberg500Tactical; LAW12; Rugerm7722; FN_FAL; DeadlyHeadhunterRifle; HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.x8Scope")    
if item then 
    item:DoParam("MountOn = HuntingRifle; VarmintRifle; Base.HuntingRifle_Sawn; AssaultRifle; AssaultRifle2; Base.M24Rifle; Rugerm7722; DeadlyHeadhunterRifle; HeadhunterRifle")
end

local item = ScriptManager.instance:getItem("Base.x4-x12Scope")    
if item then 
    item:DoParam("MountOn = HuntingRifle; VarmintRifle; HuntingRifle_Sawn; AssaultRifle2; M24Rifle; Rugerm7722; DeadlyHeadhunterRifle; HeadhunterRifle")
end


