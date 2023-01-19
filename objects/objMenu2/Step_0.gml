// Inputs
var push = max(keyboard_check_released(vk_space),keyboard_check_released(vk_enter),mouse_check_button_released(mb_left),0);
var move = 0;
move -= keyboard_check_pressed(ord("W"));
move += keyboard_check_pressed(ord("S"));
// Move Cursor
if move != 0 {
	mpos += move;
	if mpos < 0  mpos = array_length(menus[menuNumber])-1;
	if mpos > array_length(menus[menuNumber])-1  mpos = 0;
}
// Action
if push == 1 and !instance_exists(objFade) {
	if menuNumber = 0 {
		if mpos = 0 { // Continue
			menuNumber = 1;
			mpos = 0;
		} else if mpos = 1 { // Options
			with instance_create_depth(0,0,0,objPauseMenu) {
				menu_number = 1;
			}
			instance_deactivate_object(self);
		} else if mpos = 2 { // Quit
			game_end();
		} 
	} else if menuNumber = 1 {
		// Set difficulty
		if mpos = 0 {
			global.difficulty = "normal"
			global.hpDropRate = 10;
			global.attackTimeModifier = 1.5;
		} else if mpos = 1 {
			global.difficulty = "hard"
			global.hpDropRate = 5;
			global.attackTimeModifier = 1;
		}
		// Set room
		if tutorialComplete {
			randomize();
			var levelSize = ds_list_size(global.area1Levels)-1;
			roomDestination = ds_list_find_value(global.area1Levels,irandom(levelSize));
		} else roomDestination = rmTutorial;
		// Go to game
		scrTransition(roomDestination,true);
	}
}
// Go back to previous menu
if keyboard_check_pressed(vk_escape) and menuNumber = 1  menuNumber = 0;

/*if !audio_is_playing(sndMainTheme) {
	audio_stop_all();
	audio_play_sound(sndMainTheme,1,true);
}*/

// erase data
if keyboard_check_direct(ord("R")) {
	ini_open("save.ini");
	ini_key_delete("data","tutorial");
	ini_key_delete("data","complete");
	ini_close();
}
