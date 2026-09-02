enemy_health = 2
enemy_contactDamage = 25
walkSpeed = -2
xsp = walkSpeed //separate variables to lemme change walkSpeed later
ysp = 0
g = 0.4
lastFrameDir = "Left"
sprite_index = sELIdle

take_damage = function(damage){
	enemy_health -= damage;

	if(enemy_health <= 0){
	die();
	}
	audio_play_sound(aEdmg,0.5,false)
}
die = function(){
	dropPickups()
	instance_destroy()
}
amountCharge = irandom_range(0, 4)
amountHealth = irandom_range(0, 4)
dropPickups = function(){
	show_debug_message("Charges: " + string(amountCharge) + ", Health: " + string(amountHealth))
	if(amountCharge == 4)instance_create_layer(x+15,y-5,"Instances",oCharge);
	if(amountCharge >= 3)instance_create_layer(x+4,y-2,"Instances",oCharge);
	if(amountCharge >= 2)instance_create_layer(x-1,y-5,"Instances",oCharge);
	if(amountCharge >= 1)instance_create_layer(x-12,y-2,"Instances",oCharge);
	if(amountHealth == 4)instance_create_layer(x+12,y-2, "Instances", oHealth);
	if(amountHealth >= 3)instance_create_layer(x+7,y-5, "Instances", oHealth);
	if(amountHealth >= 2)instance_create_layer(x-4,y-2, "Instances", oHealth);
	if(amountHealth >= 1)instance_create_layer(x-9,y-5, "Instances", oHealth);
}
