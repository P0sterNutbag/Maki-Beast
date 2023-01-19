maxHp = 15;
hp = maxHp;
spd = 15;
range = 120;
strafeOdds = 1;
strafeRangeMin = 45;
strafeRangeMax = 135;
strafeDirMin = 50;
strafeDirMax = 75;

dmg = 5;
bulletSpd = 50;
shootType = 2;
bulletType = objBullet;
attackTime = 180;
bulletAmount = 8; 
shotTime = 5; // Rapid Fire bullet delay
bulletSpread = 25;
yoffset = 0;
shootFrame = 5;
shootFirst = false;

deadSpd = 140;
deadFric = 6;
deadDmg = 4;

idleSprite = sprJayIdle;
walkSprite = sprJayWalk;
throwSprite = sprJayThrow;
attackSprite = sprJayAttack;
deadSprite = sprJayDead;
deadObject = objEnemyDead;

weight = 1;

var ID = id;
with instance_create_layer(x,y,"enemy",objEnemyHurtbox) {
	enemyPar = ID;
}


event_inherited();
