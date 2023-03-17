BTSE = BTSE or {};
BTSE.Farming = BTSE.Farming or {};
BTSE.Icons = BTSE.Icons or {};

BTSE.Farming["debugMode"] = false;

BTSE.Icons["farming"] = "media/ui/btse_icons_farming.png";

-- logging, needed despite being redundant, for shared distribution when permitted

function BTSE.Farming:log(message, isError)
	if isClient()
	then
		return;
	end

    if BTSE.Farming["debugMode"] or isError
    then
        local file = getFileWriter("btse_farming/" .. (isError
			and "error"
			or "debug"
		) .. ".log", true, true);

        if not file
        then
            print("ERROR: Unable to write to log file. Exiting.");
        end

        file:write("[" .. tostring(Calendar.getInstance():getTimeInMillis()) .. "] " .. tostring(message) .. "\n");
        file:close();
    end
end

function BTSE.Farming:logError(message)
    BTSE.Farming:log(message, true);
end

function BTSE.Farming:logArray(array, indent, path)
	indent = indent or "";
	path = path or "";

	for k, v in pairs(array)
	do
		if type(v) == "table"
		then
			BTSE.Farming:log(string.format("%s - (%s) %s%s:", indent, type(v), path, tostring(k)));

			BTSE.Farming:logArray(v, "   " .. indent, string.format("%s%s.", path, k));
		elseif type(v) == "function"
		then
			BTSE.Farming:log(string.format("%s - (%s) %s%s", indent, type(v), path, tostring(k)));
		else
			BTSE.Farming:log(string.format("%s - (%s) %s%s = %s", indent, type(v), path, tostring(k), tostring(v)));
		end
	end
end

-- helpers

function BTSE.Farming:printSquareCoords(square)
    return tostring(math.floor(square:getX())) .. "," .. tostring(math.floor(square:getY())) .. "," .. tostring(math.floor(square:getZ()));
end