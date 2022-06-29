/// @description Insert description here
// You can write your code in this editor
image_xscale = (xscale+1+xscale)/3.2;
image_yscale = (yscale+0.75)/3.2;

middle = y+5+(20*yscale)/2;

switch(type){
	case "se":
	text[0] = "Se:";
	text[1] = "Fazer:";
	image_alpha = 0.1;

	break;
	case "senao":
	text[0] = "Senão:";
	text[1] = "Fazer:";
	image_alpha = 0.1;
	break;
	case "senaose":
	text[0] = "Senão se:";
	text[1] = "Fazer:";
	image_alpha = 0.1;
	break;
	
}

if(!created){
box = instance_create_depth(x,y,depth,obj_block);
box.image_alpha = 0;
		box.subtype = type;
		box.text = text;
created = true;
}else{
	if(distance_to_object(instance_nearest(x,y,obj_block)) > 1){
		box = instance_create_depth(x,y,depth-10,obj_block);
		box.image_alpha = 0;
		box.subtype = type;
		box.text = text;
	}
}

