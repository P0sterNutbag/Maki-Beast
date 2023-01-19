///@descripption cutscene_instance_create
///@ x
///@ y 
///@ layer_id
///@ obj
function cutscene_instance_create(argument0, argument1, argument2, argument3) {

	//var inst = instance_create_layer(argument0,argument1,argument2,argument3);
	instance_create_layer(argument0,argument1,argument2,argument3);

	cutscene_end_action();

	//return isnt;


}
