/// @description Insert description here
// You can write your code in this editor

//Desenhando a minha sombra
draw_sprite_ext(spr_sombra, 0, x, y, .6, .6, 0, c_white , .2);
//Desenhar a minha sprite
draw_sprite_ext(sprite, image_ind,x,y, xscale,image_yscale,image_angle, image_blend, image_alpha);

//Debug do estado
if(debug)
{
	draw_set_valign(1);
	draw_set_halign(1);
	draw_text(x,y - sprite_height * 2, estado_txt);
	draw_set_valign(-1);
	draw_set_halign(-1);
}





















