Distributions = Distributions or {};

-- Function made by star -- 
local function AddProcLoot(proc_name, item_name, chance)
	local data = ProceduralDistributions.list
	if not data then
		 return print('Better Flashlights ERROR: procedure distributions not found!')
	end
	local c = data[proc_name];
	if not c then
		 return print('Better Flashlights ERROR: cant add '..item_name..' to procedure '..proc_name)
	end
	table.insert(c.items, item_name);
	table.insert(c.items, chance);
end

--HandTorch CK LED
AddProcLoot("OfficeDrawers",		"BetterFlashlights.HandTorch_CK_LED", 0.1);   	       		 
AddProcLoot("OfficeDeskHome",		"BetterFlashlights.HandTorch_CK_LED", 0.1);               		
AddProcLoot("HospitalLockers",		"BetterFlashlights.HandTorch_CK_LED", 0.2);    		    	
AddProcLoot("PrisonGuardLockers",	"BetterFlashlights.HandTorch_CK_LED", 0.3);      		    	  
AddProcLoot("CampingStoreGear",		"BetterFlashlights.HandTorch_CK_LED", 0.5);
AddProcLoot("CrateCamping",			"BetterFlashlights.HandTorch_CK_LED", 0.5);      			 		  
AddProcLoot("StoreKitchenCutlery",	"BetterFlashlights.HandTorch_CK_LED", 1.0);         			 	
AddProcLoot("LibraryCounter",		"BetterFlashlights.HandTorch_CK_LED", 1.0);
AddProcLoot("KitchenRandom",		"BetterFlashlights.HandTorch_CK_LED", 0.2);
AddProcLoot("OfficeShelfSupplies",	"BetterFlashlights.HandTorch_CK_LED", 0.3);
AddProcLoot("CrateCamping",			"BetterFlashlights.HandTorch_CK_LED", 0.3);
AddProcLoot("CrateCameraFilm",		"BetterFlashlights.HandTorch_CK_LED", 0.3);    		 
AddProcLoot("GigamartTools",		"BetterFlashlights.HandTorch_CK_LED", 1.0);               		 

-- Man Lite
AddProcLoot("WardrobeMan",				"BetterFlashlights.HandTorch_ManLite", 0.05);  
AddProcLoot("WardrobeRedneck",			"BetterFlashlights.HandTorch_ManLite", 0.05);			 	
AddProcLoot("ArmyStorageElectronics",	"BetterFlashlights.HandTorch_ManLite", 0.2);  	
AddProcLoot("GunStoreCounter",			"BetterFlashlights.HandTorch_ManLite", 0.2);
AddProcLoot("FactoryLockers",			"BetterFlashlights.HandTorch_ManLite", 0.1);
AddProcLoot("ToolStoreTools",			"BetterFlashlights.HandTorch_ManLite", 0.4);   	       		      		   
AddProcLoot("CampingStoreGear",			"BetterFlashlights.HandTorch_ManLite", 0.1);    		    	      		    	   
AddProcLoot("CrateCamping",				"BetterFlashlights.HandTorch_ManLite", 0.1);       			 	   
AddProcLoot("GarageTools",				"BetterFlashlights.HandTorch_ManLite", 0.3);         			 	   	    	 
AddProcLoot("GigamartTools",			"BetterFlashlights.HandTorch_ManLite", 1.0);               		  

--Army1
AddProcLoot("ArmyStorageElectronics",	"BetterFlashlights.HandTorch_Army1", 3.0);
AddProcLoot("ArmySurplusTools",			"BetterFlashlights.HandTorch_Army1", 0.1);  			 		 
AddProcLoot("ToolStoreMisc",			"BetterFlashlights.HandTorch_Army1", 0.1);               		        		
AddProcLoot("LockerArmyBedroom",		"BetterFlashlights.HandTorch_Army1", 0.3);    		    	 
AddProcLoot("ToolStoreTools",			"BetterFlashlights.HandTorch_Army1", 0.1);      		    	 
AddProcLoot("CrateCamping",				"BetterFlashlights.HandTorch_Army1", 0.01);       			 	
AddProcLoot("GarageTools",				"BetterFlashlights.HandTorch_Army1", 0.1);         			 	
AddProcLoot("GunStoreCounter",			"BetterFlashlights.HandTorch_Army1", 0.1);      	    		
AddProcLoot("GigamartTools",			"BetterFlashlights.HandTorch_Army1", 0.01);               		 

--Army2
AddProcLoot("ArmyStorageElectronics",	"BetterFlashlights.HandTorch_Army2", 3.0);
AddProcLoot("ArmySurplusTools",			"BetterFlashlights.HandTorch_Army2", 0.1);	
AddProcLoot("ToolStoreMisc",			"BetterFlashlights.HandTorch_Army2", 0.1);               		        		
AddProcLoot("LockerArmyBedroom",		"BetterFlashlights.HandTorch_Army2", 0.3);    		    	 
AddProcLoot("ToolStoreTools",			"BetterFlashlights.HandTorch_Army2", 0.1);      		    	 
AddProcLoot("CrateCamping",				"BetterFlashlights.HandTorch_Army2", 0.01);       			 	
AddProcLoot("GarageTools",				"BetterFlashlights.HandTorch_Army2", 0.1);         			 	
AddProcLoot("GunStoreCounter",			"BetterFlashlights.HandTorch_Army2", 0.1);      	    		
AddProcLoot("GigamartTools",			"BetterFlashlights.HandTorch_Army2", 0.01);

--TorchArmy1
AddProcLoot("ArmyStorageElectronics",	"BetterFlashlights.TorchArmy1", 3.0); 
AddProcLoot("ArmySurplusTools",			"BetterFlashlights.TorchArmy1", 0.1); 			 		 
AddProcLoot("ToolStoreMisc",			"BetterFlashlights.TorchArmy1", 0.1);               		        		
AddProcLoot("LockerArmyBedroom",		"BetterFlashlights.TorchArmy1", 0.1);    		    	 
AddProcLoot("ToolStoreTools",			"BetterFlashlights.TorchArmy1", 0.1);      		    	 
AddProcLoot("CrateCamping",				"BetterFlashlights.TorchArmy1", 0.01);       			 	
AddProcLoot("GarageTools",				"BetterFlashlights.TorchArmy1", 0.1);         			 	
AddProcLoot("GunStoreCounter",			"BetterFlashlights.TorchArmy1", 0.1);      	    		
AddProcLoot("GigamartTools",			"BetterFlashlights.TorchArmy1", 0.01);

--TorchArmy2
AddProcLoot("ArmyStorageElectronics",	"BetterFlashlights.TorchArmy2", 3.0); 
AddProcLoot("ArmySurplusTools",			"BetterFlashlights.TorchArmy2", 0.1); 			 		 
AddProcLoot("ToolStoreMisc",			"BetterFlashlights.TorchArmy2", 0.1);               		        		
AddProcLoot("LockerArmyBedroom",		"BetterFlashlights.TorchArmy2", 0.1);    		    	 
AddProcLoot("ToolStoreTools",			"BetterFlashlights.TorchArmy2", 0.1);      		    	 
AddProcLoot("CrateCamping",				"BetterFlashlights.TorchArmy2", 0.01);       			 	
AddProcLoot("GarageTools",				"BetterFlashlights.TorchArmy2", 0.1);         			 	
AddProcLoot("GunStoreCounter",			"BetterFlashlights.TorchArmy2", 0.1);      	    		
AddProcLoot("GigamartTools",			"BetterFlashlights.TorchArmy2", 0.01);

--Flashlights
AddProcLoot("ToolStoreMisc",		"BetterFlashlights.Torch1", 0.1);               				   
AddProcLoot("ToolStoreTools",		"BetterFlashlights.Torch1", 0.01);         					 
AddProcLoot("CampingStoreGear",		"BetterFlashlights.Torch1", 2.0);
AddProcLoot("CrateCamping",			"BetterFlashlights.Torch1", 1.0);  
AddProcLoot("WardrobeMan",			"BetterFlashlights.Torch1", 0.2);    
AddProcLoot("MechanicShelfTools",	"BetterFlashlights.Torch1", 0.1);   		    			
AddProcLoot("FactoryLockers",		"BetterFlashlights.Torch1", 0.2);  					 	  
AddProcLoot("GarageTools",			"BetterFlashlights.Torch1", 0.1);         				 		 
AddProcLoot("ElectronicStoreMisc",	"BetterFlashlights.Torch1", 0.3);      	    				
AddProcLoot("GigamartTools",		"BetterFlashlights.Torch1", 0.2);               					 

AddProcLoot("ToolStoreMisc",		"BetterFlashlights.Torch2", 0.1);               				   
AddProcLoot("ToolStoreTools",		"BetterFlashlights.Torch2", 0.01);         					 
AddProcLoot("CampingStoreGear",		"BetterFlashlights.Torch2", 2.0);
AddProcLoot("CrateCamping",			"BetterFlashlights.Torch2", 1.0);  
AddProcLoot("WardrobeMan",			"BetterFlashlights.Torch2", 0.2);    
AddProcLoot("MechanicShelfTools",	"BetterFlashlights.Torch2", 0.1);   		    			
AddProcLoot("FactoryLockers",		"BetterFlashlights.Torch2", 0.2);  					 	  
AddProcLoot("GarageTools",			"BetterFlashlights.Torch2", 0.1);         				 		 
AddProcLoot("ElectronicStoreMisc",	"BetterFlashlights.Torch2", 0.3);      	    				
AddProcLoot("GigamartTools",		"BetterFlashlights.Torch2", 0.2);  

AddProcLoot("ToolStoreMisc",		"BetterFlashlights.Torch3", 0.1);               				   
AddProcLoot("ToolStoreTools",		"BetterFlashlights.Torch3", 0.01);         					 
AddProcLoot("CampingStoreGear",		"BetterFlashlights.Torch3", 2.0);
AddProcLoot("CrateCamping",			"BetterFlashlights.Torch3", 1.0);  
AddProcLoot("WardrobeMan",			"BetterFlashlights.Torch3", 0.2);    
AddProcLoot("MechanicShelfTools",	"BetterFlashlights.Torch3", 0.1);   		    			
AddProcLoot("FactoryLockers",		"BetterFlashlights.Torch3", 0.2);  					 	  
AddProcLoot("GarageTools",			"BetterFlashlights.Torch3", 0.1);         				 		 
AddProcLoot("ElectronicStoreMisc",	"BetterFlashlights.Torch3", 0.3);      	    				
AddProcLoot("GigamartTools",		"BetterFlashlights.Torch3", 0.2);   

--Toy Flashlight
AddProcLoot("WardrobeWoman",	"BetterFlashlights.Torch4", 0.1);               				
AddProcLoot("SchoolLockers",	"BetterFlashlights.Torch4", 0.4);         				  
AddProcLoot("WardrobeChild",	"BetterFlashlights.Torch4", 0.4);    		    		
AddProcLoot("CrateCamping",		"BetterFlashlights.Torch4", 0.1);       					 		  
AddProcLoot("ClassroomDesk",	"BetterFlashlights.Torch4", 0.4);         				 		
AddProcLoot("DaycareShelves",	"BetterFlashlights.Torch4", 0.4);      	    				
AddProcLoot("CrateToys",		"BetterFlashlights.Torch4", 2.0);
AddProcLoot("GigamartToys",		"BetterFlashlights.Torch4", 1.0);                					  

--Toy Flashlight
AddProcLoot("WardrobeWoman",	"BetterFlashlights.Torch5", 0.2);               				  
AddProcLoot("SchoolLockers",	"BetterFlashlights.Torch5", 0.2);         					
AddProcLoot("WardrobeChild",	"BetterFlashlights.Torch5", 0.2);    		    			
AddProcLoot("CrateCamping",		"BetterFlashlights.Torch5", 0.2);       					 		 
AddProcLoot("ClassroomDesk",	"BetterFlashlights.Torch5", 0.3);         				 		
AddProcLoot("DaycareShelves",	"BetterFlashlights.Torch5", 0.2);      	    				
AddProcLoot("CrateToys",		"BetterFlashlights.Torch5", 1.0);
AddProcLoot("GigamartToys",		"BetterFlashlights.Torch5", 2.0);                					

--Toy Flashlight
AddProcLoot("WardrobeWoman",	"BetterFlashlights.Torch6", 0.3);               				  
AddProcLoot("SchoolLockers",	"BetterFlashlights.Torch6", 0.1);         					
AddProcLoot("WardrobeChild",	"BetterFlashlights.Torch6", 0.3);    		    			
AddProcLoot("CrateCamping",		"BetterFlashlights.Torch6", 0.1);       					 		 
AddProcLoot("ClassroomDesk",	"BetterFlashlights.Torch6", 0.3);         				 		
AddProcLoot("DaycareShelves",	"BetterFlashlights.Torch6", 0.3);      	    				
AddProcLoot("CrateToys",		"BetterFlashlights.Torch6", 2.0);
AddProcLoot("GigamartToys",		"BetterFlashlights.Torch6", 2.0);   

--Emergency Flashlight
AddProcLoot("FireDeptLockers",		"BetterFlashlights.Torch7", 2.0);               				  
AddProcLoot("PoliceLockers",		"BetterFlashlights.Torch7", 0.4);         					
AddProcLoot("HospitalLockers",		"BetterFlashlights.Torch7", 0.4);    		    			
AddProcLoot("PrisonGuardLockers",	"BetterFlashlights.Torch7", 0.4);    		    			
AddProcLoot("FactoryLockers",		"BetterFlashlights.Torch7", 0.4);    		    			
AddProcLoot("JanitorTools",			"BetterFlashlights.Torch7", 1.0);    		    			 
AddProcLoot("CampingStoreGear",		"BetterFlashlights.Torch7", 0.5);    		    			
AddProcLoot("CrateElectronics",		"BetterFlashlights.Torch7", 0.01);      		    			
AddProcLoot("ElectronicStoreMisc",	"BetterFlashlights.Torch7", 1.0);       					 		 
AddProcLoot("MedicalStorageTools",	"BetterFlashlights.Torch7", 0.1);         				 		
AddProcLoot("ToolStoreTools",		"BetterFlashlights.Torch7", 0.2);      	    				 
AddProcLoot("GigamartTools",		"BetterFlashlights.Torch7", 1.0);               					  

--Egenerex Lite
AddProcLoot("StoreKitchenCutlery",	"BetterFlashlights.BF_EgenerexLite", 0.4);               				   
AddProcLoot("LibraryCounter",		"BetterFlashlights.BF_EgenerexLite", 0.1);         					 
AddProcLoot("OfficeDrawers",		"BetterFlashlights.BF_EgenerexLite", 1.0);
AddProcLoot("OfficeShelfSupplies",	"BetterFlashlights.BF_EgenerexLite", 0.5);  
AddProcLoot("CrateCamping",			"BetterFlashlights.BF_EgenerexLite", 0.1);    
AddProcLoot("CrateCameraFilm",		"BetterFlashlights.BF_EgenerexLite", 0.2);   		    			       				 		 
AddProcLoot("ElectronicStoreMisc",	"BetterFlashlights.BF_EgenerexLite", 1.0);      	    				
AddProcLoot("GigamartTools",		"BetterFlashlights.BF_EgenerexLite", 0.2); 

--Spiffo Lite
AddProcLoot("SpiffosDiningCounter",		"BetterFlashlights.BF_SpiffoLite", 1.0);               				   
AddProcLoot("SpiffosKitchenCounter",	"BetterFlashlights.BF_SpiffoLite", 0.3);         					 
AddProcLoot("CrateSpiffoMerch",			"BetterFlashlights.BF_SpiffoLite", 5.0);
AddProcLoot("KitchenRandom",			"BetterFlashlights.BF_SpiffoLite", 0.5);  
AddProcLoot("ClassroomDesk",			"BetterFlashlights.BF_SpiffoLite", 0.1);    
AddProcLoot("SchoolLockers",			"BetterFlashlights.BF_SpiffoLite", 0.1);   		    			       				 		 

--Old Flashlight
AddProcLoot("CrateTools",				"BetterFlashlights.BF_OldFlashlight", 0.01);               				   
AddProcLoot("CrateAntiqueStove",		"BetterFlashlights.BF_OldFlashlight", 0.2);         					 
AddProcLoot("GarageTools",				"BetterFlashlights.BF_OldFlashlight", 0.05);
AddProcLoot("KitchenRandom",			"BetterFlashlights.BF_OldFlashlight", 0.05);  
AddProcLoot("WardrobeRedneck",			"BetterFlashlights.BF_OldFlashlight", 0.3);    
AddProcLoot("ArmyHangarTools",			"BetterFlashlights.BF_OldFlashlight", 0.3);
AddProcLoot("StoreCounterCleaning",		"BetterFlashlights.BF_OldFlashlight", 0.01);

--HeadLight for Mining Helmet
AddProcLoot("ArmySurplusTools",			"BetterFlashlights.BF_Headlight", 1.0);  			 		
AddProcLoot("ToolStoreMisc",			"BetterFlashlights.BF_Headlight", 2.0);               			   
AddProcLoot("FactoryLockers",			"BetterFlashlights.BF_Headlight", 0.4);         				
AddProcLoot("CampingStoreGear",			"BetterFlashlights.BF_Headlight", 1.0);    		    		  
AddProcLoot("GarageTools",				"BetterFlashlights.BF_Headlight", 0.4);      		    		
AddProcLoot("GigamartTools",			"BetterFlashlights.BF_Headlight", 0.4);       			 			  
AddProcLoot("JanitorTools",				"BetterFlashlights.BF_Headlight", 0.4);         			 		
AddProcLoot("ArmyStorageElectronics",	"BetterFlashlights.BF_Headlight", 0.4);      	    			
AddProcLoot("GigamartTools",			"BetterFlashlights.BF_Headlight", 0.4);               			

--Mining Helmet
AddProcLoot("ArmySurplusHeadwear",	"BetterFlashlights.Hat_HardHat_Miner_With_Light", 3.0);  	
AddProcLoot("ToolStoreMisc",		"BetterFlashlights.Hat_HardHat_Miner_With_Light", 1.0);           
AddProcLoot("FactoryLockers",		"BetterFlashlights.Hat_HardHat_Miner_With_Light", 0.2);       
AddProcLoot("GarageTools",			"BetterFlashlights.Hat_HardHat_Miner_With_Light", 0.01);         	
AddProcLoot("GigamartTools",		"BetterFlashlights.Hat_HardHat_Miner_With_Light", 0.2);      		