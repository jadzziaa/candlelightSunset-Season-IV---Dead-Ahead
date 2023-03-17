function AB_LOOT_prettyPrint(input)
    local function serialize(o, f, skip, dof, types, itab)
        itab = itab or ""
        local ntab = itab .. "    "
        if types == nil then
            types = true
        end

        if type(o) == "number" then
            f(o)
        elseif type(o) == "boolean" then
            f(o and "true" or "false")
        elseif type(o) == "string" then
            f(string.format("%q", o))
        elseif type(o) == "table" then
            f("{")
            local first = true

            if #o then
                f(" ")
                for i, v in ipairs(o) do
                    if type(v) == "string" or type(v) == "number" then
                        serialize(v, f, skip, dof, types, ntab)
                        f(", ")
                    elseif type(v) == "table" then
                        if first then
                            f("\n")
                            first = false
                        end
                        f(ntab)
                        if v.serialize then
                            v:serialize(f, skip, dof, types, ntab)
                        else
                            serialize(v, f, skip, dof, types, ntab)
                        end
                        f(",\n")
                    end
                end
            end

            first = true
            for k, v in pairs(o) do
                if type(k) == "string" and (skip == nil or (not tab.contains(skip, k))) then
                    if type(v) == "function" then
                        if dof then
                            if first then
                                f("\n")
                                first = false
                            end
                            f(ntab .. k .. " = function() end")
                            f(",\n")
                        end
                    else
                        if first then
                            f("\n")
                            first = false
                        end
                        f(ntab .. k .. " = ")

                        if type(v) == "table" and v.serialize then
                            v:serialize(f, skip, dof, types, ntab)
                        else
                            serialize(v, f, skip, dof, types, ntab)
                        end

                        f(",\n")
                    end
                end
            end

            if not first then
                f(itab)
            end
            f("}")
        end
    end

    local st = ""
    serialize(
        input,
        function(ss)
            st = st .. ss
        end
    )
    print("printab: ", st)
end
