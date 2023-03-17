local DifficultDanceBook = {
"TAD.BobTA_Afoxe_Samba_Raggae_card", 
"TAD.BobTA_Belly_Dancing_One_card", 
"TAD.BobTA_Belly_Dancing_Three_card", 
"TAD.BobTA_Belly_Dancing_Two_card", 
"TAD.BobTA_Boogaloo_card", 
"TAD.BobTA_Charleston_card", 
"TAD.BobTA_Gandy_card", 
"TAD.BobTA_House_Dancing_card", 
"TAD.BobTA_Locking_card", 
"TAD.BobTA_Robot_One_card", 
"TAD.BobTA_Robot_Two_card", 
"TAD.BobTA_Salsa_Two_card", 
"TAD.BobTA_Samba_Olodum_card", 
"TAD.BobTA_Samba_Pagode_card", 
"TAD.BobTA_Slide_Step_card", 
"TAD.BobTA_Snake_card", 
"TAD.BobTA_Tut_One_card", 
"TAD.BobTA_Tut_Two_card", 
"TAD.BobTA_Wave_One_card", 
"TAD.BobTA_Wave_Two_card", 
"TAD.BobTA_Rick_Dancing_card", 
"TAD.BobTA_Moonwalk_Two_card", 
"TAD.BobTA_Northern_Soul_Spin_and_Floor_Work_card", 
"TAD.BobTA_Northern_Soul_Spin_Dip_and_Splits_card", 
"TAD.BobTA_Breakdance_1990_card", "TAD.BobTA_Breakdance_Freezes_Combo_card",
}


function Recipe.OnCreate.OpenKosmotsars(items, result, player)
	player:getInventory():AddItem(DifficultDanceBook[ZombRand(#DifficultDanceBook)+1]);
end