
-- ModData.request("trueActionsData")
-- ModData.getOrCreate("trueActionsData")
-- ModData.get("trueActionsData")["trueActionsData"] = "sit"
-- ModData.transmit("trueActionsData")

-- TrueActionsOnReceiveGlobalModData = function(_module, _packet)
    -- if _module ~= "trueActionsData" then return; end;
    -- print("SERVER" .. _module)
    -- if (not _packet) then
        -- print("aborted OnReceiveGlobalModData in trueClient "
                -- .. (_packet or "missing _packet."));
    -- else
        -- ModData.add(_module, _packet);
    -- end;
-- end

-- Events.OnReceiveGlobalModData.Add(TrueActionsOnReceiveGlobalModData);

