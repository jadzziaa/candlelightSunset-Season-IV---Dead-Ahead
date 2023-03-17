local old_ISPadlockAction_perform = ISPadlockAction.perform

function ISPadlockAction:perform()

	self.character:playSound("UnlockDoor")
	
	--print("TEST-1")
	if self.lock == false then
		--print("TEST-2")
		if self.thump:isDoor() then
			self.thump:setLockedByPadlock(false);
			self.thump:setLockedByKey(false);
		end
    end
	
    old_ISPadlockAction_perform(self)
end