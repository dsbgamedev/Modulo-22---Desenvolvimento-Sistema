/// @description Insert description here
// You can write your code in this editor

var _colisoes = ds_list_create();
var _qtd = instance_place_list(x, y, obj_inimigo_pai_td, _colisoes, 0);

//Checar se quem eu colidi NÃO esta na lsita dos atacados
for(var i = 0; i < _qtd; i++)
{
	//Salvando o cara atual
	var _outro = _colisoes[| i];
	//Checando se o outr NÃO esta na lsita de atacados
	if(ds_list_find_index( lista_atacados,_outro) == -1)
	{
			//Adicionei ele na lista
			ds_list_add(lista_atacados, _outro);
			//Aplica o dano
			_outro.toma_dano();
			_outro.dano_dir = point_direction(x, y, _outro.x, _outro.y);
	}
}

/*
//Aplicando o dano SE eu acertei alguem
if(_qtd)
{
	for(var i = 0; i < _qtd; i++)
	{	
		var _outro  = _colisoes[| i];
		_outro.toma_dano();
		_outro.dano_dir = point_direction(x,y, _outro.x, _outro.y);
		//_colisoes[| i].knockback(x,y);
	}

}
*/

//Destruindo a estrutura de dados
ds_list_destroy(_colisoes);
//instance_destroy();























