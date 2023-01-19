// Move along the output string
currentCharacter = string_char_at(string(text[textPhase]),textPosition);
textPosition++;
textOutput += currentCharacter;
currentLine += currentCharacter;

// Check for line break
//lineLength++;
if currentCharacter = " " {
	var checkString = "";
	var i = 1;
	var nextCharacter = string_char_at(string(text[textPhase]),textPosition+i);
	while nextCharacter != " " {
		nextCharacter = string_char_at(string(text[textPhase]),textPosition+i);
		checkString += nextCharacter;
		i++;
		if i > 50  break;
	}
	if string_width(currentLine)+string_width(checkString) > width {
		textOutput += "\n";
		currentLine = "";
	}
}

// Reset
if string_length(textOutput) <= string_length(string(text[textPhase]))+1 {
	alarm[0] = textSpeed;
}
