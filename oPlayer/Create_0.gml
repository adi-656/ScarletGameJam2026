xsp = 0
ysp = 0
lastFrameDir = "Left"
doubleJump = false
invulnerable_Max = 1 //the time you are invulnerable
invulnerable_Timer = 0
attack_Buffer =.25
attack_Timer = 0
block_timer = 0 //time that the block lasts for
block_max = 1
isBlocking = false
isSiphoning = false
	 halfway_timer =  time_source_create(time_source_game, (block_max / 2.0), time_source_units_seconds, function(){
		oBlock_good.visible = false

	oBlock_half.visible = true
		show_debug_message("half way!")
	}, [], 1)
oBlock_good.visible = false
oBlock_bad.visible = false
oBlock_half.visible = false

//Sounds
walkSound = audio_play_sound(aWalk,0.5,true)
audio_stop_sound(walkSound)
//
siphonSound = audio_play_sound(aSiphon,0.5,true)
audio_stop_sound(siphonSound)

take_damage = function(amount){
	if(invulnerable_Timer > 0){ 
		return
	}
	
	if(isBlocking){
	c_Persistent.gain_Charge((amount * 5))
	invulnerable_Timer = invulnerable_Max
	oInvFrame.visible = true
	return
	}
	
	c_Persistent.take_Damage(amount)
	invulnerable_Timer = invulnerable_Max
	oInvFrame.visible = true
	audio_play_sound(aPdmg,0.5,false)
}

