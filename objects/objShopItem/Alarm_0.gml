if targetPrice = 1  list = global.class1Projectiles;
else if targetPrice = 2  list = global.class2Projectiles;
else if targetPrice = 3  list = global.class3Projectiles;

if targetPrice < 10 {
	var len = ds_list_size(list)-1;
	myObj = ds_list_find_value(list,irandom(len));
	var obj = instance_create_depth(0,0,0,myObj);
	sprite_index = object_get_sprite(myObj);
	price = obj.class*20;
	name = obj.myName;
	instance_deactivate_object(obj);
} else if targetPrice != 11 {
	myObj = objHealthkit;
	sprite_index = object_get_sprite(myObj);
	price = 20;
	name = "HEALTHY APPLE";
} else {
	myObj = objHealthkit2;
	sprite_index = object_get_sprite(myObj);
	price = 40;
	name = "HEALTHY PEAR";
}
