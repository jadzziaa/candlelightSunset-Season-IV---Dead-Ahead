ItemCondition = ItemCondition or {}
ItemCondition.Config = ItemCondition.Config or {}

ItemCondition.Config.Hotbar = {}
ItemCondition.Config.Hotbar.ProgressBarMode = 3
ItemCondition.Config.Hotbar.ProgressBarOpacity = 0.3

ItemCondition.Config.EquippedItem = {}
ItemCondition.Config.EquippedItem.ProgressBarMode = 3
ItemCondition.Config.EquippedItem.ProgressBarOpacity = 0.3

ItemCondition.Config.TypeDefault = {
    Colors = {
        P100 = { r = 0.0, g = 0.7, b = 0.0 },
        P090 = { r = 0.0, g = 0.7, b = 0.0 },
        P080 = { r = 0.0, g = 0.7, b = 0.0 },
        P070 = { r = 0.0, g = 0.7, b = 0.0 },
        P060 = { r = 1.0, g = 1.0, b = 0.0 },
        P050 = { r = 1.0, g = 1.0, b = 0.0 },
        P040 = { r = 1.0, g = 1.0, b = 0.0 },
        P030 = { r = 1.0, g = 1.0, b = 0.0 },
        P020 = { r = 1.0, g = 0.2, b = 0.2 },
        P010 = { r = 1.0, g = 0.2, b = 0.2 },
        P000 = { r = 1.0, g = 0.2, b = 0.2 },
    }
}

ItemCondition.Config.TypeWater = {
    Colors = {
        P100 = { r = 0.0, g = 0.0, b = 1.0 },
        P090 = { r = 0.0, g = 0.0, b = 1.0 },
        P080 = { r = 0.0, g = 0.0, b = 1.0 },
        P070 = { r = 0.0, g = 0.0, b = 1.0 },
        P060 = { r = 0.0, g = 0.0, b = 1.0 },
        P050 = { r = 0.0, g = 0.0, b = 1.0 },
        P040 = { r = 0.0, g = 0.0, b = 1.0 },
        P030 = { r = 0.0, g = 0.0, b = 1.0 },
        P020 = { r = 0.0, g = 0.0, b = 1.0 },
        P010 = { r = 0.0, g = 0.0, b = 1.0 },
        P000 = { r = 0.0, g = 0.0, b = 1.0 },
    }
}

if (Mod.IsMCMInstalled_v1) then
    local opts = {
        {
            id = "hotbar_progressbar_mode",
            type = "combobox",
            data = {
                "option_1",
                "option_2",
                "option_3",
                "option_4",
                "option_5",
            },
            get = ItemCondition.Config.Hotbar.ProgressBarMode,
            set = function(a_value)
                ItemCondition.Config.Hotbar.ProgressBarMode = a_value
            end,
        },
        {
            id = "hotbar_progressbar_opacity",
            type = "number_slider",
            data = {
                min = 0.1,
                max = 1.0,
                step = 0.01,
            },
            get = ItemCondition.Config.Hotbar.ProgressBarOpacity,
            set = function(a_value)
                ItemCondition.Config.Hotbar.ProgressBarOpacity = a_value
            end,
        },
        {
            id = "equippeditem_progressbar_mode",
            type = "combobox",
            data = {
                "option_1",
                "option_2",
                "option_3",
                "option_4",
                "option_5",
            },
            get = ItemCondition.Config.EquippedItem.ProgressBarMode,
            set = function(a_value)
                ItemCondition.Config.EquippedItem.ProgressBarMode = a_value
            end,
        },
        {
            id = "equippeditem_progressbar_opacity",
            type = "number_slider",
            data = {
                min = 0.1,
                max = 1.0,
                step = 0.01,
            },
            get = ItemCondition.Config.EquippedItem.ProgressBarOpacity,
            set = function(a_value)
                ItemCondition.Config.EquippedItem.ProgressBarOpacity = a_value
            end,
        },
        {
            id = "type_default_color_p100",
            type = "color",
            get = ItemCondition.Config.TypeDefault.Colors.P100,
            set = function(a_value)
                ItemCondition.Config.TypeDefault.Colors.P100 = a_value
            end,
        },
        {
            id = "type_default_color_p090",
            type = "color",
            get = ItemCondition.Config.TypeDefault.Colors.P090,
            set = function(a_value)
                ItemCondition.Config.TypeDefault.Colors.P090 = a_value
            end,
        },
        {
            id = "type_default_color_p080",
            type = "color",
            get = ItemCondition.Config.TypeDefault.Colors.P080,
            set = function(a_value)
                ItemCondition.Config.TypeDefault.Colors.P080 = a_value
            end,
        },
        {
            id = "type_default_color_p070",
            type = "color",
            get = ItemCondition.Config.TypeDefault.Colors.P070,
            set = function(a_value)
                ItemCondition.Config.TypeDefault.Colors.P070 = a_value
            end,
        },
        {
            id = "type_default_color_p060",
            type = "color",
            get = ItemCondition.Config.TypeDefault.Colors.P060,
            set = function(a_value)
                ItemCondition.Config.TypeDefault.Colors.P060 = a_value
            end,
        },
        {
            id = "type_default_color_p050",
            type = "color",
            get = ItemCondition.Config.TypeDefault.Colors.P050,
            set = function(a_value)
                ItemCondition.Config.TypeDefault.Colors.P050 = a_value
            end,
        },
        {
            id = "type_default_color_p040",
            type = "color",
            get = ItemCondition.Config.TypeDefault.Colors.P040,
            set = function(a_value)
                ItemCondition.Config.TypeDefault.Colors.P040 = a_value
            end,
        },
        {
            id = "type_default_color_p030",
            type = "color",
            get = ItemCondition.Config.TypeDefault.Colors.P030,
            set = function(a_value)
                ItemCondition.Config.TypeDefault.Colors.P030 = a_value
            end,
        },
        {
            id = "type_default_color_p020",
            type = "color",
            get = ItemCondition.Config.TypeDefault.Colors.P020,
            set = function(a_value)
                ItemCondition.Config.TypeDefault.Colors.P020 = a_value
            end,
        },
        {
            id = "type_default_color_p010",
            type = "color",
            get = ItemCondition.Config.TypeDefault.Colors.P010,
            set = function(a_value)
                ItemCondition.Config.TypeDefault.Colors.P010 = a_value
            end,
        },
        {
            id = "type_default_color_p000",
            type = "color",
            get = ItemCondition.Config.TypeDefault.Colors.P000,
            set = function(a_value)
                ItemCondition.Config.TypeDefault.Colors.P000 = a_value
            end,
        },
        {
            id = "type_water_color_p100",
            type = "color",
            get = ItemCondition.Config.TypeWater.Colors.P100,
            set = function(a_value)
                ItemCondition.Config.TypeWater.Colors.P100 = a_value
            end,
        },
        {
            id = "type_water_color_p090",
            type = "color",
            get = ItemCondition.Config.TypeWater.Colors.P090,
            set = function(a_value)
                ItemCondition.Config.TypeWater.Colors.P090 = a_value
            end,
        },
        {
            id = "type_water_color_p080",
            type = "color",
            get = ItemCondition.Config.TypeWater.Colors.P080,
            set = function(a_value)
                ItemCondition.Config.TypeWater.Colors.P080 = a_value
            end,
        },
        {
            id = "type_water_color_p070",
            type = "color",
            get = ItemCondition.Config.TypeWater.Colors.P070,
            set = function(a_value)
                ItemCondition.Config.TypeWater.Colors.P070 = a_value
            end,
        },
        {
            id = "type_water_color_p060",
            type = "color",
            get = ItemCondition.Config.TypeWater.Colors.P060,
            set = function(a_value)
                ItemCondition.Config.TypeWater.Colors.P060 = a_value
            end,
        },
        {
            id = "type_water_color_p050",
            type = "color",
            get = ItemCondition.Config.TypeWater.Colors.P050,
            set = function(a_value)
                ItemCondition.Config.TypeWater.Colors.P050 = a_value
            end,
        },
        {
            id = "type_water_color_p040",
            type = "color",
            get = ItemCondition.Config.TypeWater.Colors.P040,
            set = function(a_value)
                ItemCondition.Config.TypeWater.Colors.P040 = a_value
            end,
        },
        {
            id = "type_water_color_p030",
            type = "color",
            get = ItemCondition.Config.TypeWater.Colors.P030,
            set = function(a_value)
                ItemCondition.Config.TypeWater.Colors.P030 = a_value
            end,
        },
        {
            id = "type_water_color_p020",
            type = "color",
            get = ItemCondition.Config.TypeWater.Colors.P020,
            set = function(a_value)
                ItemCondition.Config.TypeWater.Colors.P020 = a_value
            end,
        },
        {
            id = "type_water_color_p010",
            type = "color",
            get = ItemCondition.Config.TypeWater.Colors.P010,
            set = function(a_value)
                ItemCondition.Config.TypeWater.Colors.P010 = a_value
            end,
        },
        {
            id = "type_water_color_p000",
            type = "color",
            get = ItemCondition.Config.TypeWater.Colors.P000,
            set = function(a_value)
                ItemCondition.Config.TypeWater.Colors.P000 = a_value
            end,
        }
    }

    local modID = "qdx_item_condition"

    local getTranslation = function(a_id)
        return getText("UI_" .. modID .. "_" .. a_id)
    end

    local modName = getTranslation("mod_name_uppercase")
	local tbl = ModOptionTable:New(modID, modName, false)
    for _, opt in pairs(opts) do
        local tr = "option_" .. opt.id
        local name = getTranslation(tr .. "_name")
        local hover = getTranslation(tr .. "_hover")

        local data = opt.data or nil
        if (data) then
            if (opt.type == "combobox") then
                for i, v in pairs(data) do
                    data[i] = getTranslation(tr .. "_" .. v)
                end
            end
        end

        if (type(opt.get) == "function") then
            tbl:AddModOption(opt.id, opt.type, opt.get(), data, name, hover, opt.set)
        else
            tbl:AddModOption(opt.id, opt.type, opt.get, data, name, hover, opt.set)
        end
    end
end
