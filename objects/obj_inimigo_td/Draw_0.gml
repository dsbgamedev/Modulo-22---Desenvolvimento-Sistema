/// @description Insert description here
// You can write your code in this editor

//Desenhando a sombra
//No 0 eu quero a escala em .5, no 1, 2 e 3 ela fica em .7

somb_scale = .5;
if(image_index > 1)
{
	somb_scale = .7;
}

//draw_sprite_ext(spr_sombra, 0, x, y, _scala, _scala, 0, c_white, .2);
//desenha_sombra(spr_sombra, somb_scale, , .2);//Script Funcoes, desenha_sombra
draw_self();


//Debug do meu estado
if(debug)
{
	draw_set_halign(1);
	draw_set_valign(1);
	draw_text(x, y - sprite_height, estado); 
	draw_set_halign(-1);
	draw_set_valign(-1);
	
	//Sabendo onde é o destino dele (Debug)
	draw_circle(destino_x, destino_y, 16,false);
	
	//Desenhando meu campo de visão (Debug)
	draw_circle(x,y,campo_visao, true);
}




















