// Inputs
var push = max(keyboard_check_released(vk_space),keyboard_check_released(vk_enter),mouse_check_button_released(mb_left),0);
var right = keyboard_check_pressed(ord("D"));
var left = keyboard_check_pressed(ord("A"));

// Move cursor
var move = 0;
move -= keyboard_check_pressed(ord("W"));
move += keyboard_check_pressed(ord("S"));
if move != 0 {
	mpos += move;
	if mpos < 0  mpos = array_length_2d(menus, menu_number)-1;
	if mpos > array_length_2d(menus, menu_number)-1  mpos = 0;
}
// Action
if push == 1 and !instance_exists(objFade) {
	//audio_play_sound(snd_bump,1,false);
	if menu_number = 0 {
		if mpos = 0 { // Continue
			instance_activate_all();
			instance_destroy();
		} else if mpos = 1 { // Options
			mpos = 0;
			menu_number = 1;
		} else if mpos = 2 { // Quit
			scrTransition(menu,true);
		}
	} else if menu_number = 1 { // Options
		if mpos = 0 { // Fullscreen 
			window_set_fullscreen(true);
		} else if mpos = 1 { // Windows
			window_set_fullscreen(false);
		} else if mpos = 2 { // Mute SFX
			audio_group_set_gain(agSFX,global.sfxVol,0);
		} else if mpos = 3 { // Mute Music
			audio_group_set_gain(agMUSIC,global.musicVol,0);
		} else if mpos = 4 {
			if room != menu {
				mpos = 0;
				menu_number = 0;
			} else {
				instance_activate_all();
				instance_destroy();
			}
		}
	}
}
// Volume Control
if menu_number = 1 and mpos = 2 {
	if right and global.sfxVol < 1 {
		global.sfxVol += 0.1;
		audio_group_set_gain(agSFX,global.sfxVol,0);
	} else if left and global.sfxVol > 0 {
		global.sfxVol -= 0.1;
		audio_group_set_gain(agSFX,global.sfxVol,0);
	} 
}
if menu_number = 1 and mpos = 3 {
	if right and global.musicVol < 1 {
		global.musicVol += 0.1;
		audio_group_set_gain(agMUSIC,global.musicVol,0);
	} else if left and global.musicVol > 0 {
		global.musicVol -= 0.1;
		audio_group_set_gain(agMUSIC,global.musicVol,0);
	} 
}
menus[1,2] = "Sound FX Volume: " + string(global.sfxVol);
menus[1,3] = "Music Volume: " + string(global.musicVol);

// Exit Pause menu
if keyboard_check_pressed(vk_escape) {
	if room != menu {
		if menu_number = 0 {
			instance_activate_all();
			instance_destroy();
		}
		if menu_number = 1 {
			menu_number = 0;
			mpos = 1;
		}
	} else {
		instance_activate_all();
		instance_destroy();
	}
} 
