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
	//Ficando parado
	velh = 0;
	velv = 0;
	
	var _up    = keyboard_check(vk_up);
	var _down  = keyboard_check(vk_down);
	var _left  = keyboard_check(vk_left);
	var _right = keyboard_check(vk_right);
	
	//Saindo do estado de parado
	if((_up xor _down) or (_left xor _right))
	{
		estado = estado_movendo;
	}
}

estado_movendo = function()
{
	estado_txt = "movendo";
	
	//Definindo a sprite correta
	//Indo para baixo
	if(velv > 0)
	{
		sprite_index = spr_idle_player_down;
	}
	else if(velv < 0)//Indo para cima
	{
		sprite_index = spr_idle_player_up;
	}
	
	//Indo para direita
	if(velh > 0)
	{
		sprite_index = spr_idle_player_right;
		image_xscale = 1;
	}
	//Indo para esquerda
	if(velh < 0)
	{
		sprite_index = spr_idle_player_right;
		image_xscale = -1;
	}
	
	//Saindo do estado de movendo
	if(abs(velv) <= 0.2 && abs(velh) <= 0.2)
	{
		estado = estado_parado;	
	}
}

//Metodos dentro de metodos
estado = estado_parado;//Se nao usa parentese() eu não executo o metodo, ele vai apenas guardar.

















