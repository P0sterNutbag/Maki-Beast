if instance_exists(boss) and instance_number(parEnemy) < 5 {
	// Create enemy emitter list
	ds_list_clear(enemySpawnList);
	if instance_number(objEnemyEmitter) > 0 {
		for (var i=0; i<instance_number(objEnemyEmitter)-1; i++) {
			var inst = instance_find(objEnemyEmitter, i);
			ds_list_add(enemySpawnList,inst);
		}
	}

	// Spawn enemies
	repeat(random_range(bossRoundMaxWeight,bossRoundMinWeight)) {
		// Get emitter position
		enemyListLength = ds_list_size(enemySpawnList);
		var currentSpawnerPos = irandom(enemyListLength-1);
		var currentSpawner = ds_list_find_value(enemySpawnList,currentSpawnerPos);
		var spawnX = currentSpawner.x;
		var spawnY = currentSpawner.y;
		// Determine enemy type
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
		// Spawn in enemy
		with instance_create_layer(spawnX,spawnY,"enemy",objEnemySummon) {
			summonObj = myEnemy;
		}
		// Clean up list 
		ds_list_delete(enemySpawnList,currentSpawnerPos);
		enemyMaxWeight[enemyWave] -= weight;
	}
}