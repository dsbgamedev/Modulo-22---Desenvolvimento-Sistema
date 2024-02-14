/// @description Insert description here
// You can write your code in this editor

dialogo = noone;
indice  = 1;
pag     = 0;

cria_dialogo = function(_dialogo)
{
	//Desenhando o meu texto
	static _gui_w   = display_get_gui_width();
	static _gui_h	= display_get_gui_height();
	static _spr_w   = sprite_get_width(spr_caixa_dialogo);
	static _spr_h   = sprite_get_height(spr_caixa_dialogo);
	
	//Definindo o estilo da fonte
	draw_set_font(fnt_dialogo);
	
	//Convertendo e escala da sprite da caixa de texto de pixel para escala(porcentagem)
	var _escala_x = _gui_w / _spr_w;//vai retornar o tamanho da escala dele
	var _escala_y = (_gui_h * .3) / _spr_h;	
	
	var _txt		= _dialogo.texto[pag];
	var _txt_atual  = string_copy(_txt, 1, indice);
	var _txt_tam    = string_length(_txt);//verifica o tamanho da letra
	var _txt_vel    = _dialogo.txt_vel;
	var _yy			= _gui_h - (_escala_y * _spr_h);
	var _margem     = string_height("I");
	var _retrato    = _dialogo.retrato[pag];
	var _ret_escala = (_gui_h * .2) / sprite_get_height(_retrato);	
	var _ret_y      = _yy + ((sprite_get_height(_retrato) * _ret_escala) / 4);
	var _ret_larg   = _ret_escala * sprite_get_width(_retrato);
	var _qtd_pag    = array_length(_dialogo.texto) - 1;
	
	//Sempre que eu apertar espaço, eu pulo de pagina
	if(keyboard_check_pressed(vk_space) && indice >= _txt_tam && pag < _qtd_pag)
	{
			 pag++;
			 indice = 0;
	}
	
	//Aumentando o valor do indice se ele for menor do que o tamanho da string final
	if(indice < _txt_tam) indice += _txt_vel;
	
	//indo para o final do texto ao apertar ESPAÇO
	if(keyboard_check_pressed(vk_space))
	{
		indice = _txt_tam;
		
	}
		
	//Desenhando a caixa de texto
	draw_sprite_ext(spr_caixa_dialogo, 0, 0, _yy, _escala_x, _escala_y, 0, c_white, 1);
	
	//Desenhando o retrato
	draw_sprite_ext(_retrato, 0, _margem, _ret_y, _ret_escala, _ret_escala, 0, c_white, 1);
	
	draw_text_ext(_margem * 2 + _ret_larg, _yy + _margem, _txt_atual, _margem, _gui_w - _margem * 2 - _ret_larg);
	draw_set_font(-1); 
}























