if isClient() then return end

require "Map/SGlobalObjectSystem"

DWF_WallSystem = SGlobalObjectSystem:derive("DMF_WallSystem")
DWF_WallSystem.removedCache = nil;

function DWF_WallSystem:new()
	local o = SGlobalObjectSystem.new(self, "wall")
	return o
end

function DWF_WallSystem:initSystem()
	SGlobalObjectSystem.initSystem(self)
end

function DWF_WallSystem:newLuaObject(globalObject)
	return DWF_WallGlobalObject:new(self, globalObject)
end

function DWF_WallSystem:isValidIsoObject(isoObject)
	return instanceof(isoObject, "IsoThumpable") and isoObject:getName() == "Trap"
end

function DWF_WallSystem:OnClientCommand(command, playerObj, args)
	--print("DWF: TO BE IMPLEMENTED")
	--STrapSystemCommands[command](playerObj, args)
end


function DWF_WallSystem:OnObjectAboutToBeRemoved(isoObject)
	-- This is called *before* self:OnDestroyIsoThumpable() due to
	-- ISBuildingObject.onDestroy() removing the object.
	-- SGlobalObjectSystem.OnObjectAboutToBeRemoved() will remove the STrapGlobalObject
	-- so it should not be accessed after this.


	-- TODO Check if this works


	DWF_WallSystem.removedCache = nil;
	if self:isValidIsoObject(isoObject) then
		local luaObject = self:getLuaObjectOnSquare(isoObject:getSquare())
		if luaObject then
			DWF_WallSystem.removedCache = copyTable(luaObject);
			--luaObject:spawnDestroyItems(isoObject:getSquare());
		end
	end
	SGlobalObjectSystem.OnObjectAboutToBeRemoved(self, isoObject)
end

function DWF_WallSystem:OnDestroyIsoThumpable(isoObject, playerObj)
	if DWF_WallSystem.removedCache and isoObject then

		-- TODO should it spawn something?
		--STrapGlobalObject.SpawnDestroyItems(DWF_WallSystem.removedCache.trapType, isoObject:getSquare(), isoObject)
		DWF_WallSystem.removedCache = nil;
	end
	SGlobalObjectSystem.OnDestroyIsoThumpable(self, isoObject, playerObj)
end

SGlobalObjectSystem.RegisterSystemClass(DWF_WallSystem)










-- TODO Maybe add damage once in a while? Or maybe it's already done and we're overriding it?







-- -- Change age of bait each day
-- DWF_WallSystem.EveryDays = function()
-- 	for i=1,STrapSystem.instance.system:getObjectCount() do
-- 		local luaObject = STrapSystem.instance.system:getObjectByIndex(i-1):getModData()
-- 		if luaObject.bait then
-- 			luaObject.lastUpdate = getGameTime():getWorldAgeHours() / 24;
-- 			luaObject.trapBaitDay = luaObject.trapBaitDay + 1;
-- 			local isoObject = luaObject:getIsoObject()
-- 			luaObject:toObject(isoObject, true)
-- 		end
-- 	end
-- end

-- -- every hour, calcul the chance of getting something
-- function DWF_WallSystem.checkTrap()
-- 	for i=1,DWF_WallSystem.instance.system:getObjectCount() do
-- 		local luaObject = DWF_WallSystem.instance.system:getObjectByIndex(i-1):getModData()
-- 		local square = getWorld():getCell():getGridSquare(luaObject.x, luaObject.y, luaObject.z)
-- 		luaObject:calculTrap(square)
-- 	end
-- end

-- function DWF_WallSystem.isValidModData(modData)
-- 	return modData.trapType ~= nil
-- end

-- function DWF_WallSystem.addSound()
-- 	for i=1,STrapSystem.instance.system:getObjectCount() do
-- 		local vB = STrapSystem.instance.system:getObjectByIndex(i-1):getModData()
-- 		local square = getWorld():getCell():getGridSquare(vB.x, vB.y, vB.z);
-- 		vB:addSound(square);
-- 	end
-- end


-- Events.EveryDays.Add(DMF_WallSystem.EveryDays);
-- Events.EveryHours.Add(DMF_WallSystem.checkTrap);
-- Events.EveryTenMinutes.Add(DMF_WallSystem.addSound);
