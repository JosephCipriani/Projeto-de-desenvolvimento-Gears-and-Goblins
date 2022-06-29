/// @description Insert description here
// You can write your code in this editor
depth = (y * -1)+15;
if(obj_logic.pause = false && !instance_exists(obj_code_gui)){
if(keyboard_check(ord("D"))){
	if(!place_meeting(x+spd,y,obj_collidable)){
	x+=spd;
	}else{
		if(instance_nearest(x-spd,y,obj_collidable).collide = false && !place_meeting(x+spd,y,obj_barrier)){
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
