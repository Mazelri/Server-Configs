

IncludeScript("ze_ctr_terminal/ctr_terminal_base.nut");



function auto_setting(){
	
	SendToConsoleBoth("mp_buytime 10");
	SendToConsoleBoth("mp_freezetime 3");
	SendToConsoleBoth("mp_roundtime 12");
	SendToConsoleBoth("mp_maxmoney 20000");
	SendToConsoleBoth("mp_startmoney 20000");
	
	SendToConsoleBoth("sv_airaccelerate 10");
	SendToConsoleBoth("sv_clamp_unsafe_velocities 0");
	SendToConsoleBoth("sv_enablebunnyhopping 1");
	SendToConsoleBoth("sv_maxspeed 1000");
	
	
	SendToConsoleServer("zr_zspawn 1");
	SendToConsoleServer("zr_zspawn_block_rejoin 0");//途中入りを禁止する?
	SendToConsoleServer("zr_zspawn_timelimit_time 120");
	SendToConsoleServer("zr_zspawn_team_zombie 1");
	
	SendToConsoleServer("zr_infect_spawntime_min 15");
	SendToConsoleServer("zr_infect_spawntime_max 30");
	SendToConsoleServer("zr_infect_mzombie_mode dynamic");
	SendToConsoleServer("zr_infect_mzombie_ratio 6");
	SendToConsoleServer("zr_infect_mzombie_respawn 1");
	SendToConsoleServer("zr_infect_weapons_drop 1");
	
	SendToConsoleServer("zr_respawn 1");
	SendToConsoleServer("zr_respawn_delay 1");
	SendToConsoleServer("zr_respawn_team_zombie 1");
	SendToConsoleServer("zr_respawn_team_zombie_world 1");
	
	SendToConsoleServer("zr_class_modify humans health 100");
	SendToConsoleServer("zr_class_modify humans jump_distance 1.0");
	SendToConsoleServer("zr_class_modify humans jump_height 1.05");
	SendToConsoleServer("zr_class_modify humans kill_bonus 20");
	SendToConsoleServer("zr_class_modify humans no_fall_damage yes");
	SendToConsoleServer("zr_class_modify zombies health 5000");
	SendToConsoleServer("zr_class_modify zombies health_infect_gain 2000");
	SendToConsoleServer("zr_class_modify zombies health_regen_amount 200");
	SendToConsoleServer("zr_class_modify zombies health_regen_interval 1");
	SendToConsoleServer("zr_class_modify zombies jump_distance 1.0");
	SendToConsoleServer("zr_class_modify zombies jump_height 1.05");
	SendToConsoleServer("zr_class_modify zombies kill_bonus 20");
	SendToConsoleServer("zr_class_modify zombies no_fall_damage yes");
	
	
	SendToConsoleServer("zr_antibhop_limit 310");
	
	
}