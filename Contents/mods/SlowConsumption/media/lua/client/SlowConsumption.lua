--[[
  v0.5
--]]

function Adjust(Name, Property, Value)
  Item = ScriptManager.instance:getItem(Name)
  Item:DoParam(Property.." = "..Value)
  end
  --[[
  Decreased flashlight battery consumption from 0.0009 (Default) to 0.00045
  Decreased handtorch battery consumption from 0.0004 (Default) to 0.0002
  --]]
  Adjust("Base.Torch","UseDelta","0.00045")
  Adjust("Base.HandTorch","UseDelta","0.0002")
  --[[
  Decreased soap consumption from 0.05 (Default) to 0.025
  --]]
  Adjust("Base.Soap2","UseDelta","0.025")
  --[[
  Decreased lighter consumption to 0.015
  Increased lighter "ticksPerEquipUse" [as a light source] from 110 (Default) to 220  
  Decreased matches consumption from 0.1 to 0.05
  --]]
  Adjust("Base.Lighter","UseDelta","0.015")
  Adjust("Base.Lighter","ticksPerEquipUse","220")
  Adjust("Base.Matches","UseDelta","0.05")
  --[[
  Increased colored light bulb "ConditionMax" from 10 (Default) to 100 [like default lightbulb]
  --]]
  Adjust("Base.LightBulbRed","ConditionMax","100")
  Adjust("Base.LightBulbGreen","ConditionMax","100")
  Adjust("Base.LightBulbBlue","ConditionMax","100")
  Adjust("Base.LightBulbYellow","ConditionMax","100")
  Adjust("Base.LightBulbCyan","ConditionMax","100")
  Adjust("Base.LightBulbMagenta","ConditionMax","100")
  Adjust("Base.LightBulbOrange","ConditionMax","100")
  Adjust("Base.LightBulbPurple","ConditionMax","100")
  Adjust("Base.LightBulbPink","ConditionMax","100")