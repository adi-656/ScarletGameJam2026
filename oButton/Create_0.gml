enabled = true
pressButton = function(){
	if(!enabled){
		return
	}
	if(c_Persistent.consume_Charge_Heavy()){
		oFlag.count += 1
		oFlag.updateDoor()
	}
}