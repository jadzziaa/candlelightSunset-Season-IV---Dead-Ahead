require "Chat/ISChat";

local vanillaCmdEntered = ISChat["onCommandEntered"];

ISChat["onCommandEntered"] = function(self)
	local text = ISChat.instance.textEntry:getText();

	if not text or text == ""
	then
		return;
	end

    if text
    then
		-- /globalwater|globalpower on|off

        local isWater = luautils.stringStarts(text, "/globalwater ");
        local isPower = luautils.stringStarts(text, "/globalpower ");

        if (isWater or isPower) and (WaterPower:userIsAdmin() or WaterPower:gameIsSP())
        then
            local state = string.trim(string.sub(text, 13));

            WaterPower:toggle(isWater
                and "water"
                or "power",
            state);

            ISChat.instance:unfocus();

            ISChat.instance.timerTextEntry = 20;
            doKeyPress(false);

            return;
        end
    end

    vanillaCmdEntered();
end