/// @description Insert description here
// You can write your code in this editor

global.pause = false;

global.inventario = ds_grid_create(4, 4); //4 colunas 4 linhs
ds_grid_clear(global.inventario, 0);

//Me dando uma arma
global.inventario[# 2, 2] = global.armas[| armas.espada_madeira];
global.inventario[# 0, 1] = global.armas[| armas.espada_cristal];
global.inventario[# 0, 0] = global.armas[| armas.espada_ouro];

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
	//Variáveis para saber a seleção X e Y
	static _sel_x = 0, _sel_y = 0;
	
	//Pegando as dimensões da minha tela
	var _gui_w			= display_get_gui_width();
	var _gui_h			= display_get_gui_height();
	var _spr_w			= sprite_get_width(spr_inventario_fundo);
	var _spr_h			= sprite_get_width(spr_inventario_fundo);
	var _inv_w			= _gui_w * .4; //70%
	var _inv_h			= _gui_h * .4; //70%
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
	//Passa posição x do mouse dentro da GUI
	var _mouse_x		= device_mouse_x_to_gui(0);
	var _mouse_y		= device_mouse_y_to_gui(0);
	
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

	//Selecionar os items atravez do teclado
	//if(keyboard_check_released(vk_up)) _sel_y--;	
	//if(keyboard_check_released(vk_down)) _sel_y++;
	
	var _mouse_na_area = _mouse_x == clamp(_mouse_x, _item_x, _item_x + _item_w)&&
						 _mouse_y == clamp(_mouse_y, _item_y, _item_y + _item_h);
	
	//Desenhando os itens no espaço dos itens
	for(var i = 0; i < _lins; i++)
	{
		for(var j = 0; j < _cols; j++)
		{
			//Garantir que esse codigo so vai rodar se eu estiver com o mouse 
			//na area de seleção
			//Checando a posição do mouse dentro do espaço dos itens
			//Criando o espaço inicial e levando em conta a margem dos itens
			//Checando se o mouse esta na area
			if(_mouse_na_area)
			{
				_sel_y = (_mouse_y - _item_y - (_grid_marg_y * i)) div _grid_h;
		
				_sel_x = (_mouse_x - _item_x - (_grid_marg_x * j)) div _grid_w;
			}
			
			//Grantindo que o _sel_x e y não passem do limite da minha grid
			_sel_x = clamp(_sel_x, 0, _cols - 1);
			_sel_y = clamp(_sel_y, 0, _lins - 1);
			
			//Levar a margem da grid em conta eme relação ao j e o i
			var _x1 = _item_x + _grid_w * j + (_grid_marg_x * j) + _grid_marg_x;
			var _y1 = _item_y + _grid_h * i + (_grid_marg_y * i) + _grid_marg_y;
		
			//Checando se a caixa que estou desenhando agora é a da seleção atual
			var _selecionado = (_sel_x == j && _sel_y == i); //se for verdade retornar 1 se nao ele retornar 0
			draw_sprite_stretched(spr_inventario_caixa, _selecionado, _x1, _y1, _grid_w, _grid_h );
			
			//Checando se a minha seleção atual existe item
			var _item_atual = encontra_item(j,i);
			//Se a seleção atual possui valor que não seja nulo(0, -1,-2 ou qualquer valor negativo)
			//Então eu tenho algum item
			if(_item_atual)
			{
		
				var _item_atual_w = _grid_w * .5;
				var _item_atual_h = _grid_h * .5;
				//Cria depois de saber o tamanho dele na grid
				var _item_atual_x = _x1 + _item_atual_w / 2;
				var _item_atual_y = _y1 + _item_atual_h / 2;
				
				//Desenhar a SPRITE do item
				draw_sprite_stretched(_item_atual.spr, _item_atual.meu_id,
				_item_atual_x, _item_atual_y,_item_atual_w, _item_atual_h);
			}
			
			//Pegando o item que o cursor esta por cima
			var _sel_atual = encontra_item(_sel_x, _sel_y);
			//Se eu tenho algum item na seleção atual, eu desenho ele no espaço de descrição
			if(_sel_atual)
			{
				var _sel_atual_spr_w	= sprite_get_width(_sel_atual.spr);
				var _sel_atual_w		= _grid_w * .5;
				var _sel_atual_h		= _grid_h * .5;
				
				//Ajustando a escala da sprite da seleção atual
				var _sel_atual_escala   = _sel_atual_w / _sel_atual_spr_w;
				
				var _sel_atual_x		= _desc_x + _desc_w / 2;
				var _sel_atual_y		= _desc_y + _sel_atual_h ;
				var _efeito_x			= sin(2 * get_timer() / 1000000);
	
				//Desenhando a spirte
				//draw_sprite_stretched(_sel_atual.spr,_sel_atual.meu_id,
				//_sel_atual_x, _sel_atual_y, _sel_atual_w * _efeito_x, _sel_atual_h);
				draw_sprite_ext(_sel_atual.spr, _sel_atual.meu_id, _sel_atual_x, _sel_atual_y, _sel_atual_escala * _efeito_x,
				_sel_atual_escala, 0, c_white, 1);
			
				draw_set_halign(1);//centralizando texto
				//Desenhando o texto
				draw_text_ext(_sel_atual_x, _sel_atual_y + _sel_atual_h, _sel_atual.desc, 20, _desc_w);
				draw_set_halign(-1);
			}
			
		}
	}

}


//Encontra item
encontra_item = function(_x, _y)
{
	return global.inventario[# _x, _y];	
}




















