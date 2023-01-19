///string_to_words(string)
///@arg string
function string_to_words(str) {
	var size = string_length(string(str));
	var words = undefined;
	words[0] = "";
	var w = 0;
	for(var i = 1; i <= size; i++) //for every character in string
	{
	 var ch = string_char_at(string(str), i);
	 if (ch == " ") //if space found
	 {
	  words[++w] = ""; //new word
	 }
	 else
	 {
	  words[w] += ch;//add character
	 }
	}
	return words;


}
