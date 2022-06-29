/// @Loop lógico do player
//
depth = (y * -1)+15;
//cálculo de profundidade
if(obj_logic.pause = false && !instance_exists(obj_code_gui)){
	//checagem de pausa
if(keyboard_check(ord("D"))){
	//quando pressionado "D" no teclado
	if(!place_meeting(x+spd,y,obj_collidable)){
	//checagem de colisão
	x+=spd;
	}else{
		if(instance_nearest(x-spd,y,obj_collidable).collide = false && !place_meeting(x+spd,y,obj_barrier)){
			//checagem de colisão com colisões móveis
			x+=spd;
		}
	}

}else if(keyboard_check(ord("A"))){
	if(!place_meeting(x-spd,y,obj_collidable)){
	x-=spd;
	}else{
		if(instance_nearest(x-spd,y,obj_collidable).collide = false && !place_meeting(x-spd,y,obj_barrier)){
			x-=spd;
		}
	}
}
if(keyboard_check(ord("S"))){
	if(!place_meeting(x,y+spd,obj_collidable)){
	y+=spd;
	}else{
		if(instance_nearest(x,y+spd,obj_collidable).collide = false && !place_meeting(x,y+spd,obj_barrier)){
			y+=spd;
		}
	}

}else if(keyboard_check(ord("W"))){
	if(!place_meeting(x,y-spd,obj_collidable)){
	y-=spd;
	}else{
		if(instance_nearest(x,y-spd,obj_collidable).collide = false  && !place_meeting(x,y-spd,obj_barrier)){
			y-=spd;
		}
	}
}
}
