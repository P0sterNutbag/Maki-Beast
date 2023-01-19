enemySpawnList = ds_list_create();
projectileSpawnList = ds_list_create();

// Create enemy spawn list
for (var i=0; i<instance_number(objEnemySpawner)-1; i++) {
	var inst = instance_find(objEnemySpawner, i);
	ds_list_add(enemySpawnList,inst);
}

// Enemy Spawn Data
enemyWave = 1;
t1e = ds_list_create();
t2e = ds_list_create();
t3e = ds_list_create();
if global.area = 1 {
	enemyMaxWeight[1] = 8;
	enemyMaxWeight[2] = irandom_range(3,4);
	enemyMaxWeight[3] = irandom_range(2,3);
	if global.difficulty = "hard" {
		bossRoundMaxWeight = 2
		bossRoundMinWeight = 4
	} else {
		bossRoundMaxWeight = 2
		bossRoundMinWeight = 3;
	}
	boss = objMoleBoss;
	maxWaves = 3;
	t1enemyChance = choose(30,50,70);
	t2enemyChance = 100;
	// Tier One Enemies
	ds_list_insert(t1e,0,objBunny);
	ds_list_insert(t1e,0,objBunny);
	ds_list_insert(t1e,0,objBirdy);
	// Tier Two Enemies
	ds_list_insert(t2e,0,objBear);
	ds_list_insert(t2e,0,objBear);
	ds_list_insert(t2e,0,objPorcupine);
	ds_list_insert(t2e,0,objPorcupine);
	ds_list_insert(t2e,0,objMole);
} else if global.area = 2 {
	if global.difficulty = "hard" {
		enemyMaxWeight[1] = 16;
		enemyMaxWeight[2] = irandom_range(3,4);
		enemyMaxWeight[3] = irandom_range(3,4);
		enemyMaxWeight[4] = irandom_range(2,3);
		bossRoundMaxWeight = 2
		bossRoundMinWeight = 4
	} else {
		enemyMaxWeight[1] = 14;
		enemyMaxWeight[2] = irandom_range(3,4);
		enemyMaxWeight[3] = irandom_range(3,4);
		enemyMaxWeight[4] = irandom_range(2,3);
		bossRoundMaxWeight = 2
		bossRoundMinWeight = 3
	}
	boss = objTurtleBoss;
	maxWaves = 4;
	// Spawn Chances
	t1enemyChance = choose(10,20,40);
	t2enemyChance = 100;
	// Tier One Enemies
	ds_list_insert(t1e,0,objBunny);
	ds_list_insert(t1e,0,objBunny);
	ds_list_insert(t1e,0,objBunny);
	ds_list_insert(t1e,0,objBunny);
	ds_list_insert(t1e,0,objBirdy);
	ds_list_insert(t1e,0,objBirdy);
	ds_list_insert(t2e,0,objChipmunk);
	// Tier Two Enemies
	ds_list_insert(t2e,0,objJay);
	ds_list_insert(t2e,0,objSniper);
	ds_list_insert(t2e,0,objSnake);
	ds_list_insert(t2e,0,objJay);
	ds_list_insert(t2e,0,objSniper);
	ds_list_insert(t2e,0,objSnake);
	ds_list_insert(t2e,0,objTurtle);
} else if global.area = 3 {
	if global.difficulty = "hard" {
		enemyMaxWeight[1] = 18;
		enemyMaxWeight[2] = irandom_range(5,6);
		enemyMaxWeight[3] = irandom_range(3,4);
		enemyMaxWeight[4] = irandom_range(5,6);
		enemyMaxWeight[5] = irandom_range(2,3);
	} else {
		enemyMaxWeight[1] = 15;
		enemyMaxWeight[2] = irandom_range(5,6);
		enemyMaxWeight[3] = irandom_range(3,4);
		enemyMaxWeight[4] = irandom_range(5,6);
		enemyMaxWeight[5] = irandom_range(2,3);
	}
	maxWaves = 5;
	// Spawn Chances
	t1enemyChance = 50;
	t2enemyChance = 90;
	// Tier One Enemies
	ds_list_add(t1e,objDevil);
	ds_list_add(t1e,objDevil);
	ds_list_add(t1e,objGoat);
	// Tier Two Enemies
	ds_list_add(t2e,objJay);
	ds_list_add(t2e,objBear);
	ds_list_add(t2e,objWorm);
	ds_list_add(t2e,objSnatcher);
	// Tier Two Enemies
	ds_list_add(t3e,objFalcon);
}

// Projectiles
if global.area = 1 {
	projectileMaxWeight = 8;
	t1projectileChance = 75;
}
if global.area = 2 {
	projectileMaxWeight = 12;
	t1projectileChance = 50;
}
if global.area = 3 {
	projectileMaxWeight = 15;
	t1projectileChance = 35;
}
if room = rmArena3_Boss {
	projectileMaxWeight = 15;
	t1projectileChance = 20;
}

// Spawn the chest
var odds = 10;
if global.level = 2 or global.level = 6 or global.level = 9 or random(100) <= odds {
	if instance_number(objChestSpawner) > 0 {
		var inst = instance_find(objChestSpawner, irandom(instance_number(objChestSpawner)-1));
		instance_create_layer(inst.x,inst.y,"projectile",objChest);
	}
}


/* Set Projectile Spawn Data
t1p = ds_list_create();
t2p = ds_list_create();
t3p = ds_list_create();
if global.area = 1 {
	projectileMaxWeight = 5;
	// Tier One Projectiles
	t1projectileChance = 75;
	ds_list_insert(t1p,0,objRock);
	ds_list_insert(t1p,0,objRock);
	ds_list_insert(t1p,0,objPebble);
	// Tier Two Projectiles
	t2projectileChance = 95;
	ds_list_insert(t2p,0,objRock2);
	ds_list_insert(t2p,0,objRockBreak);
	// Tier Three Projectiles
	ds_list_insert(t3p,0,objBoomerang);
} else if global.area = 2 {
	projectileMaxWeight = 8;
	// Tier One Projectiles
	t1projectileChance = 70;
	ds_list_insert(t1p,0,objRock);
	ds_list_insert(t1p,0,objRock);
	ds_list_insert(t1p,0,objPebble);
	// Tier Two Projectiles
	t2projectileChance = 90;
	ds_list_insert(t2p,0,objRock2);
	ds_list_insert(t2p,0,objRockBreak);
	ds_list_insert(t2p,0,objCactus);
	ds_list_insert(t2p,0,objCactus2);
	// Tier Three Projectiles
	ds_list_insert(t3p,0,objBoomerang);
	ds_list_insert(t3p,0,objSaw);
}
/*
if room = rmArena1 or room = rmArena2 or room = rmArena3 {
	// Tier One Projectiles
	t1projectileChance = 75;
	ds_list_insert(t1p,0,objRock);
	ds_list_insert(t1p,0,objPebble);
	// Tier Two Projectiles
	t2projectileChance = 95;
	ds_list_insert(t2p,0,objRock2);
	ds_list_insert(t2p,0,objRockBreak);
	// Tier Three Projectiles
	ds_list_insert(t3p,0,objBoomerang);
}