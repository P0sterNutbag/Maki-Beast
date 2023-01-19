throwSpd = 230;
fric = 4;
dmg = 3.5;

hitSound = sndImpact;
dust = objDust4;
weight = 1;
state = states.toss;

hp = 0;
vsp=0;hsp=0;
canhurt = false;
yoffset = 14;
bounce = 0;
dad = objPlayer.id;

// Add myself in rotation
ds_list_insert(objPotatoLauncher.myPotatos,0,id);
