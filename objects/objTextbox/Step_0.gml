var push = max(0,mouse_check_button(mb_left),keyboard_check(vk_space));
var press = max(0,mouse_check_button_pressed(mb_left),keyboard_check_pressed(vk_space));

// Set text speed
if push {
	if currentCharacter = "," or currentCharacter = "." or currentCharacter = "!" or currentCharacter = "?" {
		textSpeed = 3;
	} else {
		textSpeed = 1;
	}
} else { textSpeed = 3;
	if currentCharacter = "," or currentCharacter = "." or currentCharacter = "!" or currentCharacter = "?" {
		textSpeed = 9;
	} else {
		textSpeed = 3;
	}
}


if string_length(textOutput) >= string_length(string(text[textPhase])) {
	if alarm[1] = -1 {
		if drawIcon = false  drawIcon = true;
		else drawIcon = false;
		alarm[1] = 30;
	}
	// Move to next text or destroy
	if press {
		if textPhase+2 < array_length(text) {
			textPhase += 2;
			textOutput = "";
			currentLine = "";
			textPosition = 1;
			alarm[0] = 10;
		} else {
			with obj_cutscene  cutscene_end_action();
			instance_destroy();
		}
	} 
} else {
	drawIcon = false;
}

