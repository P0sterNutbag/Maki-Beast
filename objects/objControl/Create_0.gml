randomize();

// Set Game Surface
surface_resize(application_surface, 512, 288);

global.dt = delta_time/1000000;


// Start Music
alarm[2] = 1;


// Check for win
if room != menu and room != rmEnd and room != rmTutorial and room != rmArena1_Shop and room != rmArena2_Shop and room != rmArena3_Shop
alarm[1] = 60;






/*if room = room1  scrGenerateLevel();

if room = rmBoss {
	with objPlayer {
		x = 527;
		y = 432;
		state = states.walk;
	}
	// Rock Data
	projectileMax = 30;
	projectile[0] = objRock;
	projectile[1] = objRock;
	projectile[2] = objRock;
	projectile[3] = objRock;
	projectile[4] = objRock2;
	projectile[5] = objPebble;
	projectile[6] = objRockBreak;
	projectile[7] = objCactus;
	projectile[8] = objCactus2;
	projectile[9] = objTurtle;
	projectile[10] = objTumbleweed;
	projectile[11] = objBomb;
	projectile[12] = objScatterBomb;
	projectile[13] = objSaw;
	projectile[14] = objMiniSaw;
	// spawn rocks
	projectileCount = 0;
	while projectileCount < projectileMax {
		xx = irandom_range(392,645);
		yy = irandom_range(265,453);
		if instance_exists(parGrabbable)  var pn = instance_nearest(xx,yy,parGrabbable);  else pn = 0;
		if (point_distance(xx,yy,pn.x,pn.y) > 15) {
			var et = irandom(array_length_1d(projectile)-1)
			with instance_create_layer(xx,yy,"enemy",projectile[et]) {
				var change = weight;
			}
			projectileCount += change;
		}	
	}
}

if room = rmEnd {
	with objPlayer {
		x = 520;
		y = 439;
		state = states.walk;
	}
}