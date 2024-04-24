/// @description Insert description here
// You can write your code in this editor

#region variaveis
//Variaveis comuns a todos os inimigos
vida_max   = 1;
vida_atual  = vida_max;
dano        = 0;
tempo_dano  = room_speed / 2;
timer_dano  = tempo_dano;
dano_dir    = 0;
tempo_pisca = 8;
timer_pisca = 0;
meu_dano    = 1;

max_vel        =  2;

somb_alpha     = .3;

tempo_estado   = room_speed * 3;
tempo          = tempo_estado;

tempo_ataque   = room_speed * .5;
t_ataque       = tempo_ataque

campo_visao    = 100;
tempo_persegue = room_speed * 2;
t_persegue     = tempo_persegue;

estado         = "bobao";
destino_x      = 0;
destino_y      = 0;
alvo           = noone;

sprites        = [];

image_speed    = 8 / room_speed;
#endregion

#region comportamentos / metodos

//knockback = function(_x, _y)
//{
//	var _dir = point_direction(_x, _y, x, y);
//	velh     = lengthdir_x(1, _dir);
//	velv     = lengthdir_y(1, _dir);
//}

controla_sprite =  function ()
{
	var _dir = point_direction(0,0,velh,velv);
	//Se estou indo par aa direita, eu olho para a direita

	//Direita
	var _face = _dir div 90;
	show_debug_message(_face);
	switch (_face)
	{
		case 0:
		{
			sprite_index = sprites[0];
			image_xscale = 1;
			break;	
		}
		case 1:
		{
			sprite_index = sprites[1];
			break;	
		}
		case 2:
		{
			sprite_index = sprites[2];
			image_xscale = -1;
			break;	
		}
		case 3:
		{
			sprite_index = sprites[3];
			break;	
		}
		
	}
	
}
#endregion

//Inherit the parent event
event_inherited();

toma_dano = function(_dano = 1)
{
	//Vá par ao estado de dano
	//Defina um valor de dano que ele deve tomar
	//Tiro 1 de vida
	//Só levo dano se eu AINDA não estou levando dano
	
		estado = "dano";
		dano   = _dano;

}

aplica_dano_player = function()
{
	//Checando se eu estou colidindo com o player
	var _player = instance_place(x, y, obj_player_td);
	
	//Se eu toquei no player, então eu aplico dano no bobao
	if(_player)
	{
		_player.toma_dano(meu_dano);
		_player.dano_dir = point_direction(0, 0, velh, velv);
		//Agora eu volto a descansar
	}
}

// Inherit the parent event
//event_inherited();

