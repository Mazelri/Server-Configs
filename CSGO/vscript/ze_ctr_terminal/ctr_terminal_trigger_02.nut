

IncludeScript("ze_ctr_terminal/ctr_terminal_base.nut");
IncludeScript("ze_ctr_terminal/ctr_terminal_boss.nut");
IncludeScript("ze_ctr_terminal/ctr_terminal_item.nut");
//IncludeScript("Shimelar/ctr_terminal_tele.nut");
IncludeScript("ze_ctr_terminal/ctr_terminal_setting.nut");

::zm_tri <- false;
::killed_kujira <- false;
::zm_mode_bool <- false;
::watched_movie <- false;
::aboard_checking <- false;
::ct_aboard <- false;
::can <- 0;

//spawnして1秒経ったら
function auto_trigger(){
	//kujira_start();
	//EntFire("script_trigger_boss","RunScriptCode","movie_kujira()",15);
	EntFire("Camera_01","Disable","",0);
	EntFire("Camera_02","Disable","",0);
	EntFire("Camera_03","Disable","",0);
	EntFire("Camera_01","AddOutput","angles 0 15 0",0);
	EntFire("Camera_01","AddOutput","origin 13442 1537 -1075",0);
	EntFire("Camera_02","AddOutput","angles 0 90 0",0);
	EntFire("Camera_02","AddOutput","origin 11392 -1022 -892",0);
	EntFire("fade*","FadeReverse","",0);
	EntFire("wood_panel","Enable","",1);
	EntFire("fence_01","Open","",7);
	EntFire("fence_01","Lock","",10);
	EntFire("physbox_level*","Kill","",5);
	EntFire("svcmd","Command","sm_gravity #STEAM_0_0_79766145 0.05",1);
	EntFire("svcmd","Command","sm_gravity #STEAM_0_0_79766145 1",20);
	//ChatMessage("Language -> " + TextColor.Yellow + Language);
	//ChatMessage("autotrigger "+MapLevel);
	if(MapLevel==1){
		//ChatMsg("Mode -> " + TextColor.Green + "Basic");
		EntFire("script_chat","RunScriptCode","chat_started()",0);
		EntFire("bgm_basic","PlaySound","",2);
		level_barricade();
		EntFire("button_valve01","Unlock","",0);
		EntFire("progress_pipe_valve01","SetGlowEnabled","",0);
		fence_02 = 50;
		fence_03 = 20;
		fence_05 = 30;
		ship_time = 40;
		random_item(3);
	}else if(MapLevel==2){
		//ChatMsg("Mode -> " + TextColor.Yellow + "Advanced");
		EntFire("script_chat","RunScriptCode","chat_started()",0);
		EntFire("bgm_advanced","PlaySound","",2);
		level_barricade();
		EntFire("particle_burn_1stCY","Start","",1);
		EntFire("particle_explode_car","Start","",10);
		EntFire("particle_explode_car","Stop","",10);
		EntFire("particle_burn_car","Start","",10);
		EntFire("shake_explode_full","StartShake","",10);
		EntFire("se_c4","PlaySound","",10);
		random_item(3);
	}else if(MapLevel==3){
		zm_mode_bool=true;
		//ChatMsg(zm_mode_bool);
		level_barricade();
		random_item(3);
		zm_mode_trigger();
	}
}

//レベルに合わせてbrushとpropを切り替える
function level_barricade(){
	if(MapLevel==1){
		EntFire("brush_level_0*","Disable","",0);
		EntFire("brush_level_4*","Disable","",0);
		EntFire("brush_level_52","Disable","",0);
		EntFire("brush_level_wall01","Disable","",0);
		EntFire("prop_level_4*","Kill","",0);
		EntFire("prop_level_08","Kill","",0);
		EntFire("prop_level_22*","Kill","",0);
		EntFire("prop_level_50_1","Kill","",0);
		EntFire("prop_level_52","Kill","",0);
		EntFire("prop_level_55","Kill","",0);
		EntFire("prop_level_typeA","Kill","",0);
		
		EntFire("Brush_fence_0*","Enable","",0);
		EntFire("brush_level_01","Enable","",0);
		EntFire("brush_level_1*","Enable","",0);
		EntFire("brush_level_pipe_01","Enable","",0);
		EntFire("brush_level_brock_11","Enable","",0);
		EntFire("progress_brush_ladder01","Enable","",0);
		EntFire("progress_brush_pipe01","Enable","",0);
		EntFire("progress_brush_pipe02","Enable","",0);
		
		local i = RandomInt(0,3);
		switch (i){
		case 0:
			//EntFire("Brush_level_09","Enable","",0);
			EntFire("Brush_level_21","Enable","",0);
		case 1:
		case 2:
			EntFire("Brush_level_23","Disable","",0);
		case 3:
		default:
			break;
		}
		switch (i-1){
		case 2:
			EntFire("Brush_level_23","Enable","",0);
		case 1:
		case 0:
			//EntFire("Brush_level_09","Disable","",0);
			EntFire("Brush_level_21","Disable","",0);
		default:
			break;
		}
	}else if(MapLevel==2){
		EntFire("Brush_level_1*","Disable","",0);
		EntFire("prop_level_1*","Kill","",0);
		EntFire("Brush_level_4*","Disable","",0);
		EntFire("prop_level_4*","Kill","",0);
		EntFire("prop_level_typeB","Kill","",0);
		
		EntFire("brush_level_brock_11","Disable","",0);
		EntFire("prop_level_brock_11","Kill","",0);
		EntFire("brush_level_outside01","Enable","",0);
		EntFire("brush_level_wall01","Enable","",0);
		EntFire("Brush_fence_0*","Enable","",0);
		EntFire("brush_level_pipe_01","Enable","",0);
		local i = RandomInt(0,9);
		switch (i){
		case 0:
			EntFire("Brush_level_06","Enable","",0);
			EntFire("prop_level_22*","Kill","",0);
		case 1:
		case 2:
			EntFire("Brush_level_03","Enable","",0);
		case 3:
			EntFire("Brush_level_04","Enable","",0);
			//EntFire("Brush_level_09","Enable","",0);
		case 4:
			EntFire("Brush_level_01","Enable","",0);
		case 5:
		case 6:
			EntFire("Brush_level_02","Enable","",0);
			EntFire("Brush_level_52","Enable","",0);
			EntFire("Brush_level_21","Enable","",0);
		case 7:
			EntFire("Brush_level_23","Disable","",0);
		case 8:
			EntFire("Brush_level_05","Enable","",0);
		case 9:
		default:
			break;
		}
		switch (i-1){
		case 9:
		case 8:
			EntFire("Brush_level_05","Disable","",0);
			EntFire("prop_level_55","Kill","",0);
		case 7:
			EntFire("Brush_level_23","Enable","",0);
		case 6:
			EntFire("Brush_level_02","Disable","",0);
			EntFire("Brush_level_52","Disable","",0);
			EntFire("prop_level_52","Kill","",0);
			EntFire("prop_level_50_1","Kill","",0);
			EntFire("Brush_level_21","Disable","",0);
		case 5:
		case 4:
			EntFire("prop_level_01","Kill","",0);
			EntFire("Brush_level_01","Disable","",0);
		case 3:
			EntFire("Brush_level_04","Disable","",0);
			//EntFire("Brush_level_09","Disable","",0);
		case 2:
			EntFire("Brush_level_03","Disable","",0);
		case 1:
			EntFire("prop_level_08","Kill","",0);
		case 0:
			EntFire("Brush_level_06","Disable","",0);
		default:
			break;
		}
	}else if(MapLevel==3){
		EntFire("prop_level_0*","Kill","",0);
		EntFire("prop_level_1*","Kill","",0);
		EntFire("prop_level_2*","Kill","",0);
		EntFire("prop_level_5*","Kill","",0);
		EntFire("prop_level_brock_11","Kill","",0);
		EntFire("prop_level_typeB","Kill","",0);
		EntFire("Brush_level_0*","Disable","",0);
		EntFire("Brush_level_1*","Disable","",0);
		EntFire("Brush_level_2*","Disable","",0);
		EntFire("Brush_level_5*","Disable","",0);
		EntFire("Brush_fence_0*","Disable","",0);
		EntFire("brush_level_brock_11","Disable","",0);
		
		EntFire("brush_level_wall01","Enable","",0);
		EntFire("prop_level_41","Enable","",0);
		EntFire("Brush_level_4*","Enable","",0);
	}
}
			//EntFire("prop_level_*","Enable","",0);
			//EntFire("Brush_level_*","Enable","",0);

//valveを押したら
function trigger_pipe_01(){
	team <- activator.GetTeam();
	if(3==team){
		EntFire("script_chat","RunScriptCode","chat_valve01(pipe_01)",0);
		EntFire("progress_pipe_valve01","SetGlowDisabled","",0);
		EntFire("script_chat","RunScriptCode","time(10)",pipe_01-10);
		EntFire("script_trigger_02","RunScriptCode","triggered_pipe_01()",pipe_01);
	}else if(2==team){
		triggered_zombie();
	}
}

function triggered_pipe_01(){
	EntFire("progress_prop_pipe_01","Kill","",0);
	EntFire("brush_level_pipe_01","Disable","",0);
	EntFire("progress_particle_pipe_01","Start","",0);
	EntFire("shake_explode_sparks","StartShake","",0);
	EntFire("se_c4_exp_deb1","PlaySound","",0);
	EntFire("se_c4_exp_deb2","PlaySound","",0);
	EntFire("progress_particle_pipe_01","Stop","",1);
	EntFire("progress_particle_pipe_01_oil","Start","",0.2);
	EntFire("script_chat","RunScriptCode","chat_valve01changed()",0);
}

//ladderに近づいたら
function trigger_ladder01(){
	team <- activator.GetTeam();
	if(3==team){
		EntFire("script_chat","RunScriptCode","chat_ladder01(ladder01)",0);
		EntFire("tele_particle_01","Start","",ladder01-25);
		EntFire("Tele_afk_01","Enable","",ladder01-20);
		EntFire("script_chat","RunScriptCode","time(10)",ladder01-10);
		EntFire("script_trigger_02","RunScriptCode","triggered_ladder01()",ladder01);
	}else if(2==team){
		triggered_zombie();
	}
}

function triggered_ladder01(){
	EntFire("script_chat","RunScriptCode","chat_ladder01enable()",0);
	EntFire("progress_ladder_ladder01","Enable","",0);
	EntFire("progress_brush_ladder01","Disable","",0);
	EntFire("progress_brush_pipe01","Disable","",0);
	EntFire("brush_level_outside01","Disable","",0);
	EntFire("progress_brush_pipe02","Disable","",4);
}


//1つ目のゲートにtriggerしたら
function trigger_01(){
	team <- activator.GetTeam();
	if(3==team){
		EntFire("script_chat","RunScriptCode","chat_1stCY(fence_02)",0);
		EntFire("script_chat","RunScriptCode","time(30)",fence_02-30);
		EntFire("script_chat","RunScriptCode","time(10)",fence_02-10);
		EntFire("script_trigger_02","RunScriptCode","triggered_01()",fence_02);
		if(MapLevel==2){
			EntFire("se_c4_exp_deb1","PlaySound","",0);
			EntFire("se_c4_exp_deb2","PlaySound","",0);
			EntFire("shake_explode_sparks","StartShake","",2);
			EntFire("particle_explosion_01","Start","",2);
			EntFire("fence_explosion_01","Kill","",2);
			EntFire("explosion_01","Explode","",2);
			EntFire("se_c4_exp_deb1","PlaySound","",0);
			EntFire("se_c4_exp_deb2","PlaySound","",0);
			EntFire("shake_explode_sparks","StartShake","",20);
			EntFire("particle_explosion_02","Start","",20);
			EntFire("fence_explosion_02","Kill","",20);
			EntFire("explosion_02","Explode","",20);
			EntFire("tele_particle_01","Start","",fence_02-25);
			EntFire("Tele_afk_01","Enable","",fence_02-20);
		}
	}else if(2==team){
		triggered_zombie();
	}
}

function triggered_01(){
	EntFire("script_chat","RunScriptCode","chat_1stCYopened()",0);
	EntFire("brush_fence_02","Disable","",0);
	EntFire("fence_02","EnableMotion","",0);
	EntFire("fence_02","DisableMotion","",2.5);
	EntFire("fence_02","Sleep","",2.5);
	EntFire("fence_02","Break","",10);
}

//2つ目のゲートにtriggerしたら
function trigger_02(){
	team <- activator.GetTeam();
	if(3==team){
		EntFire("script_chat","RunScriptCode","chat_RearFence(fence_03)",0);
		EntFire("fence_03","Open","",fence_03);
		EntFire("fence_03","Lock","",fence_03+3);
		EntFire("brush_fence_03","Disable","",fence_03);
		EntFire("script_chat","RunScriptCode","time(10)",fence_03-10);
		EntFire("script_trigger_02","RunScriptCode","triggered_02()",fence_03);
	}else if(2==team){
		triggered_zombie();
	}
}

function triggered_02(){
	EntFire("script_chat","RunScriptCode","chat_RearFenceopened()",0);
	EntFire("tele_particle_01","Stop","",0);
	EntFire("tele_particle_02","Start","",0);
	EntFire("Tele_afk_02","Enable","",5);
	EntFire("progress_particle_pipe_01_oil","Stop","",5);
	EntFire("particle_burn_car","Stop","",5);
}

//3つ目のゲートにtriggerしたら
function trigger_03(){
	team <- activator.GetTeam();
	if(3==team){
		EntFire("script_chat","RunScriptCode","chat_2ndGate(fence_04)",0);
		EntFire("fence_04","EnableMotion","",fence_04);
		EntFire("fence_04","DisableMotion","",fence_04+2.5);
		EntFire("fence_04","Sleep","",fence_04+2.5);
		EntFire("fence_04","Break","",fence_04+10);
		EntFire("script_chat","RunScriptCode","time(10)",fence_04-10);
		EntFire("script_trigger_02","RunScriptCode","triggered_03()",fence_04);
	}else if(2==team){
		triggered_zombie();
	}
}

function triggered_03(){
	EntFire("script_chat","RunScriptCode","chat_2ndGateopened()",0);
	EntFire("tele_particle_02","Stop","",35);
	EntFire("tele_particle_03","Start","",35);
	EntFire("Tele_afk_03","Enable","",40);
	EntFire("particle_burn_1stCY","Stop","",40);
}

//4つ目のゲートにtriggerしたら
function trigger_04(){
	team <- activator.GetTeam();
	if(3==team){
		//ChatMsg(MapLevel);
		EntFire("script_chat","RunScriptCode","chat_2ndCY(fence_05)",0);
		EntFire("fence_05","Open","",fence_05);
		EntFire("fence_05","Lock","",fence_05+3);
		EntFire("brush_fence_05","Disable","",fence_05);
		EntFire("script_chat","RunScriptCode","time(10)",fence_05-10);
		EntFire("script_trigger_02","RunScriptCode","triggered_04()",fence_05);
	}else if(2==team){
		triggered_zombie();
	}
}

function triggered_04(){
	EntFire("script_chat","RunScriptCode","chat_2ndCYopened(ship_time)",0);
	EntFire("tele_particle_03","Stop","",ship_time-35);
	EntFire("tele_particle_04","Start","",ship_time-35);
	EntFire("Tele_afk_04","Enable","",ship_time-30);
	EntFire("hurt_zm_sea","Enable","",ship_time);
	EntFire("script_chat","RunScriptCode","time(30)",ship_time-30);
	EntFire("script_chat","RunScriptCode","time(10)",ship_time-10);
	//ChatMsg(MapLevel);
	if(MapLevel==2){
		EntFire("kujira_zombie_tri","Enable","",ship_time);
		EntFire("kujira_zombie_tri","Disable","",ship_time+1);
		EntFire("script_trigger_02","RunScriptCode","check_zombie()",ship_time+1);
	}else{
		EntFire("kujira_zombie_tri","Enable","",ship_time);
		EntFire("kujira_zombie_tri","Kill","",ship_time+1);
		EntFire("script_trigger_02","RunScriptCode","check_zombie()",ship_time+1);
	}
}

//船にtriggerしたら
function trigger_ship(){
	team <- activator.GetTeam();
	if(2==team){
		triggered_zombie();
	}
}

function triggered_zombie(){
	EntFire("script_chat","RunScriptCode","chat_zombie_triggerd()",0);
	EntFire("fade_redout","Fade","",0);
	EntFire("hurt_nuke_CT*","Enable","",2);
}

//kujiraが動いたら
function kujira_start(){
	//ChatMsg("kujira "+MapLevel);
	if(MapLevel==2){
		EntFire("script_chat","RunScriptCode","chat_boss_incoming()",0);
		kujira_train_speed(300);
		EntFire("kujira_count_tri","Enable","",0);
		EntFire("kujira_count_tri","Disable","",0.1);
		EntFire("bgm_*","Volume","0",0);
		EntFire("bgm_*","StopSound","",1);
		EntFire("bgm_boss_hello_31337","PlaySound","",3);
		EntFire("kujira_prop","Enable","",0);
		EntFire("kujira_prop","SetAnimation","Fly",0);
		EntFire("kujira_prop","SetDefaultAnimation","Fly",1);
		EntFire("kujira_particle_nami","Start","",10);
		EntFire("kujira_particle_nami","Stop","",12);
		EntFire("timer_check_ct","Enable","",15);
		if(false==watched_movie){
			EntFire("fade_kujira_mae","Fade","0",0);
			EntFire("Camera_01","Enable","",2);
			for(local i=0;i<80;i++){
				local x = i*2;
				if(x>40)x=40;
				if(i<20){
					EntFire("Camera_01","AddOutput","angles "+x+" "+(15+(i*2))+" "+0,3+(i*0.05));
				}else {
					EntFire("Camera_01","AddOutput","angles "+x+" "+(15+(i*2))+" "+0,3+(i*0.05));
				}
			}
			EntFire("Camera_01","AddOutput","angles 0 15 0",7);
			EntFire("Camera_01","AddOutput","origin 11000 1469 -1075",7);
			EntFire("Camera_01","Disable","",10);
			EntFire("Camera_02","Enable","",10);
			EntFire("Camera_02","StartMovement","",11);
			EntFire("Camera_02","Disable","",14);
			
			EntFire("brush_movie","Disable","",14);
		}
		
		EntFire("script_trigger_02","RunScriptCode","check_kujira()",215);
	}
}


function zombie_triggered(){
	zm_tri <- true;
}


function check_zombie(){
	if(false==zm_tri){
		if(2==MapLevel&&false==killed_kujira){
			EntFire("script_trigger_02","RunScriptCode","kujira_start()",0);
			return;
		}
		triggered_advanced();
		EntFire("script_chat","RunScriptCode","chat_humans_win()",0);
		EntFire("wood_panel","Disable","",0);
		nuke_enable("_T*");
	}else{
		EntFire("script_chat","RunScriptCode","chat_zombies_win()",0);
		EntFire("fade_redout","Fade","",0);
		EntFire("hurt_nuke_CT*","Enable","",2);
	}
}


function check_ct(){
	if(aboard_checking==false){
		EntFire("kujira_check_ct","Enable","",0);
		EntFire("kujira_check_ct","Disable","",1);
		EntFire("script_trigger_02","RunScriptCode","ct_aboard_check()",2);
		aboard_checking <- true;
	}
}

function human_aboard(){
	ct_aboard <- true;
}

function ct_aboard_check(){
	if(ct_aboard==false){
		EntFire("script_chat","RunScriptCode","chat_left_ship()",0);
		EntFire("fade_redout","Fade","",0);
		EntFire("hurt_nuke_CT*","Enable","",2);
	}else{
		ct_aboard <- false;
		aboard_checking <- false;
	}
}

function killed_kujira_bool(){
	killed_kujira <- true;
}


function check_kujira(){
	EntFire("timer_check_ct","Disable","",0);
	if(true==killed_kujira&&false==zm_tri){
		triggered_zm();
		EntFire("script_chat","RunScriptCode","chat_humans_win()",0);
		EntFire("wood_panel","Disable","",0);
		nuke_enable("_T");
		nuke_enable("_CT");
		//EntFire("hurt_nuke_CT","Enable","",2);
	}else{
		EntFire("kujira_hitbox","Kill","",0);
		EntFire("script_chat","RunScriptCode","chat_time_up()",0);
		EntFire("fade_redout","Fade","",0);
		EntFire("hurt_nuke_CT*","Enable","",2);
		
	}
}

function change_tri_movie(bool){
	watched_movie <- bool;
}

function zm_mode_trigger(){
	SendToConsoleServer("zr_infect_mzombie_ratio 5");
	EntFire("script_chat","RunScriptCode","chat_zm_mode()",0);
	//EntFire("sei*","Kill","",0);
	//EntFire("sara*","Kill","",0);
	//EntFire("hosi*","Kill","",0);	
	EntFire("fence_02","EnableMotion","",0);
	EntFire("fence_02","DisableMotion","",2.5);
	EntFire("fence_02","Sleep","",2.5);
	EntFire("fence_03","Open","",0);
	EntFire("fence_03","Lock","",2);
	EntFire("fence_04","EnableMotion","",0);
	EntFire("fence_04","DisableMotion","",2.5);
	EntFire("fence_04","Sleep","",2.5);
	EntFire("fence_05","Open","",0);
	EntFire("fence_05","Lock","",2);
	
	EntFire("trigger_0*","Kill","",0);
	EntFire("trigger_ship","Kill","",0);
	
	EntFire("Tele_afk_01","Enable","",0);
	EntFire("Tele_afk_01","Disable","",4);
	EntFire("Tele_ship","Enable","",1);
	EntFire("tele_portal_particle_01","Start","",1);
	EntFire("Tele_spawn","Enable","",1);
	EntFire("tele_portal_particle_02","Start","",1);
	
	EntFire("bgm_through_the_fire_and_flames","PlaySound","",0);
	EntFire("button_vending_machine*","UnLock","",4);
	EntFire("hurt_zm_sea","Enable","",0);
	
	EntFire("script_chat","RunScriptCode","time(120)",zm_time-120);
	EntFire("script_chat","RunScriptCode","time(60)",zm_time-60);
	EntFire("script_chat","RunScriptCode","time(30)",zm_time-30);
	EntFire("script_chat","RunScriptCode","time(10)",zm_time-10);
	EntFire("script_chat","RunScriptCode","time(5)",zm_time-5);
	EntFire("script_trigger_02","RunScriptCode","zm_mode_end()",zm_time);
}

function zm_mode_end(){
	triggered_basic();
	nuke_enable("_T*");
}


/*

function check_maplevel(){
	MapLevel <- Level(-1);
	ChatMsg(MapLevel);
}

				else{
					EntFire("Camera_01","AddOutput","angles "+(160-(i*2))+" "+(15+(i*2))+" "+0,3+(i*0.05));
				}
	
	EntFire("script_trigger_02","RunScriptCode","",60);



*/
