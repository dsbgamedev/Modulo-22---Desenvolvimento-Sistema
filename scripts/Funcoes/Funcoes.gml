// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Funcoes(){

}

///Function desenha_sombra(sprite, escala, [cor], [alpha])
function desenha_sombra(_sprite, _escala, _cor = c_white, _alpha = .2)
{
	draw_sprite_ext(_sprite, 0, x, y, _escala, _escala, 0, _cor , _alpha);	
}

function ajusta_depth()
{
	depth = -y;//Pega o valor do Y e inverte colocar no objeto entidade no começo
}

///@function cria_arma
function cria_arma(_nome, _desc, _spr, _dano, _vel, _esp) constructor
{
	//Criando o ID das armas
	static qtd_armas = 0;
	meu_id = qtd_armas++;
	nome    = _nome;
	desc    = _desc;
	spr     = _spr;
	dano    = _dano;
	vel     = _vel;
	esp     = _esp;

	
	usa_item = function()
	{
		//Equipando a arma	
		global.arma_player = global.armas[| meu_id];
	}
	
	pega_item = function()
	{
		var _cols = ds_grid_width(global.inventario);
		var _lins = ds_grid_height(global.inventario);
		//Checar se tem espaço vazio no inventário
		for(var i = 0; i < _lins; i++)
		{
			for(var j = 0; j < _lins; j++)
			{
				//Se o slot atual esta vazio, eu entro nele
				var _atual = global.inventario[# j, i];
				if(!_atual)
				{
					//Eu vou para esse slot
					global.inventario[# j, i] = global.armas[| meu_id];
					
					//Consegui equipar, eu aviso que deu certo
					return true;
				}
			}
		}
		
		//Terminou o laço de repetição e eu não consegui nada
		//Eu retorno falso
		return false;
	}
	
}

enum armas
{
	espada_madeira,
	espada_cristal,
	espada_ouro
}

//Criando a minha lista de armas
global.armas		= ds_list_create();
global.arma_player  = noone;

//Criando a minha arma
var _a = new cria_arma("Espada de madeira", "Espada simples feita de madeira que no máximo vai machucar um pouco",
					spr_espada, 1, 1, 0);
var _b = new cria_arma("Espada comum", "Espada comum feita de cristal afiada dano medio",
					spr_espada, 2, 1, especial_espada_comum);
var _c = new cria_arma("Espada de sangue", "Espada especial feita de ouro para lutas ferozes",
					spr_espada, 4, .5, 0);

//Salvando as minhas armas na minha lista de armas
ds_list_add(global.armas, _a, _b, _c);

//Criando a função do ataque especial da espada comum
function especial_espada_comum()
{
	//Criando a layes da sequencia
	if(instance_exists(obj_player_td))
	{
		with(obj_player_td)
		{
			
			//Pegando as minha sequencia
			var _nova_seq = sequence_get(sq_ataque_td);
			
			//Inicio da animação (track debaixo)
			_nova_seq.tracks[0].keyframes[0].channels[0].spriteIndex = sprite;
			//Final da animação (track decima)
			_nova_seq.tracks[1].keyframes[0].channels[0].spriteIndex = sprites[2, face];
			
			var _layer = layer_create(depth, "ataque_especial");
			//Criando a minha sequencia
			var _seq = layer_sequence_create(_layer, x, y, _nova_seq);
			
			//Devolvo a sequencia criada para quem chamou a função
			return _seq;
		}
	}
	
	return false;
}

function ataque_nenhum()
{

}


