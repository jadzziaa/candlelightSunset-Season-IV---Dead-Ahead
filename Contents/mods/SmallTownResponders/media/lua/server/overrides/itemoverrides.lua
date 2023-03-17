-- by albion#0123
-- Thanks again, Albion!

local Overrides = require 'overrides/overrides'
local ItemOverrides = {}

ItemOverrides.itemSwaps = {
    ['Base.Vest_BulletPolice'] = { -- item to replace
        Rosewood = 'STR.Vest_BulletPolice_Meade', -- zone = replacement item
        JeffersonSD = 'STR.Vest_BulletPolice_Meade',
        Meade = 'STR.Vest_BulletPolice_Meade',
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Hat_BaseballCap_EMS_Meade'] = { -- item to replace
        Louisville = {'STR.Hat_BaseballCap_EMS_Louisville'}, -- zone = replacement item
        Jefferson = {'STR.Hat_BaseballCap_EMS_Jefferson'},
        Meade = {'STR.Hat_BaseballCap_EMS_Meade'},
        RavenCreek = {'STR.Hat_BaseballCap_EMS_RavenCreek'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Hat_BaseballCap_EMS_Jefferson'] = { -- item to replace
        Louisville = {'STR.Hat_BaseballCap_EMS_Louisville'}, -- zone = replacement item
        Jefferson = {'STR.Hat_BaseballCap_EMS_Jefferson'},
        Meade = {'STR.Hat_BaseballCap_EMS_Meade'},
        RavenCreek = {'STR.Hat_BaseballCap_EMS_RavenCreek'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Hat_BaseballCap_EMS_Louisville'] = { -- item to replace
        Louisville = {'STR.Hat_BaseballCap_EMS_Louisville'}, -- zone = replacement item
        Jefferson = {'STR.Hat_BaseballCap_EMS_Jefferson'},
        Meade = {'STR.Hat_BaseballCap_EMS_Meade'},
        RavenCreek = {'STR.Hat_BaseballCap_EMS_RavenCreek'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Hat_BaseballCap_EMS_RavenCreek'] = { -- item to replace
        Louisville = {'STR.Hat_BaseballCap_EMS_Louisville'}, -- zone = replacement item
        Jefferson = {'STR.Hat_BaseballCap_EMS_Jefferson'},
        Meade = {'STR.Hat_BaseballCap_EMS_Meade'},
        RavenCreek = {'STR.Hat_BaseballCap_EMS_RavenCreek'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Jacket_EMS_Meade'] = { -- item to replace
        Louisville = {'STR.Jacket_EMS_Louisville'}, -- zone = replacement item
        Jefferson = {'STR.Jacket_EMS_Jefferson'},
        Meade = {'STR.Jacket_EMS_Meade'},
        RavenCreek = {'STR.Jacket_EMS_RavenCreek'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Jacket_EMS_Jefferson'] = { -- item to replace
        Louisville = {'STR.Jacket_EMS_Louisville'}, -- zone = replacement item
        Jefferson = {'STR.Jacket_EMS_Jefferson'},
        Meade = {'STR.Jacket_EMS_Meade'},
        RavenCreek = {'STR.Jacket_EMS_RavenCreek'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Jacket_EMS_Louisville'] = { -- item to replace
        Louisville = {'STR.Jacket_EMS_Louisville'}, -- zone = replacement item
        Jefferson = {'STR.Jacket_EMS_Jefferson'},
        Meade = {'STR.Jacket_EMS_Meade'},
        RavenCreek = {'STR.Jacket_EMS_RavenCreek'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Jacket_EMS_RavenCreek'] = { -- item to replace
        Louisville = {'STR.Jacket_EMS_Louisville'}, -- zone = replacement item
        Jefferson = {'STR.Jacket_EMS_Jefferson'},
        Meade = {'STR.Jacket_EMS_Meade'},
        RavenCreek = {'STR.Jacket_EMS_RavenCreek'},
        Default = false, -- don't override if not in one of these zones
    },
    ['Base.Hat_Fireman'] = { -- item to replace
        Louisville = {'STR.Hat_Fireman_Louisville_Black','STR.Hat_Fireman_Louisville_Red','STR.Hat_Fireman_Louisville_Yellow','STR.Hat_Fireman_Louisville_White','STR.Hat_Fireman_Louisville_Blue'}, -- zone = replacement item
        Rosewood = {'STR.Hat_Fireman_Rosewood_Black','STR.Hat_Fireman_Rosewood_Red','STR.Hat_Fireman_Rosewood_Yellow','STR.Hat_Fireman_Rosewood_White'},
        Meade = {'STR.Hat_Fireman_Meade_Black','STR.Hat_Fireman_Meade_Red','STR.Hat_Fireman_Meade_Yellow','STR.Hat_Fireman_Meade_White'},
        RavenCreek = {'STR.Hat_Fireman_RavenCreek_Black','STR.Hat_Fireman_RavenCreek_Red','STR.Hat_Fireman_RavenCreek_Yellow','STR.Hat_Fireman_RavenCreek_Blue'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Hat_Fireman_Meade_Black'] = { -- item to replace
        Louisville = {'STR.Hat_Fireman_Louisville_Black'}, -- zone = replacement item
        Rosewood = {'STR.Hat_Fireman_Rosewood_Black'},
        Meade = {'STR.Hat_Fireman_Meade_Black'},
        RavenCreek = {'STR.Hat_Fireman_RavenCreek_Black'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Hat_Fireman_Meade_Red'] = { -- item to replace
        Louisville = {'STR.Hat_Fireman_Louisville_Red'}, -- zone = replacement item
        Rosewood = {'STR.Hat_Fireman_Rosewood_Red'},
        Meade = {'STR.Hat_Fireman_Meade_Red'},
        RavenCreek = {'STR.Hat_Fireman_RavenCreek_Red'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Hat_Fireman_Meade_Yellow'] = { -- item to replace
        Louisville = {'STR.Hat_Fireman_Louisville_Yellow'}, -- zone = replacement item
        Rosewood = {'STR.Hat_Fireman_Rosewood_Yellow'},
        Meade = {'STR.Hat_Fireman_Meade_Yellow'},
        RavenCreek = {'STR.Hat_Fireman_RavenCreek_Yellow'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Hat_Fireman_Meade_White'] = { -- item to replace
        Louisville = {'STR.Hat_Fireman_Louisville_White'}, -- zone = replacement item
        Rosewood = {'STR.Hat_Fireman_Rosewood_White'},
        Meade = {'STR.Hat_Fireman_Meade_White'},
        RavenCreek = {'STR.Hat_Fireman_RavenCreek_Black'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Hat_Fireman_Rosewood_Black'] = { -- item to replace
        Louisville = {'STR.Hat_Fireman_Louisville_Black'}, -- zone = replacement item
        Rosewood = {'STR.Hat_Fireman_Rosewood_Black'},
        Meade = {'STR.Hat_Fireman_Meade_Black'},
        RavenCreek = {'STR.Hat_Fireman_RavenCreek_Black'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Hat_Fireman_Rosewood_Red'] = { -- item to replace
        Louisville = {'STR.Hat_Fireman_Louisville_Red'}, -- zone = replacement item
        Rosewood = {'STR.Hat_Fireman_Rosewood_Red'},
        Meade = {'STR.Hat_Fireman_Meade_Red'},
        RavenCreek = {'STR.Hat_Fireman_RavenCreek_Red'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Hat_Fireman_Rosewood_Yellow'] = { -- item to replace
        Louisville = {'STR.Hat_Fireman_Louisville_Yellow'}, -- zone = replacement item
        Rosewood = {'STR.Hat_Fireman_Rosewood_Yellow'},
        Meade = {'STR.Hat_Fireman_Meade_Yellow'},
        RavenCreek = {'STR.Hat_Fireman_RavenCreek_Yellow'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Hat_Fireman_Rosewood_White'] = { -- item to replace
        Louisville = {'STR.Hat_Fireman_Louisville_White'}, -- zone = replacement item
        Rosewood = {'STR.Hat_Fireman_Rosewood_White'},
        Meade = {'STR.Hat_Fireman_Meade_White'},
        RavenCreek = {'STR.Hat_Fireman_RavenCreek_Black'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Hat_Fireman_Louisville_Black'] = { -- item to replace
        Louisville = {'STR.Hat_Fireman_Louisville_Black'}, -- zone = replacement item
        Rosewood = {'STR.Hat_Fireman_Rosewood_Black'},
        Meade = {'STR.Hat_Fireman_Meade_Black'},
        RavenCreek = {'STR.Hat_Fireman_RavenCreek_Black'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Hat_Fireman_Louisville_Red'] = { -- item to replace
        Louisville = {'STR.Hat_Fireman_Louisville_Red'}, -- zone = replacement item
        Rosewood = {'STR.Hat_Fireman_Rosewood_Red'},
        Meade = {'STR.Hat_Fireman_Meade_Red'},
        RavenCreek = {'STR.Hat_Fireman_RavenCreek_Red'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Hat_Fireman_Louisville_Yellow'] = { -- item to replace
        Louisville = {'STR.Hat_Fireman_Louisville_Yellow'}, -- zone = replacement item
        Rosewood = {'STR.Hat_Fireman_Rosewood_Yellow'},
        Meade = {'STR.Hat_Fireman_Meade_Yellow'},
        RavenCreek = {'STR.Hat_Fireman_RavenCreek_Yellow'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Hat_Fireman_Louisville_White'] = { -- item to replace
        Louisville = {'STR.Hat_Fireman_Louisville_White'}, -- zone = replacement item
        Rosewood = {'STR.Hat_Fireman_Rosewood_White'},
        Meade = {'STR.Hat_Fireman_Meade_White'},
        RavenCreek = {'STR.Hat_Fireman_RavenCreek_Black'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Hat_Fireman_RavenCreek_Black'] = { -- item to replace
        Louisville = {'STR.Hat_Fireman_Louisville_Black'}, -- zone = replacement item
        Rosewood = {'STR.Hat_Fireman_Rosewood_Black'},
        Meade = {'STR.Hat_Fireman_Meade_Black'},
        RavenCreek = {'STR.Hat_Fireman_RavenCreek_Black'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Hat_Fireman_RavenCreek_Red'] = { -- item to replace
        Louisville = {'STR.Hat_Fireman_Louisville_Red'}, -- zone = replacement item
        Rosewood = {'STR.Hat_Fireman_Rosewood_Red'},
        Meade = {'STR.Hat_Fireman_Meade_Red'},
        RavenCreek = {'STR.Hat_Fireman_RavenCreek_Red'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Hat_Fireman_RavenCreek_Yellow'] = { -- item to replace
        Louisville = {'STR.Hat_Fireman_Louisville_Yellow'}, -- zone = replacement item
        Rosewood = {'STR.Hat_Fireman_Rosewood_Yellow'},
        Meade = {'STR.Hat_Fireman_Meade_Yellow'},
        RavenCreek = {'STR.Hat_Fireman_RavenCreek_Yellow'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Hat_Fireman_RavenCreek_White'] = { -- item to replace
        Louisville = {'STR.Hat_Fireman_Louisville_White'}, -- zone = replacement item
        Rosewood = {'STR.Hat_Fireman_Rosewood_White'},
        Meade = {'STR.Hat_Fireman_Meade_White'},
        RavenCreek = {'STR.Hat_Fireman_RavenCreek_Black'},
        Default = false, -- don't override if not in one of these zones
    },
    ['Base.Jacket_Fireman'] = { -- item to replace
        Louisville = {'STR.Jacket_Fireman_Louisville_Black','STR.Jacket_Fireman_Louisville_Khaki'}, -- zone = replacement item
        Rosewood = {'STR.Jacket_Fireman_Rosewood_Black','STR.Jacket_Fireman_Rosewood_Khaki'},
        Meade = {'STR.Jacket_Fireman_Meade_Black','STR.Jacket_Fireman_Meade_Khaki'},
        RavenCreek = {'STR.Jacket_Fireman_RavenCreek_Black','STR.Jacket_Fireman_RavenCreek_Khaki'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Jacket_Fireman_Meade_Black'] = { -- item to replace
        Louisville = {'STR.Jacket_Fireman_Louisville_Black'}, -- zone = replacement item
        Rosewood = {'STR.Jacket_Fireman_Rosewood_Black'},
        Meade = {'STR.Jacket_Fireman_Meade_Black'},
        RavenCreek = {'STR.Jacket_Fireman_RavenCreek_Black'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Jacket_Fireman_Meade_Khaki'] = { -- item to replace
        Louisville = {'STR.Jacket_Fireman_Louisville_Khaki'}, -- zone = replacement item
        Rosewood = {'STR.Jacket_Fireman_Rosewood_Khaki'},
        Meade = {'STR.Jacket_Fireman_Meade_Khaki'},
        RavenCreek = {'STR.Jacket_Fireman_RavenCreek_Khaki'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Jacket_Fireman_Rosewood_Black'] = { -- item to replace
        Louisville = {'STR.Jacket_Fireman_Louisville_Black'}, -- zone = replacement item
        Rosewood = {'STR.Jacket_Fireman_Rosewood_Black'},
        Meade = {'STR.Jacket_Fireman_Meade_Black'},
        RavenCreek = {'STR.Jacket_Fireman_RavenCreek_Black'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Jacket_Fireman_Rosewood_Khaki'] = { -- item to replace
        Louisville = {'STR.Jacket_Fireman_Louisville_Khaki'}, -- zone = replacement item
        Rosewood = {'STR.Jacket_Fireman_Rosewood_Khaki'},
        Meade = {'STR.Jacket_Fireman_Meade_Khaki'},
        RavenCreek = {'STR.Jacket_Fireman_RavenCreek_Khaki'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Jacket_Fireman_Louisville_Black'] = { -- item to replace
        Louisville = {'STR.Jacket_Fireman_Louisville_Black'}, -- zone = replacement item
        Rosewood = {'STR.Jacket_Fireman_Rosewood_Black'},
        Meade = {'STR.Jacket_Fireman_Meade_Black'},
        RavenCreek = {'STR.Jacket_Fireman_RavenCreek_Black'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Jacket_Fireman_Louisville_Khaki'] = { -- item to replace
        Louisville = {'STR.Jacket_Fireman_Louisville_Khaki'}, -- zone = replacement item
        Rosewood = {'STR.Jacket_Fireman_Rosewood_Khaki'},
        Meade = {'STR.Jacket_Fireman_Meade_Khaki'},
        RavenCreek = {'STR.Jacket_Fireman_RavenCreek_Khaki'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Jacket_Fireman_RavenCreek_Black'] = { -- item to replace
        Louisville = {'STR.Jacket_Fireman_Louisville_Black'}, -- zone = replacement item
        Rosewood = {'STR.Jacket_Fireman_Rosewood_Black'},
        Meade = {'STR.Jacket_Fireman_Meade_Black'},
        RavenCreek = {'STR.Jacket_Fireman_RavenCreek_Black'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Jacket_Fireman_RavenCreek_Khaki'] = { -- item to replace
        Louisville = {'STR.Jacket_Fireman_Louisville_Khaki'}, -- zone = replacement item
        Rosewood = {'STR.Jacket_Fireman_Rosewood_Khaki'},
        Meade = {'STR.Jacket_Fireman_Meade_Khaki'},
        RavenCreek = {'STR.Jacket_Fireman_RavenCreek_Khaki'},
        Default = false, -- don't override if not in one of these zones
    },
    ['Base.Trousers_Fireman'] = { -- item to replace
        Louisville = {'STR.Trousers_Fireman_Louisville_Black','STR.Trousers_Fireman_Louisville_Khaki'}, -- zone = replacement item
        Rosewood = {'STR.Trousers_Fireman_Rosewood_Black','STR.Trousers_Fireman_Rosewood_Khaki'},
        Meade = {'STR.Trousers_Fireman_Meade_Black','STR.Trousers_Fireman_Meade_Khaki'},
        RavenCreek = {'STR.Trousers_Fireman_RavenCreek_Black','STR.Trousers_Fireman_RavenCreek_Khaki'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Trousers_Fireman_Meade_Black'] = { -- item to replace
        Louisville = {'STR.Trousers_Fireman_Louisville_Black'}, -- zone = replacement item
        Rosewood = {'STR.Trousers_Fireman_Rosewood_Black'},
        Meade = {'STR.Trousers_Fireman_Meade_Black'},
        RavenCreek = {'STR.Trousers_Fireman_RavenCreek_Black'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Trousers_Fireman_Meade_Khaki'] = { -- item to replace
        Louisville = {'STR.Trousers_Fireman_Louisville_Khaki'}, -- zone = replacement item
        Rosewood = {'STR.Trousers_Fireman_Rosewood_Khaki'},
        Meade = {'STR.Trousers_Fireman_Meade_Khaki'},
        RavenCreek = {'STR.Trousers_Fireman_RavenCreek_Khaki'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Trousers_Fireman_Rosewood_Black'] = { -- item to replace
        Louisville = {'STR.Trousers_Fireman_Louisville_Black'}, -- zone = replacement item
        Rosewood = {'STR.Trousers_Fireman_Rosewood_Black'},
        Meade = {'STR.Trousers_Fireman_Meade_Black'},
        RavenCreek = {'STR.Trousers_Fireman_RavenCreek_Black'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Trousers_Fireman_Rosewood_Khaki'] = { -- item to replace
        Louisville = {'STR.Trousers_Fireman_Louisville_Khaki'}, -- zone = replacement item
        Rosewood = {'STR.Trousers_Fireman_Rosewood_Khaki'},
        Meade = {'STR.Trousers_Fireman_Meade_Khaki'},
        RavenCreek = {'STR.Trousers_Fireman_RavenCreek_Khaki'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Trousers_Fireman_Louisville_Black'] = { -- item to replace
        Louisville = {'STR.Trousers_Fireman_Louisville_Black'}, -- zone = replacement item
        Rosewood = {'STR.Trousers_Fireman_Rosewood_Black'},
        Meade = {'STR.Trousers_Fireman_Meade_Black'},
        RavenCreek = {'STR.Trousers_Fireman_RavenCreek_Black'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Trousers_Fireman_Louisville_Khaki'] = { -- item to replace
        Louisville = {'STR.Trousers_Fireman_Louisville_Khaki'}, -- zone = replacement item
        Rosewood = {'STR.Trousers_Fireman_Rosewood_Khaki'},
        Meade = {'STR.Trousers_Fireman_Meade_Khaki'},
        RavenCreek = {'STR.Trousers_Fireman_RavenCreek_Khaki'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Trousers_Fireman_RavenCreek_Black'] = { -- item to replace
        Louisville = {'STR.Trousers_Fireman_Louisville_Black'}, -- zone = replacement item
        Rosewood = {'STR.Trousers_Fireman_Rosewood_Black'},
        Meade = {'STR.Trousers_Fireman_Meade_Black'},
        RavenCreek = {'STR.Trousers_Fireman_RavenCreek_Black'},
        Default = false, -- don't override if not in one of these zones
    },
    ['STR.Trousers_Fireman_RavenCreek_Khaki'] = { -- item to replace
        Louisville = {'STR.Trousers_Fireman_Louisville_Khaki'}, -- zone = replacement item
        Rosewood = {'STR.Trousers_Fireman_Rosewood_Khaki'},
        Meade = {'STR.Trousers_Fireman_Meade_Khaki'},
        RavenCreek = {'STR.Trousers_Fireman_RavenCreek_Khaki'},
        Default = false, -- don't override if not in one of these zones
    },
}

ItemOverrides.overrideContainers = {
    all = { -- room name
        TruckBed = true, -- container type = true
        TruckBedOpen = true,
    },
    firestorage = { -- room name
        metal_shelves = true, -- container type = true
    },
    -- all is checked last, so you can override it like below
    CarLightsPolice = {
        TruckBed = 'police', -- use police zones instead of normal zones
        TruckBedOpen = 'police',
    },
    PickUpVanLightsFire = {
        TruckBed = true,
        TruckBedOpen = true,
    },
    VanAmbulance = {
        TruckBed = true,
        TruckBedOpen = true,
    },
}

local CarLightsPolice = ItemOverrides.overrideContainers.CarLightsPolice

ItemOverrides.overrideContainers.PickUpVanLightsPolice = CarLightsPolice -- reuse to save memory and less ugly code
ItemOverrides.overrideContainers['85vicsheriff'] = CarLightsPolice
ItemOverrides.overrideContainers['92crownvicPD'] = CarLightsPolice
ItemOverrides.overrideContainers['87capricePD'] = CarLightsPolice
ItemOverrides.overrideContainers['91blazerpd'] = CarLightsPolice

local PickUpVanLightsFire = ItemOverrides.overrideContainers.PickUpVanLightsFire

ItemOverrides.overrideContainers.PickUpTruckLightsFire = PickUpVanLightsFire -- reuse to save memory and less ugly code
ItemOverrides.overrideContainers['firepumper'] = PickUpVanLightsFire
ItemOverrides.overrideContainers['87c10fire'] = PickUpVanLightsFire

local VanAmbulance = ItemOverrides.overrideContainers.VanAmbulance

ItemOverrides.overrideContainers['80f350ambulance'] = VanAmbulance
ItemOverrides.overrideContainers['86econolineambulance'] = VanAmbulance

---@param container ItemContainer
ItemOverrides.overrideContainer = function(container, policeZones)
    local parent = container:getParent()

    local zone
    if policeZones then
        zone = Overrides.getZone(parent:getX(), parent:getY(), Overrides.zonesPolice)
    else
        zone = Overrides.getZone(parent:getX(), parent:getY())
    end

    local items = container:getItems()
    local getItem = items.get
    for i=0,items:size()-1 do
        local item = getItem(items, i)

        local itemType = item:getFullType()
        if ItemOverrides.itemSwaps[itemType] then
            local newType = ItemOverrides.itemSwaps[itemType][zone]
            if not newType then
                newType = ItemOverrides.itemSwaps[itemType].Default
            end

            if newType then
                if type(newType) == 'table' then
                    newType = newType[ZombRand(#newType)+1]
                end
                container:Remove(item)
                container:AddItem(newType)
            end
        end
    end
end

---@param roomType string
---@param containerType string
---@param container ItemContainer
ItemOverrides.OnFillContainer = function(roomType, containerType, container)
    local zones = ItemOverrides.overrideContainers[roomType] and ItemOverrides.overrideContainers[roomType][containerType] or ItemOverrides.overrideContainers.all[containerType]
    if zones then
        ItemOverrides.overrideContainer(container, zones == 'police')
    end
end

ItemOverrides.OnInitGlobalModData = function()
	if SandboxVars.STR.TrunkOverrides then
		Events.OnFillContainer.Add(ItemOverrides.OnFillContainer)
	end
end
Events.OnInitGlobalModData.Add(ItemOverrides.OnInitGlobalModData)

return ItemOverrides