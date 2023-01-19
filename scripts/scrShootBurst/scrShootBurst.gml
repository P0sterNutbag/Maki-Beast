///scrShootCircleCircle(amount,spd,dmg)
/// @arg amount
/// @arg spread
/// @arg spd
/// @arg dmg
function scrShootBurst(argument0, argument1, argument2, argument3) {

	if argument0 > 1 {
		var dir1 = dir-((argument0*argument1)/2);
		var i;
		for(i = 0; i < argument0; i++) {
			var dir2 = (argument1/2)+dir1+argument1*i;
			with instance_create_layer(x+lengthdir_x(5,dir2),y+yoffset+lengthdir_y(5,dir2),"bullet",bulletType) {
				dir = dir2;
				spd = argument2;
				dmg = argument3;
			}
		}
	} else {
		with instance_create_layer(x+lengthdir_x(5,dir2),y+yoffset+lengthdir_y(5,dir2),"bullet",bulletType) {
			dir = dir2;
			spd = argument2;
			dmg = argument3;
		}
	}


}
