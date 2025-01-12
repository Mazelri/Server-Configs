he_mdl <- Entities.FindByName(null, "HEnadebrush").GetModelName();
special_mdl <- Entities.FindByName(null, "specialnadebrush").GetModelName();
 
function SetHEnade(){
    nade <- null;
    while((nade = Entities.FindByClassname(nade, "hegrenade_projectile")) != null)
        nade.SetModel(he_mdl);
}
 
function SetMolly(){
    molly <- null;
    while((molly = Entities.FindByClassname(molly, "molotov_projectile")) != null)
        SetSpecialSnowflake(molly);
}
 
function SetSmoke(){
    smoke <- null;
    while((smoke = Entities.FindByClassname(smoke, "smokegrenade_projectile")) != null)
        SetSpecialSnowflake(smoke);
}
 
function SetDecoy(){
    decoy <- null;
    while((decoy = Entities.FindByClassname(decoy, "decoy_projectile")) != null)
        SetSpecialSnowflake(decoy);
}
 
function SetFlash(){
    flash <- null;
    while((flash = Entities.FindByClassname(flash, "flashbang_projectile")) != null)
        SetSpecialSnowflake(flash);
}
 
function SetSpecialSnowflake(faggot){
    faggot.SetModel(special_mdl);
    EntFireByHandle(faggot, "AddOutput", "skin 1", 0.0, null, null);
}

function BossUsage(n)
{
    if (n==0)
    {
        ScriptPrintMessageChatTeam(2, " \x01-----------------------------------------------------------------");
    	    ScriptPrintMessageChatTeam(2," \x02[\x07MAP\x02]\x05 Boss usage:\n");
            ScriptPrintMessageChatTeam(2," \x02[\x07MAP\x02]\x05 Rotate through attacks by pressing \x02+attack2 \x05(usually \x03right click\x05)");
            ScriptPrintMessageChatTeam(2," \x02[\x07MAP\x02]\x05 Use the selected attack by pressing \x02+attack \x05(usually \x03left click\x05)");
            ScriptPrintMessageChatTeam(2," \x01-----------------------------------------------------------------");
    }
    if (n==1)
    {
            ScriptPrintMessageChatTeam(2," \x01-----------------------------------------------------------------");
            ScriptPrintMessageChatTeam(2," \x02[\x07MAP\x02]\x01 TETRIS - Throws tetris pieces that damage humans");
            ScriptPrintMessageChatTeam(2," \x02[\x07MAP\x02]\x0E VORTEX - Pulls humans in close-mid range");
            ScriptPrintMessageChatTeam(2," \x02[\x07MAP\x02]\x02 FIRE BREATH - Ignites humans for a few seconds");
            ScriptPrintMessageChatTeam(2," \x02[\x07MAP\x02]\x0B FREEZE ORB - Throws an orb that will freeze any human it touches");
            ScriptPrintMessageChatTeam(2," \x01-----------------------------------------------------------------");
    }
}
