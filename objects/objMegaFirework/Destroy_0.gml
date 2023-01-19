instance_create_layer(x,y-sprite_height/2,"partical",objBlast);

var createAmount = 12
var ID = id;
for(var i=0; i<createAmount; i++) {
	with instance_create_layer(x,y-sprite_height/2,"projectile",objFirework) {
		dir = (360/createAmount)*i;
		dad = ID.dad;
		spd = throwSpd;
		state = states.toss;
	}
}

instance_create_layer(x,y,"bullet",objMiniBlast);