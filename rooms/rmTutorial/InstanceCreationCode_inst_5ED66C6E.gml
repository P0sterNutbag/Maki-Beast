var inst = instance_nearest(x,y,objVillager1)
t_scene_info = [
	[cutscene_change_camera_target,objPlayer],
	[cutscene_move_character,objPlayer,inst.x-24,inst.y,false,1,sprPlayerWalk,sprPlayerWalk],
	[cutscene_change_xscale,objPlayer,1],
	[cutscene_wait,0.5],
	[cutscene_change_camera_target,inst],
	[cutscene_change_xscale,inst],
	[cutscene_talk,[
	"Woah! Didn't see you there stranger.",sprVillager1Bust,
	"What brings you to these harsh lands?",sprVillager1Bust,
	"...",sprPlayerBust,
	"...Well, guess you're not the chatty type.",sprVillager1Bust,
	"No doubt you're here to find the flower.",sprVillager1Bust,
	"Cursed folks like you come from all over looking for it.",sprVillager1Bust,
	"And I never see them again! Ha!",sprVillager1Bust,
	"This desert is crawling with beastmen. And believe me, they don't play nice.",sprVillager1Bust,
	"But I'm sure you can do it!",sprVillager1Bust,
	"I've actually prepared this here training course to help folks survive the desert.",sprVillager1Bust,
	"Give it a try and I'll meet you on the other side.",sprVillager1Bust,
	]],
	[cutscene_change_camera_target,objPlayer],
	[cutscene_wait,0.5]
]
