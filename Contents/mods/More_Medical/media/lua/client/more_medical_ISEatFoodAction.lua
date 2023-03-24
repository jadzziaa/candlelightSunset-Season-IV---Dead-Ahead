local oldISEatFoodAction_adjustMaxTime = ISEatFoodAction.adjustMaxTime
function ISEatFoodAction:adjustMaxTime(maxtime)
    if string.sub(self.item:getFullType(), 0, 19) == "MoreMedical.Syrette" then
        return 100
    else
        return oldISEatFoodAction_adjustMaxTime(self, maxtime)
    end
end
