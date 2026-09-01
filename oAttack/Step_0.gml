x += xsp * (3 * motionDir) * delta_time / 1000000

if (lifetime > 0){
	lifetime -= delta_time / 1000000	
}
if (lifetime < 0){
	lifetime = 0
	instance_destroy()
}