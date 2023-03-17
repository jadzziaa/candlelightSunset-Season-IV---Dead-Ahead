local distributionTable = VehicleDistributions[1]

local function STRVehicleDistro()

	if not SandboxVars.STR.DuffelLoot then

		VehicleDistributions.SheriffTruckBed = {
			rolls = 4,
			items = {
				"308Box", 10,
				"AmmoStrap_Bullets", 4,
				"AmmoStrap_Shells", 4,
				"AssaultRifle2", 1,
				"Bullets9mmBox", 10,
				"Bullets9mmBox", 20,
				"DuctTape", 8,
				"EmptyPetrolCan", 10,
				"EmptySandbag", 4,
				"FiberglassStock", 4,
				"Garbagebag", 6,
				"HandTorch", 4,
				"Hat_CrashHelmet_Police", 2,
				"Hat_EarMuff_Protectors", 4,
				"HolsterDouble", 1,
				"HolsterSimple", 4,
				"HuntingRifle", 8,
				"M14Clip", 4,
				"Mov_RoadBarrier", 10,
				"Mov_RoadCone", 10,
				"Nightstick", 2,
				"Pistol", 10,
				"Plasticbag", 10,
				"PopBottleEmpty", 4,
				"PopEmpty", 4,
				"Radio.WalkieTalkie4", 10,
				"RubberBand", 6,
				"Shotgun", 10,
				"ShotgunShellsBox", 10,
				"Sling", 4,
				"Tarp", 10,
				"Tissue", 10,
				"ToiletPaper", 6,
				"Tote", 6,
				"Twine", 10,
				"STR.Vest_BulletPolice_Meade", 2,
				"WaterBottleEmpty", 4,
				"WhiskeyEmpty", 1,
				"x2Scope", 4,
				"x4Scope", 2,
				"x8Scope", 1,
			},
			junk = {
				rolls = 1,
				items = {
					"BaseballBat", 1,
					"FirstAidKit", 20,
					"FirstAidKit", 4,
					"Jack", 2,
					"LugWrench", 8,
					"Screwdriver", 10,
					"TirePump", 8,
					"Wrench", 8,
				}
			}
		}

		VehicleDistributions.Sheriff = {
			TruckBed = VehicleDistributions.SheriffTruckBed;

			GloveBox = VehicleDistributions.PoliceGloveBox;

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;
		}

		VehicleDistributions.PrisonBusRavenCreek = {
			TruckBed = {
				rolls = 4,
				items = {
					"308Box", 10,
					"AmmoStrap_Bullets", 4,
					"AmmoStrap_Shells", 4,
					"AssaultRifle2", 1,
					"Bullets9mmBox", 20,
					"Bullets9mmBox", 10,
					"FiberglassStock", 4,
					"HandTorch", 4,
					"Hat_CrashHelmet_Police", 2,
					"Hat_EarMuff_Protectors", 4,
					"HolsterDouble", 1,
					"HolsterSimple", 4,
					"HuntingRifle", 8,
					"M14Clip", 4,
					"Nightstick", 8,
					"Pistol", 10,
					"Radio.WalkieTalkie4", 10,
					"Shotgun", 10,
					"ShotgunShellsBox", 10,
					"Sling", 4,
					"x2Scope", 4,
					"x4Scope", 2,
					"x8Scope", 1,
					"STR.Boilersuit_RavenCreekPrisoner", 6,
				},
				junk = {
					rolls = 1,
					items = {
						"FirstAidKit", 20,
						"Radio.HamRadio1", 20,
						"Spoon", 5,
						"Fork", 5,
						"ButterKnife", 5,
					}
				}
			},

			GloveBox = {
				rolls = 4,
				items = {
					"AlcoholWipes", 8,
					"Bandage", 4,
					"Bandaid", 10,
					"Battery", 10,
					"BluePen", 8,
					"Bullets9mmBox", 20,
					"Bullets9mmBox", 10,
					"Disc_Retail", 2,
					"Eraser", 6,
					"HandTorch", 4,
					"Magazine", 10,
					"Notebook", 10,
					"Paperclip", 4,
					"Pen", 8,
					"Pencil", 10,
					"Radio.WalkieTalkie4", 10,
					"RedPen", 8,
					"RubberBand", 6,
					"Tissue", 10,
				},
				junk = {
					rolls = 1,
					items = {
						"Base.MarchRidgeMap", 4,
						"Base.MuldraughMap", 4,
						"Base.RiversideMap", 4,
						"Base.RosewoodMap", 4,
						"Base.WestpointMap", 4,
						"Cigarettes", 8,
						"FirstAidKit", 20,
						"Glasses_Aviators", 0.5,
						"Gloves_LeatherGlovesBlack", 0.5,
						"HandTorch", 4,
						"HuntingKnife", 0.1,
						"Lighter", 4,
						"Matches", 8,
						"Pistol", 20,
						"Scotchtape", 8,
						"ToiletPaper", 4,
						"Twine", 10,
					}
				}
			},

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;
		}

		VehicleDistributions.PrisonBusJefferson = {
			TruckBed = {
				rolls = 4,
				items = {
					"308Box", 10,
					"AmmoStrap_Bullets", 4,
					"AmmoStrap_Shells", 4,
					"AssaultRifle2", 1,
					"Bullets9mmBox", 20,
					"Bullets9mmBox", 10,
					"FiberglassStock", 4,
					"HandTorch", 4,
					"Hat_CrashHelmet_Police", 2,
					"Hat_EarMuff_Protectors", 4,
					"HolsterDouble", 1,
					"HolsterSimple", 4,
					"HuntingRifle", 8,
					"M14Clip", 4,
					"Nightstick", 8,
					"Pistol", 10,
					"Radio.WalkieTalkie4", 10,
					"Shotgun", 10,
					"ShotgunShellsBox", 10,
					"Sling", 4,
					"x2Scope", 4,
					"x4Scope", 2,
					"x8Scope", 1,
					"STR.Boilersuit_JeffersonPrisoner", 6,
				},
				junk = {
					rolls = 1,
					items = {
						"FirstAidKit", 20,
						"Radio.HamRadio1", 20,
						"Spoon", 5,
						"Fork", 5,
						"ButterKnife", 5,
					}
				}
			},

			GloveBox = {
				rolls = 4,
				items = {
					"AlcoholWipes", 8,
					"Bandage", 4,
					"Bandaid", 10,
					"Battery", 10,
					"BluePen", 8,
					"Bullets9mmBox", 20,
					"Bullets9mmBox", 10,
					"Disc_Retail", 2,
					"Eraser", 6,
					"HandTorch", 4,
					"Magazine", 10,
					"Notebook", 10,
					"Paperclip", 4,
					"Pen", 8,
					"Pencil", 10,
					"Radio.WalkieTalkie4", 10,
					"RedPen", 8,
					"RubberBand", 6,
					"Tissue", 10,
				},
				junk = {
					rolls = 1,
					items = {
						"Base.MarchRidgeMap", 4,
						"Base.MuldraughMap", 4,
						"Base.RiversideMap", 4,
						"Base.RosewoodMap", 4,
						"Base.WestpointMap", 4,
						"Cigarettes", 8,
						"FirstAidKit", 20,
						"Glasses_Aviators", 0.5,
						"Gloves_LeatherGlovesBlack", 0.5,
						"HandTorch", 4,
						"HuntingKnife", 0.1,
						"Lighter", 4,
						"Matches", 8,
						"Pistol", 20,
						"Scotchtape", 8,
						"ToiletPaper", 4,
						"Twine", 10,
					}
				}
			},

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;
		}

		VehicleDistributions.PrisonBusMeade = {
			TruckBed = {
				rolls = 4,
				items = {
					"308Box", 10,
					"AmmoStrap_Bullets", 4,
					"AmmoStrap_Shells", 4,
					"AssaultRifle2", 1,
					"Bullets9mmBox", 20,
					"Bullets9mmBox", 10,
					"FiberglassStock", 4,
					"HandTorch", 4,
					"Hat_CrashHelmet_Police", 2,
					"Hat_EarMuff_Protectors", 4,
					"HolsterDouble", 1,
					"HolsterSimple", 4,
					"HuntingRifle", 8,
					"M14Clip", 4,
					"Nightstick", 8,
					"Pistol", 10,
					"Radio.WalkieTalkie4", 10,
					"Shotgun", 10,
					"ShotgunShellsBox", 10,
					"Sling", 4,
					"x2Scope", 4,
					"x4Scope", 2,
					"x8Scope", 1,
					"STR.Boilersuit_MeadeGenPopPrisoner", 6,
					"STR.Boilersuit_MeadeLowRiskPrisoner", 4,
				},
				junk = {
					rolls = 1,
					items = {
						"FirstAidKit", 20,
						"Radio.HamRadio1", 20,
						"Spoon", 5,
						"Fork", 5,
						"ButterKnife", 5,
					}
				}
			},

			GloveBox = {
				rolls = 4,
				items = {
					"AlcoholWipes", 8,
					"Bandage", 4,
					"Bandaid", 10,
					"Battery", 10,
					"BluePen", 8,
					"Bullets9mmBox", 20,
					"Bullets9mmBox", 10,
					"Disc_Retail", 2,
					"Eraser", 6,
					"HandTorch", 4,
					"Magazine", 10,
					"Notebook", 10,
					"Paperclip", 4,
					"Pen", 8,
					"Pencil", 10,
					"Radio.WalkieTalkie4", 10,
					"RedPen", 8,
					"RubberBand", 6,
					"Tissue", 10,
				},
				junk = {
					rolls = 1,
					items = {
						"Base.MarchRidgeMap", 4,
						"Base.MuldraughMap", 4,
						"Base.RiversideMap", 4,
						"Base.RosewoodMap", 4,
						"Base.WestpointMap", 4,
						"Cigarettes", 8,
						"FirstAidKit", 20,
						"Glasses_Aviators", 0.5,
						"Gloves_LeatherGlovesBlack", 0.5,
						"HandTorch", 4,
						"HuntingKnife", 0.1,
						"Lighter", 4,
						"Matches", 8,
						"Pistol", 20,
						"Scotchtape", 8,
						"ToiletPaper", 4,
						"Twine", 10,
					}
				}
			},

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;
		}

		VehicleDistributions.AmbulanceJefferson = {
			TruckBed = {
				rolls = 4,
				items = {
					"AlcoholWipes", 10,
					"Antibiotics", 4,
					"Bag_MedicalBag", 10,
					"Bag_MedicalBag", 20,
					"Bandage", 10,
					"Corset_Medical", 2,
					"CottonBalls", 10,
					"Disinfectant", 10,
					"DuctTape", 8,
					"EmptyPetrolCan", 10,
					"EmptySandbag", 4,
					"Garbagebag", 6,
					"Gloves_Surgical", 10,
					"Hat_SurgicalCap_Blue", 10,
					"Hat_SurgicalMask_Blue", 10,
					"HospitalGown", 18,
					"Mov_MobileBloodbag", 10,
					"Pills", 10,
					"Pills", 10,
					"PillsAntiDep", 10,
					"PillsBeta", 10,
					"PillsSleepingTablets", 10,
					"Plasticbag", 10,
					"PopBottleEmpty", 4,
					"PopEmpty", 4,
					"RubberBand", 6,
					"Scalpel", 10,
					"Scissors", 10,
					"Shirt_Scrubs", 8,
					"SutureNeedle", 10,
					"SutureNeedleHolder", 10,
					"Tarp", 10,
					"Tissue", 10,
					"ToiletPaper", 6,
					"Tote", 6,
					"Trousers_Scrubs", 8,
					"Tweezers", 10,
					"Twine", 10,
					"WaterBottleEmpty", 4,
					"WhiskeyEmpty", 1,
					"STR.Hat_BaseballCap_EMS_Jefferson", 4,
					"STR.Jacket_EMS_Jefferson", 4,
				},
				junk = {
					rolls = 1,
					items = {
						"Bag_MedicalBag", 100,
						"CarBattery2", 4,
						"Jack", 2,
						"LugWrench", 8,
						"NormalTire2", 10,
						"Screwdriver", 10,
						"TirePump", 8,
						"Wrench", 8,
					}
				}
			},

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;
			
			GloveBox = VehicleDistributions.GloveBox;

		}

		VehicleDistributions.AmbulanceMeade = {
			TruckBed = {
				rolls = 4,
				items = {
					"AlcoholWipes", 10,
					"Antibiotics", 4,
					"Bag_MedicalBag", 10,
					"Bag_MedicalBag", 20,
					"Bandage", 10,
					"Corset_Medical", 2,
					"CottonBalls", 10,
					"Disinfectant", 10,
					"DuctTape", 8,
					"EmptyPetrolCan", 10,
					"EmptySandbag", 4,
					"Garbagebag", 6,
					"Gloves_Surgical", 10,
					"Hat_SurgicalCap_Blue", 10,
					"Hat_SurgicalMask_Blue", 10,
					"HospitalGown", 18,
					"Mov_MobileBloodbag", 10,
					"Pills", 10,
					"Pills", 10,
					"PillsAntiDep", 10,
					"PillsBeta", 10,
					"PillsSleepingTablets", 10,
					"Plasticbag", 10,
					"PopBottleEmpty", 4,
					"PopEmpty", 4,
					"RubberBand", 6,
					"Scalpel", 10,
					"Scissors", 10,
					"Shirt_Scrubs", 8,
					"SutureNeedle", 10,
					"SutureNeedleHolder", 10,
					"Tarp", 10,
					"Tissue", 10,
					"ToiletPaper", 6,
					"Tote", 6,
					"Trousers_Scrubs", 8,
					"Tweezers", 10,
					"Twine", 10,
					"WaterBottleEmpty", 4,
					"WhiskeyEmpty", 1,
					"STR.Hat_BaseballCap_EMS_Meade", 4,
					"STR.Jacket_EMS_Meade", 4,
				},
				junk = {
					rolls = 1,
					items = {
						"Bag_MedicalBag", 100,
						"CarBattery2", 4,
						"Jack", 2,
						"LugWrench", 8,
						"NormalTire2", 10,
						"Screwdriver", 10,
						"TirePump", 8,
						"Wrench", 8,
					}
				}
			},

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;
			
			GloveBox = VehicleDistributions.GloveBox;

		}

		VehicleDistributions.AmbulanceLouisville = {
			TruckBed = {
				rolls = 4,
				items = {
					"AlcoholWipes", 10,
					"Antibiotics", 4,
					"Bag_MedicalBag", 10,
					"Bag_MedicalBag", 20,
					"Bandage", 10,
					"Corset_Medical", 2,
					"CottonBalls", 10,
					"Disinfectant", 10,
					"DuctTape", 8,
					"EmptyPetrolCan", 10,
					"EmptySandbag", 4,
					"Garbagebag", 6,
					"Gloves_Surgical", 10,
					"Hat_SurgicalCap_Blue", 10,
					"Hat_SurgicalMask_Blue", 10,
					"HospitalGown", 18,
					"Mov_MobileBloodbag", 10,
					"Pills", 10,
					"Pills", 10,
					"PillsAntiDep", 10,
					"PillsBeta", 10,
					"PillsSleepingTablets", 10,
					"Plasticbag", 10,
					"PopBottleEmpty", 4,
					"PopEmpty", 4,
					"RubberBand", 6,
					"Scalpel", 10,
					"Scissors", 10,
					"Shirt_Scrubs", 8,
					"SutureNeedle", 10,
					"SutureNeedleHolder", 10,
					"Tarp", 10,
					"Tissue", 10,
					"ToiletPaper", 6,
					"Tote", 6,
					"Trousers_Scrubs", 8,
					"Tweezers", 10,
					"Twine", 10,
					"WaterBottleEmpty", 4,
					"WhiskeyEmpty", 1,
					"STR.Hat_BaseballCap_EMS_Louisville", 4,
					"STR.Jacket_EMS_Louisville", 4,
				},
				junk = {
					rolls = 1,
					items = {
						"Bag_MedicalBag", 100,
						"CarBattery2", 4,
						"Jack", 2,
						"LugWrench", 8,
						"NormalTire2", 10,
						"Screwdriver", 10,
						"TirePump", 8,
						"Wrench", 8,
					}
				}
			},

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;
			
			GloveBox = VehicleDistributions.GloveBox;

		}

		VehicleDistributions.AmbulanceRavenCreek = {
			TruckBed = {
				rolls = 4,
				items = {
					"AlcoholWipes", 10,
					"Antibiotics", 4,
					"Bag_MedicalBag", 10,
					"Bag_MedicalBag", 20,
					"Bandage", 10,
					"Corset_Medical", 2,
					"CottonBalls", 10,
					"Disinfectant", 10,
					"DuctTape", 8,
					"EmptyPetrolCan", 10,
					"EmptySandbag", 4,
					"Garbagebag", 6,
					"Gloves_Surgical", 10,
					"Hat_SurgicalCap_Blue", 10,
					"Hat_SurgicalMask_Blue", 10,
					"HospitalGown", 18,
					"Mov_MobileBloodbag", 10,
					"Pills", 10,
					"Pills", 10,
					"PillsAntiDep", 10,
					"PillsBeta", 10,
					"PillsSleepingTablets", 10,
					"Plasticbag", 10,
					"PopBottleEmpty", 4,
					"PopEmpty", 4,
					"RubberBand", 6,
					"Scalpel", 10,
					"Scissors", 10,
					"Shirt_Scrubs", 8,
					"SutureNeedle", 10,
					"SutureNeedleHolder", 10,
					"Tarp", 10,
					"Tissue", 10,
					"ToiletPaper", 6,
					"Tote", 6,
					"Trousers_Scrubs", 8,
					"Tweezers", 10,
					"Twine", 10,
					"WaterBottleEmpty", 4,
					"WhiskeyEmpty", 1,
					"STR.Hat_BaseballCap_EMS_RavenCreek", 4,
					"STR.Jacket_EMS_RavenCreek", 4,
				},
				junk = {
					rolls = 1,
					items = {
						"Bag_MedicalBag", 100,
						"CarBattery2", 4,
						"Jack", 2,
						"LugWrench", 8,
						"NormalTire2", 10,
						"Screwdriver", 10,
						"TirePump", 8,
						"Wrench", 8,
					}
				}
			},

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;
			
			GloveBox = VehicleDistributions.GloveBox;

		}

		VehicleDistributions.BankTruck = {
			TruckBed = {
				rolls = 6,
				items = {
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"STR.Jacket_Sweater_Security_Bank", 4,
					"STR.Jacket_Security_Bank", 4,
					"STR.Hat_Security_Bank", 2,
				},
				junk = {
					rolls = 1,
					items = {
					}
				}
			},

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;
			
			GloveBox = VehicleDistributions.GloveBox;

		}

		VehicleDistributions.FireTruckMeade = {
			TruckBed = {
				rolls = 4,
				items = {
					"Axe", 4,
					"Axe", 4,
					"Bandage", 10,
					"BucketEmpty", 4,
					"Disinfectant", 8,
					"STR.Hat_Fireman_Meade_Black", 4,
					"STR.Hat_Fireman_Meade_Red", 4,
					"STR.Hat_Fireman_Meade_Yellow", 4,
					"STR.Hat_Fireman_Meade_White", 4,
					"Hat_GasMask", 1,
					"STR.Jacket_Fireman_Meade_Black", 4,
					"STR.Jacket_Fireman_Meade_Khaki", 4,
					"LongJohns", 2,
					"PickAxe", 0.5,
					"Pills", 10,
					"Radio.WalkieTalkie4", 10,
					"Rope", 10,
					"Shoes_ArmyBoots", 4,
					"Socks_Long", 6,
					"Tarp", 10,
					"STR.Trousers_Fireman_Meade_Black", 8,
					"STR.Trousers_Fireman_Meade_Khaki", 8,
				},

				junk = {
					rolls = 1,
					items = {
						"FirstAidKit", 20,
					}
				}
			},

			TruckBedOpen = {
				rolls = 4,
				items = {
					"Axe", 4,
					"Axe", 4,
					"Bandage", 10,
					"BucketEmpty", 4,
					"Disinfectant", 8,
					"STR.Hat_Fireman_Meade_Black", 4,
					"STR.Hat_Fireman_Meade_Red", 4,
					"STR.Hat_Fireman_Meade_Yellow", 4,
					"STR.Hat_Fireman_Meade_White", 4,
					"Hat_GasMask", 1,
					"STR.Jacket_Fireman_Meade_Black", 4,
					"STR.Jacket_Fireman_Meade_Khaki", 4,
					"LongJohns", 2,
					"PickAxe", 0.5,
					"Pills", 10,
					"Radio.WalkieTalkie4", 10,
					"Rope", 10,
					"Shoes_ArmyBoots", 4,
					"Socks_Long", 6,
					"Tarp", 10,
					"STR.Trousers_Fireman_Meade_Black", 8,
					"STR.Trousers_Fireman_Meade_Khaki", 8,
				},

				junk = {
					rolls = 1,
					items = {
						"FirstAidKit", 20,
					}
				}
			},

			GloveBox = VehicleDistributions.GloveBox;

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;

		}

		VehicleDistributions.FireTruckLouisville = {
			TruckBed = {
				rolls = 4,
				items = {
					"Axe", 4,
					"Axe", 4,
					"Bandage", 10,
					"BucketEmpty", 4,
					"Disinfectant", 8,
					"STR.Hat_Fireman_Louisville_Black", 4,
					"STR.Hat_Fireman_Louisville_Red", 4,
					"STR.Hat_Fireman_Louisville_Yellow", 4,
					"Hat_GasMask", 1,
					"STR.Jacket_Fireman_Louisville_Black", 4,
					"STR.Jacket_Fireman_Louisville_Khaki", 4,
					"LongJohns", 2,
					"PickAxe", 0.5,
					"Pills", 10,
					"Radio.WalkieTalkie4", 10,
					"Rope", 10,
					"Shoes_ArmyBoots", 4,
					"Socks_Long", 6,
					"Tarp", 10,
					"STR.Trousers_Fireman_Louisville_Black", 8,
					"STR.Trousers_Fireman_Louisville_Khaki", 8,
				},

				junk = {
					rolls = 1,
					items = {
						"FirstAidKit", 20,
					}
				}
			},

			TruckBedOpen = {
				rolls = 4,
				items = {
					"Axe", 4,
					"Axe", 4,
					"Bandage", 10,
					"BucketEmpty", 4,
					"Disinfectant", 8,
					"STR.Hat_Fireman_Louisville_Black", 4,
					"STR.Hat_Fireman_Louisville_Red", 4,
					"STR.Hat_Fireman_Louisville_Yellow", 4,
					"Hat_GasMask", 1,
					"STR.Jacket_Fireman_Louisville_Black", 4,
					"STR.Jacket_Fireman_Louisville_Khaki", 4,
					"LongJohns", 2,
					"PickAxe", 0.5,
					"Pills", 10,
					"Radio.WalkieTalkie4", 10,
					"Rope", 10,
					"Shoes_ArmyBoots", 4,
					"Socks_Long", 6,
					"Tarp", 10,
					"STR.Trousers_Fireman_Louisville_Black", 8,
					"STR.Trousers_Fireman_Louisville_Khaki", 8,
				},

				junk = {
					rolls = 1,
					items = {
						"FirstAidKit", 20,
					}
				}
			},

			GloveBox = VehicleDistributions.GloveBox;

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;

		}

		VehicleDistributions.FireTruckRosewood = {
			TruckBed = {
				rolls = 4,
				items = {
					"Axe", 4,
					"Axe", 4,
					"Bandage", 10,
					"BucketEmpty", 4,
					"Disinfectant", 8,
					"STR.Hat_Fireman_Rosewood_Black", 4,
					"STR.Hat_Fireman_Rosewood_Red", 4,
					"STR.Hat_Fireman_Rosewood_Yellow", 4,
					"Hat_GasMask", 1,
					"STR.Jacket_Fireman_Rosewood_Black", 4,
					"STR.Jacket_Fireman_Rosewood_Khaki", 4,
					"LongJohns", 2,
					"PickAxe", 0.5,
					"Pills", 10,
					"Radio.WalkieTalkie4", 10,
					"Rope", 10,
					"Shoes_ArmyBoots", 4,
					"Socks_Long", 6,
					"Tarp", 10,
					"STR.Trousers_Fireman_Rosewood_Black", 8,
					"STR.Trousers_Fireman_Rosewood_Khaki", 8,
				},

				junk = {
					rolls = 1,
					items = {
						"FirstAidKit", 20,
					}
				}
			},

			TruckBedOpen = {
				rolls = 4,
				items = {
					"Axe", 4,
					"Axe", 4,
					"Bandage", 10,
					"BucketEmpty", 4,
					"Disinfectant", 8,
					"STR.Hat_Fireman_Rosewood_Black", 4,
					"STR.Hat_Fireman_Rosewood_Red", 4,
					"STR.Hat_Fireman_Rosewood_Yellow", 4,
					"Hat_GasMask", 1,
					"STR.Jacket_Fireman_Rosewood_Black", 4,
					"STR.Jacket_Fireman_Rosewood_Khaki", 4,
					"LongJohns", 2,
					"PickAxe", 0.5,
					"Pills", 10,
					"Radio.WalkieTalkie4", 10,
					"Rope", 10,
					"Shoes_ArmyBoots", 4,
					"Socks_Long", 6,
					"Tarp", 10,
					"STR.Trousers_Fireman_Rosewood_Black", 8,
					"STR.Trousers_Fireman_Rosewood_Khaki", 8,
				},

				junk = {
					rolls = 1,
					items = {
						"FirstAidKit", 20,
					}
				}
			},

			GloveBox = VehicleDistributions.GloveBox;

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;

		}

		VehicleDistributions.FireTruckRavenCreek = {
			TruckBed = {
				rolls = 4,
				items = {
					"Axe", 4,
					"Axe", 4,
					"Bandage", 10,
					"BucketEmpty", 4,
					"Disinfectant", 8,
					"STR.Hat_Fireman_RavenCreek_Black", 4,
					"STR.Hat_Fireman_RavenCreek_Red", 4,
					"STR.Hat_Fireman_RavenCreek_Yellow", 4,
					"Hat_GasMask", 1,
					"STR.Jacket_Fireman_RavenCreek_Black", 4,
					"STR.Jacket_Fireman_RavenCreek_Khaki", 4,
					"LongJohns", 2,
					"PickAxe", 0.5,
					"Pills", 10,
					"Radio.WalkieTalkie4", 10,
					"Rope", 10,
					"Shoes_ArmyBoots", 4,
					"Socks_Long", 6,
					"Tarp", 10,
					"STR.Trousers_Fireman_RavenCreek_Black", 8,
					"STR.Trousers_Fireman_RavenCreek_Khaki", 8,
				},

				junk = {
					rolls = 1,
					items = {
						"FirstAidKit", 20,
					}
				}
			},

			TruckBedOpen = {
				rolls = 4,
				items = {
					"Axe", 4,
					"Axe", 4,
					"Bandage", 10,
					"BucketEmpty", 4,
					"Disinfectant", 8,
					"STR.Hat_Fireman_RavenCreek_Black", 4,
					"STR.Hat_Fireman_RavenCreek_Red", 4,
					"STR.Hat_Fireman_RavenCreek_Yellow", 4,
					"Hat_GasMask", 1,
					"STR.Jacket_Fireman_RavenCreek_Black", 4,
					"STR.Jacket_Fireman_RavenCreek_Khaki", 4,
					"LongJohns", 2,
					"PickAxe", 0.5,
					"Pills", 10,
					"Radio.WalkieTalkie4", 10,
					"Rope", 10,
					"Shoes_ArmyBoots", 4,
					"Socks_Long", 6,
					"Tarp", 10,
					"STR.Trousers_Fireman_RavenCreek_Black", 8,
					"STR.Trousers_Fireman_RavenCreek_Khaki", 8,
				},

				junk = {
					rolls = 1,
					items = {
						"FirstAidKit", 20,
					}
				}
			},

			GloveBox = VehicleDistributions.GloveBox;

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;

		}

		VehicleDistributions.USPS = {
			TruckBed =
			{
				rolls = 4,
				items = {
					"BookCarpentry1", 6,
					"BookCarpentry2", 4,
					"BookCarpentry3", 2,
					"BookCarpentry4", 1,
					"BookCarpentry5", 0.5,
					"BookCooking1", 6,
					"BookCooking2", 4,
					"BookCooking3", 2,
					"BookCooking4", 1,
					"BookCooking5", 0.5,
					"BookElectrician1", 6,
					"BookElectrician2", 4,
					"BookElectrician3", 2,
					"BookElectrician4", 1,
					"BookElectrician5", 0.5,
					"BookFarming1", 6,
					"BookFarming2", 4,
					"BookFarming3", 2,
					"BookFarming4", 1,
					"BookFarming5", 0.5,
					"BookFirstAid1", 6,
					"BookFirstAid2", 4,
					"BookFirstAid3", 2,
					"BookFirstAid4", 1,
					"BookFirstAid5", 0.5,
					"BookFishing1", 6,
					"BookFishing2", 4,
					"BookFishing3", 2,
					"BookFishing4", 1,
					"BookFishing5", 0.5,
					"BookForaging1", 6,
					"BookForaging2", 4,
					"BookForaging3", 2,
					"BookForaging4", 1,
					"BookForaging5", 0.5,
					"BookMechanic1", 6,
					"BookMechanic2", 4,
					"BookMechanic3", 2,
					"BookMechanic4", 1,
					"BookMechanic5", 0.5,
					"BookMetalWelding1", 6,
					"BookMetalWelding2", 4,
					"BookMetalWelding3", 2,
					"BookMetalWelding4", 1,
					"BookMetalWelding5", 0.5,
					"BookTailoring1", 6,
					"BookTailoring2", 4,
					"BookTailoring3", 2,
					"BookTailoring4", 1,
					"BookTailoring5", 0.5,
					"BookTrapping1", 6,
					"BookTrapping2", 4,
					"BookTrapping3", 2,
					"BookTrapping4", 1,
					"BookTrapping5", 0.5,
					"ComicBook", 8,
					"ComicBook", 8,
					"CookingMag1", 0.5,
					"CookingMag2", 0.5,
					"ElectronicsMag1", 0.5,
					"ElectronicsMag2", 0.5,
					"ElectronicsMag3", 0.5,
					"ElectronicsMag4", 0.5,
					"ElectronicsMag5", 0.5,
					"EngineerMagazine1", 0.5,
					"EngineerMagazine2", 0.5,
					"FarmingMag1", 0.5,
					"FarmingMag1", 1,
					"FishingMag1", 0.5,
					"FishingMag2", 0.5,
					"HerbalistMag", 0.5,
					"HottieZ", 0.1,
					"HuntingMag1", 0.5,
					"HuntingMag2", 0.5,
					"HuntingMag3", 0.5,
					"Magazine", 50,
					"Magazine", 20,
					"Magazine", 20,
					"Magazine", 10,
					"Magazine", 10,
					"MechanicMag1", 0.5,
					"MechanicMag2", 0.5,
					"MechanicMag3", 0.5,
					"MetalworkMag1", 0.5,
					"MetalworkMag2", 0.5,
					"MetalworkMag3", 0.5,
					"MetalworkMag4", 0.5,
					"Newspaper", 50,
					"Newspaper", 20,
					"Newspaper", 20,
					"Newspaper", 10,
					"Newspaper", 10,
					"STR.Hat_BaseballCap_USPS", 1.5,
					"STR.Jacket_USPS", 1.5,
					"STR.Bag_Satchel_USPS", 1.5,
				}
			},

			GloveBox = VehicleDistributions.GloveBox;

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;
		}

	elseif SandboxVars.STR.DuffelLoot then

		VehicleDistributions.SheriffTruckBed = {
			rolls = 4,
			items = {
				"308Box", 10,
				"AmmoStrap_Bullets", 4,
				"AmmoStrap_Shells", 4,
				"AssaultRifle2", 1,
				"Bullets9mmBox", 10,
				"Bullets9mmBox", 20,
				"DuctTape", 8,
				"EmptyPetrolCan", 10,
				"EmptySandbag", 4,
				"FiberglassStock", 4,
				"Garbagebag", 6,
				"HandTorch", 4,
				"Hat_CrashHelmet_Police", 2,
				"Hat_EarMuff_Protectors", 4,
				"HolsterDouble", 1,
				"HolsterSimple", 4,
				"HuntingRifle", 8,
				"M14Clip", 4,
				"Mov_RoadBarrier", 10,
				"Mov_RoadCone", 10,
				"Nightstick", 2,
				"Pistol", 10,
				"Plasticbag", 10,
				"PopBottleEmpty", 4,
				"PopEmpty", 4,
				"Radio.WalkieTalkie4", 10,
				"RubberBand", 6,
				"Shotgun", 10,
				"ShotgunShellsBox", 10,
				"Sling", 4,
				"Tarp", 10,
				"Tissue", 10,
				"ToiletPaper", 6,
				"Tote", 6,
				"Twine", 10,
				"STR.Vest_BulletPolice_Meade", 2,
				"WaterBottleEmpty", 4,
				"WhiskeyEmpty", 1,
				"x2Scope", 4,
				"x4Scope", 2,
				"x8Scope", 1,
			},
			junk = {
				rolls = 1,
				items = {
					"BaseballBat", 1,
					"FirstAidKit", 20,
					"FirstAidKit", 4,
					"Jack", 2,
					"LugWrench", 8,
					"Screwdriver", 10,
					"TirePump", 8,
					"Wrench", 8,
				}
			}
		}

		VehicleDistributions.Sheriff = {
			TruckBed = VehicleDistributions.SheriffTruckBed;

			GloveBox = VehicleDistributions.PoliceGloveBox;

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;
		}

		VehicleDistributions.PrisonBusRavenCreek = {
			TruckBed = {
				rolls = 4,
				items = {
					"308Box", 10,
					"AmmoStrap_Bullets", 4,
					"AmmoStrap_Shells", 4,
					"AssaultRifle2", 1,
					"Bullets9mmBox", 20,
					"Bullets9mmBox", 10,
					"FiberglassStock", 4,
					"HandTorch", 4,
					"Hat_CrashHelmet_Police", 2,
					"Hat_EarMuff_Protectors", 4,
					"HolsterDouble", 1,
					"HolsterSimple", 4,
					"HuntingRifle", 8,
					"M14Clip", 4,
					"Nightstick", 8,
					"Pistol", 10,
					"Radio.WalkieTalkie4", 10,
					"Shotgun", 10,
					"ShotgunShellsBox", 10,
					"Sling", 4,
					"x2Scope", 4,
					"x4Scope", 2,
					"x8Scope", 1,
					"STR.Boilersuit_RavenCreekPrisoner", 6,
				},
				junk = {
					rolls = 1,
					items = {
						"FirstAidKit", 20,
						"Radio.HamRadio1", 20,
						"Spoon", 5,
						"Fork", 5,
						"ButterKnife", 5,
					}
				}
			},

			GloveBox = {
				rolls = 4,
				items = {
					"AlcoholWipes", 8,
					"Bandage", 4,
					"Bandaid", 10,
					"Battery", 10,
					"BluePen", 8,
					"Bullets9mmBox", 20,
					"Bullets9mmBox", 10,
					"Disc_Retail", 2,
					"Eraser", 6,
					"HandTorch", 4,
					"Magazine", 10,
					"Notebook", 10,
					"Paperclip", 4,
					"Pen", 8,
					"Pencil", 10,
					"Radio.WalkieTalkie4", 10,
					"RedPen", 8,
					"RubberBand", 6,
					"Tissue", 10,
				},
				junk = {
					rolls = 1,
					items = {
						"Base.MarchRidgeMap", 4,
						"Base.MuldraughMap", 4,
						"Base.RiversideMap", 4,
						"Base.RosewoodMap", 4,
						"Base.WestpointMap", 4,
						"Cigarettes", 8,
						"FirstAidKit", 20,
						"Glasses_Aviators", 0.5,
						"Gloves_LeatherGlovesBlack", 0.5,
						"HandTorch", 4,
						"HuntingKnife", 0.1,
						"Lighter", 4,
						"Matches", 8,
						"Pistol", 20,
						"Scotchtape", 8,
						"ToiletPaper", 4,
						"Twine", 10,
					}
				}
			},

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;
		}

		VehicleDistributions.PrisonBusJefferson = {
			TruckBed = {
				rolls = 4,
				items = {
					"308Box", 10,
					"AmmoStrap_Bullets", 4,
					"AmmoStrap_Shells", 4,
					"AssaultRifle2", 1,
					"Bullets9mmBox", 20,
					"Bullets9mmBox", 10,
					"FiberglassStock", 4,
					"HandTorch", 4,
					"Hat_CrashHelmet_Police", 2,
					"Hat_EarMuff_Protectors", 4,
					"HolsterDouble", 1,
					"HolsterSimple", 4,
					"HuntingRifle", 8,
					"M14Clip", 4,
					"Nightstick", 8,
					"Pistol", 10,
					"Radio.WalkieTalkie4", 10,
					"Shotgun", 10,
					"ShotgunShellsBox", 10,
					"Sling", 4,
					"x2Scope", 4,
					"x4Scope", 2,
					"x8Scope", 1,
					"STR.Boilersuit_JeffersonPrisoner", 6,
				},
				junk = {
					rolls = 1,
					items = {
						"FirstAidKit", 20,
						"Radio.HamRadio1", 20,
						"Spoon", 5,
						"Fork", 5,
						"ButterKnife", 5,
					}
				}
			},

			GloveBox = {
				rolls = 4,
				items = {
					"AlcoholWipes", 8,
					"Bandage", 4,
					"Bandaid", 10,
					"Battery", 10,
					"BluePen", 8,
					"Bullets9mmBox", 20,
					"Bullets9mmBox", 10,
					"Disc_Retail", 2,
					"Eraser", 6,
					"HandTorch", 4,
					"Magazine", 10,
					"Notebook", 10,
					"Paperclip", 4,
					"Pen", 8,
					"Pencil", 10,
					"Radio.WalkieTalkie4", 10,
					"RedPen", 8,
					"RubberBand", 6,
					"Tissue", 10,
				},
				junk = {
					rolls = 1,
					items = {
						"Base.MarchRidgeMap", 4,
						"Base.MuldraughMap", 4,
						"Base.RiversideMap", 4,
						"Base.RosewoodMap", 4,
						"Base.WestpointMap", 4,
						"Cigarettes", 8,
						"FirstAidKit", 20,
						"Glasses_Aviators", 0.5,
						"Gloves_LeatherGlovesBlack", 0.5,
						"HandTorch", 4,
						"HuntingKnife", 0.1,
						"Lighter", 4,
						"Matches", 8,
						"Pistol", 20,
						"Scotchtape", 8,
						"ToiletPaper", 4,
						"Twine", 10,
					}
				}
			},

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;
		}

		VehicleDistributions.PrisonBusMeade = {
			TruckBed = {
				rolls = 4,
				items = {
					"308Box", 10,
					"AmmoStrap_Bullets", 4,
					"AmmoStrap_Shells", 4,
					"AssaultRifle2", 1,
					"Bullets9mmBox", 20,
					"Bullets9mmBox", 10,
					"FiberglassStock", 4,
					"HandTorch", 4,
					"Hat_CrashHelmet_Police", 2,
					"Hat_EarMuff_Protectors", 4,
					"HolsterDouble", 1,
					"HolsterSimple", 4,
					"HuntingRifle", 8,
					"M14Clip", 4,
					"Nightstick", 8,
					"Pistol", 10,
					"Radio.WalkieTalkie4", 10,
					"Shotgun", 10,
					"ShotgunShellsBox", 10,
					"Sling", 4,
					"x2Scope", 4,
					"x4Scope", 2,
					"x8Scope", 1,
					"STR.Boilersuit_MeadeGenPopPrisoner", 6,
					"STR.Boilersuit_MeadeLowRiskPrisoner", 4,
				},
				junk = {
					rolls = 1,
					items = {
						"FirstAidKit", 20,
						"Radio.HamRadio1", 20,
						"Spoon", 5,
						"Fork", 5,
						"ButterKnife", 5,
					}
				}
			},

			GloveBox = {
				rolls = 4,
				items = {
					"AlcoholWipes", 8,
					"Bandage", 4,
					"Bandaid", 10,
					"Battery", 10,
					"BluePen", 8,
					"Bullets9mmBox", 20,
					"Bullets9mmBox", 10,
					"Disc_Retail", 2,
					"Eraser", 6,
					"HandTorch", 4,
					"Magazine", 10,
					"Notebook", 10,
					"Paperclip", 4,
					"Pen", 8,
					"Pencil", 10,
					"Radio.WalkieTalkie4", 10,
					"RedPen", 8,
					"RubberBand", 6,
					"Tissue", 10,
				},
				junk = {
					rolls = 1,
					items = {
						"Base.MarchRidgeMap", 4,
						"Base.MuldraughMap", 4,
						"Base.RiversideMap", 4,
						"Base.RosewoodMap", 4,
						"Base.WestpointMap", 4,
						"Cigarettes", 8,
						"FirstAidKit", 20,
						"Glasses_Aviators", 0.5,
						"Gloves_LeatherGlovesBlack", 0.5,
						"HandTorch", 4,
						"HuntingKnife", 0.1,
						"Lighter", 4,
						"Matches", 8,
						"Pistol", 20,
						"Scotchtape", 8,
						"ToiletPaper", 4,
						"Twine", 10,
					}
				}
			},

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;
		}

		VehicleDistributions.AmbulanceJefferson = {
			TruckBed = {
				rolls = 4,
				items = {
					"AlcoholWipes", 10,
					"Antibiotics", 4,
					--"Bag_MedicalBag", 10,
					--"Bag_MedicalBag", 20,
					"Bandage", 10,
					"Corset_Medical", 2,
					"CottonBalls", 10,
					"Disinfectant", 10,
					"DuctTape", 8,
					"EmptyPetrolCan", 10,
					"EmptySandbag", 4,
					"Garbagebag", 6,
					"Gloves_Surgical", 10,
					"Hat_SurgicalCap_Blue", 10,
					"Hat_SurgicalMask_Blue", 10,
					"HospitalGown", 18,
					"Mov_MobileBloodbag", 10,
					"Pills", 10,
					"Pills", 10,
					"PillsAntiDep", 10,
					"PillsBeta", 10,
					"PillsSleepingTablets", 10,
					"Plasticbag", 10,
					"PopBottleEmpty", 4,
					"PopEmpty", 4,
					"RubberBand", 6,
					"Scalpel", 10,
					"Scissors", 10,
					"Shirt_Scrubs", 8,
					"SutureNeedle", 10,
					"SutureNeedleHolder", 10,
					"Tarp", 10,
					"Tissue", 10,
					"ToiletPaper", 6,
					"Tote", 6,
					"Trousers_Scrubs", 8,
					"Tweezers", 10,
					"Twine", 10,
					"WaterBottleEmpty", 4,
					"WhiskeyEmpty", 1,
					"STR.Hat_BaseballCap_EMS_Jefferson", 4,
					"STR.Jacket_EMS_Jefferson", 4,
				},
				junk = {
					rolls = 1,
					items = {
						"STR.Bag_DuffelBag_EMS_Red", 50,
						"STR.Bag_DuffelBag_EMS_Blue", 50,
						"STR.Bag_DuffelBag_EMS_Green", 50,
						--"Bag_MedicalBag", 100,
						"CarBattery2", 4,
						"Jack", 2,
						"LugWrench", 8,
						"NormalTire2", 10,
						"Screwdriver", 10,
						"TirePump", 8,
						"Wrench", 8,
					}
				}
			},

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;
			
			GloveBox = VehicleDistributions.GloveBox;

		}

		VehicleDistributions.AmbulanceMeade = {
			TruckBed = {
				rolls = 4,
				items = {
					"AlcoholWipes", 10,
					"Antibiotics", 4,
					--"Bag_MedicalBag", 10,
					--"Bag_MedicalBag", 20,
					"Bandage", 10,
					"Corset_Medical", 2,
					"CottonBalls", 10,
					"Disinfectant", 10,
					"DuctTape", 8,
					"EmptyPetrolCan", 10,
					"EmptySandbag", 4,
					"Garbagebag", 6,
					"Gloves_Surgical", 10,
					"Hat_SurgicalCap_Blue", 10,
					"Hat_SurgicalMask_Blue", 10,
					"HospitalGown", 18,
					"Mov_MobileBloodbag", 10,
					"Pills", 10,
					"Pills", 10,
					"PillsAntiDep", 10,
					"PillsBeta", 10,
					"PillsSleepingTablets", 10,
					"Plasticbag", 10,
					"PopBottleEmpty", 4,
					"PopEmpty", 4,
					"RubberBand", 6,
					"Scalpel", 10,
					"Scissors", 10,
					"Shirt_Scrubs", 8,
					"SutureNeedle", 10,
					"SutureNeedleHolder", 10,
					"Tarp", 10,
					"Tissue", 10,
					"ToiletPaper", 6,
					"Tote", 6,
					"Trousers_Scrubs", 8,
					"Tweezers", 10,
					"Twine", 10,
					"WaterBottleEmpty", 4,
					"WhiskeyEmpty", 1,
					"STR.Hat_BaseballCap_EMS_Meade", 4,
					"STR.Jacket_EMS_Meade", 4,
				},
				junk = {
					rolls = 1,
					items = {
						"STR.Bag_DuffelBag_EMS_Red", 50,
						"STR.Bag_DuffelBag_EMS_Blue", 50,
						"STR.Bag_DuffelBag_EMS_Green", 50,
						--"Bag_MedicalBag", 100,
						"CarBattery2", 4,
						"Jack", 2,
						"LugWrench", 8,
						"NormalTire2", 10,
						"Screwdriver", 10,
						"TirePump", 8,
						"Wrench", 8,
					}
				}
			},

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;
			
			GloveBox = VehicleDistributions.GloveBox;

		}

		VehicleDistributions.AmbulanceLouisville = {
			TruckBed = {
				rolls = 4,
				items = {
					"AlcoholWipes", 10,
					"Antibiotics", 4,
					--"Bag_MedicalBag", 10,
					--"Bag_MedicalBag", 20,
					"Bandage", 10,
					"Corset_Medical", 2,
					"CottonBalls", 10,
					"Disinfectant", 10,
					"DuctTape", 8,
					"EmptyPetrolCan", 10,
					"EmptySandbag", 4,
					"Garbagebag", 6,
					"Gloves_Surgical", 10,
					"Hat_SurgicalCap_Blue", 10,
					"Hat_SurgicalMask_Blue", 10,
					"HospitalGown", 18,
					"Mov_MobileBloodbag", 10,
					"Pills", 10,
					"Pills", 10,
					"PillsAntiDep", 10,
					"PillsBeta", 10,
					"PillsSleepingTablets", 10,
					"Plasticbag", 10,
					"PopBottleEmpty", 4,
					"PopEmpty", 4,
					"RubberBand", 6,
					"Scalpel", 10,
					"Scissors", 10,
					"Shirt_Scrubs", 8,
					"SutureNeedle", 10,
					"SutureNeedleHolder", 10,
					"Tarp", 10,
					"Tissue", 10,
					"ToiletPaper", 6,
					"Tote", 6,
					"Trousers_Scrubs", 8,
					"Tweezers", 10,
					"Twine", 10,
					"WaterBottleEmpty", 4,
					"WhiskeyEmpty", 1,
					"STR.Hat_BaseballCap_EMS_Louisville", 4,
					"STR.Jacket_EMS_Louisville", 4,
				},
				junk = {
					rolls = 1,
					items = {
						"STR.Bag_DuffelBag_EMS_Red", 50,
						"STR.Bag_DuffelBag_EMS_Blue", 50,
						"STR.Bag_DuffelBag_EMS_Green", 50,
						--"Bag_MedicalBag", 100,
						"CarBattery2", 4,
						"Jack", 2,
						"LugWrench", 8,
						"NormalTire2", 10,
						"Screwdriver", 10,
						"TirePump", 8,
						"Wrench", 8,
					}
				}
			},

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;
			
			GloveBox = VehicleDistributions.GloveBox;

		}

		VehicleDistributions.AmbulanceRavenCreek = {
			TruckBed = {
				rolls = 4,
				items = {
					"AlcoholWipes", 10,
					"Antibiotics", 4,
					--"Bag_MedicalBag", 10,
					--"Bag_MedicalBag", 20,
					"Bandage", 10,
					"Corset_Medical", 2,
					"CottonBalls", 10,
					"Disinfectant", 10,
					"DuctTape", 8,
					"EmptyPetrolCan", 10,
					"EmptySandbag", 4,
					"Garbagebag", 6,
					"Gloves_Surgical", 10,
					"Hat_SurgicalCap_Blue", 10,
					"Hat_SurgicalMask_Blue", 10,
					"HospitalGown", 18,
					"Mov_MobileBloodbag", 10,
					"Pills", 10,
					"Pills", 10,
					"PillsAntiDep", 10,
					"PillsBeta", 10,
					"PillsSleepingTablets", 10,
					"Plasticbag", 10,
					"PopBottleEmpty", 4,
					"PopEmpty", 4,
					"RubberBand", 6,
					"Scalpel", 10,
					"Scissors", 10,
					"Shirt_Scrubs", 8,
					"SutureNeedle", 10,
					"SutureNeedleHolder", 10,
					"Tarp", 10,
					"Tissue", 10,
					"ToiletPaper", 6,
					"Tote", 6,
					"Trousers_Scrubs", 8,
					"Tweezers", 10,
					"Twine", 10,
					"WaterBottleEmpty", 4,
					"WhiskeyEmpty", 1,
					"STR.Hat_BaseballCap_EMS_RavenCreek", 4,
					"STR.Jacket_EMS_RavenCreek", 4,
				},
				junk = {
					rolls = 1,
					items = {
						"STR.Bag_DuffelBag_EMS_Red", 50,
						"STR.Bag_DuffelBag_EMS_Blue", 50,
						"STR.Bag_DuffelBag_EMS_Green", 50,
						--"Bag_MedicalBag", 100,
						"CarBattery2", 4,
						"Jack", 2,
						"LugWrench", 8,
						"NormalTire2", 10,
						"Screwdriver", 10,
						"TirePump", 8,
						"Wrench", 8,
					}
				}
			},

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;
			
			GloveBox = VehicleDistributions.GloveBox;

		}

		VehicleDistributions.AmbulanceVanilla = {
			TruckBed = {
				rolls = 4,
				items = {
					"AlcoholWipes", 10,
					"Antibiotics", 4,
					"Bag_MedicalBag", 10,
					"Bag_MedicalBag", 20,
					"Bandage", 10,
					"Corset_Medical", 2,
					"CottonBalls", 10,
					"Disinfectant", 10,
					"DuctTape", 8,
					"EmptyPetrolCan", 10,
					"EmptySandbag", 4,
					"Garbagebag", 6,
					"Gloves_Surgical", 10,
					"Hat_SurgicalCap_Blue", 10,
					"Hat_SurgicalMask_Blue", 10,
					"HospitalGown", 18,
					"Mov_MobileBloodbag", 10,
					"Pills", 10,
					"Pills", 10,
					"PillsAntiDep", 10,
					"PillsBeta", 10,
					"PillsSleepingTablets", 10,
					"Plasticbag", 10,
					"PopBottleEmpty", 4,
					"PopEmpty", 4,
					"RubberBand", 6,
					"Scalpel", 10,
					"Scissors", 10,
					"Shirt_Scrubs", 8,
					"SutureNeedle", 10,
					"SutureNeedleHolder", 10,
					"Tarp", 10,
					"Tissue", 10,
					"ToiletPaper", 6,
					"Tote", 6,
					"Trousers_Scrubs", 8,
					"Tweezers", 10,
					"Twine", 10,
					"WaterBottleEmpty", 4,
					"WhiskeyEmpty", 1,
				},
				junk = {
					rolls = 1,
					items = {
						"STR.Bag_DuffelBag_EMS_Red", 50,
						"STR.Bag_DuffelBag_EMS_Blue", 50,
						"STR.Bag_DuffelBag_EMS_Green", 50,
						"CarBattery2", 4,
						"Jack", 2,
						"LugWrench", 8,
						"NormalTire2", 10,
						"Screwdriver", 10,
						"TirePump", 8,
						"Wrench", 8,
					}
				}
			},

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;
			
			GloveBox = VehicleDistributions.GloveBox;

		}

		VehicleDistributions.BankTruck = {
			TruckBed = {
				rolls = 6,
				items = {
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"Money", 10,
					"STR.Jacket_Sweater_Security_Bank", 4,
					"STR.Jacket_Security_Bank", 4,
					"STR.Hat_Security_Bank", 2,
				},
				junk = {
					rolls = 1,
					items = {
					}
				}
			},

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;
			
			GloveBox = VehicleDistributions.GloveBox;

		}

		VehicleDistributions.FireTruckMeade = {
			TruckBed = {
				rolls = 4,
				items = {
					"Axe", 4,
					"Axe", 4,
					"Bandage", 10,
					"BucketEmpty", 4,
					"Disinfectant", 8,
					"STR.Hat_Fireman_Meade_Black", 4,
					"STR.Hat_Fireman_Meade_Red", 4,
					"STR.Hat_Fireman_Meade_Yellow", 4,
					"STR.Hat_Fireman_Meade_White", 4,
					"Hat_GasMask", 1,
					"STR.Jacket_Fireman_Meade_Black", 4,
					"STR.Jacket_Fireman_Meade_Khaki", 4,
					"LongJohns", 2,
					"PickAxe", 0.5,
					"Pills", 10,
					"Radio.WalkieTalkie4", 10,
					"Rope", 10,
					"Shoes_ArmyBoots", 4,
					"Socks_Long", 6,
					"Tarp", 10,
					"STR.Trousers_Fireman_Meade_Black", 8,
					"STR.Trousers_Fireman_Meade_Khaki", 8,
				},

				junk = {
					rolls = 1,
					items = {
						"STR.Bag_DuffelBag_Fire_Black", 25,
						"STR.Bag_DuffelBag_Fire_Khaki", 25,
						"FirstAidKit", 20,
					}
				}
			},

			TruckBedOpen = {
				rolls = 4,
				items = {
					"Axe", 4,
					"Axe", 4,
					"Bandage", 10,
					"BucketEmpty", 4,
					"Disinfectant", 8,
					"STR.Hat_Fireman_Meade_Black", 4,
					"STR.Hat_Fireman_Meade_Red", 4,
					"STR.Hat_Fireman_Meade_Yellow", 4,
					"STR.Hat_Fireman_Meade_White", 4,
					"Hat_GasMask", 1,
					"STR.Jacket_Fireman_Meade_Black", 4,
					"STR.Jacket_Fireman_Meade_Khaki", 4,
					"LongJohns", 2,
					"PickAxe", 0.5,
					"Pills", 10,
					"Radio.WalkieTalkie4", 10,
					"Rope", 10,
					"Shoes_ArmyBoots", 4,
					"Socks_Long", 6,
					"Tarp", 10,
					"STR.Trousers_Fireman_Meade_Black", 8,
					"STR.Trousers_Fireman_Meade_Khaki", 8,
				},

				junk = {
					rolls = 1,
					items = {
						"STR.Bag_DuffelBag_Fire_Black", 25,
						"STR.Bag_DuffelBag_Fire_Khaki", 25,
						"FirstAidKit", 20,
					}
				}
			},

			GloveBox = VehicleDistributions.GloveBox;

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;

		}

		VehicleDistributions.FireTruckLouisville = {
			TruckBed = {
				rolls = 4,
				items = {
					"Axe", 4,
					"Axe", 4,
					"Bandage", 10,
					"BucketEmpty", 4,
					"Disinfectant", 8,
					"STR.Hat_Fireman_Louisville_Black", 4,
					"STR.Hat_Fireman_Louisville_Red", 4,
					"STR.Hat_Fireman_Louisville_Yellow", 4,
					"Hat_GasMask", 1,
					"STR.Jacket_Fireman_Louisville_Black", 4,
					"STR.Jacket_Fireman_Louisville_Khaki", 4,
					"LongJohns", 2,
					"PickAxe", 0.5,
					"Pills", 10,
					"Radio.WalkieTalkie4", 10,
					"Rope", 10,
					"Shoes_ArmyBoots", 4,
					"Socks_Long", 6,
					"Tarp", 10,
					"STR.Trousers_Fireman_Louisville_Black", 8,
					"STR.Trousers_Fireman_Louisville_Khaki", 8,
				},

				junk = {
					rolls = 1,
					items = {
						"STR.Bag_DuffelBag_Fire_Black", 25,
						"STR.Bag_DuffelBag_Fire_Khaki", 25,
						"FirstAidKit", 20,
					}
				}
			},

			TruckBedOpen = {
				rolls = 4,
				items = {
					"Axe", 4,
					"Axe", 4,
					"Bandage", 10,
					"BucketEmpty", 4,
					"Disinfectant", 8,
					"STR.Hat_Fireman_Louisville_Black", 4,
					"STR.Hat_Fireman_Louisville_Red", 4,
					"STR.Hat_Fireman_Louisville_Yellow", 4,
					"Hat_GasMask", 1,
					"STR.Jacket_Fireman_Louisville_Black", 4,
					"STR.Jacket_Fireman_Louisville_Khaki", 4,
					"LongJohns", 2,
					"PickAxe", 0.5,
					"Pills", 10,
					"Radio.WalkieTalkie4", 10,
					"Rope", 10,
					"Shoes_ArmyBoots", 4,
					"Socks_Long", 6,
					"Tarp", 10,
					"STR.Trousers_Fireman_Louisville_Black", 8,
					"STR.Trousers_Fireman_Louisville_Khaki", 8,
				},

				junk = {
					rolls = 1,
					items = {
						"STR.Bag_DuffelBag_Fire_Black", 25,
						"STR.Bag_DuffelBag_Fire_Khaki", 25,
						"FirstAidKit", 20,
					}
				}
			},

			GloveBox = VehicleDistributions.GloveBox;

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;

		}

		VehicleDistributions.FireTruckRosewood = {
			TruckBed = {
				rolls = 4,
				items = {
					"Axe", 4,
					"Axe", 4,
					"Bandage", 10,
					"BucketEmpty", 4,
					"Disinfectant", 8,
					"STR.Hat_Fireman_Rosewood_Black", 4,
					"STR.Hat_Fireman_Rosewood_Red", 4,
					"STR.Hat_Fireman_Rosewood_Yellow", 4,
					"Hat_GasMask", 1,
					"STR.Jacket_Fireman_Rosewood_Black", 4,
					"STR.Jacket_Fireman_Rosewood_Khaki", 4,
					"LongJohns", 2,
					"PickAxe", 0.5,
					"Pills", 10,
					"Radio.WalkieTalkie4", 10,
					"Rope", 10,
					"Shoes_ArmyBoots", 4,
					"Socks_Long", 6,
					"Tarp", 10,
					"STR.Trousers_Fireman_Rosewood_Black", 8,
					"STR.Trousers_Fireman_Rosewood_Khaki", 8,
				},

				junk = {
					rolls = 1,
					items = {
						"STR.Bag_DuffelBag_Fire_Black", 25,
						"STR.Bag_DuffelBag_Fire_Khaki", 25,
						"FirstAidKit", 20,
					}
				}
			},

			TruckBedOpen = {
				rolls = 4,
				items = {
					"Axe", 4,
					"Axe", 4,
					"Bandage", 10,
					"BucketEmpty", 4,
					"Disinfectant", 8,
					"STR.Hat_Fireman_Rosewood_Black", 4,
					"STR.Hat_Fireman_Rosewood_Red", 4,
					"STR.Hat_Fireman_Rosewood_Yellow", 4,
					"Hat_GasMask", 1,
					"STR.Jacket_Fireman_Rosewood_Black", 4,
					"STR.Jacket_Fireman_Rosewood_Khaki", 4,
					"LongJohns", 2,
					"PickAxe", 0.5,
					"Pills", 10,
					"Radio.WalkieTalkie4", 10,
					"Rope", 10,
					"Shoes_ArmyBoots", 4,
					"Socks_Long", 6,
					"Tarp", 10,
					"STR.Trousers_Fireman_Rosewood_Black", 8,
					"STR.Trousers_Fireman_Rosewood_Khaki", 8,
				},

				junk = {
					rolls = 1,
					items = {
						"STR.Bag_DuffelBag_Fire_Black", 25,
						"STR.Bag_DuffelBag_Fire_Khaki", 25,
						"FirstAidKit", 20,
					}
				}
			},

			GloveBox = VehicleDistributions.GloveBox;

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;

		}

		VehicleDistributions.FireTruckRavenCreek = {
			TruckBed = {
				rolls = 4,
				items = {
					"Axe", 4,
					"Axe", 4,
					"Bandage", 10,
					"BucketEmpty", 4,
					"Disinfectant", 8,
					"STR.Hat_Fireman_RavenCreek_Black", 4,
					"STR.Hat_Fireman_RavenCreek_Red", 4,
					"STR.Hat_Fireman_RavenCreek_Yellow", 4,
					"Hat_GasMask", 1,
					"STR.Jacket_Fireman_RavenCreek_Black", 4,
					"STR.Jacket_Fireman_RavenCreek_Khaki", 4,
					"LongJohns", 2,
					"PickAxe", 0.5,
					"Pills", 10,
					"Radio.WalkieTalkie4", 10,
					"Rope", 10,
					"Shoes_ArmyBoots", 4,
					"Socks_Long", 6,
					"Tarp", 10,
					"STR.Trousers_Fireman_RavenCreek_Black", 8,
					"STR.Trousers_Fireman_RavenCreek_Khaki", 8,
				},

				junk = {
					rolls = 1,
					items = {
						"STR.Bag_DuffelBag_Fire_Black", 25,
						"STR.Bag_DuffelBag_Fire_Khaki", 25,
						"FirstAidKit", 20,
					}
				}
			},

			TruckBedOpen = {
				rolls = 4,
				items = {
					"Axe", 4,
					"Axe", 4,
					"Bandage", 10,
					"BucketEmpty", 4,
					"Disinfectant", 8,
					"STR.Hat_Fireman_RavenCreek_Black", 4,
					"STR.Hat_Fireman_RavenCreek_Red", 4,
					"STR.Hat_Fireman_RavenCreek_Yellow", 4,
					"Hat_GasMask", 1,
					"STR.Jacket_Fireman_RavenCreek_Black", 4,
					"STR.Jacket_Fireman_RavenCreek_Khaki", 4,
					"LongJohns", 2,
					"PickAxe", 0.5,
					"Pills", 10,
					"Radio.WalkieTalkie4", 10,
					"Rope", 10,
					"Shoes_ArmyBoots", 4,
					"Socks_Long", 6,
					"Tarp", 10,
					"STR.Trousers_Fireman_RavenCreek_Black", 8,
					"STR.Trousers_Fireman_RavenCreek_Khaki", 8,
				},

				junk = {
					rolls = 1,
					items = {
						"STR.Bag_DuffelBag_Fire_Black", 25,
						"STR.Bag_DuffelBag_Fire_Khaki", 25,
						"FirstAidKit", 20,
					}
				}
			},

			GloveBox = VehicleDistributions.GloveBox;

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;

		}

		VehicleDistributions.USPS = {
			TruckBed =
			{
				rolls = 4,
				items = {
					"BookCarpentry1", 6,
					"BookCarpentry2", 4,
					"BookCarpentry3", 2,
					"BookCarpentry4", 1,
					"BookCarpentry5", 0.5,
					"BookCooking1", 6,
					"BookCooking2", 4,
					"BookCooking3", 2,
					"BookCooking4", 1,
					"BookCooking5", 0.5,
					"BookElectrician1", 6,
					"BookElectrician2", 4,
					"BookElectrician3", 2,
					"BookElectrician4", 1,
					"BookElectrician5", 0.5,
					"BookFarming1", 6,
					"BookFarming2", 4,
					"BookFarming3", 2,
					"BookFarming4", 1,
					"BookFarming5", 0.5,
					"BookFirstAid1", 6,
					"BookFirstAid2", 4,
					"BookFirstAid3", 2,
					"BookFirstAid4", 1,
					"BookFirstAid5", 0.5,
					"BookFishing1", 6,
					"BookFishing2", 4,
					"BookFishing3", 2,
					"BookFishing4", 1,
					"BookFishing5", 0.5,
					"BookForaging1", 6,
					"BookForaging2", 4,
					"BookForaging3", 2,
					"BookForaging4", 1,
					"BookForaging5", 0.5,
					"BookMechanic1", 6,
					"BookMechanic2", 4,
					"BookMechanic3", 2,
					"BookMechanic4", 1,
					"BookMechanic5", 0.5,
					"BookMetalWelding1", 6,
					"BookMetalWelding2", 4,
					"BookMetalWelding3", 2,
					"BookMetalWelding4", 1,
					"BookMetalWelding5", 0.5,
					"BookTailoring1", 6,
					"BookTailoring2", 4,
					"BookTailoring3", 2,
					"BookTailoring4", 1,
					"BookTailoring5", 0.5,
					"BookTrapping1", 6,
					"BookTrapping2", 4,
					"BookTrapping3", 2,
					"BookTrapping4", 1,
					"BookTrapping5", 0.5,
					"ComicBook", 8,
					"ComicBook", 8,
					"CookingMag1", 0.5,
					"CookingMag2", 0.5,
					"ElectronicsMag1", 0.5,
					"ElectronicsMag2", 0.5,
					"ElectronicsMag3", 0.5,
					"ElectronicsMag4", 0.5,
					"ElectronicsMag5", 0.5,
					"EngineerMagazine1", 0.5,
					"EngineerMagazine2", 0.5,
					"FarmingMag1", 0.5,
					"FarmingMag1", 1,
					"FishingMag1", 0.5,
					"FishingMag2", 0.5,
					"HerbalistMag", 0.5,
					"HottieZ", 0.1,
					"HuntingMag1", 0.5,
					"HuntingMag2", 0.5,
					"HuntingMag3", 0.5,
					"Magazine", 50,
					"Magazine", 20,
					"Magazine", 20,
					"Magazine", 10,
					"Magazine", 10,
					"MechanicMag1", 0.5,
					"MechanicMag2", 0.5,
					"MechanicMag3", 0.5,
					"MetalworkMag1", 0.5,
					"MetalworkMag2", 0.5,
					"MetalworkMag3", 0.5,
					"MetalworkMag4", 0.5,
					"Newspaper", 50,
					"Newspaper", 20,
					"Newspaper", 20,
					"Newspaper", 10,
					"Newspaper", 10,
					"STR.Hat_BaseballCap_USPS", 1.5,
					"STR.Jacket_USPS", 1.5,
					"STR.Bag_Satchel_USPS", 1.5,
					"STR.Bag_DuffelBag_USPS", 0.5,
				}
			},

			GloveBox = VehicleDistributions.GloveBox;

			SeatRearLeft = VehicleDistributions.Seat;
			SeatRearRight = VehicleDistributions.Seat;
		}

	end

	if getActivatedMods():contains("2612617201") then
		table.insert(VehicleDistributions.Sheriff["TruckBed"].items, "AmmunitionMod.9mmAmmo_Ammunition_Case");
		table.insert(VehicleDistributions.Sheriff["TruckBed"].items, 0.1);
		table.insert(VehicleDistributions.Sheriff["TruckBed"].items, "AmmunitionMod.45Ammo_Ammunition_Case");
		table.insert(VehicleDistributions.Sheriff["TruckBed"].items, 0.1);
		table.insert(VehicleDistributions.Sheriff["TruckBed"].items, "AmmunitionMod.44Ammo_Ammunition_Case");
		table.insert(VehicleDistributions.Sheriff["TruckBed"].items, 0.1);
		table.insert(VehicleDistributions.Sheriff["TruckBed"].items, "AmmunitionMod.38Ammo_Ammunition_Case");
		table.insert(VehicleDistributions.Sheriff["TruckBed"].items, 0.1);
		table.insert(VehicleDistributions.Sheriff["TruckBed"].items, "AmmunitionMod.ShotgunShell_Ammunition_Case");
		table.insert(VehicleDistributions.Sheriff["TruckBed"].items, 0.1);
		table.insert(VehicleDistributions.Sheriff["TruckBed"].items, "AmmunitionMod.223_Ammunition_Case");
		table.insert(VehicleDistributions.Sheriff["TruckBed"].items, 0.1);
		table.insert(VehicleDistributions.Sheriff["TruckBed"].items, "AmmunitionMod.308_Ammunition_Case");
		table.insert(VehicleDistributions.Sheriff["TruckBed"].items, 0.1);
		table.insert(VehicleDistributions.Sheriff["TruckBed"].items, "AmmunitionMod.556_Ammunition_Case");
		table.insert(VehicleDistributions.Sheriff["TruckBed"].items, 0.1);
		table.insert(VehicleDistributions.Sheriff["TruckBed"].items, "AmmunitionMod.AmmunitionBox");
		table.insert(VehicleDistributions.Sheriff["TruckBed"].items, 0.1);
	end

	if getActivatedMods():contains("BB_Traps_SpikeStrips") then

		table.insert(VehicleDistributions.Sheriff["TruckBed"].items, "Braven.SpikeStrip");
		table.insert(VehicleDistributions.Sheriff["TruckBed"].items, 8);

	end

	local KSP = {};
	KSP[1] = "CarLightsPolice1"; -- vanilla police car
	KSP[2] = "PickUpVanLightsPolice1"; -- vanilla police truck
	KSP[3] = "92crownvicPD2"; -- 92 vic
	KSP[4] = "87capricePD2"; -- 87 caprice
	KSP[5] = "85vicsheriff3"; -- 85 vic
	KSP[6] = "91blazerpd3"; -- 91 blazer

	local MCSO = {};
	MCSO[1] = "CarLightsPolice2"; -- vanilla police car
	MCSO[2] = "PickUpVanLightsPolice2"; -- vanilla police truck
	MCSO[3] = "92crownvicPD3"; -- 92 vic
	MCSO[4] = "87capricePD3"; -- 87 caprice
	MCSO[5] = "85vicsheriff4"; -- 85 vic
	MCSO[6] = "91blazerpd4"; -- 91 blazer

	local RWSD = {};
	RWSD[1] = "CarLightsPolice3"; -- vanilla police car
	RWSD[2] = "PickUpVanLightsPolice3"; -- vanilla police truck
	RWSD[3] = "92crownvicPD4"; -- 92 vic
	RWSD[4] = "87capricePD4"; -- 87 caprice
	RWSD[5] = "85vicsheriff5"; -- 85 vic
	RWSD[6] = "91blazerpd5"; -- 91 blazer

	local WPPD = {};
	WPPD[1] = "CarLightsPolice4"; -- vanilla police car
	WPPD[2] = "PickUpVanLightsPolice4"; -- vanilla police truck
	WPPD[3] = "92crownvicPD5"; -- 92 vic
	WPPD[4] = "87capricePD5"; -- 87 caprice
	WPPD[5] = "85vicsheriff6"; -- 85 vic
	WPPD[6] = "91blazerpd6"; -- 91 blazer

	local MDPD = {};
	MDPD[1] = "CarLightsPolice5"; -- vanilla police car
	MDPD[2] = "PickUpVanLightsPolice5"; -- vanilla police truck
	MDPD[3] = "92crownvicPD6"; -- 92 vic
	MDPD[4] = "87capricePD6"; -- 87 caprice
	MDPD[5] = "85vicsheriff7"; -- 85 vic
	MDPD[6] = "91blazerpd7"; -- 91 blazer

	local RSPD = {};
	RSPD[1] = "CarLightsPolice6"; -- vanilla police car
	RSPD[2] = "PickUpVanLightsPolice6"; -- vanilla police truck
	RSPD[3] = "92crownvicPD7"; -- 92 vic
	RSPD[4] = "87capricePD7"; -- 87 caprice
	RSPD[5] = "85vicsheriff8"; -- 85 vic
	RSPD[6] = "91blazerpd8"; -- 91 blazer

	local LVPD = {};
	LVPD[1] = "CarLightsPolice7"; -- vanilla police car
	LVPD[2] = "PickUpVanLightsPolice7"; -- vanilla police truck
	LVPD[3] = "92crownvicPD8"; -- 92 vic
	LVPD[4] = "87capricePD8"; -- 87 caprice
	LVPD[5] = "85vicsheriff9"; -- 85 vic
	LVPD[6] = "91blazerpd9"; -- 91 blazer

	local JCPD = {};
	JCPD[1] = "CarLightsPolice8"; -- vanilla police car
	JCPD[2] = "PickUpVanLightsPolice8"; -- vanilla police truck
	JCPD[3] = "92crownvicPD9"; -- 92 vic
	JCPD[4] = "87capricePD9"; -- 87 caprice
	JCPD[5] = "85vicsheriff10"; -- 85 vic
	JCPD[6] = "91blazerpd10"; -- 91 blazer

	local JCSD = {};
	JCSD[1] = "CarLightsPolice9"; -- vanilla police car
	JCSD[2] = "PickUpVanLightsPolice9"; -- vanilla police truck
	JCSD[3] = "92crownvicPD10"; -- 92 vic
	JCSD[4] = "87capricePD10"; -- 87 caprice
	JCSD[5] = "85vicsheriff11"; -- 85 vic
	JCSD[6] = "91blazerpd11"; -- 91 blazer

	local RCRPD = {};
	RCRPD[1] = "CarLightsPolice10"; -- vanilla police car
	RCRPD[2] = "PickUpVanLightsPolice10"; -- vanilla police truck
	RCRPD[3] = "92crownvicPD11"; -- 92 vic
	RCRPD[4] = "87capricePD11"; -- 87 caprice
	RCRPD[5] = "85vicsheriff12"; -- 85 vic
	RCRPD[6] = "91blazerpd12"; -- 91 blazer

	local Fire = {};
	Fire[1] = "firepumper1"; -- Rosewood
	Fire[2] = "firepumper2"; -- Meade
	Fire[3] = "firepumper3"; -- Louisville
	Fire[4] = "87c10fire1"; -- Rosewood
	Fire[5] = "87c10fire2"; -- Meade
	Fire[6] = "87c10fire3"; -- Louisville
	Fire[7] = "PickUpTruckLightsFire1"; -- Rosewood
	Fire[8] = "PickUpTruckLightsFire2"; -- Meade
	Fire[9] = "PickUpTruckLightsFire3"; -- Louisville
	Fire[10] = "PickUpVanLightsFire1"; -- Rosewood
	Fire[11] = "PickUpVanLightsFire2"; -- Meade
	Fire[12] = "PickUpVanLightsFire3"; -- Louisville
	Fire[13] = "firepumper4"; -- RavenCreek
	Fire[14] = "87c10fire4"; -- RavenCreek
	Fire[15] = "PickUpTruckLightsFire4"; -- RavenCreek
	Fire[16] = "PickUpVanLightsFire4"; -- RavenCreek

	local EMS = {};
	EMS[0] = "VanAmbulance0"; -- Vanilla
	EMS[1] = "VanAmbulance1"; -- Meade
	EMS[2] = "VanAmbulance2"; -- Louisville
	EMS[3] = "VanAmbulance3"; -- Jefferson
	EMS[4] = "80f350ambulance0"; -- Vanilla
	EMS[5] = "80f350ambulance1"; -- Meade
	EMS[6] = "80f350ambulance2"; -- Louisville
	EMS[7] = "80f350ambulance3"; -- Jefferson
	EMS[8] = "86econolineambulance0"; -- Vanilla
	EMS[9] = "86econolineambulance1"; -- Meade
	EMS[10] = "86econolineambulance2"; -- Louisville
	EMS[11] = "86econolineambulance3"; -- Jefferson
	EMS[12] = "VanAmbulance4"; -- RavenCreek
	EMS[13] = "80f350ambulance4"; -- RavenCreek
	EMS[14] = "86econolineambulance4"; -- RavenCreek


	local MAIL = {};
	MAIL[2] = "VanSpecial3"; -- CargoVan


	if getActivatedMods():contains("ProperPoliceSkins") then

		KSP[1] = "CarLightsPolice2"; -- vanilla police car
		KSP[2] = "PickUpVanLightsPolice2"; -- vanilla police truck

		MCSO[1] = "CarLightsPolice3"; -- vanilla police car
		MCSO[2] = "PickUpVanLightsPolice3"; -- vanilla police truck

		RWSD[1] = "CarLightsPolice4"; -- vanilla police car
		RWSD[2] = "PickUpVanLightsPolice4"; -- vanilla police truck

		WPPD[1] = "CarLightsPolice5"; -- vanilla police car
		WPPD[2] = "PickUpVanLightsPolice5"; -- vanilla police truck

		MDPD[1] = "CarLightsPolice6"; -- vanilla police car
		MDPD[2] = "PickUpVanLightsPolice6"; -- vanilla police truck

		RSPD[1] = "CarLightsPolice7"; -- vanilla police car
		RSPD[2] = "PickUpVanLightsPolice7"; -- vanilla police truck

		LVPD[1] = "CarLightsPolice8"; -- vanilla police car
		LVPD[2] = "PickUpVanLightsPolice8"; -- vanilla police truck

		JCPD[1] = "CarLightsPolice9"; -- vanilla police car
		JCPD[2] = "PickUpVanLightsPolice9"; -- vanilla police truck

		JCSD[1] = "CarLightsPolice10"; -- vanilla police car
		JCSD[2] = "PickUpVanLightsPolice10"; -- vanilla police truck

		RCRPD[1] = "CarLightsPolice11"; -- vanilla police car
		RCRPD[2] = "PickUpVanLightsPolice11"; -- vanilla police truck

	end

	if getActivatedMods():contains("KSPOPack") then

		KSP[3] = "92crownvicPD1"; -- 92 vic
		KSP[5] = "85vicsheriff2"; -- 85 vic

		MCSO[3] = "92crownvicPD2"; -- 92 vic
		MCSO[5] = "85vicsheriff3"; -- 85 vic

		RWSD[3] = "92crownvicPD3"; -- 92 vic
		RWSD[5] = "85vicsheriff4"; -- 85 vic

		WPPD[3] = "92crownvicPD4"; -- 92 vic
		WPPD[5] = "85vicsheriff5"; -- 85 vic

		MDPD[3] = "92crownvicPD5"; -- 92 vic
		MDPD[5] = "85vicsheriff6"; -- 85 vic

		RSPD[3] = "92crownvicPD6"; -- 92 vic
		RSPD[5] = "85vicsheriff7"; -- 85 vic

		LVPD[3] = "92crownvicPD7"; -- 92 vic
		LVPD[5] = "85vicsheriff8"; -- 85 vic

		JCPD[3] = "92crownvicPD8"; -- 92 vic
		JCPD[5] = "85vicsheriff9"; -- 85 vic

		JCSD[3] = "92crownvicPD9"; -- 92 vic
		JCSD[5] = "85vicsheriff10"; -- 85 vic

		RCRPD[3] = "92crownvicPD10"; -- 92 vic
		RCRPD[5] = "92crownvicPD11"; -- 85 vic

	end

	if getActivatedMods():contains("VVehicleEnhancer") then

		KSP[1] = "CarLightsPolice1"; -- vanilla police car
		KSP[2] = "PickUpVanLightsPolice2"; -- vanilla police truck

		MCSO[1] = "CarLightsPolice2"; -- vanilla police car
		MCSO[2] = "PickUpVanLightsPolice3"; -- vanilla police truck

		RWSD[1] = "CarLightsPolice3"; -- vanilla police car
		RWSD[2] = "PickUpVanLightsPolice4"; -- vanilla police truck

		WPPD[1] = "CarLightsPolice4 "; -- vanilla police car
		WPPD[2] = "PickUpVanLightsPolice5"; -- vanilla police truck

		MDPD[1] = "CarLightsPolice5"; -- vanilla police car
		MDPD[2] = "PickUpVanLightsPolice6"; -- vanilla police truck

		RSPD[1] = "CarLightsPolice6"; -- vanilla police car
		RSPD[2] = "PickUpVanLightsPolice7"; -- vanilla police truck

		LVPD[1] = "CarLightsPolice7"; -- vanilla police car
		LVPD[2] = "PickUpVanLightsPolice8"; -- vanilla police truck

		JCPD[1] = "CarLightsPolice8"; -- vanilla police car
		JCPD[2] = "PickUpVanLightsPolice9"; -- vanilla police truck

		JCSD[1] = "CarLightsPolice9"; -- vanilla police car
		JCSD[2] = "PickUpVanLightsPolice10"; -- vanilla police truck

		RCRPD[1] = "CarLightsPolice10"; -- vanilla police car
		RCRPD[2] = "PickUpVanLightsPolice11"; -- vanilla police truck

	end

	distributionTable[KSP[1]] = distributionTable["CarLightsPolice"]
	distributionTable[MCSO[1]] = { Normal = VehicleDistributions.Sheriff; }
	distributionTable[RWSD[1]] = { Normal = VehicleDistributions.Sheriff; }
	distributionTable[WPPD[1]] = distributionTable["CarLightsPolice"]
	distributionTable[MDPD[1]] = distributionTable["CarLightsPolice"]
	distributionTable[RSPD[1]] = distributionTable["CarLightsPolice"]
	distributionTable[LVPD[1]] = distributionTable["CarLightsPolice"]
	distributionTable[JCPD[1]] = distributionTable["CarLightsPolice"]
	distributionTable[JCSD[1]] = { Normal = VehicleDistributions.Sheriff; }

	distributionTable[KSP[2]] = distributionTable["CarLightsPolice"]
	distributionTable[MCSO[2]] = { Normal = VehicleDistributions.Sheriff; }
	distributionTable[RWSD[2]] = { Normal = VehicleDistributions.Sheriff; }
	distributionTable[WPPD[2]] = distributionTable["CarLightsPolice"]
	distributionTable[MDPD[2]] = distributionTable["CarLightsPolice"]
	distributionTable[RSPD[2]] = distributionTable["CarLightsPolice"]
	distributionTable[LVPD[2]] = distributionTable["CarLightsPolice"]
	distributionTable[JCPD[2]] = distributionTable["CarLightsPolice"]
	distributionTable[JCSD[2]] = { Normal = VehicleDistributions.Sheriff; }

	distributionTable[KSP[4]] = distributionTable["CarLightsPolice"]
	distributionTable[MCSO[4]] = { Normal = VehicleDistributions.Sheriff; }
	distributionTable[RWSD[4]] = { Normal = VehicleDistributions.Sheriff; }
	distributionTable[WPPD[4]] = distributionTable["CarLightsPolice"]
	distributionTable[MDPD[4]] = distributionTable["CarLightsPolice"]
	distributionTable[RSPD[4]] = distributionTable["CarLightsPolice"]
	distributionTable[LVPD[4]] = distributionTable["CarLightsPolice"]
	distributionTable[JCPD[4]] = distributionTable["CarLightsPolice"]
	distributionTable[JCSD[4]] = { Normal = VehicleDistributions.Sheriff; }

	distributionTable[KSP[6]] = distributionTable["CarLightsPolice"]
	distributionTable[MCSO[6]] = { Normal = VehicleDistributions.Sheriff; }
	distributionTable[RWSD[6]] = { Normal = VehicleDistributions.Sheriff; }
	distributionTable[WPPD[6]] = distributionTable["CarLightsPolice"]
	distributionTable[MDPD[6]] = distributionTable["CarLightsPolice"]
	distributionTable[RSPD[6]] = distributionTable["CarLightsPolice"]
	distributionTable[LVPD[6]] = distributionTable["CarLightsPolice"]
	distributionTable[JCPD[6]] = distributionTable["CarLightsPolice"]
	distributionTable[JCSD[6]] = { Normal = VehicleDistributions.Sheriff; }

	distributionTable[KSP[5]] = distributionTable["CarLightsPolice"]
	distributionTable[MCSO[5]] = { Normal = VehicleDistributions.Sheriff; }
	distributionTable[RWSD[5]] = { Normal = VehicleDistributions.Sheriff; }
	distributionTable[WPPD[5]] = distributionTable["CarLightsPolice"]
	distributionTable[MDPD[5]] = distributionTable["CarLightsPolice"]
	distributionTable[RSPD[5]] = distributionTable["CarLightsPolice"]
	distributionTable[LVPD[5]] = distributionTable["CarLightsPolice"]
	distributionTable[JCPD[5]] = distributionTable["CarLightsPolice"]
	distributionTable[JCSD[5]] = { Normal = VehicleDistributions.Sheriff; }

	distributionTable[KSP[3]] = distributionTable["CarLightsPolice"]
	distributionTable[MCSO[3]] = { Normal = VehicleDistributions.Sheriff; }
	distributionTable[RWSD[3]] = { Normal = VehicleDistributions.Sheriff; }
	distributionTable[WPPD[3]] = distributionTable["CarLightsPolice"]
	distributionTable[MDPD[3]] = distributionTable["CarLightsPolice"]
	distributionTable[RSPD[3]] = distributionTable["CarLightsPolice"]
	distributionTable[LVPD[3]] = distributionTable["CarLightsPolice"]
	distributionTable[JCPD[3]] = distributionTable["CarLightsPolice"]
	distributionTable[JCSD[3]] = { Normal = VehicleDistributions.Sheriff; }

	if SandboxVars.STR.DuffelLoot then

		distributionTable[EMS[0]] = { Normal = VehicleDistributions.AmbulanceVanilla; }
		distributionTable[EMS[4]] = { Normal = VehicleDistributions.AmbulanceVanilla; }
		distributionTable[EMS[8]] = { Normal = VehicleDistributions.AmbulanceVanilla; }

	end

	distributionTable[EMS[1]] = { Normal = VehicleDistributions.AmbulanceMeade; }
	distributionTable[EMS[2]] = { Normal = VehicleDistributions.AmbulanceLouisville; }
	distributionTable[EMS[3]] = { Normal = VehicleDistributions.AmbulanceJefferson; }

	distributionTable[EMS[5]] = { Normal = VehicleDistributions.AmbulanceMeade; }
	distributionTable[EMS[6]] = { Normal = VehicleDistributions.AmbulanceLouisville; }
	distributionTable[EMS[7]] = { Normal = VehicleDistributions.AmbulanceJefferson; }

	distributionTable[EMS[9]] = { Normal = VehicleDistributions.AmbulanceMeade; }
	distributionTable[EMS[10]] = { Normal = VehicleDistributions.AmbulanceLouisville; }
	distributionTable[EMS[11]] = { Normal = VehicleDistributions.AmbulanceJefferson; }

	distributionTable[Fire[1]] = { Normal = VehicleDistributions.FireTruckRosewood; }
	distributionTable[Fire[2]] = { Normal = VehicleDistributions.FireTruckMeade; }
	distributionTable[Fire[3]] = { Normal = VehicleDistributions.FireTruckLouisville; }

	distributionTable[Fire[4]] = { Normal = VehicleDistributions.FireTruckRosewood; }
	distributionTable[Fire[5]] = { Normal = VehicleDistributions.FireTruckMeade; }
	distributionTable[Fire[6]] = { Normal = VehicleDistributions.FireTruckLouisville; }

	distributionTable[Fire[7]] = { Normal = VehicleDistributions.FireTruckRosewood; }
	distributionTable[Fire[8]] = { Normal = VehicleDistributions.FireTruckMeade; }
	distributionTable[Fire[9]] = { Normal = VehicleDistributions.FireTruckLouisville; }

	distributionTable[Fire[10]] = { Normal = VehicleDistributions.FireTruckRosewood; }
	distributionTable[Fire[11]] = { Normal = VehicleDistributions.FireTruckMeade; }
	distributionTable[Fire[12]] = { Normal = VehicleDistributions.FireTruckLouisville; }

	distributionTable["86econoline_jefferson"] = { Normal = VehicleDistributions.PrisonBusJefferson; }
	distributionTable["86econoline_meade"] = { Normal = VehicleDistributions.PrisonBusMeade; }

	distributionTable["Van_jeffersondoc"] = { Normal = VehicleDistributions.PrisonBusJefferson; }
	distributionTable["Van_meadedoc"] = { Normal = VehicleDistributions.PrisonBusMeade; }

	distributionTable["prisonbus_jefferson"] = { Normal = VehicleDistributions.PrisonBusJefferson; }
	distributionTable["prisonbus_meade"] = { Normal = VehicleDistributions.PrisonBusMeade; }

	distributionTable["91blazerranger"] = distributionTable["PickUpVanLights0"]

	distributionTable["92wrangler_USPS"] = { Normal = VehicleDistributions.USPS; }
	distributionTable[MAIL[2]] = { Normal = VehicleDistributions.USPS; }

	distributionTable["87gmcarmouredcar"] = { Normal = VehicleDistributions.BankTruck; }

	if getActivatedMods():contains("RavenCreek") then

		distributionTable[RCRPD[1]] = distributionTable["CarLightsPolice"]
		distributionTable[RCRPD[2]] = distributionTable["CarLightsPolice"]
		distributionTable[RCRPD[4]] = distributionTable["CarLightsPolice"]
		distributionTable[RCRPD[6]] = distributionTable["CarLightsPolice"]
		distributionTable[RCRPD[5]] = distributionTable["CarLightsPolice"]
		distributionTable[RCRPD[3]] = distributionTable["CarLightsPolice"]

		distributionTable[EMS[12]] = { Normal = VehicleDistributions.AmbulanceRavenCreek; }
		distributionTable[EMS[13]] = { Normal = VehicleDistributions.AmbulanceRavenCreek; }
		distributionTable[EMS[14]] = { Normal = VehicleDistributions.AmbulanceRavenCreek; }

		distributionTable[Fire[13]] = { Normal = VehicleDistributions.FireTruckRavenCreek; }
		distributionTable[Fire[14]] = { Normal = VehicleDistributions.FireTruckRavenCreek; }
		distributionTable[Fire[15]] = { Normal = VehicleDistributions.FireTruckRavenCreek; }
		distributionTable[Fire[16]] = { Normal = VehicleDistributions.FireTruckRavenCreek; }

		distributionTable["prisonbus_ravencreek"] = { Normal = VehicleDistributions.PrisonBusRavenCreek; }

		distributionTable["86econoline_ravencreek"] = { Normal = VehicleDistributions.PrisonBusRavenCreek; }

		distributionTable["Van_ravencreekdoc"] = { Normal = VehicleDistributions.PrisonBusRavenCreek; }

	end
end

Events.OnPreDistributionMerge.Add(STRVehicleDistro);
