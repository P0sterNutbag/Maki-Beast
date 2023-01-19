throwSpd = 200;
fric = 0.5;
dmg = 8;
yoffset = objPlayer.sprite_height/2+4;

hp = 0;
vsp=0;hsp=0;
canhurt = false;
state = states.walk;
spin = 0;

hitSound = sndImpact;

weight = 2;
class = 3;
myName = "GLOWY DISK"
damagedEnemies = ds_list_create();
