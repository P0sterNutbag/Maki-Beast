event_inherited();

maxHp = 15;
hp = maxHp;
hpLast = hp;
spd = 30;
range = 1000;
strafeOdds = -1;
strafeRangeMin = 14;
strafeRangeMax = 14;
strafeDirMin = -10;
strafeDirMax = 10;
fleeMaxTime = 30;
fleeTime = 0;

dmg = 5;
bulletSpd = 50;
shootType = 1;
bulletType = objBullet;
attackTime = 20;
bulletAmount = 1; 
shotTime = 5; // Rapid Fire bullet delay
bulletSpread = 25;
yoffset = 0;
shootFrame = 1;
shootFirst = false;

deadSpd = 160;
deadFric = 8;
deadDmg = 2.5;

idleSprite = sprFalconIdle;
walkSprite = sprFalconWalk;
throwSprite = sprFalconThrow;
attackSprite = sprFalconAttack;
deadSprite = sprFalconDead;
deadObject = objEnemyDead;

weight = 1;

var ID = id;
with instance_create_layer(x,y,"enemy",objEnemyHurtbox) {
	enemyPar = ID;
}