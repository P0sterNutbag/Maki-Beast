if image_index = 1 {
	var ID = id;
	scrDamage(other.enemyPar,dmg);
	with other.enemyPar {
		if canKnockback = true {
			stunTime = ID.stunTime;
			stunTimer = 0;
			state = states.stun;
		}
	}
}

