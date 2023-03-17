DelranUtils = {}

DelranUtils.Split = function (in_str, separator)
    if separator == nil then
        separator = ";"
    end
    local return_table = {}
    for str in string.gmatch(in_str, "([^"..separator.."]+)") do
        table.insert(return_table, str)
    end
    return return_table
end
