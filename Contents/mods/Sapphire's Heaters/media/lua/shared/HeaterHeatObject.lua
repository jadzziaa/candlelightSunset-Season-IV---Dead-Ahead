-- Heat Code

require ("ISBaseObject")

ISHeaterHeatObject = ISBaseObject:derive("ISHeaterHeatObject")

function ISHeaterHeatObject:init()
    print("ISHeaterHeatObject:init()")
    local cell = getCell()
    if cell then
        local square = cell:getGridSquare(self.position.x, self.position.y, self.position.z)
        if square then
            if self.heatSource == nil then
                self.heatSource = IsoHeatSource.new(self.position.x, self.position.y, self.position.z, self.radius, self.temp)
                cell:addHeatSource(self.heatSource)

                print("Added Heatsource")
            end
        else
            self:destroy()
        end
    end
end

function ISHeaterHeatObject:destroy()
    print("ISHeaterHeatObject:destroy()")
    if self.heatSource ~= nil then
        getCell():removeHeatSource(self.heatSource)
        self.heatSource = nil
    end
end

function ISHeaterHeatObject:new(x, y, z, radius, temp)
    print("ISHeaterHeatObject:new(x, y, z, radius, temp)")
    local o = ISBaseObject:new()
    setmetatable(o, self)
    self.__index = self

    o.heatSource = nil

    o.position = { x=x, y=y, z=z }
    o.radius = radius
    o.temp = temp
    

    o:init()
    return o
end