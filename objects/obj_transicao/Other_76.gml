/// @description Insert description here
// You can write your code in this editor

//Eu vou ouvir a sequence
var _evento = event_data[? "event_type"];

//Se eu recebi qualquer brodcast da sequencia
if(_evento == "sequence event")
{
	//Quando a mensagem for terminei, ele muda de room
	
	//Mude de room
	room_goto(room_destino);
	//Destruindo a layer
	layer_destroy(lay);
	//Posicionando o player
	player.x  = destino_x;
	player.y  = destino_y;
	
	//Quando a mensagem for finalizou, ele se mata e limpa tudo
	
}
























