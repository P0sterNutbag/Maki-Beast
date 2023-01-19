throwSpd = 160;
fric = 4;
dmg = 2.5;
explodeTime = random_range(15,30);

hp = 0;
vsp=0;hsp=0;
canhurt = false;
state = states.walk;
yoffset = objPlayer.sprite_height/2;
bounce = 0;
spin = 0;

dust = objDust1;

hitSound = sndImpact;