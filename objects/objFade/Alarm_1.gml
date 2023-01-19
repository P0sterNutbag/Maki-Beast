alpha_change = -0.03;
//image_alpha = 0.99;

if audioOff  audio_stop_all();
if roomDestination != room {
	room_goto(roomDestination);
} else room_restart();
