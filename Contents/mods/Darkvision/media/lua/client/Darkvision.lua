Darkvision = Darkvision or {}

Darkvision.range = 120

Darkvision.indoor = 0.5

Darkvision.outdoor = 1.0

Darkvision.limit = 0.5

Darkvision.proportion = {

    [1] = 0.0, [2] = 0.1, [3] = 0.2, [4] = 0.3, [5] = 0.4, [6] = 0.5, 
    [7] = 0.6, [8] = 0.7, [9] = 0.8, [10] = 0.9, [11] = 1.0, 

}

-- These are the default options.
Darkvision.mod = { 
    
    options = {
        indoor = 4,
        outdoor = 8,
        cone = false,
        cavedweller = false,
        limit = 6,
        override = false
    },

    names = {
        indoor = "Brightness of Indoor Vision",
        outdoor = "Brightness of Outdoor Vision",
        cone = "Reduce Brightness to Keep Vision Cone",
        cavedweller = "Only Reduce Brightness Outside",
        limit = "Brightness Limit for Cone Protection",
        override = "Traitless Darkvision (Requires Permission)"
    },

    mod_id = "Darkvision",

    mod_shortname = "Darkvision"
    
}

Darkvision.loadModOptions = function()

    -- Connecting the options to the menu, so user can change and save them.
    if ModOptions and ModOptions.getInstance then

        Darkvision.modSettings = ModOptions:getInstance(Darkvision.mod)
        
        local indoor = Darkvision.modSettings:getData("indoor")
        local outdoor = Darkvision.modSettings:getData("outdoor")
        local cone = Darkvision.modSettings:getData("cone") 
        local cavedweller = Darkvision.modSettings:getData("cavedweller") 
        local limit = Darkvision.modSettings:getData("limit") 
        local override = Darkvision.modSettings:getData("override")
        
        indoor.tooltip = "How bright should darkvision make your eyesight while you are in a building? Note that the game may sometimes report you as indoors when you are in fact exposed to the night sky, and I don't know how to prevent this; you may find that this indoor brightness level is used near buildings when you are in fact outside."
        outdoor.tooltip = "How bright should darkvision make your eyesight while you are outside?"
        cone.tooltip = "This setting attempts to prevent a quirk of darkvision that prevents you from being able to see a visibility cone. If your darkvision is too bright in the daytime, you will find that the cone of visibility (indicating what your character can see) disappears in the overall lighting of the area. When this setting is active, it will attempt to automatically lower the brightness of your darkvision to a level that will not make this cone invisible."
        cavedweller.tooltip = "Reducing visibility to prevent your cone from disappearing outside during the daytime may prevent you from seeing well in the dark during the daytime (e.g., when you are in a room with no windows and no light). This setting therefore allows players to automatically disable the dimming feature above when they are indoors." 
        limit.tooltip = "To improve the visibility of your vision cone during the daytime, you may set a maximum daytime brightness using this setting. In order for this setting to have any effect, you must enable Reduce Brightness to Keep Vision Cone (above). Note that the brightness is reduced by at least 50% during the daytime in order to ensure visibility of your cone; any further brightness would mask your cone. If you would like to exceed 50% brightness in daytime, please disable Reduce Brightness to Keep Vision Cone."
        override.tooltip = "If your server allows players who do not have the Darkvision trait to use Darkvision, you may enable it using this setting. Note that this setting cannot be used to remove Darkvision from someone who has the trait."

        indoor[1] = "0%"
        indoor[2] = "10%"
        indoor[3] = "20%"
        indoor[4] = "30%"
        indoor[5] = "40%"
        indoor[6] = "50%"
        indoor[7] = "60%"
        indoor[8] = "70%"
        indoor[9] = "80%"
        indoor[10] = "90%"
        indoor[11] = "100%"
        
        outdoor[1] = "0%"
        outdoor[2] = "10%"
        outdoor[3] = "20%"
        outdoor[4] = "30%"
        outdoor[5] = "40%"
        outdoor[6] = "50%"
        outdoor[7] = "60%"
        outdoor[8] = "70%"
        outdoor[9] = "80%"
        outdoor[10] = "90%"
        outdoor[11] = "100%"
        
        limit[1] = "0%"
        limit[2] = "10%"
        limit[3] = "20%"
        limit[4] = "30%"
        limit[5] = "40%"
        limit[6] = "50%"

        function indoor:OnApply(percent)
           
            Darkvision.apply(percent, "indoor")

        end
        
        function outdoor:OnApply(percent)
           
            Darkvision.apply(percent, "outdoor")

        end
        
        function limit:OnApply(percent)
           
            Darkvision.apply(percent, "limit")

        end

    end

end

Darkvision.loadModOptions()

Darkvision.apply = function(percent, mode)

    if mode == "indoor" then
        Darkvision.indoor = Darkvision.proportion[percent]
    elseif mode == "outdoor" then
        Darkvision.outdoor = Darkvision.proportion[percent]
    elseif mode == "limit" then
        Darkvision.limit = Darkvision.proportion[percent]
    end

end

Darkvision.light = {}

Darkvision.cell = {}

-- Debugging
-- Events.OnTick.Remove(Darkvision.eyesight)

Darkvision.extinguish = function(light, playerIndex)
    local cell = Darkvision.cell[playerIndex]
    if cell then cell:removeLamppost(light) end
    Darkvision.light[playerIndex] = nil
end

Darkvision.active = function(player)
    return player:HasTrait("Darkvision") or (SandboxVars.Darkvision.everyoneHasDarkvision and Darkvision.mod.options.override)
end

Darkvision.eyesight = function(ticks)

    if ticks % 5 ~= 0 then return end

    local range = Darkvision.range
    
    for playerIndex = 0, getNumActivePlayers() - 1 do repeat

        local player = getSpecificPlayer(playerIndex)
        
        if not player then break end

        local brightness = Darkvision.indoor

        if player:isOutside() then brightness = Darkvision.outdoor end

        if Darkvision.mod.options.cone and (player:isOutside() or not Darkvision.mod.options.cavedweller) then 
            local daylight = getClimateManager():getDayLightStrength()
            if daylight > 0 then
                brightness = math.min(brightness, Darkvision.limit, (1 - daylight) / 2)
            end
        end

        local light = Darkvision.light[playerIndex]

        if light then Darkvision.extinguish(light, playerIndex) end
        
        if not (player:isAlive() and Darkvision.active(player)) then break end
        
        local r, g, b = brightness, brightness, brightness

        Darkvision.light[playerIndex] = IsoLightSource.new(player:getX(), player:getY(), player:getZ(), r, g, b, range)

        Darkvision.cell[playerIndex] = player:getCell()

        player:getCell():addLamppost(Darkvision.light[playerIndex])

    until true end

end

Darkvision.start = function()

    Darkvision.apply(Darkvision.mod.options.indoor, "indoor")
    Darkvision.apply(Darkvision.mod.options.outdoor, "outdoor")
    Darkvision.apply(Darkvision.mod.options.limit, "limit")

    Events.OnTick.Remove(Darkvision.eyesight)
    Events.OnTick.Add(Darkvision.eyesight)

end

Events.OnCreatePlayer.Add(Darkvision.start)