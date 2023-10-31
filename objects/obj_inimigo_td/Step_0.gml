/// @description Insert description here
// You can write your code in this editor

//Checando se eu estou com mouse encima do inimigo
var _mouse_sobre = position_meeting(mouse_x, mouse_y, id);

//Checando se clicaram com o botao do meio
var _click = mouse_check_button_released(mb_middle);

//Se a pessoa clicou enqaunto o mouse estava sobre mim
//Ou seja, clicou em mim
//Ele muda meu estado
if(_mouse_sobre && _click)
{
	estado = get_string ("Digite o estado", "parado");
}
















