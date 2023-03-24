I’ll get straight to the point survivor:
Make a backup before starting
Step 1: GUID
https://www.guidgenerator.com/
All details in the link 
This will go in C:\Users\YourUser\Zomboid\mods\ElliesTattooParlorV3\media\fileGuidTable.xml
Under<fileguidTable>add your item like the examples below replace the things with double quotes 
Replace (“Body part”): place of which the tattoo will appear (Face, UpperBody, LowerBody, LeftArm, RightArm, LeftLeg, RightLeg, Back.) 
Replace (“Name”): with your tattoo name 
Replace (“YourGuidHere”): with the Guid from the site you got 
<files>
        <path>media/clothing/clothingItems/”BodyPart”_Tattoo_”Name”.xml</path>
        <guid>”YourGUIDHere”</guid>
</files>

Copy and paste after you had replaced the needed words into your code I rec having a backup of the original, make sure nothing has the same name as the tattoos in the file.
Step2: Creating the clothing XML
Head to:
 C:\Users\YourUser\Zomboid\mods\ElliesTattooParlorV3\media\clothing\clothingItems
And:
Create a new Xml with the name of your tattoo like this (BodyPart_Tattoo_Name.xml)
Open it:
It should be empty 


Add this:
<?xml version="1.0" encoding="utf-8"?>
<clothingItem>
    <m_MaleModel></m_MaleModel>
    <m_FemaleModel></m_FemaleModel>
    <guid>”YourGUIDHere”</guid>
    <m_Static>false</m_Static>
    <m_AllowRandomHue>false</m_AllowRandomHue>
    <m_AllowRandomTint>false</m_AllowRandomTint>
    <m_AttachBone></m_AttachBone>
    <m_BaseTextures>Tattoo_”BodyPart”_”name”</m_BaseTextures>
</clothingItem>

It has to be the same GUID from the fileGuidTable.xml
Replace the quoted words like in step 1 save it and close it.
Step3: adding the tattoo
Open:
C:\Users\YourUser\Zomboid\mods\ElliesTattooParlorV3\media\scripts\ tattoos.txt
Under:
module ElliesTattooParlor {

Add:
item “bodypart”_Tattoo_”name”
  {
    Type = Clothing,
    ClothingItem = “bodypart”_Tattoo_”name”,
    BodyLocation = “bodypart”_Tattoo
  }

Replace the quoted words like in step 1 &2 save it and close it.
Step4: adding definitions 
Open:
C:\Users\JOE\Zomboid\mods\ElliesTattooParlorV3\media\lua\shared\Definitions\ ParlorDefinitions.lua
Scroll down until you reach line 79 this line should have a comment with “--face”
Look for the desired body part and add under it:
addNewMakeUpDefinition("”bodypart”_Tattoo_”name”", "ElliesTattooParlor. "”bodypart”_Tattoo_”name”", "”bodypart”_Tattoo")


Replace the quoted words like in step 1 &2&3 save it and close it.
Step5: adding Translations  
Open:
C:\Users\JOE\Zomboid\mods\ElliesTattooParlorV3\media\lua\shared\Translate\EN \MakeUp_EN.txt
Under:
MakeUp_EN = {

Add: 
 	MakeUpType_”bodypart”_Tattoo_”Name” = "”Then name you want here”",

Replace:
(”Then name you want here”): with the name you want to show in game 
Replace the quoted words like in step 1 &2 save it and close it.
Step6: adding Textures
Head to:
C:\Users\JOE\Zomboid\mods\ElliesTattooParlorV3\media\textures
Use any photo manipulation program to make a transparent texture of your tattoo adjust it to the body textures and delete the body keeping the tattoo only.
Name it:
(Tattoo_”bodypart”_”name”)
And replace the quoted words like in step 1 add the textures after you’re done with them to C:\Users\JOE\Zomboid\mods\ElliesTattooParlorV3\media\textures
