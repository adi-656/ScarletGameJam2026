jumpForce = 7
g = 0.4
walkSpeed = 2
runSpeed = 4
ysp += g
//Invulnerability timer: for when damage was taken, cooldown before more damage
if(invulnerable_Timer > 0)
{
	invulnerable_Timer -= (delta_time / 1000000);
	if(invulnerable_Timer < 0.5)
	{
		oInvFrame.visible = false
	}
}
if(invulnerable_Timer < 0)
{
	invulnerable_Timer = 0
}

// Attack functionality
if (attack_Timer == 0)
{
	if(mouse_check_button(mb_left)){
		if(c_Persistent.consume_Charge()){
			if(lastFrameDir == "Left"){
				sprite_index = sP_Idle_L
				attack = instance_create_layer(x-10, y-2, "Instances", oAttack);
				attack.motionDir = -1
			}
			if(lastFrameDir == "Right"){
				sprite_index = sP_Idle_R
				attack = instance_create_layer(x+10, y-2, "Instances", oAttack);
				attack.motionDir = 1
			}
			attack_Timer = attack_Buffer
			//attack sounds
			audio_play_sound(aShoot,0.5,false)
		}
	}
}
if(attack_Timer < 0){
	attack_Timer = 0
}
if(attack_Timer > 0){
	attack_Timer -= delta_time / 1000000
	xsp = 0
}
// Movement controls. no attacking while moving, no shooting while walking animation
else if keyboard_check(ord("D"))
{
	lastFrameDir = "Right"
	sprite_index = sP_Walk_R
	if keyboard_check(vk_shift){
		xsp = +runSpeed
	}
	else{
		xsp = +walkSpeed
	}
}
else if keyboard_check(ord("A"))
{
	lastFrameDir = "Left"
	sprite_index = sP_Walk_L
	if keyboard_check(vk_shift){
		xsp = -runSpeed
	}
	else{
		xsp = -walkSpeed
	}
}
else
{
	if (lastFrameDir == "Left")
	{
		sprite_index = sP_Idle_L
	}
	else if(lastFrameDir == "Right")
	{
		sprite_index = sP_Idle_R
	}
	xsp = 0
}
//Blocking - implement CD
 if(mouse_check_button_pressed(mb_right)){
	 isBlocking = true
	 show_debug_message("blocking")
	 oBlock_good.visible = true
	
	
	 block_timer = time_source_create(time_source_game, block_max, time_source_units_seconds, function(){
		oBlock_good.visible = false
		oBlock_half.visible = false
		oBlock_bad.visible = true
		mouse_clear(mb_right) 
		show_debug_message("break!")
		isBlocking = false
		}, 
		[], -1)
	 
	 halfway_timer =  time_source_create(time_source_game, (block_max / 2.0), time_source_units_seconds, function(){
		oBlock_good.visible = false

	oBlock_half.visible = true
		show_debug_message("half way!")
	}, [], 1)
	
     time_source_start(block_timer)
	 time_source_start(halfway_timer)
	 
	 if(time_source_get_reps_completed(halfway_timer) == 1){
	  time_source_destroy(halfway_timer)
	  }
	}
 


if(mouse_check_button_released(mb_right)){ //refreshes the timer that you can "hold" block
		 isBlocking = false
		 oBlock_good.visible = false
		 oBlock_bad.visible = false
		 oBlock_half.visible = false
		 time_source_stop(block_timer)
		 time_source_destroy(block_timer)
		 
		 if(time_source_exists(halfway_timer)){
		  time_source_destroy(halfway_timer)
		  }
}




// Jumping
if place_meeting(x,y+2,oSolid)
{	
	ysp = 0
	doubleJump = false
	if keyboard_check_pressed(vk_space)
	{
		audio_play_sound(aJump,0.5,false)
		ysp = -jumpForce
		doubleJump = true
	}
}
else if(doubleJump)
{
	if keyboard_check_pressed(vk_space)
	{
		audio_play_sound(aJump,0.5,false)
		ysp = -jumpForce
		doubleJump = false
	}
}
//Move the player
move_and_collide(xsp,ysp,oSolid)

// If the player is on a door, 
if place_meeting(x,y, oFlag)
{
	if(oFlag.checkDoor()) room_goto_next()	
}
//if player is on a 'next' tile (move to next room)
if place_meeting(x,y,oNext){
	room_goto_next()	
}
//if player is on a charger
if place_meeting(x,y+2,oCharger)
{
	charger = instance_place(x, y+2, oCharger);
	charger.siphon_Charge()
	if(!audio_is_playing(siphonSound)){
		siphonSound = audio_play_sound(aSiphon, 0.5, true);
	}
	if(charger.total_Charge <= 0 || c_Persistent.player_Charge >= c_Persistent.player_maxCharge){
		if(audio_is_playing(siphonSound)){
			audio_stop_sound(siphonSound);
		}
	}
		
}else{
	if(audio_is_playing(siphonSound)){
		audio_stop_sound(siphonSound);
	}
}
//Move Sounds
if(xsp > 0 || xsp < 0){
	if(!audio_is_playing(walkSound)){
		walkSound = audio_play_sound(aWalk, 0.5, true)
	}
}
if(xsp == 0 || ysp != 0){
	if(audio_is_playing(walkSound)){
		audio_stop_sound(walkSound)
	}
}