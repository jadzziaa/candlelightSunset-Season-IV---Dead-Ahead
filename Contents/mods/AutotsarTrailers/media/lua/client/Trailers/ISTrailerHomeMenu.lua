-- require('TowingCar/TowingUI')

local old_ISVehicleMenu_showRadialMenu = ISVehicleMenu.showRadialMenu

function ISVehicleMenu.showRadialMenu(playerObj)
	old_ISVehicleMenu_showRadialMenu(playerObj)
	local vehicle = playerObj:getVehicle()
	if vehicle ~= nil then
		local menu = getPlayerRadialMenu(playerObj:getPlayerNum())
		
		if menu:isReallyVisible() then
			if menu.joyfocus then
				setJoypadFocus(playerObj:getPlayerNum(), nil)
			end
			menu:undisplay()
			return
		end
		
		local seat = vehicle:getSeat(playerObj)
		if string.match(vehicle:getScript():getName(), "TrailerHome") and seat == 1 then
			if vehicle:isEngineRunning() then
				menu:addSlice(getText("ContextMenu_VehicleShutOff"), getTexture("media/ui/vehicles/vehicle_ignitionOFF.png"), ISVehicleMenu.onShutOffTrailerHomeEngine, playerObj)
			else
				if vehicle:isEngineStarted() then
	--				menu:addSlice("Ignition", getTexture("media/ui/vehicles/vehicle_ignitionON.png"), ISVehicleMenu.onStartEngine, playerObj)
				else
					if (SandboxVars.VehicleEasyUse) then
						menu:addSlice(getText("ContextMenu_VehicleStartEngine"), getTexture("media/ui/vehicles/vehicle_ignitionON.png"), ISVehicleMenu.onStartTrailerHomeEngine, playerObj)
					elseif not vehicle:isHotwired() and (playerObj:getInventory():haveThisKeyId(vehicle:getKeyId()) or vehicle:isKeysInIgnition()) then
						menu:addSlice(getText("ContextMenu_VehicleStartEngine"), getTexture("media/ui/vehicles/vehicle_ignitionON.png"), ISVehicleMenu.onStartTrailerHomeEngine, playerObj)
					elseif not vehicle:isHotwired() and ((playerObj:getPerkLevel(Perks.Electricity) >= 1 and playerObj:getPerkLevel(Perks.Mechanics) >= 2) or playerObj:HasTrait("Burglar"))then
	--					menu:addSlice("Hotwire Vehicle", getTexture("media/ui/vehicles/vehicle_ignitionON.png"), ISVehicleMenu.onHotwire, playerObj)
					elseif vehicle:isHotwired() then
						menu:addSlice(getText("ContextMenu_VehicleStartEngine"), getTexture("media/ui/vehicles/vehicle_ignitionON.png"), ISVehicleMenu.onStartTrailerHomeEngine, playerObj)
					else
	--					menu:addSlice("You need keys or\nelectricity level 1 and\nmechanic level 2\nto hotwire", getTexture("media/ui/vehicles/vehicle_ignitionOFF.png"), nil, playerObj)
					end
				end
			end
			if not vehicle:isHotwired() and
					not vehicle:isEngineStarted() and
					not vehicle:isEngineRunning() and
					not SandboxVars.VehicleEasyUse and
					not vehicle:isKeysInIgnition() and
					not playerObj:getInventory():haveThisKeyId(vehicle:getKeyId()) then
				if ((playerObj:getPerkLevel(Perks.Electricity) >= 1 and playerObj:getPerkLevel(Perks.Mechanics) >= 2) or playerObj:HasTrait("Burglar")) then
					menu:addSlice(getText("ContextMenu_VehicleHotwire"), getTexture("media/ui/vehicles/vehicle_ignitionON.png"), ISVehicleMenu.onHotwireTrailerHome, playerObj)
				else
					menu:addSlice(getText("ContextMenu_VehicleHotwireSkill"), getTexture("media/ui/vehicles/vehicle_ignitionOFF.png"), nil, playerObj)
				end
			end
			
			if vehicle:isTrunkLocked() then
				menu:addSlice(getText("ContextMenu_Open_trunk"), getTexture("media/ui/vehicles/vehicle_open_home_trunk.png"), ISVehicleMenu.onToggleTrunkLocked, playerObj)
			else
				menu:addSlice(getText("ContextMenu_Close_trunk"), getTexture("media/ui/vehicles/vehicle_open_home_trunk.png"), ISVehicleMenu.onToggleTrunkLocked, playerObj)
			end
		end
		menu:addToUIManager()
	end
end

function ISVehicleMenu.onStartTrailerHomeEngine(playerObj)
	ISTimedActionQueue.add(ISStartTrailerHomeEngine:new(playerObj))
end

function ISVehicleMenu.onShutOffTrailerHomeEngine(playerObj)
	ISTimedActionQueue.add(ISShutOffTrailerHomeEngine:new(playerObj))
end

function ISVehicleMenu.onHotwireTrailerHome(playerObj)
	ISTimedActionQueue.add(ISHotwireTrailerHome:new(playerObj))
end

