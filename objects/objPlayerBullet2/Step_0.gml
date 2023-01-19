hsp = lengthdir_x(spd,dir);
vsp = lengthdir_y(spd,dir);
collision(hsp,vsp,objControl);

image_angle = dir;

// Hurt enemies and stop on walls
var enemyHurtbox = instance_place(x,y,parEnemyHurtbox);
if enemyHurtbox {
	var enemy = enemyHurtbox.enemyPar;
	scrDamage(enemy,dmg);
	instance_destroy();
}

if place_meeting(x,y,objWall)  instance_destroy();
