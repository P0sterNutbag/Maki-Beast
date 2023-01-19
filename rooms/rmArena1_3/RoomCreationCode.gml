global.area = 1;
instance_create_depth(0,0,0,objLevelSkinner);
instance_create_depth(0,0,0,objSpawner);

var levelPos = ds_list_find_index(global.levelData,rmArena1_3)
ds_list_delete(global.levelData,levelPos);
