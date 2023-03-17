require 'Items/ProceduralDistributions'

local function preDistributionMerge()

	if SandboxVars.STR.LootZones and getActivatedMods():contains("RavenCreek") then

		if not SandboxVars.STR.DuffelLoot then

			ProceduralDistributions.list.LaundryInmateRavenCreek = {
				rolls = 1,
				items = {
					"STR.Boilersuit_RavenCreekPrisoner", 50,
					"STR.Boilersuit_RavenCreekPrisoner", 40,
				},
				junk = {
					rolls = 1,
					items = {
					
					}
				}
			}

			ProceduralDistributions.list.PrisonCellRavenCreekRandom = {
				rolls = 4,
				items = {
					"Antibiotics", 0.25,
					"Bandage", 0.25,
					"Radio.CDplayer", 1,
					"Cereal", 4,
					"Chocolate", 4,
					"CordlessPhone", 0.01,
					"Crisps", 10,
					"HottieZ", 0.01,
					"Magazine", 10,
					"Newspaper", 10,
					"Notebook", 10,
					"Pencil", 10,
					"Pills", 0.5,
					"Radio.RadioBlack", 1,
					"Ramen", 10,
					"SheetPaper2", 20,
					"Teabag2", 6,
					"TunaTin", 4,
					"WhiskeyFull", 0.01,
				},
				junk = {
					rolls = 1,
					items = {
						"BathTowel", 20,
						"STR.Boilersuit_RavenCreekPrisoner", 80,
						"Bowl", 10,
						"ButterKnife", 0.05,
						"Cigarettes", 8,
						"Comb", 4,
						"Crayons", 8,
						"Doll", 4,
						"KitchenKnife", 0.01,
						"Lighter", 4,
						"Matches", 8,
						"Mirror", 8,
						"Mugl", 4,
						"MugRed", 4,
						"MugWhite", 4,
						"Shoes_FlipFlop", 6,
						"Soap2", 10,
						"Socks_Ankle", 4,
						"Spiffo", 0.001,
						"Spoon", 20,
						"Toothbrush", 10,
						"Toothpaste", 10,
						"ToyBear", 4,
					}
				}
			}

			ProceduralDistributions.list.LockerRavenCreekPD = {
				rolls = 4,
				items = {
					"Bag_DuffelBagTINT", 0.5,
					"Bag_FannyPackFront", 0.8,
					"Bag_Satchel", 0.2,
					"Belt2", 2,
					"Briefcase", 0.2,
					"Disc_Retail", 2,
					"Earbuds", 1,
					"Glasses_Aviators", 1,
					"Hat_CrashHelmet_Police", 1,
					"Hat_EarMuff_Protectors", 1,
					"Headphones", 1,
					"HolsterDouble", 0.5,
					"HolsterSimple", 2,
					"Lunchbox", 1,
					"Lunchbox2", 1,
					"Nightstick", 2,
					"Radio.CDplayer", 2,
					"Radio.WalkieTalkie4", 1,
					"Shoes_Black", 6,
					"Shoes_Brown", 6,
					"Suitcase", 0.2,
					"STR.Hat_Riot_Helmet_RavenCreek", 1.5,
					"STR.Gloves_Leather_Black", 2,
					"STR.Gloves_Leather_Brown", 2,
					"STR.Gloves_Dress_White", 1,
					"STR.Jacket_Dress_Police_RavenCreek", 2,
					"STR.Hat_Police_RavenCreek", 4,
					"STR.Jacket_Police_RavenCreek", 4,
					"STR.Shirt_Police_RavenCreek", 10,
					"STR.TShirt_Police_RavenCreek", 10,
					"STR.Trousers_Police_RavenCreek", 8,
					"STR.Belt_PoliceDuty", 2,
					"STR.Chest_Walkie", 2,
					"Vest_BulletPolice", 1,
				},
				junk = {
					rolls = 1,
					items = {
					
					}
				}
			}

			ProceduralDistributions.list.LockerRavenCreekFD = {
				rolls = 4,
				items = {
					"Bag_DuffelBagTINT", 0.5,
					"Bag_FannyPackFront", 0.8,
					"Belt2", 2,
					"Briefcase", 0.2,
					"Disc_Retail", 2,
					"Earbuds", 1,
					"Glasses_Aviators", 1,
					"Hat_GasMask", 0.5,
					"Headphones", 1,
					"Lunchbox", 1,
					"Lunchbox2", 1,
					"Radio.CDplayer", 2,
					"Radio.WalkieTalkie4", 1,
					"Shirt_Denim", 8,
					"Shirt_Lumberjack", 6,
					"Shoes_ArmyBoots", 4,
					"Shoes_ArmyBoots", 4,
					"Socks_Ankle", 8,
					"Socks_Long", 6,
					"Suitcase", 0.2,
					"STR.Gloves_Dress_White", 1,
					"STR.Tie_Full_EMS_RavenCreek", 0.5,
					"STR.Tie_Worn_EMS_RavenCreek", 0.5,
					"STR.Tie_Full_Fire_RavenCreek", 0.5,
					"STR.Tie_Worn_Fire_RavenCreek", 0.5,
					"STR.Hat_BaseballCap_EMS_RavenCreek", 1,
					"STR.Hat_EMS_RavenCreek", 1,
					"STR.Hat_EMS_RavenCreek_Supervisor", 1,
					"STR.Hat_EMS_RavenCreek_Supervisor_White", 1,
					"STR.Hat_Fire_RavenCreek", 1,
					"STR.Hat_Fire_Supervisor_RavenCreek", 1,
					"STR.Hat_Fire_Supervisor_RavenCreek_White", 1,
					"STR.Jacket_Dress_EMS_RavenCreek", 2,
					"STR.Jacket_Dress_EMS_Supervisor_RavenCreek", 2,
					"STR.Jacket_Dress_Fire_RavenCreek", 2,
					"STR.Trousers_EMS_RavenCreek", 3,
					"STR.Trousers_Fire_Formal_RavenCreek", 3,
					"STR.Shirt_EMS_RavenCreek", 1,
					"STR.TShirt_EMS_RavenCreek", 1,
					"STR.Shirt_EMS_Supervisor_RavenCreek", 2,
					"STR.TShirt_EMS_Supervisor_RavenCreek", 2,
					"STR.Shirt_Fire_RavenCreek", 2,
					"STR.TShirt_Fire_RavenCreek", 2,
					"STR.Shirt_Fire_Supervisor_RavenCreek", 1,
					"STR.TShirt_Fire_Supervisor_RavenCreek", 1,
					"STR.Gloves_Fireman_Khaki", 2,
					"STR.Gloves_Fireman_Khaki_Simple", 2,
					"STR.Gloves_Fireman_Black", 2,
					"STR.Gloves_Fireman_Black_Simple", 2,
					"STR.Hat_Fireman_RavenCreek_Blue", 2,
					"STR.Hat_Fireman_RavenCreek_Black", 2,
					"STR.Hat_Fireman_RavenCreek_Red", 2,
					"STR.Jacket_EMS_RavenCreek", 2,
					"STR.Hat_Fireman_RavenCreek_Yellow", 2,
					"STR.Jacket_Fireman_RavenCreek_Black", 4,
					"STR.Jacket_Fireman_RavenCreek_Khaki", 4,
					"STR.Trousers_Fireman_RavenCreek_Black", 6,
					"STR.Trousers_Fireman_RavenCreek_Khaki", 6,
					"STR.TShirt_Profession_FiremanBlue_RavenCreek", 6,
					"STR.TShirt_Profession_FiremanRed_RavenCreek", 6,
					"STR.TShirt_Profession_FiremanRed_RavenCreek02", 6,
					"STR.TShirt_Profession_FiremanWhite_RavenCreek", 6,
				},
				junk = {
					rolls = 1,
					items = {
					
					}
				}
			}

		elseif SandboxVars.STR.DuffelLoot then

			ProceduralDistributions.list.LaundryInmateLouisville = {
				rolls = 1,
				items = {
					"STR.Boilersuit_RavenCreekPrisoner", 50,
					"STR.Boilersuit_RavenCreekPrisoner", 40,
				},
				junk = {
					rolls = 1,
					items = {
					
					}
				}
			}

			ProceduralDistributions.list.PrisonCellRavenCreekRandom = {
				rolls = 4,
				items = {
					"Antibiotics", 0.25,
					"Bandage", 0.25,
					"Radio.CDplayer", 1,
					"Cereal", 4,
					"Chocolate", 4,
					"CordlessPhone", 0.01,
					"Crisps", 10,
					"HottieZ", 0.01,
					"Magazine", 10,
					"Newspaper", 10,
					"Notebook", 10,
					"Pencil", 10,
					"Pills", 0.5,
					"Radio.RadioBlack", 1,
					"Ramen", 10,
					"SheetPaper2", 20,
					"Teabag2", 6,
					"TunaTin", 4,
					"WhiskeyFull", 0.01,
				},
				junk = {
					rolls = 1,
					items = {
						"BathTowel", 20,
						"STR.Boilersuit_RavenCreekPrisoner", 80,
						"Bowl", 10,
						"ButterKnife", 0.05,
						"Cigarettes", 8,
						"Comb", 4,
						"Crayons", 8,
						"Doll", 4,
						"KitchenKnife", 0.01,
						"Lighter", 4,
						"Matches", 8,
						"Mirror", 8,
						"Mugl", 4,
						"MugRed", 4,
						"MugWhite", 4,
						"Shoes_FlipFlop", 6,
						"Soap2", 10,
						"Socks_Ankle", 4,
						"Spiffo", 0.001,
						"Spoon", 20,
						"Toothbrush", 10,
						"Toothpaste", 10,
						"ToyBear", 4,
					}
				}
			}

			ProceduralDistributions.list.LockerRavenCreekPD = {
				rolls = 4,
				items = {
					--"Bag_DuffelBagTINT", 0.5,
					"Bag_FannyPackFront", 0.8,
					"Bag_Satchel", 0.2,
					"Belt2", 2,
					"Briefcase", 0.2,
					"Disc_Retail", 2,
					"Earbuds", 1,
					"Glasses_Aviators", 1,
					"Hat_CrashHelmet_Police", 1,
					"Hat_EarMuff_Protectors", 1,
					"Headphones", 1,
					"HolsterDouble", 0.5,
					"HolsterSimple", 2,
					"Lunchbox", 1,
					"Lunchbox2", 1,
					"Nightstick", 2,
					"Radio.CDplayer", 2,
					"Radio.WalkieTalkie4", 1,
					"Shoes_Black", 6,
					"Shoes_Brown", 6,
					"Suitcase", 0.2,
					"STR.Bag_DuffelBag_Police_Black", 0.5,
					"STR.Bag_DuffelBag_Police_Navy", 0.5,
					"STR.Bag_DuffelBag_Police_Olive", 0.5,
					"STR.Hat_Riot_Helmet_RavenCreek", 1.5,
					"STR.Gloves_Leather_Black", 2,
					"STR.Gloves_Leather_Brown", 2,
					"STR.Gloves_Dress_White", 1,
					"STR.Jacket_Dress_Police_RavenCreek", 2,
					"STR.Hat_Police_RavenCreek", 4,
					"STR.Jacket_Police_RavenCreek", 4,
					"STR.Shirt_Police_RavenCreek", 10,
					"STR.TShirt_Police_RavenCreek", 10,
					"STR.Trousers_Police_RavenCreek", 8,
					"STR.Belt_PoliceDuty", 2,
					"STR.Chest_Walkie", 2,
					"Vest_BulletPolice", 1,
				},
				junk = {
					rolls = 1,
					items = {
					
					}
				}
			}

			ProceduralDistributions.list.LockerRavenCreekFD = {
				rolls = 4,
				items = {
					--"Bag_DuffelBagTINT", 0.5,
					"Bag_FannyPackFront", 0.8,
					"Belt2", 2,
					"Briefcase", 0.2,
					"Disc_Retail", 2,
					"Earbuds", 1,
					"Glasses_Aviators", 1,
					"Hat_GasMask", 0.5,
					"Headphones", 1,
					"Lunchbox", 1,
					"Lunchbox2", 1,
					"Radio.CDplayer", 2,
					"Radio.WalkieTalkie4", 1,
					"Shirt_Denim", 8,
					"Shirt_Lumberjack", 6,
					"Shoes_ArmyBoots", 4,
					"Shoes_ArmyBoots", 4,
					"Socks_Ankle", 8,
					"Socks_Long", 6,
					"Suitcase", 0.2,
					"STR.Gloves_Dress_White", 1,
					"STR.Tie_Full_EMS_RavenCreek", 0.5,
					"STR.Tie_Worn_EMS_RavenCreek", 0.5,
					"STR.Tie_Full_Fire_RavenCreek", 0.5,
					"STR.Tie_Worn_Fire_RavenCreek", 0.5,
					"STR.Hat_BaseballCap_EMS_RavenCreek", 1,
					"STR.Hat_EMS_RavenCreek", 1,
					"STR.Hat_EMS_RavenCreek_Supervisor", 1,
					"STR.Hat_EMS_RavenCreek_Supervisor_White", 1,
					"STR.Hat_Fire_RavenCreek", 1,
					"STR.Hat_Fire_Supervisor_RavenCreek", 1,
					"STR.Hat_Fire_Supervisor_RavenCreek_White", 1,
					"STR.Jacket_Dress_EMS_RavenCreek", 2,
					"STR.Jacket_Dress_EMS_Supervisor_RavenCreek", 2,
					"STR.Jacket_Dress_Fire_RavenCreek", 2,
					"STR.Trousers_EMS_RavenCreek", 3,
					"STR.Trousers_Fire_Formal_RavenCreek", 3,
					"STR.Shirt_EMS_RavenCreek", 1,
					"STR.TShirt_EMS_RavenCreek", 1,
					"STR.Shirt_EMS_Supervisor_RavenCreek", 2,
					"STR.TShirt_EMS_Supervisor_RavenCreek", 2,
					"STR.Shirt_Fire_RavenCreek", 2,
					"STR.TShirt_Fire_RavenCreek", 2,
					"STR.Shirt_Fire_Supervisor_RavenCreek", 1,
					"STR.TShirt_Fire_Supervisor_RavenCreek", 1,
					"STR.Bag_DuffelBag_Fire_Black", 0.5,
					"STR.Bag_DuffelBag_Fire_Khaki", 0.5,
					"STR.Gloves_Fireman_Khaki", 2,
					"STR.Gloves_Fireman_Khaki_Simple", 2,
					"STR.Gloves_Fireman_Black", 2,
					"STR.Gloves_Fireman_Black_Simple", 2,
					"STR.Hat_Fireman_RavenCreek_Blue", 2,
					"STR.Hat_Fireman_RavenCreek_Black", 2,
					"STR.Hat_Fireman_RavenCreek_Red", 2,
					"STR.Jacket_EMS_RavenCreek", 2,
					"STR.Hat_Fireman_RavenCreek_Yellow", 2,
					"STR.Jacket_Fireman_RavenCreek_Black", 4,
					"STR.Jacket_Fireman_RavenCreek_Khaki", 4,
					"STR.Trousers_Fireman_RavenCreek_Black", 6,
					"STR.Trousers_Fireman_RavenCreek_Khaki", 6,
					"STR.TShirt_Profession_FiremanBlue_RavenCreek", 6,
					"STR.TShirt_Profession_FiremanRed_RavenCreek", 6,
					"STR.TShirt_Profession_FiremanRed_RavenCreek02", 6,
					"STR.TShirt_Profession_FiremanWhite_RavenCreek", 6,
				},
				junk = {
					rolls = 1,
					items = {
					
					}
				}
			}
		end
	end
end

Events.OnPreDistributionMerge.Add(preDistributionMerge);