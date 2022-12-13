/// @Variáveis do robô
//

guncool = false;
bullet = undefined;
//valores de tiro

booleans = [true,true];
//array das condições

maxlife = 80;
life = maxlife;
//energia

barWidth = 1;
//largura da barra de energia

baralpha = 0;
//opacidade da barra de energia

cooldown = false;
//cooldown de ataques

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
fall = false;

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

act = [];
cond = [];

comp = [];
integ = [];
obj = [0,0,0,0,0,0,0,0,0];
comparator = [];
integer = [];
tar = [];
target = [];

ifs = [];
object = [];
ident = [];
array = 0;

comm = undefined;
conditionals = undefined;
activities = undefined;



