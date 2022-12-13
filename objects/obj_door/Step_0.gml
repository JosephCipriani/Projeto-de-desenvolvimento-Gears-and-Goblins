//Loop lógico da porta

//cria um objeto de transferência se aberta de utilizada
if(distance_to_object(obj_goblin) < 10 && open && !instance_exists(obj_transfer)){
	instance_create_depth(x,y,0,obj_transfer)
}
                                      
//aberta                                      
if(open){
	if(passage > -0.5){
	passage -= 0.02
	}

//fechada
}else{
	if(passage < 0.5){
	passage += 0.02
	}
}

//abre se não houverem alavancas a serem ativadas
if(!instance_exists(obj_lever)){
	open = true
}
