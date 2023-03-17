require "ISUI/ISToolTipInv"

local WMT = {}

WMT.stage = 1
WMT.numRows = 0
WMT.old_y = 0

WMT.item = nil
WMT.modifierName = ""
WMT.fullItemName = ""
WMT.modifierColors = {1, 1, 1}
WMT.modifier = {}
WMT.damageText = nil
WMT.rangeText = nil
WMT.hitText = nil
WMT.critText = nil
WMT.condText = nil
WMT.breakText = nil
WMT.accText = nil
WMT.gunText = nil
WMT.soundRadiusText = nil
WMT.pushBackText = nil
WMT.speedText = nil
WMT.weaponText = "TET"
WMT.swingAimToSpeed = {
    ["Bat"] = 1, 
    ["Heavy"] = 0.6,
    ["Stab"] = 1.13,
    ["Spear"] = 1.13,
}
WMT.statsRange = {
    ["accuracy"] = 1,
    ["sound radius"] = 1,
    ["recoil"] = 1,
    ["aim time"] = 1,
    ["reload time"] = 1,
  }
WMT.statsMelee = {
    ["endurance cost"] = 1,
    ["attack speed"] = 1,
    ["knockback"] = 1,
}
WMT.statsGoodWhenNegative = {
    ["minimum range"] = 1,
    ["endurance cost"] = 1,
    ["weight"] = 1,
    ["sound radius"] = 1,
    ["recoil"] = 1,
    ["aim time"] = 1,
    ["reload time"] = 1,
}


WMT.statsTranslation = {
    damage = "Tooltip_modifier_damage",
    speed = "Tooltip_modifier_attack_speed",
    ["attack speed"] = "Tooltip_modifier_attack_speed",
    ["critical chance"] = "Tooltip_modifier_crit",
    ["minimum range"] = "Tooltip_modifier_minrange",
    ["maximum range"] = "Tooltip_modifier_maxrange",
    knockback = "Tooltip_modifier_knockback",
    ["endurance cost"] = "Tooltip_modifier_endurance_cost", 
    ["durability"] = "Tooltip_modifier_durability",
    weight = "Tooltip_modifier_weight", -- custom weight doesn't work
    accuracy = "Tooltip_modifier_accuracy",
    ["sound radius"] = "Tooltip_modifier_noise",
    recoil = "Tooltip_modifier_recoil",
    ["reload time"] = "Tooltip_modifier_reload_time",
    ["aim time"] = "Tooltip_modifier_aim_time",
    experience = "Tooltip_modifier_experience",

    capacity = "Tooltip_modifier_capacity",
    ["weight reduction"] = "Tooltip_modifier_weight_reduction",

}

function WMT.round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function WMT.setHeight(self, num, ...)
    if WMT.stage == 1 then
        WMT.stage = 2
        if not self.followMouse and self.anchorBottomLeft then
            local my = self.anchorBottomLeft.y
            local y = 0
            if WMT.modifier and WMT.modifier.modifierName and WMT.modifier.modifierName ~= getText("Tooltip_modifier_standard") then
                if self.item:isRanged() then
                    y = y + 2;
                    if self.item:getMagazineType() ~= nil then y = y + 1;  end
                    if self.item:getFireMode() ~= nil then y = y + 1;  end
                    if self.item:getAllWeaponParts():size() > 0 then
                        y = y + self.item:getAllWeaponParts():size() + 1
                    end
                end
                if self.item:getModID() ~= "pz-vanilla" then
                    y = y + 1
                end
                if self.item:isTwoHandWeapon() then
                    y = y + 1
                end
                -- if FixingManager.getFixes(self.item):size() == 0 then -- too laggy
                --     y = y - 1 
                -- end
                self.tooltip:setY(my - (WMT.numRows + y) * self.tooltip:getLineSpacing());
            else
                if self.item:isRanged() then
                    y = y + 2;
                    if self.item:getMagazineType() ~= nil then y = y + 1;  end
                    if self.item:getFireMode() ~= nil then y = y + 1;  end
                    if self.item:getAllWeaponParts():size() > 0 then
                        y = y + self.item:getAllWeaponParts():size() + 1
                    end
                end
                if self.item:getModID() ~= "pz-vanilla" then
                    y = y + 1
                end
                if self.item:isTwoHandWeapon() then
                    y = y + 1
                end
                -- if FixingManager.getFixes(self.item):size() == 0 then -- too laggy
                --     y = y - 1 
                -- end
                self.tooltip:setY(my - (WMT.numRows + y) * self.tooltip:getLineSpacing());
            end
        end
        WMT.old_y = num
        num = num + WMT.numRows * self.tooltip:getLineSpacing()
    else 
        WMT.stage = -1 --error
    end
    return WMT.ISToolTipInv.setHeight(self, num, ...)
end

WMT.ISToolTipInv = {} -- store old IsToolTipInv functions here to use them later
WMT.ISToolTipInv.render = ISToolTipInv.render
WMT.ISToolTipInv.setHeight = ISToolTipInv.setHeight
WMT.ISToolTipInv.drawRectBorder = ISToolTipInv.drawRectBorder

WMT.newDrawRectBorder = function(self, ...)
    if WMT.numRows > 0 then
        local lineSpacing = self.tooltip:getLineSpacing()
        local linePosition = lineSpacing
        -- local color = {0.68, 0.64, 0.96}
        local font = UIFont[getCore():getOptionTooltipFont()];
        if WMT.modifier and WMT.modifier.statsMultipliers then
            linePosition = linePosition + lineSpacing/2
            self.tooltip:DrawText(font, WMT.fullItemName, 5, WMT.old_y + lineSpacing/2, WMT.modifierColors[1], WMT.modifierColors[2], WMT.modifierColors[3], 1);
            if WMT.modifier.modifierName ~= getText("Tooltip_modifier_standard") then
                for k,v in pairs(WMT.modifier.statsMultipliers) do
                    local text, currentColor;
                    if k == "critical chance" then
                        if v >= 0 then
                            text = " +".. v .. " % " .. getText(WMT.statsTranslation[k])
                            currentColor = RarityColors.positiveStats
                        else
                            text = " ".. v .. " % " .. getText(WMT.statsTranslation[k])
                            currentColor = RarityColors.negativeStats
                        end
                    elseif WMT.statsRange[k] and not self.item:isRanged() or WMT.statsMelee[k] and self.item:isRanged() then
                        break
                    else
                        if v >= 1 then
                            text = " +"..WMT.round(v*100-100,2) .. " % " .. getText(WMT.statsTranslation[k])
                            if WMT.statsGoodWhenNegative[k] then
                                currentColor = RarityColors.negativeStats
                            else
                                currentColor = RarityColors.positiveStats
                            end
                        else
                            text = " "..WMT.round(v*100-100,2) .. " % " .. getText(WMT.statsTranslation[k])
                            if WMT.statsGoodWhenNegative[k] then
                                currentColor = RarityColors.positiveStats
                            else
                                currentColor = RarityColors.negativeStats
                            end
                        end
                    end
                    if k =="capacity" or k=="weight reduction" then
                        if v >= 0 then
                            text = " +".. v .. " " .. getText(WMT.statsTranslation[k])
                            currentColor = RarityColors.positiveStats
                        else
                            text = " -".. v .. " " .. getText(WMT.statsTranslation[k])
                            currentColor = RarityColors.negativeStats
                        end
                    end
                    
                    -- if k == "accuracy" and not item:isRanged() then break; end
                    self.tooltip:DrawText(font, text, 5, WMT.old_y + linePosition, currentColor[1], currentColor[2], currentColor[3], 1);
                    linePosition = linePosition + lineSpacing;
                end
            end
        else
            linePosition = linePosition - lineSpacing;
        end
        
        linePosition = linePosition + lineSpacing/2;
        local color = RarityColors.infoStats
        self.tooltip:DrawText(font, WMT.weaponText, 5, WMT.old_y + linePosition, color[1], color[2], color[3], 1);
        linePosition = linePosition + lineSpacing;
        self.tooltip:DrawText(font, WMT.damageText, 5, WMT.old_y + linePosition, color[1], color[2], color[3], 1);
        linePosition = linePosition + lineSpacing;
        if not self.item:isRanged() then
            self.tooltip:DrawText(font, WMT.speedText, 5, WMT.old_y + linePosition, color[1], color[2], color[3], 1);
            linePosition = linePosition + lineSpacing;
            self.tooltip:DrawText(font, WMT.pushBackText, 5, WMT.old_y + linePosition, color[1], color[2], color[3], 1);
            linePosition = linePosition + lineSpacing;
        end
        self.tooltip:DrawText(font, WMT.rangeText,  5, WMT.old_y + linePosition,  color[1], color[2], color[3], 1);
        linePosition = linePosition + lineSpacing;
        self.tooltip:DrawText(font, WMT.critText,   5, WMT.old_y + linePosition,  color[1], color[2], color[3], 1);
        linePosition = linePosition + lineSpacing;
        if self.item:isRanged() then
            self.tooltip:DrawText(font, WMT.accText,    5, WMT.old_y+ linePosition, color[1], color[2], color[3], 1);
            linePosition = linePosition + lineSpacing;
            self.tooltip:DrawText(font, WMT.gunText,    5, WMT.old_y+ linePosition, color[1], color[2], color[3], 1);
            linePosition = linePosition + lineSpacing;
            self.tooltip:DrawText(font, WMT.soundRadiusText,    5, WMT.old_y+ linePosition, color[1], color[2], color[3], 1);
            linePosition = linePosition + lineSpacing;
        else
            self.tooltip:DrawText(font, WMT.enduranceText,    5, WMT.old_y+ linePosition, color[1], color[2], color[3], 1);
            linePosition = linePosition + lineSpacing;
        end
        self.tooltip:DrawText(font, WMT.condText,   5, WMT.old_y + linePosition,  color[1], color[2], color[3], 1);
        linePosition = linePosition + lineSpacing;
        self.tooltip:DrawText(font, WMT.breakText,  5, WMT.old_y + linePosition,  color[1], color[2], color[3], 1);
        linePosition = linePosition + lineSpacing;

        WMT.stage = 3
    else
        WMT.stage = -1 --error
    end
    return WMT.ISToolTipInv.drawRectBorder(self, ...)
end


function ISToolTipInv:render()
    

    WMT.numRows = 0
      if self.item ~= nil then
          local item = self.item
          local player = getPlayer() or getSpecificPlayer(0)
          if item and instanceof(item, "HandWeapon") then
            if item and item:getSwingAnim() == "Throw" then
                return WMT.ISToolTipInv.render(self)
            end
            WMT.modifier = item:getModData().modifier
              if WMT.modifier then
                WMT.modifierName = WMT.modifier.modifierName or getText("Tooltip_modifier_standard");
                WMT.numRows = WMT.numRows + 1.5
                  WMT.modifierColors = WMT.modifier.fontColor or {1, 1, 1}
                  for k, v in pairs(WMT.modifier.statsMultipliers) do
                      if WMT.statsRange[k] and not item:isRanged() or WMT.statsMelee [k] and item:isRanged() 
                          then
                          -- do nothing - don't add to numRows
                      else
                        WMT.numRows = WMT.numRows + 1
                      end
                  end
                  
              else
                WMT.modifierName = getText("Tooltip_modifier_standard")
                WMT.modifierColors = {1, 1, 1}
              end
              WMT.fullItemName = item:getDisplayName()
              local weaponLevel = 0
              local category = item:getCategories()
              if category:contains("Axe") then
                  weaponLevel = player:getPerkLevel(Perks.Axe)
                  WMT.weaponText = getText("Tooltip_modifier_type")..": "..getText("IGUI_perks_Axe")
                  -- WMT.numRows = WMT.numRows + 1
                  -- treeDoorDamageText = "Tree/Door damage: "..round(item:getTreeDamage(),3).."/"..round(item:getDoorDamage(),3)
              elseif  category:contains("LongBlade") then
                  weaponLevel = player:getPerkLevel(Perks.LongBlade)
                  WMT.weaponText = getText("Tooltip_modifier_type")..": "..getText("IGUI_perks_LongBlade")
              elseif  category:contains("SmallBlade") then
                  weaponLevel = player:getPerkLevel(Perks.SmallBlade)
                  WMT.weaponText = getText("Tooltip_modifier_type")..": "..getText("IGUI_perks_SmallBlade")
              elseif  category:contains("SmallBlunt") then
                  weaponLevel = player:getPerkLevel(Perks.SmallBlunt)
                  WMT.weaponText = getText("Tooltip_modifier_type")..": "..getText("IGUI_perks_SmallBlunt")
              elseif  category:contains("Blunt") then
                  weaponLevel = player:getPerkLevel(Perks.Blunt)
                  WMT.weaponText = getText("Tooltip_modifier_type")..": "..getText("IGUI_perks_Blunt")
              elseif  category:contains("Spear") then
                  weaponLevel = player:getPerkLevel(Perks.Spear)
                  WMT.weaponText = getText("Tooltip_modifier_type")..": "..getText("IGUI_perks_Spear")
              elseif category:contains("Improvised") then
                    weaponLevel = 0
                    WMT.weaponText = getText("Tooltip_modifier_type")..": "..getText("IGUI_category_improvised")
              else
                    weaponLevel = 0
                    WMT.weaponText = getText("Tooltip_modifier_type")..": "..getText("IGUI_category_unknown")
              end
              
              local minDamage = WMT.round(item:getMinDamage(), 3)
              local maxDamage = WMT.round(item:getMaxDamage(), 3)
              local bonusDamage = 75 + 5 * player:getPerkLevel(Perks.Strength)
              if player:HasTrait("Strong") then
                  bonusDamage = bonusDamage*1.4
              elseif player:HasTrait("Weak") then
                  bonusDamage = bonusDamage*0.6
              end
              bonusDamage = bonusDamage - 100
              local minRange;
              local maxRange = WMT.round(item:getMaxRange(), 3)

              if item:isRanged() then
                minRange = WMT.round(item:getMinRangeRanged(), 3)
              else
                minRange = WMT.round(item:getMinRange(), 3)
              end
              local critChance = WMT.round(item:getCriticalChance(), 3)
              local critDmg = WMT.round(item:getCritDmgMultiplier(), 3)
              local condition = item:getCondition()
              local conditionMax = item:getConditionMax()
              local conditionLowerChance = item:getConditionLowerChance()
              WMT.numRows = WMT.numRows + 5 -- 4 + the weapon text
              WMT.damageText = getText("Tooltip_weapon_Damage")..": " .. minDamage  .. " - " .. maxDamage .. " (x" .. 30+weaponLevel*10 .."% +".. bonusDamage.."%)"
              WMT.rangeText  = getText("Tooltip_weapon_Range")..": "  .. minRange   .. " - " .. maxRange 
              WMT.critText   = getText("Tooltip_item_stats_crit")..": "   .. critChance .. "% (+" .. 3*weaponLevel .. "%), x" .. critDmg
              WMT.condText   = getText("Tooltip_weapon_Condition")..": " .. condition .. "/" .. conditionMax
              if item:isRanged() then
                WMT.weaponText = getText("Tooltip_modifier_type")..": ".. getText("IGUI_perks_Firearm")
                weaponLevel = player:getPerkLevel(Perks.Aiming)
                local hitChance = item:getHitChance()
                local aimingTime = item:getAimingTime()
                local reloadTime = item:getReloadTime()
                local recoilDelay = item:getRecoilDelay()
            
                -- Aiming modified skills
                local critModifier = item:getAimingPerkCritModifier()
                -- local minAngleModifier = item:getAimingPerkMinAngleModifier()
                local hitChanceModifier = item:getAimingPerkHitChanceModifier()
                local rangeModifier = item:getAimingPerkRangeModifier()
                local soundRadius = item:getSoundRadius()

                WMT.critText  = getText("Tooltip_item_stats_crit")..": "   .. critChance .. "% (+" .. critModifier*weaponLevel .. "%), " .. critDmg .. "x"
                WMT.rangeText = WMT.rangeText .. "(+" .. rangeModifier*weaponLevel .. ")"
                -- specific text for firearms
                WMT.accText = getText("Tooltip_item_stats_accuracy")..": " .. hitChance .. "% (+" .. hitChanceModifier*weaponLevel .. ")%"
                WMT.gunText = getText("Tooltip_item_stats_recoil_aim_reload")..": " .. aimingTime .. "/" .. reloadTime .. "/" .. recoilDelay
                WMT.soundRadiusText = getText("Tooltip_item_stats_sound_radius")..": ".. soundRadius .. " "..getText("Tooltip_item_stats_tiles")
                WMT.numRows = WMT.numRows + 3
              else
                  
                  local swingAnimSpeed = WMT.swingAimToSpeed[item:getSwingAnim()] or 1
                  local enduranceMod = item:getEnduranceMod()
                  local speed = item:getBaseSpeed()*swingAnimSpeed
                  local bonusSpeed = 0
                  if player:HasTrait("axeman") and WMT.weaponText == "Axe" then
                      bonusSpeed = bonusSpeed + 25
                  end
                  bonusSpeed = bonusSpeed + player:getPerkLevel(Perks.Fitness)*2 + weaponLevel*3
                  local bonusKnockback = -25 + 5*player:getPerkLevel(Perks.Strength)
                  WMT.pushBackText = getText("Tooltip_item_stats_knockback")..": "..WMT.round(item:getPushBackMod(), 3) .. "(+"..bonusKnockback .."%)"
                  WMT.speedText = getText("Tooltip_item_stats_attack_speed")..": ".. WMT.round(speed, 3) .. " (+"..bonusSpeed.."%)"
                  WMT.enduranceText = getText("Tooltip_item_stats_endurance_used")..": x".. WMT.round(enduranceMod, 3)
                  WMT.numRows = WMT.numRows + 3


              end
  
              local bonusConditionLowerChance = math.floor((player:getPerkLevel(Perks.Maintenance) + math.floor(weaponLevel/2))/2)*2
              WMT.numRows = WMT.numRows + 2
              WMT.breakText  = getText("Tooltip_item_stats_break_chance")..": "..getText("Tooltip_item_stats_break_chance_one_in").." " .. conditionLowerChance .. " (+"..bonusConditionLowerChance..")"
  
          elseif item and instanceof(item, "InventoryContainer") then
            -- NOT USED IN THIS VERSION
            -- WMT.modifier = item:getModData().modifier
            --   if WMT.modifier then
            --     WMT.modifierName = WMT.modifier.modifierName or getText("Tooltip_modifier_standard");
            --     WMT.numRows = WMT.numRows + 1.5
            --       WMT.modifierColors = modifier.fontColor or {1, 1, 1}
            --       for k, v in pairs(modifier.statsMultipliers) do
            --         numRows = numRows + 1
            --       end
            --   else
            --     WMT.modifierName = getText("Tooltip_modifier_standard")
            --     WMT.modifierColors = {1, 1, 1}
            --   end
            --   WMT.fullItemName = "["..WMT.modifierName.. "] "..item:getDisplayName()
  
  
              -- WMT.numRows = WMT.numRows + 2
              -- capacityText = getText("Toolt  ip_weapon_Damage")..": " .. minDamage  .. " - " .. maxDamage .. " (x" .. 30+weaponLevel*10 .."% +".. bonusDamage.."%)"
              -- weightReductionText  = getText("Tooltip_weapon_Range")..": "  .. minRange   .. " - " .. maxRange 
  
            return WMT.ISToolTipInv.render(self)
              -- return old_render(self)
          else
            return WMT.ISToolTipInv.render(self)
          end
      end


    -- if not self.followMouse then
    --     if self.anchorBottomLeft then
    --         self.tooltip:setY(self.tooltip:getY()-WMT.numRows);
    --     end
    -- end
    
    WMT.stage = 1
    
    self.setHeight = WMT.setHeight
    self.drawRectBorder = WMT.newDrawRectBorder
    WMT.ISToolTipInv.render(self)
    self.setHeight = WMT.ISToolTipInv.setHeight
    self.drawRectBorder = WMT.ISToolTipInv.drawRectBorder
end


return WMT