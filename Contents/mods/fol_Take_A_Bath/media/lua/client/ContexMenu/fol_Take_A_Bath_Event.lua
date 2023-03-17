Fol_Take_A_Bath={}

local   ModDate_take_off_headwear
local   ModDate_take_off_clothes
local   ModDate_take_off_underWear
local   ModDate_take_off_backpack
local   consume_water
function Fol_Take_A_Bath.IsWash(_Object,consume_water,player)

    
    local Bath_tubs_Part1={ 
        "bathroom_01_25",
        "bathroom_01_53",
    }
    local Bath_tubs_Part2={ 
        "bathroom_01_24",
        "bathroom_01_52",
    }
    local Bath_tubs_Part3={ 
        "bathroom_01_26",
        "bathroom_01_54",
        }
    local Bath_tubs_Part4={ 
   
        "bathroom_01_27",
        "bathroom_01_55",
        }
    local Bath_tubs_Part5={
        "bathroom_01_23",

    }
    local Bath_tubs_Part6={
        "bathroom_01_33",
        "bathroom_01_31",
    }
    local Bath_tubs_Part7={
        "bathroom_01_22",

    }
    local Bath_tubs_Part8={
        "bathroom_01_32",
        "bathroom_01_30",
    }
    if luautils.walkAdj(player, _Object:getSquare()) then        
        local Items_Location={}
        local Cloths_Put_On={}
        local isEquipped_Cloth
        ModDate_take_off_headwear = Fol_Take_A_Bath_Config.ModOptions.options.ModDate_take_off_headwear
        if ModDate_take_off_headwear then
        local Headwear_Location={
            "MaskFull",
            "Hat","FullHat","Ears","EarTop","Nose",
            "Eyes","LeftEye","RightEye",
            "MaskEyes","Mask",
            }
            for i = 1, #Headwear_Location do
                table.insert(Items_Location, Headwear_Location[i])
                if i>=#Headwear_Location then
                    break
                end
            end
        end
        ModDate_take_off_clothes = Fol_Take_A_Bath_Config.ModOptions.options.ModDate_take_off_clothes
        if ModDate_take_off_clothes then
        local Clothes_Location={
                "Scarf","Tail","TorsoExtraVest","TorsoExtra",
                 "AmmoStrap",
                 "Right_MiddleFinger","Left_MiddleFinger","Left_RingFinger","Right_RingFinger","Hands","HandsLeft","HandsRight",
                 "FullSuit","Boilersuit","FullSuitHead","FullTop",
                 "Jacket", "Jacket_Bulky", "JacketSuit",              
                 "BathRobe",
                 "Torso1","Torso1Legs1",
                 "TankTop","Tshirt","ShortSleeveShirt","Skirt",                        
                 "Legs1","Pants","Skirt","Legs5","Dress","BodyCostume","Sweater","SweaterHat",
                 "Socks","Shoes",
            }
            for i = 1, #Clothes_Location do
                table.insert(Items_Location, Clothes_Location[i])
                if i>=#Clothes_Location then
                    break
                end
            end
        end
        ModDate_take_off_underWear = Fol_Take_A_Bath_Config.ModOptions.options.ModDate_take_off_underWear
        if ModDate_take_off_underWear then
            local UnderWear_Location={                
                     "Underwear","UnderwearBottom","UnderwearTop",
                     "UnderwearExtra1","UnderwearExtra2",
                }
                for i = 1, #UnderWear_Location do
                    table.insert(Items_Location, UnderWear_Location[i])
                    if i>=#UnderWear_Location then
                        break
                    end
                end
            end
        ModDate_take_off_backpack = Fol_Take_A_Bath_Config.ModOptions.options.ModDate_take_off_backpack
        if ModDate_take_off_backpack then
            local Backpack_Location={
                "Back","FannyPackFront","FannyPackBack",
            }
            for i = 1, #Backpack_Location do
                table.insert(Items_Location, Backpack_Location[i])
                if i>=#Backpack_Location then
                    break
                end
            end
        end
             for i = 1, #Items_Location do
                 if player:getWornItem(Items_Location[i])~=nil then
                     isEquipped_Cloth=player:getWornItem(Items_Location[i])
              
                     ISTimedActionQueue.add(ISUnequipAction:new(player, isEquipped_Cloth, 50))
   
                     table.insert(Cloths_Put_On, isEquipped_Cloth) 
                 end
                 if i >= #Items_Location then
                     break
                 end
             end 
            local Check_found=false
            if Check_found==false then
                for i = 1, #Bath_tubs_Part1 do
                    if string.find(_Object:getSprite():getName(), Bath_tubs_Part1[i],1)~=nil then
                        ISTimedActionQueue.add(Fol_Take_A_Bath_Action:new(player,_Object,"Part1",consume_water))
                        Check_found=true
                        break
                    end
                    if i>=#Bath_tubs_Part1 then
                        break
                    end
                end
            end
            if Check_found==false then
                for i = 1, #Bath_tubs_Part2 do
                    if string.find(_Object:getSprite():getName(), Bath_tubs_Part2[i],1)~=nil then
                        ISTimedActionQueue.add(Fol_Take_A_Bath_Action:new(player,_Object,"Part2",consume_water))
                        Check_found=true
                        break
                    end
                    if i>=#Bath_tubs_Part2 then
                        break
                    end
                end
            end
            if Check_found==false then
                for i = 1, #Bath_tubs_Part3 do
                    if string.find(_Object:getSprite():getName(), Bath_tubs_Part3[i],1)~=nil then
                        ISTimedActionQueue.add(Fol_Take_A_Bath_Action:new(player,_Object,"Part3",consume_water))
                        Check_found=true
                        break
                    end
                    if i>=#Bath_tubs_Part3 then
                        break
                    end
                end
            end
            if Check_found==false then
                for i = 1, #Bath_tubs_Part4 do
                    if string.find(_Object:getSprite():getName(), Bath_tubs_Part4[i],1)~=nil then
                        ISTimedActionQueue.add(Fol_Take_A_Bath_Action:new(player,_Object,"Part4",consume_water))
                        Check_found=true
                        break
                    end
                    if i>=#Bath_tubs_Part4 then
                        break
                    end
                end
            end
            if Check_found==false then
                for i = 1, #Bath_tubs_Part5 do
                    if string.find(_Object:getSprite():getName(), Bath_tubs_Part5[i],1)~=nil then
                        ISTimedActionQueue.add(Fol_Take_A_Bath_Action:new(player,_Object,"Part5",consume_water))
                        Check_found=true
                        break
                    end
                    if i>=#Bath_tubs_Part5 then
                        break
                    end
                end
            end
            if Check_found==false then
                for i = 1, #Bath_tubs_Part6 do
                    if string.find(_Object:getSprite():getName(), Bath_tubs_Part6[i],1)~=nil then
                        ISTimedActionQueue.add(Fol_Take_A_Bath_Action:new(player,_Object,"Part6",consume_water))
                        Check_found=true
                        break
                    end
                    if i>=#Bath_tubs_Part6 then
                        break
                    end
                end
            end
            if Check_found==false then
                for i = 1, #Bath_tubs_Part7 do
                    if string.find(_Object:getSprite():getName(), Bath_tubs_Part7[i],1)~=nil then
                        ISTimedActionQueue.add(Fol_Take_A_Bath_Action:new(player,_Object,"Part7",consume_water))
                        Check_found=true
                        break
                    end
                    if i>=#Bath_tubs_Part7 then
                        break
                    end
                end
            end
            if Check_found==false then
                for i = 1, #Bath_tubs_Part8 do
                    if string.find(_Object:getSprite():getName(), Bath_tubs_Part8[i],1)~=nil then
                        ISTimedActionQueue.add(Fol_Take_A_Bath_Action:new(player,_Object,"Part8",consume_water))
                        Check_found=true
                        break
                    end
                    if i>=#Bath_tubs_Part8 then
                        break
                    end
                end
            end 
            if #Cloths_Put_On>0 then
                for i = 1, #Cloths_Put_On do
                    isEquipped_Cloth=Cloths_Put_On[i]
                    ISTimedActionQueue.add(ISWearClothing:new(player, isEquipped_Cloth, 50))
                    if i >= #Cloths_Put_On then
                        Cloths_Put_On={}
                        break
                    end
                end
            end 
    end
end
 function Fol_Take_A_Bath.ContextMenu(player, context, worldobjects, test)
    local player = getSpecificPlayer(player)

    local Bath_tubs={
        "bathroom_01_24",
        "bathroom_01_25",
        "bathroom_01_26",
        "bathroom_01_27",
        "bathroom_01_52",
        "bathroom_01_53",
        "bathroom_01_54",
        "bathroom_01_55",
        "bathroom_01_32",
        "bathroom_01_33",
        "bathroom_01_30",
        "bathroom_01_31",
        "bathroom_01_23",
        "bathroom_01_22",
    }
    local _rootmenu
    local _Object
    local _Object_Sprite_Name
    for i,object in ipairs(worldobjects) do
        if object:getSprite() and object:getSprite():getName() then
            for i = 1,#Bath_tubs do
                if string.find(object:getSprite():getName(), Bath_tubs[i],1)~=nil then
                    _Object=object
                    _Object_Sprite_Name=object:getSprite():getName()
                    _rootmenu=true
                    break
                end
                if i>=#Bath_tubs then
                    break
                end
            end
        end
    end
 
    local   pick_consume_water={0,20,40,60,80,100}

    if Fol_Take_A_Bath_Config.ModOptions.options.ModDate_consume_water ~=nil then
        consume_water=pick_consume_water[tonumber(Fol_Take_A_Bath_Config.ModOptions.options.ModDate_consume_water)]
    else consume_water=0
    end
    if _rootmenu then
        local rootmenu = context:addOption(getText("ContextMenu_fol_TakeABath"),_Object, Fol_Take_A_Bath.IsWash,consume_water,player)
        _rootmenu=false
        local tooltip = ISWorldObjectContextMenu.addToolTip()
        tooltip.description = getText("Tooltip_item_There_is_no_Water"); 
           local waterAvailable = _Object:getWaterAmount()
           if waterAvailable < consume_water then
            rootmenu.notAvailable = true;
            rootmenu.toolTip = tooltip;
           end
    end
end

Events.OnFillWorldObjectContextMenu.Add(Fol_Take_A_Bath.ContextMenu)
