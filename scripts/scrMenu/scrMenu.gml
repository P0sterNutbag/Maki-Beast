function scrMenu() {
	if menu_number = 0 {
		switch (mpos) {
			case 0: {
				if tutorialComplete {
					randomize();
					var levelSize = ds_list_size(global.area1Levels)-1;
					var rd = ds_list_find_value(global.area1Levels,irandom(levelSize));
					//rd = rmTutorial;
				} else {
					rd = rmTutorial;
				}
				scrTransition(rd,false);
				//room_goto(room1);
				break;
			}
			default: break;
		}
	} else if menu_number = 1 { // Pause Menu
		switch (mpos) {
			case 0: {
				instance_activate_all();
				instance_destroy(objMenu);
				break;
			}
			case 1: {
				mpos = 0;
				menu_number = 2;
				break;
			}
			case 2: {
				scrTransition(menu,true);
				break;
			}
		}
	} else if menu_number = 2 { // Options
		switch (mpos) {
			case 0: {
				window_set_fullscreen(true);
				break;
			}
			case 1: {
				window_set_fullscreen(false);
				break;
			}
			case 2: {
				audio_group_set_gain(agSFX,global.sfxVol,0);
				break;
			}
			case 3: {
				audio_group_set_gain(agMUSIC,global.musicVol,0);
				break;
			}
			case 4: {
				if room !=  menu {
					mpos = 0;
					menu_number = 1;
				} else {
					mpos = 0;
					menu_number = 0;
				}
				break;
			}
		}
	}



}
