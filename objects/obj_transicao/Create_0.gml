/// @description Insert description here
// You can write your code in this editor

room_destino = noone;
destino_x    = 0;
destino_y    = 0;
player       = noone;

//Ativando o meu alarme
alarm[0] =  room_speed / 2;

create_sequencia = function(_sequencia)
{
	//Criando a transição na posição correta
	lay          = layer_create(depth, "transicao");
	if(player)
	{
		layer_sequence_create(lay, player.x, player.y, _sequencia);
	}
	else
	{
		layer_sequence_create(lay, x, y, _sequencia);	
	}
}

create_sequencia(sq_transicao_td1);
























