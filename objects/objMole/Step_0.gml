event_inherited();

if instance_exists(objPlayer) {
	switch(state) {
		case states.chase: scrEnemyChase(); break;
		case states.attack: scrEnemyAttack(); break;
		case states.hold: scrEnemyHold(); break;
		case states.toss: scrEnemyThrow(); break;
		case states.walk: scrEnemyWalk(); break;
		case states.strafe: scrEnemyStrafe(); break;
		case states.wait: scrEnemyWait(); break;
		case states.dig: scrEnemyDig(); break;
		case states.knockBack: scrEnemyKnockback(); break;
		case states.stun: scrEnemyStun(); break;
	}
}

// Handle Hurtbox
if sprite_index = sprMoleIdle {
	visible = false;
	if instance_exists(myHurtbox) {
		instance_destroy(myHurtbox);
	}
} else if !instance_exists(myHurtbox) {
	visible = true;
	var ID = id;
	myHurtbox = instance_create_layer(x,y,"enemy",objEnemyHurtbox);
	with myHurtbox {
		enemyPar = ID;
	}
}