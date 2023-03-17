ExpRecovery.ISReadABook_start = ExpRecovery.ISReadABook_start or ISReadABook.start
local ISReadABook_start = ExpRecovery.ISReadABook_start

function ISReadABook:start()

	ISReadABook_start(self)
	
	local skill_book = SkillBook[self.item:getSkillTrained()]

	if not skill_book then
		return
	end

	ExpRecovery.ReadingInfo = {
		Item = self.item,
		Character = self.character,
		Perk = skill_book.perk,
	}

	if not SandboxVars.ExpRecovery.DontSaveWhileReading then
		return	
	end

	ExpRecovery:SetBlocked(true)

end

ExpRecovery.ISReadABook_stop = ExpRecovery.ISReadABook_stop or ISReadABook.stop
local ISReadABook_stop = ExpRecovery.ISReadABook_stop

function ISReadABook:stop()

	ISReadABook_stop(self)
	
	if not SkillBook[self.item:getSkillTrained()] or not SandboxVars.ExpRecovery.DontSaveWhileReading then
		return	
	end

	ExpRecovery:SetBlocked(false)

end

ExpRecovery.ISReadABook_perform = ExpRecovery.ISReadABook_perform or ISReadABook.perform
local ISReadABook_perform = ExpRecovery.ISReadABook_perform

function ISReadABook:perform()

	ISReadABook_perform(self)

	local skill_book = SkillBook[self.item:getSkillTrained()]

	if not skill_book then
		return
	end

	ExpRecovery:GiveMissedExpForPerk(self.character, skill_book.perk, math.ceil(self.item:getLvlSkillTrained() / 2))

end