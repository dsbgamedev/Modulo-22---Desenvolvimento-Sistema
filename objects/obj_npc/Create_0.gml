/// @description Iniciando variáveis
// You can write your code in this editor

//Criando a base do meu diálogo
dialogo = 
{
	texto	: ["Testando 12345kkkk kksdsdssk 333444gtd s4weer wetfdfdfsdfd sfsdfsdfsdf dsfsdfsdfsd fsdfsdfsdfs dfsdfdsf sdfsdfsdf sdfsd fsdfsdfsdf c1233212 313132132 1321321321 321311331 313131313131", "denovo o texto segue"],
    retrato : [spr_retrato_npc, spr_retrato_player],
	txt_vel : .3
}

larg   = 30;
alt    = 20;
margem = 5;

debug_area = function()
{
	//Testando
	var _y = bbox_bottom +  margem;
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
				if(_player.estado != estado_dialogo)
				{
					//Vai par ao estado dialogo
					estado = estado_indo_dialogo;
				
					//Passando quem é o npc desse dialogo
					npc_dialogo = other.id;
				}
			}
		}
		if(keyboard_check_pressed(vk_escape))
		{
			_player.estado = _player.estado_parado;
		}
	}
	
}

























