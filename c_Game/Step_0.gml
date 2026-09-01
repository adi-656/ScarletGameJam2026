if(keyboard_check_pressed(vk_escape)){
	game_end()
}

if(keyboard_check_pressed(ord("R"))){
	c_Persistent.init_Game()
	room_goto(1);
}