throwSpd = 225;
fric = 8;
dmg = 5;
hitSound = sndImpact;
weight = 2;
class = 2;
myName = "CACTUS BOOMERANG"
dust = objDust3;


spd = 0;
hits = 0;
spin = 0;
canReturn = false;
hp = 0;
vsp=0;hsp=0;
canhurt = true;
state = states.walk;
yoffset = objPlayer.sprite_height/2+1;
dad = noone;
damagedEnemies = ds_list_create();
