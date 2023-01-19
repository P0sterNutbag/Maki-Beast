maxHp = 10;
hp = maxHp;
spd = 100;
range = 150;
strafeOdds = 0;
strafeRangeMin = 45;
strafeRangeMax = 100;
strafeDirMin = 0;
strafeDirMax = 360;

dmg = 5;
bulletSpd = 50;
shootType = 1;
bulletType = objBullet;
attackTime = 90;
bulletAmount = 1; 
shotTime = 5; // Rapid Fire bullet delay
bulletSpread = 25;
yoffset = 0//-6;
shootFrame = 9;
shootFirst = true;

deadSpd = 160;
deadFric = 8;
deadDmg = 2.5;

idleSprite = sprMoleIdle;
walkSprite = sprMoleIdle;
throwSprite = sprMoleThrow;
attackSprite = sprMoleAttack;
deadSprite = sprMoleDead;
digSprite = sprMoleDig;
deadObject = objEnemyDead;

weight = 1;

var ID = id;
myHurtbox = instance_create_layer(x,y,"enemy",objEnemyHurtbox);
with myHurtbox {
	enemyPar = ID;
}


event_inherited();
