require "Definitions/FitnessExercises"

FitnessExercises.exercisesType.benchpress = {
		type = "benchpress",
		name=getText("IGUI_BenchPress"),
		tooltip=getText("IGUI_BenchPress_Tooltip"),
		stiffness="arms,chest",
		metabolics = Metabolics.FitnessHeavy,
		xpMod = 1.5,
	}

FitnessExercises.exercisesType.treadmill = {
		type = "treadmill",
		name=getText("IGUI_Treadmill"),
		tooltip=getText("IGUI_Treadmill_Tooltip"),
		stiffness="legs", 
		metabolics = Metabolics.Fitness,
		xpMod = 0.8,
	}
