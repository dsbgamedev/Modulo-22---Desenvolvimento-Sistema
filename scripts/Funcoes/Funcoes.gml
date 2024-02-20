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
	depth = -y;//Pega o vlaor do Y e inverte colocar no objeto entidade no começo
}

///@function cria_arma
function cria_arma(_nome, _desc, _spr, _dano, _vel) constructor
{
	//Criando o ID das armas
	arma_id = 0;
	nome    = _nome;
}

//Criando a minha arma
faca = new cria_arma("faca gelo", "faca congelante", spr_chao,3,1);
var _b = new cria_arma("espada madeira", "espada 2", spr_gelo_td,1,1) 

show_message(faca);
show_message(_b);
