

global.dt = delta_time/1000000;

if keyboard_check_pressed(vk_escape) {
	with instance_create_layer(20,20,"control",objPauseMenu) {
		instance_deactivate_all(true);
	}
}


/*if instance_number(parEnemy) = 0 and !instance_exists(objFade) {
	with objHud  finished = true;
	if mouse_check_button_pressed(mb_left) {
		global.level += 1;
		instance_create_layer(0,0,"control",objFade); 
	}
}*/
/*
if keyboard_check_pressed(ord("P")) {
	instance_create_layer(objPlayer.x,objPlayer.y,"control",objEgg);
}*/


/*
if keyboard_check_pressed(vk_numpad0)  {
	audio_stop_all();
	scrTransition(rmEnd,true);
}
if keyboard_check_pressed(vk_numpad2)  {
	global.level = 2;
	room_restart();
}
if keyboard_check_pressed(vk_numpad3)  {
	global.level = 3;
	room_restart();
}
if keyboard_check_pressed(vk_numpad4)  {
	global.level = 4;
	room_restart();
}
if keyboard_check_pressed(vk_numpad5)  {
	global.level = 5;
	room_restart();
}
if keyboard_check_pressed(vk_numpad6)  {
	global.level = 6;
	room_restart();
}
if keyboard_check_pressed(vk_numpad7)  {
	global.level = 7;
	room_restart();
}
if keyboard_check_pressed(vk_numpad8)  {
	global.level = 8;
	room_restart();
}
if keyboard_check_pressed(vk_numpad9)  {
	global.level = 9;
	room_restart();
}
if keyboard_check_pressed(ord("M"))  {
	global.level = 10;
	room_goto(2);
}