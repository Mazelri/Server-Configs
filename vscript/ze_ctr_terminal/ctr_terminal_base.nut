
/*
	
	Steam Profile	==	http://steamcommunity.com/profiles/76561198119798018/
	
	Twitter			==	https://twitter.com/Shimelar
	Youtube			==	https://www.youtube.com/channel/UC6NctjuhtOZfyMd05r3kI5w
	Twitch			==	https://www.twitch.tv/shimelar
	
*/

::TextColor <-{
	White = (1).tochar()
	Red = (2).tochar()
	Purple = (3).tochar()
	Green = (4).tochar()
	LightGreen = (5).tochar()
	LimeGreen = (6).tochar()
	LightRed = (7).tochar()
	Grey = (8).tochar()
	Yellow = (9).tochar()
	LightBlue = (10).tochar()
	Blue = (11).tochar()
	DarkBlue = (12).tochar()
	DarkGrey = (13).tochar()
	Pink = (14).tochar()
	OrangeRed = (15).tochar()
	Orange = (16).tochar()
};

::pipe_01 <- 20;
::ladder01 <- 30;
::fence_02 <- 60;
//local fence_02 = 60;
::fence_03 <- 30;
::fence_04 <- 20;
::fence_05 <- 40;
::ship_time <- 60;
::zm_time <- 180;
::team <- "null";
::name <- "null";
::anim <- "Fly";
::defanim <- "Fly";
::MapLevel <- 0;
::Language <- "JP";//Lock//"EN_def"
::BGM <- true;

::aM_mapName	<- "Map";
::aM_nameTag	<- "+[" + TextColor.LimeGreen + aM_mapName + TextColor.White + "]";


::ChatMessage<-function(msg){
	ScriptPrintMessageChatAll( aM_nameTag + " " + TextColor.White + msg );
	
}

::ChatMsg<-function(msg){
	Chatbounds();
	ScriptPrintMessageChatAll( aM_nameTag + " " + TextColor.White + msg );
	
}

function Chatbounds(){
	ScriptPrintMessageChatAll( "+" + TextColor.Red + "+++" + TextColor.Orange + "+++" + TextColor.Yellow + "+++" + TextColor.Green + "+++" + TextColor.Blue + "+++" + TextColor.DarkBlue + "+++" + TextColor.Purple + "+++" + TextColor.White + "++" );
}

function SendToConsoleBoth(command) {
	SendToConsole(command);
	SendToConsoleServer(command);
}

function check_noclip(){
	local noclip = activator.IsNoclipping();
	if(noclip==true){
		EntFire("fag_*","kill","",0);
	}
}


Level<-function(level){
	return level;
}

function triggered_basic(){
	EntFire("brush_basic","Disable","",0);
	EntFire("brush_advanced","Enable","",0);
	EntFire("brush_zm","Enable","",0);
	EntFire("texturetoggle_panel_level","SetTextureIndex","0",0);
	//ChatMsg("basic mae "+MapLevel);
	MapLevel = 1;
	//ChatMsg("basic ato "+MapLevel);
	ChatMessage("Mode -> " + TextColor.Green + "Basic");
}

function triggered_advanced(){
	EntFire("brush_basic","Enable","",0);
	EntFire("brush_advanced","Disable","",0);
	EntFire("brush_zm","Enable","",0);
	EntFire("texturetoggle_panel_level","SetTextureIndex","1",0);
	//ChatMsg("Adv mae "+MapLevel);
	MapLevel = 2;
	//ChatMsg("Adv ato "+MapLevel);
	ChatMessage("Mode -> " + TextColor.Yellow + "Advanced");
}

function triggered_zm(){
	EntFire("brush_basic","Enable","",0);
	EntFire("brush_advanced","Enable","",0);
	EntFire("brush_zm","Disable","",0);
	EntFire("texturetoggle_panel_level","SetTextureIndex","3",0);
	//ChatMsg("zm mae "+MapLevel);
	MapLevel = 3;
	//ChatMsg("zm ato "+MapLevel);
	ChatMessage("Mode -> " + TextColor.Blue + "ZM");
}

function triggered_language(lang){
	switch (lang){
		case 2:
		EntFire("brush_language","Enable","",0);
		EntFire("texturetoggle_panel_language","SetTextureIndex","0",0);
		Language = "EN";
		ChatMessage("Language -> " + TextColor.Yellow + "English");
		break;
		case 1:
		EntFire("brush_language","Disable","",0);
		EntFire("texturetoggle_panel_language","SetTextureIndex","1",0);
		Language = "JP";
		ChatMessage("Language -> " + TextColor.Yellow + "Japanese");
		break;
		case 0:
		EntFire("se_bubuu","PlaySound","",0);
		ChatMessage("The change of the language is " + TextColor.Red + "invalid " + TextColor.White + "this version");
		break;
		default:
		ChatMessage("Language process " + TextColor.Red + "Error");
	}
}

function change_language(){
	if("EN"==Language){
		EntFire("brush_language","Disable","",0);
		EntFire("texturetoggle_panel_language","SetTextureIndex","1",0);
		Language = "JP";
		ChatMessage("Language -> " + TextColor.Yellow + "Japanese");
	}else if("JP"==Language){
		EntFire("brush_language","Enable","",0);
		EntFire("texturetoggle_panel_language","SetTextureIndex","0",0);
		Language = "EN";
		ChatMessage("Language -> " + TextColor.Yellow + "English");
	}else{
		ChatMessage("Language process " + TextColor.Red + "Error");
	}
}

function triggered_bgm(bool){
	if(true==bool){
		EntFire("brush_bgm","Enable","",0);
		EntFire("texturetoggle_panel_bgm","SetTextureIndex","0",0);
		BGM = true;
		ChatMessage("BGM -> " + TextColor.Green + "ON " + TextColor.White + "(Next Round)");
	}else if(false==bool){
		EntFire("brush_bgm","Disable","",0);
		EntFire("texturetoggle_panel_bgm","SetTextureIndex","1",0);
		EntFire("bgm_*","Kill","",0);
		BGM = false;
		ChatMessage("BGM -> " + TextColor.Red + "OFF");
	}else{
		ChatMessage("BGM process " + TextColor.Red + "Error");
	}
}

function change_bgm(){
	if(true==BGM){
		EntFire("brush_bgm","Disable","",0);
		EntFire("texturetoggle_panel_bgm","SetTextureIndex","1",0);
		EntFire("bgm_*","Kill","",0);
		BGM = false;
		ChatMessage("BGM -> " + TextColor.Red + "OFF");
	}else if(false==BGM){
		EntFire("brush_bgm","Enable","",0);
		EntFire("texturetoggle_panel_bgm","SetTextureIndex","0",0);
		BGM = true;
		ChatMessage("BGM -> " + TextColor.Green + "ON " + TextColor.White + "(Next Round)");
	}else{
		ChatMessage("BGM process " + TextColor.Red + "Error");
	}
}

function nuke_enable(area){
	ChatMsg(TextColor.Blue + "Nuke " + TextColor.White + "Enable !!");
	EntFire("shake_end","StartShake","",0);
	EntFire("se_shake_end","PlaySound","",0);
	EntFire("fade_whiteout","Fade","",0);
	if(area==1){
		EntFire("hurt_nuke_*","Enable","",2);
	}else{
		EntFire("hurt_nuke" + area,"Enable","",2);
	}
}



	/*if(level!=-1){
		ChatMsg("changed level");
	}
	ChatMsg("level func "+level);*/
/*
	for(local i=0;i<=20;i++){
		if(i>15){
			EntFireByHandle(activator,"speedmod","ModifySpeed","0.5",0+(i*0.5),activator,null);
		}else if{
			EntFireByHandle(activator,"speedmod","ModifySpeed",""+(i*0.05),0+(i*0.5),activator,null);
		}
	}


		while(i<20){
			EntFire("sei_tri","TouchTest","",0+(i*0.5));
			i++;
		}
CreateProp(prop_physics,Vector(0,0,0),"models\props_junk\popcan01a.mdl",0);


*/
