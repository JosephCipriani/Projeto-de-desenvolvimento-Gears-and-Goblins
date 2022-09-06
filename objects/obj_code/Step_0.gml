/// @Loop principal da caixa de código
//

//definição das dimensões
image_xscale = (xscale+1+xscale)/3.2;
image_yscale = (yscale+0.75)/3.2;
alpha = 1;


//calcula a posição dos blocos de código
if(array_length(ifs) > 0){
	for(i = 0; i < array_length(ifs); i++){
		
		if(i <= 0){
			ifpos = 0;
			dropper = 0;
			pusher = 0;
		}else{
			ifpos = ifs[i-1].y;
			dropper = fragment[i-1]-0.7*i;
		}
		
		scales[i] = ifs[i].image_yscale;
		
		if(ifs[i] != 0){
		if(ifs[i].drag = false){
			if(ifs[i].y > y+15+45*i+margin+dropper*64-pusher){
				ifs[i].y -= spd;
			}else if(ifs[i].y < y+15+45*i-margin+dropper*64-pusher){
				ifs[i].y += spd;
			}else{
				ifs[i].y = y+15+45*i+dropper*64-pusher
			}
			
			if(ifs[i].x > x-offset+10+margin){
				ifs[i].x -= spd;
			}else if(ifs[i].x < x-offset+10-margin){
				ifs[i].x += spd;
			}else{
				ifs[i].x = x-offset+10
			}
		
		}else{
			//deleta os dados do bloco caso este seja retirado
			array_delete(ifs,i,1);
			array_delete(scales,i,1);
		}
		}
	}
}

//calcula a escala total dos blocos internos
totalscale = 0;
for(i = 0; i < array_length(scales); i++){
	totalscale+=scales[i];
	fragment[i] = totalscale;
}

//obtem dados dos blocos
for(i = 0; i < array_length(ifs); i++){
	act[i] = ifs[i].actname;
	condit[i] = ifs[i].condname;
	comp[i] = ifs[i].condcomp;
	integ[i] = ifs[i].condint;
	obj[i] = ifs[i].condobj;
	target[i] = ifs[i].actar;
}
