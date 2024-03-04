/// @description Insert description here
// You can write your code in this editor

var _colisoes = ds_list_create();
var _qtd = instance_place_list(x, y, obj_inimigo_pai_td, _colisoes, 0);

//Aplicando o dano SE eu acertei alguem
if(_qtd)
{
	for(var i = 0; i < _qtd; i++)
	{	
		_colisoes[| i].toma_dano();
		_colisoes[| i].knockback(x,y);
	}

}


//Destruindo a estrutura de dados
ds_list_destroy(_colisoes);
//instance_destroy();























