event_inherited();

maxHp = 150;
hp = maxHp;
spd = 0;
range = 1000;

if global.difficulty = "normal" {
	attack1ShotDelay = 8;
	attack2ShotDelay = 10;
} else if global.difficulty = "hard" {
	attack1ShotDelay = 4;
	attack2ShotDelay = 5;
}

// Set up states
state = states.cutscene;
state_is_new = true;

dmg = 5;
bulletSpd = 75;
bulletType = objBullet;
attackTime = 220;
bulletAmount = 26; 
shotTime = 5; // Rapid Fire bullet delay
phaseTimer = 0;
shotTimer = 0;
bulletSpread = 25;
yoffset = 0;
shots = 0;
shootFrame = 6;
attackType = 0;
yorg = y;
depth = -100;

deadSpd = 140;
deadFric = 6;
deadDmg = 4;

idleSprite = sprWendigo;
walkSprite = sprWendigo;
attackSprite = sprWendigoAttack;
deadSprite = sprWendigo;
deadObject = objEnemyDead;

weight = 1;

/*var ID = id;
with instance_create_layer(x,y,"enemy",objTurtleBossHurtbox) {
	enemyPar = ID;
}
