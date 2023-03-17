
-- if not (isServer()  or (not isClient() and not isServer())) then
--     return
    
-- end



local function Adjustabledayandnight_OnTick(numberTicks)
	-- getGameTime():getHour()

    -- print("day",getSandboxOptions():getOptionByName("DayandNight.Day"):getValue() )
    -- print("night",getSandboxOptions():getOptionByName("DayandNight.Night"):getValue())

    -- print(SandboxVars.DayLength)

    local gametime = getGameTime()
    local gamehour = gametime:getHour()


    local daystart = getSandboxOptions():getOptionByName("DayandNight.Daypoint"):getValue()
    local nightstart = getSandboxOptions():getOptionByName("DayandNight.Nightpoint"):getValue()

    local daysandbox = math.floor(getSandboxOptions():getOptionByName("DayandNight.Day"):getValue()*24/(24-nightstart+daystart))
    local nightsandbox = math.floor(getSandboxOptions():getOptionByName("DayandNight.Night"):getValue()*24/(nightstart-daystart))
    local daylength = gametime:getMinutesPerDay()
    

    if gamehour >= nightstart or gamehour <daystart then

        if daylength~= nightsandbox then
            print("Night!")
            gametime:setMinutesPerDay(nightsandbox)


        end
    else
        if daylength~= daysandbox then
            print("Day!")
            gametime:setMinutesPerDay(daysandbox)
        end

        


    end

    

    












end

Events.OnTick.Add(Adjustabledayandnight_OnTick)

-- print(getGameTime():getHour())











