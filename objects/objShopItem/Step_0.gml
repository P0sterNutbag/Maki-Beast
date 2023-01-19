if collision_rectangle(x-1,y,x+2,y+18,objPlayer,false,false) {
	if mouse_check_button_released(mb_left) {
		if objPlayer.gold >= price {
			objPlayer.gold -= price
			if myObj = objHealthkit {
				if objPlayer.hp + 10 > objPlayer.maxHp {
					objPlayer.hp = objPlayer.maxHp
				} else {
					objPlayer.hp += 10;
				}
				audio_play_sound(sndHpUp,1,false);
			} else if myObj = objHealthkit2 {
				if objPlayer.hp + 25 > objPlayer.maxHp {
					objPlayer.hp = objPlayer.maxHp
				} else {
					objPlayer.hp += 25;
				}
				audio_play_sound(sndHpUp,1,false);
			} else {
				ds_list_delete(list,ds_list_find_index(list,myObj));
				ds_list_add(global.projectileTier2,myObj);
				instance_create_layer(objPlayer.x,objPlayer.y+5,"projectile",myObj);
				audio_play_sound(sndCoin,1,false);
			}
			instance_destroy();
		}
	}	
}
