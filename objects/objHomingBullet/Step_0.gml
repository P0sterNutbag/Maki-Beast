event_inherited();

if instance_exists(objPlayer) {
	var targetDir = point_direction(x,y,objPlayer.x,objPlayer.y);
} else  targetDir = dir;

var dd = angle_difference(dir, targetDir);
dir -= (abs(dd)*0.10*sign(dd));

// Explode On Projectiles
var projectile = instance_place(x,y,parGrabbable);
if projectile and projectile.state == states.toss {
	instance_destroy();
}
if place_meeting(x,y,objPlayerBullet) {
	instance_destroy();
}
