//Variaáveis do inimigo inseto

//dano de ataque
dmg = 2;

//cooldown de ataque
cooldown = false;

//variáveis de animação
bob = 0;
legx = 0;
walk = 0;
count = 0;
stop = false;

//colisões
col1 = instance_create_depth(x,y,0,obj_dist);
col2 = instance_create_depth(x,y,0,obj_dist);
col3 = instance_create_depth(x,y,0,obj_dist);
col4 = instance_create_depth(x,y,0,obj_dist);

cols = [col1,col2,col3,col4];
colwidth = [0.3,2,2,0.3];
colheight = [1,0.5,0.5,1];
colx = [-28,0,0,+28];
coly = [5,-5,22,5];


//vida
life = 20;

//variáveis da barra de vida
barWidth = 1;
baralpha = 1;
bary = -5;
barbob = 0;
