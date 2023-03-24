RewardingNightCombat = RewardingNightCombat or {};

local RNC_OPTIONS = {
    indicator = {
        -- [Use your custom icon] (default: false)
        custom_icon = false,
        -- [Path of your custom icon file] (default: nil)
        -- Move your custom icon to 'media/ui/'
        -- If you have enabled 'custom_icon' option, make sure to change this to your filename
        custom_icon_path = "media/ui/rnc_custom_icon.png",
        -- [icon width] (default: 32)
        -- Change this only if you are going to use your custom icon with different width
        width = 32,
        -- [icon height] (default: 32)
        -- Change this only if you are going to use your custom icon with different height
        height = 32,
        -- [Coordinate Origin] (default: 2)
        -- 1: TOP-LEFT      => X_orig = 0, Y_orig = 0
        -- 2: TOP-RIGHT     => X_orig = <screen_width>, Y_orig = 0
        -- 3: BOTTOM-LEFT   => X_orig = 0, Y_orig = <screen_height>
        -- 4: BOTTOM-RIGHT  => X_orig = <screen_width>, Y_orig = <screen_height>
        coordinate_origin = 2,
        -- [Offset on the horizontal axis] (default: -210)
        -- For example: if value = -210 and coordinate_origin = 2
        -- X coordinate of the icon will be calculated as X = <screen_width> - 210
        x_offset = -210,
        -- [Offset on the vertical axis] (default: 12)
        -- For example: if value = 12 and coordinate_origin = 2
        -- Y coordinate of the icon will be calculated as Y = 0 + 12
        y_offset = 12,
        -- [Enable the tooltip that shows applied bonuses] (default: true)
        enable_tooltip = true,
        -- [Title text at the top of the tooltip] (default: nil)
        -- For example: you can set the value as string, = "Hello World!, below are the bonuses"
        title_text_tooltip = nil,
    },
    sounds = {
        -- [Play your custom ending sound when the RewardingNightCombat event starts]
        -- If you want to do this, make sure to move your .wav file to 'media\sound\' in the mod folder and rename it as 'rnc_custom_trigger.wav'
        -- If you have a file with .ogg format then change the file format entry in 'media\scripts\rnc_custom_sounds.txt' from .wav to .ogg
        custom_trigger_sound = false,
        -- [Play your custom ending sound when the RewardingNightCombat event finishes]
        -- If you want to do this, make sure to move your .wav file to 'media\sound\' in the mod folder and rename it as 'rnc_custom_ending.wav'
        -- If you have a file with .ogg format then change the file format entry in 'media\scripts\rnc_custom_sounds.txt' from .wav to .ogg
        custom_ending_sound = false,
    },
}

-- Do not touch below

RewardingNightCombat.options = RNC_OPTIONS;

local function getCustomIconTexture()
    if RNC_OPTIONS.indicator.custom_icon == true then
        RewardingNightCombat.options.indicator.texture = Texture.getSharedTexture(RNC_OPTIONS.indicator.custom_icon_path);
    end
end

if isServer() == false then
    Events.OnGameStart.Add(getCustomIconTexture);
end
