maxHp = 20;
hp = maxHp;
spd = 15;
range = 75;
strafeOdds = 1;
strafeRangeMin = 45;
strafeRangeMax = 135;
strafeDirMin = 15;
strafeDirMax = 30;

dmg = 5;
shootType = 1;
shotTime = 1;
bulletAmount = 1;
bulletType = objHomingBullet;
bulletSpd = 40;
//meleeRange = 100;
//meleeSpd = 150;
//hitbox = objPorcupineHitbox;
attackTime = 180;
shootFrame = 5;
shootFirst = false;
yoffset = 0;
//bulletOffset = 32; // amount of variance around player

deadSpd = 140;
deadFric = 6;
deadDmg = 4;

idleSprite = sprGoatIdle;
walkSprite = sprGoatWalk;
throwSprite = sprGoatThrow;
attackSprite = sprGoatAttack2;
//meleeSprite = sprGoatMelee;
deadSprite = sprGoatDead;
deadObject = objEnemyDead;

weight = 1;

var ID = id;
with instance_create_layer(x,y,"enemy",objEnemyHurtbox) {
	enemyPar = ID;
}


event_inherited();
