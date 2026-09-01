if(spawnTimer > 0){
	spawnTimer -= delta_time / 1000000
}
if(spawnTimer < 0){
	spawnTimer = 0
}
if(spawnTimer == 0){
	spawnEnemy()
	spawnTimer = spawnInterval
}