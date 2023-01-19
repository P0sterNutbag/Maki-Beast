mpos = 0;
menuNumber = 0
space = 16;

// Pause Screen
menus[0,0] = "Start"
menus[0,1] = "Options"
menus[0,2] = "Quit"

// Pause Screen
menus[1,0] = "Normal"
menus[1,1] = "Hard"

// Set title (default is the center)
y_offset = 16;

width = 256;
height = 144;
display_set_gui_size(width,height);

// Set room target
ini_open("save.ini");
tutorialComplete = ini_read_real("data","tutorial",0);
gameComplete = ini_read_real("data","complete",0);
ini_close();

//tutorialComplete = false;