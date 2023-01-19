if state = states.hold {
	while(place_meeting(x,y-1,objWall)) {
		y++;
	}
	state = states.attack;
	objPlayer.state = states.walk;
	scrDamage(objPlayer, escapeDmg);
}