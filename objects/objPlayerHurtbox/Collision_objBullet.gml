if objPlayer.state != states.cutscene {
	if objPlayer.invincible = false {
		with other instance_destroy();
	}
	scrDamage(objPlayer,other.dmg);
}
