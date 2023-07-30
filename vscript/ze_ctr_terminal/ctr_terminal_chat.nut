

IncludeScript("ze_ctr_terminal/ctr_terminal_base.nut");

// /*


function chat_started(){
	if(Language == "EN"){
		ChatMsg("Run Run Run !!");
	}else if(Language == "JP"){
		ChatMsg("逃げろ逃げろ!!");
	}
}

function chat_valve01(time){
	//ChatMsg(Language);
	if(Language == "EN"){
		ChatMsg("Pressure of the PIPELINE changing in " + TextColor.LightRed + time + TextColor.White + " seconds");
	}else if(Language == "JP"){
		ChatMsg("パイプラインの圧力が変わるまであと" + TextColor.LightRed + time + TextColor.White + "秒…");
	}else{
		ChatMessage("Language process " + TextColor.Red + "Error");
	}
}

function chat_valve01changed(){
	//ChatMsg(Language);
	if(Language == "EN"){
		ChatMsg("PIPELINE " + TextColor.Orange + "destroyed");
	}else if(Language == "JP"){
		ChatMsg("パイプラインが破壊された");
	}else{
		ChatMessage("Language process " + TextColor.Red + "Error");
	}
}

function chat_ladder01(time){
	//ChatMsg(Language);
	if(Language == "EN"){
		ChatMsg("The ladder enable in " + TextColor.LightRed + time + TextColor.White + " seconds");
	}else if(Language == "JP"){
		ChatMsg("はしごが掛かるまであと" + TextColor.LightRed + time + TextColor.White + "秒…");
	}else{
		ChatMessage("Language process " + TextColor.Red + "Error");
	}
}

function chat_ladder01enable(){
	if(Language == "EN"){
		ChatMsg("The ladder " + TextColor.Orange + "enable");
	}else if(Language == "JP"){
		ChatMsg("はしごが掛かった");
	}
}

function chat_1stCY(time){
	//ChatMsg(Language);
	if(Language == "EN"){
		ChatMsg("First Container Yard Gate opening in " + TextColor.LightRed + time + TextColor.White + " seconds");
	}else if(Language == "JP"){
		ChatMsg("第1コンテナヤードのゲートがあくまであと" + TextColor.LightRed + time + TextColor.White + "秒…");
	}else{
		ChatMessage("Language process " + TextColor.Red + "Error");
	}
}

function chat_1stCYopened(){
	if(Language == "EN"){
		ChatMsg("1st CY Gate " + TextColor.Orange + "opened");
	}else if(Language == "JP"){
		ChatMsg("第1CYのゲートがひらかれた");
	}
}

function chat_RearFence(time){
	if(Language == "EN"){
		ChatMsg("Rear Side Fence opening in " + TextColor.LightRed + time + TextColor.White + " seconds");
	}else if(Language == "JP"){
		ChatMsg("裏口のフェンスがあくまであと" + TextColor.LightRed + time + TextColor.White + "秒…");
	}
}

function chat_RearFenceopened(){
	if(Language == "EN"){
		ChatMsg("Rear Side Fence " + TextColor.Orange + "opened");
	}else if(Language == "JP"){
		ChatMsg("裏口のフェンスがひらかれた");
	}
}

function chat_2ndGate(time){
	if(Language == "EN"){
		ChatMsg("Second Gate opening in " + TextColor.LightRed + time + TextColor.White + " seconds");
	}else if(Language == "JP"){
		ChatMsg("第2コンテナヤードのゲートがあくまであと" + TextColor.LightRed + time + TextColor.White + "秒…");
	}
}

function chat_2ndGateopened(){
	if(Language == "EN"){
		ChatMsg("2nd Gate " + TextColor.Orange + "opened");
	}else if(Language == "JP"){
		ChatMsg("第2CYのゲートがひらかれた");
	}
}

function chat_2ndCY(time){
	if(Language == "EN"){
		ChatMsg("Second Container Yard Fence opening in " + TextColor.LightRed + time + TextColor.White + " seconds");
	}else if(Language == "JP"){
		ChatMsg("第2コンテナヤードの入り口があくまであと" + TextColor.LightRed + time + TextColor.White + "秒…");
	}
}

function chat_2ndCYopened(time){
	if(Language == "EN"){
		ChatMsg("2nd CY Fence " + TextColor.Orange + "opened");
		ChatMessage("Get into a Container ship !");
		ChatMessage("Defend " + TextColor.LightRed + time + TextColor.White + " seconds !!");
	}else if(Language == "JP"){
		ChatMsg("第2CYの入り口がひらかれた");
		ChatMessage("コンテナ船にのりこめ!");
		ChatMessage(TextColor.LightRed + time + TextColor.White + "秒間､船を守り続けろ!!");
	}
}


function chat_zombie_triggerd(){
	if(Language == "EN"){
		ChatMsg(TextColor.LightRed + "Zombie " + TextColor.White + "triggered !!!!!");
	}else if(Language == "JP"){
		ChatMsg(TextColor.LightRed + "ゾンビ" + TextColor.White + "に先を越された…");
	}
}

function chat_boss_incoming(){
	if(Language == "EN"){
		ChatMsg(TextColor.Purple + "Boss " + TextColor.White + "incoming !!");
	}else if(Language == "JP"){
		ChatMsg(TextColor.Purple + "ステージボス" + TextColor.White + "が来る…!!");
	}
}

function chat_humans_win(){
	if(Language == "EN"){
		ChatMsg("Humans " + TextColor.Blue + "Win " + TextColor.White + "!!");
	}else if(Language == "JP"){
		ChatMsg("生存者の" + TextColor.Blue + "勝利" + TextColor.White + "!!");
	}
}

function chat_zombies_win(){
	if(Language == "EN"){
		ChatMsg("Zombie aboard !! You " + TextColor.LightRed + "Failed " + TextColor.White + "!!");
	}else if(Language == "JP"){
		ChatMsg("ゾンビが船に侵入した!! 生存者の" + TextColor.LightRed + "敗北" + TextColor.White + "…");
	}
}

function chat_left_ship(){
	if(Language == "EN"){
		ChatMsg("Humans left the ship !! You " + TextColor.LightRed + "Failed " + TextColor.White + "!!");
	}else if(Language == "JP"){
		ChatMsg("生存者が船の上からいなくなった…｡ 生存者の" + TextColor.LightRed + "敗北" + TextColor.White + "…");
	}
}

function chat_time_up(){
	if(Language == "EN"){
		ChatMsg("Time up !! You " + TextColor.LightRed + "Failed " + TextColor.White + "!!");
	}else if(Language == "JP"){
		ChatMsg("時間切れだ!! 生存者の" + TextColor.LightRed + "敗北" + TextColor.White + "…");
	}
}

function chat_zm_mode(){
	if(Language == "EN"){
		ChatMsg("ZM Mode for " + TextColor.LightRed  + zm_time + TextColor.White +" seconds !!");
	}else if(Language == "JP"){
		ChatMsg(TextColor.LightRed  + zm_time + TextColor.White +"秒間生き残れ!!");
	}
}

function time(i){
	if(Language == "EN"){
		ChatMsg(TextColor.LightRed + i + TextColor.White + " seconds ...");
	}else if(Language == "JP"){
		ChatMsg(TextColor.White + "残り" + TextColor.LightRed + i + TextColor.White + "秒…");
	}
}



// */