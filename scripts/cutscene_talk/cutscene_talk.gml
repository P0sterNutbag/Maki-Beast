function cutscene_talk(text_array) {
	if !instance_exists(objTextbox) {
		with instance_create_layer(0,0,"control",objTextbox) {
			text = text_array;
		}
	}
}
