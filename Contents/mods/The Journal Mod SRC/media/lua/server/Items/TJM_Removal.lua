require "Items/SuburbsDistributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"

	--Tried ItemTweaker, Tried Override. Fuck it, trying this.
	RemoveItemFromDistribution(Distributions[1],				"Journal",	nil, true);

	RemoveItemFromDistribution(SuburbsDistributions,			"Journal",	nil, true);
	
	RemoveItemFromDistribution(VehicleDistributions.Heralds,	"Journal",	nil, true);
	
	RemoveItemFromDistribution(ProceduralDistributions.list,	"Journal",	nil, true);
	
	-- old broke shit?
	-- RemoveItemFromDistribution(SuburbsDistributions.list, "Journal",	nil, true);
	-- RemoveItemFromDistribution(ProceduralDistributions.list, "Journal",	nil, true);
	-- RemoveItemFromDistribution(VehicleDistributions.list, "Journal",	nil, true);