/// @Loop lógico da alavanca
//

depth = (y * -1)+30;
//profundicade


//lógica de interação
if(distance_to_object(obj_goblin) < 10 && !obj_logic.pause){
	if(keyboard_check_pressed(vk_space)){
		audio_play_sound(snd_click,0,false);
	if(on){
		on = false;
	}else{
		on = true;
	}
	}
}

//ângulo da alavanca é alterado
if(on && ang > 30){
	ang -= flick;
}
if(!on && ang < 90+60){
	ang += flick;
}
