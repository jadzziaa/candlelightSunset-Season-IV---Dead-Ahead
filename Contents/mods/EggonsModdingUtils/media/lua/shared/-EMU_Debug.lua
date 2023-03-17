EggonsMU.printFuckingNormalObject = function(uselessAndPatheticLuaTable, message)
    message = message or ""
    if type(uselessAndPatheticLuaTable) ~= "table" then
        print("Not a table: " .. message .. ", but " .. type(uselessAndPatheticLuaTable))
        print(uselessAndPatheticLuaTable)
        return
    end
    local result = "\n "
    if message then
        result = result .. "******** " .. message .. " ***********"
    end
    result = result .. "\n{"
    for key, value in pairs(uselessAndPatheticLuaTable) do
        result = result .. "\n    " .. tostring(key) .. ": " .. tostring(value) .. ","
    end
    result = result .. "\n}"
    print(result)
end
