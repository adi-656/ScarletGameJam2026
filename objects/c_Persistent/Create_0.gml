window_set_size(1200,800)
window_center()

player_Charge = 50
player_maxCharge = 100
player_chargeConsumption = 5
player_chargeConsumptionHeavy = 25
player_Health = 100
player_maxHealth = 100

randomise() 

gain_Charge = function(val_Charge){
	// Gain Charge Event
	player_Charge += val_Charge
	if(player_Charge > player_maxCharge)
	{
		player_Charge = player_maxCharge
	}
	//show_debug_message("Charge: " + string(player_Charge)
	//+ "/" + string(player_maxCharge))
}
gain_Health = function(val_Health){
	// Gain Health Event
	player_Health += val_Health
	if(player_Health > player_maxHealth)
	{
		player_Health = player_maxHealth
	}
	//show_debug_message("Health: " + string(player_Health)
	//+ "/" + string(player_maxHealth))
}
take_Damage = function(amount){
	//Take Damage Event
	player_Health -= amount
	show_debug_message("Health: " + string(player_Health)
	+ "/" + string(player_maxHealth))
	if(player_Health <= 0){
		player_Health = player_maxHealth
		c_Persistent.init_Game()
		room_goto(1)
	}
}
consume_Charge = function(){
	if(player_Charge < player_chargeConsumption){
		return false	
	}
	player_Charge -= player_chargeConsumption
	return true
}
consume_Charge_Heavy = function(){
	if(player_Charge < player_chargeConsumptionHeavy){
		return false	
	}
	player_Charge -= player_chargeConsumptionHeavy
	return true
}
init_Game = function(){
	player_Charge = 50
	player_Health = 100
	audio_stop_all()
}