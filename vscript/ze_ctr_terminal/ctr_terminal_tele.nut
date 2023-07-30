

IncludeScript("ze_ctr_terminal/ctr_terminal_base.nut");
IncludeScript("ze_ctr_terminal/ctr_terminal_trigger_02.nut");

/*
function zm_mode(bool){
	zm_mode_bool <- bool;
	//ChatMsg(zm_mode_bool);
}
*/
::pickup_fag_item <- false;

function Tele_afk_01(){
	activator.SetVelocity(Vector(0,0,0));
	//ChatMsg(zm_mode_bool);
	if(zm_mode_bool==true){
		activator.SetAngles(0,-90,0);
		activator.SetOrigin(Vector(RandomInt(10300,12600),RandomInt(-1600,-1200),-950));
	}else if(MapLevel==1){
		activator.SetAngles(0,-90,0);
		activator.SetOrigin(Vector(-300,-7270,-700));
	}else if(MapLevel==2){
		activator.SetAngles(0,0,0);
		activator.SetOrigin(Vector(-300,-7270,-700));
	}
}

function Tele_afk_02(){
	activator.SetAngles(0,0,0);
	activator.SetVelocity(Vector(0,0,0));
	activator.SetOrigin(Vector(4150,-5000,-1000));
}

function Tele_afk_03(){
	activator.SetAngles(0,0,0);
	activator.SetVelocity(Vector(0,0,0));
	activator.SetOrigin(Vector(6710,RandomInt(-5050,-4780),-925));
}

function Tele_afk_04(){
	activator.SetAngles(0,90,0);
	activator.SetVelocity(Vector(0,0,0));
	activator.SetOrigin(Vector(RandomInt(9050,9400),-6000,-1150));
}

function Tele_adminroom(){
	activator.SetAngles(0,90,0);
	activator.SetVelocity(Vector(0,0,0));
	activator.SetOrigin(Vector(2250,-5750,-700));
}

function Tele_fagitem(){
	if(pickup_fag_item==false){
		activator.SetAngles(0,90,0);
		activator.SetVelocity(Vector(0,0,0));
		activator.SetOrigin(Vector(3840,-5300,-850));
		pickup_fag_item = true;
		}
}

function Tele_spawn(){
	activator.SetAngles(0,0,0);
	activator.SetVelocity(Vector(0,0,0));
	activator.SetOrigin(Vector(10100,RandomInt(-1600,-1200),-1000));
}

function Tele_ship(){
	activator.SetAngles(0,180,0);
	activator.SetVelocity(Vector(0,0,0));
	activator.SetOrigin(Vector(RandomInt(200,600),RandomInt(-8500,-8000),-700));
}

