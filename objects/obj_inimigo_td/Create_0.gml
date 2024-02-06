/// @description Insert description here
// You can write your code in this editor
event_inherited();

max_vel        = 2;
somb_alpha     = .3;

tempo_estado   = room_speed * 3;
tempo          = tempo_estado;

tempo_ataque   = room_speed * .5;
t_ataque       = tempo_ataque

campo_visao    = 100;
tempo_persegue = room_speed * 2;
t_persegue     = tempo_persegue;

estado         = "parado";
destino_x      = 0;
destino_y      = 0;
alvo           = noone;
debug          = false;

image_speed    = 8 / room_speed;

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
			sprite_index = spr_cogumelo_right;
			image_xscale = 1;
			break;	
		}
		case 1:
		{
			sprite_index = spr_cogumelo_up;
			break;	
		}
		case 2:
		{
			sprite_index = spr_cogumelo_right;
			image_xscale = -1;
			break;	
		}
		case 3:
		{
			sprite_index = spr_cogumelo_down;
			break;	
		}
		
	}
	
}

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

	var _player = collision_circle(x, y, campo_visao, obj_player_td, false, true);	 
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
			
	}

}

















































/*

max_vel = 2;

tempo_estado   = room_speed * .2;
tempo          = tempo_estado;

tempo_ataque   = room_speed * .2;
t_ataque       = tempo_ataque;

campo_visao    = 100;
tempo_persegue = room_speed * 2;
t_persegue     = tempo_persegue;

estado         = "parado";//variavel vai controlar todos estados
destino_x      = 0;
destino_y      = 0;
alvo           = noone;
debug          = false;

image_speed    = 8 / room_speed;


muda_estado = function()
{
	
	//Checando se eu estou com mouse encima do inimigo
	var _mouse_sobre = position_meeting(mouse_x, mouse_y, id);

	//Checando se clicaram com o botao do meio
	var _click = mouse_check_button_released(mb_middle);

	//Se a pessoa clicou enquanto o mouse estava sobre mim
	//Ou seja, clicou em mim
	//Ele muda meu estado
	if(_mouse_sobre && _click)
	{
		estado = get_string("Digite o estado", "parado"); 
	}

}

olhando = function()
{
	var _player =   collision_circle(x,y,campo_visao,obj_player_td,false,true); //collision_circle(x , y, campo_visao, obj_player_td, false, true);

	//Se o player entrou no campo de visão, eu sigo ele
	if(_player && t_persegue <= 0)
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
			   if(t_persegue > 0)  t_persegue --;
			   
			  //Diminuindo o tempo
			  tempo--;
			  image_blend = c_white;
			  //Ele deve ficar parado
			  velh = 0;
			  velv = 0;
			  
			  //Regra para sair desse estado
			  if(tempo <= 0)
			  {
				  //Mudando o tempo
				  estado = choose("parado","andando");//choose escolhe o que ira fazer
				  //Reseta o tempo
				  tempo = tempo_estado;
			  }
			  //Regra para ir para o estado de persegue
			  olhando();
		break;
		#endregion
		
		#region andando
		case "andando":
			//Estado andando
			tempo--;
			//Escolhendo ponto aleatorio na room
			//Checando se eu ainda nao tenho destino
			//Só escolho um destino se ainda nao tenho um
			image_blend = c_white;
			image_speed = 8 / room_speed;
			if(t_persegue > 0)  t_persegue --;
			
			//Checar a minha distancia para o destino
			var _dist = point_distance(x, y, destino_x, destino_y);
			
			if(destino_x == 0 || destino_y == 0 || _dist < max_vel * 2)
			{
				destino_x = random_range(0, room_width);
				destino_y = random_range(0, room_height);
			}	
			//Andando em direção ao destinho
			//Descobrindo a direção que eu devo ir
			var _dir = point_direction( x, y, destino_x, destino_y);
				
			//Dando o valor do meu velh
			velh = lengthdir_x(max_vel, _dir);
			velv = lengthdir_y(max_vel, _dir);
			
			//Regra para mudar de estado
			if(tempo <= 0)
			{
				tempo = tempo_estado;
				estado = choose("parado","andando", "andando");
				
				//Resetando o meu destino
				destino_x = 0;
				destino_y = 0;
			}
			//Regra para ir para o estado de persegue
			//Só posso perseguir o player SE meu tempo de espera acabou
			olhando();
			
		break;
		#endregion
		
		#region persegue
		case "persegue":
			
			//Uma cor diferente
			image_blend = c_orange;
			image_speed = 12 / room_speed;
			//Indo na direção do player			
			
			if(alvo)
			{
				destino_x = alvo.x;
				destino_y = alvo.y;
			}
			else
			{
				//Vou para outro estado
				estado = choose("parado","parado", "andando");
				destino_x = 0;
				destino_y = 0;
				tempo     = tempo_estado;
			}
			
			var _dir = point_direction(x,y, destino_x, destino_y);
			velh = lengthdir_x(max_vel, _dir);
			velv = lengthdir_y(max_vel, _dir);
			
			//Regra para deixa de seguir o player
			var _dist = point_distance(x,y,destino_x, destino_y);
			
			//Player saiu do meu campo 
			if(_dist > campo_visao + 50)
			{
				alvo = noone;
				tempo = tempo_estado;
				destino_x = 0;
				destino_y = 0;
			}
			
			//Checando se estou muito próximo do player
			if(_dist > campo_visao / 3)
			{
				estado = "carrega_ataque";		
				tempo  = tempo_estado;
			}
			
			
		break;	
		#endregion
		
		#region carrega_ataque
		case "carrega_ataque":
		
			t_ataque--;
			velh   = 0;
			velv   = 0;
			
			var _greem = (t_ataque / tempo_ataque) * 255; //retorna valor 0 e 1, 
			var _blue  = (t_ataque / tempo_ataque) * 120;	
				
			//Alterando o image_blend
			image_blend = make_color_rgb(255, _greem, _blue);
				
			if(t_ataque <= 0)
			{
				estado = "ataque";
				t_ataque = tempo_ataque;
			}
			
		break;
		#endregion
		
		#region ataque
		case "ataque":
			
			//Ficando vermelho
			image_blend = c_red;
			//Ataquei o player, eu reseto o t_persegue
			//Dessa forma eu preciso esperar um tempo para perseguir o player novamente
			t_persegue = tempo_persegue;
			
			//Ficando mais rapido
			var _dir = point_direction( x, y, destino_x, destino_y);
			velh = lengthdir_x(max_vel * 3, _dir);
			velv = lengthdir_y(max_vel * 3, _dir);
			
			//Se eu cheguei no meu destino , eu fico de boa na lagoa
			var _dist = point_direction(x,y, destino_x, destino_y);
			if(_dist < 16)
			{
				estado = "parado";	
			}			
		break;
		#endregion
		
	}	

}











