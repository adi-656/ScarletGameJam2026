total_Charge = 25
sprite_index = sChargerF
siphon_Charge = function(){
	if(total_Charge > 0 && c_Persistent.player_Charge < c_Persistent.player_maxCharge){ 
		total_Charge -= 1
		c_Persistent.gain_Charge(1)
		if(total_Charge <= 0){
			sprite_index = sChargerE	
		}
		return true;
	}else{
		return false;	
	}
	
}