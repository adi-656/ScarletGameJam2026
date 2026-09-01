enemy_health = 2
enemy_contactDamage = 25
xsp = 0
walkSpeed = 0 //immobile ranged enemy 
ysp = 0
g = 0.4
shoot_direction = 1
if(shoot_direction > 0){
	lastFrameDir = "Right"
	sprite_index = sERIdle
}
if(shoot_direction < 0){
	lastFrameDir = "Left"
	sprite_index = sELIdle
}
interval_max = 2
interval_timer = 0

take_damage = function(damage){
	enemy_health -= damage;

	if(enemy_health <= 0){
	die();
	}
	audio_play_sound(aEdmg,0.5,false)
}
shoot = function(){
	attack = instance_create_layer(x-15, y, "Instances", oEnemy_attack);
	attack.motionDir = shoot_direction
	interval_timer = interval_max
	audio_play_sound(aEshoot,0.5,false)
	
}
die = function(){
	dropPickups()
	instance_destroy()
}
amountCharge = irandom_range(0, 4)
amountHealth = irandom_range(0, 4)
dropPickups = function(){
	show_debug_message("Charges: " + string(amountCharge) + ", Health: " + string(amountHealth))
	if(amountCharge == 4)instance_create_layer(x+15,y-3,"Instances",oCharge);
	if(amountCharge >= 3)instance_create_layer(x+4,y,"Instances",oCharge);
	if(amountCharge >= 2)instance_create_layer(x-1,y-3,"Instances",oCharge);
	if(amountCharge >= 1)instance_create_layer(x-12,y,"Instances",oCharge);
	if(amountHealth == 4)instance_create_layer(x+12,y, "Instances", oHealth);
	if(amountHealth >= 3)instance_create_layer(x+7,y-3, "Instances", oHealth);
	if(amountHealth >= 2)instance_create_layer(x-4,y, "Instances", oHealth);
	if(amountHealth >= 1)instance_create_layer(x-9,y-3, "Instances", oHealth);
}




