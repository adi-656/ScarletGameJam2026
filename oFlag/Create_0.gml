count = 0
doorUnlocked = false
chargeObject = oDoorCharge
updateDoor = function(){
	switch(count){
		case 0:
			chargeObject.sprite_index = sDoor_1
			break;
		case 1:
			chargeObject.sprite_index = sDoor_2
			break;
		case 2:
			chargeObject.sprite_index = sDoor_3
			break;
		case 3:
			chargeObject.sprite_index = sDoor_4
			doorUnlocked = true
			oButton.enabled = false
			audio_play_sound(aBeep,0.5,false);
			break;
	}
		
}
checkDoor = function(){
	return doorUnlocked
}