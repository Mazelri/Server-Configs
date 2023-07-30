

IncludeScript("ze_ctr_terminal/ctr_terminal_base.nut");

sara_effecttime <- 10;
hori_effecttime <- 10;
sei_effecttime <- 10;

sara_cooltime <- 80;
hosi_cooltime <- 80;
sei_cooltime <- 80;

sara_random <- -1;
hosi_random <- -1;
sei_random <- -1;

sara_spawned <- false;
hosi_spawned <- false;
sei_spawned <- false;

item_setspawntimes <- 0;
item_spawntimes <- 0;

function sara_fire(){
	team <- activator.GetTeam();
	name <- activator.GetName();
	if(3==team&&"sara_filter"==name){
		//ChatMsg("team "+team+" name "+name);
		EntFire("saramandoranosinzou_button","Lock","",0);
		EntFire("saramandoranosinzou_button","UnLock","",sara_cooltime);
		EntFire("se_magic_wave3","PlaySound","",0);
		for(local i=0;i<2;i++){
			EntFire("se_fire4","PlaySound","",0.5+(i*4));
		}
		EntFire("sara_temp_maker","ForceSpawn","",0);
		EntFire("sara_particle_fire","Start","",0.1);
		EntFire("sara_particle_fire","Kill","",sara_effecttime);
		EntFire("sara_hurt","Enable","",0.5);
		EntFire("sara_hurt","Kill","",sara_effecttime);
		EntFire("saramandoranosinzou_particle","Stop","",0.5);
		EntFire("saramandoranosinzou_particle","Start","",sara_cooltime);
		EntFire("saramandoranosinzou_particle_2","Start","",0.5);
		EntFire("saramandoranosinzou_particle_2","Stop","",sara_cooltime);
	}
}

function hurt_fire(){
}

function hosi_fire(){
	team <- activator.GetTeam();
		name <- activator.GetName();
	if(3==team&&"hosi_filter"==name){
		//ChatMsg("team "+team+" name "+name);
		EntFire("hosinokakera_button","Lock","",0);
		EntFire("hosinokakera_button","UnLock","",hosi_cooltime);
		EntFire("se_magic_wave1","PlaySound","",0);
		for(local i=0;i<2;i++){
			EntFire("se_nagarebosi","PlaySound","",0.5+(i*4));
		}
		EntFire("hosi_temp_maker","ForceSpawn","",0);
		EntFire("hosi_particle_fire","Start","",0.1);
		EntFire("hosi_particle_fire","Kill","",hori_effecttime-1);
		EntFire("hosi_hurt","Enable","",1);
		EntFire("hosi_hurt","Kill","",hori_effecttime);
		EntFire("hosinokakera_particle","Stop","",0.5);
		EntFire("hosinokakera_particle","Start","",hosi_cooltime);
		EntFire("hosinokakera_particle_2","Start","",0.5);
		EntFire("hosinokakera_particle_2","Stop","",hosi_cooltime);
	}
}

function sei_namida(){
	team <- activator.GetTeam();
	name <- activator.GetName();
	time <- Time();
	frametime <- FrameTime();
	enabletime <- Time();
	if(3==team&&"sei_filter"==name){
		//ChatMsg("team "+team+" name "+name+" time "+time+" flame "+frametime);
		EntFire("seireennonamida_button","Lock","",0);
		EntFire("seireennonamida_button","UnLock","",sei_cooltime);
		EntFire("se_magic_wave2","PlaySound","",0);
		for(local i=0;i<5;i++){
			EntFire("se_water10","PlaySound","",0.5+(i*2.2));
		}
		EntFire("sei_temp_maker","ForceSpawn","",0);
		EntFire("sei_particle_fire","Start","",0.1);
		EntFire("sei_particle_fire","Kill","",sei_effecttime);
		EntFire("sei_tri","Enable","",0.5);
		EntFire("sei_tri","Kill","",sei_effecttime);
		EntFire("sei_particle","Stop","",0.5);
		EntFire("sei_particle","Start","",sei_cooltime);
		EntFire("sei_particle_2","Start","",0.5);
		EntFire("sei_particle_2","Stop","",sei_cooltime);
	}
}

function sei_touching(){
	activator.SetVelocity(Vector(0 0 300));
}

function func_item_spawntimes(i){
	item_setspawntimes <- i;
}

function random_item(times){
	item_setspawntimes <- times;
	for(local j=0;j<item_setspawntimes;){
		
		if(sara_spawned==true&&hosi_spawned==true&&sei_spawned==true)return;
		i <- RandomInt(0,2);
		switch (i){
			case 0:
			if(sara_spawned==false){
				sara_setrandom();
				j++;
			}
			break;
			case 1:
			if(hosi_spawned==false){
				hosi_setrandom();
				j++;
			}
			break;
			case 2:
			if(sei_spawned==false){
				sei_setrandom();
				j++;
			}
			break;
			default:
			ChatMessage("item spawn Error");
			break;
		}
	}
}

function sara_setrandom(){
	if(MapLevel==1){
		sara_random <- RandomInt(0,8);
	}else{
				sara_random <- RandomInt(1,14);
	}
				if(sara_random!=hosi_random&&sara_random!=sei_random){
					item_spawnsetorigin("sara_temp_start",sara_random);
					sara_spawned=true;
				}
}

function hosi_setrandom(){
	if(MapLevel==1){
		hosi_random <- RandomInt(0,8);
	}else{
				hosi_random <- RandomInt(1,14);
	}
				if(hosi_random!=sara_random&&hosi_random!=sei_random){
					item_spawnsetorigin("hosi_temp_start",hosi_random);
					hosi_spawned=true;
				}
}

function sei_setrandom(){
	if(MapLevel==1){
		sei_random <- RandomInt(0,8);
	}else{
				sei_random <- RandomInt(1,14);
	}
				if(sei_random!=sara_random&&sei_random!=hosi_random){
					item_spawnsetorigin("sei_temp_start",sei_random);
					sei_spawned=true;
				}
}

function item_spawnsetorigin(item,i){
	if(item_spawntimes<item_setspawntimes){
		item_spawntimes++;
		EntFire(item,"ForceSpawn","",2);
		switch (i){		//z-30
		case 0://西側の離れた木の足場の上
			EntFire(item,"AddOutput","origin -1100 -5130 -780",0);
			break;
		case 1://スポーン地点から正面のフェンスの横の小コンテナの手前
			EntFire(item,"AddOutput","origin -40 -5420 -797",0);
			break;
		case 2:
			EntFire(item,"AddOutput","origin 540 -3860 -565",0);
			break;
		case 3:
			EntFire(item,"AddOutput","origin 1480 -3700 -454",0);
			break;
		case 4:
			EntFire(item,"AddOutput","origin 2020 -3750 -925",0);
			break;
		case 5://コンテナの上
			EntFire(item,"AddOutput","origin 3000 -4500 -753",0);//origin 2980 -4100 -643
			break;
		case 6:
			EntFire(item,"AddOutput","origin 2810 -3320 1500",0);
			break;
		case 7://南の建物のコンクリ壁の奥
			EntFire(item,"AddOutput","origin 4000 -5360 -861",0);
			EntFire(item,"AddOutput","angles 0 180 0",0);
			break;
		case 8:
			EntFire(item,"AddOutput","origin 1860 -5150 -989",0);
			break;
		case 9://タンクの裏
			EntFire(item,"AddOutput","origin 750 -7470 -925",0);
			break;
		case 10:
			EntFire(item,"AddOutput","origin -400 -7270 -733",0);
			break;
		case 11:
		case 12://1st CY の前半
			EntFire(item,"AddOutput","origin " + RandomInt(450,1540) + " " + RandomInt(-5100,-3500) + " " + RandomInt(-850,-850),0);
			break;
		case 13:
		case 14://1st CY の後半
			EntFire(item,"AddOutput","origin " + RandomInt(2450,3750) + " " + RandomInt(-5100,-4500) + "  " + RandomInt(-850,-850),0);
			break;
		}
	}
}


function fag_button(){
	team <- activator.GetTeam();
	name <- activator.GetName();
	if(3==team&&"fag_filter"==name){
		local i = RandomInt(0,99);
		if(i<5){
			SendToConsoleBoth("sm_timebomb #STEAM_0:0:79766145");
			ChatMessage("timebomb -> ホモ");
		}else if(i<10){
			EntFire("clcmd","Command","sm_god #STEAM_0:0:79766145 1",0);
			EntFire("clcmd","Command","sm_god #STEAM_0:0:79766145 0",5);
			ChatMessage("god -> ホモ");
		}else if(i<30){
			SendToConsoleBoth("sm_burn #STEAM_0:0:79766145 5");
			ChatMessage("burn -> ホモ");
		}else if(i<50){
			SendToConsoleBoth("sm_freeze #STEAM_0:0:79766145 5");
			ChatMessage("freeze -> ホモ");
		}else if(i<70){
			EntFire("clcmd","Command","sm_drug #STEAM_0:0:79766145 1",0);
			EntFire("clcmd","Command","sm_drug #STEAM_0:0:79766145 0",5);
			ChatMessage("drug -> ホモ");
		}else{
			i-=70;
			i=i%10;
			ChatMessage("slap "+ i +" -> ホモ");
			for(local j=0;j<i;j++){
				SendToConsoleBoth("sm_slap #STEAM_0:0:79766145 1");
			}
		}
	}else{
		ChatMessage("item [fag] Error");
	}
}



//FlameTime wo tasite keikajikan wo hakaru

