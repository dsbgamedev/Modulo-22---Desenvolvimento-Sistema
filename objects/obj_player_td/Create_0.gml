/// @description Insert description here
// You can write your code in this editor

//herdando as informações do pai
event_inherited();

max_vel    = 5;
meu_acel   = .2;
acel       = meu_acel;

estado     = noone;
estado_txt = "parado";
debug      = false;

//Mapeando a esquerda
keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("D"), vk_right);
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("S"), vk_down);

estado_parado = function()
{
	estado_txt = "parado";	
}

estado_movendo = function()
{
	estado_txt = "movendo";	
}

//Metodos dentro de metodos
estado = estado_parado;//Se nao usa parentese() eu não executo o metodo, ele vai apenas guardar.

















