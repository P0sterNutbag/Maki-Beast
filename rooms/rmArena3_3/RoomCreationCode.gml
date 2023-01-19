global.area = 3;
global.level += 1;
instance_create_depth(0,0,0,objLevelSkinner);
instance_create_depth(0,0,0,objSpawner);

var levelPos = ds_list_find_index(global.area2Levels,room);
ds_list_delete(global.area2Levels,levelPos);
