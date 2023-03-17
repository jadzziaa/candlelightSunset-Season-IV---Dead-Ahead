require "CheatMenuRebirth/Vehicle/ISUIRustWindow"
require "CheatMenuRebirth/Vehicle/ISUIColorSlider"

VehicleControlWindow = ISCollapsableWindow:derive("VehicleControlWindow")
VehicleControlWindow.IDs = {}

function VehicleControlWindow:initialise()
	ISCollapsableWindow.initialise(self);
end


function VehicleControlWindow:destroy()
	self:setVisible(false)
	self:removeFromUIManager()
    VehicleControlWindow.IDs = nil
end

function VehicleControlWindow:new(title, ID, onPress, args)
	local o = ISCollapsableWindow:new(getCore():getScreenWidth() / 3, getCore():getScreenHeight() / 3, 240, 240)
	--ISCollapsableWindow.initialise(o);
	setmetatable(o, self)
	self.__index = self
	o.title = title;
	o.resizable = false;
	--ISCollapsableWindow.initialise(self);
	
	o.func = onPress
	o.args = args
    
    local buttonN_width = 120
    local buttonN_height = 40

	
    o.Selbtn = ISButton:new(0, o:titleBarHeight(), buttonN_width, buttonN_height, getText("UI_CMRB_VehicleControl_SelectVehicle"), o, function() o:MakeSelection() end)
    o.Selbtn:initialise()
    o.Selbtn:instantiate();
	o:addChild(o.Selbtn)

    o.DeSelbtn = ISButton:new(buttonN_width, o:titleBarHeight(), buttonN_width, buttonN_height, getText("UI_CMRB_VehicleControl_DeselectVehicle"), o, function() o:Deselection() end)
    o.DeSelbtn:initialise()
    o.DeSelbtn:instantiate();
	o:addChild(o.DeSelbtn)
    
        
    o.ColorChgbtn = ISButton:new(0, buttonN_height + o:titleBarHeight(), buttonN_width, buttonN_height, getText("UI_CMRB_VehicleControl_ColorEditor"), o, function() o:ColorChg() end)
    o.ColorChgbtn:initialise()
    o.ColorChgbtn:instantiate();
	o:addChild(o.ColorChgbtn)
    
    
    o.Keygenbtn = ISButton:new(buttonN_width, o.DeSelbtn.height + o:titleBarHeight(), buttonN_width, buttonN_height, getText("UI_CMRB_VehicleControl_KeyCreation"), o, function() o:Keygen() end) 
    o.Keygenbtn:initialise()
    o.Keygenbtn:instantiate()
	o:addChild(o.Keygenbtn)
    

    o.Hotwirebtn = ISButton:new(0, o:titleBarHeight() + buttonN_height * 2, buttonN_width, buttonN_height, getText("UI_CMRB_VehicleControl_Hotwire"), o, function() o:SetHotwire() end) 
    o.Hotwirebtn:initialise()
    o.Hotwirebtn:instantiate();
	o:addChild(o.Hotwirebtn)
    
    o.Rustbtn = ISButton:new(buttonN_width, o:titleBarHeight() + buttonN_height * 2, buttonN_width, buttonN_height, getText("UI_CMRB_VehicleControl_RustEditor"), o, function() o:SetRust() end)
    o.Rustbtn:initialise()
    o.Rustbtn:instantiate();
	o:addChild(o.Rustbtn)
    

    o.AllRepairbtn = ISButton:new(0, o:titleBarHeight() + buttonN_height * 3, buttonN_width, buttonN_height, getText("UI_CMRB_VehicleControl_RepairAll"), o, function() o:AllRepair() end)
    o.AllRepairbtn:initialise()
    o.AllRepairbtn:instantiate();
	o:addChild(o.AllRepairbtn)
    

    o.VehicleGodbtn = ISButton:new(buttonN_width, o:titleBarHeight() + buttonN_height * 3, buttonN_width, buttonN_height, getText("UI_CMRB_VehicleControl_Godmode"), o, function() o:VehicleGod() end)
    o.VehicleGodbtn:initialise()
    o.VehicleGodbtn:instantiate();
	o:addChild(o.VehicleGodbtn)
    

    o.VehicleMechanicsbtn = ISButton:new(0, o:titleBarHeight() + buttonN_height * 4, buttonN_width, buttonN_height, getText("UI_CMRB_Utility_VehicleMechanicsCheat"), o, function() CheatCoreCM.DoMechanicsCheat() end)
    o.VehicleMechanicsbtn:initialise()
    o.VehicleMechanicsbtn:instantiate();
	o:addChild(o.VehicleMechanicsbtn)
    
    

    o.DestroyVehiclebtn = ISButton:new(buttonN_width, o:titleBarHeight() + buttonN_height * 4, buttonN_width, buttonN_height, getText("UI_CMRB_VehicleControl_DestroyVehicle"), o, function() o:DestroyVehicle() end)
    o.DestroyVehiclebtn:initialise()
    o.DestroyVehiclebtn:instantiate();
	o:addChild(o.DestroyVehiclebtn)
    
    
    --o.backgroundColor = {r=0.1, g=0.1, b=0.1, a=0.6};
	--o.borderColor = {r=0.4, g=0.4, b=0.4, a=1};
    
	--o:setHeight(o:getHeight() - (o:titleBarHeight() / 2)) -- remove the space that's usually added for the resize widget
	VehicleControlWindow.IDs[ID] = o
	return o
end


function VehicleControlWindow:MakeSelection()
    if CheatCoreCM.SelectedVehicle ~= nil then
        CheatCoreCM.HandleToggle(nil, "CheatCoreCM.IsSelect", function() getPlayer():Say((CheatCoreCM.IsSelect and getText("UI_CMRB_Message_VehicleReselection") .. getText("UI_CMRB_Message_IsEnabled") .. getText("UI_CMRB_Message_VehicleSelection_2") or getText("UI_CMRB_Message_VehicleReselection") .. getText("UI_CMRB_Message_IsDisabled"))) end)
    else
        CheatCoreCM.HandleToggle(nil, "CheatCoreCM.IsSelect", function() getPlayer():Say((CheatCoreCM.IsSelect and getText("UI_CMRB_Message_VehicleSelection") .. getText("UI_CMRB_Message_IsEnabled") .. getText("UI_CMRB_Message_VehicleSelection_2") or getText("UI_CMRB_Message_VehicleSelection") .. getText("UI_CMRB_Message_IsDisabled"))) end)
    end
end


function VehicleControlWindow:Deselection()
    if CheatCoreCM.SelectedVehicle == nil then
        if CheatCoreCM.IsSelect then
            getPlayer():Say(getText("UI_CMRB_Message_VehicleSelection") .. getText("UI_CMRB_Message_IsDisabled"))
            CheatCoreCM.IsSelect = false
        else
            getPlayer():Say(getText("UI_CMRB_Message_VehicleDeselectedAlready"))
        end
    else
    if CheatCoreCM.IsSelect then
        getPlayer():Say(getText("UI_CMRB_Message_VehicleSelection") .. getText("UI_CMRB_Message_IsDisabled"))
    end
        CheatCoreCM.SelectedVehicle = nil; 
        CheatCoreCM.IsReady = false; 
        getPlayer():Say(getText("UI_CMRB_Message_VehicleDeselected"))
    end

end

function VehicleControlWindow:ColorChg()
    --print (ISUIColorWindow.IDs)
    if isClient() then
        getPlayer():Say(getText("UI_CMRB_Message_NotSuppportMP"))
    else
        if CheatCoreCM.SelectedVehicle ~= nil and ISUIColorWindow.IDs == nil then
            ISUIColorWindow.makeWindow()
        elseif CheatCoreCM.SelectedVehicle == nil then
            getPlayer():Say(getText("UI_CMRB_Message_VehicleDeselectedAlready"))
        else
            getPlayer():Say(getText("UI_CMRB_Message_AlreadyExistWindow"))
        end
    end
end

function VehicleControlWindow:Keygen()
    local vehicle = CheatCoreCM.SelectedVehicle
    if CheatCoreCM.SelectedVehicle ~= nil then
        if isClient() then
            sendClientCommand(getSpecificPlayer(getPlayer():getPlayerNum()), "vehicle", "getKey", { vehicle = vehicle:getId() })
        else
            if vehicle:getCurrentKey() ~= nil then 
                getPlayer():getInventory():AddItem(vehicle:getCurrentKey()) 
            else 
                getPlayer():getInventory():AddItem(vehicle:createVehicleKey()) 
            end
            getPlayer():Say(getText("UI_CMRB_Message_VehicleKeyAdded"))
        end
    else
        getPlayer():Say(getText("UI_CMRB_Message_VehicleDeselectedAlready"))
    end
end

function VehicleControlWindow:SetHotwire()
    if CheatCoreCM.SelectedVehicle ~= nil then
    local vehicle = CheatCoreCM.SelectedVehicle
        if isClient() then
        local HB = vehicle:isHotwiredBroken()
        local H = not vehicle:isHotwired()
            if vehicle:isHotwired() then
                sendClientCommand(getSpecificPlayer(getPlayer():getPlayerNum()), "vehicle", "cheatHotwire", { vehicle = vehicle:getId(), hotwired = H, broken = HB })
                getPlayer():Say(getText("UI_CMRB_Message_Hotwired"))
            else
                sendClientCommand(getSpecificPlayer(getPlayer():getPlayerNum()), "vehicle", "cheatHotwire", { vehicle = vehicle:getId(), hotwired = H, broken = HB })
                getPlayer():Say(getText("UI_CMRB_Message_NotHotwired"))
            end
        else
            if vehicle:isHotwired() then
                vehicle:setHotwired(not vehicle:isHotwired())
                getPlayer():Say(getText("UI_CMRB_Message_Hotwired"))
            else
                vehicle:setHotwired(not vehicle:isHotwired())
                getPlayer():Say(getText("UI_CMRB_Message_NotHotwired"))
            end
        end
    else
        getPlayer():Say(getText("UI_CMRB_Message_VehicleDeselectedAlready"))
    end
end

function VehicleControlWindow:SetRust()
    --print (ISUIRustWindow.IDs)
    if CheatCoreCM.SelectedVehicle ~= nil and ISUIRustWindow.IDs == nil then
        ISUIRustWindow.makeWindow()

    elseif CheatCoreCM.SelectedVehicle == nil then
        getPlayer():Say(getText("UI_CMRB_Message_VehicleDeselectedAlready"))
    else
        getPlayer():Say(getText("UI_CMRB_Message_AlreadyExistWindow"))
    end
end

function VehicleControlWindow:AllRepair()
    if CheatCoreCM.SelectedVehicle ~= nil then
        local vehicle = CheatCoreCM.SelectedVehicle
        if isClient() then
            sendClientCommand(getSpecificPlayer(getPlayer():getPlayerNum()), "vehicle", "repair", { vehicle = vehicle:getId() })
        else
            vehicle:repair()
        end
        getPlayer():Say(getText("UI_CMRB_Message_RepairedVehicle"))
    else 
        getPlayer():Say(getText("UI_CMRB_Message_VehicleDeselectedAlready"))
    end
end

function VehicleControlWindow:VehicleGod()
    if CheatCoreCM.SelectedVehicle ~= nil then
        if isClient() then
            getPlayer():Say(getText("UI_CMRB_Message_NotSuppportMP"))
        else
            CheatCoreCM.HandleToggle(getText("UI_CMRB_VehicleControl_Godmode"), "CheatCoreCM.MadMax")
        end
    else
        getPlayer():Say(getText("UI_CMRB_Message_VehicleDeselectedAlready"))
    end
end

function VehicleControlWindow:IndividualPart()
    getPlayer():Say(getText("UI_CMRB_Message_NotSupported"))
end

function VehicleControlWindow:DestroyVehicle()
    if CheatCoreCM.SelectedVehicle ~= nil then
        local vehicle = CheatCoreCM.SelectedVehicle
        
        if isClient() then
            sendClientCommand(getSpecificPlayer(getPlayer():getPlayerNum()), "vehicle", "remove", { vehicle = vehicle:getId() })
        else
            vehicle:permanentlyRemove(); 
        end
        getPlayer():Say(getText("UI_CMRB_Message_DestroyedVehicle"))
        CheatCoreCM.SelectedVehicle = nil; 
        CheatCoreCM.IsReady = false; 
    else 
        getPlayer():Say(getText("UI_CMRB_Message_VehicleDeselectedAlready"))
    end
end





function VehicleControlWindow:checkExists(title, ID, onPress, args) -- to prevent duplicates when using it in conjunction with contextmenus. if inputUI returns nil then that means it's the first time the context menu has been opened.
	if VehicleControlWindow.IDs[ID] == nil then
		local newUI = VehicleControlWindow:new(title, ID, onPress, args)
		newUI:initialise()
		newUI:addToUIManager()
		newUI:setVisible(false)
	end
	return VehicleControlWindow.IDs[ID]
end
