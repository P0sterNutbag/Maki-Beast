throwSpd = 320;
fric = 8;
dmg = 5;
yoffset = objPlayer.sprite_height/2+1;

hp = 0;
vsp=0;hsp=0;
canhurt = false;
state = states.walk;
spin = 4;

hitSound = sndImpact;

weight = 2;
class = 2;
myName = "SPEAR"
damagedEnemies = ds_list_create();