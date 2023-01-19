var hurtbox = instance_place(x,y,parEnemyHurtbox);
if hurtbox {
	var enemy = hurtbox.enemyPar;
	if ds_list_find_index(damagedEnemies,enemy) == -1 {
		scrDamage(enemy,dmg);
		ds_list_add(damagedEnemies,enemy);
		with enemy {
			bounceDir = point_direction(other.x,other.y,x,y);
		}
	}
}

