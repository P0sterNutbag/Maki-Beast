///scrShootCircleCircle(amount,spd,dmg)
/// @arg amount
/// @arg spd
/// @arg dmg
function scrShootCircle(argument0, argument1, argument2) {

	if argument0 > 1 {
		var dir2 = 360/argument0;
		var i;
		for(i = 0; i < argument0; i++) {
			with instance_create_layer(x+lengthdir_x(2,dir2),y+yoffset+lengthdir_y(2,dir2),"bullet",bulletType) {
				dir = dir2*i;
				spd = argument1;
				dmg = argument2;
			}
		}
	} else {
		with instance_create_layer(x+lengthdir_x(2,dir2),y+yoffset+lengthdir_y(2,dir2),"bullet",bulletType) {
			dir = dir2;
			spd = argument1;
			dmg = argument2;
		}
	}


}
