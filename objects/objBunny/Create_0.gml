event_inherited();

maxHp = 8;
hp = maxHp;
spd = 15;
range = 50;
strafeOdds = 0;
strafeRangeMin = 45;
strafeRangeMax = 135;
strafeDirMin = 50;
strafeDirMax = 75;

dmg = 5;
bulletSpd = 50;
shootType = 1;
bulletType = objBullet;
attackTime = 120;
bulletAmount = 1; 
shotTime = 5; // Rapid Fire bullet delay
bulletSpread = 25;
yoffset = 0//-6;
shootFrame = 5;
shootFirst = true;

deadSpd = 160;
deadFric = 8;
deadDmg = 2.5;

idleSprite = sprBunnyIdle;
walkSprite = sprBunnyWalk;
throwSprite = sprBunnyThrow;
attackSprite = sprBunnyAttack;
deadSprite = sprBunnyDead;
deadObject = objEnemyDead;


weight = 1;

var ID = id;
with instance_create_layer(x,y,"enemy",objEnemyHurtbox) {
	enemyPar = ID;
}
