width = 256;
height = 144;
display_set_gui_size(width,height);

alphaChange = 0.02;
image_alpha = 0;

/* Music
if !audio_is_playing(sndMainTheme) {
	//audio_stop_all();	
	audio_play_sound(sndMainTheme,1,true);
}