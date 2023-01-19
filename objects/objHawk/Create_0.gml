playerXorg = objPlayer.x;
playerYorg = objPlayer.y;


// End Tutorial
if room = rmTutorial {
	ini_open("save.ini");
	ini_write_real("data","tutorial",1);
	ini_close();
}