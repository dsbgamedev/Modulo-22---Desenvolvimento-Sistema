/// @description Iniciando variáveis
// You can write your code in this editor

larg   = 100;
alt    = 100;
margem = 5;

debug_area = function()
{
	//Testando
	var _y = bbox_bottom + margem;
	draw_rectangle(x - larg / 2, _y, x + larg / 2, _y + alt, true);
}

//Area do dialogo
dialogo_area = function()
{
	var _y      = bbox_bottom + margem;
	var _player = collision_rectangle(x - larg / 2, _y, x + larg / 2, _y + alt, obj_player_td, 0, 1);	
	
	image_blend = c_white;	
	//Se o player esta colidindo na área
	if(_player)
	{
		image_blend = c_red;
		//Se eu apertar espaço ou enter
		//O player vai entrar no estado de dialogo
		if(keyboard_check_pressed(vk_space))
		{
			with(_player)
			{
			//Vai par ao estado dialogo
			estado = estado_indo_dialogo;
			}
		}
		if(keyboard_check_pressed(vk_escape))
		{
			//_player.estado = _player.estado_parado;
			_player.estado = _player.estado_parado;
		}
	}
	
}

























