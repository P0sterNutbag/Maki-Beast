maxHp = 15;
hp = maxHp;
spd = 20;
range = 75;
strafeOdds = 1;
strafeRangeMin = 45;
strafeRangeMax = 135;
strafeDirMin = 15;
strafeDirMax = 30;

dmg = 5;
shootType = 5;
meleeRange = 75;
meleeSpd = 90;
hitbox = objPorcupineHitbox;
attackTime = 60;
shootFrame = 7;
shootFirst = false;

deadSpd = 160;
deadFric = 8;
deadDmg = 2.5;

idleSprite = sprPorcupineIdle;
walkSprite = sprPorcupineWalk;
throwSprite = sprPorcupineThrow;
attackSprite = sprPorcupineAttack;
meleeSprite = sprPorcupineMelee;
deadSprite = sprPorcupineDead;
deadObject = objEnemyDead;

weight = 1.5;

var ID = id;
with instance_create_layer(x,y,"enemy",objEnemyHurtbox) {
	enemyPar = ID;
}


event_inherited();
