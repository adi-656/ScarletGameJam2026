if (keyboard_check_pressed(vk_space)) {
	c_Persistent.init_Game()
	room_goto(1);
}   
if(keyboard_check_pressed(vk_escape)){
	game_end()
}