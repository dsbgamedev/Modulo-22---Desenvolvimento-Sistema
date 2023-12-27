/// @description Insert description here
// You can write your code in this editor

//herdando as informações do pai
event_inherited();

max_vel		  = 3;
meu_acel	  = .2;
acel		  = meu_acel;
roll_vel      = 5;
			
face		  = 0;
sprite		  = sprite_index;
xscale		  = 1;
estado		  = noone;
estado_txt    = "parado";
			
debug		  = true;

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


ajusta_sprite = function(_indice_array)
{
	
	//Checando ase a sprite que eu estou usando é a que eu deveria estar usando
	//Sprite de parado
	//Sprite de ataque
	//Isso quer dizer que eu acbaei de chegar nesse estado (se a minha sprite esta errada)
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
		//Pegando o valro do velv
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
	if(attack)
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
		
	//Saindo do estado de movendo
	if(abs(velv) <= 0.1 && abs(velh) <= 0.1)
	{
		estado = estado_parado;	
	}
	
	if(attack)
	{
		estado = estado_ataque;
	}
	if(shield)
	{
		estado = estado_defesa;
	}
	if(roll)
	{
		estado = estado_rolando;
	}
}

estado_ataque = function()
{
	estado_txt = "Ataque";
	
	controla_player();
	
	//Ajustando a sprite
	ajusta_sprite(2);
	
	//Eu fico parado neste estado
	velh       = 0;
	velv       = 0;
	
	//Saindo do estado de ataque
	if(image_ind + image_spd >= image_numb)
	{
		estado = estado_parado;
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
	image_spd = 18 / room_speed;
	//Checando se eu ainda nao entrei no meu estado
	if(estado_txt != "Rolando")
	{
		//Se nao e igual é porque acabei de entrar no estado
		//Achando a minha direção
		//Só faço isso se o velh ou velv for diferente de 0
		if(velh !=0 or velv !=0)
		{
			var _dir = point_direction(0, 0, velh, velv);
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
	
	ajusta_sprite(4);
		
	//Saindo do estado rool
	if(image_ind + image_spd + 1 >= image_numb)
	{
		estado = estado_parado;
		//Resetando a velocidade da animação
		image_spd = 6 / room_speed;
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

















