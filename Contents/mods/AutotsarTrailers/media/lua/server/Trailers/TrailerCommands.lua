
local TrailerCommands = {}

function TrailerCommands.setHeadlightsOn(playerObj, args)
	--print("Commands.setHeadlightsOn")
	local trailer = getVehicleById(args.trailer)
	trailer:setHeadlightsOn(args.on)
	local part = trailer:getPartById("HeadlightLeft")
	part:setLightActive(args.on)
end

function TrailerCommands.startGeneratorEngine(player, args)
-- print("TrailerCommands.startGeneratorEngine")
	local trailer = getVehicleById(args.trailer)
	local activate = args.activate
	if trailer then
		if activate then
			-- local engineOld = trailer:getPartById("Engine"):getCondition()
			-- local chargeOld = trailer:getPartById("Battery"):getInventoryItem():getUsedDelta()
			-- trailer:getPartById("Battery"):getInventoryItem():setUsedDelta(1)
			-- trailer:getPartById("Engine"):setCondition(100)
			trailer:tryStartEngine(true)
			-- trailer:getPartById("Engine"):setCondition(engineOld)
			-- trailer:getPartById("Battery"):getInventoryItem():setUsedDelta(chargeOld)
		else
			trailer:shutOff()
		end
	else
		noise('trailer no found')
	end
end

function TrailerCommands.createGenerator(playerObj, args)
	-- print("TrailerCommands.createGenerator")
	local trailer = getVehicleById(args.trailer)
	local earthing = trailer:getPartById("EarthingOn")
	local sqr = trailer:getSquare()
	if trailer and earthing then
		local generator = IsoGenerator.new(InventoryItemFactory.CreateItem("Base.Generator"), sqr:getCell(), sqr)
		generator:setSprite("appliances_misc_01_10")
		generator:setFuel(trailer:getPartById("GasTank"):getContainerContentAmount()/trailer:getPartById("GasTank"):getContainerCapacity() * 100)
		generator:setCondition(trailer:getPartById("Engine"):getCondition())
		generator:setConnected(true)
		generator:getModData().trailerId = trailer:getId()
		-- print("Generator created")
		earthing:getModData().generatorID = 
				"#" .. sqr:getX() .. "-" .. sqr:getY() .. "-" .. sqr:getZ()
		earthing:setInventoryItem(InventoryItemFactory.CreateItem("Base.TsarEarthing"))
		-- print("ID SAVED")
		trailer:getModData()["generatorObject"] = generator
		trailer:transmitPartModData(earthing);
		trailer:transmitPartItem(earthing);
		trailer:updateParts();
		if isServer() then 
			generator:transmitCompleteItemToClients(); 
			generator:transmitModData();
		end
		-- trailer:setMass(10000)
	end
end

function TrailerCommands.deleteGenerator(playerObj, args)
	--print("Commands.setHeadlightsOn")
	local trailer = getVehicleById(args.trailer)
	local earthing = trailer:getPartById("EarthingOn")
	if trailer and earthing and earthing:getModData().generatorID then
		local sqr = trailer:getSquare()
		local strCoord = string.match(earthing:getModData().generatorID, '%d*[-]%d*[-]%d*')
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
					generator:setConnected(false);
					generator:remove()
					sqr:transmitRemoveItemFromSquare(generator)
					break
				end
			end
		end
		earthing:getModData().generatorID = nil
		earthing:setInventoryItem(nil)
		trailer:getModData()["generatorObject"] = nil
		trailer:transmitPartModData(earthing);
		trailer:transmitPartItem(earthing);
		-- trailer:setMass(1000)
	end
end

TrailerCommands.OnClientCommand = function(module, command, playerObj, args)
	--print("TrailerCommands.OnClientCommand")
	if module == 'trailer' and TrailerCommands[command] then
		--print("trailer")
		local argStr = ''
		args = args or {}
		for k,v in pairs(args) do
			argStr = argStr..' '..k..'='..tostring(v)
		end
		--noise('received '..module..' '..command..' '..tostring(trailer)..argStr)
		TrailerCommands[command](playerObj, args)
	end
end

Events.OnClientCommand.Add(TrailerCommands.OnClientCommand)