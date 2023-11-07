/// @description Insert description here
// You can write your code in this editor

//herdando as informações do pai
event_inherited();

max_vel		  = 5;
meu_acel	  = .2;
acel		  = meu_acel;
			
face		  = 0;
sprite		  = sprite_index;
xscale		  = 1;
estado		  = noone;
estado_txt    = "parado";
			
debug		  = false;

sprites       = [ 
			    //Sprites parado
			    [spr_idle_player_right,spr_idle_player_up, spr_idle_player_right, spr_idle_player_down],
			    //Sprites movendo
			    [spr_run_player_right, spr_run_player_up, spr_run_player_right, spr_run_player_down],
				//Sprites Ataque
				[spr_player_attack_right, spr_player_attack_up, spr_player_attack_right, spr_player_attack_down]
			    ];
			   
sprites_index =	0;		   

//Mapeando a esquerda
keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("D"), vk_right);
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("S"), vk_down);

estado_ataque = function()
{
	estado_txt = "Ataque";
}

estado_parado = function()
{
	estado_txt    = "parado";
	sprites_index = 0;
	//Ficando parado
	velh = 0;
	velv = 0;
	
	var _up    = keyboard_check(vk_up);
	var _down  = keyboard_check(vk_down);
	var _left  = keyboard_check(vk_left);
	var _right = keyboard_check(vk_right);
	
	sprite     = sprites[sprites_index][face];
	
	//Saindo do estado de parado
	if((_up xor _down) or (_left xor _right))
	{
		estado = estado_movendo;
	}
}

estado_movendo = function()
{
	estado_txt    = "movendo";
	sprites_index = 1;
	//Definindo a sprite correta
	//Indo para baixo
	sprite     = sprites[sprites_index][face];
	
	//Saindo do estado de movendo
	if(abs(velv) <= 0.2 && abs(velh) <= 0.2)
	{
		estado = estado_parado;	
	}
}

//Metodos dentro de metodos
estado = estado_parado;//Se nao usa parentese() eu não executo o metodo, ele vai apenas guardar.




/******Uma manei de fazer
max_vel      = 5;
meu_acel     = .2;
acel         = meu_acel;

face	     = 0;
sprite       = sprite_index;
xscale       = 1;
estado       = noone;
estado_txt   = "parado";

debug        = false;



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
	
	//Indo para baixo
	switch(face)
	{
		case 0: sprite = spr_idle_player_right; xscale = 1;break;
		case 1: sprite = spr_idle_player_up;break;
		case 2: sprite = spr_idle_player_right; xscale = -1;break;
		case 3: sprite = spr_idle_player_down;break;
	}
	
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
	switch(face)
	{
		case 0: sprite = spr_player_run_right; xscale = 1;break;
		case 1: sprite = spr_player_run_up;break;
		case 2: sprite = spr_player_run_right; xscale = -1;break;
		case 3: sprite = spr_player_run_down;break;
	}	
	//Saindo do estado de movendo
	if(abs(velv) <= 0.2 && abs(velh) <= 0.2)
	{
		estado = estado_parado;	
	}
}

//Metodos dentro de metodos
estado = estado_parado;//Se nao usa parentese() eu não executo o metodo, ele vai apenas guardar.

















