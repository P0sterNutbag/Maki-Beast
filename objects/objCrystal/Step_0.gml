if hp <= 0 {
	repeat(10) {
		instance_create_layer(x,y,"partical",objCrystalShard);
	}
	instance_create_layer(x,y,"partical",objSpawnBlast);
	//instance_destroy(instance_place(x,y,objBarrier));
	instance_create_layer(x,y,"projectile",objHealthkit);
	instance_destroy();
}
