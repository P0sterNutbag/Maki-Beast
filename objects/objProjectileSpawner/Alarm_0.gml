if instance_exists(objSpawner) {
	var ID = id;
	with objSpawner {
		ds_list_insert(projectileSpawnList,0,ID);
	}
}