require "CommonTemplates/ISUI/ISContextMenuExtension"

ISWorldObjectContextMenuForTrailerGenerator = {}
-- TrailerGeneratorList = {}


local function predicateNotEmpty(item)
	return item:getUsedDelta() > 0
end

ISWorldObjectContextMenuForTrailerGenerator.generatorPlug = function(playerObj, trailer)
	if luautils.walkAdj(playerObj, trailer:getSquare()) then
		ISTimedActionQueue.add(ISPlugTrailerGenerator:new(playerObj, trailer, 300));
	end
end

function ISWorldObjectContextMenuForTrailerGenerator.generatorUnplug(playerObj, trailer)
	if luautils.walkAdj(playerObj, trailer:getSquare()) then
		ISTimedActionQueue.add(ISUnplugTrailerGenerator:new(playerObj, trailer, 300));
	end
end

ISWorldObjectContextMenu.generatorTrailerClear = function(player, context, worldobjects, test)
	if generator and generator:getModData().trailerId then
		ISWorldObjectContextMenuForTrailerGenerator.clearGeneratorMenu(context)
	end
end

ISWorldObjectContextMenuForTrailerGenerator.clearGeneratorMenu = function(context)
	-- print("clearGeneratorMenu")
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_GeneratorInfo")))
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_Turn_On")))
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_Turn_Off")))
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_GeneratorPlug")))
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_GeneratorUnplug")))
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_GeneratorPlugTT")))
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_GeneratorFixTT")))
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_GeneratorFix")))
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_GeneratorAddFuel")))
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_GeneratorTake")))
end

ISWorldObjectContextMenuForTrailerGenerator.onToggleSpotlights = function(playerObj, trailer)
    if luautils.walkAdj(playerObj, trailer:getSquare()) then
        ISTimedActionQueue.add(ISToggleSpotlights:new(playerObj, trailer, 0));
    end
end

ISWorldObjectContextMenuForTrailerGenerator.onActivateGenerator = function(player, trailer, generator, enable)
	local playerObj = getSpecificPlayer(player)
	if luautils.walkAdj(playerObj, generator:getSquare()) then
		ISTimedActionQueue.add(ISActivateTrailerGenerator:new(player, trailer, generator, enable, 30));
	end
end

ISWorldObjectContextMenuForTrailerGenerator.searchGenerator = function(genId)
	local strCoord = string.match(genId, '%d*[-]%d*[-]%d*')
	if strCoord then
		local i = string.find(strCoord, "-")
		local x = tonumber(string.sub(strCoord, 1, i-1))
		strCoord = string.sub(strCoord, i+1)
		i = string.find(strCoord, "-")
		local y = tonumber(string.sub(strCoord, 1, i-1))
		local z = tonumber(string.sub(strCoord, i+1))
		local sqr = getSquare(x, y, z)
		for i=1,sqr:getObjects():size() do
			local generator = sqr:getObjects():get(i-1)
			if instanceof( generator, "IsoGenerator") then
				return generator
			end
		end
	end
	return nil
end

if not ISWorldObjectContextMenuForTrailerGenerator.oldFillMenuOutsideVehicle then
	-- ISWorldObjectContextMenuForTrailerGenerator.oldFillMenuOutsideVehicle = ISVehicleMenu.FillMenuOutsideVehicle
	ISWorldObjectContextMenuForTrailerGenerator.old_ISVehicleMenu_showRadialMenuOutside = ISVehicleMenu.showRadialMenuOutside
end

function ISVehicleMenu.showRadialMenuOutside(playerObj)
	ISWorldObjectContextMenuForTrailerGenerator.old_ISVehicleMenu_showRadialMenuOutside(playerObj)
	if playerObj:getVehicle() then return end
	local playerIndex = playerObj:getPlayerNum()
	local menu = getPlayerRadialMenu(playerIndex)
	if menu:isReallyVisible() then
		if menu.joyfocus then
			setJoypadFocus(playerIndex, nil)
		end
		menu:undisplay()
		return
	end
	local trailer = ISVehicleMenu.getVehicleToInteractWith(playerObj)
	if trailer and string.lower(trailer:getScript():getName()) == "trailergenerator" then
		local earthing = trailer:getPartById("EarthingOn")
		local generator = nil
		if earthing:getModData().generatorID then
			-- print("CLIENT: GENERATOR ID: " .. earthing:getModData().generatorID)
			generator = ISWorldObjectContextMenuForTrailerGenerator.searchGenerator(earthing:getModData().generatorID)
		end
		
		if trailer:hasHeadlights() then
			if trailer:getHeadlightsOn() then
				menu:addSlice(getText("ContextMenu_TrailerSpotlightOff"), getTexture("media/ui/vehicles/vehicle_lightsOFF.png"), ISWorldObjectContextMenuForTrailerGenerator.onToggleSpotlights, playerObj, trailer);
			else
				menu:addSlice(getText("ContextMenu_TrailerSpotlightOn"), getTexture("media/ui/vehicles/vehicle_lightsON.png"), ISWorldObjectContextMenuForTrailerGenerator.onToggleSpotlights, playerObj, trailer);
			end
		end
		
		if generator then
			menu:addSlice(getText("ContextMenu_GeneratorInfo"), getTexture("media/ui/vehicles/vehicle_generator_info.png"), ISWorldObjectContextMenu.onInfoGenerator, nil,  generator, playerIndex);
			if generator:isActivated() then
				menu:addSlice(getText("ContextMenu_Turn_Off"), getTexture("media/ui/vehicles/vehicle_generator_off.png"), ISWorldObjectContextMenuForTrailerGenerator.onActivateGenerator, playerIndex, trailer, generator, false);
			else
				menu:addSlice(getText("ContextMenu_Turn_On_Generator"), getTexture("media/ui/vehicles/vehicle_generator_on.png"), ISWorldObjectContextMenuForTrailerGenerator.onActivateGenerator, playerIndex, trailer, generator, true);
				menu:addSlice(getText("ContextMenu_GeneratorUnplug"), getTexture("media/ui/vehicles/vehicle_generator_unplug.png"), ISWorldObjectContextMenuForTrailerGenerator.generatorUnplug, playerObj, trailer);
			end
		else
			menu:addSlice(getText("ContextMenu_GeneratorPlug"), getTexture("media/ui/vehicles/vehicle_generator_plug.png"), ISWorldObjectContextMenuForTrailerGenerator.generatorPlug, playerObj,  trailer);
		end
	end
end

function ISVehicleMenu.FillMenuOutsideVehicleC(player, context, trailer, test)
	-- ISWorldObjectContextMenuForTrailerGenerator.oldFillMenuOutsideVehicle(player, context, trailer, test)
	-- if trailer and string.lower(trailer:getScript():getName()) == "trailergenerator" then
		-- -- print("ISVehicleMenu2.trailergenerator")
		-- local playerObj = getSpecificPlayer(player)
		-- local playerInv = playerObj:getInventory()
		-- local generator = nil
		-- local earthing = trailer:getPartById("EarthingOn")
		-- if earthing:getModData().generatorID then
			-- -- print("CLIENT: GENERATOR ID: " .. earthing:getModData().generatorID)
			-- generator = ISWorldObjectContextMenuForTrailerGenerator.searchGenerator(earthing:getModData().generatorID)
		-- end
		
		-- if trailer:hasHeadlights() then
			-- if trailer:getHeadlightsOn() then
				-- context:addOptionOnTop(getText("ContextMenu_TrailerSpotlightOff"), nil , ISWorldObjectContextMenuForTrailerGenerator.onToggleSpotlights, trailer, playerObj)
			-- else
				-- context:addOptionOnTop(getText("ContextMenu_TrailerSpotlightOn"), nil, ISWorldObjectContextMenuForTrailerGenerator.onToggleSpotlights, trailer, playerObj)
			-- end
		-- end
		
		-- if generator then
			-- -- print("Generator Found")
			-- local old_options = context:getOptionFromName(getText("ContextMenu_GeneratorInfo"))
			
			if old_options then 
				--print("CLICK on GEN")
				if not generator:isActivated() then
					local old_option_update = context:getOptionFromName(getText("ContextMenu_GeneratorUnplug"))
					if old_option_update then
						context:updateOptionTsar(old_option_update.id, old_option_update.name, old_option_update.target, ISWorldObjectContextMenuForTrailerGenerator.generatorUnplug, playerObj, trailer)
					end	
					old_option_update = context:getOptionFromName(getText("ContextMenu_Turn_On_Generator"))
					if old_option_update then
						context:updateOptionTsar(old_option_update.id, old_option_update.name, trailer, ISWorldObjectContextMenuForTrailerGenerator.onActivateGenerator, true, generator, player)
					end
					old_option_update = context:getOptionFromName(getText("ContextMenu_Turn_On"))
					if old_option_update then
						context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_Turn_On")))
						context:addOption(getText("ContextMenu_Turn_On_Generator"), trailer, ISWorldObjectContextMenuForTrailerGenerator.onActivateGenerator, true, generator, player);
					end
					
					context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_GeneratorFix")))
					context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_GeneratorAddFuel")))
				else
					local old_option_update = context:getOptionFromName(getText("ContextMenu_Turn_Off"))
					context:updateOptionTsar(old_option_update.id, old_option_update.name, trailer, ISWorldObjectContextMenuForTrailerGenerator.onActivateGenerator, false, generator, player)
				end
			else 
				local option = context:addOptionOnTop(getText("ContextMenu_GeneratorInfo"), worldobjects, ISWorldObjectContextMenu.onInfoGenerator, generator, player);
				if generator:isActivated() then
					context:addOptionOnTop(getText("ContextMenu_Turn_Off"), trailer, ISWorldObjectContextMenuForTrailerGenerator.onActivateGenerator, false, generator, player);
				else
					local option = context:addOptionOnTop(getText("ContextMenu_GeneratorUnplug"), worldobjects, ISWorldObjectContextMenuForTrailerGenerator.generatorUnplug, playerObj, trailer);
					option = context:addOptionOnTop(getText("ContextMenu_Turn_On_Generator"), trailer, ISWorldObjectContextMenuForTrailerGenerator.onActivateGenerator, true, generator, player);
					
					local doStats = playerObj:DistToSquared(generator:getX() + 0.5, generator:getY() + 0.5) < 2 * 2
					local description = ISGeneratorInfoWindow.getRichText(generator, doStats)
					if description ~= "" then
						local tooltip = ISWorldObjectContextMenu.addToolTip()
						tooltip:setName(getText("IGUI_Generator_TypeGas"))
						tooltip.description = description
						option.toolTip = tooltip
					end
				end
			end
		-- else
			-- -- print("NO GENERATOR")
			-- context:addOptionOnTop(getText("ContextMenu_GeneratorPlug"), nil, ISWorldObjectContextMenuForTrailerGenerator.generatorPlug, playerObj, trailer)
		-- end
	-- end
end


Events.OnFillWorldObjectContextMenu.Add(ISWorldObjectContextMenu.generatorTrailerClear);
