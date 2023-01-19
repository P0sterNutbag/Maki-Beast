event_inherited();

if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
	// Regenerate the Player's HP
	if hp > 0 and objPlayer.hp < objPlayer.maxHp {
		var ID = id;
		with objPlayer  hp += ID.hpUp;
		hp -= hpUp;
	}
} else if state = states.toss {
	scrBounceMove(fric,hitSound,parEnemyHurtbox,dust);
}