/// @description Insert description here
// You can write your code in this editor

draw_self();

//Debug do estado
if(debug)
{
	draw_set_valign(1);
	draw_set_halign(1);
	draw_text(x,y - sprite_height * 2, estado_txt);
	draw_set_valign(-1);
	draw_set_halign(-1);
}





















