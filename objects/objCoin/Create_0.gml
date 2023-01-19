dir = random(360);
spd = random_range(50,125);
target = noone;
ang = 0;

image_speed = 0;

if place_meeting(x,y,objWall)  instance_destroy();