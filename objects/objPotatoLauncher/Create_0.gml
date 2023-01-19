throwSpd = 160;
fric = 8;
dmg = 3.5;
yoffset = objPlayer.sprite_height/2+5;
maxPotato = 10;

dust = objDust3;
hitSound = sndImpact;
weight = 1;
class = 2;
myName = "POTATO CANON"

hp = 0;
vsp=0;hsp=0;
canhurt = false;
state = states.walk;
bounce = 0;
dad = noone;
shootTimer = 0;
dir = 0;
canshoot = false;
myPotatos = ds_list_create();
