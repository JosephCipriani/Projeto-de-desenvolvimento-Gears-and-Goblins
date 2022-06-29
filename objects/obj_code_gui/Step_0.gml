/// @Loop lógico da GUI de código
// 
mov += 1;

x = (camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2)-20;
y = (camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2);


for(i = 0; i < array_length(pieces); i ++){
	//percorre o array de partes e calcula suas posições
	pieces[i].x = (x-(pieces[i].xscale+0.5)*10)+pieces[i].xoff;
	pieces[i].y = (y-(pieces[i].yscale+0.5)*10)+pieces[i].yoff;
	if(i >= array_length(pieces)){
		i = 0;
	}
}




