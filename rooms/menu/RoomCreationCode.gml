global.sfxVol = 0.5;
global.musicVol = 0.5;

global.level = 0;

audio_group_load(agSFX);
audio_group_load(agMUSIC);

if !audio_is_playing(sndMainTheme) {
	audio_stop_all();
	audio_play_sound(sndMainTheme,1,true);
}

// Create Level List
global.area1Levels = ds_list_create();
ds_list_insert(global.area1Levels,0,rmArena1_1);
ds_list_insert(global.area1Levels,0,rmArena1_2);
ds_list_insert(global.area1Levels,0,rmArena1_3);
ds_list_insert(global.area1Levels,0,rmArena1_4);
ds_list_insert(global.area1Levels,0,rmArena1_5);
ds_list_insert(global.area1Levels,0,rmArena1_6);
ds_list_insert(global.area1Levels,0,rmArena1_7);
ds_list_insert(global.area1Levels,0,rmArena1_8);

global.area2Levels = ds_list_create();
//ds_list_insert(global.area2Levels,0,rmArena2_1);
ds_list_insert(global.area2Levels,0,rmArena2_2);
ds_list_insert(global.area2Levels,0,rmArena2_3);
ds_list_insert(global.area2Levels,0,rmArena2_4);
ds_list_insert(global.area2Levels,0,rmArena2_5);
ds_list_insert(global.area2Levels,0,rmArena2_6);
ds_list_insert(global.area2Levels,0,rmArena2_7);
ds_list_insert(global.area2Levels,0,rmArena2_8);
ds_list_insert(global.area2Levels,0,rmArena2_9);

global.area3Levels = ds_list_create();
//ds_list_insert(global.area2Levels,0,rmArena2_1);
ds_list_insert(global.area3Levels,0,rmArena3_1);
ds_list_insert(global.area3Levels,0,rmArena3_2);
ds_list_insert(global.area3Levels,0,rmArena3_4);
ds_list_insert(global.area3Levels,0,rmArena3_5);
ds_list_insert(global.area3Levels,0,rmArena3_6);


// Make a list of all the projectiles
 var i = 0;
global.class1Projectiles = ds_list_create();
global.class2Projectiles = ds_list_create();
global.class3Projectiles = ds_list_create();
instance_create_depth(1000,1000,0,objPlayer);
 while true {
     if !object_exists(i)  break; //stop loop if reached last object index
     if object_is_ancestor(i,parT2Projectiles) {
		 //ds_list_add(global.projectileList,i);
		 var obj = instance_create_depth(1000,1000,0,i);
		 if obj.class = 1  ds_list_add(global.class1Projectiles,i);
		 else if obj.class = 2  ds_list_add(global.class2Projectiles,i);
		 else if obj.class = 3  ds_list_add(global.class3Projectiles,i);
		 instance_deactivate_object(obj);
	 }
     i++;
}
instance_destroy(objPlayer);

// Add projectile tiers
global.projectileTier1 = ds_list_create();
ds_list_add(global.projectileTier1,objRock);
ds_list_add(global.projectileTier1,objRock);
ds_list_add(global.projectileTier1,objPebble);
global.projectileTier2 = ds_list_create();


// States
enum states {
	walk,
	hold,
	attack,
	chase,
	toss,
	grab,
	launch,
	strafe,
	roll,
	dead,
	cutscene,
	wait,
	melee,
	dig,
	flee,
	knockBack,
	stun,
	bite
} 
