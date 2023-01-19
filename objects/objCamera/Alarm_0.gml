// Deactivate and Reactivate
if instance_exists(obj_player) {
	left = obj_player.x-160;
	top = obj_player.y-90;
	width = 480;
	height = 270;
}
/*left = obj_player.x-300;
top = obj_player.y-150
width = 600;
height = 300;*/

instance_deactivate_object(par_entity);
instance_deactivate_object(obj_enemy1);

instance_activate_region(left,top,width,height,true);


alarm[0] = room_speed/2;
