hp = 60;
state = states.wait;
canKnockback = false;
image_speed = 0;
invincible = false;
canKnockback = false;
flash = false;

var ID = id;
with instance_create_layer(x,y,"enemy",objEnemyHurtbox) {
	enemyPar = ID;
}
