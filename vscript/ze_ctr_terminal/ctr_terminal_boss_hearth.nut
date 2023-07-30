

IncludeScript("ze_ctr_terminal/ctr_terminal_boss.nut");



function Damaged(){
	Hearth--;
	if(Hearth<=0){
		EntFire("script_trigger_boss","RunScriptCode","kill_kujira()",0);
	}
}


