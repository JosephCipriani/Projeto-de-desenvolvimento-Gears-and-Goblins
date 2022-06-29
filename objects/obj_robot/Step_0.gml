/// @Loop lógico do robô
// 
depth = y * -1;
//cálculo da profundidade dinâmica
if(!obj_logic.pause){

if(!sleep && !awake){
	//robô acorda
	sprite_index = spr_robot_wakeup;
	if(image_index > 23){
		sprite_index = spr_robot_idle;
		awake = true;
		fall = false;
		collide = false;
	}
}
if(fall && awake){
	//robô para de funcionar
	sprite_index = spr_robot_fall;
	if(image_index > 23){
		sprite_index = spr_robot_asleep;
		sleep = true;
		awake = false;
		collide = true;
	}
}

if(!sleep && awake && !fall){
	
	//cálculo de tempo do robô
time+=1;
if(time > timer){
	fall = true;
	time = 0;
}

for(i = 0; i < array_length(commands); i++){
	
		//percorre os comandos para realiza-los
		if(structure[i] = "if"){
			if(conditions[i] = true){
			run();
			}
		}else if(structure[i] = "else"){
			if(conditions[i] = false){
			run();
			}
		}else{
		run();
	}
}

function run(){
	switch(commands[i]){
		case "approach":
		
			mp_potential_step(target[i].x,target[i].y,spd,false);
			//anda na direção de X do alvo e y do alvo para [i] (comando)
		break;
		case "flee":
		
			mp_potential_step(target[i].x,target[i].y,-spd,false);
			//anda na direção contrária de X do alvo e y do alvo para [i]
		break;
		case "walk":
			//anda em determinada direção
			switch(direct[i]){
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
		//interage com objeto
		
		
		break;
	}
}
	
for(i = 0; i < array_length(checks); i++){
	switch(checks[i]){
		//define qual o tipo de condição para realizar a ação (não acabado)
		case "distance":
		
		if(comparator[i] = ">"){
		if(distance_to_object(object[i]) > integer[i]){
			conditions[i] = true;
		}else{
			conditions[i] = false;
		}
		}else{
			if(distance_to_object(object[i]) < integer[i]){
			conditions[i] = true;
		}else{
			conditions[i] = false;
		}
		}
		
		break;
		
		case "obj_is":
		
			switch(relation[i]){
					//relação de posição do objeto comparado ao robô (não acabado)
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
		
		case "vertical":
		//distância vertical
		break;
		case "horizon":
		//distância horizontal
		break;
	}
}
}else{
	
	if(distance_to_object(obj_goblin) < 20 && !obj_logic.pause && keyboard_check_released(vk_space) && sleep && !instance_exists(obj_code_gui)){
		//checagem de interação do player com o robô
		image_index = 0;
		instance_create_depth(x,y,0,obj_code_gui);
		//cria-se uma instância de GUI do código
	}
}
}
