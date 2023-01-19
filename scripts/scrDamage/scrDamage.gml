///scrDamage(obj, amount)
/// @arg obj
/// @arg amount
function scrDamage(argument0, argument1) {

	if argument0.object_index != objPlayer {
		with argument0 {
			hp -= argument1;
			alarm[0] = 15;
			flash = true;
			alarm[2] = 5;
			if canKnockback {
				knockBackSpd = knockBackSpdMax;
				if (object_index == objTurtle and state = states.toss)  lastState = states.walk;
				else  lastState = state;
				state = states.knockBack;
			}
		}
		audio_play_sound(sndEnemyHurt,1,false);
		var shake = max(2,argument1/4);
		objCamera.screenshake = clamp(shake,shake,4);
		scrFreeze(20);
	} 

	if argument0 = objPlayer and instance_exists(objPlayer) and objPlayer.hp > 0 {
		with objPlayer {
			// Check if holding skull
			if grabObj != noone and grabObj.object_index == objSkull {
				for (var i=0; i < instance_number(parEnemy); i++) {
					var inst = instance_find(parEnemy, i);
					scrDamage(inst,argument1);
				}
				instance_destroy(grabObj);
				grabObj = noone;
				objPlayer.state = states.walk;
			} else if invincible = false {
				hp -= argument1;
				flash = true; alarm[1] = 5;
				invincible = true; alarm[0] = invincitime; alarm[2] = 5;
				with objHud  alarm[0] = 15;
				//with other  instance_destroy();
				var shake = max(2,argument1/4);
				objCamera.screenshake = clamp(shake,shake,4);
				scrFreeze(40);
			}
		}
	}



}
