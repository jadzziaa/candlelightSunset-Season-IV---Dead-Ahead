ItemCondition = ItemCondition or {}
ItemCondition.Util = ItemCondition.Util or {}

function ItemCondition.Util:IsItemHandWeapon(a_item)
    return instanceof(a_item, "HandWeapon")
end

function ItemCondition.Util:IsItemWaterSource(a_item)
    return a_item:isWaterSource()
end

function ItemCondition.Util:GetProgressColor(a_colors, a_progress)
    local color = a_colors.P100
    if (a_progress >= 0.9) and (a_progress < 1.0) then
        color = a_colors.P090
    elseif (a_progress >= 0.8) and (a_progress < 0.9) then
        color = a_colors.P080
    elseif (a_progress >= 0.7) and (a_progress < 0.8) then
        color = a_colors.P070
    elseif (a_progress >= 0.6) and (a_progress < 0.7) then
        color = a_colors.P060
    elseif (a_progress >= 0.5) and (a_progress < 0.6) then
        color = a_colors.P050
    elseif (a_progress >= 0.4) and (a_progress < 0.5) then
        color = a_colors.P040
    elseif (a_progress >= 0.3) and (a_progress < 0.4) then
        color = a_colors.P030
    elseif (a_progress >= 0.2) and (a_progress < 0.3) then
        color = a_colors.P020
    elseif (a_progress >= 0.1) and (a_progress < 0.2) then
        color = a_colors.P010
    elseif (a_progress < 0.1) then
        color = a_colors.P000
    end

    return color
end

function ItemCondition.Util:GetItemCondition(a_item)
    local condition = 0.0
    if self:IsItemHandWeapon(a_item) then
        local percent = a_item:getCondition() / a_item:getConditionMax()
        condition = ItemCondition.Math:Clamp(percent, 0.0, 1.0)
    elseif self:IsItemWaterSource(a_item) then
        condition = ItemCondition.Math:Clamp(a_item:getUsedDelta(), 0.0, 1.0)
    end

    return condition
end

function ItemCondition.Util:GetItemConfigType(a_item)
    local configType = ItemCondition.Config.TypeDefault
    if self:IsItemWaterSource(a_item) then
        configType = ItemCondition.Config.TypeWater
    end

    return configType
end
