EggonsMU.functions.round = function(num, digits)
    digits = digits or 0
    local multiplier = 10 * digits
    -- print("num: ", num)
    -- print("multiplier: ", multiplier)
    -- print("digits: ", digits)
    return math.floor((num * multiplier + 0.5)) / multiplier
end

EggonsMU.functions.rollSuccess = function(successProbability, seed)
    seed = seed or 10000
    local roll = ZombRand(seed) + 1
    local reference = successProbability * seed
    return {success = roll <= reference, successLevel = roll / reference}
end
