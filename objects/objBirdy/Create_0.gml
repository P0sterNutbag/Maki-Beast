maxHp = 5;
hp = maxHp;
spd = 40;
range = 25;
strafeOdds = 0;
strafeRangeMin = 45;
strafeRangeMax = 135;
strafeDirMin = 15;
strafeDirMax = 30;

dmg = 5;
shootType = 5;
meleeRange = 45;
meleeSpd = 110;
hitbox = objBirdyHitbox;
attackTime = 20;
shootFrame = 5;
shootFirst = false;

deadSpd = 160;
deadFric = 8;
deadDmg = 2.5;

idleSprite = sprBirdyWalk;
walkSprite = sprBirdyWalk;
throwSprite = sprBirdyThrow;
attackSprite = sprBirdyAttack;
meleeSprite = sprBirdyMelee;
deadSprite = sprBirdyDead;
deadObject = objEnemyDead;

weight = 1;

var ID = id;
with instance_create_layer(x,y,"enemy",objBirdyHurtbox) {
	enemyPar = ID;
}


event_inherited();
