event_inherited();

if instance_exists(objPlayer) {
	switch(state) {
		case states.chase: scrEnemyOnlyChase(); break;
		case states.attack: scrEnemyOnlyChase(); break;
		case states.hold: scrEnemyHold(); break;
		case states.toss: scrEnemyThrow(); break;
		case states.walk: scrEnemyWalk(); break;
		case states.strafe: scrEnemyStrafe(); break;
		case states.wait: scrEnemyWait(); break;
		case states.melee: scrEnemyMelee(); break;
		case states.knockBack: scrEnemyKnockback(); break;
		case states.stun: scrEnemyStun(); break;
	}
}