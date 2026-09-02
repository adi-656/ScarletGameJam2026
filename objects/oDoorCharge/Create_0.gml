count = 0
doorUnlocked = false
updateDoor = function(){
	switch(count){
		case 0:
			sprite_index = sDoor_0
			break;
		case 1:
			sprite_index = sDoor_1
			break;
		case 2:
			sprite_index = sDoor_2
			break;
		case 3:
			sprite_index = sDoor_3
			doorUnlocked = true
			oButton.enabled = false
			break;
	}
		
}
checkDoor = function(){
	return doorUnlocked
}