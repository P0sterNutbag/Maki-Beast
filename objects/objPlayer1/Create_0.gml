// Values
maxHp = 50;
hp = maxHp;
spd = 60;
rollspd = 90;
grabRange = 16;
invincitime = 60;

// Animate
walkSprite = sprPlayerWalk;
idleSprite = sprPlayerIdle;
holdSprite = sprPlayerHold;
holdWalkSprite = sprPlayerHoldWalk;
rollSprite = sprPlayerRoll;

// Don't Change
dir = point_direction(x,y,mouse_x,mouse_y)
state = states.walk;
vsp = 0; hsp = 0;
grabObj = noone;
canthrow = true;
flash = false;
invincible = false;
instance_create_layer(x,y,"player",objPlayerHurtbox);
instance_create_layer(0,0,"player",objCursor);
cangrab = true;
gold = 0;
