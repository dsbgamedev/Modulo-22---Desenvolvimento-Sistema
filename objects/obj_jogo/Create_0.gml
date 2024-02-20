/// @description Insert description here
// You can write your code in this editor

global.pause = false;

global.inventario = ds_grid_create(4, 4); //4 colunas 4 linhs
ds_grid_clear(global.inventario, 0);

//Definindo o tamanho do gui
display_set_gui_size(512,288);

desenha_pause = function()
{
	var _w = display_get_gui_width();
	var _h = display_get_gui_height();	
	draw_set_alpha(.5);
	draw_rectangle_color(0,0, _w, _h,  c_black,c_black,c_black,c_black,false);
	draw_set_alpha(1);
	
	
	//Criando uma Layer SE ela não existe
	if(!layer_exists("efeito_pause"))
	{
		
		//Criar uma camada de efeito
		var _blur = fx_create("_filter_linear_blur");
		//Descobrindo qual o valor que devo usar
		//var _nome = fx_get_parameter_names(_blur);
		//var _par = fx_get_parameter(_blur, _nome[0]);
		//show_message(_par);
		fx_set_parameter(_blur, "g_LinearBlurVector",[5, 5]);
		layer_create(-10000, "efeito_pause");	
		
		//Criei a minha layer, aplico o efeito
		layer_set_fx("efeito_pause", _blur);
	}
	//Criar um efeito de blur
	
	//Configurar o efeito de blur
}


//Desenha inventario
desenha_inventario = function()
{
	//Pegando as dimensões da minha tela
	var _gui_w			= display_get_gui_width();
	var _gui_h			= display_get_gui_height();
	var _spr_w			= sprite_get_width(spr_inventario_fundo);
	var _spr_h			= sprite_get_width(spr_inventario_fundo);
	var _inv_w			= _gui_w * .6; //70%
	var _inv_h			= _gui_h * .6; //70%
	var _inv_x			= _gui_w / 2 - _inv_w / 2;
	var _inv_y			= _gui_h / 2 - _inv_h / 2;
	var _marg_x			= _inv_w * 0.015;
	var _marg_y			= _inv_h * .03;
	var _item_x			= _inv_x + _marg_x;
	var _item_y			= _inv_y + _marg_y;
	var _item_w			= _inv_w * .7 - _marg_x;
	var _item_h			= _inv_h - _marg_y * 2;
 	var _desc_x			= _item_x + _item_w + _marg_x;
 	var _desc_y			= _item_y;
 	var _desc_w			= _inv_w * .3 - _marg_x * 2;
 	var _desc_h			= _item_h;
	var _cols			= ds_grid_width(global.inventario);
	var _lins			= ds_grid_height(global.inventario);
	var _grid_marg_x	= _item_w * .02;
	var _grid_marg_y	= _item_h * .02;
	//Preciso checar o tamanho total subtraindo dele as margens que criei
	var _grid_w			= (_item_w - _cols * _grid_marg_x) div _cols; //div para pegar numeros inteiros e nao quebrado
	var _grid_h			= (_item_h - _lins * _grid_marg_y) div _lins;
	
	//Parea determinar o tamanho de cada quadrado eu preciso
	//levar em conta o tamanho de cada quadrado, com as margens tambem inclusas
 	
	
	//Desenhando a caixa no meio
	//draw_sprite(spr_inventario_fundo, 0, _gui_w/2 - _spr_w/2, _gui_h/2 - _spr_h/2);
	//Desenhando a caixa com dimensões espeificas
	draw_sprite_stretched(spr_inventario_fundo, 0, _inv_x, _inv_y,_inv_w, _inv_h);

	//Desenhando o quadrado na grid
	draw_rectangle(_item_x, _item_y, _item_x + _item_w, _item_y + _item_h, 1);

	//Desenhnado o retangulo na parte das informações do item
	draw_rectangle( _desc_x, _desc_y , _desc_x + _desc_w , _desc_y + _desc_h , true );

	//Desenhando os itens no espaço dos itens
	for(var i = 0; i < _lins; i++)
	{
		for(var j = 0; j < _cols; j++)
		{
			//draw_sprite(spr_inventario_caixa, 0, _item_x + j * 30, _item_y + i * 30);
			//Levar a margem da grid em conta eme relação ao j e o i
			var _x1 = _item_x + _grid_w * j + (_grid_marg_x * j) + _grid_marg_x;
			var _y1 = _item_y + _grid_h * i + (_grid_marg_y * i) + _grid_marg_y;
			draw_sprite_stretched(spr_inventario_caixa, 0, _x1, _y1, _grid_w, _grid_h );
		}
	}

}





















