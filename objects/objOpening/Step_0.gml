if alphaChange > 0 {
	if image_alpha < 1 {
		image_alpha += alphaChange;
	} else if image_alpha = 1 {
		execute after 1 second
			alphaChange = -0.02;
		done
		image_alpha = 1.5;
	}
} else {
	if image_alpha > 0 {
		image_alpha += alphaChange;
	} else if image_alpha = 0 {
		execute after 1 second
			instance_destroy();
			instance_create_layer(0,0,"control",objMenu2);
		done
		image_alpha = -0.5;
	}
}

if mouse_check_button_released(mb_left) or keyboard_check_released(vk_space) {
	instance_destroy();
	instance_create_layer(0,0,"control",objMenu2);
}


// Music 
if !audio_is_playing(sndMainTheme) {
	audio_stop_all();
	audio_play_sound(sndMainTheme,1,true);
}