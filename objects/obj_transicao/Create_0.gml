/// @description Insert description here
// You can write your code in this editor

room_destino = noone;
destino_x    = 0;
destino_y    = 0;
player       = noone;

create_sequencia = function(_sequencia)
{
	//Criando a transição na posição correta
	lay          = layer_create(depth, "transicao");
	layer_sequence_create(lay,obj_player_td.x, obj_player_td.y, _sequencia);
	
}

create_sequencia(sq_transicao_td1);
























