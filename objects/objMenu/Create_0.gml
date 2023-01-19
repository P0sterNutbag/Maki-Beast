image_alpha = 0;
alpha_change[0] = 0.02;
alpha_change[1] = alpha_change[0];

// Main Menu
menus[0,0] = ""
// Pause Screen
menus[1,0] = "Continue"
menus[1,1] = "Options"
menus[1,2] = "Quit"
// Options
menus[2,0] = "Fullscreen"
menus[2,1] = "Windowed"
menus[2,2] = "Sound FX Volume: 5"
menus[2,3] = "Music Volume: 5"
menus[2,4] = "Return"

space = 16;
mpos = 0;
menu_number = 0;

// Intro Text
text[0] = "The Darkbone Plateau. A desolate land where the souls of the damned roam."
text[1] = "Some souls wander aimlessly, descending into madness."
text[2] = "Others hold desperately to what humanity they have left."
text[3] = "But a brave few search for the Devils Claw, a flower said to reincarnate souls."
text[4] = "No one has left for the flower and returned to tell the tale."
text[5] = "Some say they the journey only brings insanity,"
text[6] = "... while others tell of a deadly creature guarding the flower."
text[7] = "No one knows where this flower grows or what lies beyond the Plateau,"
text[8] = "... but that wont stop me from finding out."
textmax = array_length_1d(text);
t = 0;

a = 0;
ac = 0.05;

// Set title
if room = 0 {
	if !variable_global_exists("start") {
		global.start = true;
		title = 0;
	} else title = textmax;
} else title = textmax;

if room = menu  y_offset = 30;
else y_offset = 0;

width = 256;
height = 144;
display_set_gui_size(width,height);

image_speed = 0.05;

// Set target room for start
ini_open("save.ini");
tutorialComplete = ini_read_real("data","tutorial",0);
ini_close();

if tutorialComplete  roomDestination = rmTutorial//room1;
else roomDestination = rmTutorial;


// Audio
if room = menu  alarm[2] = 1;