if image_index = 1 {
	scrDamage(other.enemyPar,dmg);
	var ID = id;
	with other.enemyPar {
		stunTime = ID.stunTime;
		stunTimer = 0;
		state = states.stun;
	}
}