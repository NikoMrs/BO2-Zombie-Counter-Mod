#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\gametypes_zm\_hud_message;
#include maps\mp\zombies\_zm_utility;

init(){
    level thread onplayerconnect();
}

onplayerconnect(){
    for(;;)
    {
        level waittill("connected", player);
        player thread onplayerspawned();
    }
}

onplayerspawned(){
    self endon("disconnect");
    self thread MonitorZombieCount();
    for(;;){
        self waittill("spawned_player");
    }
}

MonitorZombieCount(){

    level endon("game_ended");
    self endon("disconnect");
    flag_wait("initial_blackscreen_passed" );

    self.zombiecounter = createfontstring("hudsmall", 1.5);
    self.zombiecounter setPoint("TOP_LEFT", "TOP_LEFT", -20, 20);
    self.zombiecounter.alpha = 1;
    self.zombiecounter.hidewheninmenu = 1;
    self.zombiecounter.hidewhendead = 1;

    for(;;){
        if(isdefined(self.afterlife) && self.afterlife){
            self.zombiecounter.label = &"^4Zombies: ";
            self.zombiecounter.alpha = 0.7;
        } else {
            self.zombiecounter.label = &"Zombies: ^1";
            self.zombiecounter.alpha = 1;
        }

        self.zombiecounter setvalue( get_round_enemy_array().size + level.zombie_total);


        wait 0.5;
    }

}