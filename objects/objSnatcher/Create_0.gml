event_inherited();

maxHp = 15;
hp = maxHp;
spd = 15;
maxSpd = spd;
range = 50;
strafeOdds = 1;
strafeRangeMin = 45;
strafeRangeMax = 135;
strafeDirMin = 15;
strafeDirMax = 30;

dmg = 5;
//bulletSpd = 40;
shootType = 7;
bulletType = objPillarBullet;
attackTime = 180;
bulletAmount = 5; 
//shotTime = 5; // Rapid Fire bullet delay
//bulletSpread = 0;
//yoffset = 0//-6;
shootFrame = 0;
shootFirst = false;
bulletOffset = 32;

deadSpd = 140;
deadFric = 6;
deadDmg = 4;

idleSprite = sprSnatcherIdle;
walkSprite = sprSnatcherWalk;
throwSprite = sprSnatcherThrow;
attackSprite = sprSnatcherAttack2;
deadSprite = sprSnatcherDead;
deadObject = objEnemyDead;

weight = 1;

grabObj = noone;

var ID = id;
with instance_create_layer(x,y,"enemy",objEnemyHurtbox) {
	enemyPar = ID;
}

