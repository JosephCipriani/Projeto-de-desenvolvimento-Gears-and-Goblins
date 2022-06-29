/// @loop lógico do bloco de código da interface de programação
//
xoff = mouse_x-x;
yoff = mouse_y-y;

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
