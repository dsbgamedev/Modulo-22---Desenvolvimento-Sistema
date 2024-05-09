//Criando o player se ele não existe
if(!instance_exists(obj_player_td))
{
	var _player = instance_create_layer(365, 249,"Player", obj_player_td);	
}