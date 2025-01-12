

function spawn_can1(){
	if(can<30){
		EntFire("se_button_vending_machine","PlaySound","",0);
		EntFire(table_vending_machine() + "1","ForceSpawn","",0);
	}else{
		EntFire("button_vending_machine*","Lock","",0);
	}
}

function spawn_can2(){
	if(can<30){
		EntFire("se_button_vending_machine","PlaySound","",0);
		EntFire(table_vending_machine() + "2","ForceSpawn","",0);
	}else{
		EntFire("button_vending_machine*","Lock","",0);
	}
}

function table_vending_machine(){
	venmachine_random <- RandomInt(0,99);
	if(venmachine_random<50){
		can++;
		return "temp_can";
	}else if(venmachine_random<60){
		return "temp_watermelon";
	}else if(venmachine_random<80){
		return "temp_banana";
	}else if(venmachine_random<99){
		return "temp_orange";
	}else{
		EntFire("se_c4_beep2_vending_machine","PlaySound","",1);
		EntFire("se_c4_beep2_vending_machine","PlaySound","",1.3);
		EntFire("se_c4_beep2_vending_machine","PlaySound","",1.6);
		EntFire("se_explotion_vending_machine","PlaySound","",2);
		EntFire("explosion_vending_machine","Explode","",2);
		EntFire("particle_vending_machine","Start","",2);
		EntFire("particle_vending_machine","Stop","",3);
		EntFire("shake_explode_full","StartShake","",2);
		EntFire("se_c4","PlaySound","",2);
		EntFire("c4_*","Kill","",2);
		return "temp_c4_";
	}
}

function spawn_can(){
}
