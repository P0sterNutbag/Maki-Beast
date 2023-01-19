event_inherited();

maxHp = 1;
hp = maxHp;
spd = 20;
range = 8;
strafeOdds = 0;
strafeRangeMin = 45;
strafeRangeMax = 135;
strafeDirMin = 15;
strafeDirMax = 30;

dmg = 3;
shootType = 5;
meleeRange = 16;
meleeSpd = 30;
hitbox = objMiniMiniWormHitbox;
attackTime = 60;
shootFrame = 1;
shootFirst = false;

throwSpd = 100;
throwDmg = 2.5;
fric = 8;

deadSpd = 140;
deadFric = 6;
deadDmg = 4;

babyNumber = 0; // Amount of babies made when killed

idleSprite = sprMiniMiniWorm;
walkSprite = sprMiniMiniWorm;
throwSprite = sprMiniMiniWorm;
attackSprite = sprMiniMiniWorm;
meleeSprite = sprMiniMiniWorm;
deadSprite = sprMiniMiniWorm;
deadObject = objEnemyDead;
shadowSprite = sprMiniMiniWormShadow;

weight = 1;



var ID = id;
with instance_create_layer(x,y,"enemy",objMiniMiniWormHurtbox) {
	enemyPar = ID;
}

