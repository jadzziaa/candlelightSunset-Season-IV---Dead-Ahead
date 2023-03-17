local Fol_Take_A_Bath_Config = Fol_Take_A_Bath_Config
local Fol_Take_A_Bath_ModOptions=
        {
            options={
                ModDate_take_off_headwear=true, 
                ModDate_take_off_clothes=true, 
                ModDate_take_off_underWear=true,
                ModDate_take_off_backpack=true,
                ModDate_consume_water=1,
                
            },
            names={
                ModDate_take_off_headwear= getText("IGUI_take_off_headwear"), 
                ModDate_take_off_clothes=getText("IGUI_take_off_clothes"), 
                ModDate_take_off_underWear=getText("IGUI_take_off_underWear"),
                ModDate_take_off_backpack=getText("IGUI_take_off_backpack"), 
                ModDate_consume_water=getText("IGUI_consume_water"),
            },
            mod_id="fol_Take_A_Bath";
            mod_shortname="Take A_Bath_ModOptions",
        }

Fol_Take_A_Bath_Config.ModOptions = Fol_Take_A_Bath_ModOptions
if ModOptions and ModOptions.getInstance then
	ModOptions:getInstance(Fol_Take_A_Bath_Config.ModOptions)
    do
      local ModDate_consume_water=Fol_Take_A_Bath_ModOptions.options_data.ModDate_consume_water
      table.insert(ModDate_consume_water, "0")
      table.insert(ModDate_consume_water, "20")
      table.insert(ModDate_consume_water, "40")
      table.insert(ModDate_consume_water, "60")
      table.insert(ModDate_consume_water, "80")
      table.insert(ModDate_consume_water, "100")
        
    end
	ModOptions:loadFile()
end