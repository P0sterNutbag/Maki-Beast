// Spawn in Enemies
var enemyListLength = ds_list_size(enemySpawnList);
while enemyListLength > 0 and enemyMaxWeight[enemyWave] > 0 {
	enemyListLength = ds_list_size(enemySpawnList);
	var currentSpawnerPos = irandom(enemyListLength-1);
	var currentSpawner = ds_list_find_value(enemySpawnList,currentSpawnerPos);
	var spawnX = currentSpawner.x;
	var spawnY = currentSpawner.y;
	if irandom(100) <= t1enemyChance {
		var tier = t1e;
		var weight = 1;
	} else if irandom(100) <= t2enemyChance {
		tier = t2e;
		weight = 2;
	} else {
		tier = t3e;
		weight = 2;
	}
	var myEnemy = ds_list_find_value(tier,irandom(ds_list_size(tier)-1));
	if enemyWave = 1 { // First Spawn
		instance_create_layer(spawnX,spawnY,"enemy",myEnemy);
	} else { // Wave Spawns
		var stop = 0;
		while point_distance(spawnX,spawnY,objPlayer.x,objPlayer.y) > 114 { 
			enemyListLength = ds_list_size(enemySpawnList);
			var currentSpawnerPos = irandom(enemyListLength-1);
			var currentSpawner = ds_list_find_value(enemySpawnList,currentSpawnerPos);
			var spawnX = currentSpawner.x;
			var spawnY = currentSpawner.y;
			stop++;
			if stop > 1000  break;
		}
		with instance_create_layer(spawnX,spawnY,"enemy",objEnemySummon) {
			summonObj = myEnemy;
		}
	}
	ds_list_delete(enemySpawnList,currentSpawnerPos);
	enemyMaxWeight[enemyWave] -= weight;
}

// Change Waves
if instance_number(parEnemy) < 3 and enemyWave < maxWaves and !instance_exists(objEnemySummon) {
	// Reset spawner list
	ds_list_clear(enemySpawnList);
	for (var i=0; i<instance_number(objEnemySpawner)-1; i++) {
		var inst = instance_find(objEnemySpawner, i);
		ds_list_add(enemySpawnList,inst);
	}
	//t1enemyChance = 50;
	enemyWave++;
}

// Emit Enemies
if instance_number(objEnemyEmitter) > 0 and instance_exists(boss) and instance_number(parEnemy) < 5 {
	if alarm[0] = -1  alarm[0] = 700;
}


// Spawn in projectiles
var proListLength = ds_list_size(projectileSpawnList);
while proListLength > 0 and projectileMaxWeight > 0 {
	proListLength = ds_list_size(projectileSpawnList);
	var currentSpawnerPos = irandom(proListLength-1);
	currentSpawner = ds_list_find_value(projectileSpawnList,currentSpawnerPos);
	spawnX = currentSpawner.x;
	spawnY = currentSpawner.y;
	if irandom(100) < t1projectileChance {
		tier = global.projectileTier1;
		weight = 1;
	} else {//if chance < t2projectileChance {
		if ds_list_size(global.projectileTier2) <= 0  tier = global.projectileTier1;
		else  tier = global.projectileTier2;
		weight = 2;
	}
	myProjectile = ds_list_find_value(tier,irandom(ds_list_size(tier)-1));
	instance_create_layer(spawnX,spawnY,"projectile",myProjectile);
	ds_list_delete(projectileSpawnList,currentSpawnerPos);
	projectileMaxWeight -= weight;
	instance_destroy(currentSpawner);
}
