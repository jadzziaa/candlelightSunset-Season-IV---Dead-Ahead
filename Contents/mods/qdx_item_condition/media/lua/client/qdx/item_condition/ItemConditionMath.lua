ItemCondition = ItemCondition or {}
ItemCondition.Math = ItemCondition.Math or {}

function ItemCondition.Math:Clamp(a_value, a_min, a_max)
	if (a_min > a_max) then
        a_min, a_max = a_max, a_min
    end

	return math.min(math.max(a_value, a_min), a_max);
end
