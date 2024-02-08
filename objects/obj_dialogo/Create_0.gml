/// @description Insert description here
// You can write your code in this editor

dialogo = noone;
indice  = 1;

cria_dialogo = function(_dialogo)
{
	//Desenhando o meu texto
	static _gui_w   = display_get_gui_width();
	static _gui_h	= display_get_gui_height();
	
	//Convertendo e escala da sprite da caixa de texto de pixel para escala(porcentagem)
	var _escala = _gui_w / sprite_get_width(spr_caixa_dialogo);//vai retornar o tamanho da escala dele
	
	var _txt		= _dialogo.texto[0];
	var _txt_tam    = string_length(_txt);//verifica o tamanho da letra
	var _txt_vel    = _dialogo.txt_vel;
	var _txt_atual  = string_copy(_txt, 1, indice);
	var _yy			= display_get_gui_height() - 100;
	draw_set_font(fnt_dialogo);
	
	//Aumentando o valor do indice se ele for menor do que o tamanho da string final
	if(indice < _txt_tam) indice += _txt_vel;
		
	//Desenhando a caixa de texto
	draw_sprite_ext(spr_caixa_dialogo, 0, 0, 300, _escala, 2, 0, c_white, 1);
	

	draw_text(20, _yy, _txt_atual);
	draw_set_font(-1); 
}























