/// @description Insert description here
// You can write your code in this editorang+=0.5;
depth = (y * -1)+30;
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

if(on && ang > 30){
	ang -= flick;
}
if(!on && ang < 90+60){
	ang += flick;
}