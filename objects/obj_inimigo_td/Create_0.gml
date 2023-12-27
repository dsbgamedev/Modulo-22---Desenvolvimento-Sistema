/// @description Insert description here
// You can write your code in this editor
event_inherited()

max_vel = 2;

tempo_estado   = room_speed * 1;
tempo          = tempo_estado;

tempo_ataque   = room_speed * .5;
t_ataque       = tempo_ataque;

campo_visao    = 200;
tempo_persegue = room_speed * 2;
t_persegue     = tempo_persegue;

estado         = "parado";//variavel vai controlar todos estados
destino_x      = 0;
destino_y      = 0;
alvo           = noone;
debug          = false;


muda_estado = function()
{
	
	//Checando se eu estou com mouse encima do inimigo
	var _mouse_sobre = position_meeting(mouse_x, mouse_y, id);

	//Checando se clicaram com o botao do meio
	var _click = mouse_check_button_released(mb_middle);

	//Se a pessoa clicou enqaunto o mouse estava sobre mim
	//Ou seja, clicou em mim
	//Ele muda meu estado
	if(_mouse_sobre && _click)
	{
		estado = get_string ("Digite o estado", "parado");
	}

}

olhando = function()
{
	var _player = collision_circle(x,y, 201.2, obj_player_td, false, true);
	
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
				  estado = choose("parado","andando");
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
			//Só escolho um destino se ainda nao tneho um
			image_blend = c_white
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
			//Só posso perseguir o player SE mey tempo de espera acabou
			olhando();
			
		break;
		#endregion
		
		#region persegue
		case "persegue":
			
			//Uma cor diferente
			image_blend = c_orange;
			//Indo na direção do player
			
			alvo = obj_player_td;
			
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
			if(_dist > campo_visao + 70)
			{
				alvo = noone;
				tempo = tempo_estado;
				destino_x = 0;
				destino_y = 0;
			}
			
			//Checando se estou muito próximo do player
			if(_dist < 100)
			{
				estado = "carrega_ataque";		
				tempo  = tempo_estado;
			}
			
		break;	
		#endregion
		
		#region carrega_ataque
		case "carrega ataque":
		
			t_ataque--;
			velh   = 0;
			velv   = 0;
			
			var _greem = (t_ataque / tempo_ataque) * 115; //retorna valor 0 e 1, 
			var _blue  = (t_ataque / tempo_ataque) *  96;	
				
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
			//Dessa forma eu preciso esperar um tpeo para perseguir o player novamente
			t_persegue = tempo_persegue;
			
			//Ficando mais rapido
			var _dir = point_direction( x, y, destino_x, destino_y);
			velh = lengthdir_x(max_vel * 3, _dir);
			velv = lengthdir_y(max_vel * 3, _dir);
			
			//Se eu cheguei no meu destino , eu fico d eboa na lagoa
			var _dist = point_direction(x,y, destino_x, destino_y);
			if(_dist < 16)
			{
				estado = "parado";	
			}
			
		break;
		#endregion

	}	
}











