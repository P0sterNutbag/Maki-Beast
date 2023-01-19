maxHp = 10;
hp = maxHp;
spd = 50;
range = 100;
strafeOdds = 0;
strafeRangeMin = 100;
strafeRangeMax = 101;
strafeDirMin = 10;
strafeDirMax = 190;

dmg = 5;
bulletSpd = 80;
shootType = 1;
bulletType = objBullet;
attackTime = 50;
bulletAmount = 1; 
shotTime = 5; // Rapid Fire bullet delay
bulletSpread = 25;
yoffset = 0//-6;
shootFrame = 5;
shootFirst = true;

deadSpd = 140;
deadFric = 6;
deadDmg = 4;

idleSprite = sprSnakeIdle;
walkSprite = sprSnakeWalk;
throwSprite = sprSnakeThrow;
attackSprite = sprSnakeAttack;
deadSprite = sprSnakeDead;
deadObject = objEnemyDead;

weight = 1;

var ID = id;
with instance_create_layer(x,y,"enemy",objEnemyHurtbox) {
	enemyPar = ID;
}


event_inherited();
