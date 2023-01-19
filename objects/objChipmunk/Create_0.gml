maxHp = 8;
hp = maxHp;
spd = 25;
range = 32;
strafeOdds = 0;
strafeRangeMin = 45;
strafeRangeMax = 135;
strafeDirMin = 15;
strafeDirMax = 30;

dmg = 5;
bulletSpd = 50;
shootType = 5;
bulletType = objBullet;
attackTime = 1;
bulletAmount = 1; 
shotTime = 5; // Rapid Fire bullet delay
bulletSpread = 25;
yoffset = 0//-6;
shootFrame = 5;
shootFirst = false;

blastObject = objBlast;
blastDmg = 20;
blastTime = 60;
blastTimer = 0;

deadSpd = 160;
deadFric = 8;
deadDmg = 2.5;

idleSprite = sprChipmunkIdle;
walkSprite = sprChipmunkWalk;
throwSprite = sprChipmunkThrow;
attackSprite = sprChipmunkAttack;
deadSprite = sprChipmunkDead;
deadObject = objEnemyDead;

weight = 1;

var ID = id;
with instance_create_layer(x,y,"enemy",objEnemyHurtbox) {
	enemyPar = ID;
}


event_inherited();
