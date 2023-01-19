event_inherited();

if instance_exists(objPlayer) {
	switch(state) {
		case states.chase: scrEnemyChase(); 
		if attackTimer > 0  attackTimer -= 1;
		break;
		case states.attack: scrEnemyAttack(); break;
		case states.hold: scrEnemyHold(); break;
		case states.toss: scrEnemyThrow(); break;
		case states.walk: scrEnemyWalk(); break;
		case states.strafe: scrEnemyStrafe(); break;
		case states.wait: scrEnemyWait(); break;
		case states.knockBack: scrEnemyKnockback(); break;
		case states.stun: scrEnemyStun(); break;
	}
}
