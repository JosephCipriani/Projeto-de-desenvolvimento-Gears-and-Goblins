/// @Definição de variáveis
//

index = 0;
//determina a posição do bloco dentro da caixa de código

drag = false;
//determina se o objeto está sendo arrastado

die = false;
alpha = 0;
fade = 0;
//variáveis usadas para descartar um bloco

incode = false;
//define se o bloco está dentro da caixa de código

xoff = 0;
yoff = 0;
//determinam a relação entre a posição do bloco e mouse

subtype = "se";
//subtipo do bloco

text = ["Se:","Fazer:"];
//texto

middle = 0;
//posição central para a centralização de texto nos blocos

image_blend = c_navy;
//cor

image_alpha = 0.1;
//transparência

depth = -5000;
//profundidade

xscale = 1.8;
yscale = 1.5;
//escala

color = c_white;
//cor do texto

spd = 0.2;
//velocidade do bloco para ajustar-se no bloco

minimum = 0.2;
//valor mínimo de distância do local ideal do bloco

kill = false;
