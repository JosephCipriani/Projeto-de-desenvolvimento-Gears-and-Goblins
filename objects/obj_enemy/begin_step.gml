//Características gerais dos objetos tipo inimigo

//reversão da cor após um ataque
if(image_blend = c_red){
	alarm[0] = 1;
  //troca a cor em um step
}

//danificar robô
if(!instance_exists(obj_code)){
if(distance_to_object(obj_robot) < 20){
	if(!cooldown && obj_robot.awake){
		if(obj_robot.life > 0){
		obj_robot.life -= dmg;
		}
		cooldown = true;
		alarm[1] = 40
    //desativa cooldown em 40 steps
	}
}

//danificar player
if(distance_to_object(obj_goblin) < 20){
	if(!cooldown && !obj_logic.pause){
		if(obj_goblin.life > 0){
		obj_goblin.life -= dmg;
		}
		cooldown = true;
		alarm[1] = 40
    //desativa cooldown em 40 steps
	}
}
}
