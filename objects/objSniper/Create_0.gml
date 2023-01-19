maxHp = 8;
hp = maxHp;
spd = 15;
range = 130;
strafeOdds = 0;
strafeRangeMin = 16;
strafeRangeMax = 32;
strafeDirMin = 0;
strafeDirMax = 0;

dmg = 5;
bulletSpd = 200;
shootType = 1;
bulletType = objBullet;
attackTime = 180;
bulletAmount = 1; 
shotTime = 5; // Rapid Fire bullet delay
bulletSpread = 25;
yoffset = 0//-6;
shootFrame = 5;
shootFirst = false;
arrowAlpha = 1;

deadSpd = 160;
deadFric = 8;
deadDmg = 2.5;

idleSprite = sprCoyoteIdle;
walkSprite = sprCoyoteWalk;
throwSprite = sprCoyoteThrow;
attackSprite = sprCoyoteAttack;
deadSprite = sprCoyoteDead;
deadObject = objEnemyDead;

weight = 1;

var ID = id;
with instance_create_layer(x,y,"enemy",objEnemyHurtbox) {
	enemyPar = ID;
}


event_inherited();
newx = 0;newy = 0;
