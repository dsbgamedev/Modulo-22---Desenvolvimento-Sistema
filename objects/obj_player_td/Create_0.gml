/// @description Insert description here
// You can write your code in this editor

//herdando as informações do pai
event_inherited();

//Debug para testar geral
global.debug = false;

max_vel		  =  3;
meu_acel	  = .2;
acel		  = meu_acel;
roll_vel      = 5;
somb_scale    = .6;
somb_alpha    = .2;
seq_especial  = noone;

			
face		  = 0;
sprite		  = sprite_index;
xscale		  = 1;
estado		  = noone;
estado_txt    = "parado";
			
debug		  = false;
npc_dialogo   = noone;

attack        = false;
shield        = false;
roll          = false;

//Imagem atual da animação
image_ind     = 0;
//Velocidade da animação
image_spd     = 6 / room_speed;
//Quantidade de imagens na minha sprite
image_numb    = 1;

troquei = false;


sprites       = [ 
			    //Sprites parado
			    [spr_idle_player_right,spr_idle_player_up, spr_idle_player_right, spr_idle_player_down],
			    //Sprites movendo
			    [spr_run_player_right, spr_run_player_up, spr_run_player_right, spr_run_player_down],
				//Sprites Ataque
				[spr_player_attack_right, spr_player_attack_up, spr_player_attack_right, spr_player_attack_down],
				//Sprites Defesa
				[spr_player_shield_right, spr_player_shield_up, spr_player_shield_right, spr_player_shield_down],
				//Rolando
				[spr_player_roll_right, spr_player_roll_up, spr_player_roll_right, spr_player_roll_down]
			    ];
			   
sprites_index =	0;		   

//Mapeando a esquerda
keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("D"), vk_right);
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("S"), vk_down);
keyboard_set_map(ord("J"), ord("C"));
keyboard_set_map(ord("L"), ord("Z"));
keyboard_set_map(ord("K"), ord("X"));
keyboard_set_map(vk_enter, vk_space);


ajusta_sprite = function(_indice_array)
{
	
	//Checando se a sprite que eu estou usando é a que eu deveria estar usando
	//Sprite de parado
	//Sprite de ataque
	//Isso quer dizer que eu acabei de chegar nesse estado (se a minha sprite esta errada)
	if(sprite != sprites[_indice_array][face])
	{
		//acabei de entrar no estado
		//Garantindo que a animação começa do começo
		image_ind = 0;
	}
	//Aplicando a sprite correta
	sprite = sprites[_indice_array][face];	
	
	//Descobrindo o image number da sprite que eu estou usando
	image_numb = sprite_get_number(sprite);
	
	//Aumentando o valor do imagem index com base no image speed
	image_ind += image_spd;
	
	//Zerando o image ind depois da animação acabar
	image_ind %= image_numb; 
}

controla_player = function()
{
	var _up    = keyboard_check(vk_up);
	var _down  = keyboard_check(vk_down);
	var _left  = keyboard_check(vk_left);
	var _right = keyboard_check(vk_right);
	attack     = keyboard_check_pressed(ord("C"));//Pressed so roda uma vez
	shield     = keyboard_check(ord("Z"));
	roll       = keyboard_check_pressed(ord("X"));
	
	if(keyboard_check_pressed(vk_control) && global.arma_player)
	{
		estado = estado_ataque_especial;
	}

	//velh = (_right - _left) * max_vel;
	//velv = (_down - _up) * max_vel;

	//Ajustando a face
	if(_up)       face = 1;
	if(_down)     face = 3;
	if(_left)   { face = 2; xscale = -1; }
	if(_right)  { face = 0; xscale =  1; }
	
	if((_up xor _down) or (_left xor _right))
	{
	//Descobrir a direção em que o player esta indo
		//Point direction
		var _dir = point_direction( 0, 0, (_right - _left), (_down - _up));
		//show_debug_message(_dir);

		//Pegando o valor do velh
		var _max_velh = lengthdir_x(max_vel, _dir);
		velh = lerp(velh, _max_velh, acel); //0 ou 5
		//Pegando o valor do velv
		var _max_velv = lengthdir_y(max_vel, _dir);
		velv = lerp(velv, _max_velv, acel); //0 ou 5
		//show_message(velv);
	}
	else   //Não estou apertando nenhuma tecla de movimento
	{
		//Perdendo velocidade
		velh = lerp(velh, 0, acel);
		velv = lerp(velv, 0, acel);
	}
}

estado_parado = function()
{
	
	controla_player();
	
	estado_txt    = "parado";
	sprites_index = 0;
	//Ficando parado
	velh = 0;
	velv = 0;
	
	var _up    = keyboard_check(vk_up);
	var _down  = keyboard_check(vk_down);
	var _left  = keyboard_check(vk_left);
	var _right = keyboard_check(vk_right);
	
	ajusta_sprite (sprites_index);
	
	//Saindo do estado de parado
	if((_up xor _down) or (_left xor _right))
	{
		estado = estado_movendo;
	}
	
	//Indo para o estado de ataque
	if(attack && global.arma_player)
	{
		estado = estado_ataque;
	}
	//Indo para estado de defesa
	if(shield)
	{
		estado = estado_defesa;
	}
	//Indo para o estado roll
	if(roll)
	{
		estado = estado_rolando;
	}
}

estado_movendo = function()
{
	controla_player();
	
	estado_txt    = "movendo";
	sprites_index = 1;
	//Definindo a sprite correta
	//Indo para baixo
	ajusta_sprite (sprites_index);
	
	//Ajustando a sombra
	//Checar se a imagem esta no chão
	if(clamp(image_ind, 1,3) == image_ind)
	{
		//Estou no chão
		somb_scale = lerp(somb_scale, .6, .1);
	}
	else
	{
		somb_scale = lerp(somb_scale, .4, .1);
	}
		
		
	//Saindo do estado de movendo
	if(abs(velv) <= 0.1 && abs(velh) <= 0.1)
	{
		estado = estado_parado;	
		somb_scale = .6;
	}
	
	if(attack && global.arma_player)
	{
		estado = estado_ataque;
		somb_scale = .6;
	}
	if(shield)
	{
		estado = estado_defesa;
		somb_scale = .6;
	}
	if(roll)
	{
		estado = estado_rolando;
		somb_scale = .6;
	}
}

estado_ataque = function()
{
	static _meu_dano = noone;
	
	estado_txt = "Ataque";
	
	controla_player();
	
	//Ajustando a sprite
	ajusta_sprite(2);
	
	//Eu fico parado neste estado
	velh       = 0;
	velv       = 0;
	
	//Preciso criar o dano
	//Só crio o meu dano se eu ainda não tenho um dano
	if(!_meu_dano)
	{
		var _dano_x  = x + lengthdir_x(sprite_width, face * 90);
		var _dano_y  = y + lengthdir_y(sprite_width, face * 90);
		//A face esta olhando para cima? Se sim o valor de add é a metade da sprite
		//caso contrario o valor de add é0
		var _add     = face == 1 ? sprite_height / 2 : 0;
		
		_meu_dano =  instance_create_depth(_dano_x, _dano_y - sprite_height/2 + _add,depth,obj_dano_td);
	}
		
	//Saindo do estado de ataque
	if(image_ind + image_spd >= image_numb)
	{
		estado = estado_parado;
		
		//Resetando o meu dano
		instance_destroy(_meu_dano);
		_meu_dano = noone;
	}
}

estado_ataque_especial = function()
{
	image_alpha = 0;
	velh = 0;
	velv = 0;
	
	estado_txt =  "Ataque especial";
	//Preciso ver se eu tenho uma espada
	if(global.arma_player)
	{
		if(!seq_especial)
		{
		//Usando o ataque especial dessa espada
			seq_especial = global.arma_player.esp();
		}
	}
	else
	{
		estado = estado_parado;
	}
	
	//Checando se a animação acabou
	if(seq_especial)
	{
		if(layer_sequence_is_finished(seq_especial))
		{
			estado = estado_parado;	
			image_alpha = 1;
		
			//Destruindo a sequencia
			layer_sequence_destroy(seq_especial);
			//Resetando a seq especial
			seq_especial = noone;
		
			//Se a layer especial existe eu vou destruir ela
			if(layer_exists("ataque_especial"))
			{
					layer_destroy("ataque_especial");
			}
		}
	
	}
	else
	{
		estado = estado_parado;
		image_alpha = 1;
	}
}

estado_defesa = function()
{
	estado_txt = "Defesa";
	ajusta_sprite(3);
	
	//Controlando o player
	controla_player();
	
	//Garantindo que eu estou parado
	velh = 0;
	velh = 0;
	
	//Saindo do estado de defesa
	if(!shield)
	{
		estado = estado_parado;
	}

}

estado_rolando = function()
{
	
	//Pegando as teclas
	
	
	//Checando se eu ainda nao entrei no meu estado
	if(estado_txt != "Rolando")
	{
		//Pegando as teclas
		var _up    = keyboard_check(vk_up);
		var _down  = keyboard_check(vk_down);
		var _left  = keyboard_check(vk_left);
		var _right = keyboard_check(vk_right);
		
		//Se nao e igual é porque acabei de entrar no estado
		//Achando a minha direção
		//Só faço isso se o velh ou velv for diferente de 0
		if((_up xor _down) or (_right xor _left))
		{
			var _dir = point_direction(0, 0, _right - _left, _down - _up);
			velh     = lengthdir_x(roll_vel, _dir);
			velv     = lengthdir_y(roll_vel, _dir);	
		}
		else //Caso contrario olhe na direcao que voce esta olhando
		{
			velh     = lengthdir_x(roll_vel, face * 90);
			velv     = lengthdir_y(roll_vel, face * 90);
		}
		//Pulando 1 frame
		image_ind++;
	}
	
	estado_txt = "Rolando";
	
	//Peguei a sprite certa
	ajusta_sprite(4);

	//F com base nesse tempo ele vai ajustar o image_spd
	//30 Frames
	//Sabendo quantos frames a sprite tem
	//Ajustando a velocidade da animação
	//Definir um tempo para a animação
	//E com base nesse tempo ele vai ajustar o image_spd
	//3 frames
	
	image_spd = sprite_get_number(sprite) / (room_speed / 3);
		
	//Saindo do estado rool
	if(image_ind + image_spd + 1 >= image_numb)
	{
		estado = estado_parado;
		//Resetando a velocidade da animação
		image_spd = 6 / room_speed;
	}
}

estado_indo_dialogo = function ()
{
	estado_txt = "Indo para o diálogo";
	velh = 0;
	velv = 0;
	
	ajusta_sprite (1);
	
	//Checando se eu estou na direita ou esquerda
	//Me movendo na horizontal SE eu não estou na posição correta
	if(npc_dialogo)
	{
		var _x  = npc_dialogo.x;
		var _y  = npc_dialogo.y + npc_dialogo.margem ;
		
		if(bbox_top != _y) 
		{
		    //Ajustando o velv
			velv = sign(_y - bbox_top);
			//Ajustando a face
			face = velv < 0 ? 1 : 3;
			y = round(y);
		}
		else  if(x != _x)
		{
			face = 0;
			//Me movo
			velh = sign(_x - x);		
			//Eu mudo meu xscale dele com base no velh
			xscale = velh;
			x = round(x);//round arredonda numero
		}
		else
		{
			//Estou na posição correta, vou para o dialogo
			estado = estado_dialogo;
		}
	}
}

estado_dialogo = function()
{
	estado_txt    = "Dialogo";
	velh		  = 0;
	velv		  = 0;
	face		  = 1;
	ajusta_sprite (0);	
	
	//Criando o dialogo
	//Checando se ele ainda nao existe
	if(!instance_exists(obj_dialogo_td))
	{
		var _obj_dialogo = instance_create_depth(0, 0, 0, obj_dialogo_td);	
		_obj_dialogo.player = id;
		//Passando o dialogo do NPC para o objeto dialogo
		with(npc_dialogo)
		{
			//Dialogo do objeto dialogo |  Dialogo do NPC
			_obj_dialogo.dialogo           = dialogo;
		}
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

















