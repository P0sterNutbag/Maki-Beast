t_scene_info = [
	[cutscene_change_camera_target,objPlayer],
	[cutscene_move_character,objPlayer,0,-50,true,1,sprPlayerWalk,sprPlayerWalk],
	[cutscene_move_character,objPlayer,objShopkeep.x-objPlayer.x,0,true,1,sprPlayerWalk,sprPlayerIdle],
	[cutscene_wait,0.5],
	[cutscene_change_camera_target,objShopkeep],
	[cutscene_talk,[
	"I'm impressed you've made it this far, Maki.",sprVillager1Bust,
	"You've reached the end of this desert, up ahead is the king of Beastmen.",sprVillager1Bust,
	"If you can defeat him, the flower is yours and you can cure the curse.",sprVillager1Bust,
	"But it won't be an easy fight, so make sure you're prepared.",sprVillager1Bust,
	"I'll be rooting for you, Maki!",sprVillager1Bust,
	]],
	[cutscene_change_camera_target,objPlayer],
	[cutscene_wait,0.5]
]
