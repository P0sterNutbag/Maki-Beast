event_inherited();

maxHp = 75;
hp = maxHp;
spd = 100;
range = 150;
strafeOdds = 0;
strafeRangeMin = 35;
strafeRangeMax = 75;
strafeDirMin = 0;
strafeDirMax = 360;
canKnockback = false;

dmg = 5;
bulletSpd = 100;
shootType = 1;
bulletType = objBullet;
attackTime = 90;
bulletAmount = 1; 
if global.difficulty = "hard" {
	shotDelay = 2; // Rapid Fire bullet delay
	shootFrameFirst = 20;
	shootFrameLast = 27;
	shootFrameFirst2 = 30; 
	shootFrameLast2 = 36;
}else if global.difficulty = "normal" {
	shotDelay = 6;
	shootFrameFirst = 20;
	shootFrameLast = 26;
	shootFrameFirst2 = 31; 
	shootFrameLast2 = 36;
}
bulletSpread = 25;
yoffset = 0//-6;
shootFirst = true;

deadSpd = 160;
deadFric = 8;
deadDmg = 2.5;

idleSprite = sprMoleBossAttack;
walkSprite = sprMoleBossAttack;
throwSprite = sprMoleBossHurt;
attackSprite = sprMoleBossAttack;
deadSprite = sprMoleBossDead;
deadObject = objEnemyDead;

weight = 1;

var ID = id;
myHurtbox = instance_create_layer(x,y,"enemy",objEnemyHurtbox);
with myHurtbox {
	enemyPar = ID;
}


