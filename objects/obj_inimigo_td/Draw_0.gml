/// @description Insert description here
// You can write your code in this editor
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




















