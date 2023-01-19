maxHp = 10;
hp = maxHp;
spd = 15;
range = 50;
strafeRangeMin = 45;
strafeRangeMax = 135;
strafeDirMin = 15;
strafeDirMax = 30;

dmg = 5;
bulletSpd = 75;
shootType = 1;
attackTime = 50;
bulletAmount = 5; 
bulletType = objBullet;
shotTime = 3; // Rapid Fire bullet delay
bulletSpread = 25;
yoffset = 0;
shootFrame = 6;
strafeOdds = 1;
shootFirst = true;

deadSpd = 140;
deadFric = 6;
deadDmg = 4;

idleSprite = sprDevilIdle
walkSprite = sprDevilWalk;
throwSprite = sprDevilThrow;
attackSprite = sprDevilAttack;
deadSprite = sprDevilDead;
deadObject = objEnemyDead;

weight = 1;

var ID = id;
with instance_create_layer(x,y,"enemy",objEnemyHurtbox) {
	enemyPar = ID;
}


event_inherited();
