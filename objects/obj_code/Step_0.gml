/// @Loop principal da caixa de código
//

//definição das dimensões
image_xscale = (xscale+1+xscale)/3.2;
image_yscale = (yscale+0.75)/3.2;
alpha = 1;


if(array_length(ifs) > 0){
	for(i = 0; i < array_length(ifs); i++){
		//percorre-se o array de condicionais para calcular sua posição
		if(ifs[i] != 0){
		if(ifs[i].drag = false){
			//se o bloco não estiver sendo arrastado
			if(ifs[i].y > y+15+45*i+margin){
				ifs[i].y -= spd;
			}else if(ifs[i].y < y+15+45*i-margin){
				ifs[i].y += spd;
			}else{
				ifs[i].y = y+15+45*i
			}
			
			if(ifs[i].x > x+10+margin){
				ifs[i].x -= spd;
			}else if(ifs[i].x < x+10-margin){
				ifs[i].x += spd;
			}else{
				ifs[i].x = x+10
			}
		
		}else{
			array_delete(ifs,i,1);
			//o bloco é removido da lista de condicionais uma vez que é arrastado
		}
		}
	}
}




