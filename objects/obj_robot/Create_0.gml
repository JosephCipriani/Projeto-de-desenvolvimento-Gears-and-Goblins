/// @Variáveis do robô
//

collide = true;
//colisão

timer = 300;
time = 0;
fall = false;
//temporizador

function run(){
	
}

reset = false;
awake = false;
sleep = true;

i = 0;

spd = 1;
//velocidade

//arrays de construção de comandos
structure = ["if","if","if"];
checks = ["distance","distance",undefined];
object = [obj_goblin,obj_goblin];
obj_name =["goblin","goblin"]
comparator = [">","<",""];
integer = [30,25,""];
commands = ["approach","flee","walk"];
target = [obj_goblin,obj_goblin];
ident = [1,2,3];
pos = [0,0,0];
conditions = [undefined,undefined,false];
relation = ["","above",""];
direct = ["","up","up"];



