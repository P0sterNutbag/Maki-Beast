event_inherited();

//if objPlayer.grabObj = instance_id  instance_destroy();

hsp = lengthdir_x(spd,dir);
vsp = lengthdir_y(spd,dir);

if !place_meeting(x,y,objWall) and place_meeting(x+sign(hsp),y+sign(vsp),objWall) {
	if place_meeting(x+1,y,objWall) or place_meeting(x-1,y,objWall) {
		var changeDir = -(dir*2)+180
	} else if place_meeting(x,y+1,objWall) {
		var changeDir = ((270-dir)*2)+180
	} else if place_meeting(x,y-1,objWall) {
		var changeDir = ((90-dir)*2)+180
	} else changeDir = 180;
	dir += changeDir;
}

var enemy = instance_place(x+sign(hsp),y+sign(vsp),parEnemyHurtbox)
if enemy {
	if canhurt = true {
		canhurt = false;
		var ID = id;
		with enemy.enemyPar  hp -= ID.dmg;
		if place_meeting(x+1,y,parEnemyHurtbox) or place_meeting(x-1,y,parEnemyHurtbox) {
			var changeDir = -(dir*2)+180
		} else if place_meeting(x,y+1,parEnemyHurtbox) {
			var changeDir = ((270-dir)*2)+180
		} else if place_meeting(x,y-1,parEnemyHurtbox) {
			var changeDir = ((90-dir)*2)+180
		} else changeDir = 180;
		dir += changeDir;
	}
} else {
	canhurt = true;
}

spd -= fric;

if spd <= 1 {
	var ID = id;
	if sprite_index = sprRock {
		instance_create_layer(x,y,"projectile",objRock);
	} else if sprite_index = sprRock2 {
		instance_create_layer(x,y,"projectile",objRock2);
	} else if sprite_index = sprEnemyThrow {
		with instance_create_layer(x,y,"player",objEnemy) {
			hp = ID.hp;
		}
	}
	instance_destroy();
}

while place_meeting(x,y,objWall) {
	y += 1;
}

collision(hsp,vsp,objWall);
