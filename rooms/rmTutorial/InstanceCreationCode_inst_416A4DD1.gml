var inst = instance_nearest(x,y,objVillager1);
t_scene_info = [
	[cutscene_instance_destroy,parEnemy],
	[cutscene_change_camera_target,objPlayer],
	[cutscene_move_character,objPlayer,inst.x+36,inst.y,false,1,sprPlayerWalk,sprPlayerWalk],
	[cutscene_wait,0.5],
	[cutscene_talk,[
	"Well done, stranger!",sprVillager1Bust,
	"The rest of the journey is up to you, and I wish you the best of luck.",sprVillager1Bust,
	"Oh, I almost forgot to introduce myself." ,sprVillager1Bust,
	"My name's Rico.", sprVillager1Bust, // sancho?
	"What's yours?",sprVillager1Bust,
	"...",sprPlayerBust,
	"Still quiet, huh?",sprVillager1Bust,
	"Well, you look like a 'Maki' to me.",sprVillager1Bust,
	"Say, Maki. Keep an eye out for my cousins in the desert, they can help you on your journey.",sprVillager1Bust,
	"Well, I guess this is goodbye, Maki.",sprVillager1Bust,
	"Take this, it'll help you get around.",sprVillager1Bust,
	]],
	[cutscene_instance_create,inst.x+16,inst.y,"projectile",objEgg],
	[cutscene_change_camera_target,objPlayer],
	[cutscene_wait,0.5]
]
