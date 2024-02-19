/// @description Insert description here
// You can write your code in this editor

global.pause = false;

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
	var _gui_w = display_get_gui_width();
	var _gui_h = display_get_gui_height();
	
	//Verificando o tamanho do fundo inventario
	show_message(_gui_w);
	
	//Desenhando a caixa no meio
	draw_sprite(spr_inventario_fundo, 0, _gui_w/2, _gui_h/2);
	
}





















