local LibertySuburbDistributions = {

    all = {
        LCPayC = {
            rolls = 2,
            items = {
                "Base.Money", 100,
		"Base.Money", 75,
		"Base.PopEmpty", 50,
		"Base.PopEmpty", 75,
		"Base.Cigarettes", 75,
		"Base.Tissue", 75,
                   }
            },
    }
}

table.insert(Distributions, 2, LibertySuburbDistributions);