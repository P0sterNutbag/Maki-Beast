///ScrSceneTransition(Destination, Stop Audio?)
///@arg Destination
///@arg Stop Audio?
function scrTransition(argument0, argument1) {
	with instance_create_layer(0,0,"control",objFade) {
		roomDestination = argument0;
		if argument1  audioOff = true;
		else audioOff = false;
	}
}
