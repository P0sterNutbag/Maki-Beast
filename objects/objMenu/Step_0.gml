var push = max(keyboard_check_released(vk_space),keyboard_check_released(vk_enter),mouse_check_button_released(mb_left),0);
var right = keyboard_check_pressed(ord("D"));
var left = keyboard_check_pressed(ord("A"));

if title = textmax {
	var move = 0;
	move -= keyboard_check_pressed(ord("W"));
	move += keyboard_check_pressed(ord("S"));
	if move != 0 {
		mpos += move;
		if mpos < 0  mpos = array_length_2d(menus, menu_number)-1;
		if mpos > array_length_2d(menus, menu_number)-1  mpos = 0;
	}
	if push == 1 and !instance_exists(objFade) {
		//audio_play_sound(snd_bump,1,false);
		scrMenu();
	}
	// Volume Control
	if menu_number = 2 and mpos = 2 {
		if right and global.sfxVol < 1 {
			global.sfxVol += 0.1;
			//audio_play_sound(snd_bump,1,false);
			scrMenu();
		} else if left and global.sfxVol > 0 {
			global.sfxVol -= 0.1;
			//audio_play_sound(snd_bump,1,false);
			scrMenu();
		} 
	}
	if menu_number = 2 and mpos = 3 {
		if right and global.musicVol < 1 {
			global.musicVol += 0.1;
			//audio_play_sound(snd_bump,1,false);
			scrMenu();
		} else if left and global.musicVol > 0 {
			global.musicVol -= 0.1;
			//audio_play_sound(snd_bump,1,false);
			scrMenu();
		} 
	}
	menus[2,2] = "Sound FX Volume: " + string(global.sfxVol);
	menus[2,3] = "Music Volume: " + string(global.musicVol);
} else if push {
	title = textmax;
} else if title < textmax {
	t += 0.25;
	if t > string_length(text[title]) and alarm[1] = -1 {
		alarm[0] = 30;
		alarm[1] = 60;
	}
	a += ac;
	a = clamp(a,0,1);
}

// Exit Pause menu
if keyboard_check_pressed(vk_escape) {
	if menu_number = 1 {
		instance_activate_all();
		instance_destroy();
	}
	if menu_number = 2 {
		menu_number = 1;
		mpos = 1;
	}
} 

/* Delete Data
if keyboard_check(ord("Z")) and keyboard_check(ord("M")) {
	ini_open("save.ini");
	ini_key_delete("data","tutorial");
	ini_close();
}
