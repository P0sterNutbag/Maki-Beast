maxHp = 10;
hp = maxHp;
spd = 30;
range = 25;
strafeOdds = 0;
strafeRangeMin = 45;
strafeRangeMax = 135;
strafeDirMin = 15;
strafeDirMax = 30;

dmg = 5;
shootType = 5;
meleeRange = 40;
meleeSpd = 60;
hitbox = objWormHitbox;
attackTime = 60;
shootFrame = 2;
shootFirst = false;

deadSpd = 160;
deadFric = 8;
deadDmg = 2.5;

babyObject = objMiniWorm;
babyNumber = 2; // Amount of babies made when killed

idleSprite = sprWormWalk;
walkSprite = sprWormWalk;
throwSprite = sprWormWalk;
attackSprite = sprWormWalk;
meleeSprite = sprWormWalk;
deadSprite = noone;
deadObject = noone;

weight = 1;

var ID = id;
with instance_create_layer(x,y,"enemy",objWormHurtbox) {
	enemyPar = ID;
}

event_inherited();

shadowSprite = sprWormShadow;

