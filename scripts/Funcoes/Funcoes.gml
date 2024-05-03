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
	tipo     = item_tipo.armas; 
	static qtd_armas = 0;
	meu_id           = qtd_armas++;
	nome			 = _nome;
	desc			 = _desc;
	spr				 = _spr;
	dano			 = _dano;
	vel				 = _vel;
	esp				 = _esp;

	
	static usa_item = function()
	{
		//Equipando a arma	
		global.arma_player = global.armas[| meu_id];
	}
	
	static pega_item = function()
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

//Que informações eu preciso de um item consumiveis
function cria_consumivel(_nome, _desc, _spr, _acao) constructor
{
	tipo = item_tipo.consumiveis;
	static _id   = 0;
	meu_id       = _id++;
	nome         = _nome;
	desc         = _desc;
	spr          = _spr;
	acao         = _acao;
	
	usa_item     = acao;	
	
	static pega_item = function()
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
					global.inventario[# j, i] = global.cosumiveis[| meu_id];
					
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

enum item_tipo
{
		armas,
		consumiveis
}

enum consumiveis
{
	pocao_vermelha,
	pocao_coracao
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

//Estruturas com os itens consumiveis
global.cosumiveis = ds_list_create();


//Variáveis de vida do player
global.max_vida_player = 6; //cada coração 2 de vida
global.vida_player = 3;

//Criando a minha arma
var _a = new cria_arma("Espada de madeira", "Espada simples feita de madeira que no máximo vai machucar um pouco",
					spr_espada, 1, 1, ataque_especial_madeira);
var _b = new cria_arma("Espada comum", "Espada comum feita de cristal afiada dano medio",
					spr_espada, 2, 1, especial_espada_comum);
var _c = new cria_arma("Espada de sangue", "Espada especial feita de ouro para lutas ferozes",
					spr_espada, 4, .5, ataque_especial_sangue);

//Salvando as minhas armas na minha lista de armas
ds_list_add(global.armas, _a, _b, _c);

#region acoes dos consumiveis
function acao_pocao_vermelho()
{
	//Usando a poção vermelhas
	global.vida_player += 2;
	//Limitando a vida do player
	global.vida_player = clamp(global.vida_player, 0, global.max_vida_player);
	
}

function acao_pocao_coracao()
{
	//Aumentando a quantidade de coração
	global.max_vida_player += 2;
}

#endregion

var _a = new cria_consumivel("Poção Vermelha", "Poção vermelha que cura um coração vida", spr_item, acao_pocao_vermelho);
var _b = new cria_consumivel("Poção coração", "Aumenta em um a quantidade maxima de coração", spr_item, acao_pocao_coracao);

//Salvando os items criados na lista
ds_list_add(global.cosumiveis, _a, _b);

//Criando a função do ataque especial da espada comum
function especial_espada_comum()
{
	//Criando a layes da sequencia
	if(instance_exists(obj_player_td))
	{
		with(obj_player_td)
		{
			
			////Pegando as minha sequencia
			//var _nova_seq = sequence_get(sq_ataque_td);
			
			////Inicio da animação (track debaixo)
			//_nova_seq.tracks[0].keyframes[0].channels[0].spriteIndex = sprite;
			////Final da animação (track decima)
			//_nova_seq.tracks[1].keyframes[0].channels[0].spriteIndex = sprites[2, face];
			
			var _nova_seq = ajusta_sprite_sequencia([sprite, sprites[2, face]], sq_ataque_td);
			
			var _layer = layer_create(depth, "ataque_especial");
			//Criando a minha sequencia
			var _seq = layer_sequence_create(_layer, x, y, _nova_seq);
			
			//Devolvo a sequencia criada para quem chamou a função
			show_debug_message("NOVA SEQUENCIA");
			show_debug_message(_seq);
			return _seq;
 		}
	}
	show_debug_message("É FALSO");
	return false;
	show_debug_message(false);
}

//Função para ajustar sprites na sequencia
function ajusta_sprite_sequencia(_sprites, _sequencia)
{
	//5 Tracks - mudar sprite da 0 e da 4
	//Pegando a sequÊcia
	var _nova_seq = sequence_get(_sequencia);
	
	//Checando o tamanho do vetor
	var _qtd = array_length(_sprites);
	//Indo da track 0 até a track equivalente ao tamanho do array
	for(var i = 0; i < _qtd; i++)
	{
		//Pegando o valor atual do array
		var _atual = _sprites[i];
		
		//Só vou mexer na track que tem um valor
		if(_atual)
		{
			_nova_seq.tracks[i].keyframes[0].channels[0].spriteIndex = _atual;
		}
	}
	//Retornadno a sequencia modificada
	return _nova_seq;
}

#region acoes das armas
function ataque_especial_madeira()
{
	if(instance_exists(obj_player_td))
	{
		with(obj_player_td)
		{
			//Modificando e pegando a sequência
			var _nova_seq = ajusta_sprite_sequencia([sprites[2, face]], sq_ataque_td2);
			
			var _layer    =  layer_create(depth, "ataque_especial");
			var _seq      =  layer_sequence_create(_layer, x,y,_nova_seq);
			
			//Fazendo a sequencia olhar para o lado certo
			layer_sequence_xscale(_seq, xscale);
			
			//Criar o projetil
			var _tiro = instance_create_depth(x, y - sprite_height / 2, depth, obj_projetil_td);
			_tiro.image_speed = 0;
			_tiro.image_index = 0;
			_tiro.speed       = 7;
			_tiro.direction   = face * 90;
			_tiro.image_angle = face * 90 - 90;
			
			return _seq;			
		}
	}
	
	return false;
}

function ataque_especial_sangue ()
{
	if(instance_exists(obj_player_td))
	{
		with(obj_player_td)
		{
			var _layer  = layer_create(-10000, "ataque_especial");
			var _seq    = layer_sequence_create(_layer, x, y, sq_ataque_td3);
			
			return _seq;
		}
	}
	
	return false;
}
#endregion

function cria_screenshake()
{
	var _shake = fx_create("_filter_screenshake");	
	
	//Criando a layer dele
	var _layer = layer_create(-10000,"shake");
	layer_set_fx(_layer, _shake);
	
}

function termina_screenshake()
{
	layer_destroy("shake");
}

function ataque_nenhum()
{
	show_message("puf");
}


