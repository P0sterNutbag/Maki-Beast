maxHp = 15;
hp = maxHp;
spd = 10;
range = 60;
strafeOdds = 1;
strafeRangeMin = 45;
strafeRangeMax = 135;
strafeDirMin = 50;
strafeDirMax = 75;

dmg = 5;
bulletSpd = 50;
shootType = 3;
bulletType = objBullet;
attackTime = 180;
bulletAmount = 3; 
shotTime = 5; // Rapid Fire bullet delay
bulletSpread = 25;
yoffset = 0;
shootFrame = 7;
shootFirst = true;

deadSpd = 160;
deadFric = 8;
deadDmg = 2.5;

walkSprite = sprBearWalk;
throwSprite = sprBearThrow;
attackSprite = sprBearAttack;
deadSprite = sprBearDead;
idleSprite = sprBearIdle;
deadObject = objEnemyDead;

weight = 1.5;

var ID = id;
with instance_create_layer(x,y,"enemy",objEnemyHurtbox) {
	enemyPar = ID;
}


event_inherited();
