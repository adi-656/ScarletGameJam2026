ysp += g

if(place_meeting(x, y+2, oSolid)){
	ysp = 0
}
move_and_collide(xsp,ysp,oSolid)

if(interval_timer > 0){
	interval_timer -= delta_time / 1000000
}
if(interval_timer < 0){
	interval_timer = 0
	
}

if(interval_timer == 0){
	shoot()
}

//Update Sprite
if(xsp > 0){
	sprite_index = sERWalk
	lastFrameDir = "Right"
}
if(xsp == 0){
	if(lastFrameDir == "Right"){
		sprite_index = sERIdle
	}
	if(lastFrameDir == "Left"){
		sprite_index = sELIdle
	}
}
if(xsp < 0){
	sprite_index = sELWalk
	lastFrameDir = "Left"	
}


