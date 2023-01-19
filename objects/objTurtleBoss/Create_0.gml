event_inherited();

maxHp = 125;
hp = maxHp;
spd = 7;
range = 120;
strafeOdds = 0;
strafeRangeMin = 45;
strafeRangeMax = 135;
strafeDirMin = 50;
strafeDirMax = 75;
canKnockback = false;

dmg = 5;
bulletSpd = 75;
shootType = 2;
bulletType = objBullet;
attackTime = 240;
bulletAmount = 26; 
shotTime = 5; // Rapid Fire bullet delay
bulletSpread = 25;
yoffset = 0;
shots = 0;
shootFrame = 10;
shootFirst = false;

deadSpd = 140;
deadFric = 6;
deadDmg = 4;

idleSprite = sprTurtleBossIdle;
walkSprite = sprTurtleBossWalk;
//throwSprite = sprTurtleBossHurt;
attackSprite = sprTurtleBossAttack;
deadSprite = sprTurtleBossDead;
deadObject = objEnemyDead;

weight = 1;

var ID = id;
with instance_create_layer(x,y,"enemy",objTurtleBossHurtbox) {
	enemyPar = ID;
}
