function scrLevelData() {
	randomize();

	// Place things
	// Enemy Data
	if global.level <= 3 {
		// Map Steps
		_steps = 200;
		// Choose the direction change odds
	    _direction_change_odds = 0.5;
		// Mini-room Data 
		mroom[0,0] = 2;//mmin-room width
		mroom[0,1] = 2;//minni-room height
		mroomChance = 0.65; 
		// Tileset
		wallTile = tileWall2;
		floorIndex = 1;
		// Enemy Data
		enemyMax = 12;
		enemy[0] = objBunny;
		enemy[1] = objBunny;
		enemy[2] = objBear;
		enemy[3] = objPorcupine;
		enemy[4] = objBirdy;
		// Rock Data
		projectileMax = 7;
		projectile[0] = objRock;
		projectile[1] = objRock;
		projectile[2] = objRock;
		projectile[3] = objRock;
		projectile[4] = objRock;
		projectile[5] = objRock;
		projectile[6] = objRock2;
		projectile[7] = objPebble;
		projectile[8] = objPebble;
		projectile[9] = objRockBreak;
	
	} else if global.level >= 4 and global.level < 7 {
		// Map Steps
		_steps = 250;
		// Choose the direction change odds
	    _direction_change_odds = 0.3;
		// Mini-room Data 
		mroom[0,0] = 3;//room width
		mroom[0,1] = 3;//room height
		mroomChance = 0.125;
		// Tileset
		wallTile = tileWall;
		floorIndex = 2;
		// Enemy Data
		enemyMax = 15;
		enemy[0] = objCoyote;
		enemy[1] = objCoyote;
		enemy[2] = objCoyote;
		enemy[3] = objCoyote;
		enemy[4] = objScorpion;
		enemy[5] = objLizard;
		enemy[6] = objLizard;
		enemy[7] = objTurtle;
		// Rock Data
		projectileMax = 12;
		projectile[0] = objRock;
		projectile[1] = objRock;
		projectile[2] = objRock;
		projectile[3] = objRock2;
		projectile[4] = objPebble;
		projectile[5] = objPebble;
		projectile[6] = objRockBreak;
		projectile[7] = objCactus;
		projectile[8] = objCactus2;
		projectile[9] = objBoomerang;
		//projectile[14] = objBomb;
	} else if global.level >= 7 and global.level < 10 {
		// Map Steps
		_steps = 300;
		// Choose the direction change odds
	    _direction_change_odds = 0.5;
		// Mini-room Data 
		mroom[0,0] = 2;//mmin-room width
		mroom[0,1] = 2;//minni-room height
		mroomChance = 0.65; 
		// Tileset
		wallTile = tileWall3;
		floorIndex = 3;
		// Enemy Data
		enemyMax = 17;
		enemy[0] = objDevil;
		enemy[1] = objDevil;
		enemy[2] = objJay;
		enemy[3] = objGoat;
		enemy[4] = objSnatcher;

		// Rock Data
		projectileMax = 15;
		projectile[0] = objRock;
		projectile[1] = objRock;
		projectile[3] = objRock2;
		projectile[4] = objPebble;
		projectile[5] = objRockBreak;
		projectile[6] = objBomb;
		projectile[7] = objScatterBomb;
		projectile[8] = objSaw;
		projectile[9] = objSaw;
		projectile[10] = objMiniSaw;
	}
}
