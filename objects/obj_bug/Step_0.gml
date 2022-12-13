//Loop lógico do inimigo inseto
//

//aumenta os valores de animação dinâmica
bob+=0.08;
walk+=0.25;

//segue o player caso perto do player ou do robô
if(!instance_exists(obj_code)){
if(distance_to_object(obj_goblin) < 200 || distance_to_object(obj_robot) < 100){
mp_potential_step(obj_goblin.x,obj_goblin.y,1.2,false);

}

//define profundidade
depth = (y * -1)+12;

//define as colisões
for(i = 0; i < array_length(cols); i++){
	cols[i].image_xscale = colwidth[i];
	cols[i].image_yscale = colheight[i];
	
	cols[i].x = x+colx[i];
	cols[i].y = y+coly[i];
}
}
