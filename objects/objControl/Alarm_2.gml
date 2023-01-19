
if room = menu or room = rmEnd or room = rmTutorial or room = rmArena1_Shop or room = rmArena2_Shop or room = rmArena3_Shop {
	song = sndMainTheme;
	if !audio_is_playing(song) {
		audio_stop_all();
		audio_play_sound(song,1,true);
	}
} else if room = rmArena1_Boss or room = rmArena2_Boss {
	if global.area = 1 {
		song = sndBossTheme;
		if !audio_is_playing(song) {
			audio_stop_all();
			audio_play_sound(song,1,true);
		}
	} else if global.area = 2 {
		song = sndBossTheme2;
		if !audio_is_playing(song) {
			audio_stop_all();
			audio_play_sound(song,1,true);
		}
	}  else if global.area = 3 {
		song = sndBossTheme3;
		if !audio_is_playing(song) {
			audio_stop_all();
			audio_play_sound(song,1,true);
		}
	} 
} else {
	if global.area = 1 {
		song = sndBattleTheme;
		if !audio_is_playing(song) {
			audio_stop_all();
			audio_play_sound(song,1,true);
		}
	} else if global.area = 2 {
		song = sndBattleTheme2;
		if !audio_is_playing(song) {
			audio_stop_all();
			audio_play_sound(song,1,true);
		}
	} else if global.area = 3 {
		song = sndBattleTheme3;
		if !audio_is_playing(song) {
			audio_stop_all();
			audio_play_sound(song,1,true);
		}
	}
}