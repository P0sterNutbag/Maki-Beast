event_inherited();

maxHp = 5;
hp = maxHp;
spd = 25;
range = 15;
strafeOdds = 0;
strafeRangeMin = 45;
strafeRangeMax = 135;
strafeDirMin = 15;
strafeDirMax = 30;

dmg = 5;
shootType = 5;
meleeRange = 30;
meleeSpd = 40;
hitbox = objMiniWormHitbox;
attackTime = 60;
shootFrame = 2;
shootFirst = false;

deadSpd = 160;
deadFric = 8;
deadDmg = 2.5;

babyObject = objMiniMiniWorm;
babyNumber = 0; // Amount of babies made when killed

idleSprite = sprMiniWorm;
walkSprite = sprMiniWorm;
throwSprite = sprMiniWorm;
attackSprite = sprMiniWorm;
meleeSprite = sprMiniWorm;
deadSprite = sprMiniWormDead;
deadObject = objEnemyDead;
shadowSprite = sprMiniWormShadow;

weight = 1;



var ID = id;
with instance_create_layer(x,y,"enemy",objBirdyHurtbox) {
	enemyPar = ID;
}

