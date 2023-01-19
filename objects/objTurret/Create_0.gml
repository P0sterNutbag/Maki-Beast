maxHp = 20;
hp = maxHp;
hpLast = hp;
spd = 30;
range = 1000;
strafeOdds = -1;
strafeRangeMin = 24;
strafeRangeMax = 24;
strafeDirMin = -10;
strafeDirMax = 10;
shootFirst = false;

dmg = 5;
bulletSpd = 50;
shootType = 2;
bulletType = objBullet;
attackTime = 120;
bulletAmount = 12; 
shotTime = 5; // Rapid Fire bullet delay
bulletSpread = 25;
yoffset = 0;
shootFrame = 5;


throwSpd = 170;
throwDmg = 2.5;
fric = 8;
;

deadSpd = 160;
deadFric = 8;
deadDmg = 2.5;

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
