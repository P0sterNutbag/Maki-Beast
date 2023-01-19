if image_index = 0 {
	// Spawn a random projectile and then destory self
	var odds, list;
	odds = random(100)
	if global.area = 1 {
		if odds < 75  list = global.class1Projectiles;
		else if odds < 95  list = global.class2Projectiles;
		else  list = global.class3Projectiles;
	} else if global.area = 2 {
		if odds < 45  list = global.class1Projectiles;
		else if odds < 75 list = global.class2Projectiles;
		else  list = global.class3Projectiles;
	} else if global.area = 3 {
		if odds < 0  list = global.class1Projectiles;
		else if odds < 50  list = global.class2Projectiles;
		else  list = global.class3Projectiles;
	} 
	var len = ds_list_size(list)-1;
	var spawnObj = ds_list_find_value(list,irandom(len));
	// Make sure its actually a projectile
	while object_get_sprite(spawnObj) = -1 {
		var spawnObj = ds_list_find_value(list,irandom(len));
	}
	ds_list_delete(list,ds_list_find_index(list,spawnObj));

	instance_create_layer(x,y+1,"projectile",spawnObj);

	// Add projectile to the tier
	ds_list_add(global.projectileTier2,spawnObj);
}

image_index = 1;
