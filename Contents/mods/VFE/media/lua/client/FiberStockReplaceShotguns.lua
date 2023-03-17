local ISRemoveWeaponUpgrade_performHook = ISRemoveWeaponUpgrade.perform
function ISRemoveWeaponUpgrade:perform()
    if self.weapon:getType() == "Shotgun" and self.part:getType() == "FiberglassStock" then
        self.weapon:setWeaponSprite("Shotgun")
    end
    if self.weapon:getType() == "ShotgunSawnoff" and self.part:getType() == "FiberglassStock" then
        self.weapon:setWeaponSprite("ShotgunSawnoff")
    end
    ISRemoveWeaponUpgrade_performHook(self)
end

local ISUpgradeWeapon_performHook = ISUpgradeWeapon.perform
function ISUpgradeWeapon:perform()
    if self.weapon:getType() == "Shotgun" and self.part:getType() == "FiberglassStock" then
        self.weapon:setWeaponSprite("ShotgunFGS")
    end
    if self.weapon:getType() == "ShotgunSawnoff" and self.part:getType() == "FiberglassStock" then
        self.weapon:setWeaponSprite("ShotgunSawnoffFGS")
    end
    ISUpgradeWeapon_performHook(self)
end