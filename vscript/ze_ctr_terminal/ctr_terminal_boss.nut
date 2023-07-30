

IncludeScript("ze_ctr_terminal/ctr_terminal_base.nut");

::st <- 0 //Stress
::Hearth <- 800;
::Hearth_ct <- 120;

function kujira_train_speed(i){
	EntFire("kujira_train","SetSpeedReal",i,0);
}

function track_pass(){
	track_name <- caller.GetName();
	switch (track_name){
		case "path_kujira0":
		EntFire("se_bird04","PlaySound","",0);
		EntFire("se_wave1","PlaySound","",4);
		EntFire("kujira_prop","SetAnimation","Breach",0);
		EntFire("kujira_prop","SetDefaultAnimation","Fly",2);
		anim <- "Breach";
		defanim <- "Fly";
		break;
		case "path_kujira6":
		st++;
		break;
		case "path_kujira10":
		st++;
		EntFire("kujira_particle_sio","Start","",0);
		EntFire("kujira_particle_sio","Stop","",2);
		break;
		case "path_kujira14":
		st+=2;
		check_attack(st);
		break;
		case "path_kujira19":
		st++;
		EntFire("kujira_particle_sio","Start","",0);
		EntFire("kujira_particle_sio","Stop","",2);
		break;
		case "path_kujira23":
		st++;
		break;
		case "path_kujira26":
		st++;
		EntFire("kujira_particle_sio","Start","",0);
		EntFire("kujira_particle_sio","Stop","",2);
		break;
		case "path_kujira29":
		st+=2;
		check_attack(st);
		break;
		case "path_kujira32":
		st++;
		EntFire("kujira_particle_sio","Start","",0);
		EntFire("kujira_particle_sio","Stop","",2);
		break;
		case "path_kujira38":
		st++;
		break;
		case "path_kujira43":
		st+=2;
		check_attack(st);
		break;
		case "path_kujira47":
		st++;
		break;
		case "path_kujira53":
		st++;
		break;
		case "path_kujira55":
		st++;
		break;
		case "path_kujira58":
		st+=2;
		check_attack(st);
		break;
		case "path_kujira60":
		EntFire("kujira_prop","SetAnimation","Breach_Dive",0);
		EntFire("kujira_prop","SetAnimation","Float",4.5);
		EntFire("kujira_prop","SetDefaultAnimation","Fly",0.2);
		EntFire("kujira_train","SetSpeedReal","500",0.2);
		EntFire("kujira_hitbox","Enable","",1);
		EntFire("kujira_particle_nami","Start","",3);
		EntFire("kujira_particle_nami","Stop","",5);
		EntFire("se_wave1","PlaySound","",3);
		EntFire("kujira_push_01","Enable","",3);
		EntFire("kujira_push_01","Disable","",4);
		EntFire("kujira_hurt","Enable","",3);
		EntFire("kujira_hurt","Disable","",4);
		anim <- "Breach";
		defanim <- "Fly";
		break;
		case "path_kujira64":
		EntFire("kujira_train","TeleportToPathNode","path_kujira"+RandomInt(2,59),0);
		EntFire("kujira_train","SetSpeedReal","300",0.2);
		break;
		default:
		break;
	}
	//ChatMsg("anim "+anim+" defanim "+defanim+" track_name "+track_name);
	
}

function check_attack(stress){
	st <- 0;
	if((4<=stress&&stress<5&&"path_kujira43"!=track_name)||(4<=stress&&"path_kujira14"==track_name)){
		EntFire("se_bird05","PlaySound","",0);
		EntFire("kujira_prop","SetAnimation","Pec Slap",0);
		EntFire("kujira_particle_sio_2","Start","",2);
		EntFire("kujira_particle_sio_2","Stop","",5);
		EntFire("kujira_push_03","Enable","",2);
		EntFire("kujira_push_03","Disable","",5);
		anim <- "Pec Slap";
	}else if(5<=stress||(4<=stress&&"path_kujira43"==track_name)){
		local i = RandomInt(0,2);
		if(i==0){
			EntFire("kujira_prop","SetAnimation","Fluke Up",0);
			EntFire("kujira_hitbox","Disable","",1);
			EntFire("kujira_hitbox","Enable","",3.5);
			EntFire("kujira_prop","SetDefaultAnimation","Dive",2);
			anim <- "Fluke Up";
			defanim <- "Dive";
			EntFire("kujira_train","TeleportToPathNode","path_kujira"+RandomInt(2,59),3);
			EntFire("kujira_train","SetSpeedReal","300",3.2);
			EntFire("kujira_prop","SetAnimation","Float",3);
			EntFire("kujira_prop","SetDefaultAnimation","Fly",3.2);
			anim <- "Float";
			defanim <- "Fly";
		}else{
			EntFire("se_bird04","PlaySound","",0);
			EntFire("kujira_prop","SetAnimation","Fluke Up",0);
			EntFire("kujira_prop","SetDefaultAnimation","Dive",2);
			EntFire("kujira_hitbox","Disable","",1);
			anim <- "Fluke Up";
			defanim <- "Dive";
			EntFire("kujira_train","TeleportToPathNode","path_kujira60",2);
		}
	}
}

function addhearth_ct(){
	Hearth+=Hearth_ct;
	//ChatMsg(Hearth);
}

function addhearth(i){
	Hearth+=i;
	//ChatMsg(Hearth);
}

function sethearth(i){
	Hearth=i;
	//ChatMsg(Hearth);
}

function movie_kujira(){
	kujira_train_speed(300);
	EntFire("kujira_prop","Enable","",0);
	EntFire("kujira_prop","SetAnimation","Fly",0);
	EntFire("kujira_prop","SetDefaultAnimation","Fly",1);
}

function kill_kujira(){
	EntFire("script_trigger_02","RunScriptCode","killed_kujira_bool()",0);
	ChatMsg("We defeated boss …?");
	for(local i=0;i<=5;i++){
		EntFire("bgm_boss_hello_31337","Volume",""+(5-i),i);
	}
	EntFire("se_bird04","PlaySound","",0);
	EntFire("bgm_boss_hello_31337","StopSound","",4);
	EntFire("kujira_prop","SetAnimation","Fluke Up",0);
	EntFire("kujira_prop","SetDefaultAnimation","Dive",2);
	EntFire("kujira_prop","Kill","",2);
	EntFire("kujira_train","Kill","",2);
	EntFire("kujira_hitbox","Kill","",2);
	
	EntFire("brush_advanced","Disable","",2);
	EntFire("Camera_03","Enable","",0);
	EntFire("Camera_03","Disable","",5);
	
	
	EntFire("kujira_zombie_tri","Enable","",5);
	EntFire("kujira_zombie_tri","Kill","",6);
	EntFire("script_trigger_02","RunScriptCode","check_kujira()",6);
}

