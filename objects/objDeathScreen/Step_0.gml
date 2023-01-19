var push = max(mouse_check_button_pressed(mb_left),keyboard_check_pressed(vk_space),keyboard_check_pressed(vk_enter),0);

if push and !instance_exists(objFade) {
	scrTransition(menu,true);
}