/// @Loop lógico do robô
//
depth = y * -1;
//cálculo de profundidade
if(!obj_logic.pause){
	
	if(instance_exists(obj_code)){
		
		
		for(i = 0; i < array_length(obj_code.ifs); i++){
			structure[i] = obj_code.ifs[i].subtype
			ident[i] = obj_code.ifs[i].ident
		}
		for(i = 0; i < array_length(obj_code.act); i++){
			commands[i] = obj_code.act[i]
		
		}
		for(i = 0; i < array_length(obj_code.condit); i++){
			checks[i] = obj_code.condit[i]
			comp[i] = obj_code.comp[i];
			integ[i] = obj_code.integ[i];
			obj_name[i] = obj_code.obj[i]
			tar[i] = obj_code.target[i]
		}
	}
	//transferência de dados do código para o robô

if(!sleep && !awake){
	//animação de despertar
	sprite_index = spr_robot_wakeup;
	if(image_index > 23){
		sprite_index = spr_robot_idle;
		awake = true;
		fall = false;
		collide = false;
	}
}
if(fall && awake){
	//animação de adormecer
	sprite_index = spr_robot_fall;
	if(image_index > 23){
		sprite_index = spr_robot_asleep;
		sleep = true;
		awake = false;
		collide = true;
	}
}

if(!sleep && awake && !fall){
//se o robô estiver ativo

for(i = 0; i < array_length(commands); i++){
	
	cond = checks[i];
	
	//percorre as estruturas
if(array_length(conditions) > 0){
	for(j = 0; j < array_length(cond); j++){

		if(structure[i] = "se"){
			if(conditions[j] = true){
			run();
			//chama o método run();
			}
			
		
		}else if(structure[j] = "senao"){
			if(conditions[j] = false){
			run();
			//chama o método run();
			}
		}else{
		run();
	}
}
}
}

function run(){

	//obtém dados dos arrays do código
	act = commands[i];
	cond = checks[i];
	comparator = comp[i];
	integer = integ[i];
	obj = obj_name[i];
	target = tar[i];

	
		//discerne os comandos e os executa
		if(array_length(act) > 0){
		for(j = 0; j < array_length(act); j++){
	switch(act[j]){
		case "approach":
		if(is_array(target)){
			mp_potential_step(target[j].x,target[j].y,spd,false);
		}
		break;
		case "flee":
		if(is_array(target)){
			mp_potential_step(target[j].x,target[j].y,-spd,false);
		}
		break;
		case "walk":
		
			switch(target[j]){
				case "left":
				
				break;
				case "right":
				
				break;
				case "up":
					y-=spd;
				break;
				case "down":
				
				break;
			}
		
		break;
		case "interact":
		
		
		
		break;
	}
		}
	}
}
	
for(i = 0; i < array_length(checks); i++){
	
	//obtém dados dos arrays do código
	act = commands[i];
	cond = checks[i];
	comparator = comp[i];
	integer = integ[i];
	obj = obj_name[i];
	
	if(array_length(cond) > 0){
		//discerne e atribue valores às condições
		for(j = 0; j < array_length(cond); j++){
			switch(cond[j]){
		case "dist":
		
		if(comparator[j] = ">"){
		if(distance_to_object(obj[j]) > integer[j]){
			conditions[j] = true;
		}else{
			conditions[j] = false;
		}
		}else{
			if(distance_to_object(obj[j]) < integer[j]){
			conditions[j] = true;
		}else{
			conditions[j] = false;
		}
		}
		
		break;
		
		case "rel":
		
			switch(relation[i]){
				case "above":
				if(y > object[i].y){
					conditions[i] = true;
				}else{
					conditions[i] = false;
				}
				break;
				case "below":
		
				break;
				case "right":
		
				break;
				case "left":
		
				break;
			}
		
		break;
		
		case "vert":
		
		break;
		case "horiz":
		
		break;
			}
		}
	}
}
	//checkagem para o player desativar o robô
if(distance_to_object(obj_goblin) < 20 && !obj_logic.pause && keyboard_check_released(vk_space) && !sleep && !instance_exists(obj_code_gui)){
		
		fall = true;
	}
}else{
	//checkagem para o player ativar a interface de código
	if(distance_to_object(obj_goblin) < 20 && !obj_logic.pause && keyboard_check_released(vk_space) && sleep && !instance_exists(obj_code_gui)){
		image_index = 0;
		instance_create_depth(x,y,0,obj_code_gui);
	}
}
}
