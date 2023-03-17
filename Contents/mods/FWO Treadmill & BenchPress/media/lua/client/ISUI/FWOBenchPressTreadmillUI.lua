require "ISUI/ISFitnessUI"

function ISFitnessUI:updateExercises()
	self.exercises:clear();
	
	for i,v in pairs(FitnessExercises.exercisesType) do
		if i ~= "treadmill" and i ~= "benchpress" then
			self:addExerciseToList(i, v);
		end
	end

end	