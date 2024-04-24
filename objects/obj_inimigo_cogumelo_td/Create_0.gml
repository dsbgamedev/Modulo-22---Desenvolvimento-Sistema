/// @description Insert description here
// You can write your code in this editor
event_inherited();

vida_max   = 2;
vida_atual = vida_max;

debug          = false;

//Definindo as sprites
sprites = [spr_cogumelo_right, spr_cogumelo_up, spr_cogumelo_right, spr_cogumelo_down];


muda_estado = function()
{
		//////DEBUG////////
	//Checando se eu estou com o mouse em cima do inimigo
	var  _mouse_sobre = position_meeting(mouse_x, mouse_y, id);

	//Checando se clicaram com o botão do meio
	var  _click = mouse_check_button_released(mb_middle);

	//Se a pessoa clicou enquanto o mouse estava sobre mim
	//ou seja, clicou em mim
	if(_mouse_sobre && _click)
	{
		estado = get_string("Digite o estado", "parado");
	}

}

//Olhando o player
olhando = function()
{

	var _player = collision_circle(x, y,campo_visao, obj_player_td, false, true);	 
	//Se o player entrou no campo de visão do inimigo, eu sigo ele 
	if(_player  && t_persegue <= 0)
	{
		estado = "persegue";
		alvo   = _player;
	}
}

controla_estado = function()
{
	
	//Controlando os estados do inimigo
	switch(estado)
	{
		#region parado
		case "parado":
				
			 image_speed = 6 / room_speed;
			 //Diminuindo o tempo de persegue
			 if(t_persegue > 0)	t_persegue--;
			 //Diminuindo o tempo
			 tempo--;
			 
			 //Faz inimigo voltar a cor original
			 image_blend = c_white;
		
			 //Ele deve ficar parado
			 velh = 0;
			 velv = 0;
			  
			 //Regra para sair desse estado
			 if(tempo <= 0)
			 {
				//Mudando o estado
				estado = choose("parado", "andando");
				
				//Reseto o tempo
				tempo = tempo_estado;
			 }
			 //Regra para sair para o estado de peregue
			 olhando();
			 
		break;
		#endregion
	
		#region andando
		case "andando":
			 //Estado de andando
			 tempo--;
			 //Faz inimigo voltar a cor original
			 image_blend = c_white;
			 image_speed  = 8 / room_speed;
			 //Diminuindo o tempo de persegue
			 if(t_persegue > 0)	t_persegue--;
			 
			 //Escolhendo um ponto aleatório da room
			 //Checando se ainda eu não tenho destino
			 //Só escolho um destino se ainda eu não tenho um
			 //Quando ele chegar no destino, eu escolho outro destino
			 
			 //Checar a minha distancia para o destino
			 var _dist = point_distance(x, y, destino_x, destino_y);
			 
			 if(destino_x == 0 or destino_y == 0 or _dist < max_vel * 2)
			 {
				 destino_x = random_range(0, room_width);
				 destino_y = random_range(0, room_height);
			 }
			 //Andando em direção ao destino
			 //Descobrindo a direção que ue devo ir
			 var _dir = point_direction(x, y ,destino_x ,destino_y);
					
			//Dando o valor do meu velh
			 velh = lengthdir_x(max_vel, _dir);
			 velv = lengthdir_y(max_vel, _dir);
			 
			 //Se eu bati em uma parede, eu paro!
			 if(place_meeting(x + velh, y +velv, obj_chao_td))
			 {
				estado = "parado";	
				//Resetando o meu destino
				destino_x = 0;
				destino_y = 0;
				tempo = tempo_estado;
			 }
			 
			//Regra para mudar de estado
			if(tempo <= 0)
			{
				tempo = tempo_estado;
				estado = choose("parado","andando","andando");
				
				//Resetando o meu destino
				destino_x = 0;
				destino_y = 0;
			}
			//Regra para sair para o estado de peregue
			//Só posso perseguir o player SE meu tempo de persegue acabou
			olhando();
					
		break;
		#endregion
		
		#region persegue
		case "persegue":
		
			//Uma cor diferente
			image_blend = c_orange;
			image_speed = 12 / room_speed;
			//Indo na direção do player
			if (alvo)
			{
				destino_x = alvo.x;
				destino_y = alvo.y;
			}
			else
			{
				//Vou para outro estado estado	
				estado = choose("parado", "parado", "andando");
				//Resetando
				destino_x = 0;
				destino_y = 0;
				tempo     = tempo_estado;
			}
			
			var _dir = point_direction(x,y,destino_x,destino_y);
			velh     = lengthdir_x(max_vel, _dir);
			velv     = lengthdir_y(max_vel, _dir);
			
			//Regra para deixar de seguir o player
			var _dist = point_distance(x, y, destino_x, destino_y);
			
			//Se o player saiu do meu campo de visão + 70 pixel ou seja uma margem a mais
			if(_dist > campo_visao + campo_visao / 2)
			{
				//Aqui eu paro de seguir...
				alvo      = noone;
				tempo	  = tempo_estado;
				destino_x = 0;
				destino_y = 0;
			}
			
			//Checando se estou muito proximo do player
			if(_dist < campo_visao / 3)
			{
				estado = "carrega_ataque";
				//Aqui eu paro de atacar...
				tempo	  = tempo_estado;
			}
		
		break;
		#endregion
		
		#region ataque
		case "ataque":
		
			//Ficando vermelho
			image_blend = c_red;
			
			aplica_dano_player();
			
			//Ataquei o player eu reseto o t_persegue
			//Dessa forma eu preciso esperar um tempo para perseguir o player
			t_persegue = tempo_persegue;
			//Ficando mais rapido
			var _dir = point_direction(x,y,destino_x, destino_y);
			velh = lengthdir_x(max_vel * 3, _dir);
			velv = lengthdir_y(max_vel * 3, _dir);
			
			//Se eu cheguei no meu destino, eu fico de boa na lagoa
			var _dist = point_distance(x,y, destino_x, destino_y);
			
			if(_dist < 16)
			{
				estado = "parado";
			}
			
		break;
		#endregion
		
		#region carrega_ataque
		case "carrega_ataque":
			
			t_ataque--;
			velh   = 0;
			velv   = 0;
			
			var _green = (t_ataque / tempo_ataque) * 255;
			var _blue  = (t_ataque / tempo_ataque) * 120;
			
			//Alterando o image_blend
			image_blend = make_color_rgb(255, _green, _blue);
			
			if(t_ataque <= 0)
			{
				estado = "ataque";	
				t_ataque = tempo_ataque;
			}
				
		break;
		#endregion
		
		#region dano
		case "dano":
			
			timer_dano--;
			timer_pisca--;
			velh = 0;
			velv = 0;
			//Checando se eu devo aplicar o dano
			if(dano > 0)
			{
				timer_pisca = tempo_pisca;
				vida_atual -= dano;	
				dano = 0;
			}
			
			//Sendo empurrado
			velh = lengthdir_x(1, dano_dir);
			velv = lengthdir_y(1, dano_dir);
			
			
			if(timer_dano < 0)
			{
				timer_dano  = tempo_dano;
				if(vida_atual <=0 )
				{
					estado = "morte";
				}
				else
				{
					estado = "parado";	
				}
			}
			
			break;
		#endregion
		
		#region morte
		case "morte":
		
			velh        = 0;
			velv	    = 0;
			image_speed = 0;
			if(image_alpha > 0)
			{
				image_alpha = - .01;	
			}
			else //Eu ja sumi
			{
				instance_destroy();
			}
			
			break;
			
		#endregion
			
		case "bobao":
			velh        = 0;
			velv        = 0;
			image_speed = 6 / room_speed;
			break;
	}

}















































