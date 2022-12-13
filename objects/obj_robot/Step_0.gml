/// @Loop lógico do robô
//
//cálculo de profundidade
depth = y * -1;

//Se o jogo não estiver pausado
if(!obj_logic.pause){
	
	//esgotamento de energia do robô conforme tempo
	if(life > 0){
		life-=0.005;
	}
	
	//transferência dos dados
	if(instance_exists(obj_code)){
		for(i = 0; i < array_length(obj_code.ifs); i++){
			//transferência de dados de estruturas lógicas do código para o robô
			ifs[i] = obj_code.ifs[i]
			structure[i] = obj_code.ifs[i].subtype 
			ident[i] = obj_code.ifs[i].ident
		}
	
		for(i = 0; i < array_length(obj_code.act); i++){
			//transferência de dados de ação do código para o robô
			activities =  obj_code.act
			commands[i] = obj_code.act[i]
		
		
		}
	
		for(i = 0; i < array_length(obj_code.condit); i++){
			//transferência de dados de condiçionais do código para o robô
			conditionals = obj_code.condit;
			obj[i] = obj_code.obj[i];
			checks[i] = obj_code.condit[i]
			comp[i] = obj_code.comp[i];
			integ[i] = obj_code.integ[i];
			tar[i] = obj_code.target[i]
		}
	}

	//restaura a energia do robô se ele estiver inativo
	if(sleep){
		life = maxlife;
	}

	//código de dativação do robô
	if(!sleep && !awake){
		sprite_index = spr_robot_wakeup;
		if(baralpha < 1){
			baralpha+=0.05;
		}
		if(image_index > 23){
			sprite_index = spr_robot_idle;
			awake = true;
			fall = false;
			collide = false;
		}
	}

	//robô tem energia esgotada
	if(life <= 0){
		fall = true;
		if(baralpha > 0){
			baralpha-=0.05;
		}
	}

	//desativação do robô
	if(fall && awake){
		if(life > 0){
			life-=0.005;
		}
		sprite_index = spr_robot_fall;
		if(image_index > 23){
			sprite_index = spr_robot_asleep;
			sleep = true;
			awake = false;
			collide = true;
		}
	}

	//robô ativo
	if(!sleep && awake && !fall){
	
			//renomeação de variáveis
			cond = checks;
			comparator = comp;
			integer = integ;
			object = obj;
			comm = commands;
			target = tar;
	
		//para cada condição
		for(i = 0; i < array_length(conditionals); i++){
		
		//associa cond as condições de uma condição
		cond = conditionals[i];
		
		if(array_length(comp) > i){
			//associa comparator ao comparador de uma condição
			comparator = comp[i];
		}
		if(array_length(integ) > i){
			//associa integer aos valores integegros de uma condição
			integer = integ[i];
		}
		if(array_length(obj) > i){
			//associa object ao objeto de uma condição
			object = obj[i];
		}

		//roda o código da condição específica com base se ela é verdadeira ou não
		if(structure[i] = "se"){
				if(booleans[i] = true){
					run(i);
				}else{
				}
			
		}else if(structure[i] = "senao"){
				if(booleans[i] = false){
					run(i);
				}
				}else{
			}
	}

	function run(i){

		//associa as variáveis a valores específicos ao bloco de código
		act = commands[i];
		cond = checks[i];
		comparator = comp[i];
		integer = integ[i];
		target = tar[i];
	
	
		//
		for(j = 0; j < array_length(cond); j++){
		
			for(k = 0; k < array_length(activities); k++){
		
			comm = activities[i];
		
			if(array_length(tar) > i){
			target = tar[i];
			}
		
			if(array_length(comm) > k){
				switch(comm[k]){
					
					//código de aproximação
					case "approach":
						if(is_array(target)){
							if(instance_exists(target[k])){
							mp_potential_step(instance_nearest(x,y,target[k]).x,instance_nearest(x,y,target[k]).y-20,spd,false);
						}
					}
					break;
			
					//código de afastamento
					case "flee":
					if(is_array(target)){
						if(instance_exists(target[k])){
						mp_potential_step(instance_nearest(x,y,target[k]).x,instance_nearest(x,y,target[k]).y-20,-spd,false);
					}
					}
					break;
			
					//código de movimento
					case "move":
	
						switch(target[j]){
							case "left":
							if(!place_meeting(x-spd,y,obj_collidable)){
								x-=spd;
							}
							break;
							case "right":
							if(!place_meeting(x+spd,y,obj_collidable)){
								x+=spd;
							}
							break;
							case "up":
							if(!place_meeting(x,y-spd,obj_collidable)){
								y-=spd;
							}
							break;
							case "down":
							if(!place_meeting(x,y+spd,obj_collidable)){
								y+=spd;
							}
							break;
						}
		
					break;
					
					//código de tiro
					case "shoot":
		
					//cooldown dos tiros
					if(guncool){
						time++;
						if(time > 60){
							time = 0;
							guncool = false;
						}
					}
	
						switch(target[j]){
							case "left":
							if(!guncool){
							bullet = instance_create_depth(x-10,y,0,obj_bullet)
							bullet.motx = -1;
							bullet.moty = 0;
							guncool = true;
							}
							break;
							case "right":
							if(!guncool){
							bullet = instance_create_depth(x+10,y,0,obj_bullet)
							bullet.motx = 1;
							bullet.moty = 0;
							guncool = true;
							}
							break;
							case "up":
							if(!guncool){
							bullet = instance_create_depth(x,y-10,0,obj_bullet)
							bullet.motx = 0;
							bullet.moty = -1;
							guncool = true;
							}
							break;
							case "down":
							if(!guncool){
							bullet = instance_create_depth(x,y+10,0,obj_bullet)
							bullet.motx = 0;
							bullet.moty = 1;
							guncool = true;
							}
							break;
						}
		
					break;
					
					//código de interação		
					case "inter":
					if(is_array(target)){
						if(instance_exists(target[k])){
					if(distance_to_object(instance_nearest(x,y,target[k])) < 10){
						if(instance_nearest(x,y,target[k]).on = false){
							instance_nearest(x,y,target[k]).on = true;
						}
					}
						}
					}
		
					//código de ataque
					break;
					case "att":
					if(is_array(target)){
						if(instance_exists(target[k])){
					if(distance_to_object(instance_nearest(x,y,target[k])) < 40){
						if(cooldown = false){
							instance_nearest(x,y,target[k]).life -= 5;
							instance_nearest(x,y,target[k]).image_blend = c_red
							cooldown = true;
							alarm[0] = 30;
						}
					}
						}
					}
		
		
					break;
				}
				}
				}
				}
			}

	//define se as condições são verdadeiras ou falsas para cada condição
	for(i = 0; i < array_length(conditionals); i++){
		for(j = 0; j < array_length(cond); j++){
			
		//associa cond as condições de uma condição
		cond = conditionals[i];
		
		if(array_length(comp) > i){
			//associa comparator ao comparador de uma condição
			comparator = comp[i];
		}
		if(array_length(integ) > i){
			//associa integer aos valores integegros de uma condição
			integer = integ[i];
		}
		if(array_length(obj) > i){
			//associa object ao objeto de uma condição
			object = obj[i];
		}
	
		if(array_length(cond) > j){
				switch(cond[j]){
					
					//define condições de distância
					case "dist":
		
						//maior
						if(comparator[j] = ">"){
							if(instance_exists(object[j])){
								if(point_distance(object[j].x,object[j].y,x,y+30) > integer[j]){
									booleans[i] = true;
								}else{
									booleans[i] = false;
								}
							}else{
								booleans[i] = false;
								fall = true;
							}	
						
						//menor
						}else{
							if(instance_exists(object[j])){
								if(point_distance(object[j].x,object[j].y,x,y+30) < integer[j]){
								booleans[i] = true;
								}else{
									booleans[i] = false;
								}
							}else{
							booleans[i] = false;
							fall = true;
			
							}
						}
		
					break;
		
					//define condições de relação espacial
					case "rel":
		
						switch(comparator[j]){
							case "up":
								if(y+10 > object[j].y){
									booleans[i] = true;
								}else{
									booleans[i] = false;
								}
							break;
							case "down":
								if(y+10 < object[j].y){
									booleans[i] = true;
								}else{
									booleans[i] = false;
								}
							break;
							case "right":
								if(x < object[j].x){
									booleans[i] = true;
								}else{
									booleans[i] = false;
								}
							break;
							case "left":
								if(x > object[j].x){
									booleans[i] = true;
								}else{
									booleans[i] = false;
								}		
							break;
						}
		
					break;
		
					//define condições de distância vertical
					case "vert":
		
					if(instance_exists(object[j])){
						if(comparator[j] = "<"){
							if(point_distance(x,object[j].y,x,y+30) < integer[j]){
								booleans[j] = true;
							}else{
								booleans[j] = false;
							}
						}else{
							if(point_distance(x,object[j].y,x,y+30) > integer[j]){
								booleans[j] = true;
							}else{
								booleans[j] = false;
							}
						}
					}
					break;
					
					//define condições de distância horizontal
					case "horiz":
						if(instance_exists(object[j])){
							if(comparator[j] = "<"){
								if(point_distance(object[j].x,y,x,y+30) < integer[j]){
									booleans[j] = true;
								}else{
									booleans[j] = false;
								}
							}else{
								if(point_distance(object[j].x,y,x,y+30) > integer[j]){
									booleans[j] = true;
								}else{
									booleans[j] = false;
								}
							}
						}
					break;
				}
		}
	}
}

	//desativação manual do robô
	if(distance_to_object(obj_goblin) < 20 && !obj_logic.pause && keyboard_check_released(vk_space) && !sleep && !instance_exists(obj_code_gui)){
			fall = true;
		}
	}else{
	
	if(distance_to_object(obj_goblin) < 20 && !obj_logic.pause && keyboard_check_released(vk_space) && sleep && !instance_exists(obj_code_gui)){
		image_index = 0;
		instance_create_depth(x,y,0,obj_code_gui);
	}
}
}

//desaparecimento da bara de energia
if(fall || sleep){
	if(baralpha > 0){
		baralpha-=0.005;
	}
}
