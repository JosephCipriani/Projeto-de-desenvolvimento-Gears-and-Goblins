/// @loop lógico do bloco de código da interface de programação
//
xoff = mouse_x-x;
yoff = mouse_y-y;
//escalas

//calcula a escala dinâmica do bloco
if(distance_to_object(obj_action) < 1){
	if(incode){
	if(xscale < 1.8+(instance_nearest(x,y,obj_action).xscale/3)){
	xscale += 0.15;
		}
	}
}else{
	if(xscale > 1.8){
		xscale -= 0.15;
	}
}

if(!drag){
	depth = -5010;
}

if(subtype = "senao"){
	actoff = 15;
}else{
	actoff = 30+array_length(action)*4+20*array_length(condit);
}


//calcula a posição dos blocos de condição
if(array_length(condit) > 0){
	for(i = 0; i < array_length(condit); i++){
		condit[i].depth = depth-20;
		if(die){
			condit[i].die = true;
			
		}
		if(condit[i] != 0){
		if(condit[i].drag = false){
			if(!drag){
			if(condit[i].y > y+condoff+18*i+margin){
				condit[i].y -= spd;
			}else if(condit[i].y < y+condoff+18*i-margin){
				condit[i].y += spd;
			}else{
				condit[i].y = y+condoff+18*i
			}
			
			if(condit[i].x > x-offset+10+margin){
				condit[i].x -= spd;
			}else if(condit[i].x < x-offset+10-margin){
				condit[i].x += spd;
			}else{
				condit[i].x = x-offset+10
			}
			}else{
				condit[i].y = y+condoff+18*i
				condit[i].x = x-offset+10
			}
		
		}else{
			array_delete(condit,i,1);
			array_delete(condname,i,1);
		}
		}
	}
}

//calcula a posição dos blocos de ação
if(array_length(action) > 0){
	for(i = 0; i < array_length(action); i++){
		action[i].depth = depth-20;
		if(die){
			action[i].die = true;
			
		}
		if(action[i] != 0){
		if(action[i].drag = false){
			if(!drag){
			if(action[i].y > y+actoff+18*i+margin){
				action[i].y -= spd;
			}else if(action[i].y < y+actoff+18*i-margin){
				action[i].y += spd;
			}else{
				action[i].y = y+actoff+18*i
			}
			
			if(action[i].x > x-offset+10+margin){
				action[i].x -= spd;
			}else if(action[i].x < x-offset+10-margin){
				action[i].x += spd;
			}else{
				action[i].x = x-offset+10
			}
			}else{
				action[i].y = y+actoff+18*i
				action[i].x = x-offset+10
			}
		
		}else{
			array_delete(action,i,1);
			
		}
		}
	}
}


if(distance_to_object(obj_element) < 1){
	if(incode){
	if(xscale < (1.8+(instance_nearest(x,y,obj_element).image_xscale/3))/1.2){
	xscale += 0.15;
	}
}
}else{
	if(xscale > 1.8){
		xscale -= 0.15;
	}
}
//define o dinamismo das escalas
if(subtype = "senao"){
if(yscale < 1.5+(16*(array_length(action)/20))){
	yscale += 0.15;
}
if(yscale > 1.5+(16*(array_length(action)/20))){
	yscale -= 0.15;
}
}else{
if(yscale < 1.5+(22*(array_length(action)/20))+(22*(array_length(condit)/20))){
	yscale += 0.15;
}	
if(yscale > 1.5+(22*(array_length(action)/20))+(22*(array_length(condit)/20))){
	yscale -= 0.15;
}
}


image_xscale = (xscale+1+xscale)/3.2;
image_yscale = (yscale+0.75)/3.2;

middle = y+5+(20*yscale)/2;

if(die){
//die é a variável que é definida quando o bloco é largado fora da caixa de código
	fade += 0.05;
	if(fade >= 1){
		instance_destroy(self);
	}
}

if(instance_exists(obj_code)){
if(distance_to_object(obj_code) < 1){
	//checagem se o bloco está dentro da caixa de código
	incode = true;
}else{
	incode = false;
}
}

//subtype define o tipo de bloco lógico
switch(subtype){
	case "se":
	text[0] = "Se:";
	text[1] = "Fazer:";

	break;
	case "senao":
	text[0] = "Senão:";
	text[1] = "Fazer:";

	break;
	
}
