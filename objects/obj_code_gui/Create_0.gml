/// @Variáveis da GUI de código
// 

x = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2;
y = (camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2);
//posição inicial

if(!audio_is_playing(snd_music)){
	audio_play_sound(snd_music,0,true);
}
//música

stop = false;

height = 0;
ach = 1;

sep = 38;

bob = 0;


maxl = 9;
total = 0;

mov = 0;

//partes da interface
code = instance_create_depth(x,y,0,obj_code);
code.xoff = -190;
code.yoff = 10;
code.alpha = 0;

se = instance_create_depth(x,y,0,obj_block_gen);
se.xoff = -20;
se.yoff = -77;
se.type = "se";

senaose = instance_create_depth(x,y,0,obj_block_gen);
senaose.xoff = -20;
senaose.yoff = -27;
senaose.type = "senaose";

senao = instance_create_depth(x,y,0,obj_block_gen);
senao.xoff = -20;
senao.yoff = 23;
senao.type = "senao";

ativ = instance_create_depth(x,y,0,obj_button);
ativ.xoff = 3;
ativ.yoff = 90;
ativ.type = "activate";

dist = instance_create_depth(x,y,0,obj_conditional_gen);
dist.xoff = 105;
dist.yoff = -87;
dist.type = "dist";

rel = instance_create_depth(x,y,0,obj_conditional_gen);
rel.xoff = 85;
rel.yoff = -65;
rel.type = "rel";

horiz = instance_create_depth(x,y,0,obj_conditional_gen);
horiz.xoff = 122;
horiz.yoff = -43;
horiz.type = "horiz";

vert = instance_create_depth(x,y,0,obj_conditional_gen);
vert.xoff = 115;
vert.yoff = -21;
vert.type = "vert";

move = instance_create_depth(x,y,0,obj_action_gen);
move.xoff = 95;
move.yoff = 3;
move.type = "move";

appr = instance_create_depth(x,y,0,obj_action_gen);
appr.xoff = 105;
appr.yoff = 25;
appr.type = "appr";

flee = instance_create_depth(x,y,0,obj_action_gen);
flee.xoff = 105;
flee.yoff = 47;
flee.type = "flee";

inter = instance_create_depth(x,y,0,obj_action_gen);
inter.xoff = 105;
inter.yoff = 69;
inter.type = "inter";

att = instance_create_depth(x,y,0,obj_action_gen);
att.xoff = 95;
att.yoff = 90;
att.type = "att";

shoot = instance_create_depth(x,y,0,obj_action_gen);
shoot.xoff = 95;
shoot.yoff = 112;
shoot.type = "shoot";

//lista das partes
pieces = [code,se,senaose,senao,ativ,dist,rel,horiz,vert,move,appr,flee,inter,att,shoot];
