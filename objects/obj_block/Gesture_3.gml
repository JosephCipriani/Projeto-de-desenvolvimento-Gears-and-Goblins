/// @Arrastando o bloco
//

if(!obj_logic.pause){
x = mouse_x-xoff;
y = mouse_y-yoff;
}else{
	die = true;
}
drag = true;

index = int64((y-obj_code.y)/49);
//define a posição do bloco
