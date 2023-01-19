throwSpd = 150;
fric = 0;
dmg = 0;
explodeTime = 60;

hp = 0;
dir = 0;
vsp=0;hsp=0;
canhurt = false;
state = states.walk;
yoffset = objPlayer.sprite_height/2+1;

hitSound = sndImpact;
dust = objDust3;

bounce = 0;

weight = 2;
class = 2;
myName = "FIREWORK"

damagedEnemies = ds_list_create();