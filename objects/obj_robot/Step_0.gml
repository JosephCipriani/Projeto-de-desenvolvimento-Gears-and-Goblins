/// @description Insert description here
// You can write your code in this editor
depth = y * -1;
if(!obj_logic.pause){

if(!sleep && !awake){
	sprite_index = spr_robot_wakeup;
	if(image_index > 23){
		sprite_index = spr_robot_idle;
		awake = true;
		fall = false;
		collide = false;
	}
}
if(fall && awake){
	
	sprite_index = spr_robot_fall;
	if(image_index > 23){
		sprite_index = spr_robot_asleep;
		sleep = true;
		awake = false;
		collide = true;
	}
}

if(!sleep && awake && !fall){
	
	
time+=1;
if(time > timer){
	fall = true;
	time = 0;
}

for(i = 0; i < array_length(commands); i++){
	
	
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
		
		break;
		case "flee":
		
			mp_potential_step(target[i].x,target[i].y,-spd,false);
		
		break;
		case "walk":
		
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
		
		
		
		break;
	}
}
	
for(i = 0; i < array_length(checks); i++){
	switch(checks[i]){
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
		
		break;
		case "horizon":
		
		break;
	}
}
}else{
	
	if(distance_to_object(obj_goblin) < 20 && !obj_logic.pause && keyboard_check_released(vk_space) && sleep && !instance_exists(obj_code_gui)){
		image_index = 0;
		instance_create_depth(x,y,0,obj_code_gui);
		//sleep = false;
	}
}
}