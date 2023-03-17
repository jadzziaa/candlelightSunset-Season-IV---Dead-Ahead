require "Vehicles/ISUI/ISLightbarUI"
require "Vehicles/ISUI/ISVehicleMenu"
require "Vehicles/TimedActions/ISLightbarUITimedAction"

require "rSemiTruck"

---

rSemiTruck.Lightbar = {}
rSemiTruck.Lightbar.UI = ISLightbarUI:derive("rSemiTruck.Lightbar.UI")

--- UI ---

function rSemiTruck.Lightbar.UI:new(x, y, width, height, player)
	local this = ISPanelJoypad:new(x, y, width, height)
	setmetatable(this, self)
	self.__index = self
	this.playerNum = player:getPlayerNum()
	this.playerObj = player
	this.vehicle = this.playerObj:getVehicle()

	if y == 0 then
		this.y = getPlayerScreenTop(this.playerNum) + (getPlayerScreenHeight(this.playerNum) - height) / 2
		this:setY(this.y)
	end
	if x == 0 then
		this.x = getPlayerScreenLeft(this.playerNum) + (getPlayerScreenWidth(this.playerNum) - width) / 2
		this:setX(this.x)
	end

	return this
end

function rSemiTruck.Lightbar.UI:createChildren()
	ISLightbarUI.createChildren(self)

	for _,element in ipairs({self.btn_sndStandby, self.btn_sndYelp, self.btn_sndWall, self.btn_sndAlarm}) do
		element:setVisible(false)
		element:setEnabled(false)
		element:setX(0)
		element:setY(0)
		self:removeChild(element)
	end

	self.lightsKnob:setX(self:getWidth() / 2 - self.lightsKnob:getWidth() / 2)
end

function rSemiTruck.Lightbar.UI:prerender()
	self.backgroundColor.a = 0.7
	ISPanelJoypad.prerender(self)
	local lights = self.vehicle:getLightbarLightsMode()
	if lights ~= self.lightsKnob:getValue() and self.lightsKnob.dragging == false then
		self.lightsKnob:setKnobPosition(lights)
	end
   self:drawTextCentre(getText("IGUI_VehicleLightbar_Title"), self:getWidth() /2, 10, 1, 1, 1, 1, UIFont.Medium)
end

--- TimedAction ---

rSemiTruck.Lightbar.TimedAction = ISLightbarUITimedAction:derive("rSemiTruck.Lightbar.TimedAction")

function rSemiTruck.Lightbar.TimedAction:new(character)
	local this = {}
	setmetatable(this, self)
	self.__index = self
	this.character = character
	this.maxTime = 0
	return this
end

function rSemiTruck.Lightbar.TimedAction:perform()
	ISBaseTimedAction.perform(self)

	local ui = rSemiTruck.Lightbar.UI:new(0,0,430,280, self.character)
	ui:initialise()
	ui:addToUIManager()

	local player = self.character:getPlayerNum()

	if JoypadState.players[player+1] then
		setJoypadFocus(player, ui)
	end
end

--- RadialMenu ---

function rSemiTruck.Lightbar.Show(player)
	local r = rSemiTruck
	ISTimedActionQueue.add(rSemiTruck.Lightbar.TimedAction:new(player))
end

local ISVM_showRadialMenu = ISVehicleMenu.showRadialMenu
function ISVehicleMenu.showRadialMenu(player)
	ISVM_showRadialMenu(player)

	local radial = getPlayerRadialMenu(player:getPlayerNum())
	if not radial or not radial.slices then
		return
	end

	-- probably overkill, but let it be for now --
	local vehicleFound = false

	for idx,slice in ipairs(radial.slices) do -- TODO rLib RadialMenu --
		if slice.command then
			for _,arg in ipairs(slice.command) do
				if instanceof(arg, "BaseVehicle") then
					local vehicleName = arg:getScript():getFullName()
					if vehicleName ~= "Rotators.SemiTruck" and vehicleName ~= "Rotators.SemiTruckLite" then
						return
					end
					vehicleFound = true
					break
				end
			end
		end
		if vehicleFound then
			break
		end
	end
	if not vehicleFound then
		return
	end

	for idx,slice in ipairs(radial.slices) do
		if slice.text == getText("ContextMenu_VehicleLightbar") then
			radial.slices[idx].command[1] = rSemiTruck.Lightbar.Show
			radial:setSliceTexture(idx, getTexture("media/ui/vehicles/vehicle_beacon.png"))
			break
		end
	end
end
