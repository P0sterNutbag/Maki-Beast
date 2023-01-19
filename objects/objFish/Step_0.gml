if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
	dir = 0;
} else if state = states.toss {
	move();
	bounceOnWalls();
	slowDown(false);
	// Bite enemies
	var hurtbox = instance_place(x,y,objEnemyHurtbox);
	if hurtbox {
		enemy = hurtbox.enemyPar;
		scrDamage(enemy,dmg);
		attackTimer = 0;
		state = states.bite;
	}
} else if state = states.bite {
	if instance_exists(enemy) {
		x = enemy.x;
		y = enemy.y-6;
		
		if attackTimer > attackTime {
			scrDamage(enemy,dmg);
			attackTimer = 0;
		} else attackTimer++;
		
		depth = enemy.depth-1;
		image_speed = 1;
	} else {
		image_speed = 0;
		image_index = 0;
		state = states.walk;
	}
}