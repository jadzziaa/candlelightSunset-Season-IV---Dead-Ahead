require "CommonTemplates/CommonTemplates"

Trailers = {}
Trailers.CheckEngine = {}
Trailers.CheckOperate = {}
Trailers.ContainerAccess = {}
Trailers.Create = {}
Trailers.Init = {}
Trailers.InstallComplete = {}
Trailers.InstallTest = {}
Trailers.UninstallComplete = {}
Trailers.UninstallTest = {}
Trailers.Update = {}
Trailers.Use = {}

function Trailers.Update.GeneratorEngine(vehicle, part, elapsedMinutes)
    -- print("Trailers.Update.GeneratorEngine")
    Vehicles.Update.Engine(vehicle, part, elapsedMinutes)
    local earthing = vehicle:getPartById("EarthingOn")
    if earthing and earthing:getModData().generatorID then
        if not vehicle:getModData()["generatorObject"] then
            vehicle:getModData()["generatorObject"] = Trailers.SearchGenerator(vehicle, earthing)
        end
        if vehicle:getModData()["generatorObject"] then
            if vehicle:isEngineRunning() then
                vehicle:getModData()["generatorObject"]:setActivated(true)
                vehicle:getModData()["generatorObject"]:getModData().generatorTimer = 5
                vehicle:updateParts();
            else
                vehicle:getModData()["generatorObject"]:setActivated(false)
                if vehicle:getModData()["generatorObject"]:getModData().generatorTimer and 
                        vehicle:getModData()["generatorObject"]:getModData().generatorTimer > 0 then
                    vehicle:getModData()["generatorObject"]:getModData().generatorTimer = vehicle:getModData()["generatorObject"]:getModData().generatorTimer - 1
                    vehicle:updateParts();
                end
            end
        end
    end
end

function Trailers.SearchGenerator(trailer, earthing)
    if trailer and earthing and earthing:getModData().generatorID then
        -- local sqr = trailer:getSquare()
        local strCoord = string.match(earthing:getModData().generatorID, '%d*[-]%d*[-]%d*')
        if strCoord then
            local i = string.find(strCoord, "-")
            local x = tonumber(string.sub(strCoord, 1, i-1))
            strCoord = string.sub(strCoord, i+1)
            i = string.find(strCoord, "-")
            local y = tonumber(string.sub(strCoord, 1, i-1))
            local z = tonumber(string.sub(strCoord, i+1))
            local sqr = getSquare(x, y, z)
            if sqr then
                for i=1,sqr:getObjects():size() do
                    local generator = sqr:getObjects():get(i-1)
                    if instanceof( generator, "IsoGenerator") then
                        -- trailer:setMass(1000)
                        return generator
                    end
                end
            end
        end
    end
    return nil
end

function Trailers.Update.GasTankFix(trailer, part, elapsedMinutes)
    local invItem = part:getInventoryItem();
    if not invItem then return; end
    local amount = part:getContainerContentAmount()
    if elapsedMinutes > 0 and amount > 0 and trailer:isEngineRunning() then
        local amountOld = amount
        local gasMultiplier = 90000;
        local qualityMultiplier = ((100 - trailer:getEngineQuality()) / 200) + 1;
        speedMultiplier = 800;
        gasMultiplier = (gasMultiplier / qualityMultiplier) * 3;
        local newAmount = (speedMultiplier / gasMultiplier) * SandboxVars.CarGasConsumption;
        newAmount =  newAmount * (1000/2500.0);
        amount = amount - elapsedMinutes * newAmount;
        if part:getCondition() < 70 then
            if ZombRand(part:getCondition() * 2) == 0 then
                amount = amount - 0.01;
            end
        end
        part:setContainerContentAmount(amount, false, true);
        amount = part:getContainerContentAmount();
        local precision = (amount < 0.5) and 2 or 1
        if VehicleUtils.compareFloats(amountOld, amount, precision) then
            trailer:transmitPartModData(part)
        end
    end
end

function Trailers.Update.GeneratorGasTank(trailer, part, elapsedMinutes)
    -- print("Trailers.Update.GeneratorGasTank")
    Trailers.Update.GasTankFix(trailer, part, elapsedMinutes)
    local earthing = trailer:getPartById("EarthingOn")
    if earthing and earthing:getModData().generatorID then
        if not trailer:getModData()["generatorObject"] then
            trailer:getModData()["generatorObject"] = Trailers.SearchGenerator(trailer, earthing)
        end
        if trailer:getModData()["generatorObject"] then
            local amount = part:getContainerContentAmount()
            if elapsedMinutes > 0 and amount > 0 and trailer:isEngineRunning() then
                if trailer:getModData()["generatorObject"] then
                    trailer:getModData()["generatorObject"]:setFuel(amount/part:getContainerCapacity() * 100)
                end
            end
            if trailer:getModData()["generatorObject"] then
                trailer:getModData()["generatorObject"]:setCondition(trailer:getPartById("Engine"):getCondition())
                if trailer:getPartById("Engine"):getCondition() < 1 then
                    trailer:getModData()["generatorObject"]:setActivated(false)
                end
            end
        end
    end
end

function Trailers.UninstallComplete.GeneratorGasTank(trailer, part, item)
    -- print("Trailers.UninstallComplete.GeneratorGasTank")
    local earthing = trailer:getPartById("EarthingOn")
    if earthing and earthing:getModData().generatorID then
        if not trailer:getModData()["generatorObject"] then
            trailer:getModData()["generatorObject"] = Trailers.SearchGenerator(trailer, earthing)
        end
        if trailer:getModData()["generatorObject"] then
            trailer:getModData()["generatorObject"]:setFuel(0.0)
            trailer:getModData()["generatorObject"]:setActivated(false)
        end
    end
end

function Trailers.Init.EarthingOn (trailer, part)
    if part:getInventoryItem() then
        local gen = Trailers.SearchGenerator(trailer, part)
        if gen then
            trailer:getModData()["generatorObject"] = gen
        else
            trailer:getModData()["generatorObject"] = nil
            local item = part:getInventoryItem()
            trailer:getPartById("EarthingOn"):setInventoryItem(nil)
            trailer:transmitPartItem(trailer:getPartById("EarthingOn"))
        end
    end
end

function Trailers.Update.EarthingOn (trailer, part, elapsedMinutes)
    -- print("Trailers.Update.EarthingOn")
    -- if trailer:getModData()["generatorObject"] then
        -- print(trailer:getMass())
        -- if trailer:getMass() < 9000 then
            -- trailer:setMass(10000)
            -- part:setLightActive(true)
        -- end
    -- end
end

function Trailers.Create.EarthingOn(trailer, part)
    -- print("Trailers.Create.EarthingOn")
    -- local item = VehicleUtils.createPartInventoryItem(part);
    -- CommonTemplates.createActivePart(part)
    part:setInventoryItem(nil)
    trailer:transmitPartItem(part)
end
