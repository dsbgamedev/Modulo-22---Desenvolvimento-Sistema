/// @description Insert description here
// You can write your code in this editor

//Eu vou ouvir a sequence
var _evento = event_data[? "event_type"];

//Se eu recebi qualquer brodcast da sequencia
if(_evento == "sequence event")
{
	
	//Salvando a mensagem
	var _mensagem = event_data[? "message"];
	
	
	switch(_mensagem)
	{
		//Quando a mensagem for terminei, ele muda de room
		case "terminei":
			//Mude de room
			room_goto(room_destino);
			//Destruindo a layer
			layer_destroy(lay);
			//Posicionando o player
			player.x  = destino_x;
			player.y  = destino_y;
		break;
		//Quando a mensagem for finalizou, ele se mata e limpa tudo
		case "Finalizou":
			layer_destroy(lay);
			instance_destroy();
		break;
	}	
}
























