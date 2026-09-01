enemyInstance = oEnemy
spawnInterval = 12
spawnTimer = 2

spawnEnemy = function(){
	instance_create_layer(x+sprite_width / 2,y,"Instances",enemyInstance)
}