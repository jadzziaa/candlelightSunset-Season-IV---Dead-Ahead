local ISRemoveWeaponUpgrade_performHook = ISRemoveWeaponUpgrade.perform
function ISRemoveWeaponUpgrade:perform()
    if self.weapon:getType() == "HuntingRifle" and self.part:getType() == "FiberglassStock" then
        self.weapon:setWeaponSprite("HuntingRifle")
    end
    if self.weapon:getType() == "VarmintRifle" and self.part:getType() == "FiberglassStock" then
        self.weapon:setWeaponSprite("R700")
    end
    ISRemoveWeaponUpgrade_performHook(self)
end

local ISUpgradeWeapon_performHook = ISUpgradeWeapon.perform
function ISUpgradeWeapon:perform()
    if self.weapon:getType() == "HuntingRifle" and self.part:getType() == "FiberglassStock" then
        self.weapon:setWeaponSprite("HuntingRifleFGS")
    end
    if self.weapon:getType() == "VarmintRifle" and self.part:getType() == "FiberglassStock" then
        self.weapon:setWeaponSprite("R700FGS")
    end
    ISUpgradeWeapon_performHook(self)
end