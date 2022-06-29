/// @Arrastando o bloco
//
if(mouse_x > x+90){
	//xscale = (mouse_x-x)/50;
}

if(mouse_y > y+20){
	//yscale = (mouse_y-y)/20;
}
if(!obj_logic.pause){
x = mouse_x-xoff;
y = mouse_y-yoff;
}else{
	die = true;
}
drag = true;

if(incode && time < 1){
	//array_insert(obj_code.ifs,int64((y-obj_code.y)/20),self);
	time++
	//zeroed = true;
}
index = int64((y-obj_code.y)/49);
