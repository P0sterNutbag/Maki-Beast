event_inherited();

maxHp = 20;
hp = maxHp;
spd = 15;
range = 75;
strafeOdds = 1;
strafeRangeMin = 45;
strafeRangeMax = 135;
strafeDirMin = 15;
strafeDirMax = 30;
knockBackSpdMax = 20;

dmg = 5;
bulletSpd = 50;
shootType = 6;
bulletType = objBullet;
attackTime = 60;
bulletAmount = 1; 
shotTime = 5; // Rapid Fire bullet delay
bulletSpread = 25;
yoffset = 0//-6;
shootFrame = 8;
shootFirst = false;

throwSpd = 180;
throwDmg = 4;
fric = 1;

deadSpd = 140;
deadFric = 6;
deadDmg = 4;

idleSprite = sprTurtleIdle;
walkSprite = sprTurtleWalk;
throwSprite = sprTurtleThrow;
attackSprite = sprTurtleAttack;
deadSprite = sprTurtleShell;
deadObject = objEnemyDead;

weight = 1;

var ID = id;
with instance_create_layer(x,y,"enemy",objEnemyHurtbox) {
	enemyPar = ID;
}