///draw_text_typewriter(words, x, y, width, count)
///@arg string
///@arg x
///@arg y
///@arg width
function draw_text_typewriter(argument0, argument1, argument2, argument3, argument4) {
	var words = string_to_words(argument0); //an array of words to draw
	var xx = argument1; //x position to draw
	var yy = argument2; //ypos to draw
	var width = argument3 //max width string can have
	var count = argument4; //number of characters to write
	var current_pos = 0;
	var sep = string_height("ABCDEFGHIJKLMNOPQRSTUVWXYZ");

	var line = ""; //line thats about to be drawn
	var line_number = 0;
	for(var i = 0; (i < array_length_1d(words) and (current_pos < count)); i++) {
	    word = words[i]; //current word were on
	    word += " "; //add space. fixes multiple spaces
	    var subword = string_copy(word, 1, count - current_pos);
	    current_pos += string_length(word);
	    var l = string_width(word); //length of current word
	    if (string_width(line) + l >= width) {
	        draw_text(xx, yy + line_number * sep, line);
	        line = subword; //new line starts with this word
	        line_number++;
	    } else {
	        line += subword;
	    }
	}
	//dont forget last line
	draw_text(xx, yy + line_number * sep, line);


}
