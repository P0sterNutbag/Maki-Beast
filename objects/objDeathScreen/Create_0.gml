/*if global.showlvl < 4  zone = 1;
else if global.showlvl > 3 and global.showlvl < 7  zone = 2;
else zone = 3;
if global.showlvl = 1 or global.showlvl = 4 or global.showlvl = 7  lvl = 1;
else if global.showlvl = 2 or global.showlvl = 5 or global.showlvl = 8  lvl = 2;
else if global.showlvl = 3 or global.showlvl = 6 or global.showlvl = 9  lvl = 3;
else lvl = 4;

if zone = 1 {
	text = "You don't suck that bad. Go get 'em!";
} else if zone = 2 {
	text = "You're improving. Give it another go!";
} else if zone = 3 {
	text = "Shoot your almost there! I believe in you!";
}

text2 = @"Left Click
to Restart"

draw = false;
alarm[0] = 50;

audio_stop_all();
audio_play_sound(sndDeathScreen,1,true);