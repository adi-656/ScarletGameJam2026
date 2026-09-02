ysp += g
//if the enemy hits a wall...
if(place_meeting(x+2, y, oSolid)){
	xsp = -xsp
}

 if(place_meeting(x-2, y, oSolid)){
	xsp = -xsp

}
//check if there is no ground

if(place_meeting(x, y+2, oSolid)){
	ysp = 0
	if(place_meeting(x+2, y, oSolid_checker)){
		xsp = -xsp
	}
	else if(place_meeting(x-2, y, oSolid_checker)){
		xsp = -xsp
	}
}
move_and_collide(xsp,ysp,oSolid)

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