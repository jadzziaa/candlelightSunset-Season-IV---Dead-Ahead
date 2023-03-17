local elevatorStrings = {
	"fixtures_escalators_01_48",
	"fixtures_escalators_01_49",
	"fixtures_escalators_01_50",
	"fixtures_escalators_01_51",
	"fixtures_escalators_01_56",
	"fixtures_escalators_01_57"
};

--one refactor would be properly using the player ref passed around instead of grabbing it more, was running into issues but probably A.M. pebkac
-- another would be to get rid of direction param all together, and just use floor int but use - numbers for goign down. Would also consolodate two redundant functions to one

function UseElevatorCall(direction, player, square, floor)
	--print("UseElevatorCall has been called");

	if(direction == "up") then
		UseElevatorUpCall(player, square, floor)
	end
	if(direction == "down") then
		UseElevatorDownCall(player, square, floor)
	end

end

function UseElevatorUpCall(player, square, floor)
	
	--having trouble passing this as a param into this func for some reason
	local playerChar = getPlayer()
	local moveValue = floor
	--print("Use Elevator Up")

	local currentZValue = playerChar:getZ()
	local upValue = currentZValue + moveValue;
	playerChar:setZ(upValue)
	playerChar:setLz(upValue);
end

function UseElevatorDownCall(player, square, floor)
	local playerChar = getPlayer()
	local moveValue = floor
	--print("Use Elevator Down")

	local currentZValue = playerChar:getZ()
	local upValue = currentZValue - moveValue;
	playerChar:setZ(upValue)
	playerChar:setLz(upValue);
end

function SquareHasElevator(square)
	
	if(square == nil) then
	--print("SquareHasElevator received a null square");
	return false;
	end  -- why doesnt this protect from null? what is this wizardry

	if(square ~= nil) then

		for i=0,square:getObjects():size()-1 do
			local o = square:getObjects():get(i)
		
			-- what is syntax to clean up this ugly ugly series of lines? some kinda forloop, still lua nub
			if (o:getSprite():getName() == elevatorStrings[1]) or (o:getSprite():getName() == elevatorStrings[2]) then
				--return o;
				--print("SquareHasElevator has returned true")
				return true
			end
			if (o:getSprite():getName() == elevatorStrings[3]) or (o:getSprite():getName() == elevatorStrings[4]) then
				--return o;
				--print("SquareHasElevator has returned true")
				return true
			end	
			if (o:getSprite():getName() == elevatorStrings[5]) or (o:getSprite():getName() == elevatorStrings[6]) then
				--return o;
				--print("SquareHasElevator has returned true")
				return true
			end				
		end
		return false;
	end
	return false;
end

function ElevatorFloorObjectMenu(player,square,context)
	if(square ~= nil) then

		if((SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier) or player:getSquare():haveElectricity()) then

			local spriteName = SquareHasElevator(square);

			if (spriteName == true) then
				AddElevatorSubMenu(player, context, square);
			end
		end
	end
end

function AddElevatorSubMenu(player, context, square)

	local elevatorOption = context:addOption("Use Elevator",  worldobjects);
	local subMenu = ISContextMenu:getNew(context);
	context:addSubMenu(elevatorOption, subMenu);

	local square = getPlayer():getCurrentSquare();			

	local squareUpOne = getCell():getGridSquare(square:getX(),square:getY(),square:getZ()+1);
	local squareDownOne = getCell():getGridSquare(square:getX(),square:getY(),square:getZ()-1);

	local squareUpTwo = getCell():getGridSquare(square:getX(),square:getY(),square:getZ()+2);
	local squareDownTwo = getCell():getGridSquare(square:getX(),square:getY(),square:getZ()-2);

	local squareUpThree = getCell():getGridSquare(square:getX(),square:getY(),square:getZ()+3);
	local squareDownThree = getCell():getGridSquare(square:getX(),square:getY(),square:getZ()-3);

	local elevatorIsUpOne = SquareHasElevator(squareUpOne);
	local elevatorIsDownOne = SquareHasElevator(squareDownOne);

	local elevatorIsUpTwo = SquareHasElevator(squareUpTwo);
	local elevatorIsDownTwo = SquareHasElevator(squareDownTwo);

	local elevatorIsUpThree = SquareHasElevator(squareUpThree);
	local elevatorIsDownThree = SquareHasElevator(squareDownThree);

	if(elevatorIsUpOne == true) then
		subMenu:addOption("Up One Floor", nil, ProjectElevator.UseElevator, getPlayer(), 250, square, "up", 1);
	end

	if(elevatorIsDownOne == true) then
		subMenu:addOption("Down One Floor", nil, ProjectElevator.UseElevator, getPlayer(), 250, square, "down", 1);
	end

	if(elevatorIsUpTwo == true) then
		subMenu:addOption("Up Two Floors", nil, ProjectElevator.UseElevator, getPlayer(), 250, square, "up", 2);
	end

	if(elevatorIsDownTwo == true) then
		subMenu:addOption("Down Two Floors", nil, ProjectElevator.UseElevator, getPlayer(), 250, square, "down", 2);
	end

	if(elevatorIsUpThree == true) then
		subMenu:addOption("Up Three Floors", nil, ProjectElevator.UseElevator, getPlayer(), 250, square, "up", 3);
	end

	if(elevatorIsDownThree == true) then
		subMenu:addOption("Up Three Floors", nil, ProjectElevator.UseElevator, getPlayer(), 250, square, "down", 3);
	end
	
end

function CheckForElevatorTile(player, context, worldobjects, test)
	
	local player = getSpecificPlayer(player);
	local square = getPlayer():getCurrentSquare();			
	ElevatorFloorObjectMenu(player,square,context);
	local fsquare = square:getTileInDirection(getPlayer():getDir());
	if(fsquare) then ElevatorFloorObjectMenu(player,fsquare,context); end
	
end

Events.OnFillWorldObjectContextMenu.Add(CheckForElevatorTile)